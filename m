Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2009065njc;
        Mon, 22 Jul 2024 09:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPZ4KV/LaRqv6qVVKkS9ntCiPnLGpKHBzPMiz2CUkOl8LnFtQuR7D9EzDTvnrgtBQ+ohem+PhN6cpyD5E28zgOFlsH6PJd
X-Received: by 2002:a17:907:da1:b0:a77:cf9d:f497 with SMTP id a640c23a62f3a-a7a87cbcc51mr30665666b.40.1721664756819;
        Mon, 22 Jul 2024 09:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664756; cv=none;
        d=google.com; s=arc-20160816;
        b=XSB0bDqD3Twx44zKUMix4ZMIeTbBtSXgBmu3h6mufj6Wyn5hDpNyJZ5Q8rM59GdZZa
         wF3FXoG4jnsDTuebumx+sHzl4miX7OVq4JD9ejZpG6OQR7k0s38vq5tZJHNRo5Ans8HZ
         dwpwN08c1LOgAVzDk8aUAcbVCubxa7d9Eqa1Rn3ioN7SydKbtAE8TlawcGmYopKfeDDA
         19VPCul3ieNKlwc7URPuaKBALlQd4nhCh2WuuoGTtLpaHGCX5D2GQA/KN64+Z38kC080
         QFFbaeD439DYjXYh8iTsHny+byEiBdAJAiliS18kNuL0bvGb3wiQFgILLfHSNxWzy2yA
         0bDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oUnEZQeXXlZXeNXnnbVEIVnP0pQsNfyfJir/+RcM/Qk=;
        fh=N8lCymRsxtzOLLsGYfpORxqR6PXKOYr0JTCCw1uKgSY=;
        b=OOaMp7/TaBNa2jnK3VtjnyUC9zeFlriyxneGOWjHTq0vH1c452EkUe2zKCcP7yUKC6
         elfFoA7Rqs3W4mx/eLXOpdO+y9vrEMCjxV34KR0i8CPAGc/If0b/1Sz3LjVCDZjfjCD/
         +ldFnPz1w4ZtxMCaqpm6hFp01AWPY+CVVJtujv3gASqMgO3od/MfadhbEG8z1zC85F5g
         k5e+eQR8emaqVoxnQNqSEXcDDcg7s/hexxURR5Okd2lW7/JhGZyEEWstmVFT91EDTq+2
         7W6xGjpHVe0qo6vU7bG+SkREE3LOtGiT+7jUSbirT96RMF3MJGy4wEsO/eou5NKrJ5+v
         7CAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qt7K6TUk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a7a4e45e0c2sor104085766b.0.2024.07.22.09.12.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qt7K6TUk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664756; x=1722269556; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUnEZQeXXlZXeNXnnbVEIVnP0pQsNfyfJir/+RcM/Qk=;
        b=qt7K6TUkCZ7Y0N7vzPL/zlFkAmksLnvUgyVT7LxePa5PVlgi+38q3avEs0P7dSeekp
         iJDYymgoPrmTM/Yh3GwdoGk7wBLT8c995m1k5nFDwC5uFwM31pD0DbURyKme6+bjNg3R
         qgDTAhdYkhQIuTcfAGrMqSmAvV4MJfYTpuS/NCvn/xQ+Z93kJyacA9PwR9awVFHeWoZu
         LeKoHkYBmkYx/pzJNzHrpzp5sAa74HuoaXkIhzdGKPl+sgzg4h1Pfj1QrPtHG8+YGdai
         DuWy9lHS0BlI08WDdb0muVhtWMiM5IEp4LPecnOk7rzLtLJcCPls80rmr1YPizRe7YXK
         t1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664756; x=1722269556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUnEZQeXXlZXeNXnnbVEIVnP0pQsNfyfJir/+RcM/Qk=;
        b=Nw1hH8kQRHgsygYa8Uyllspe2hTWRR3M18fKuvyrUNvCtL5MmJr6eD9A7l6feU5Kcl
         trntEY5Iu2PUctzCuTKY/5bsE3ej9xQDjfMozDMferBGSWe1Q6i9bH48/Ksi6wLKKJj+
         gVHeLZY+U+hUWEy1d5j2tfJYmJNOIAfbaqT0WRCSrdONzvQM6OYTYULR8VtC+tUDvSGW
         lKzTYOQba3Kd+WJc2GabttmNrfQsi7Lyy7SmxqV2VWAtS7WYrJZGKUIoOvzYsruzwwt4
         ZmL8EtBtLX0h5p72wC7fLqRkNh7OiUhyYYA3YR2Clixump1Ng/Amx730Xy5uOoXsHSX3
         qUNg==
X-Forwarded-Encrypted: i=1; AJvYcCXcmgk/p9YUhJ4TFDuo1ISG+iU/digJzzLlEL6qYZMLFFa99FovtZ5Vnp+76mbNMlbeQHgQGKkUF7bBOXKj+F/fSbpbA9Fz
X-Gm-Message-State: AOJu0Ywp6DSH68u82RscSu863mC+H31dTv2qQ2y++BD8JWW6A9Alj05r
	TXVW113R39WdIkngA5jqn9AR3dgxiMZLhXHOIdfjCySFaKY0fAOAwwzjXhVFfUEjRQ==
X-Google-Smtp-Source: AGHT+IFBdHT+9u4/6WWaBwixYdDF3EWAbkW+CHFw0mN1R1XySX24ipX+3w+XMa7/1tXuIG2Dt7liqg==
X-Received: by 2002:a17:906:6a18:b0:a7a:8876:4429 with SMTP id a640c23a62f3a-a7a8876449bmr24577166b.45.1721664756132;
        Mon, 22 Jul 2024 09:12:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c7be6edsm441133966b.85.2024.07.22.09.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 09:12:35 -0700 (PDT)
Message-ID: <18f7d975-617e-4791-b921-7df7c9ef2d1d@linaro.org>
Date: Mon, 22 Jul 2024 18:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] util/fifo8: Introduce fifo8_discard()
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-8-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722160745.67904-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NXBkQSuEa6BS

On 22/7/24 18:07, Philippe Mathieu-Daudé wrote:
> Add the fifo8_discard() helper for clarity.
> It is a simple wrapper over fifo8_pop_buf().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/fifo8.h | 8 ++++++++
>   hw/scsi/esp.c        | 2 +-
>   util/fifo8.c         | 6 ++++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index 21c7a22937..53bafabd25 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -129,6 +129,14 @@ const uint8_t *fifo8_pop_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>    */
>   const uint8_t *fifo8_peek_constbuf(Fifo8 *fifo, uint32_t max, uint32_t *numptr);
>   
> +/**
> + * fifo8_discard:
> + * @fifo: FIFO to consume bytes
> + *
> + * Discard (consume) bytes from a FIFO.
> + */
> +void fifo8_discard(Fifo8 *fifo, uint32_t len);
> +
>   /**
>    * fifo8_reset:
>    * @fifo: FIFO to reset
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index cec847b54a..c703fa7351 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -351,7 +351,7 @@ static void do_message_phase(ESPState *s)
>       /* Ignore extended messages for now */
>       if (s->cmdfifo_cdb_offset) {
>           int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
> -        fifo8_pop_buf(&s->cmdfifo, NULL, len);
> +        fifo8_discard(&s->cmdfifo, len);
>           s->cmdfifo_cdb_offset = 0;
>       }
>   }
> diff --git a/util/fifo8.c b/util/fifo8.c
> index 6610b79182..ea39ca2552 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -131,6 +131,12 @@ uint32_t fifo8_pop_buf(Fifo8 *fifo, uint8_t *dest, uint32_t destlen)
>       return n1 + n2;
>   }
>   
> +void fifo8_consume(Fifo8 *fifo, uint32_t len)

Sorry, forgot to s/fifo8_consume/fifo8_discard/.

> +{
> +    len -= fifo8_pop_buf(fifo, NULL, len);
> +    assert(len == 0);
> +}
> +
>   bool fifo8_is_empty(Fifo8 *fifo)
>   {
>       return (fifo->num == 0);
