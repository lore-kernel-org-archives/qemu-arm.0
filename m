Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2720944lfo;
        Sun, 31 Jan 2021 07:30:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdiR0Expsjtu8Aomb5YciKwTAv99Sg47rsJ2/d2rkTQ2hQlF+hhR9SdAmjCE1Ruo+yCsw/
X-Received: by 2002:a25:870e:: with SMTP id a14mr18928647ybl.60.1612107043505;
        Sun, 31 Jan 2021 07:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612107043; cv=none;
        d=google.com; s=arc-20160816;
        b=elmt7sR08gPydkxV8A7vUhxowsMk6gQByOCl+hQ7mptHhF5y/J2DfUofaSd7mFK5Q9
         7JLUs3zsrgglo+/8fIGyrV/UuSfrPGiLjMu+KIkp74BX+VjxzHclSylaUFRoFRYeUEIZ
         vwl+u0B2zz6OVTzbn771CFzpdOtdXRvPKJkna4uzEHvYhKJvJ8XRgBwDovNxOKqMuhkW
         Oy+zQ56NJbOJu0SLKrhRRc1dFXEpWdoH9itA3RXfMeOwKI5h2v9aBEYXsN8kOc/Eyw2a
         Gd8WjGtprNd1TO2oGh3sY4jPe3IedWlRwv0+kvtdzfjAhZWXvJj3ziGnQdhePtd3pTIW
         fi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=Gh18bhV9zisklL0MEsmCywLJO5xfZXZsIz+HoCdo1tY=;
        b=PlKl+QpcNSpDqJQBP0vUx0dMBPTDymv6vjs7SLOng2LH6L0dukbDt/S5iqCiPjF7On
         F3L5pqdiHJA4ThWbb2WLmM3IbybGZFe7qWs1nmSGlP900licffIzXigla+0TZiNzSEHP
         6RrFmPm3gcv3T/ioeLTT0nYd9/nyYKuHs7GJ352uYHIbM8a/NVlSN26zM0HkI2mfiRw8
         gkx+ZKWoUE66sBonEB20nWN2xdtkXVFfBL794N2gwMqhn6FWubxuyQrQtwh5ibkYSg3D
         G1m1WPWXnGqjeKtTAW9yu+SPCSLMnFsHl/NXsJv3ImLo1QOvspq8Z/P4cY1hDeWnWJuG
         eztg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ktCiK2Uq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d184si4444850ybh.185.2021.01.31.07.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 07:30:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ktCiK2Uq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6EgU-0007J9-UP
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 10:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EgM-0007Iu-6B; Sun, 31 Jan 2021 10:30:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EgK-00068L-Cz; Sun, 31 Jan 2021 10:30:33 -0500
Received: by mail-wm1-x330.google.com with SMTP id u14so10522532wml.4;
 Sun, 31 Jan 2021 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gh18bhV9zisklL0MEsmCywLJO5xfZXZsIz+HoCdo1tY=;
 b=ktCiK2UqjaW3DPRyDt0a1mEENoqse5ZGMNz0/JrIowbj4k6ghrw9FlcJtRMhapWArW
 JaLHv8aAnRZr+iU2XFmMAxcmZSUoqNz8x5OsKv68Il1+Mx0+buMS/bKmD/twO/20znlV
 /PG05F5teAaut1Z9swJD+DP8Gw9kGI/3nor4IltoAOxWDE8D9vaivS9Vy+2ptjF8DZRR
 +VVxyRv2feHdXkZjU+KQlpUPNv/ULt5EIr7shZFE6smLB4RQehuUX8U1fXC9jzcZdc3n
 nxxP1FtDWnUGPwcnCspizHJl7UvQfaaGRdVQbisdhLakaXvsvMuWZs+C5DcwwgEgAprV
 hVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gh18bhV9zisklL0MEsmCywLJO5xfZXZsIz+HoCdo1tY=;
 b=GrU8d2JCWblXPMmVeabUNjmAGcjj9icEhF4hEZy118//Bbtd4Z6aHThzgGxIaaGubt
 UrL8sB13TVKb+8fqqN1Ryckz34zVsiP3Z8oW9ZwOC0Mzltx2jPunQx0Jg4v/S5pMXTGA
 mcooi15Tu0Fra7o+eD9wX5viKURpLcnNiLs3/vQDt/Qjuo2tzBdzrSfQ984YMIcqo41s
 0arwQldvz79f2S0TeIwzGvgmdogZIOxSuAZY6b5+/GBxGVJEwgZYdLH37YKc0KP8Vbo+
 DcphnXpf/fZIvo4RTnrGk4DALuicjE0QXrjRutROdAgDM/BYHzMj01QJj+WukAZfkTyd
 YFnQ==
X-Gm-Message-State: AOAM533XR0n4ivKiNFzO5rLobUVU6ShZFsLnIhlZ2DeOpRqmlfSanBn5
 W9rGnjf6U+1QiYDlt4XP0Ag=
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr11181247wmq.95.1612107029974; 
 Sun, 31 Jan 2021 07:30:29 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id e11sm23243632wrt.35.2021.01.31.07.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:30:29 -0800 (PST)
Subject: Re: [PATCH v2 6/7] hw/arm/xlnx-zcu102: Restrict ZynqMP ZCU102 board
 to 64-bit build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-7-f4bug@amsat.org>
 <5cb160b9-f9a4-05af-9a94-ade51bf4beb7@amsat.org>
Message-ID: <4134e248-b7ba-a6cf-a1b8-9409e8051c1b@amsat.org>
Date: Sun, 31 Jan 2021 16:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5cb160b9-f9a4-05af-9a94-ade51bf4beb7@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZMUVdKWSu4O

On 1/31/21 1:31 PM, Philippe Mathieu-Daudé wrote:
> On 1/31/21 11:59 AM, Philippe Mathieu-Daudé wrote:
>> The ZynqMP ZCU102 board only use the Cortex-A53 CPU, which
>> is only available in the 64-bit build. It is pointless to
>> have this board present in the 32-bit build where this CPU
>> is not available.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>> ---
>>  hw/arm/meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index 059ff7382f2..345099f5a1b 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -41,7 +41,7 @@
>>  arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
>>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
>>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
>> -arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
>> +arm_ss.add(when: ['CONFIG_XLNX_ZYNQMP_ARM', 'TARGET_AARCH64'], if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
> 
> Please disregard this patch, it shows that my other patch
> "meson: Introduce target-specific Kconfig" is incorrect:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07989.html
> Probably because per docs/devel/kconfig.rst "devices are usually
> ``default y`` if and only if they have at least one ``depends on``".

The problem is the XLNX_ZYNQMP_ARM was incorrectly selected,
enabling AARCH64.
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg08014.html

With this change there is no problem (and this patch is not necessary):

 config XLNX_ZYNQMP_ARM
     bool
-    default y if TCG && ARM
+    default y if TCG && AARCH64

Regards,

Phil.
