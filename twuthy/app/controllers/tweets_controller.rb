class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.xml
  def index
    @tweets = Tweet.all

    @tweets.each do | tweet |
      if tweet.goodvotes + tweet.badvotes == 0
        tweet.twuthiness = 0
      else
        tweet.twuthiness = (tweet.goodvotes / (tweet.goodvotes.to_f + tweet.badvotes))*100
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweets }
    end
  end

  # GET /tweets/1
  # GET /tweets/1.xml
  def show
    @tweet = Tweet.find(params[:id])

    if @tweet.goodvotes + @tweet.badvotes == 0
       @tweet.twuthiness = 0
    else
       @tweet.twuthiness = (@tweet.goodvotes / (@tweet.goodvotes.to_f + @tweet.badvotes))*100
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.xml
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.xml
  def create
    @tweet = Tweet.new(params[:tweet])
    @tweet.goodvotes = 0
    @tweet.badvotes = 0

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to(@tweet, :notice => 'Tweet was successfully created.') }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.xml
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to(@tweet, :notice => 'Tweet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.xml
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end

  def upvote
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.goodvotes = @tweet.goodvotes + 1
    @tweet.save
    redirect_to :root
  end

  def downvote
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.badvotes = @tweet.badvotes + 1
    @tweet.save
    redirect_to :root
  end



end


