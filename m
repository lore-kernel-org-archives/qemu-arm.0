Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp837583nji;
        Thu, 29 Aug 2024 05:50:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURH30WRnAYSmSskBE5mxZr23ngk/dPTHyAGHjWNTnMKTnAXoJbpp9ZBPb2dOm3enLMtzsriTHa8SQjmA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4PX062o9EgnhheZfzV731QQE+XJLHKm7w4frvDarCGjUtw4DXUTl/H1qOJDVkKBPkQ7FO
X-Received: by 2002:a05:620a:1729:b0:79e:f8b7:5c73 with SMTP id af79cd13be357-7a80424b3b9mr265127385a.55.1724935832882;
        Thu, 29 Aug 2024 05:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724935832; cv=none;
        d=google.com; s=arc-20160816;
        b=MDWDCOxFn1QDNSpSsEpkGJvI+sn0I7Tfc93gtchmqaTO64JNkb7pRVj2uRovdZzaRs
         e+dQIGQY16mr4A+rqo//BRlDln8LJnQowPbxpdjGMmkYJObseT/w1MpmbvAliw1GtJpq
         K4xpOnhla9ZKIUbm1JUuRQA9bQxn/k/2JO0U3fnobJPf2C1Hd7XE47i67sG0CXauq0YS
         Pwb5ImunGq/Wj8S6Re7obEYFT1FLm3NMUgOnP5sWqG9USTx1VZ5CJYmarMDvGvxjknSG
         OYxCmN5RPyZDkKpk7swTOJg+cFvCcLbv3nlruzAHr/BTh3a2aLzegi1oGIgD9L9x0Kcz
         yoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2wRSRQffSI3jvGx4sR+FNXzobzhljUOnvnpFox4nMKE=;
        fh=3XxDdEQzjEO8jOLf/Fs087zzKVbJ+Y92pHyjutEJcvM=;
        b=ipXVWT0qPqv2OHE9cW9emcY8NGqfb5Y/Nq164/cBj98CPQdoXZXvpYPsdDgP4fGWJH
         idBPw5YLVepQxNTlrX5T4RqVswARZCiQv1R/FtSqkhiIAvq/AKY/YfEDAo0nJIDQGmDg
         bfAtAWlc1em/SJltENuOP6/GHHs21c49QXpIa7XLRYEfdDT/ZehYQpOnE1bJyxoMFVUo
         U9xNiGkoWzrHLtoyFBlzL3Tym2Izz+P7Qr8rrwnAih9nx3jm8EI1oCIAfgd33BVxsOuY
         Iizx7FciJDt7wY8y+hKVI3wK+f7r2IoaoBmWWCcc0Wshqs9RUKPVAXPs5cEkSXh4QbZk
         nkcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RwtSw+I1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d3d296si13405061cf.297.2024.08.29.05.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 05:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RwtSw+I1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjebS-0008Os-Vf; Thu, 29 Aug 2024 08:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sjebR-0008NJ-Jo
 for qemu-arm@nongnu.org; Thu, 29 Aug 2024 08:50:17 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sjebP-0003OU-U4
 for qemu-arm@nongnu.org; Thu, 29 Aug 2024 08:50:17 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so69089966b.0
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2024 05:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724935813; x=1725540613; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2wRSRQffSI3jvGx4sR+FNXzobzhljUOnvnpFox4nMKE=;
 b=RwtSw+I1ZuCa3XwzZBIdEMDDwFwcmwYgmTr3UP/LWxcrbi2M4Ro1IuhaU1lLXNDtCz
 qp7vgOwTOukPjTIHdaBGMLjRnp91n2ZeJlczpS3a8nLiWP/W8jRu5CJSCxjw4F30legr
 QRI0TT52UHFtyAvog+ODrlfeZNBSXtcDxELCAKGeoijwfKQUk2ESqlxfMKjrou/uQ+uq
 HHaHJVQim/poyCLXrbviccJ9hQzOJ4+5/VaKHQ+cUj0yprRq2CA6E+WCmcgLmfeY8b/s
 RqD9cA6VGm4SiznQ3PlhOeb06M9kfme37jQHdQZF77RCzWTk07eJxC6S6gXzNHMCgBkW
 3/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724935813; x=1725540613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2wRSRQffSI3jvGx4sR+FNXzobzhljUOnvnpFox4nMKE=;
 b=Sc4zA4G827lMTuGgvC7E9dNOoMfnBnJQcSLu2RSV4gCDPP7peEgCQt+9MPNjSQMlmX
 knW9gAZ2IrCgVT5iSRuDf9BKNHYkSocXUVltpkHZ93G0JYVMm3rmjzmV+zpad1LumyvG
 dhq3tquuLB3/wzK7T9tj2u5ihWqiAUYxnKzy79TRcphXVGUiwm3iXNW6l7notOoib14y
 gqcrjRZacxMFjdseLmg1jGc+JGlzImHtwaOk4UA3GfwXRcewJdT7CzumPYugV/xh+mDc
 a/vLw5d9SmImwcma/vCFbUrNQfLPu5Ny9rH54QSNdxbHQuCUWk9QTvRY+KJum1NPxnhW
 jAWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFf/602mcoTdCOd4w/k+1oSGvNISPPDS2WUcu3Urkjv38UDhUzWNyGtmD6HXOK7EcGG2O+UgO6Kg==@nongnu.org
X-Gm-Message-State: AOJu0YzKWtblU85PfoMY6v3ItjJ9dx1Ua5YGG36pRF4hP9RSDXecdL3U
 xTY8QMY47BfjxkuF52BkpxUtez6RlX1/NRXhnUbqtjzmxLpHA3FJ0nhlEBeMPnTk7z4cT8nkkGh
 nu4xmbPohVD32gTDmwyWfUwZxrAkuuFriQkqwZg==
X-Received: by 2002:a17:907:d8c:b0:a86:a30f:4b0d with SMTP id
 a640c23a62f3a-a897f930927mr259336266b.38.1724935813430; Thu, 29 Aug 2024
 05:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240828005019.57705-1-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240828005019.57705-1-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Aug 2024 13:50:02 +0100
Message-ID: <CAFEAcA-p+CBeKTgH-YXzrATKDpwG5iY+A3WGaVkbEeHCXxTzug@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Enable Security Extensions
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: JeDxC6QbYWet

On Wed, 28 Aug 2024 at 01:51, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> The system supports the Security Extensions (core and GIC).  This change is
> necessary to run tests which pass on the real hardware.
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>

(Added the maintainers to cc.)

Does the system have any secure-only devices, RAM, etc?

How much testing have you done with this change? (The main
reason we disabled has-el3 on this board back in 2014 was
as a backwards-compatibility thing when we added EL3 support
to the CPU model -- we didn't have a ton of images for the
board so we erred on the safe side of not changing the
behaviour to avoid potentially breaking existing guest code.)

> ---
>  hw/arm/xilinx_zynq.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3c56b9abe1..37c234f5ab 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -219,14 +219,6 @@ static void zynq_init(MachineState *machine)
>      for (n = 0; n < smp_cpus; n++) {
>          Object *cpuobj = object_new(machine->cpu_type);
>
> -        /*
> -         * By default A9 CPUs have EL3 enabled.  This board does not currently
> -         * support EL3 so the CPU EL3 property is disabled before realization.
> -         */
> -        if (object_property_find(cpuobj, "has_el3")) {
> -            object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
> -        }
> -
>          object_property_set_int(cpuobj, "midr", ZYNQ_BOARD_MIDR,
>                                  &error_fatal);
>          object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,

thanks
-- PMM
