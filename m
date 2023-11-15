Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3064870ejc;
        Wed, 15 Nov 2023 13:21:23 -0800 (PST)
X-Received: by 2002:a05:6a20:8f25:b0:186:8a9b:2e1 with SMTP id b37-20020a056a208f2500b001868a9b02e1mr10187209pzk.44.1700083282985;
        Wed, 15 Nov 2023 13:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700083282; cv=none;
        d=google.com; s=arc-20160816;
        b=SDqQuJ1sVUU2rTRSm+pvB/Y6I21DHoYroNjQx/LC+Pzi38DOmhFzM1hgjSCASkOVkM
         fVP81vM+l+qjOvQRYj9ipTHm1PmBcMdy+8tP1TXM0lpsNzE9BarhnqyEzGtAaobF9BXu
         UXDZN0prIXAL2KFN4zw7zUWcp86k0uqB1AAxectNrdBLUAyK+VDuNJrZde9G0wKhdmGL
         OE4qY7tBqppTUxxgA5JDswLLmhNZjYxJQDDQgUafGx0vsBI6x43wKjqZk6I0c4JwrtHF
         XQzb7M3j85v9Iqzij4gCQT7AaNfhvqv96+to+m1FtDulAKp4LYhWo0VA3ZgeOB1lkUXU
         ptzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o/HrsuSmMhTmej1DsWCC7YGHx+DKgYWtN40nLdFXdMU=;
        fh=EuHjJUGyhemwCGdsWJBeBKo0HjA9pHZEOVmU1boAqIA=;
        b=TH5haRfYwa+XU4F24LKdcUCxxEmVRTpvJJg7OI4rc9s41t/tULEhHOM5aGtSzRKxqN
         w68JPv7+VRPoA+fJazpCs2WKOCxdW+e6gXs3ksoBV8FtQ3C0wwm2IxeCGCMEN7Lud6Fh
         jPYAFO5JC9r0d6UDVmVJ3jpWCccSqyuHkayd/cK9Vxa1y880NDuijEHwTZdTqkeCPvE4
         7aESOmsQVu+Y5KdnoLJ5mQe22+42rBONKqjvZ2Z5GDpUG22nfUaF40Tg36xrWQjmrHPT
         ectJ6gylbqRg+SY6AwV2M8QImuGI90vx0+YkJNuofvBUgQL8OAw0qJgHak7i2UyF+iZW
         OVAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ndLMR/cA";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t23-20020a056a00139700b0069101c25c5bsor5962620pfg.3.2023.11.15.13.21.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Nov 2023 13:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ndLMR/cA";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700083282; x=1700688082; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/HrsuSmMhTmej1DsWCC7YGHx+DKgYWtN40nLdFXdMU=;
        b=ndLMR/cAUw8DTHpLBSc/GLrBU2F1H5Hl2sFTCLnOEXfJjwF3lEbLfgsnrythaudD0O
         QQDAYl7xRKBnLtJ6etBNjq+GD5BNT0wp/g9SWSymZdM6Jkdtl/9eH0+FXXwVKytPPwcz
         29eFApZp+cbSqNYVjn+HMW2lreL69utDIzy71sKE5T0NoxNsisYAG7C+UMFsFridS2VU
         CI44ZGTxrHu90+uLUNOb6TVroxbIezJpw02i8I0WMLlAN+gdwPPzh6zr/i3XBCd9bI70
         Ca5XtOZw0iLjC0esWu3UjGVc8wqBB50FlDhDIwUMQxS1NPDYc96DgxmWqjqGZX9k13MA
         7fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700083282; x=1700688082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/HrsuSmMhTmej1DsWCC7YGHx+DKgYWtN40nLdFXdMU=;
        b=TxqboPP6POVqp7EZPEJ5FpjwgvCVmj2cj4So+rL0oBUVwMGofAFcmk10WR1lFTe+el
         zkCi29M0p7Yo8+RSiModkaBNBpDY1RI2yg1sxRk+mny7pV3qIXeGFNlZilLt9cNmRflr
         9ImqUnp74xbBSPl8FpwZy2kQZ7CtjmoJYhWWdXU/j1W/GwsfaQ6tt+kN5snLCRTW2cMB
         j58DhmfnSqnPsZtC+ystyp1vaDWuHwZ3h8/Nfrnr42mnXh9Br2/QvvQo7oYJB62e690W
         BZUcVIraYpXgq9wGxT7Oo5LAtHg0yh21OHDihKPQBGsmi/O+IBGhw6ctnRnb/cmRzOMO
         n6Bg==
X-Gm-Message-State: AOJu0YxVRP4H2yxtvKZNLfhLLG7SKDQR36JfwC1RWA8b3JBawLD1WpaE
	i1M1t8Kggc8pXVh8wPzekF32Igt6cebnBoX6cHMtuw==
X-Google-Smtp-Source: AGHT+IEG6qtX8+kF+O3swKNzwdHffdb4XxjwxO21jWVj8PnDunDG2RTrnqAz8V69fk2mQxCr0MERxA==
X-Received: by 2002:a05:6a20:7f83:b0:186:5265:ed1c with SMTP id d3-20020a056a207f8300b001865265ed1cmr11554070pzj.6.1700083282437;
        Wed, 15 Nov 2023 13:21:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id m18-20020aa78a12000000b0069305627491sm3238404pfa.159.2023.11.15.13.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:21:22 -0800 (PST)
Message-ID: <84796698-f848-47a3-ac6f-26e0777a6cfe@linaro.org>
Date: Wed, 15 Nov 2023 13:21:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] tests/tcg: enable arm softmmu tests
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
 <20231115205542.3092038-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231115205542.3092038-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vN+2P5Ub2zdB

On 11/15/23 12:55, Alex Bennée wrote:
> +vector_table:
> +	b   reset		/* reset vector */
> +	b   undef_instr        /* undefined instruction vector */
> +	b   software_intr    	/* software interrupt vector */
> +	b   prefetch_abort		/* prefetch abort vector */
> +	b   data_abort	        /* data abort vector */
> +	nop			            /* reserved */
> +	b   IRQ_handler        	/* IRQ vector */
> +	b   FIQ_handler        	/* FIQ vector */
> +
> +	.text
> +	.global __start
> +__start:

All globals, and ideally *all* symbols should get the type+size markup.
When qemu reads the symbol table for lookup_symbol(), it will use both.


r~
