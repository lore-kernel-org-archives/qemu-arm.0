Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp253264njf;
        Fri, 25 Oct 2024 21:36:03 -0700 (PDT)
X-Received: by 2002:a17:902:c949:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-210c6cab86cmr23723005ad.52.1729917363458;
        Fri, 25 Oct 2024 21:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917363; cv=none;
        d=google.com; s=arc-20240605;
        b=fgLWdvOBp4+UsulP222gMMI5heKd+AsrNN0XZg04y7zCe6aizDo1spDoNVGkMERWlf
         1RRMEGZIOijuMD92MmRgp4nhYrXvrQZJGcbJCQc6DMddqrc92jnprMj5GqYaWCde2Nt+
         0e8nomM/riUse2CPJsFo//6QeLAQoBqOzb1UDh8FmyAr8TAn2zGYJnwlqf4X8TasLGdW
         7km5lo0MvnHtyLVku8NtM9R43GEDybwgLH5oev7OJS6ABTv/9qUWOgzsGY7jl4aR8xxs
         uG8VEVwhg7DVL3z7r1kNUUOgVCHoWkBa20EhZcaBHlKadEO9PKDIgjFa8W8z25IcI1oz
         2s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/gIbe1d55J0i7G5iCOOM1ljApzrAFEyO6xE7+q4tuJA=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=UyLBYGRBmEe4ctLGHAEwMGv1bP5PtAxTxyCUZfbfKEK+leuPuf3727UHGzb2f+fXJ5
         KEzAKXvOjC+Hn6i+q9RJ7V8IeIQaFmcL53O6hHk0N1eFi+PDjo5LUeoIIC3LgvT73Lv+
         pmNIeBUwuvmUrqII6am6Q7WZsGaiUCE1eM5svH4Qgpekn552bdaNG9AV7zl6UPWzaVK1
         nSoxXgiBGEPTcaJgjOIQ0k/CU67eri4f61Ha4paUAGx8x4Ht/VCl0Nrhx0eqDn5y1OK+
         bW/FfW40sOSNGQtZC/4mww73ATsjwSkWAg+wHchST0yl8e96hEZ4mX5fIuc+fpamEdN5
         pyvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xF40gHzu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bbf7f2f3sor15475485ad.6.2024.10.25.21.36.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xF40gHzu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917363; x=1730522163; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gIbe1d55J0i7G5iCOOM1ljApzrAFEyO6xE7+q4tuJA=;
        b=xF40gHzuIoI51qhZqJ7AKqgLqf4GOuDdoIE8had/NH6L+OypIsmNot1VgVpi01JqJU
         Olm3PSlE+sctcS6ZmFg8sH1ceywsS37+FeA38qAoZYhEhNHrb0y6LQDf/iMlYYJOhbxx
         8qVRoVoA+Pk+ygIwa3AcpYpHoQTcMQD25Mxag7mwtwiYhvBn1J9kocZJz/AI6FbrFBc5
         wKKzzQVhcFsyp3670v6Md7NWNOhmKU8CZ0sy/4NqEp2XWX0I+rtOkxDn1iEBH/3HB4gl
         BtodRLSFTjzdRmozOABa0pP9xWs9igljOXdyyrgMxZ7LBqLubFaUL+qTJY+gngcyZJJH
         Z0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917363; x=1730522163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gIbe1d55J0i7G5iCOOM1ljApzrAFEyO6xE7+q4tuJA=;
        b=phNjv+VdxsbjW3sI9MOK3cMUGOkEfFzfe4JJOAMSWqnetQpgp0F75bOpY6pLuJ/3TK
         YzHAJrZCF0QrHAuTFf8vo7AAohFjrgvNOntnx5yg3o9/cn8HeZ3+5Sk2fgwT3KD8Jxuh
         jxS0h2Y8G9396BO+ttnoxirwW3E9b4PbraL79vCuN9EkGhXpavIW+YppZQk4RDjrtvLB
         vJ2pXQtFzg+R5LeECD6BzgEld54MuwLLiIz2BaDEQKwgG9u/6wPt2M3FIstHZZPsmmsE
         GiojnvY5fmhQtR7EhZuIecioHLn3SNHVck2Ouz3oJ3unsPaRIp1NJMOhXlwTAoxXVcvX
         axmA==
X-Gm-Message-State: AOJu0YxEILkDPjcCLGKSo1GKeiyFsNeg32JzgXxmqBR0l9Ehaq0EXUnI
	c6y1ulLTJah4RFM75IMqlrCpA7/JY/MWaqjHjfgaufaI6FfpYkiEmbzg0o7jPUz0lw==
X-Google-Smtp-Source: AGHT+IGReU4ICQ3M2VC36Ip/tTtyo22+H2HnmGfFtSFZ+yskBIh5Dcb1rq0I/LLPKx/DtGbBjo8Ylw==
X-Received: by 2002:a17:90b:5201:b0:2e7:6e84:a854 with SMTP id 98e67ed59e1d1-2e8f0f53e17mr2311975a91.1.1729917362924;
        Fri, 25 Oct 2024 21:36:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e37490cesm2435135a91.37.2024.10.25.21.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:36:02 -0700 (PDT)
Message-ID: <a6a832c5-9429-40b8-ae3f-1c90c5301f73@linaro.org>
Date: Sat, 26 Oct 2024 01:35:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] target/m68k: Initialize float_status fields in gdb
 set/get functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-11-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UAyM2K8tKZfg

On 25/10/24 11:12, Peter Maydell wrote:
> In cf_fpu_gdb_get_reg() and cf_fpu_gdb_set_reg() we use a temporary
> float_status variable to pass to floatx80_to_float64() and
> float64_to_floatx80(), but we don't initialize it, meaning that those
> functions could access uninitialized data.  Zero-init the structs.
> 
> (We don't need to set a NaN-propagation rule here because we
> don't use these with a 2-argument fpu operation.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Spotted by code-inspection while I was doing the 2-NaN propagation
> patches.
> ---
>   target/m68k/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 9d3db8419de..9bfc6ae97c0 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -36,7 +36,7 @@ static int cf_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n)
>       CPUM68KState *env = &cpu->env;
>   
>       if (n < 8) {
> -        float_status s;
> +        float_status s = {};
>           return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));

While here, could be renamed as 'discard' like SPARC. Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       }
>       switch (n) {
> @@ -56,7 +56,7 @@ static int cf_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
>       CPUM68KState *env = &cpu->env;
>   
>       if (n < 8) {
> -        float_status s;
> +        float_status s = {};
>           env->fregs[n].d = float64_to_floatx80(ldq_be_p(mem_buf), &s);
>           return 8;
>       }
