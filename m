Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp358548ejb;
        Fri, 26 Apr 2024 05:47:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXG6xAsO5//FlQ8OjcWps2IoHAKMdMqHBYbrLoOoIUb0n8qXEEdexGDXp6qW+1tnnIEggSJBOT5turkuuCnlWfUiHhrvPP/
X-Google-Smtp-Source: AGHT+IEmXfCgB9PkSyUYTcyiUw+hkijXPmiOKdj630/kxvOG73joqB3NnnGImsqaOhdLswPnYBee
X-Received: by 2002:a05:6214:1305:b0:69b:1d1b:5609 with SMTP id pn5-20020a056214130500b0069b1d1b5609mr3276876qvb.65.1714135677326;
        Fri, 26 Apr 2024 05:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714135677; cv=none;
        d=google.com; s=arc-20160816;
        b=XtKYB9dMcP/E3QsVl3zKaYutNX35Yfxu9N3Q1LfwmMERYqGz3vrsZpZInFWldvKyyD
         62RCmTCzWNEXnc9KR4/j4Dth33xNLaV0mWelxilOzHFgb9fO2rVuDSRHsoJymjIX4L6U
         98zZbzFa1jUv0iBoRgRin0gccHD69oxGGIp37g/8cK7s34Krk8iG96bxhPJLvvaGKb0Q
         c5QK08IKIlxMldSX8HDZSQoebeqtYh5nOJp9DlR2T31kmDnPJ5btUdb9/OzYJ486LVIP
         /JpQwrq+fpJvx3Esbfpxy8flWFQfqWRAEnPn9ZIT2r6rbFyuy1GG+ajeowvG/gc2xt4h
         RYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9lrTY4Nr9jGNC6AFsCt/hzu1RHEYbNWHMSByUm/lhys=;
        fh=O5a8P+2aQZSPyouDp3JqXaMw0rYMSR+vN2vKSg6DipI=;
        b=B/yw7hdUzQw5rpG3oaw7D+51iuorYJp6ujzIv7TCymJovHLP8AElIdj7z8bburBdSf
         6c+W4mdh5pGDIO9RtBuGyr3o1gYJkOJI9dox7FOVZvAnIl55WqmDojLTBcLPcTqeOTb8
         E1tRqjumGyUCJ/ydOfGCJdFKLVz5xpwLSu0HNfAYoyRyyVjB6XrcDaOeTKwVAGndhDGp
         gqbkGiv4u9HC3TTLWs1KQwTyjx5Dr+tw41oTnKpiXxqXwrlsYKD35h6Kuw6vHWVKIawg
         2jPL2oplPfQ/Mx6uqxI0ZwSbYpz1T8AS6WMQEammNXkVqZu2ikHLuE25T0YuMKfUhTtj
         eyVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrYbW9hl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a056214124600b0069b4c1a2613si20120302qvv.324.2024.04.26.05.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 05:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrYbW9hl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0Kyp-0002yp-MA; Fri, 26 Apr 2024 08:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0Kyg-0002vx-3X
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 08:47:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0Kyc-0002qM-5h
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 08:46:57 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a55911bff66so272648166b.0
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714135612; x=1714740412; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9lrTY4Nr9jGNC6AFsCt/hzu1RHEYbNWHMSByUm/lhys=;
 b=yrYbW9hlp602M9KBRmmN9QOgzNPMuW35DvZRq7qVHtsGI4P2Zpt358mdCPIiz5cLt8
 tULC3D1sMtlS+EB559F4/vnWOc1xRV6cugr2VHviBaBpzDCC+BXFixVT+wl547Bgpbbn
 zNsB8R4jgBSY30pLub4Nv5eRBSFmZ8eIW1cK9SKrFmWweF4er9wq2sng7bYS2eIzFOo/
 3r/DemCku+eKMjhY16LQl7/IfX3F6kLSswyKgVpSNUV/opCV87a2tcs9mTGSvdaawbi5
 wgca5aX8iqDcO4fkGCNszGgdvrgmgCqKRtRjpyzqpGo8VsDAA0C0lOsMr6GX06EfSdbF
 IlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714135612; x=1714740412;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9lrTY4Nr9jGNC6AFsCt/hzu1RHEYbNWHMSByUm/lhys=;
 b=eAF+WXIULsMAPZx2tp0wDC7lycoGDh+3JStGXP+4UJ+M+TaS3oMouJo8TXGR2s86iR
 Cg+QOI6tKWWAw5Vj/CFT34nBeCfl3dkGKDEomeO+qa5w9MNwBpd8e75CXa7/wmgYMxsB
 4iB2dTKlDpCsqv8/w79vv+99D9TJecE12ATQnHiFmM4TEa6QokAwcvS3JqsIneR8zRbv
 knrabZLxHh74aFDtXtyGl8IXRzT3vFE0+Bqtc7vPZx5GWRJQbGyrxq6SpN1vJVqeOH8j
 Aeqpypp9yyEZYWOwSYxZYPleB5L73m9cGh5iNQITRZ+JGYtNhSeNceFSId1Yh/heb+hH
 3qeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5uPTBRJ2dCuEWmwDPWzzc8labHMQEepUoa1upcER36z72X6naaXkk3DaclMUP4IS7j8GadBO69+Rp4DXIGtYZEyF7
X-Gm-Message-State: AOJu0YzkuAModTn6Ey4P4H7AqUJpFo44AxUZyHwGW6URJqccnUTfIyhm
 QnnNlpJCBWtyVSgOtVEJ6oTk1LGqFZpbR/EgpEoHxNwd2WniYyJ4E49q+yDytf0=
X-Received: by 2002:a17:906:4144:b0:a58:c0e2:9792 with SMTP id
 l4-20020a170906414400b00a58c0e29792mr2186578ejk.61.1714135612416; 
 Fri, 26 Apr 2024 05:46:52 -0700 (PDT)
Received: from [192.168.69.100] (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 dk18-20020a170907941200b00a58ca98bbfbsm762915ejc.30.2024.04.26.05.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 05:46:52 -0700 (PDT)
Message-ID: <36b9a714-44ff-4b60-a23d-89672a98f46e@linaro.org>
Date: Fri, 26 Apr 2024 14:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/watchdog/sbsa_gwdt: Make watchdog timer
 frequency a QOM property
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240426122913.3427983-1-peter.maydell@linaro.org>
 <20240426122913.3427983-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240426122913.3427983-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: 493LxRq1PrPI

Hi Peter,

On 26/4/24 14:29, Peter Maydell wrote:
> Currently the sbsa_gdwt watchdog device hardcodes its frequency at
> 62.5MHz. In real hardware, this watchdog is supposed to be driven
> from the system counter, which also drives the CPU generic timers.
> Newer CPU types (in particular from Armv8.6) should have a CPU
> generic timer frequency of 1GHz, so we can't leave the watchdog
> on the old QEMU default of 62.5GHz.
> 
> Make the frequency a QOM property so it can be set by the board,
> and have our only board that uses this device set that frequency
> to the same value it sets the CPU frequency.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/watchdog/sbsa_gwdt.h |  3 +--
>   hw/arm/sbsa-ref.c               |  1 +
>   hw/watchdog/sbsa_gwdt.c         | 15 ++++++++++++++-
>   3 files changed, 16 insertions(+), 3 deletions(-)


> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 36f6f717b4b..57c337fd92a 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -543,6 +543,7 @@ static void create_wdt(const SBSAMachineState *sms)
>       SysBusDevice *s = SYS_BUS_DEVICE(dev);
>       int irq = sbsa_ref_irqmap[SBSA_GWDT_WS0];
>   
> +    qdev_prop_set_uint64(dev, "clock-frequency", SBSA_GTIMER_HZ);

Since we have access to the CPU and its generic timer, what about
just keep the wdg in sync, as smth like:

   qdev_prop_set_uint64(dev, "clock-frequency",
                        object_property_get_uint(OBJECT(some_cpu),
                                                 "cntfrq", errp));

>       sysbus_realize_and_unref(s, &error_fatal);
>       sysbus_mmio_map(s, 0, rbase);
>       sysbus_mmio_map(s, 1, cbase);


