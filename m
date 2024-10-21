Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2174557njb;
        Sun, 20 Oct 2024 22:58:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWY3VlqrB2b93gK4uFfW7jeGtazyBUPGzVjXfDpjgWZ1UC+bZcYMJIBMzQeCHuYHlIf3gF8caenLIdGNA==@linaro.org
X-Google-Smtp-Source: AGHT+IGMDr7UiHGtUKsYcrLtYuIBEs4lndijz11gSWMLbKSrapUSL4QtEFtYZUhNY++Gg9iNhG6K
X-Received: by 2002:ac8:5d03:0:b0:460:8ab1:d1dc with SMTP id d75a77b69052e-460aeceec24mr144562321cf.1.1729490303920;
        Sun, 20 Oct 2024 22:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729490303; cv=none;
        d=google.com; s=arc-20240605;
        b=TQOB7MhfDw/h0ld611y6hfZVZfNzfp5uQ0/8ZaAENSCds8fL/7IGdI+0/tHnpAJ9Iu
         LK0LTLc1Ib/bnsyM6e2xr8kyZr2c+AEheGq1yfZa8t55nOT+Pf8ZsDptvDkSH6G0N8k8
         BxZPrJLKtcuPpurWTsR/fPd6cUFf1z7KEwRUphNY5JYf2fJsRraccznnQECPLsteTR9+
         GYecytg4vpEoa3vgnU0P2W3pNvucv1bH/8rKjYGnPpH38WjDeFdNRownXZHRFGOJSA4V
         mRyV/+XOZ0hwig68nJLaqzYPqLNoePKIqZBL09kpx9hJRPBTpcoPK+aVT5RmyrAMvyRt
         wYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=ZJYBiVZapxI0/LkuNNpqlVNcQNFGzgfX994vIBW+/Qo=;
        fh=eN7lZ9heibeUB6u5SzBPQic8EU7Yz3B8TtcMbhjB3Lg=;
        b=Pje3zNKMmszMKZmQm7UyfhnEj3mmJGMp57BtsqgfG6CXCWWKqNotkjtWV51uRe25++
         O7gRju5GwsgIfoxaei1JjBrkPRsy7aXVyy5Y2Q+4dFb0YxM5oMJEWkIPli1bZQGfed5v
         ki3gmXmk9cPezr5O498rT5n4vpylsfZmhJ4W3j1eUoXn6t5b/XE0xM4zg27ukqvq6qCU
         IdbobaqRDPBrPSOV1oCI8LpS7+TjD49MoFDmi1sQPRmLYy82xBG5AmWowz0Z7Wlw0G9y
         x/LDSKUcDLKJdIkraBy69ogW+bbDdh3pfD8g9T66ZE+cJez0x/JiUO7F58xu5WtBjDMc
         4W4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3b34cb8si34819161cf.62.2024.10.20.22.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 22:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2lQe-0000sm-I9; Mon, 21 Oct 2024 01:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lQZ-0000lm-DH; Mon, 21 Oct 2024 01:58:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lQW-0005IF-I5; Mon, 21 Oct 2024 01:58:02 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX4NL3ksGz4wyh;
 Mon, 21 Oct 2024 16:57:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX4NH4bvZz4wc1;
 Mon, 21 Oct 2024 16:57:51 +1100 (AEDT)
Message-ID: <09e1241f-2d7b-4762-813b-dd99d5005263@kaod.org>
Date: Mon, 21 Oct 2024 07:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] docs/system/arm: Add placeholder docs for
 mcimx6ul-evk and mcimx7d-sabre
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
 <20241018141332.942844-7-peter.maydell@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018141332.942844-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2E4vjw08nUZw

On 10/18/24 16:13, Peter Maydell wrote:
> Add placeholder docs for the mcimx6ul-evk and mcimx7d-sabre boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   MAINTAINERS                       | 2 ++
>   docs/system/arm/mcimx6ul-evk.rst  | 5 +++++
>   docs/system/arm/mcimx7d-sabre.rst | 5 +++++
>   docs/system/target-arm.rst        | 2 ++
>   4 files changed, 14 insertions(+)
>   create mode 100644 docs/system/arm/mcimx6ul-evk.rst
>   create mode 100644 docs/system/arm/mcimx7d-sabre.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c3325628c9..2866737261b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -791,6 +791,7 @@ F: hw/arm/fsl-imx6ul.c
>   F: hw/misc/imx6ul_ccm.c
>   F: include/hw/arm/fsl-imx6ul.h
>   F: include/hw/misc/imx6ul_ccm.h
> +F: docs/system/arm/mcimx6ul-evk.rst
>   
>   MCIMX7D SABRE / i.MX7
>   M: Peter Maydell <peter.maydell@linaro.org>
> @@ -804,6 +805,7 @@ F: include/hw/arm/fsl-imx7.h
>   F: include/hw/misc/imx7_*.h
>   F: hw/pci-host/designware.c
>   F: include/hw/pci-host/designware.h
> +F: docs/system/arm/mcimx7d-sabre.rst
>   
>   MPS2 / MPS3
>   M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/docs/system/arm/mcimx6ul-evk.rst b/docs/system/arm/mcimx6ul-evk.rst
> new file mode 100644
> index 00000000000..8871138ab3e
> --- /dev/null
> +++ b/docs/system/arm/mcimx6ul-evk.rst
> @@ -0,0 +1,5 @@
> +NXP MCIMX6UL-EVK (``mcimx6ul-evk``)
> +===================================
> +
> +The ``mcimx6ul-evk`` machine models the NXP i.MX6UltraLite Evaluation Kit
> +MCIMX6UL-EVK development board. It has a single Cortex-A7 CPU.
> diff --git a/docs/system/arm/mcimx7d-sabre.rst b/docs/system/arm/mcimx7d-sabre.rst
> new file mode 100644
> index 00000000000..c5d35af1d44
> --- /dev/null
> +++ b/docs/system/arm/mcimx7d-sabre.rst
> @@ -0,0 +1,5 @@
> +NXP MCIMX7D Sabre (``mcimx7d-sabre``)
> +=====================================
> +
> +The ``mcimx7d-sabre`` machine models the NXP SABRE Board MCIMX7SABRE,
> +based an an i.MX7Dual SoC.
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index ace36d1b17d..1f806cf4a46 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -97,6 +97,8 @@ undocumented; you can get a complete list by running
>      arm/nrf
>      arm/nuvoton
>      arm/imx25-pdk
> +   arm/mcimx6ul-evk
> +   arm/mcimx7d-sabre
>      arm/orangepi
>      arm/raspi
>      arm/collie

