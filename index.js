function main() {
  renderColumns();
}
main();

async function renderColumns() {
  const columns = await fetchColumns();

  let columnsHtml = '';
  for (let i in columns) {
    columnsHtml += `<a class="column-item" href="${columns[i].uri}" target="_blank">
            <img class="column-img" src="${columns[i].thumbnail}" />
            <p class="column-title">${columns[i].title}</p>
        </a>`;
  }

  const columnWrapEl = document.querySelector('.column-wrap');
  columnWrapEl.innerHTML = columnsHtml;
}

async function clearColumns() {
  const columnWrapEl = document.querySelector('.column-wrap');
  columnWrapEl.innerHTML = '';
}

async function fetchColumns() {
  const r = await fetch('http://127.0.0.1:3000/api/column', {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      page: 1,
    }),
  });

  const result = await r.json();
  return result.items.map((v) => ({
    uri: `https://m.blog.naver.com/PostView.naver?blogId=loviscus4&navType=by&logNo=${v.logNo}`,
    title: v.titleWithInspectMessage,
    thumbnail: `${v.thumbnailUrl}?type=ffn640_640`,
    content: v.briefContents,
    date: v.addDate,
  }));
}