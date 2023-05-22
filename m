Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1421163ejb;
        Mon, 22 May 2023 12:38:22 -0700 (PDT)
X-Received: by 2002:a2e:b0ec:0:b0:2af:1db6:8f13 with SMTP id h12-20020a2eb0ec000000b002af1db68f13mr4165994ljl.34.1684784302482;
        Mon, 22 May 2023 12:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684784302; cv=none;
        d=google.com; s=arc-20160816;
        b=fImXmwu6n3vEH5cyeQHvwgN9S77+1+cCZuQUH5VWanxSfGbJ/orjJtR2YENHEgrJOq
         vrDZenyjpjC9ivs4mscTiAqh9I+b5ME/yK16cYmSSRYgQYn6PWeZpzQVidpGAN2u3iK1
         eM+j6jjIxrkYKQG90eJT/nNq9R4KCW7MOv8JwOVY0a+eUZgTJDJaq/HtBEw2gkTIid8F
         9aTofaW4ZgBB4KAapwUtglZ43t4jMJDHlYjXr+ZU3ud3U/yzbwehRp585WeH34TquEKp
         bM91BXAmUrZ3DHdHddLEI+qZYsMBIU39uiZQrLHnvS5lDIoEdD3Y8GuYsM+pTsOfkDXD
         Avfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=oRMYDtMICSn5nsPyWp0UzpotVYQAEshwHkg9F8gB2eA=;
        b=fkxG8V9pNp6xaVwmnYMy3hREDKv1JONvwkuKp2EKdSA7IL8GYMLe+RDskQOua4afjS
         CsoHOkivnhkNoqUl/VmpaGLbRJ0SoRwOfOUNqMs0oBIb0TJc98QES0wBsk6AhIL7sgvh
         P6UDgivEv/SQooFkUcnXaPt7D0YRUbm0Yv5SosDB+tPhmsr3F99pNg/P4uaNHtzrhkkN
         E9hhKvKhU4sJNzWh9VwSMkvRGpqHDfReExl8kxmYPNrQjEm5QgxoBizYAbRlKbAcSVEJ
         8l2v5jGH62ivR9M2KbH4vEfDEZrBvHwHSQ6SVDNh7uxwKTOsuYwGtZFHtrs2MVK5frwg
         P7Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=YheHZEcW;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <frasse.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z24-20020a196518000000b004edc4ea3d5fsor1305613lfb.19.2023.05.22.12.38.22
        (Google Transport Security);
        Mon, 22 May 2023 12:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=YheHZEcW;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684784301; x=1687376301;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRMYDtMICSn5nsPyWp0UzpotVYQAEshwHkg9F8gB2eA=;
        b=YheHZEcWW9S1Z9Saj1LQ0e/3FE8CzSTA4nhjvODkq2YivyqF1OTxKOkgwk27ZVLbZR
         rrl2JoORmNTSt4+sczh/eIf4MGkb49lloDwkIwnLCxQQLmmO3dhVLfhWD9BsIbPgVsiQ
         P7XCX4V1eWDiGP7S3lKj3WOETSFeHZXKKlR4k6/a6dg96eM5tt8rNIQdNJ+Q7X0Xzv13
         JhHbn9c7Jeq1kqvhMN4OqnfPCxf387gn4yuLnTDivKhyTSp6sgjHoDnpEPvFn8ny/pZe
         VwzCuzMVk5yz1FDLeGPp2Ec1Dqu51rGfX/xhnlQ9vrWKim0yn8jIXn4eOY/TpWPJp/Qm
         0xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684784301; x=1687376301;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRMYDtMICSn5nsPyWp0UzpotVYQAEshwHkg9F8gB2eA=;
        b=FziZlRMIK81zm/WizPz85W5Lro34/NyP/SCX8VvP82qjPl15MmhPZGdQ8SnOegC/tS
         l6UcStddhizmJmbQlk/f2VUek8os3nkDWmiwUhMZp8yZsGj3DQ/z3YcXceDTsUYJa00j
         HLzdUoCaIPEiwaUbVFDxC4xN9t0nfL2P6c29lzpFd3+B8LaV23rQsWm2Q+edJ6pqYaKo
         8U2J2UC0sTPBxGfnrTF8v2WBZBFEUWq8MxVzvXS7btiq42xgEzVvo+Xt+Gq59pDy1C0V
         1fJz4xyFrb70nuMzYJE2WsCMv85Rgu6CzG+/N2sgxMmzE+TmcPTOigrhH/ws/TXkJ/xv
         BFdw==
X-Gm-Message-State: AC+VfDzVFMgg27cqbgSnHBtTyJxbMyLdK8Rltg6A8l6Gg2BGaJ3hEkqH
	iO4PYjKKTOnBdKuNIIH/sIsAIdHeI0U=
X-Google-Smtp-Source: ACHHUZ7W1XQ85Yp6SFo9ZUEnWH1fffn4Q42jPnsGKo3cTAfdPatJcR7vnkKWhH5UvuxKmkAPqZ4dpg==
X-Received: by 2002:a2e:9588:0:b0:2ad:aa42:8c0b with SMTP id w8-20020a2e9588000000b002adaa428c0bmr4355501ljh.35.1684784301293;
        Mon, 22 May 2023 12:38:21 -0700 (PDT)
Return-Path: <frasse.iglesias@gmail.com>
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
        by smtp.gmail.com with ESMTPSA id a19-20020a2e9813000000b002a7746800d0sm1260991ljj.130.2023.05.22.12.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 12:38:20 -0700 (PDT)
Date: Mon, 22 May 2023 21:38:19 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/12] util/fifo8: Introduce fifo8_peek_buf()
Message-ID: <20230522193818.GF6984@fralle-msi>
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522153144.30610-4-philmd@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: WNxi0K0Uowv7

On [2023 May 22] Mon 17:31:35, Philippe Mathieu-Daudé wrote:
> To be able to poke at FIFO content without popping it,
> introduce the fifo8_peek_buf() method by factoring
> common content from fifo8_pop_buf().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/qemu/fifo8.h | 26 ++++++++++++++++++++++++++
>  util/fifo8.c         | 22 ++++++++++++++++++----
>  2 files changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index d0d02bc73d..7acf6d1347 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -93,6 +93,32 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>   */
>  const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>  
> +/**
> + * fifo8_peek_buf:
> + * @fifo: FIFO to poke from
> + * @max: maximum number of bytes to pop
> + * @numptr: pointer filled with number of bytes returned (can be NULL)
> + *
> + * Pop a number of elements from the FIFO up to a maximum of max. The buffer

s/Pop/Peek into/

> + * containing the popped data is returned. This buffer points directly into

s/popped data/data peeked into/

If above sounds good:

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>


> + * the FIFO backing store and data is invalidated once any of the fifo8_* APIs
> + * are called on the FIFO.

(Above sounds as if it happens automatically to me but I'm not english native,
a suggestion could be to put something as below "clients are responsible for
tracking this")

> + *
> + * The function may return fewer bytes than requested when the data wraps
> + * around in the ring buffer; in this case only a contiguous part of the data
> + * is returned.
> + *
> + * The number of valid bytes returned is populated in *numptr; will always
> + * return at least 1 byte. max must not be 0 or greater than the number of
> + * bytes in the FIFO.
> + *
> + * Clients are responsible for checking the availability of requested data
> + * using fifo8_num_used().
> + *
> + * Returns: A pointer to peekable data.
> + */
> +const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
> +
>  /**
>   * fifo8_reset:
>   * @fifo: FIFO to reset
> diff --git a/util/fifo8.c b/util/fifo8.c
> index 032e985440..e12477843e 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -66,7 +66,8 @@ uint8_t fifo8_pop(Fifo8 *fifo)
>      return ret;
>  }
>  
> -const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
> +static const uint8_t *fifo8_peekpop_buf(Fifo8 *fifo, uint32_t max,
> +                                        uint32_t *numptr, bool do_pop)
>  {
>      uint8_t *ret;
>      uint32_t num;
> @@ -74,15 +75,28 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
>      assert(max > 0 && max <= fifo->num);
>      num = MIN(fifo->capacity - fifo->head, max);
>      ret = &fifo->data[fifo->head];
> -    fifo->head += num;
> -    fifo->head %= fifo->capacity;
> -    fifo->num -= num;
> +
> +    if (do_pop) {
> +        fifo->head += num;
> +        fifo->head %= fifo->capacity;
> +        fifo->num -= num;
> +    }
>      if (numptr) {
>          *numptr = num;
>      }
>      return ret;
>  }
>  
> +const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
> +{
> +    return fifo8_peekpop_buf(fifo, max, numptr, false);
> +}
> +
> +const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
> +{
> +    return fifo8_peekpop_buf(fifo, max, numptr, true);
> +}
> +
>  void fifo8_reset(Fifo8 *fifo)
>  {
>      fifo->num = 0;
> -- 
> 2.38.1
> 
> 
