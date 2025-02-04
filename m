Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp432039njb;
        Tue, 4 Feb 2025 11:11:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWl0SPzqoLfEa4fszmd/uiy1k38smTTnonwnkTxpHY+uVTPiY0PJGHQ/dW/roOtOCUZu25INJ5JgT+iqA==@linaro.org
X-Google-Smtp-Source: AGHT+IHoqSefITFqP6RH3+riNimcwzMbGtaMTY5DM8KGsHZbBhn+rUw5XH9NTEbTfTU+2gK9z8Vn
X-Received: by 2002:a05:620a:2695:b0:7b1:e0f:bf9b with SMTP id af79cd13be357-7bffcd8d902mr4183998185a.45.1738696293423;
        Tue, 04 Feb 2025 11:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738696293; cv=none;
        d=google.com; s=arc-20240605;
        b=Yki+zLVC2DzrQ+hqG65cCBwSGkZQc9qFWcRb7+a5AEPM179IEqmz2fwngZ3GKr1fmd
         CFPM3z9tS05MwkzZcAhno2RMiNYywtDD0/jAIYbtCgC8Nc0PlGFQDrx4uDu/xmSC6SRO
         Ie29aDsk5tyVrxntNI0NSLgq83c0EFAcTJwdKJD/QqHmx5K6bvcZWLz1RzNNDrLTEHxy
         dW+7p2bXPCR2WW06C9g/VcIkuY/RNswRY3BMx/yKdI3RAb9y5e4lJ6HAcyBKtOW7s0Jf
         GnO0N8yY5CYTs1NHg79D7bZh+vkCQ0N2ogvz4wH94V8Cv04F8xzdge/ouOob/PkuhQuF
         sOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Eqgr5shpCO/hEIaKEyQKSGNXhXaBTHRJwfrnUc+Ak0A=;
        fh=5cnSY3sikcGKFJBF8lSo6pIWjab56Bkf6VR5bMQc+1E=;
        b=iUL7l8QHEaBlDlN/I4GBuKS2sKpstQNuaViViEvUK6oh+S+OyF4p8i/J6+B6h5oueN
         ambhQ7b8WW/X10cJxuJ3Oz1tt+TnHzohpDPrydVFnNPq9g6MlO7BTSoLpuiWgNpmIPKH
         OHLcYuZFPcIi1HrdI6yAdnPGnoGGvmUT9udt1xoVveu5wldYi4Xn209F48Qvi44knjhT
         CeKQfnHmHXaSYXqVbgO1TbkAiAecXi2KGTJ2kmhPOGbeFEIbya+Z26Z5JDGdKEZQymcW
         MfVsb+mGvK+ZYW/iFxKkKS5+5GR6re4qzjULtEh5u2ARhk+aAzyEIiqaw30kT6Al9929
         kwcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eg8RjvU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4b90csi379169785a.110.2025.02.04.11.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 11:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eg8RjvU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfOK0-0002QC-TE; Tue, 04 Feb 2025 14:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfOJz-0002PM-33
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 14:10:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfOJx-0007pr-6H
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 14:10:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso44621465e9.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 11:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738696251; x=1739301051; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eqgr5shpCO/hEIaKEyQKSGNXhXaBTHRJwfrnUc+Ak0A=;
 b=eg8RjvU00VuvyKCCmS9lN7v6Oz46bO0svCKUhKociayqZ/EWfaqiXch+hPn9b/GRzq
 LmLX12Qfu7Pb3vSUTwpVce/L7llD09rwS8Zr3VUdGuWSrfd30h3JTkmsWxgMnB0gy6Ai
 RijsiZadEjZ0WiMEP3Gq4BG9XC7pSr2Av0SoG1k+v/0ReExSBgPNh/oNfAJ7OALu0tTR
 ga55Fe6Ta/GFCdBbVIP5BAEz1dAAFYR4iqo1qNt4lOy4NzzV3W7Bkr/bBYKHs8TCOXaN
 713rYlBerDPPSQGR9MXVrAkORrNxtRAK2+k76F5HRJxtXGC5B0kWxltMJ9+5clFGk0m/
 caOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738696251; x=1739301051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eqgr5shpCO/hEIaKEyQKSGNXhXaBTHRJwfrnUc+Ak0A=;
 b=ED2rg14e/NEw25CqJoyd8lgm4BvMQGZXTs8IGFIFk5H8ZSr9pdl86WubPFsZtNNCz2
 5SOQcCQb9UBjA/OYaoF+nuokQHJxJv3fr/mc11qTs7qk9T5b0NQVHw8LSNxyfyf2/eqA
 Ucou8p3ahT5cFwNAkcWm7+nC6OlRy9NwOirPQUfFD9ufjOKjeV3oOCU4N4xPAnVjiDem
 jD6zZo+z/g1st6+11KpLFUQO9QMPTSBo80Jma8gGZ8QeuSxdOWpGIcEgC9gdVc/qnygH
 EMbsL0yTL2hDnj5efkY0uMrndC1b4rTzQ9+blT1fUlK5BuyI8axcObR2gedi084egvHG
 4e/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS/mpvhWXPbBJHLsKjDlpJHKx8lCVEbYhlZ08HEFcp21b5vYeRIn/DNVGRMCs8MtflFcyMgF6+qw==@nongnu.org
X-Gm-Message-State: AOJu0YzNXP9aokGZkB3lmNzG23ZDV7ly0ITh+nXXxh1vUNOSCipEcrEt
 R3rneBVHSx9GLYZ3GYlT2a2Ky3fNNi8EHFzuoQvsQ+BKOxdmbz2puUSP9DQOXQ8=
X-Gm-Gg: ASbGncs4tszbXUXUfSScs4YYYrMELjz06DdFyRw7E9rSsimXoLLk5ER2Lb3K+NrzrQZ
 b/NGOSPbgPioA32AMH1izZin2WUDWKdg96l2TMmVr10g5/4UiAAHuQK0vJa8pTXcCjlFGjrjN0J
 owjc6DVL7iY3OSY5LmIvOU1p1RKEinRR4a3LndE296VBl7B+tIzGsvZ66g6L1m/ihOUhxrmWZn1
 WetB9D6styNYfQ9li6dEVlmlM2Ar/I9fACXLIpr62n558DfdZyzPU0oyvYTvoJp/03yOO7yBsm0
 qxIoNEWGOo9whtq+99kIAPOS3V9wiPKrTxWz7jjsCoc9zjopARZjEciXYyE=
X-Received: by 2002:a05:600c:3508:b0:435:194:3cdf with SMTP id
 5b1f17b1804b1-438dc40c43emr222668025e9.19.1738696251037; 
 Tue, 04 Feb 2025 11:10:51 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23dea58sm196996815e9.15.2025.02.04.11.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 11:10:49 -0800 (PST)
Message-ID: <fa49a483-0ec9-4e38-9eff-65f246c12d2c@linaro.org>
Date: Tue, 4 Feb 2025 20:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] hw/arm: Remove all invalid uses of
 auto_create_sdcard=true
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-7-philmd@linaro.org>
 <bf0a2502-42e5-410c-83fc-ff966cd242ef@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bf0a2502-42e5-410c-83fc-ff966cd242ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dz0VZRoO4Wps

On 4/2/25 19:44, Thomas Huth wrote:
> On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
>> MachineClass::auto_create_sdcard is only useful to automatically
>> create a SD card, attach a IF_SD block drive to it and plug the
>> card onto a SD bus. None of the ARM machines modified by this
>> commit try to use the IF_SD interface.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
>> index 4d84d10d24c..0a4b6f29b1c 100644
>> --- a/hw/arm/bananapi_m2u.c
>> +++ b/hw/arm/bananapi_m2u.c
>> @@ -141,7 +141,6 @@ static void bpim2u_machine_init(MachineClass *mc)
>>       mc->valid_cpu_types = valid_cpu_types;
>>       mc->default_ram_size = 1 * GiB;
>>       mc->default_ram_id = "bpim2u.ram";
>> -    mc->auto_create_sdcard = true;
>>   }
> 
> The bananapi seems to use IF_SD ... could you please double-check 
> whether this is the right change here?

Hmm I think I missed all these cases because in the last patch I
neglected to check ambiguous sd-bus with the object_resolve_path_type
call, which only matched machines with a single sd-bus 🤦🏻

>> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
>> index 43dc89d902e..2410e2a28e8 100644
>> --- a/hw/arm/exynos4_boards.c
>> +++ b/hw/arm/exynos4_boards.c
>> @@ -165,7 +165,6 @@ static void nuri_class_init(ObjectClass *oc, void 
>> *data)
>>       mc->min_cpus = EXYNOS4210_NCPUS;
>>       mc->default_cpus = EXYNOS4210_NCPUS;
>>       mc->ignore_memory_transaction_failures = true;
>> -    mc->auto_create_sdcard = true;
>>   }
>>   static const TypeInfo nuri_type = {
>> @@ -185,7 +184,6 @@ static void smdkc210_class_init(ObjectClass *oc, 
>> void *data)
>>       mc->min_cpus = EXYNOS4210_NCPUS;
>>       mc->default_cpus = EXYNOS4210_NCPUS;
>>       mc->ignore_memory_transaction_failures = true;
>> -    mc->auto_create_sdcard = true;
>>   }
>>   static const TypeInfo smdkc210_type = {
> 
> I think this is likely wrong, too - they use IF_SD via exynos4210.c, 
> don't they?
> 
>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>> index e95ea5e4e18..c9c2e5dd3b1 100644
>> --- a/hw/arm/imx25_pdk.c
>> +++ b/hw/arm/imx25_pdk.c
>> @@ -147,7 +147,6 @@ static void imx25_pdk_machine_init(MachineClass *mc)
>>       mc->init = imx25_pdk_init;
>>       mc->ignore_memory_transaction_failures = true;
>>       mc->default_ram_id = "imx25.ram";
>> -    mc->auto_create_sdcard = true;
>>   }
> 
> This machine seems to use IF_SD, too?
> 
>> diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
>> index 86982cb0772..690cb64ef36 100644
>> --- a/hw/arm/mcimx6ul-evk.c
>> +++ b/hw/arm/mcimx6ul-evk.c
>> @@ -74,6 +74,5 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
>>       mc->init = mcimx6ul_evk_init;
>>       mc->max_cpus = FSL_IMX6UL_NUM_CPUS;
>>       mc->default_ram_id = "mcimx6ul-evk.ram";
>> -    mc->auto_create_sdcard = true;
>>   }
>>   DEFINE_MACHINE("mcimx6ul-evk", mcimx6ul_evk_machine_init)
> 
> dito?

[...]
