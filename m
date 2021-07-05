Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1285681lfk;
        Mon, 5 Jul 2021 07:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzeDW+gK7P+IkuHmSRFINJ174DOWdWrgBDkr5WRSiTzpUjqo4zEbrk8vJuT/fkuDm1yN/r
X-Received: by 2002:a17:906:1704:: with SMTP id c4mr13938286eje.182.1625495885695;
        Mon, 05 Jul 2021 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625495885; cv=none;
        d=google.com; s=arc-20160816;
        b=0nxuUOHUxORYV/tEC8scl0lqnjBEsTGl5dla2AsQ0HUT4X+HIGOENphxXuhsRv356C
         mHW7luGhnFsLapkM6XtQsec+piYiYPAWRG/xM8sfR/G5Wo/qygZJFdx2kXt8XsZR7ATC
         6YtpNYmcK4I9IuTzniljyB29ATv2nKEVcE7F7Y4MBngxt62FoUp7TTuRM15l6hiy9Ff/
         3gv8IavgFpBfJq44r/zl//SFhfUC1zvGCzDpkL2O+mLqumsc8zLE+PYhUUHtDL2UYucf
         opvgFKFmp59vj607iF0DWDvE05lNpm0MxwiDNne3aYwZrloLQStqStBIpiyTXxPQKBo5
         IxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LppOIR9ZmFRBZNwuvu6fjl7ofcQk/QqnRSKrtpEoIHs=;
        b=1Jjxuk+32z4Iyga913bfc4Ht+7jNrDfhcCJ9w2scPZD4wiI3i+P8ZGL3rIQ3AlTSRz
         fUkknl3geRbugfiaqof7cvEP/75FXD7CceQV7EYtrKLjG/NjZSRHVfADblHNj5g2tNyi
         b1duN2b3QKzyiWZhM85WxQK3H9NtbWVubuFGfTBuqQCH8avjOVI0fDx+Sr6knmx738ol
         11x6MsyFTnDgqiQzKJWnGDlZRej3dITQDxrOf4HZnCszsJ3wnqXXvKh6aO6E/ni7EsRl
         rTjCjNs5fUetsi5yt7tPWBzYht+K1LmPfzXaCV3KUaGgLBcTOD6IfAqQq9IPjCxTj39Y
         84FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Qtz1Qdd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cs15si2287151ejc.470.2021.07.05.07.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 07:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Qtz1Qdd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0PjY-0005Xe-Rn
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 10:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0Pj2-00057A-AQ; Mon, 05 Jul 2021 10:37:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0Pj0-0001Q3-NP; Mon, 05 Jul 2021 10:37:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so972204wmq.5; 
 Mon, 05 Jul 2021 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LppOIR9ZmFRBZNwuvu6fjl7ofcQk/QqnRSKrtpEoIHs=;
 b=Qtz1Qdd/AnidMC7mS1aHPCC6M0/vfsoTKSlqRATd6vYHDvB90+2idLdaOkjm2O1Ier
 ataQb48jLwhgBw3YLJvsAZqcP/iCJ7RR4vYiJYjMSWy4hk9MZijPqm4y5ViHgA+V8E6h
 tQejVbEruUizU2obQGOp5YbsAgGBt52qgFFJ5nHWcmdrmWy04opw8BYmkVTukDMsXtIY
 +E1YL3KC6oI7qr6pBSxNLWRVlrUmpxwO7/daCbNnFFhhyuGbEWQWruq5DY3yOoi/yTeo
 xp3CALKynQEITqeKb6OSyWVC2foUJp4yOLelXslLLZ9k15dAG8t/eudzkHEBYxIFmlcP
 /kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LppOIR9ZmFRBZNwuvu6fjl7ofcQk/QqnRSKrtpEoIHs=;
 b=Nndiao5SdDnM1vuDCD1P8tcwpglDvdwAayypnEgkGOCITCrbKUYYpFKXddcw5EXCRX
 okzpSFU/KThUMKEmH1kQrPIbM6wydV9Dj+BjfXxvI79Af/TPRRktavBU5pGm4QZhLC0+
 SWgIyMnneiMov/0Xry6TV47DSUKFznsnJAtjdu+lvpDdIx7iqzDTDC90WaQbkm4GGLQB
 arYwRKrgckKdwCOqxfoJDW7hypEbB/0ClDnknDNKN2NSbugXELyboyQDYdp52VLbTaVF
 ms8oWM64+InAJT924r1G1B6jQGYIFG35DULhvOFTlQ4oPRny4m/0K9a+hClDpp+/vSc4
 iuFg==
X-Gm-Message-State: AOAM531K6kqEIPb36OMvJlFgU+2fCrWcNA3vUUVEgPVvuPLPRedC3zeC
 2oxCuUdUSYWR/eAThk0QBb8=
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr15822033wmi.39.1625495848823; 
 Mon, 05 Jul 2021 07:37:28 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z7sm11150318wmi.1.2021.07.05.07.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 07:37:28 -0700 (PDT)
Subject: Re: [PATCH 2/3] docs: Add skeletal documentation of the emcraft-sf2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210705122011.753-1-peter.maydell@linaro.org>
 <20210705122011.753-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <706f629c-4780-552a-fac0-53ab4002db21@amsat.org>
Date: Mon, 5 Jul 2021 16:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705122011.753-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HHTsC/QxW+T4

On 7/5/21 2:20 PM, Peter Maydell wrote:
> Add skeletal documentation of the emcraft-sf2 machine.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/emcraft-sf2.rst | 10 ++++++++++
>  docs/system/target-arm.rst      |  1 +
>  MAINTAINERS                     |  1 +
>  3 files changed, 12 insertions(+)
>  create mode 100644 docs/system/arm/emcraft-sf2.rst
> 
> diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
> new file mode 100644
> index 00000000000..9f10b86427a
> --- /dev/null
> +++ b/docs/system/arm/emcraft-sf2.rst
> @@ -0,0 +1,10 @@
> +Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
> +==============================================
> +
> +The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
> +Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
> +based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
> +The SoC is based on a Cortex-M4 processor.
> +
> +At the moment only the system timer, system registers and SPI
> +controller are modelled.

Also UART and EMAC :)

> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 0a3ef309472..d316e684106 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
>     arm/sabrelite
>     arm/digic
>     arm/cubieboard
> +   arm/emcraft-sf2
>     arm/musicpal
>     arm/gumstix
>     arm/nrf
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76a2c608d1e..dbbd71958ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1007,6 +1007,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/msf2-som.c
> +F: docs/system/arm/emcraft-sf2.rst
>  
>  ASPEED BMCs
>  M: Cédric Le Goater <clg@kaod.org>
> 

