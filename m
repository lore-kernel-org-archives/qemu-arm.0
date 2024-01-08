Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2275155ejo;
        Mon, 8 Jan 2024 05:20:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz8RaSMjApttIrvOLS5UJbFtkPjDA1jUCYwNS6cn+nYwZUSHznAsWSXTKxeZLpKQcNYgBE
X-Received: by 2002:a05:6808:bd5:b0:3bd:3420:56c9 with SMTP id o21-20020a0568080bd500b003bd342056c9mr558736oik.106.1704720054278;
        Mon, 08 Jan 2024 05:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704720054; cv=none;
        d=google.com; s=arc-20160816;
        b=IzKivx40E6AuiH3qmROXIefAUbCX+VTdUyOg41g1z9lydnEIWZFuI2OGFHCRHQgRGf
         JTmu1DzaSGEv1pd00unptM2oy3r1JGeIM6Vo5nVNhx0Pr9xFOijo3rVvEHGmrALHP7oc
         hRu8RFubnBvzeAAcACkjmlPELeh+My1Yb3id/BW1yrxgCFBx0AIxKh2dkJ/eeSNUwYae
         KLODdyo15kZCYrzWXv1CiqJt5PvgxlPcqQiL7yZU9yzY5CpYvYtZ8IVBuO+kn11Jw6bg
         Y61mNvz80NXkHAEIf8LSVppS7Hy0FTUwr5z0BLS4mJlygxHFaQk5xirdA5ws/8AgY6tP
         ZvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=f0KCTCDXugTzkY37kFn8h1zKyHtmM6/s4WxalUNP9Qo=;
        fh=s/pAp1lg3EKt+X1GlkcnO5C3TP2R7W5RD7gikRB4ucA=;
        b=tTrv8f+36o+tcsQOCQIYQe4ocZgeYcETR1xXopAj9rcvnKeAMXN90Mwp7OH35OimVV
         Z8ROHwKlW5741ib2HaWMQ/bMRih+uA6yntvGgCYDSuk+wjsLOv2QSuzDSw5G4pd/5W+j
         iVmMNBQ4VP1r3szcNU49KAgrCJ/rNFZfGko2WmJmB0DqU8Zjt3H377mLEGYKzzOqS2yb
         WwCh7uL3a8jQdMfjGOeWa1tpcfbYou7UIcDGDeHvUso+B9rZm3EEB6aV147KS/AkR5QQ
         RcV0DADflO4jEJ5N90UcQ60etaz6xuDrm8EL1LAeZBVDH9IaiAjadq/pIJn4IcqiUVun
         2TUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/MxfxO1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1-20020a0cf301000000b006807fab8d4esi2049390qvl.74.2024.01.08.05.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 05:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/MxfxO1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMpYe-0000nD-2x; Mon, 08 Jan 2024 08:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMpYZ-0000mk-Ib
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 08:20:44 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMpYX-0002PI-Bz
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 08:20:42 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so1851588f8f.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 05:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704720039; x=1705324839; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f0KCTCDXugTzkY37kFn8h1zKyHtmM6/s4WxalUNP9Qo=;
 b=j/MxfxO1y84dyjOvanL2s30uClzZV7UjYutudOXy1kRvEt4Cz7JUdQ/43OCYsG4Ygg
 vG9lS+10F9lB7QQ8YGPHntk/Ou0HRtkZGMSMFqSG8NQr54aSTyyGxaAZ7XH+mNBxC8F2
 DyE+O/5m7sedkzzeXDFsnrX2IGTooDYrTFbhOABGhF7rnelU0NX5df5FPTBiTwBHVGmn
 6bHazaysDDHQr1H7yVpBNi+0geNLl+vZmWr23LRKXYvMGMBQaI0aXsJjgtw0fQYES0XL
 rlkXeHibeULogKZQI9b6ndU5uK7hIeaJ+RVL8ahOzytLf0s3DbsHHtZlBSCHc0d/S7rF
 wUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704720039; x=1705324839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0KCTCDXugTzkY37kFn8h1zKyHtmM6/s4WxalUNP9Qo=;
 b=sFebP0mY4d20EXxTQN8qh8H65ng5NZgLjEPfA+ncBHmTe8Zc0j/VlLHUvlKl3Pz5ct
 P63+ewJryf9np4IxuRWQuW1tDsScXT4x5wjP80jVErNl0ATiqQE5exS4dRACRUTJVuk/
 1Q6CmQiLQKac0v33aGa6QQMcbBMxQCaQkBNHEAd0aHEIxC45fONtOxt40TG7PvgNrIzD
 NlhPzMdHNiJP8FVp5jB1tvH5WTftFcs38PmGr3//f1OD/DjQV1YK708Mprj4g4qtddOk
 lROzOPq6/CwWwiMx1BTafCOhVILWyoWNG8pkmrRizdCG6GpQJ5jde5B08u/8XAM8eL48
 PgCQ==
X-Gm-Message-State: AOJu0Yy4dagyKpgfhgWAv3aV31QLzjrUId0Zqzvkox8oiJmOBgp+BvM+
 A3LCbZvHL6vjY34QvmZww52TS0wr6ZEplA==
X-Received: by 2002:adf:f3cf:0:b0:336:654a:bff2 with SMTP id
 g15-20020adff3cf000000b00336654abff2mr1869449wrp.10.1704720039303; 
 Mon, 08 Jan 2024 05:20:39 -0800 (PST)
Received: from [192.168.1.102] ([176.176.175.62])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adffb85000000b003376af392e5sm2196749wrr.38.2024.01.08.05.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 05:20:38 -0800 (PST)
Message-ID: <d0a1ba6e-70c7-4e46-9cc1-41c0c10e5044@linaro.org>
Date: Mon, 8 Jan 2024 14:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: add PCIe to Freescale i.MX6
Content-Language: en-US
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20240107165702.47819-1-n.ostrenkov@gmail.com>
 <f030dc08-f010-43dd-9aaf-e9b8048a8e43@linaro.org>
 <CAC8KSA1S8ruxXmGhppout+Y5bYyy5Ot==Kq6aBKAim8hG1OiYw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAC8KSA1S8ruxXmGhppout+Y5bYyy5Ot==Kq6aBKAim8hG1OiYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gHmeXq/xLayF

(+Thomas)

On 8/1/24 13:58, Nikita Ostrenkov wrote:
> Hi! Thanks! I'll send a new version of this patch.
> 
> But what about fsl imx7? Should it also have PCIE_DEVICES?

Yeah I think so, we missed this in commit 02047622b7 ("hw/arm:
Express dependencies of the remaining IMX boards with Kconfig").

> 
> пн, 8 янв. 2024 г. в 15:20, Philippe Mathieu-Daudé <philmd@linaro.org 
> <mailto:philmd@linaro.org>>:
> 
>     Hi Nikita,
> 
>     On 7/1/24 17:57, Nikita Ostrenkov wrote:
>      > Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com
>     <mailto:n.ostrenkov@gmail.com>>
>      > ---
>      >   hw/arm/Kconfig            |  3 +++
>      >   hw/arm/fsl-imx6.c         | 25 ++++++++++++++++++++++
>      >   include/hw/arm/fsl-imx6.h | 44
>     ++++++++++++++++++++-------------------
>      >   3 files changed, 51 insertions(+), 21 deletions(-)
>      >
>      > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>      > index 660f49db49..575bb68c76 100644
>      > --- a/hw/arm/Kconfig
>      > +++ b/hw/arm/Kconfig
>      > @@ -530,13 +530,16 @@ config FSL_IMX31
>      >
>      >   config FSL_IMX6
>      >       bool
>      > +    imply PCI_DEVICES
> 
>     This should be PCIE_DEVICES.
> 
>      >       imply I2C_DEVICES
>      >       select A9MPCORE
>      > +    select PCI
> 
>     Incorrect, should be PCI_EXPRESS, but this is already
>     (indirectly) selected by PCI_EXPRESS_DESIGNWARE which
>     you select below, so not needed.
> 
>      >       select IMX
>      >       select IMX_FEC
>      >       select IMX_I2C
>      >       select IMX_USBPHY
>      >       select WDT_IMX2
>      > +    select PCI_EXPRESS_DESIGNWARE
>      >       select SDHCI
> 

