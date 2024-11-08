% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textstat_embedding.R
\name{textstat_embedding}
\alias{textstat_embedding}
\alias{embed_docs}
\title{Get Text Embeddings by Averaging Word Embeddings}
\usage{
textstat_embedding(dfm, model)

embed_docs(data, text_col, model, id_col = NULL, ..., .keep_all = FALSE)
}
\arguments{
\item{dfm}{a quanteda dfm}

\item{model}{an embeddings object made by \code{load_embeddings()} or \code{as.embeddings()}. For \code{embed_docs()}, \code{model} can alternatively be a function that takes a character vector and outputs a dataframe with a row for each element of the input}

\item{data}{a data frame or data frame extension (e.g. a tibble)}

\item{text_col}{string. a column of texts for which to compute embeddings}

\item{id_col}{optional string. column of unique document ids}

\item{...}{additional parameters to pass to \code{quanteda::tokens()} or to the user-specified modeling function}

\item{.keep_all}{logical. Keep all columns from input?}
}
\description{
\code{textstat_embedding()} takes a 'quanteda' dfm. \code{embed_docs()} is a more
versatile function for use in a purely dplyr-style workflow, which acts directly
on a column of texts.
}
\section{Value}{

A tibble with columns \code{doc_id}, and \code{V1}, \code{V2}, etc. or similar. If \code{.keep_all = TRUE}, the new columns will appear after existing ones.
}

\examples{
# quanteda workflow
library(quanteda)
texts <- c("this says one thing", "and this says another")
texts_dfm <- dfm(tokens(texts))

texts_embeddings <- textstat_embedding(texts_dfm, glove_twitter_25d)
texts_embeddings

# dplyr workflow
texts_df <- data.frame(text = texts)
texts_embeddings <- texts_df |> embed_docs("text", glove_twitter_25d)
texts_embeddings
}
