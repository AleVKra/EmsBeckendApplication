<#import "blocks/template.ftlh" as t>
<@t.template user>
	<h1 style="text-align: center">Мои товары</h1>
	<hr>
	<a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
	   data-toggle="collapse" href="#collapseExample" role="button"
	   aria-expanded="true" aria-controls="collapseExample">
		Добавить новый товар
	</a>
	<div class="collapse mb-3" id="collapseExample" style="">
		<form action="/item/create" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="productName">Название товара</label>
				<input type="text" required class="form-control"
					   id="productName" name="title">
			</div>
			<div class="form-group">
				<label for="price">Цена товара</label>
				<div class="input-group mb-3">
					<input type="number" required class="form-control" id="price" name="price">
					<div class="input-group-append">
						<span class="input-group-text">₽</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="searchCity">Город</label>
				<select id="searchCity" required name="city" class="form-control">
					<option value="">Город не выбран</option>

					<option value="Москва">Москва</option>
					<option value="Красноярск">Красноярск</option>
					<option value="Казань">Казань</option>

				</select>
			</div>
			<div class="form-group">
				<label for="description">Описание товара</label>
				<textarea required class="form-control" id="description" name="description"></textarea>
			</div>
			<div class="form-group">
				<div class="custom-file">
					<input required type="file" name="file1" id="file1">
					<label class="custom-file-label" for="file1">Первая фотография к товару</label>
				</div>
			</div>
			<div class="form-group">
				<div class="custom-file">
					<input type="file" name="file2" id="file2">
					<label class="custom-file-label" for="file2">Вторая фотография к товару</label>
				</div>
			</div>
			<div class="form-group">
				<div class="custom-file">
					<input type="file" name="file3" id="file3">
					<label class="custom-file-label" for="file3">Третья фотография к товару</label>
				</div>
			</div>
			<input type="hidden" name="_csrf" value="${_csrf.token}"/>

			<button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
		</form>
	</div>
	<div class="card-columns">
		<#list items as item>
			<a href="/item/${item.id}" class="item-link">
				<div class="card text-white bg-dark my-3 item">
					<div class="card-top">
						<form action="/item/delete/${item.id}" method="post">
							<input type="hidden" name="_csrf" value="${_csrf.token}"/>
							<button type="submit" class="btn btn-danger m-3">
								Удалить
							</button>
						</form>
					</div>
					<img src="/images/${item.previewImageId}"
						 class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${item.title}</h5>
						<p class="card-text">${item.price} ₽</p>
					</div>
					<div class="card-footer">
						${item.city}
					</div>
				</div>
			</a>
		<#else>
			<h1 style="text-align: center">Не найдено</h1>
		</#list>
	</div>
</@t.template>
