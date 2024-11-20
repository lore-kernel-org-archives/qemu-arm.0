Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3932489njc;
        Wed, 20 Nov 2024 05:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwxQrnUVBPJMnbIlyFvT2L3/1CQ1wYsf7FJ7l5d0he2hOhaP9bl6drFJ9ClV97C1ppbFUxZM7OHkkl+w==@linaro.org
X-Google-Smtp-Source: AGHT+IGkeEdFm8ZQ0WKSVZlADFoAy7nNkpGqVfmv495nQJEi2Pvf8pb01z4FSldD93H0LY0IIIEC
X-Received: by 2002:a05:620a:46ab:b0:7b1:19f4:c6e0 with SMTP id af79cd13be357-7b42ee82f67mr274840285a.51.1732108473154;
        Wed, 20 Nov 2024 05:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732108473; cv=none;
        d=google.com; s=arc-20240605;
        b=ViPV9aBAeSpCHA2OP6cbZacHebzDODQsDfjEfUu/pBBBABp9B+OTiPpxpdN+kLtKT4
         yUSco+8x2aSbkZUpkReu8hT9Yl8Eh/bRY3cGvW9AJOMoUhkvURe2MPZvkRU3v8i8PGXg
         nQowIm2bkf4WCjdJA5+Rx3cIxyPEKiA9L6Ne/Y4W9smvsdG5mseH3GP5rg3Z8pSySoJm
         6cjdw2e0SOOsxvsuUmVsAtgqPRF4OHzAVaShhkDLCb3x3Uk92PmoP5W6ND8wo5MtwEjn
         rO2ntro5NA9NeHdxCow2cXHv7EPBrB+M5NWz7WS98AAD3lFPOSNkmBtqDWx8vCkvJCXE
         4JUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eC9lggUC6qfyEGbLNEAp7diuvO0tVr8dq7kz+aSp/xU=;
        fh=4m9TvaNEUrsodZ22ElS/+PtLozKsn/Ezzfj3y2YQhDA=;
        b=ZATsq4/k/NjUpMqxZMDoZeGAdbw8/QMDGsFubuyAWAtWo26dDk/9r3k2zMkkBl6kDo
         jkFneLG4B2k2rF43mjnlKkSdQkmxtD3Yyae9+CBiEIOU7CCzON+9M7cW0FyCvCyWLnjO
         CJq23J49JngjOXVpazf/by77OZ+bRS/A2MrBmeDpHsytq0Ur3Xgtp6gkUf9zWUioO+LZ
         xiqhK/7HAsVYhknfY1JqgFN6vWgv9Nu4nj9TUBJ4eu2ylDxgIVefbsRW7CEstKIcJJIz
         5Pmx7Dh/G1od05IuYC0qPL0RVb0j54Y3wiqpr9uzfYd06h4clptb5zYxGEjb+dk1z57/
         0ivQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUnf5J8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b4852ce2a1si158817385a.624.2024.11.20.05.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2024 05:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUnf5J8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDkX0-0007pT-2r; Wed, 20 Nov 2024 08:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tDkWv-0007oo-2k
 for qemu-arm@nongnu.org; Wed, 20 Nov 2024 08:14:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tDkWt-000624-7p
 for qemu-arm@nongnu.org; Wed, 20 Nov 2024 08:14:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38231f84dccso1574379f8f.1
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2024 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732108436; x=1732713236; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eC9lggUC6qfyEGbLNEAp7diuvO0tVr8dq7kz+aSp/xU=;
 b=HUnf5J8uXNMKZiZNS31G3DnqC+58I9HuxhdsfSniRWjYIw/lNeg9pM8nQ3oVYLFWsT
 7xbUZ0mAX1DtFGPmLTOfYvBm3DRevoRo6yn8YsIEJ6hEr6f3dpXhm5yXMY+JamL8kYhu
 vi4a4s4DvZ5IKmTtgSVkReyd1wt7z9i0s9xUzrcxH3Ts11Mg4EiDw5SMLsFy3rPBcrr3
 1jmwv6BoDAUROmSKG1RI9J4nD2IYfMYMClJN0gXwV+prFR9Ts8CIVHHs6YrA9jgA7Rk9
 K+PCL5H8uGMxjcJNMVRUgjvVRCChr4RUHWQ8Se6U9sjWsOiHz3+/uOxHZ0kb+U3phcvE
 fuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732108436; x=1732713236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eC9lggUC6qfyEGbLNEAp7diuvO0tVr8dq7kz+aSp/xU=;
 b=VCMmCO25fRk97xjvLqPKqM0WKKeVXuuPFQFS+nJ99bJ7G0TCVYf/wOyshZ1L9hrnuo
 NVSJxic223OJCPDqvy9hkYRtH1xXV7gPB4KzhN5QwGhoWnxWpyEqKqDEwx+PDLL5iKfg
 1hQK5QoOATQiwWGwIfeyIBbN3Hi48Bw/wV1gOBLvSC/Ayt1n0XVT2c7haJmTM24S19RF
 aKHg5FJMW2Pe290z6hCIdinlzyj+IEQ0ovyfy+BdUCKIC620JyY6GhiaXiKJDKMkT1Mx
 nenRuOlYjbDPx3p9lLlT7NoTJX/m1D/diPaZPNmo2BNigDfGSkHG561fxUE+s6niVOna
 kcQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVReXMxOS55knDueunkMayGeM9ONS6kDFX07laBp0Xy5dHwzN0fDZiA0cO9E3mQsnYlEan6dJ8xZQ==@nongnu.org
X-Gm-Message-State: AOJu0YxhDO+xT/LwkTCJSHDbt9Oz4RjO60Mu7pNbvjPbx06HaleC8tmL
 xx+vO3GQNU20H7GmgrX7inAVsldCy1eNFEVcdsrLYK+8PdwgJ7njRvXUfE19FRI=
X-Gm-Gg: ASbGncvLI7DrMA5UtoW/jkuFyyaqNj8fOpZH8LoyFpWyiup5lzbdAtGM4ThPbA0LnZ3
 BqEQH7Ab+6WdL/F+8WJQsoEGwgb+kIXYZGjXs8hQRP/RYwxog2KE7juasc5VwCZW6kkxw5t0G+s
 rcpwPmoINThPcnLGl6iV2E2Jo36ACPJtX2FS8eHIbvl9PsHvkS0XSnzOia2vXJ17BI78SOklEkt
 1o/AQBiNGJpY8PsbacIrZD48I8t90owsczqY/lb5VZd8DuPIBELn4jvajUHwM2Z
X-Received: by 2002:a5d:6c63:0:b0:382:2492:3218 with SMTP id
 ffacd0b85a97d-38254b17467mr2036678f8f.47.1732108436476; 
 Wed, 20 Nov 2024 05:13:56 -0800 (PST)
Received: from [192.168.69.197] ([176.187.208.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825493ea20sm2039709f8f.93.2024.11.20.05.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 05:13:55 -0800 (PST)
Message-ID: <bcf9176b-b1c3-4b31-ba09-c1be7900c79d@linaro.org>
Date: Wed, 20 Nov 2024 14:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/arm/armv7m: Expose and access System Control Space
 as little endian
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Tony Nguyen <tony.nguyen@bt.com>
References: <20240924191932.49386-1-philmd@linaro.org>
 <CAFEAcA-X+BUGcq0EGOC05DWqjNd+WSs_Ufqv8=gpRfF0uAmUYg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-X+BUGcq0EGOC05DWqjNd+WSs_Ufqv8=gpRfF0uAmUYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: Dhvse0xRVel8

On 25/9/24 13:04, Peter Maydell wrote:
> On Tue, 24 Sept 2024 at 20:19, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Per the Armv7-M Architecture Reference Manual (ARM DDI 0403E):
>>
>>    The System Control Space (SCS, address range 0xE000E000 to
>>    0xE000EFFF) is a memory-mapped 4KB address space that provides
>>    32-bit registers for configuration, status reporting and control.
>>    All accesses to the SCS are little endian.
>>
>> Expose the region as a little-endian one and force dispatched
>> accesses to also be in little endianness.
>>
>> Fixes: d5d680cacc ("memory: Access MemoryRegion with endianness")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> What's the rationale for this change? All Arm system emulator
> builds are TARGET_LITTLE_ENDIAN, so MO_TE and MO_LE have
> identical behaviour, as do DEVICE_LITTLE_ENDIAN and
> DEVICE_TARGET_ENDIAN.

When building a single heterogeneous binary, all device
models can be built. We want to remove MO_TE, either
using the proper endianness (like in this case) or use
both, one MemoryRegionOps per endianness, letting the
machine picking up the proper one.

I'll reword the description to be clearer.

Regards,

Phil.

