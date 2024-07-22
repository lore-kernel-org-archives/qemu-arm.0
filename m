Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2146428njc;
        Mon, 22 Jul 2024 14:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6AUJxf7EnzbE2rj2+OoM9+bxbWXZTMkSztSF2jyy+uFZrNyK2sc6tT2g9PvhfMLYwGhetJQui1G6HWGGpuiIG2gJNwOOV
X-Google-Smtp-Source: AGHT+IGS2/p9alehWEpZX8gExzZ6I+DKI9C/eVuWvXHfZvQ08woYQC0hadZCH2VwJ7Rn7ckLkFrY
X-Received: by 2002:a05:600c:4f50:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-427dc52128fmr49545205e9.15.1721683059579;
        Mon, 22 Jul 2024 14:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721683059; cv=none;
        d=google.com; s=arc-20160816;
        b=LRYAKlHSIzJsA8S7SzFDQrb6Pokb32weTjHLZ/nysPNCLKxTnrPYTaWvvmbKB3P8Ys
         sNQV3aE8LDFqGMmk0JgZrElWyzw9mHszpqqhKwf4XIqH2R3HevWyR+uGJbSkCLraGngB
         M0QYdu6xyXYB32vRhQxzNpCmK1wjglTupVlqJm411BCK8PibTeuGnU28G0rvITTSXX8E
         H5j/wu6GL6wHWQTcuGbridUT2nC9joquHh2C9cjRUThleAiTbbgUNCY89SR9VjteSr3x
         yEO7LeMw1o87ME4JrQTaSzgrtUsJwXB7YqkoJ5qN6dmrKqEMEmU0C0VsFt+NV2FwO29a
         ss/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=G3cOVx1v1FKl+lrOFZkxvaflaZX+hMevyZmq6MN1gZg=;
        fh=68S9+Kdsh8o88VoK6xqmpRIkDdLleQOpmgVVrH8ervI=;
        b=rrnNUou34g2pwUnqtRKax17b+1Vk+cVRWVma9C/uWyn7kpou/xiOpfdReTNsJpAE9L
         utm3kqDT4VMB5vx8phgTuBrePFuziegoOP6NjL8myoC60OVOKctZ0zmvztIHRF/sfiem
         Xym02dgWIWdvNw5emSOOH3smlGrm051T26uRbxzR4ATWm1KugFlzhm6o0FYbM9zEBrIX
         Y2LOuTUsbk3FTJ9i/hXR0Z89QboHlg5trtdih0wWwI4gmP5PcakkKCXIeKv/FDPSmdel
         +GTdnh9eOpjJMqcwKjRajMI1ltvg9gvWqXO/g9PFSMT4JERle603lJwGkJ5K8kSL0XNN
         HSAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=dFKgbysB;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-427d2a90fa8si42868735e9.133.2024.07.22.14.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b=dFKgbysB;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=G3cOVx1v1FKl+lrOFZkxvaflaZX+hMevyZmq6MN1gZg=; b=dFKgbysBqelIYYqgEhMxJEEJ4W
	f+vqlbWGfo8Mfq85O0jr7BJTVfsrQXr7qKX8Tfrpd/qRD47fVF2EETbGTaytktiu00EORVu39Ft9c
	zzeG4HUCRvKLz9ahSXN5jV+tTksdjW5MFI5ES2At9XF3vYd5rXRrdsQKOyy6uKqBGjtWqQ5od93kG
	v3b/F5NzAeMO2beaKLWHDdIPAoq1lSBCaTpyzAYq6XtcDPu49/4mbscm+wYmYXwuIaJg5U3Hauehx
	xpr0JKA74ckOOQ1kERvDFBxh3IkrLwNRVIL9RAwEtVOLPH7aLSXTSyy0zMMlQ3uyHgOgU8vcGQvLu
	yhczSLOahQdNu6iGelk5dW5G6WDxp2Sl5mZxSqJviC4rkw4o4ekv2IBUZcmrVi6Mnr7IWhg4qwQtG
	HflvmbP1u/9ccr5BKZV1gpMTI4YUC5f8ngLF9sK5+D6XouvmFtO4zfxWV2Ch7VXinBCfWhpN+eSp5
	QJikmgFLlVu1vg4mRzSZ7/XOtvlkbjljj8LiuUst+/jFqIkSefhw3CVtkADF/sey7ZhHk33Tc5j34
	T/fh9OZjY4Cdh9vltO9+SADJ9qL/t7bsNDMISwnybCku2CV+2Dj4ViweHcDKYjS9v38ZgjDafMbwA
	c9ZJFn9hqxKW4faajuZNcsvbJPWmHPgHPngEcxcIo=;
Received: from [2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1sW0O3-0003KV-IG; Mon, 22 Jul 2024 22:16:07 +0100
Message-ID: <c1f09671-9800-458f-8a0b-7dc93d226e95@ilande.co.uk>
Date: Mon, 22 Jul 2024 22:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-3-philmd@linaro.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20240722160745.67904-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb4:4000:c7ab:2566:bad6:7dfd
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 2/7] util/fifo8: Fix style
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: 6FjhncrPNKNL

On 22/07/2024 17:07, Philippe Mathieu-Daudé wrote:

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/fifo8.h | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index c6295c6ff0..2692d6bfda 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -15,10 +15,9 @@ typedef struct {
>    * @fifo: struct Fifo8 to initialise with new FIFO
>    * @capacity: capacity of the newly created FIFO
>    *
> - * Create a FIFO of the specified size. Clients should call fifo8_destroy()
> + * Create a FIFO of the specified capacity. Clients should call fifo8_destroy()
>    * when finished using the fifo. The FIFO is initially empty.
>    */
> -
>   void fifo8_create(Fifo8 *fifo, uint32_t capacity);
>   
>   /**
> @@ -26,9 +25,8 @@ void fifo8_create(Fifo8 *fifo, uint32_t capacity);
>    * @fifo: FIFO to cleanup
>    *
>    * Cleanup a FIFO created with fifo8_create(). Frees memory created for FIFO
> -  *storage. The FIFO is no longer usable after this has been called.
> + * storage. The FIFO is no longer usable after this has been called.
>    */
> -
>   void fifo8_destroy(Fifo8 *fifo);
>   
>   /**
> @@ -39,7 +37,6 @@ void fifo8_destroy(Fifo8 *fifo);
>    * Push a data byte to the FIFO. Behaviour is undefined if the FIFO is full.
>    * Clients are responsible for checking for fullness using fifo8_is_full().
>    */
> -
>   void fifo8_push(Fifo8 *fifo, uint8_t data);
>   
>   /**
> @@ -52,7 +49,6 @@ void fifo8_push(Fifo8 *fifo, uint8_t data);
>    * Clients are responsible for checking the space left in the FIFO using
>    * fifo8_num_free().
>    */
> -
>   void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
>   
>   /**
> @@ -64,7 +60,6 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num);
>    *
>    * Returns: The popped data byte.
>    */
> -
>   uint8_t fifo8_pop(Fifo8 *fifo);
>   
>   /**
> @@ -73,7 +68,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>    * @max: maximum number of bytes to pop
>    * @numptr: pointer filled with number of bytes returned (can be NULL)
>    *
> - * Pop a number of elements from the FIFO up to a maximum of max. The buffer
> + * Pop a number of elements from the FIFO up to a maximum of @max. The buffer
>    * containing the popped data is returned. This buffer points directly into
>    * the FIFO backing store and data is invalidated once any of the fifo8_* APIs
>    * are called on the FIFO.
> @@ -82,7 +77,7 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>    * around in the ring buffer; in this case only a contiguous part of the data
>    * is returned.
>    *
> - * The number of valid bytes returned is populated in *numptr; will always
> + * The number of valid bytes returned is populated in *@numptr; will always
>    * return at least 1 byte. max must not be 0 or greater than the number of
>    * bytes in the FIFO.
>    *
> @@ -99,7 +94,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>    * @max: maximum number of bytes to peek
>    * @numptr: pointer filled with number of bytes returned (can be NULL)
>    *
> - * Peek into a number of elements from the FIFO up to a maximum of max.
> + * Peek into a number of elements from the FIFO up to a maximum of @max.
>    * The buffer containing the data peeked into is returned. This buffer points
>    * directly into the FIFO backing store. Since data is invalidated once any
>    * of the fifo8_* APIs are called on the FIFO, it is the caller responsibility
> @@ -109,7 +104,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>    * around in the ring buffer; in this case only a contiguous part of the data
>    * is returned.
>    *
> - * The number of valid bytes returned is populated in *numptr; will always
> + * The number of valid bytes returned is populated in *@numptr; will always
>    * return at least 1 byte. max must not be 0 or greater than the number of
>    * bytes in the FIFO.
>    *
> @@ -126,7 +121,6 @@ const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>    *
>    * Reset a FIFO. All data is discarded and the FIFO is emptied.
>    */
> -
>   void fifo8_reset(Fifo8 *fifo);
>   
>   /**
> @@ -137,7 +131,6 @@ void fifo8_reset(Fifo8 *fifo);
>    *
>    * Returns: True if the fifo is empty, false otherwise.
>    */
> -
>   bool fifo8_is_empty(Fifo8 *fifo);
>   
>   /**
> @@ -148,7 +141,6 @@ bool fifo8_is_empty(Fifo8 *fifo);
>    *
>    * Returns: True if the fifo is full, false otherwise.
>    */
> -
>   bool fifo8_is_full(Fifo8 *fifo);
>   
>   /**
> @@ -159,7 +151,6 @@ bool fifo8_is_full(Fifo8 *fifo);
>    *
>    * Returns: Number of free bytes.
>    */
> -
>   uint32_t fifo8_num_free(Fifo8 *fifo);
>   
>   /**
> @@ -170,7 +161,6 @@ uint32_t fifo8_num_free(Fifo8 *fifo);
>    *
>    * Returns: Number of used bytes.
>    */
> -
>   uint32_t fifo8_num_used(Fifo8 *fifo);
>   
>   extern const VMStateDescription vmstate_fifo8;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.
