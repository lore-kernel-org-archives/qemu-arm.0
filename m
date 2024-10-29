Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp128719njj;
        Tue, 29 Oct 2024 03:10:20 -0700 (PDT)
X-Received: by 2002:a17:907:3f19:b0:a9a:e0b8:5bac with SMTP id a640c23a62f3a-a9e2afc5535mr167461866b.23.1730196620179;
        Tue, 29 Oct 2024 03:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730196620; cv=none;
        d=google.com; s=arc-20240605;
        b=AYfXGYXfWqaXTFH48K8usxcr4raJtHoZa5d7Y1kTmZQyq4zDzNaX1DpDLtwKJnQ32n
         ZopudGDhFKYLCA2NM7/25UGh8h0ma7xol76Okdh9xz5d3ZjCXvy3YFToxIzWpma21K9t
         8gJ42cxF0gkFoCjSXIQvmDGlML0GXWpzh+N4SboQJFbip2sBcm3HzzWKOqeIwMU3LFGb
         9+dXKy9MzaXS0s1XtTKdFZ6614Qc2gX4RP0kIU2pdhYrc+U6BiXygFpx7dJSAb9aIAbJ
         ZHUflATY35LQLIa2uloXdkyRNyV4fkpQAYGXbLI76aJm2npAe9xGf+Wu5gry6JfLtshM
         gYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AN9pvc8Qen5ygV5OCPkxjXApiKlaWjv7EquPAaoT3fo=;
        fh=hcUa7snvanh62U71Nr0iBP994FUCqchuRJU/GHXRaD0=;
        b=OSmJ4tlMZOt5/94SUb4j9iyvDihTFnRIVA1JkHIumzitaLLAKiddObJNS4VhUqD3Ho
         WPbDUw6aAIc0m6fuhY/Ami/2QEGLvmDubDcBRubIUH2NMtoB0oTh1qBIMZRzN1bGIejQ
         hjkg3CYiPAqznSOZ9MUakBAGz0iLaTyIwqFRprPmNGDrtA4IdWKydPloD6A71r5t/RRO
         CNW5ssrfIsuTX7PeHoLMuJ1en0Rqaf1L0avS1ipdLFU7wVBaf4/GS7th4SKubd1e5rC9
         zLKP9r2EQocXmPBwuiU8RmhJ+oi6RunvuyJkl4lUL2Zz4NEMnyasMlo/TZtBMcQ8Tp/C
         KmFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aapJc7In;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9ad1815c2dsor518026266b.2.2024.10.29.03.10.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Oct 2024 03:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aapJc7In;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730196619; x=1730801419; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AN9pvc8Qen5ygV5OCPkxjXApiKlaWjv7EquPAaoT3fo=;
        b=aapJc7InWbuYLo+XmH21vnMV7kcc1yCfGIG+V2BvRfsloYl2b8rSSk8yHm+gcTGsWX
         u9IJGW8eVXdWPDCWM7FSbO6+5m4l6d6haNauCs3ej187WJXBnIfkRRyly/YhyerUXL8W
         5p/7eHR4ClGYJYTLW/4i0nnIwvsZaE6tmpVB7SLBvgZBvytamFxIo2+dfEyI+LQpMKO/
         4/fQ8A24cbZCTBXz5vlt+qqI7t1yfhQBOTaS+pzYcd2CJKPmMg1zbnbUgNkOtbjAUObt
         ZfkMF6pPUbaTRsT3xc0GkYuxCsOalqxb2kzILExZBAfeFzEJ8vhHbEf0N/ZSBBIM8Zlq
         FMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196619; x=1730801419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN9pvc8Qen5ygV5OCPkxjXApiKlaWjv7EquPAaoT3fo=;
        b=DknR6UGzVgt1sX+C2bKDYOfPFKBw0d87LL0Psx/Z8evt/ctRJdGgYa1EmkBkDg5ezU
         Ep7nXY4Vh2g6VMOQ8W7cgVOVhHVvopJL58sAK7jBls3sZmthi6NCoDzfE5dex6F2BvPl
         E6mzzbJQVB4FyF0XFZpiaB/ZhFYEiXNs0RFKYHxtT3gzubAPPHrhfgc9YB5PPX6Nb2AP
         H3fHLoXbSNm/dEa7C0UaEHRjAb7XyAN0k/Rje55R7corfBF8yBh6gwZg8+21OySnHTEH
         +a+VRoDS+Wzh5QacnlPo+APUpMJ86ap4vVCPqBTBe4BBTvID4EGcKZ+VYWAd6Tdv3hZF
         THuA==
X-Gm-Message-State: AOJu0YzdD4S+PpiNOLElgmNSxJYqv1R3EsrUILjO1ZTOynGQEU+pxdOK
	FV6MLZc1cUFt57iMQdY2SUYbzprA6lby03yyBwSmpef7ICRcdtqA2tYa7CjcbKtXp/P69xFB6mg
	LYGDW8nWAYDEbweRKAloXS1Xh69ZHCYnRlezGGMBQ
X-Google-Smtp-Source: AGHT+IEJlKNVHDt1fwnACbxFMCVJEbHqertCIVVjn9p0LZn8ZkF6YM6otJgMWMRcEC9Ib9KXAhZNznsazbpeYhWwkxE=
X-Received: by 2002:a05:6402:274a:b0:5c8:bbc3:9dff with SMTP id
 4fb4d7f45d1cf-5cd2900fdfcmr1444318a12.5.1730196619471; Tue, 29 Oct 2024
 03:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241025141254.2141506-1-peter.maydell@linaro.org> <20241025141254.2141506-10-peter.maydell@linaro.org>
In-Reply-To: <20241025141254.2141506-10-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Oct 2024 10:10:08 +0000
Message-ID: <CAFEAcA9D7_WBrkxipoSa1T0FT3MKojBWrhH9WBeq8NZpLd5Kog@mail.gmail.com>
Subject: Re: [PATCH 09/21] target/m68k: Explicitly set 2-NaN propagation rule
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand <david@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: T52nN7CItPzy

On Fri, 25 Oct 2024 at 15:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Explicitly set the 2-NaN propagation rule on env->fp_status
> and on the temporary fp_status that we use in frem (since
> we pass that to a division operation function).
> ---
>  target/m68k/cpu.c              | 16 ++++++++++++++++
>  target/m68k/fpu_helper.c       |  1 +
>  fpu/softfloat-specialize.c.inc | 19 +------------------
>  3 files changed, 18 insertions(+), 18 deletions(-)

Whoops, Laurent pointed out I forgot to add a signed-off-by
on this patch, so here it is:

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
