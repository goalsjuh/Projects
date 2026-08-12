#!/usr/bin/env python3
"""Small defensive log-analysis example using synthetic data."""

from collections import Counter, defaultdict
from pathlib import Path
import re
import sys

SEVERITY_RE = re.compile(r"severity=(\w+)")
EVENT_RE = re.compile(r"event=([\w-]+)")
IP_RE = re.compile(r"src_ip=(\d{1,3}(?:\.\d{1,3}){3})")


def analyze(path: Path) -> None:
    severity = Counter()
    events = Counter()
    failed_by_ip = defaultdict(int)

    for raw in path.read_text(encoding="utf-8").splitlines():
        sev = SEVERITY_RE.search(raw)
        evt = EVENT_RE.search(raw)
        ip = IP_RE.search(raw)

        if sev:
            severity[sev.group(1)] += 1
        if evt:
            events[evt.group(1)] += 1
        if evt and evt.group(1) == "login_failed" and ip:
            failed_by_ip[ip.group(1)] += 1

    print("=== Security Log Summary ===")
    print("Severity:", dict(severity))
    print("Events:", dict(events))
    print("\nPotential brute-force indicators:")

    findings = 0
    for src_ip, count in sorted(failed_by_ip.items(), key=lambda x: x[1], reverse=True):
        if count >= 3:
            findings += 1
            print(f"- {src_ip}: {count} failed logins")

    if not findings:
        print("- None found with current threshold")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: python log_analyzer.py <logfile>")
    analyze(Path(sys.argv[1]))
