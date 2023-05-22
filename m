Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1409346ejb;
        Mon, 22 May 2023 12:13:13 -0700 (PDT)
X-Received: by 2002:a05:6512:11e2:b0:4f3:845e:f9e with SMTP id p2-20020a05651211e200b004f3845e0f9emr3030142lfs.13.1684782793070;
        Mon, 22 May 2023 12:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684782793; cv=none;
        d=google.com; s=arc-20160816;
        b=cjNkZ7CncLld/n5kbHKYMvqS4Ozv7oJg8QzBriixGc1IQOwPz+lMi7OQ5sHAejHk/S
         xAjfapKqPe/6OGm9UxjEL8DMLv8MPwKM9MTOcwAIn0YJnmw4AyLWYEg1w9df6rxw+jVq
         59KK/9HCBfO4N/Wmi50BmXKcT4XUMEHwj08jfDUzyd5OxGpN0oMAzRReIQKSBN6VWAtr
         dvOv4Ajp1TkGDBvxmR23DXdw3AHvgXocpiZZFSkfJu1F5YxAmCIv9v1WlkTua31V6Byp
         Xt3ks2KKZ9KSKTehUATwieOcTYOfL0mfLxB/bqOpYvm17CnYtqHd6NQ8chf4b+Emi+d4
         dncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=nKgUiUzzPXQ1tuCogr7I/mtRpKX/s6KhmaB88kM8TA0=;
        b=nbGnNKhEw7dq4xgJqshCV8lTUHS4wDzJH9a9ZuGgjTFTxHXBK6qnKOPPcSHTQAloX0
         LoqglvKbOeMpano5EkhAHB+A1u1KCgHJQFalEDld4n1+vnyl0a1W5wCDUNJDyUhPaKoq
         eAhW28mWwSIH8iOW6QEeZpTSjbESbTj4j2UbFGDA4R2GpGSMdWu/isSg3SBish/0g/Uf
         fUT0veFSa9MpCOtvMCFZXVxPYhhdL7ILdokWPuTFgHrqT/01b4brrI3wkGe9fxeZhgnL
         HuA7zERwYiqAKPaxPyT04Bt3L6+zL/yaQ711bnPB896JiNhto6pEtRv2EbZ+s5uUWKqF
         +Sbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=Gp6sLXbq;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <frasse.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e1-20020a196741000000b004f11f6bf9dasor1288480lfj.0.2023.05.22.12.13.12
        (Google Transport Security);
        Mon, 22 May 2023 12:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=Gp6sLXbq;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684782792; x=1687374792;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nKgUiUzzPXQ1tuCogr7I/mtRpKX/s6KhmaB88kM8TA0=;
        b=Gp6sLXbqRbYhOk5okVAboNBk8S4IstWTKwehNnal3rfs77XXrIRlCzvNBnKu8iKOXv
         eSIS5P/wWJMw8q1gMt6azs6NIOnL0+Oce0ufmZ3+ukI82diHGnAUnzFWiDhHPkmZHvc0
         gR6aXyQjnQgCGv6eFSrkfMwxePbOa7daCIDg5nM17GYm+Wro/0XtWNtmo+U4xJ2rf41W
         eDkl30QxDeaKWVwgSTqAndmtFewfkyy/EtBm1dCaGCu9Pvz6axcmuU4WKMiu0Q+G4NZM
         Eq4sqOVSptvqqkLqFfDIzoRT2mlaJbH9hLmYkdOull/IUGULnWhbpBoblxrHCXF0OY+T
         ipoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684782792; x=1687374792;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKgUiUzzPXQ1tuCogr7I/mtRpKX/s6KhmaB88kM8TA0=;
        b=iSo7V83Wphnu2n0dwRUw+F/Ho0daQ+BnZmCvkDR/FFk4N1Zc7VPx780Kg4fnYNlAfi
         zCyS+QRWCjAXB94rkkltptFJkcGGKKnC/oUTOOc7rZNbKOeCF3PpE0xMnsmF4TZLzlGX
         g3UwfEONPSPHAwFXIjOTa0CRuooHwPGOIXludWPZ8JFeat1pbg3r5D3h8I7wmC8gpwLt
         vg/g1lD+3qGpnk2n0+CLfzt5zJIl/OPuSSl6ZW59Xz6iW5+80Jz2z3x70MA36xKekKrb
         JYYPnwJPvSzigPwYWJXlZrgoiKJglsC2Sh9YgRveAX0Rw3nhikvn96ta+SupG+ALX0Jf
         E8pQ==
X-Gm-Message-State: AC+VfDz9jLz6baOaqIUc/lO3RUoA8vNpEfeuQLIdV7dQ8X5asMkLlg3l
	qKzS2yXLZWrN6VJaN61P+ITsIzPblZI=
X-Google-Smtp-Source: ACHHUZ6B+fmB57n+i0JWWVsNPGjA1igCoK6K6k1CVkc9dGbLuL7rujp5Acql5fKqjsPrOyuSn2Ou/w==
X-Received: by 2002:ac2:5991:0:b0:4f3:a0f0:7c4a with SMTP id w17-20020ac25991000000b004f3a0f07c4amr3781811lfn.40.1684782791802;
        Mon, 22 May 2023 12:13:11 -0700 (PDT)
Return-Path: <frasse.iglesias@gmail.com>
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
        by smtp.gmail.com with ESMTPSA id j2-20020a19f502000000b004eff530efe7sm1078916lfb.93.2023.05.22.12.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 12:13:11 -0700 (PDT)
Date: Mon, 22 May 2023 21:13:10 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/12] util/fifo8: Allow fifo8_pop_buf() to not populate
 popped length
Message-ID: <20230522191309.GE6984@fralle-msi>
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522153144.30610-3-philmd@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: /qF+2cVBjDfj

On [2023 May 22] Mon 17:31:34, Philippe Mathieu-Daudé wrote:
> There might be cases where we know the number of bytes we can
> pop from the FIFO, or we simply don't care how many bytes is
> returned. Allow fifo8_pop_buf() to take a NULL numptr.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>


> ---
>  include/qemu/fifo8.h | 10 +++++-----
>  util/fifo8.c         | 12 ++++++++----
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index 16be02f361..d0d02bc73d 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -71,7 +71,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>   * fifo8_pop_buf:
>   * @fifo: FIFO to pop from
>   * @max: maximum number of bytes to pop
> - * @num: actual number of returned bytes
> + * @numptr: pointer filled with number of bytes returned (can be NULL)
>   *
>   * Pop a number of elements from the FIFO up to a maximum of max. The buffer
>   * containing the popped data is returned. This buffer points directly into
> @@ -82,16 +82,16 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>   * around in the ring buffer; in this case only a contiguous part of the data
>   * is returned.
>   *
> - * The number of valid bytes returned is populated in *num; will always return
> - * at least 1 byte. max must not be 0 or greater than the number of bytes in
> - * the FIFO.
> + * The number of valid bytes returned is populated in *numptr; will always
> + * return at least 1 byte. max must not be 0 or greater than the number of
> + * bytes in the FIFO.
>   *
>   * Clients are responsible for checking the availability of requested data
>   * using fifo8_num_used().
>   *
>   * Returns: A pointer to popped data.
>   */
> -const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num);
> +const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>  
>  /**
>   * fifo8_reset:
> diff --git a/util/fifo8.c b/util/fifo8.c
> index d4d1c135e0..032e985440 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -66,16 +66,20 @@ uint8_t fifo8_pop(Fifo8 *fifo)
>      return ret;
>  }
>  
> -const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
> +const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
>  {
>      uint8_t *ret;
> +    uint32_t num;
>  
>      assert(max > 0 && max <= fifo->num);
> -    *num = MIN(fifo->capacity - fifo->head, max);
> +    num = MIN(fifo->capacity - fifo->head, max);
>      ret = &fifo->data[fifo->head];
> -    fifo->head += *num;
> +    fifo->head += num;
>      fifo->head %= fifo->capacity;
> -    fifo->num -= *num;
> +    fifo->num -= num;
> +    if (numptr) {
> +        *numptr = num;
> +    }
>      return ret;
>  }
>  
> -- 
> 2.38.1
> 
> 
