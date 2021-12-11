class TestsController < ApplicationController
  def edit
    @test = Test.new
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(name: params[:name])
      render plain: [@test.inspect]
    else
      render plain: @test.errors.full_messages
    end
  end
end
