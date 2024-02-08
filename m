Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp291302ejb;
        Thu, 8 Feb 2024 10:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/T0lG6zY7POiTqTL/mS0po/oqga8gUIjsbCVLROoCdXC7J1H9S/QBL/U/IsTqq+s2Bt8kkFcgDEzWOtglxvBlIHYunFV3
X-Google-Smtp-Source: AGHT+IEv8kSC78ToDYx9KxJ0bBCyxA6bUdLEMnPq8CeF+j3g3/qPxtstnga5diHtvx9qUnIre7Mo
X-Received: by 2002:a05:622a:1a0b:b0:42c:5225:d4b1 with SMTP id f11-20020a05622a1a0b00b0042c5225d4b1mr1686784qtb.45.1707416399642;
        Thu, 08 Feb 2024 10:19:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707416399; cv=none;
        d=google.com; s=arc-20160816;
        b=1LVcAtzREA5c+uqdsnLHNYJUiTIUHTfmLTM6QSA2Xd2Ij2MErCy0VNMErKDDoi4pJ/
         282xBecEnu57mpmZ6XQ9mEx7x+S+Pgv9CVA8L58mQ6ro/ORAxap69TsYJqzB8+/vki+8
         fv/5a0lAG0TQXy17fPI6NWTibZGokRKlIzHqlZvTfPL6IltrV9E9T6TFWuHCeLBMhulZ
         sxGxSNYhNZPiLjl/uQjfjZBPtsoYSaqSr7tURqeNePjVz1H8MnZEWUuX1UTaUo+R2XBn
         FB+BVcYlsRN3j+epGrOiQIQ+wqCcBxG/QdC/4bvTo3sMFaGakxd50ImwUw33LHC1yZ6w
         0Q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/tGKZ+9GqeHeKeSY3rv7u4L9hfS3bK51O0nLGVHwjA4=;
        fh=fZOiOfT8TQCIqNjb1stf2yOjIeOgYkptSBGGB6t38PI=;
        b=mZug0mjExxv5tr2CjiXsYkGMLH8pKHVZwVb2OYCWeEz6xyWIOMgRI9MvlD6GjAUJom
         3mcD2oqX+pGiccOoh3a+kfzrjY25gEOOOxSkWjvOFCcEf74Ewaxw2oElOEF5D0rgOcRQ
         2Ku3Q/YYd+0qpsy5qhWC1l0/e5U/0EJfwXCDeYNHdD0PXdsMbY/hMrj7FD8W1U4aJ/RG
         vBh31kXUA24dEo4FrpKihnmFlUpy5ifAiqfS8KLH6WnRHcgir5qjNEj507epB7VsH8g9
         fRIHV+FR0WSwfEJ12rkzDvq4jiYZwgAWNtrzGYmx6y9o3FHZzM3I2Rox6ELUnyjvjXPQ
         jCsQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ywVuU0VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCX2S3TuinBj5chW5UhcLns5Q56TBKf9TBBCPWEBKpqp8bC+Mw96SeIrkyAcDWvbGEQZcOw+rF1GTD5VDJkGSrtPliK7p/Vk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a05622a054800b0042c4722aefasi539319qtx.555.2024.02.08.10.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 10:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ywVuU0VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY8zx-0006Rf-CC; Thu, 08 Feb 2024 13:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY8zv-0006RJ-EW
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 13:19:43 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY8zt-0007g7-TT
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 13:19:43 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-511717231bfso98936e87.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 10:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707416380; x=1708021180; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/tGKZ+9GqeHeKeSY3rv7u4L9hfS3bK51O0nLGVHwjA4=;
 b=ywVuU0VHUZvqamkpXfkcutOhoZJiHbr4ltgawq1BHxsJWV5GeQ+C/+M2pcyf1c0yIX
 NdTj74Ed6+DxndKlQPH7e5KgWPewos/sEGzIHbp24WdfEAw0S8G+B2PPkqGPzg8bPcf5
 yLm09uXcccx8DCaUfkaUGcDsLjlAl9xB4tJxjF8JY1MMkw5wN37s2u4zCvitMMRHu/zL
 8NSlK8EhqlC2cRtV/1vqctwub3Jn6CnyAsLfc/B3T4CefT7jsFaRO0sQLFT3mAeUdkOm
 IdlGrshEnZjwdyKyHIg1rSMCi616NSS6faPNJmYFyV3qodGVt2YVVHxa8QV47PvDpjH2
 48gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707416380; x=1708021180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/tGKZ+9GqeHeKeSY3rv7u4L9hfS3bK51O0nLGVHwjA4=;
 b=lEPf2qdQ1/omKvA30nO/0OvEXhVtYk3T+Sbgbw6JtF+xa0p9Opxk7NmYe1tBK4k6rD
 Aeoo2dDQpT7cc1lanOD26YEa3V0QZ6hkL9c+YAZtD4k4+pmrkI2HSpwx3McIaj18xOCn
 J4F4SMxl0BG3KVN/DaksPySswDRYnwSn49gW6K3eEun4TDP/yWS+/cPcb86qTyC0UdxY
 ve9NXTgWEWXDf610YZPxpsyvxLSX/rNRz6T30UwW/Nie1JaiMpJctnp7RF5EjTzCSeau
 l2hEagGiqMC6YpfryVNn31g23FKCeJT5mDhoyv6e7b4ARaifZzjktXNmCJ+HHXk0RqQw
 6iow==
X-Gm-Message-State: AOJu0Ywoj7phixY/4ciLIzDlr+5WZImnrtf6630mk5yfiUleoaexqUyk
 Hs4guF9DfM+TksLNw23fIDStatHYzrWTt9a/Q2QqExmW6TC32LcRMulrpgEoRtw=
X-Received: by 2002:a05:6512:3d8b:b0:511:4b60:a5bf with SMTP id
 k11-20020a0565123d8b00b005114b60a5bfmr30168lfv.7.1707416380066; 
 Thu, 08 Feb 2024 10:19:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiGphnv/9+bz7wiAS1srwPfWBrRMMvsBMThHyXYedWd9GPfa3ptdo5J/Iz8xusR1GE9zKB5XnVVfeWrntQ8AOBcoGcyH88yzyY0e3dv6CX4/6RUaQm2jEZPtMs8ptFBDAt4GyRSGubyPh+8w5idU7QOuz66ZVQccSgE0rZkb5jd1LojA==
Received: from [192.168.69.100] ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b0040ffd94cd27sm51247wmq.45.2024.02.08.10.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 10:19:39 -0800 (PST)
Message-ID: <86b28c33-4412-4832-a7d7-b5938d945066@linaro.org>
Date: Thu, 8 Feb 2024 19:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/arm/mps3r: Initial skeleton for mps3-an536 board
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-9-peter.maydell@linaro.org>
 <b8fbf313-1b24-4cf3-b5c1-f9289b413a75@linaro.org>
 <CAFEAcA8UqeGKf8pP90i6Jn=AYgqtzFw141ptir=5BEZtpwjD2Q@mail.gmail.com>
 <17a2931a-5b3e-4eed-ae63-63b14032db6f@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <17a2931a-5b3e-4eed-ae63-63b14032db6f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6Zqmqjh0ti3J

On 8/2/24 18:07, Cédric Le Goater wrote:
> 
>>>> +/*
>>>> + * The MPS3 DDR is 3GiB, but on a 32-bit host QEMU doesn't permit
>>>> + * emulation of that much guest RAM, so artificially make it smaller.
>>>> + */
>>>> +#if HOST_LONG_BITS == 32
>>>> +#define MPS3_DDR_SIZE (1 * GiB)
>>>> +#else
>>>> +#define MPS3_DDR_SIZE (3 * GiB)
>>>> +#endif
>>>
>>> Generically, can we migrate a VM started on a 32-bit host to a 64-bit
>>> one?
>>
>> I think it's one of those things that in theory is supposed
>> to be possible and in practice nobody tests so it might well
>> not work. At any rate, this is the same thing we do already
>> in mps2-tz.c for the 2GB DRAM those boards have.
> 
> We could have a common helper may be. Aspeed does:
> 
>    /* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
>    #if HOST_LONG_BITS == 32
>    #define ASPEED_RAM_SIZE(sz) MIN((sz), 1 * GiB)
>    #else
>    #define ASPEED_RAM_SIZE(sz) (sz)
>    #endif

Or deprecate system emulation on 32-bit hosts.

