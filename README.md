# Python Security Log Analyzer

## Objective

Parse a synthetic security log, summarize event severity, extract source IP addresses, and flag simple suspicious patterns for analyst review.

This project demonstrates how Python can support SOC workflows by reducing repetitive parsing and producing investigation-ready summaries.

## Features

- Reads line-oriented security events
- Counts events by severity
- Extracts IPv4 addresses
- Highlights repeated failed-login events
- Produces a compact analyst summary

## Run

```bash
python src/log_analyzer.py data/sample_security.log
```

## Next Improvements

- JSON/CSV input support
- GeoIP enrichment using approved data sources
- MITRE ATT&CK tagging
- Sigma-rule integration
- SIEM API ingestion
- Unit tests
