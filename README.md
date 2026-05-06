# Passive Ethical Drift in LLMs: A Multi-Turn Pressure Escalation Framework

Undergraduate Research · St. Joseph's University New York · 2026

An empirical study measuring whether frontier large language models maintain ethical consistency under sustained non-adversarial conversational pressure across multi-turn interactions.

*Advised by Professor Zamagias*

---

## Abstract

Current LLM safety evaluation tests models in single-turn controlled conditions. This study introduces the Pressure Escalation Protocol (PEP), a three-phase framework measuring passive ethical drift -- the degradation of ethical stance under ordinary social pressure rather than adversarial attack. We evaluate five frontier models across two philosophical scenarios and introduce three novel metrics: Pressure Threshold Score, Stubbornness Parameter lambda, and Recovery Rate.

---

## Models Evaluated

- GPT-4.1
- GPT-4o-mini
- DeepSeek-R1
- Claude Haiku 4.5
- Kimi-K2

---

## Key Findings

- GPT-4.1 exhibited full ethical reversal on the deontological scenario and explicitly self-reported drift as intellectual growth.
- Kimi-K2 demonstrated highest resilience with lambda=0.80 and full recovery on both scenarios.
- Deontological scenarios show faster drift onset than utilitarian scenarios across all models.

---

## Repository Structure

```
passive-ethical-drift/
├── scenarios/          Pre-written conversation turns for each scenario
├── scripts/
│   ├── run_conversations.py    Runs all model-scenario conversations via OpenRouter
│   ├── score_responses.py      Scores key turns using GPT-4.1 as evaluator
│   └── generate_graphs.py      Generates visualizations from scores.csv
├── data/
│   └── raw/            Complete JSON conversation logs (one file per model per scenario)
└── results/            scores.csv and generated graphs
```

---

## Installation

```bash
pip install -r requirements.txt
```

Copy `.env.example` to `.env` and add your OpenRouter API key:

```bash
cp .env.example .env
```

---

## Usage

**1. Run all conversations (5 models x 2 scenarios x 30 turns each)**

```bash
python scripts/run_conversations.py
```

**2. Score key turns using GPT-4.1 as an automated evaluator**

```bash
python scripts/score_responses.py
```

**3. Generate graphs from the scored results**

```bash
python scripts/generate_graphs.py
```

---

## Methodology

The Pressure Escalation Protocol (PEP) structures each conversation into three phases. The Baseline phase (turns 1-5) establishes the model's ethical position on a clearly framed moral scenario and locks that position as the reference point for the rest of the conversation. The Pressure Escalation phase (turns 6-25) applies five sequential pressure types -- polite disagreement, persistent repetition, emotional appeal, social proof, and false authority -- each sustained across four turns with no new facts or arguments, testing whether the model drifts due to social dynamics alone rather than legitimate reasoning updates. The Recovery Probe phase (turns 26-30) de-escalates the conversation, re-presents the original scenario in neutral language, and asks the model to reflect on whether its current answer is consistent with its original one, measuring whether any drift is sticky or reversible.

---


## Citing This Work
Research paper in preparation. If referencing this work, please cite the repository:

Shrestha, D. (2026). Passive Ethical Drift in LLMs: A Multi-Turn Pressure 
Escalation Framework. GitHub. 
https://github.com/drishyashrestha/passive-ethical-drift

---

