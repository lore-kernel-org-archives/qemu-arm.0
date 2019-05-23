Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2169344wrg;
        Thu, 23 May 2019 13:10:09 -0700 (PDT)
X-Received: by 2002:a25:b948:: with SMTP id s8mr44174140ybm.325.1558642209765;
        Thu, 23 May 2019 13:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558642209; cv=none;
        d=google.com; s=arc-20160816;
        b=mtdiQ0FDogBu1KKsaSQ9KrUechBIqHjNpHzd+qww5tZmQMbrZxxx/HTb1L10MY+yxv
         x5AHDa7k8P4i5imh+egp9vtgnX6VohhKmDZZLnit8iqzoQeqlnlTG8sJvJ4dGKx3l7b/
         DtTdl9egxEpYA2J+Kehwpp9l7eCzgnR5qH5hEDmzYwFBX8gTdiATyEbpnknb3Kse5yvL
         yKkweH4fMbOfRzUjpLTSElKe++YolcB7FFty0zuSQlQDSo2a+I4Vkz1Kk4YcS9burxDG
         qXmrsrys3tW8PsP22F6U/VOhMlu6434ZTLJF/dhwbdmPr3cqytchNtSi74OQdCnw0ZAo
         2J3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=tj+njzIlptF/VIznWoGknE1ID/zZ+Y0eBYhXAyyclxw=;
        b=o8mBBlmW+f+XbmBuEMHY/HkGbEPZ1Gve3ga7vPebezIWZpCVoqviWPShnqKgNr7eab
         8JlCGrt6uouAkhQX5yoL4xMNGJJjZhg+Lw3Oq7WobfK7ABbQO0lBnDEMG6WW9djvp412
         2JU+mnWLosoDFcqJrbD/7OQFqmT7vF2l2RQj3RYMACKM2vLW9sucDSj6+u/DlMwFQ3uo
         3C/S8dxpqjf86VPaSTYJEc8IBIvp6JkqSEFr9TAD+v1BckrOFdZcxWyclW+bw2RK0ue8
         XKSmzhBt2jVa4xw2uIM+YYb4bn+3UARVl3ifdAGLt3yxlWtgDKnZIS93cwko4m94YNQB
         CuVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TsPsEkDB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w3sor204487ywe.142.2019.05.23.13.10.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 13:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TsPsEkDB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tj+njzIlptF/VIznWoGknE1ID/zZ+Y0eBYhXAyyclxw=;
        b=TsPsEkDBbtgoeku2Ycm5czHVxfrQheE8tauVS4IuzUZAfinp1hOO6Bekhpc09wPKre
         WbR49uHA0Zpy653RQWP3M8QMm8dyP/Rfhvonkd5Jh87Ak9XL8EiVvGsP/PLG8folVlEB
         VLt9dcWAk07aoXm1Su/jhoiyqECnSXoNT9Xhw0+6ytSRFHyCP39H7wfkF8fYsf7onCOf
         QmKt8LDkaX7W3IgeLLjS9Myrb7lvrSLt5MHqtHUOeczMxGEUlqKH7CfsTJQzgwUVTOL8
         fz6J0Wc0Xv/eWxlrYdpznIdKPr6ur1eXAz1X2/M+meurAxbcRCmQp1wC7u+BU5B7smlT
         kseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tj+njzIlptF/VIznWoGknE1ID/zZ+Y0eBYhXAyyclxw=;
        b=JEplVetT7NtSOatTC4h+05S1qY5KEzhf81eAZXnDvsDJyFByDD0DG1tXYbGomCRlmr
         MvLhHoj09B3OevCoa+oT04sPKbrgcpDqmkmLKfxqoYa/SB79voorTr5FZSsYwCEgWg9M
         639Dhn8wCETQaGP+x6aPPYnN6Nqts/S9IobmdbjouvRX/jEcE/1R0fqGvZWf2tzT2EeK
         yomtkAUl7Qrb6+dUsmfAejLvh9aNbh2anBe+iUuPh6qVOVQblICeBc10g4QQKUgM/ZTT
         PoMypoOhHAJmei+7ZtpFnYl5PzMUVib7g4EQ3YpABoshgzz7qDmIOeTPPhJQZXdoB4wc
         8Rhg==
X-Gm-Message-State: APjAAAV0p2WydLtryfFLVuTln9AlQWkxIhFvTVeXeGK6XCjk4rBhoTvk
	eXIiu/SFfEUUXjIouzcfyQDkh1Cu
X-Google-Smtp-Source: APXvYqwF6y04CP5s+p4f0rep7vdQvj+NL8P6zsMzuVP8AK+Mub30qXl/gy35tH6ABgBpb0tS98q2Cg==
X-Received: by 2002:a81:980b:: with SMTP id p11mr13795041ywg.48.1558642208760;
        Thu, 23 May 2019 13:10:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.240.229.182] ([71.46.56.19])
        by smtp.gmail.com with ESMTPSA id 193sm80624ywf.28.2019.05.23.13.10.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 13:10:08 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 17/28] tests/tcg/aarch64: add system
 boot.S
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <52b8de1d-3900-2368-eead-5e98261f509f@linaro.org>
Date: Thu, 23 May 2019 16:10:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ZzcaXaZGarR7

On 5/23/19 6:25 AM, Alex Bennée wrote:
> This provides the bootstrap and low level helper functions for an
> aarch64 kernel. We use semihosting to handle test output and exiting
> the emulation. semihosting's parameter passing is a little funky so we
> end up using the stack and pointing to that as the parameter block.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fix tabs
>   - 2 stage table lookup with ro and nx sections
>   - set stack to back
>   - moar comments
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target |  32 +++
>  tests/tcg/aarch64/system/boot.S           | 239 ++++++++++++++++++++++
>  tests/tcg/aarch64/system/kernel.ld        |  24 +++
>  3 files changed, 295 insertions(+)
>  create mode 100644 tests/tcg/aarch64/Makefile.softmmu-target
>  create mode 100644 tests/tcg/aarch64/system/boot.S
>  create mode 100644 tests/tcg/aarch64/system/kernel.ld

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
