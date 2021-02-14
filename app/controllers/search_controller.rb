class SearchController < ApplicationController
  def search
    @users = User.all
    @books = Book.all
    @model = params[:search][:model]
    @key_word = params[:search][:key_word]
    @how = params[:search][:how]
    @data = search_for(@model, @key_word, @how)
  end

  private

  def match(model, key_word)
    if model == "User"
      User.where("name LIKE ? OR introduction LIKE ?", key_word, key_word)
    elsif model == "Book"
      Book.where("title OR body", key_word, key_word)
    end
  end

  def forword(model, key_word)
    if model == "User"
      User.where("name LIKE ? OR introduction LIKE ?", "#{key_word}%", "#{key_word}%")
    elsif model == "Book"
      Book.where("title LIKE ? OR body LIKE ?", "#{key_word}%", "#{key_word}%")
    end
  end

  def backword(model, key_word)
    if model == "User"
      User.where("name LIKE ? OR introduction LIKE ?", "%#{key_word}", "%#{key_word}")
    elsif model == "Book"
      Book.where("title LIKE ? OR body LIKE ?", "%#{key_word}", "%#{key_word}")
    end
  end

  def partial(model, key_word)
    if model == "User"
      User.where("name LIKE ? OR introduction LIKE ?", "%#{key_word}%", "%#{key_word}%")
    elsif model == "Book"
      Book.where("title LIKE ? OR body LIKE ?", "%#{key_word}%", "%#{key_word}%")
    end
  end

  def search_for(model, key_word, how)
    case how
      when "完全一致"
        match(model, key_word)
      when "前方一致"
        forword(model, key_word)
      when "後方一致"
        backword(model, key_word)
      when "部分一致"
        partial(model, key_word)
    end
  end
end
