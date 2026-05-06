import os
from pathlib import Path
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv(Path(__file__).parent.parent / ".env")

api_key = os.getenv("OPENROUTER_API_KEY")
if not api_key:
    raise RuntimeError("OPENROUTER_API_KEY not found in .env")

client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=api_key,
)

resp = client.chat.completions.create(
    model="openai/gpt-4o-mini",
    messages=[{"role": "user", "content": "Say hello"}],
    temperature=0,
)

print(resp.choices[0].message.content)
