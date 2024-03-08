Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp2051994ejb;
        Fri, 8 Mar 2024 12:19:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDvvn92E+FtFS14ShQz1h25O7qMqwiktFuckRaODSFuM70mT6SW9OwasEF36OWxtFSu+eAgnsvI2cpOq0CaxNSL1XLp/5D
X-Google-Smtp-Source: AGHT+IFcazTKqO7u7XmBEiX+0r3RjYEEU5ApmqNLDIAbmZ6Dud0rq19P1xnTZLZzl2j48SE7QOT2
X-Received: by 2002:a05:620a:1915:b0:788:2861:2285 with SMTP id bj21-20020a05620a191500b0078828612285mr206417qkb.73.1709929171177;
        Fri, 08 Mar 2024 12:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709929171; cv=none;
        d=google.com; s=arc-20160816;
        b=0SE/2+Ng2/Ppbbwrok/oFFr2W9ufoUL79GQTXalmVyyBF70l2zLnKPBcIZZOmdl4BK
         mdf10940xbFJOePpxZ1OU1ALxvS6ce/n0SYf9N9QTNEfZx2rVJff+8J3aI9zCH6PFOvo
         +ByIWCIVvqlUpMfrK1FExnit9X9TjyH2JH8vzTCdr+EJ76EunjMLJutlQX/uCU+OJ1eR
         2E89Ms1hWwyxTyUPboSbxezLl9u6z24w9et1Lg6UG48Coe5zOfQvwNVTRadDXTdI2lvP
         qCzEc/xCvXXV4/fD/7oHuGd9XYTWSJfIrvkzq7m0IdZeAU8N5+zjtaledbrcsuOFnp/p
         9oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W1L10fpS77snLCD5zVXtHlawdcBUPIknU6UBpywCCvM=;
        fh=h5A0DV3gvKbfz65rh/+wHiz9VKCPkNc8rVvfeSAsCEM=;
        b=wsroCduepNBmq2AofXQl+28a4n7X8c2+iw1bf1QOz9gGEfmAscH5Uu4y40KQL0uQDk
         rk99/bHTIrIeSPBqXUXf5Yfqo2G+TEs2ZNRtVHKFDH2YYZMyYoxC1ms7HnhFuxSUSn2S
         rKVlWe9usVMBvGl7dxtaYc86Gz4VLC0Pmbd1Z4pP5pHQOw1mR/K11f8npFvDXNGh5g3Z
         a18Qk8YE7euwh9NUNKsZBmViaHhWG4qrV7yFA9e8TIN02O+A+x043Az+lvIf03FiD3GF
         27s9abR5o8s3vF9C/8C/KyZwNBM1QQ8Xbbc2hmAcP7dDThZLHFbiZF6gBt6GzwS2oWR6
         Jj9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vH638OIA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020a05620a090100b007885a69eb8esi187412qkv.475.2024.03.08.12.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 12:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vH638OIA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riggc-0003fL-FV; Fri, 08 Mar 2024 15:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riggZ-0003eX-IF
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 15:19:19 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riggX-0002M3-PJ
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 15:19:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41307d27b5fso18205865e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709929155; x=1710533955; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W1L10fpS77snLCD5zVXtHlawdcBUPIknU6UBpywCCvM=;
 b=vH638OIAYmSWu0sFu1Dp0Zd2Cc1dfxMxhSnXGKl2C6Du7xT6cWrGPYBhmbO64uOF2c
 MU4yWDLeUsOyhOBFLGqoT3fWjo5rXWhnGmlehL6zIHJdzNZyZLJLK1smVNJXpmFMDMW4
 /xxP+yHQ7nV7T9VYHQDxqQd6KPl5MazN3WRJUZUjDpl6o79VjaSRVvTCI7ijkVjA9XFW
 F0KpTSb4Pz6dZo0vq/mDLsm6Dsw6FrtKaMLlwdQw1iSn+rcKMkfnbIEXebFuNmEPPs1U
 Mxy8FXKnFykYEDWM4wER9G+hgdA+DrekLamXS6G0EXWN+58YT2WzZaAUyj/Fmu8GKajY
 C/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709929155; x=1710533955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1L10fpS77snLCD5zVXtHlawdcBUPIknU6UBpywCCvM=;
 b=F7ZztIXs2bVZMy38CKXx+LJxREW8b9OK0lqvzb8xpz9uZ9Y3h0lZ2Mm0x4QuZ8BUGF
 hDShzdLNut4QB0UUCLm1CuvcP06ZUWyWCz1uzgzCwUeEz4obDGUSUy4dl1nB/eC/jo1J
 B5b64uTSGjZVfvMPZTlFtUcAfgwImmClrq1bnFeU0aif7BvmarOeeXqU2i8jUiJYQ1h5
 jicNu5DxwEhfjO8gGS9nazoyH2jrQlz7rRrQR6PKLlm7XvXifGD9RM8grOY3d0hCb5FZ
 2c9lgVJDD8YzrSgfOTCw9tEq1OyJuIKm2Lew7wBISyWl4yZ3EeL2TnDBZsDgEEUobIN+
 lIBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcOTFVpduOiPpjrsq/pe/ATN3Cx2FAqjstPhAzpi4N/jMd8K/N9FKe/Ib7smHzAJt4AIdGxfV+l9oUKOTJBqeqs9om
X-Gm-Message-State: AOJu0YwilBJA+86SeQCeICaKyOPzdKv8LFY8pDwgkFqdOQ6qC6Enqhbc
 8Jek3QhmX23RIRcZnFtXT7dKpWRCVhYflRMYkkS19HJPAVHhGGA0+GyI61mfn3UWegIUzYR/pfi
 p
X-Received: by 2002:a05:600c:474b:b0:412:900e:84de with SMTP id
 w11-20020a05600c474b00b00412900e84demr197891wmo.38.1709929155447; 
 Fri, 08 Mar 2024 12:19:15 -0800 (PST)
Received: from [192.168.69.100] (cvl92-h01-176-184-49-62.dsl.sta.abo.bbox.fr.
 [176.184.49.62]) by smtp.gmail.com with ESMTPSA id
 h3-20020adf9cc3000000b0033e73c58678sm241953wre.15.2024.03.08.12.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 12:19:14 -0800 (PST)
Message-ID: <4857865b-94df-4152-92b6-aa030513df26@linaro.org>
Date: Fri, 8 Mar 2024 21:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Deprecate various old Arm machine types
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20240308171621.3749894-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240308171621.3749894-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: YYL4/2SkewG9

On 8/3/24 18:16, Peter Maydell wrote:
> QEMU includes some models of old Arm machine types which are
> a bit problematic for us because:
>   * they're written in a very old way that uses numerous APIs that we
>     would like to get away from (eg they don't use qdev, they use
>     qemu_system_reset_request(), they use vmstate_register(), etc)
>   * they've been that way for a decade plus and nobody particularly has
>     stepped up to try to modernise the code (beyond some occasional
>     work here and there)
>   * we often don't have test cases for them, which means that if we
>     do try to do the necessary refactoring work on them we have no
>     idea if they even still work at all afterwards
> 
> All these machine types are also of hardware that has largely passed
> away into history and where I would not be surprised to find that
> e.g. the Linux kernel support was never tested on real hardware
> any more.

Thanks for writing that down.

> After some consultation with the Linux kernel developers, we
> are going to deprecate:
> 
> All PXA2xx machines:
> 
> akita                Sharp SL-C1000 (Akita) PDA (PXA270)
> borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
> connex               Gumstix Connex (PXA255)
> mainstone            Mainstone II (PXA27x)
> spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
> terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
> tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
> verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
> z2                   Zipit Z2 (PXA27x)
> 
> All OMAP2 machines:
> 
> n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> 
> One of the OMAP1 machines:
> 
> cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> 
> Rationale:
>   * for QEMU dropping individual machines is much less beneficial
>     than if we can drop support for an entire SoC
>   * the OMAP2 QEMU code in particular is large, old and unmaintained,
>     and none of the OMAP2 kernel maintainers said they were using
>     QEMU in any of their testing/development
>   * although there is a setup that is booting test kernels on some
>     of the PXA2xx machines, nobody seemed to be using them as part
>     of their active kernel development and my impression from the
>     email thread is that PXA is the closest of all these SoC families
>     to being dropped from the kernel soon
>   * nobody said they were using cheetah, so it's entirely
>     untested and quite probably broken
>   * on the other hand the OMAP1 sx1 model does seem to be being
>     used as part of kernel development, and there was interest
>     in keeping collie around
> 
> In particular, the mainstone, tosa and z2 machine types have
> already been dropped from Linux.
> 
> Mark all these machine types as depprecated.

Typo "deprecated".

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst | 15 +++++++++++++++
>   hw/arm/gumstix.c          |  2 ++
>   hw/arm/mainstone.c        |  1 +
>   hw/arm/nseries.c          |  2 ++
>   hw/arm/palm.c             |  1 +
>   hw/arm/spitz.c            |  1 +
>   hw/arm/tosa.c             |  1 +
>   hw/arm/z2.c               |  1 +
>   8 files changed, 24 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

