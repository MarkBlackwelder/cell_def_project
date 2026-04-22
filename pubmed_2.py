from metapub import PubMedFetcher, FindIt

# Search and analyze literature
fetch = PubMedFetcher()
#pmids = fetch.pmids_for_query('machine learning genomics', retmax=10)
pmids = fetch.pmids_for_query('cd8 migration speed', retmax=10)

# Check PDF availability
accessible_papers = []
for pmid in pmids:
    article = fetch.article_by_pmid(pmid)
    src = FindIt(pmid)

    if src.url:
        accessible_papers.append({
            'title': article.title,
            'journal': article.journal,
            'pdf_url': src.url
        })

print(f"Found {len(accessible_papers)} papers with accessible PDFs")

if len(accessible_papers) > 0:
    print(accessible_papers)
