Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3060012ejc;
        Wed, 15 Nov 2023 13:11:19 -0800 (PST)
X-Received: by 2002:a17:902:f812:b0:1c9:fdbf:296a with SMTP id ix18-20020a170902f81200b001c9fdbf296amr341466plb.8.1700082679005;
        Wed, 15 Nov 2023 13:11:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700082678; cv=none;
        d=google.com; s=arc-20160816;
        b=ltEQVD+R4kwPfYpTDFD+U57L4ZLipz1H4JQLFCRB3OCQpi7CMSuNxkSmWSFG019Rtu
         U8rmaDYnhejrxQyFHdPnckZyHT9mTWGd5CoBfIQpAwXGqimisQ7TbvADzoFoUThe5zXK
         TGORG9KokN3igog+tMYXsBkIswBrkyQB2fwuzOj24e/I2mPbc7FLLz6fLo9GJ+r2//w3
         UP+sf8euPk42CsI6eLVNrZ/0EF1F8yhMfFgz7QIPP+MG9M3c7NVwPzkV3z34cTgRcOIZ
         e54fBuSKQECoEb+GEi5AvHKm/D3jWgk2q3Nrp31ZEJxaBFlSyPpuLkAkxUpe8Fg4gUjN
         ijig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SJFan03wMlzbUu0MfOpcJ7FeGLQONjoLlqrUnGtafbI=;
        fh=EuHjJUGyhemwCGdsWJBeBKo0HjA9pHZEOVmU1boAqIA=;
        b=CnuQmRMU+0A2qCuBI1UGC3t3VEGD7rkedHuHxRdVtHyNjTk9DQcBVKA3HVih9ohnOK
         VzgZIReqpgUcMJwr+5G3k1V03D4FQfXCHpmJS4Ccvoi0XNmV49XjrECwdnjoozvNOaRL
         ynZcBWyjsLyHUIcolttD39TKa8dQzU2UUtd+b88Kg9w5ls0pP2P8+dzMQWUEDdc3L1op
         RwOihrbhv62TLxdAldxEvdjwJRjr2QHBig4CeVrKe+36rwtV9BkPSEVengf3nB8BMCWd
         //5K846D9IK1QVOy5hsIXy/ATAZ2hpJKFmrdx1ckjJYLtq8NrUuMuZFMnbHUa5ffxH0B
         GR7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CN41oN/l";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w6-20020a170902d70600b001c9bcabc5dfsor3223159ply.4.2023.11.15.13.11.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Nov 2023 13:11:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CN41oN/l";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700082678; x=1700687478; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJFan03wMlzbUu0MfOpcJ7FeGLQONjoLlqrUnGtafbI=;
        b=CN41oN/lDd+4y+Ehis9VkcexXucX7LR3zRfBHxNgZo0HDMmonGCqSc2RAgyMpxIzxh
         r80v5ueTBe72Z+TgF9Hk2J2Jnv9RX1zjZlkjUs259eT4Hv7Y+kjaocQebAAWkQ+edbNh
         YQn5rP5ZnDd0qZZwVQlM4BgXbBzPJjUpiWpmeG60njF3iqsgkZ1tZcmlyX9HrdZsNcZT
         dSl70KxTSBkSs4NULiYuYdEotm6e/Jz+j8hWFgHBwnBFWm/KO77pjUQN99RLPG93yZMh
         TCYDmVx0Vkh8KnOgHrMW72K5zSVkzlFfKcn+W45zmCCZz52VfJgzobqvumHCa+n8fH6J
         fDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082678; x=1700687478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJFan03wMlzbUu0MfOpcJ7FeGLQONjoLlqrUnGtafbI=;
        b=FCsbRPr23vxlh3UJU9avZIQXAzGbhpg39P+2vGzEVaQ0Qy5b3j54GRVYldNvS2Iejo
         4SoFWEO43prCzUDlZMTe8oLo6QV0g/rdrsfEjCyDSSPvYcMTYpWGAptxYdsA0VXaoLAY
         r1Pwcgv/gWotyr4aua0BbV3EpMvZuld/XdEp3UsGi1TmzZY3fyRY3pJdMccnfrca+o01
         R2X1/MCRm/W+Ls3tCaxKq7fWulmW8DgxABqfW/BdCWszGjnsCBlxfo2ktqRKcEpxWlMt
         BBuNOfr+XSqjLYJ1KBPSYj9nOF9qT90rXN+lSlPwtmGrCmTFqb5I1FeayLVmyfljJPOH
         tOVw==
X-Gm-Message-State: AOJu0YxhKHRbP+f4Ee3B2VqPqk4MsM45xhsC5oOKPBeT5LK1s7/fwCHn
	2h28WkO70xaz5IYBUw28qX6afqo6R/Cz/j13cYz7vg==
X-Google-Smtp-Source: AGHT+IFNamy9O4wH58Oel9w99an/ZGXoVdJNWR+DuDoK+2c9PZtbyoOSU8XVAFcw1IklpAf0STkgOw==
X-Received: by 2002:a17:902:ce8f:b0:1cc:5392:3ef4 with SMTP id f15-20020a170902ce8f00b001cc53923ef4mr6856433plg.21.1700082678420;
        Wed, 15 Nov 2023 13:11:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902e88600b001cc3fae06a6sm7805990plg.159.2023.11.15.13.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:11:18 -0800 (PST)
Message-ID: <e35e82c3-97d7-4428-b660-c0d6e43a96c7@linaro.org>
Date: Wed, 15 Nov 2023 13:11:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] hw/core: skip loading debug on all failures
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
 <20231115205542.3092038-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231115205542.3092038-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZTyVXrKvJhdo

On 11/15/23 12:55, Alex Bennée wrote:
> ELF_LOAD_FAILED is one of many negative return codes we can have. Lets
> treat any positive size_t as a success for loading.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/core/loader.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 3c79283777..e7a9b3775b 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -505,7 +505,7 @@ ssize_t load_elf_ram_sym(const char *filename,
>                            clear_lsb, data_swab, as, load_rom, sym_cb);
>       }
>   
> -    if (ret != ELF_LOAD_FAILED) {
> +    if (ret > 0) {
>           debuginfo_report_elf(filename, fd, 0);
>       }
>   
