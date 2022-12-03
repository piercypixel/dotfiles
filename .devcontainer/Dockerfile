FROM ubuntu:18.04

WORKDIR /home/

COPY . .

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg2 \
    jq \
    sudo \
    zsh

# persist shell history
RUN mkdir /commandhistory && touch /commandhistory/.zsh_history

RUN echo "export PROMPT_COMMAND='history -a'" >> "$HOME/.zshrc"
RUN echo "export HISTFILE=/commandhistory/.zsh_history" >> "$HOME/.zshrc"
