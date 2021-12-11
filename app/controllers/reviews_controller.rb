class ReviewsController < ApplicationController
  include ActionView::RecordIdentifier # Модуль для использования меотода dom_id

  before_action :specific_district, except: :welcome
  before_action :specific_review, only: %i[destroy edit update]

  def welcome; end

  # Создает params на основе моделей указанных в методе. Данные берутся из инпутов формы
  def new
    @review = @district.reviews.build
    review_all_and_paginated
  end

  # Создает новый ответ
  def create
    @review = @district.reviews.build set_params
    review_all_and_paginated
    if @review.save
      flash[:success] = 'Вы создали новый комментарий!'
      redirect_new
    else
      render :new
    end
  end

  # Удаляет комментарий
  def destroy
    if @review.destroy
      flash[:danger] = 'Вы удалили комментарий!'
      redirect_new
    else
      render plain: :new
    end
  end

  # Создает params на основе моделей указанных в методе. Данные берутся из инпутов формы
  def edit; end

  # Изменяет комментарий
  def update
    if @review.update set_params
      flash[:warning] = 'Вы изменили комментарий!'
      redirect_to new_district_review_path(@district, anchor: dom_id(@review))
    else
      render :edit
    end
  end

  private

  # Выводит поля name и body из хэша params
  def set_params
    params.require(:review).permit(:name, :body)
  end

  # Возвращает конкретный район из таблицы districts
  def specific_district
    @district = District.find params[:district_id]
  end

  # Возвращает конкретный ответ из таблицы reviews
  def specific_review
    @review = Review.find params[:id]
  end

  # Возврящает все ответы конкретного района
  def review_all_and_paginated
    @reviews = Review.where(district_id: params[:district_id]).page(params[:page]).per(5)
  end

  # Перенаправляет на страницу с комментариями и формой
  def redirect_new
    redirect_to new_district_review_path(@district)
  end
end
