Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp564859njc;
        Sun, 9 Mar 2025 05:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpD4kecF1E7dRyThpdMDMmK+i5x9E7F/FgV3CeYTGQcrCp8WSA5cXdyjNb59/ig6+jZuu2NbAnVja3+g==@linaro.org
X-Google-Smtp-Source: AGHT+IHiZhdYDjaazICUSM0NKx2fcbLIII36aFTRNHd/w+Rk1hACiuK0KeD/JZWyPAqlilnC3eyj
X-Received: by 2002:a05:6214:2487:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6e90067e17fmr165689786d6.34.1741522655111;
        Sun, 09 Mar 2025 05:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741522655; cv=none;
        d=google.com; s=arc-20240605;
        b=bVk4AXkraqTwandXAgRrvnIuDPtkVGT6KW53WABmvXvQiXXHNmrRW76A/5Yj6HTLvb
         fVBDPgIrPFUM94qjESTiXb37c47qOd/wGc+2+mFfly7+Xx/wBqFMd7zqco31K9OSoBtc
         E91t0R/GTB6EOh1UAxNqW5DWfS1F4tPmh0H/qTFY5kCRIweljGpz9tl2Y0exaZry35uJ
         ETvvT24Ld1X+IVjRHmy5+jCsjTXRQI/I86p/UNPOHDcZK9T4OgKei5FVi4ByrN76B6HP
         d/AuSvrUcx0TPBoyxXouO+RGwQulN9aoPFmSWMK3tL9hF4ZJMwFAsCYPO9DqaVZdi6yD
         ix9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=r36St+rnaojSkYk5+iSomygtCQfeEMh2+rNy1K3V6bc=;
        fh=1aHSHfoyqTNPQPF2mdJkq7sL5WCyMrwstHu3fcSYCbA=;
        b=DyahcoapJG2CVJnz/BsR1xXag0YlSYlzoNIgl4exG6ghHw51vfkywUBjtBj7YUJJp9
         mtsns4UVZjjhlYFyv8CnqTeuWGrkvJnRKMzCaf/dY9SjAGFzqFnhuCiKgO8ikkduUlfo
         2gPoxDuOJ66fgG5gLUdy08/MxsvwQ6oCCZ+Ziw9PBqHRe/f+bQBRRctVT5IopJc7qrxz
         Q/yRi98v0lWPTxPwTu8KSP1iVGfUvTDeksPGMG+m4IPzCzcSWSwDmaz2/Ne09tF/t6su
         L5JQpcG3HBwCR7X7tUBEqJl9iC7XVAb35efA7yfEBaK2Jw29iJaQ05Njf3D8EDfoCaql
         ZtIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t7FlIhEr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7173d0esi71757926d6.280.2025.03.09.05.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 05:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t7FlIhEr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trFaU-0006ih-5L; Sun, 09 Mar 2025 08:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trFaO-0006hM-Fn
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 08:16:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trFaL-0001MG-2Q
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 08:16:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso19240845e9.2
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741522607; x=1742127407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r36St+rnaojSkYk5+iSomygtCQfeEMh2+rNy1K3V6bc=;
 b=t7FlIhErAvsvD3ibAKyzbD3ry8aHZ5KZkiErj3o9Ot+RbUMB+NrFJ6GydqAVspo38A
 qGrqGbqQXpxvakigVh3M1SPjIB5tVV2h+v4JYIS+s3hQT+KuUPg7SMy2PEoBRZfrQ6uw
 JCA39WbOs/GU8gFSIU3BqFmYr33pyEAi/IIMSjkveKjkd2RpcnGWtNWXmqiyOr1KzYNq
 VolFk7HjffTr/xR9f9vS1hzZZjd+zr8ccySlrxMwqmiiYgYDU8FztalZP9wligUaB9zi
 +WwjqsBpaTk78giSJyTOxmllsnay+uHlVjLDUmx9CEBA3A0dWVeADQRRuQ21W9Sn8cZi
 mPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741522607; x=1742127407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r36St+rnaojSkYk5+iSomygtCQfeEMh2+rNy1K3V6bc=;
 b=Oh+bizoquKIc9mCGXsg1iU0hdJLJsiWTOFEzz4Zvqg7lzZOVOmxcooozl/M7cD2enG
 0jAXfgdcvLCV8LQ2+a6a+dGR4JKSFpGVq6YDopXVRMj33/GuJ+ZY2ZTkaBTG9QoyxDwV
 uCY4nK1gtC8YaCZu6BkXe+Ob5okY9YLEk8QmeVcjovbmhgm2VK/mgao7JA6/RkVn8n88
 KENKCvy2VsRiJWB08qRHawxLgHEO5ggIaPyoKJSvHB75DpNq9kvbBjEzh2k2uO1hKTKQ
 K5boBWexoOIWvq73RCKSNJNQKsMO0YwssG9U6s3dNPCaw1htZ0JVB3CurOcPdJQ90ERO
 imCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd5TnvDvBSUGSa29Q5dSwaknVHf4o7kVNXLFrPcIhVqIptbvDWXm3zBcQIDEcOkWZmkQ7gMV1Dkg==@nongnu.org
X-Gm-Message-State: AOJu0Yz3Emrs8m9GQimus7h3FORpy8OteWuoVYhYTfIdedcmweVJvEGL
 tzh7zJt+YRCRUYPJigE0EFX1TpBwkiizESp6x0q6DJJPwv17TQIUIHkUoge7y12khpWay2VgQmj
 BixU=
X-Gm-Gg: ASbGnctCxJ8ZXNuqcLUBgBhjV/AxOKBNKcOB2UXqTT5s5nhlbDKP4nZHvVndkQU8JQE
 vDDdySb0ogQpRkjx2aJx0Ml1nxqKRQd+bChZ7g6NNipshHFQvNsDWDk900HLWDWg7qxNL5dzDCE
 azACtx6XB3XkjhSx6P1aRZqk2HQIabIuhfpWpXdoHDF/C7N8Guhwqqsl2GSldnnIDN8Wv0oKRI7
 fXI1zBpQvvD4MPkl3uVT1LhMUzHofabCNJ4WMQXGijy9U9AgTTaHwIcnTXROe77A/A8tS6ThzZx
 OwCvLmDokeIJe8KqZ82G/rvG8RDxGvg7qK/wPgeASpn4rfeul0Ak5YdgrQ9VOWdW7Od3Iy+jHqu
 OatzuXc6+iB7u
X-Received: by 2002:a05:600c:3b1e:b0:43b:c965:954d with SMTP id
 5b1f17b1804b1-43c5a5e92f3mr53387315e9.1.1741522607104; 
 Sun, 09 Mar 2025 05:16:47 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c56esm149167225e9.8.2025.03.09.05.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 05:16:46 -0700 (PDT)
Message-ID: <9d032d3b-7929-4a7f-b5a7-5338a0fc16cd@linaro.org>
Date: Sun, 9 Mar 2025 13:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] hw/sd/sdhci: Implement Freescale eSDHC as
 TYPE_FSL_ESDHC
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-14-philmd@linaro.org>
 <9eb8f1a0-75c0-526a-869c-53d01551c97b@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9eb8f1a0-75c0-526a-869c-53d01551c97b@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: rYM1u1ntDXTV

On 9/3/25 12:04, BALATON Zoltan wrote:
> On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
>> Per the MPC8569E reference manual, its SDHC I/O range is 4KiB
>> wide, mapped in big endian order, and it only accepts 32-bit
>> aligned access. Set the default register reset values.
>>
>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> include/hw/sd/sdhci.h |  2 ++
>> hw/sd/sdhci.c         | 37 ++++++++++++++++++++++++++++++++++++-
>> 2 files changed, 38 insertions(+), 1 deletion(-)


>> -/* --- qdev i.MX eSDHC --- */
>> +/* --- Freescale eSDHC (MPC8569ERM Rev.2 from 06/2011) --- */
>> +
>> +static const MemoryRegionOps fsl_esdhc_mmio_ops = {
>> +    .read = sdhci_read,
>> +    .write = sdhci_write,
>> +    .valid = {
>> +        .min_access_size = 4,
> 
> Does this need max access too? Maybe it could work with 8 and likely 
> nothing would try to access more than 4 so probably does not matter.

Per the reference manual (chapter 16):

   All eSDHC registers must be accessed as aligned 4-byte quantities.
   Accesses to the eSDHC registers that are less than 4-bytes are not
   supported.

There is no precision on max_access_size.

> Regards,
> BALATON Zoltan

