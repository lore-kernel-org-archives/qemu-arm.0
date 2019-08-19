Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3101891wrs;
        Mon, 19 Aug 2019 13:12:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1e0h8+Qew+WRQEsniAx5mvIbBMU2QcLH17Mp0DmnGgygSa+zihU01YT1dr+L5AnjppqTw
X-Received: by 2002:a17:906:7f91:: with SMTP id f17mr22112319ejr.250.1566245526271;
        Mon, 19 Aug 2019 13:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566245526; cv=none;
        d=google.com; s=arc-20160816;
        b=FKOjNe9eLNm8nliRIZU1Ti8cTGHD+unD5NuWlouxPcV87BFeaEFIh128JQ458VXTW9
         f89gICYmv0jAqPiIydnsqK4lNrCGC0di/Y7nvnTTZWplYbzTZjuRy9qB4uCSwKUP3OBs
         j+m6tGmSSVFrD+2jdUCtGjmD1KElIKw2taaMmWsGCoi/LNu18YcxpOjIj6fUA3DrqoJj
         w9usCAX5g1H0bJFMraBUXfkiuyWTGS6btTCWre+QIjueWzD5iCeLHUanIl9sxm6IbozE
         g0iaehXAR8WwLx+TSNCuLeko+BExK1VbXvWVJHMGXxkKLIAP48pujDsrzgYOxbya9Hdi
         yPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vz1QfNHZvV4l7jIAawaglagw5PWlIGcW8gQ+ud4/D50=;
        b=QgPUkLSvOs+jAXEvaxlU2tJ7cCSJ56vZu1CHI2GNfmfnGuHCnwSetVyYbkTeD/O9i+
         eUfmBZmYLnPsVa4P1KKv7+imnDXeCvGfvie4+6Y4KspXOrxk6SlZfG+SyTbV0SY2+nt6
         QDcS2L0TGrBL86VeLY3Dhfl/m/Y0gsxgIsKCSyvPvUMdlzS3AvvmjJ1/Wiv7ZQrBB6lO
         j/UxEVQ+4EtCZRJbRVSgQN/bNJlYMf8df07qGpp5xtLmf/u/vNe7WUNjr3dLUrIuS+1P
         LOI9VwMwc2wqCdH7uVE8TVI4wX3hUpM/jisomh6Ih2U4ivMjvGUZ4/ORX65yZc7cORQT
         gOfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="lnQ/197V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y25si7539140eju.251.2019.08.19.13.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 13:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="lnQ/197V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzo0b-0004Uw-7Y
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 16:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1hzo0F-0004Ts-CT
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 16:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hzo0E-0000P7-Ds
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 16:11:43 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:35961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hzo0B-0000NP-Su; Mon, 19 Aug 2019 16:11:40 -0400
Received: by mail-lf1-x142.google.com with SMTP id j17so2324485lfp.3;
 Mon, 19 Aug 2019 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vz1QfNHZvV4l7jIAawaglagw5PWlIGcW8gQ+ud4/D50=;
 b=lnQ/197VkoJx2KGpOH7fpcQGB9E7gDeIlomPfNeRp6K6UQnPnjQYnhPtkoh9CWFs9z
 knLaO20VWAduOamo+UEhQgVEP+0QGuS3w9XMfrFi+2921Zp3lrcgWC/nAPpN2d7FkN/L
 U3g6Digh7G5h79ySh5X0S3g1HzBTr8EPWDQ3Y26PiHMlaRLncYwzhFRPik8ueax5f+kl
 xmmOaXyinY+7Q+pBAS63mYIJZXr84dyDNKQ4HECVhFuz3BNCRce8HwSLTjpjyGCaBkon
 CjIEvTEwZO1hbpaCYWiImHvN9Vnos6nSwh92bFYJuiXEVd1VKYeX7/XhGCWufcRYZG+8
 4cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vz1QfNHZvV4l7jIAawaglagw5PWlIGcW8gQ+ud4/D50=;
 b=Z5XtotDNz8yBStyDq+/zguRyAlGwVaxfb/g8jBm6n0v76bOqpEofunrYFWhzFpxNgv
 qT08FLr//QsMQto/pGNqXX1Ig+lg12XFSF69IqdcRLMPb4XnvX/Dyyrvhf+72xUidPKg
 kSJMsNlKUyVzOZi3zM3ZXZkTGttc0Wz1f+0gPleVY7XYmFDACzyF8r+PRnIDb5ZxThen
 NIosDavy6pbMy21ypwb09HIA1H9hnjhkOmi414hrZVF4U4GGbT7DP9cTxaK8ZtcbFVyo
 lfgzDnXBdaQzpO78Cz/JHn1Le0TQz1/GjV4zxp8ixvG0ggmCH+TyprBfjJGfomgmapDL
 fb+w==
X-Gm-Message-State: APjAAAXiKwxjs/eu/IZyAU0svY5a7iqL0P8RSS67/sz/QL/cLli0DEb7
 vf7z160dqiTl3CVPQWz7EKzFjVME5btgOB0UHxg=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr13061789lfy.141.1566245498446; 
 Mon, 19 Aug 2019 13:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190817101931.28386-1-thuth@redhat.com>
 <20190817101931.28386-5-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-5-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Aug 2019 13:07:37 -0700
Message-ID: <CAKmqyKPY-JmZZmgYjbWgBggN+nE+uOgzBg8UE8_53ztO4+YsXg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/8] hw/core: Add a config
 switch for the "register" device
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KIxgMELJ5WQU

On Sat, Aug 17, 2019 at 3:24 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The "register" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/Kconfig            | 1 +
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/dma/Kconfig        | 1 +
>  4 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/Kconfig b/hw/Kconfig
> index dbae1c0852..b45db3c813 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -76,3 +76,4 @@ config XILINX_AXI
>
>  config XLNX_ZYNQMP
>      bool
> +    select REGISTER
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index c2a1ae8122..d11920fcb3 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -9,3 +9,6 @@ config FITLOADER
>
>  config PLATFORM_BUS
>      bool
> +
> +config REGISTER
> +    bool
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index f8481d959f..d6cfb2a81b 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
>  common-obj-$(CONFIG_SOFTMMU) += loader.o
>  common-obj-$(CONFIG_FITLOADER) += loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
> -common-obj-$(CONFIG_SOFTMMU) += register.o
> +common-obj-$(CONFIG_REGISTER) += register.o
>  common-obj-$(CONFIG_SOFTMMU) += or-irq.o
>  common-obj-$(CONFIG_SOFTMMU) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
> index 751dec5426..5c61b67bc0 100644
> --- a/hw/dma/Kconfig
> +++ b/hw/dma/Kconfig
> @@ -16,6 +16,7 @@ config I8257
>
>  config ZYNQ_DEVCFG
>      bool
> +    select REGISTER
>
>  config STP2000
>      bool
> --
> 2.18.1
>
>
