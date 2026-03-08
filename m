Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95ACEA8543
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 21:56:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzM6u-0006x0-UL; Sun, 08 Mar 2026 17:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzM6t-0006wX-1r
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 17:56:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzM6q-0006T9-NR
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 17:56:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so107226965e9.1
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773006983; x=1773611783; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OWG9iN3qqepCYkioMpvHKEZS+w8pRJzbAj4UZzfmZ2I=;
 b=JoAZXVdROtteGxH5T3W0pex049T95t9jZq/4ez1Cl+Efa/XzOe9v3BZESpJeM+b+hQ
 kL0RxBkodixqBeNJWmRfe+k9TP4Awy7MOU5mB0aDxQuPNb/MRyLp7KpPeegwb4UrcP9S
 LNd7ckzrQyc7g4mdpiSz3ZrzlqiuCMxqbbNWljtM0XPJYtNEWOY7tCx/ApIsoAqA+jsH
 +iGknTGIl7c13p7hZZJIJ++zg8Hrkug1yHzLAGKGF806F8yvrBRO749TkYLEvawIYeLY
 8gjwFJoTCcY/ZEE2HWFN2EIZnkGPterJD9FKRVgDsqGERTwX5n+FTvBdIEPHDjzvGSoN
 cBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773006983; x=1773611783;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OWG9iN3qqepCYkioMpvHKEZS+w8pRJzbAj4UZzfmZ2I=;
 b=sV7X+gOtPIeR3MI0K2oa8TESgTgj5Nm8CR4vADoou9GhGr7h/xCs4y1OqvxA/kY2V5
 CYKiN9rCkrKnEjLFfLP4O6CaqTT7fjrR+BZ0vpwtjJ9nvsB+lAsKuU6P2XiWH6q4V2KY
 KCd+ii85lsHD9GzRTQm6Z8Jyhs9V3NBxcB5GILQmrnLJFe1gP0KgjuEQz7Zi1Uxo01MK
 kg4H81m9yg/i08yoaWv3CW8ByDpI3Nnbz5PhsT0oCOyIOwxlwTfo0jE78ut1qqUbD0wR
 ZuCU+jWs/RAzqWFdi1Xy/CC11XKky7nK6Gers0XDbtyodtmkl54sPmJkdxGIgcVOUFiS
 OyHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8kR/rTa4uZur1/yxFdv+GMEsy5A0gltX2IM4kc+yrdfvAPvUP53snG/28n75l7PbnG/ck9pIHRg==@nongnu.org
X-Gm-Message-State: AOJu0Yzsu/IURN0n3VSd36FEbYKMdMbl8u/Wu2UrEEVCOY7Ha42F2aXy
 V6iKIvSkErQX51wAROrMVrX9rumOIZqBrSME2HIlSgY5uhjAJIJgJ7a1/TqCbwEtUaU=
X-Gm-Gg: ATEYQzxppC1ocgrcxPcfDd0URXtmvGMVpdWl7aCve/tjXmQGKOIwflm6+ljvGMnCDTF
 xRPzE4kp5q2rYYCWC4P4OZJgMDp/WxOGU7O7vgVFs1mdT+Uns7Gskhw+8P1cUa/H9M91PmdGJ8d
 1/LXAmIZcWHm2fz6EaYQ+zd0tc2sIfi4XJf91MOHTeLMaZoVP0PXD8iNmdOJ2CvtnLEdBneuPcW
 3I9lrNe7pGAKb2/PfWb5SYJiwjIXQexhzPk3NuefauxLSErBgf+0xRZ/r3K33Uz/3glPbSmzoQv
 fLRcPwQwWbMd3of3vrsh1v/yOYJNAVQlAzUdH3u7XJn/JRHv4KhptC5UE2EjEr7pbT02ezxg7hc
 C8DniD3i+jUOMz0vMbZ3aAUGzPYrO041z80Ha6w/ohtGAKu1WNvbyfic6o9VzH+3zEM+09KLfcC
 BWHS8Dqt4UPd3LiKDcC8wHF0x2BlNgo8ZMuWWM+Z5q7HC4PtQgqQSk6E5neR3GLw+NcQ==
X-Received: by 2002:a05:600c:8b2b:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-48526715213mr135556955e9.3.1773006983202; 
 Sun, 08 Mar 2026 14:56:23 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8d840sm23611168f8f.8.2026.03.08.14.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 14:56:22 -0700 (PDT)
Message-ID: <81e7b6c1-bedc-4762-8051-f67c54a3ffab@linaro.org>
Date: Sun, 8 Mar 2026 22:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] TYPE_SERIAL cleanup
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
References: <20260305220911.131508-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/3/26 23:08, Bernhard Beschow wrote:
> This series consists of cosmetic changes around TYPE_SERIAL. The biggest change
> is having it derive from TYPE_SYS_BUS_DEVICE which 1) eliminates usage of
> qemu_{un,}register_reset() and 2) stops all its users from accessing private
> data. The latter allows TYPE_SERIAL to be ported to Rust in the (near) future.


> Bernhard Beschow (14):
>    hw/arm/Kconfig: Fix serial selection for NPCM8XX
>    hw/char/{diva-gsp,serial-pci-multi}: Fix deinitialization order
>    hw/arm/aspeed_ast27x0-{ssp, tsp}: Do not access SerialMM internals
>      directly
>    util/fifo8: Make all read-only methods const-correct
>    hw/char/serial: Remove explicit cast from void pointer
>    hw/char/serial: Prefer fifo8 methods over open-coding
>    hw/char/serial: Reuse fifo8_num_used()
>    hw/char/serial: Remove unhelpful comment
>    hw/char/serial: Add constants for Line Control Register
>    hw/char/serial: Remove redundant reset
>    hw/char/serial: Avoid implicit conversion when tracing

Queueing 1-11, thanks!

>    hw/char/serial: Keep MemoryRegionOps private
>    hw/char/serial: Inherit from SysBusDevice
>    hw/char/serial: Plug into reset framework


