Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp302829njc;
        Tue, 21 Jan 2025 10:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtCzdBnZfxoKT9o1PwZXq8RhsBNayYV0A42uVuHQMkcShnFmihVoqEJX76ORoon7S7s2/6JZfMk2gfqw==@linaro.org
X-Received: by 2002:adf:9d92:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38bec542a49mr15458483f8f.20.1737485701520;
        Tue, 21 Jan 2025 10:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737485701; cv=none;
        d=google.com; s=arc-20240605;
        b=SxqVfLGzEb6EF4tKx68H9pv6jtfHdj/KzJJmcKdNOt7zxfd+WlhcSoIOGncBo40I70
         j87qPXU4GuQHbqq1KlY2/Th7ZQJ60t10MrIpo8GsQ/HrRuvfViiplUMREzBhHkQzruOq
         QJXcP68BPO6dXdPLbWo/2VVuKuzzMqgc2AdHZnt3Tjv8D3kU3ZAnWDMC3TBi6/7SnmsH
         zoiriv3/YLXYroG+cJabB26nnKw76h4yRquuNKdA2mzT6Yvw9WLW4tLH+hLNR0ZA8qpJ
         hYRjxndUnON67j8k8LisvJd42lQCl3jOgyMuyFSImBuFDqYpWKSEVnxse7cqV9zwgdD6
         9rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=84qcMu7dTP7eyW07/OA3ASU/rt7u1RkTQQ/DSgncH1A=;
        fh=OYyt0IBSu2TxQRycamyFtjt8jilnRTMRqsImMM7dIHg=;
        b=iTnK4REZtjcAiNf8aeLivDJ/22e1q+GgOKAENqtQKEXnwNibM9qlBPFg0ktxDkmLPl
         YqbP/Sl0a/tNi2ZLiDg0/G5seBTDqZLCOnj+5v3VL4gjNeX8Ky+/NC9naOOAdVAgmsLn
         ALLBAfGdFlK8WggcJaXfj8kCwM52JG1jd1Xoy0DBvI0WKxB7ELFcv3+V5UDiHkn/VZE2
         9VtYXK5LQM32qxmDiLrQ65iKt3lzi1YpCmhJ9AQ0S6P+VE5ENXR2oe0kIqnbTn/uLnjO
         NVbE35xC5QScxEfvZ8nSNIpGeo+CXHF9IbqG5YbMH4hkB2z+OccpR9fPTVp4cBA3CU3R
         pJSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qs5/OZ0X";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38be7cf6089sor4381322f8f.4.2025.01.21.10.55.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 10:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qs5/OZ0X";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737485701; x=1738090501; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84qcMu7dTP7eyW07/OA3ASU/rt7u1RkTQQ/DSgncH1A=;
        b=qs5/OZ0XybkwtU3w7pN+VsBsi0hzEHOu72eiPW/s2F71Qq+L3mPk4sXiPX2idUuMYY
         t44fFawSZLGU8liRdRkEKNBIVLpY+35j35JoWnvWaAthi3/F2AKfBUkSROxRAvYI746q
         KRlssQl8LPqeqAw3EhgiswhJWfELDp7EUi5ntxgCSF9FW+2i9wl/MmXIC0tiatm/X0NM
         ZolqTelOzcus3aVRZ0eaaJXHRPAQu27PMCkplukDaXyIepMD3RFVUzoWfopDIla1zA3g
         2r0RUgmAW5cMT0ezwr1hpsTeUqGnCDGFhl/d059yHh7gWaTMHtc331bdzKb9Ih7VEE1V
         aXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737485701; x=1738090501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84qcMu7dTP7eyW07/OA3ASU/rt7u1RkTQQ/DSgncH1A=;
        b=X665FIAL9iRPLw6ymkO/nn+ZgtrRcQTWo3Q7d60elmWpstZU1ZcHVV8mfdVpCaHeuZ
         pSTSLOVmjCEvZ5QMnBxTbE9Ca5skmJzZjvSJNA2+bMj8ChPKr05FJS8b7DZlh1bRwC4E
         wLyNTqDS5M2kkgQgr0H3sRREdAv8P1jfC+Lyj5+85YIZ17+v3iTV5tXztT8yirJta59R
         aqEzmAv9DVlvYfnMXuT5UZhwUoGUmBPSPe9CBgyPo4ABfnlC6/UNzWn3Q96D4yQHeRW1
         YQ1Uyiq4qwd36tnBagcj954vsK5Om/1W+Bvqmicf/8/QN+g3dml823coIOF0Rjk8iBdb
         asuw==
X-Forwarded-Encrypted: i=1; AJvYcCUFiVYd8F1O2kfivUh6bjjPx7qoG3a7FfzfimcEaWrDg8br/LCiseIev0j9svbeCsbPtGQkH+MLEpFrKw==@linaro.org
X-Gm-Message-State: AOJu0Yxyo+5xWIIP1n6/9BqHJ7WKbxLrNKCIyZv/gBpyhO9zgf+VK/8F
	XSnQDhlrq0NQXas7j9irKQtsEybUzUDeW9fFZp3pfP4pHRAkIK3csM6SPNKxYAZnveZ9QFiPxTx
	NTLVukg==
X-Gm-Gg: ASbGncupsREmUZburrXSiAU1RFYWayIrnPnEbWdAS92KEAQxtHY9mAOxJT4zbSMgxNQ
	VdUPYn2EJVeqgQvFP/bziWq2GZ9nvAYrNworaHrcFTqQZadGtEYtp21W3rIdfgIJq+U7jpaBPoK
	mAYUWtzf/+5hveVDN8GPZUJhJAxaYTKZ2fXi5peSdE+NL0DWtHVcuoc2fkh1on+ByJwQvSi+1vk
	0oPQtz1+kk8XbLHAb5TNGyazhlfrrOSupZfEsJczF8iVX4wta/8aGiG8EhgkDK6dOZjXYAnZGJL
	y+HyxgOvSCH7Chwye4oWAa1k2EW5OlRye0ucjw==
X-Google-Smtp-Source: AGHT+IHtfv3AgFRPA/Z4nGd/02LXDA5unPV1rqAH+s3uLxvX8l8my9NTuMs9OvgeIF19J9SlWPp1VA==
X-Received: by 2002:a5d:5f91:0:b0:386:4a16:dadb with SMTP id ffacd0b85a97d-38bec4fb615mr21269638f8f.11.1737485700983;
        Tue, 21 Jan 2025 10:55:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046b0f5sm191676075e9.39.2025.01.21.10.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:55:00 -0800 (PST)
Message-ID: <844aeeb1-2f23-421b-bd11-18a98f733e1f@linaro.org>
Date: Tue, 21 Jan 2025 19:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] target/microblaze: Prefer cached CpuClass over
 CPU_GET_CLASS() macro
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-11-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250121114056.53949-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ssHHvKFuNUgK

On 21/1/25 12:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/microblaze/gdbstub.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
> index 09d74e164d0..8b08ed5cb49 100644
> --- a/target/microblaze/gdbstub.c
> +++ b/target/microblaze/gdbstub.c
> @@ -110,11 +110,10 @@ int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *mem_buf, int n)
>   
>   int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>   {
> -    CPUClass *cc = CPU_GET_CLASS(cs);
>       CPUMBState *env = cpu_env(cs);
>       uint32_t tmp;
>   
> -    if (n > cc->gdb_num_core_regs) {
> +    if (n > cs->cc->gdb_num_core_regs) {
>           return 0;
>       }

Apparently gdb_write_register() deals with that, so we can remove.
