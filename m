Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2475319njb;
        Fri, 16 May 2025 04:50:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDR9QQiWR4C4GnLZ351HkmaFlIjInzQOeQ1J7+MeKu3TtgFOriDIikS3DlUN5IQHNFaVnxJP9z5kT/VA==@linaro.org
X-Google-Smtp-Source: AGHT+IGj9WqBPscYVWzRJQrHpSj4dFgQuFjkKQcG67MNSztPVP4o7L9LTxlJJx7HditYbCRe1MHj
X-Received: by 2002:a05:6214:2a8e:b0:6f8:afad:4fde with SMTP id 6a1803df08f44-6f8b2cec4a0mr38616606d6.11.1747396241061;
        Fri, 16 May 2025 04:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747396241; cv=none;
        d=google.com; s=arc-20240605;
        b=Xv5xUnHVIzObiDFa/dAc3R88bHNKhHqfWioCHsZ2HmiSs/Q7M0EaUnEZNLKOB2FPh9
         1g4jtwJgdTgMm6tVgFxvCz7QOIeBj4yhN1mYzZoNmYloVMFx7/lzUGUAFdjuCekIbRHk
         T2y8EBoOGAx2BDiY4aoEq9xdTzs+54SzjcM3HrOyyHJ7Sd4YmUj7bMhdmpasYUN6yIKq
         LUah6gV10wDNVOdU7e3CBRMO+tneGrLHafB1SWi37PzIM/h8xNJWyddpGzH3QHcJMhFO
         oooGgRjEb7bofkn9oygFL5MGA9xCpjZRZABpOXdnaN7frIafgrFlJbMPeJKdHaMXZMYY
         yUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0A9MS1vmxv0EzmUdbLkMsjsRwI+NwrQUgv8MqvSU02k=;
        fh=g+q619PJpu1TgrhOAJwt9TV55stXH5BK+KmJz2PV+rA=;
        b=kNf6+/L0liaKdr+5ih5XOpmHCor/qDGXMpq9jSrTo1S8feWVBFuAJ90jIewMmshOOP
         n8vMl4Q43n3fST0K14PJLJ40jrEkl7XPSLMrlltKM4Gh+W9A9rEhEvdqkxXRLtgsVYdG
         EqqX7DKIEqAoMlxhY+1M+Sh8L8uhSDFl6otptw4gxbDiyIr7rO/a51WaQmGb0F5b5yHw
         avr+zOh4SqOR3JKbzCo5JUF83kF4dhJsxzp+5ZtPe7XBKhXg20ynp7hZZmmF9rkJtdWV
         nBnEVujcajDsRSbuZEqlPA5dOMOKvU+456PPGMAn+0rhnzrTN1wN3I6ja7Hut0+PhLkm
         3smg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tj2Q6+UT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b08b82a2si21919916d6.128.2025.05.16.04.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 May 2025 04:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tj2Q6+UT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFtZw-0004qu-QE; Fri, 16 May 2025 07:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFtZr-0004oE-02
 for qemu-arm@nongnu.org; Fri, 16 May 2025 07:50:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFtZo-0002G2-R0
 for qemu-arm@nongnu.org; Fri, 16 May 2025 07:50:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so13509575e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 May 2025 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747396206; x=1748001006; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0A9MS1vmxv0EzmUdbLkMsjsRwI+NwrQUgv8MqvSU02k=;
 b=Tj2Q6+UT+t/fopg864QNXZWYMbbWwoBecqzZfbrwC+xiNwTxs2+2xxPwZpfYPmYX49
 DuofY5XK2ZCaGfUc0RiZNBmPo+XcNPI3qq/Qe6B6ISmRFxEAcmcfPLEPBaC7DeT4AkoI
 jLKGf+Y100ykrYY+yT/3Qbkht55onYrJ451aJawsaDnQPtsloQwD6rFtL/kM/0owhCIc
 DT+3bfII9z50v3BLKcB2P1c2MXYqb87DeLl5tt9RIjZkPINg+1lXjtagR1FbkcVCI3Fj
 4oW8uzrVLOsHHhh7LjWbmA55TIg4OFDxLJnZu6Wt14XTIfrgyA9t4oPetgchzvWOEhxA
 ZyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747396206; x=1748001006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0A9MS1vmxv0EzmUdbLkMsjsRwI+NwrQUgv8MqvSU02k=;
 b=eYxEq45QGGfQ/h1hEj587phIyMyFdpjfkcktCINOsxpxJvKkGtK1mjUoCu7IYEdq2P
 6E7/TXk8EZMRSWV4MxVll+St6u9LBYgC9eGLiaMhx1gRHEK2zPoiacneoDNlcj5U7NvT
 ptbdUT15+7wm1nmpkaFZAczKmnv9PlFT9xUUbPJFAKXtGDXS+D8kmadorn/Z5nlL//jx
 zrBoL9SYVKYIq0VnFcADtgLERoXqVquLVOpV6MpEvibMVGNrnwXRFcXSC4LNqBAYuSlQ
 kv0x3++4rK+Av3ARIcwW2cBQxQjBUAE14JgGIlu2AD8Adbzbx9ebm8wokPlsYrLh/f4c
 BjxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf6jDeE08OnxD0DCUrYYMF2+JoAvvt7L1KiR/5cD2f1ktTawVyYBr0JfP4vG82BgaGdQGHaNPMWg==@nongnu.org
X-Gm-Message-State: AOJu0YzavZ/nP9Vf8Hp8NHeUspDMPvzoNt4CwfOdoVPHH5GSMNBHGfyO
 BERDgaymLrFOV+SbdmjF9zLX6zqegutp5lqqNxa2xueuZGzValTMVAdHP97NX6qc/aE=
X-Gm-Gg: ASbGncu4iDbJ39hqMZtJRsdfJVN49qV/AY6KmmMR1JBANSefX516zZRNbhulVgWjmKV
 0FjVevdNLaYKfLfHsKfTWISA7dZbRkhIloY1PKNBgr2wjAmhqePbKEJGPm5R+XR2LmvZ8Mp+vtm
 9x2wnsFxuSoPZMJ/x9eDwfeZZM56x+J+cWjTlazYbxSL7yaGpJN1EPburKZPQFkmoOpTSDPH1S1
 pJhNEulK55h0v3JchepPUg4Ze76pgvK1pHiPqeg/EfRP+2MKPdHAXSVpYLb5XENJSpQOn+h5Kco
 EeqoFwc0bMLKMbmqZeCozOPEZtKGy+wtBBkC3Ft7ETifctuVMOtExSgr/KlWo/z4qteY498vTnz
 xzwew84je22aVutLvX+/2cEw=
X-Received: by 2002:a05:600c:1c28:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-442fd60b66emr30395985e9.4.1747396206121; 
 Fri, 16 May 2025 04:50:06 -0700 (PDT)
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3368fbasm103084755e9.2.2025.05.16.04.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 04:50:05 -0700 (PDT)
Message-ID: <4feacbca-76fe-42cd-a8f6-9daf70f2b437@linaro.org>
Date: Fri, 16 May 2025 12:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 34/46] hw/intc/aspeed: Add Support for AST2700 INTCIO
 Controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250309135130.545764-1-clg@redhat.com>
 <20250309135130.545764-35-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250309135130.545764-35-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z11b11aCDJ17

On 9/3/25 14:51, Cédric Le Goater wrote:
> From: Jamin Lin <jamin_lin@aspeedtech.com>
> 
> Introduce a new ast2700 INTCIO class to support AST2700 INTCIO.
> Added new register definitions for INTCIO, including enable and status
> registers for IRQs GICINT192 through GICINT197.
> Created a dedicated IRQ array for INTCIO, supporting six input pins and six
> output pins, aligning with the newly defined registers.
> Implemented "aspeed_intcio_read" and "aspeed_intcio_write" to handle
> INTCIO-specific register access.


> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-18-jamin_lin@aspeedtech.com
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   include/hw/intc/aspeed_intc.h |   1 +
>   hw/intc/aspeed_intc.c         | 112 ++++++++++++++++++++++++++++++++++
>   2 files changed, 113 insertions(+)


> +static uint64_t aspeed_intcio_read(void *opaque, hwaddr offset,
> +                                   unsigned int size)
> +{
> +    AspeedINTCState *s = ASPEED_INTC(opaque);
> +    const char *name = object_get_typename(OBJECT(s));
> +    uint32_t reg = offset >> 2;
> +    uint32_t value = 0;
> +
> +    value = s->regs[reg];
> +    trace_aspeed_intc_read(name, offset, size, value);
> +
> +    return value;
> +}

> +static const MemoryRegionOps aspeed_intcio_ops = {
> +    .read = aspeed_intcio_read,
> +    .write = aspeed_intcio_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    }

Could be safer to also add .impl.min_access_size = 4.

> +};
