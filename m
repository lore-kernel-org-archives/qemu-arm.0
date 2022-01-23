Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1457010lfk;
        Sun, 23 Jan 2022 14:04:59 -0800 (PST)
X-Received: by 2002:a05:6000:1861:: with SMTP id d1mr10674602wri.497.1642975499324;
        Sun, 23 Jan 2022 14:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642975499; cv=none;
        d=google.com; s=arc-20160816;
        b=KrCdyWQNSlWNQrhD+flORG9va5S78QCH4cv3jYtFuJLlRLr7NozlkQdlP5vdOUTdNb
         rYNST5yVWnZ9Ko9WQiEE0pCkhYoQOxtkY2XSjCT3inkdIiR4P30anNE+ABsk71kWQ2Me
         Z5IlTcHRYIEBfHbWpbk+HI+RTYQhcUt+q6RwJrnClfGYQMKJvLMBMpA7Q/nB0WfsuFK4
         o9MIn6RRuC9VEp92+Wn4EfAWw8aRam+gFePMe1Ck4+U5aFqg1xm9ogQj45IFSIMZPElE
         HxOoVuOn4luDYql+Pc1hwsVPxzRJXPRHnGDuY/6q8sY6RNQhkt2KWpJFehhpDVMNEgVA
         Bwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=u+9a+qoPgaFH43blLPcea8uonm+E2/Hllm8gAUyGlT8=;
        b=X0iZwnPhmsWVDaFtuS1BGeZSaEh7G+fKS86osPDOOsghGdJ/2uNZw1lsWdSufnwG3w
         AkbUsLwMmZ304qaV9k+WrGyUGmAAH3oDhy2jKpIzlFH1t9UnYP63VxmrLuxhJs4/pCtE
         gEC8gg3T7sMAfkH95JUFqItB7jk5MwHO+zoJ2YtV7Hwzz8oG/N+d01Ft83sC5tkgvKhS
         2pbzmoeMZlbw+ggaOp662AHyzXV3rvUq9P+g9v1ksbpiYjY/cskmlV4Qih0FpGKcA2iH
         bAzLy6b6t+LcCrqxMX3YEsrRlLqO2Cu5KS7XJ67MekvWOtXm77lVy8Iqj4DHXv3bmTVI
         ZZkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S+Qo1nGP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u17sor699449wmq.8.2022.01.23.14.04.59
        (Google Transport Security);
        Sun, 23 Jan 2022 14:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S+Qo1nGP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=u+9a+qoPgaFH43blLPcea8uonm+E2/Hllm8gAUyGlT8=;
        b=S+Qo1nGPRVX3YPETVdVK43kLTbiZ01okuwRPDQRmRf3qA1MEm0lGcu9u1hvhMPDTm7
         YJzIhujigsvQpZ4c5RHg+eQJXNPtPYDErg/voMmSpdEYQ4xz8xncoVsVgseboeubG2lx
         Ee9rzynEprBx1cJHHNP9iP3vgh7OxNK0bloYhUgsFyOpzINqkuv6hYkZnLkWHhlJaZ/U
         +koTnbyl6zTt5P4iBe+iYXFp2csBlY8I7ExnjTgLIMoRnGEfKAsG5rD+ofdMH9E9/Laj
         8ncBUx568/m2Mfmnlg1YJ2GaIBi5EQw/2WCSa5uPYK5gb9jwocrti/dcBEqVSt5oo4Eh
         1xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=u+9a+qoPgaFH43blLPcea8uonm+E2/Hllm8gAUyGlT8=;
        b=WfW1Ic0VCFJ2EHqksApADZoHg6PSv036MUA4y4LSWgVbFNnw00XJiVEw+kGBW/fZYh
         z6BJ4w3mr7Iw9zd0XL3g9zR6iQxIvJiBmLPyUUwbTZbejXsUUi0Ub20pQXAnSdDobeYJ
         GsVZW6pGaCKDa/BxB7GnN+T1a0LIr8LXsoSJGhnALqCIGRVfHIFfub0CxxUD8qq0vvuV
         CDjBIG4Jse/KN8+/s8kqLs3AW12B9oCSK0rsptNDzq5e/ecqE7hhABHcAKnHjgCdqYNq
         dKz4lrGimPpMacdLwVpj1pYTbB4XHJpfS3uTanzgRhp5sKgVFuCYRkJ05KK0doqB8Gn6
         jVUA==
X-Gm-Message-State: AOAM532wjn/ZC4fsg8dsUFTB+nsAAuQSHYlpRKABIwWxW2JpQoid/9r5
	oXbPDMygZSiMF80FGrXy7fsMXwXSD6Q=
X-Google-Smtp-Source: ABdhPJwdbRMVg1VllnbD3Z+oT6UdTEeEjgBzwpGi/5F0m+0c66mlmgTbBHzH4SBO03gUtvjq382CPQ==
X-Received: by 2002:a05:600c:3485:: with SMTP id a5mr9459393wmq.13.1642975498718;
        Sun, 23 Jan 2022 14:04:58 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id j4sm14122658wrq.81.2022.01.23.14.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 14:04:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <c8c805cb-2f5c-c5d3-ebeb-5debdbf97c3c@amsat.org>
Date: Sun, 23 Jan 2022 23:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 10/14] hw/intc/arm_gicv3_its: Provide read accessor for
 translation_ops
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220122182444.724087-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vKmpp1BaPRPD

On 22/1/22 19:24, Peter Maydell wrote:
> The MemoryRegionOps gicv3_its_translation_ops currently provides only
> a .write_with_attrs function, because the only register in this
> region is the write-only GITS_TRANSLATER.  However, if you don't
> provide a read function and the guest tries reading from this memory
> region, QEMU will crash because
> memory_region_read_with_attrs_accessor() calls a NULL pointer.
> 
> Add a read function which always returns 0, to cover both bogus
> attempts to read GITS_TRANSLATER and also reads from the rest of the
> region, which is documented to be reserved, RES0.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

> +static MemTxResult gicv3_its_translation_read(void *opaque, hwaddr offset,
> +                                              uint64_t *data, unsigned size,
> +                                              MemTxAttrs attrs)
> +{
> +    /*
> +     * GITS_TRANSLATER is write-only, and all other addresses
> +     * in the interrupt translation space frame are RES0.
> +     */
> +    *data = 0;

Maybe log GUEST_ERROR?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    return MEMTX_OK;
> +}
