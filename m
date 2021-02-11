Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2125288lfc;
        Thu, 11 Feb 2021 02:14:29 -0800 (PST)
X-Received: by 2002:a17:907:3f29:: with SMTP id hq41mr7793927ejc.227.1613038469389;
        Thu, 11 Feb 2021 02:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613038469; cv=none;
        d=google.com; s=arc-20160816;
        b=SLjzmIRIM+hbeZrPR4aKeZjhBuxAJt52wxCqzcbpVWTxEgIma8penVzJSbxF6lBvS5
         TMFUENOuR1Elx/7+EyTCdkbmFxb+wcL98pCZBK/5+p/aSqzvM7IImzEVwjWY1jRSQYoY
         Mwx0jlVneyTWj7pL/4d8UrL4fGh61cJW7Iz/95Mb13Tt+2dVJtfSgKUUeLUY1Ylt5clB
         471f7tUip5xfXFpLAh5/2nTGKeZkaAtykq2go07Q6GhTYXCguQKeeXKgcbTL4hb6pJop
         erjloHinK1JFMSmFGVaoMKt8EOG2AER43HN4FcLs1CRSmAJ+eRSqBWiPGbgjRAlqQRQX
         mPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=+2PHMDkSqQyHmTkq0AhIiIBdn8pX/hMU5s527CBYpFc=;
        b=EHWqkZpvrxkxhvosFoL3vygEnSV2phoeLuGDrsVyQXLXc+iStz3SPgnGT9B73PrLV7
         y7Ys60O9HR2j8fdWXNfnN8OR8hkaSnFK2kG585pc6ci44fgjcx7hEpHqTSSWkUGbCEma
         MPPe9qSEMubuz4xQPjsLP6srpXYKbk/AHH8Hg4Jpa1yR96wqbhEhWCimFF+xEHuYnVMw
         cIju/1AZAc0lPo7arY+6ED75G1M2VIOv51TfY+QQiae6nXXqizQhVWkJqjU6SJDPYnKE
         hdziRnEiOrWlobH8atNGLnWkGPE/XthIexpAp0D/qb+t+RuyZWctg6CbbrUB/+30ZXXq
         t3gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=g507dUF0;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ot25sor3392213ejb.91.2021.02.11.02.14.29
        (Google Transport Security);
        Thu, 11 Feb 2021 02:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=g507dUF0;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+2PHMDkSqQyHmTkq0AhIiIBdn8pX/hMU5s527CBYpFc=;
        b=g507dUF0zIV15G6zmNKUB0846xIqF6bAXCtO+q9FlFOJeK3BWpCQE65Ixd+CAvBEdQ
         XKI404chFA4ewkti5APT5Jevy1om5JO0sxprZHf05br7xmAxluoG+INxt9fVaxJpf87X
         8CxqjeeUAvgbShbywVYoUdXrdLZ5qTIWgUKC8rzokg1n2YTf8emBzFv1HaAW0uBSZmkq
         trERfZ99AZQ1GjeoLa0QSdXlJt1iILkJDUMILNy5DgiOoKmI0blom9pWpRipr4iZ3GVU
         ws0mdDEki/T1wmRIz5+CABNGFvlUVTvIOAMc1h9BRlu19FRRFGWqxmRBYNV9jVmHdVD4
         LsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+2PHMDkSqQyHmTkq0AhIiIBdn8pX/hMU5s527CBYpFc=;
        b=VqTO2sgobGSXa+KXnH1leUS68YN4MlTZg1lr1FtreT7E3nuubrCmL6VVZDIqOHa8MX
         NWCdYmkQmAO9lwgqMiT853aXF6bKKKhExNVDTQ8esdSS+gLBOLw8pwlc3rLM6ccPg3tt
         HrypEJtnq3PrfSW5DViSXKt2TSMjBYxwJDfwi22jBdnxVh4E4E/TXg/2dHiVXM+JJLdc
         bdflHevMY8EDwBC+mEkvyQcW2WD5zCBj/RElItU4Y3BAr072dSdldfxwO8+3NaB7PJZb
         9Tm87wtEKzry0+3owMr9d6CTRojjFjXKpaI7NTy3fgzJmGKP0TV/oVyP5nPgEiLEN2qV
         HS0w==
X-Gm-Message-State: AOAM530Z+N3002K8GLEFmXg6xdHrE3kSNKnlBpmn8hfYbk3m7Tnsd+6N
	IljFuC6tPsRytTi5LXwSYZw=
X-Google-Smtp-Source: ABdhPJyaRE306YymBg7bDimEUVJnsGuUuOGQhO7rrOftOBj51E40hUBOyxLfjkbdU1FdlBzBzDjOkg==
X-Received: by 2002:a17:907:210d:: with SMTP id qn13mr7614050ejb.377.1613038469149;
        Thu, 11 Feb 2021 02:14:29 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id cf25sm3780839ejb.71.2021.02.11.02.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 02:14:28 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 10/21] exec: Move TranslationBlock typedef to
 qemu/typedefs.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Walle <michael@walle.cc>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <975bb94d-390a-c8d8-8880-313184664e3f@amsat.org>
Date: Thu, 11 Feb 2021 11:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: X0aRxkLvAsN9

On 2/10/21 11:10 PM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> This also means we don't need an extra declaration of
> the structure in hw/core/cpu.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>

I'd say this one matters ^,

> Message-Id: <20210209182749.31323-2-alex.bennee@linaro.org>

but this one less.

> ---
>  include/exec/tb-context.h     | 1 -
>  include/hw/core/cpu.h         | 4 +---
>  include/hw/core/tcg-cpu-ops.h | 3 +--
>  include/qemu/typedefs.h       | 1 +
>  target/arm/internals.h        | 3 +--
>  target/cris/translate.c       | 2 +-
>  target/lm32/translate.c       | 2 +-
>  target/moxie/translate.c      | 2 +-
>  target/unicore32/translate.c  | 2 +-
>  9 files changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
