Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1398446lfb;
        Thu, 14 May 2020 06:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2xOttyg2POiuuovjYJT5VUkSBTWWzc08T/okBGhzMko7ZP3Ba0qlj69SyUYq+Ad+7hAgb
X-Received: by 2002:ac8:7941:: with SMTP id r1mr4713192qtt.120.1589464709357;
        Thu, 14 May 2020 06:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589464709; cv=none;
        d=google.com; s=arc-20160816;
        b=sCXC16DEtZgdIq9mdd+LFYy53nu8/jop0J3DTg0yQ1F4Oe/zp0U8kPXjMWYtU/FE3x
         ohUxEoX1qq21h3JXtD+AvApVMvKYCYtBRO/dw3lXx2LJRIok7jhVcg2EqKO4EKgKdo5d
         QIY0stNw05SOeAO6azRDZ6fIjSD8LppC6j0vCUkG6COvX74ZGfpcWG4NzakaVRaOJ4Ak
         AlQSD8ByxYIoEr1n1rIPUOaFLd9iwqSvUof6jw/a/xFbvfHaM7CHZMINhOq8+0QzF3TY
         8SHgF8WgRnd7/fLpDij3nEklC+noOCkhKX1fylvvwGGnhIWQ9s3y+gGIAey+3YHiT9Bh
         y2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=vPFG14ZLoXv6rUK5NBabMwsr/zCnN6MHR7a2QHzSP9Y=;
        b=ccGryULIeP7Durc1t5aTgMnQsVZZz4Zdazki2WiReNPwVoarOAPxGrQQX0OfcrTVLb
         h2aA2irda/Xx9etsYUM4b4nwiKP2AnUF9N6GBS2iIRVfjf+xxlNhji1nvF2pGaB8El4Z
         JY7FodHeQ8Box7NbI5CpzLOAXVDTXSmBJBQe2+ADS2HFeKZzmfGR8zax2NVEFr3m8z67
         khCbEzORfBnQRTSS78e3snqWZULFhW6zA5uT2DLgFoAtt91e6Drvahu6or7LzGfl/ueo
         b6l6WVq69b1yr729koImUegjIwjzYz+n/8smZvcV/9cQjhLBS+gnK5nX2KrVuge7WfRj
         xPuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aOPsa59W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u186si1564516qkc.342.2020.05.14.06.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 06:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aOPsa59W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZENY-0003nh-Oy
	for alex.bennee@linaro.org; Thu, 14 May 2020 09:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZELS-0007eb-0h; Thu, 14 May 2020 09:56:18 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:33198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZELO-0000Iq-4D; Thu, 14 May 2020 09:56:17 -0400
Received: by mail-lj1-x241.google.com with SMTP id w10so3658237ljo.0;
 Thu, 14 May 2020 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vPFG14ZLoXv6rUK5NBabMwsr/zCnN6MHR7a2QHzSP9Y=;
 b=aOPsa59Wi8V1QefR9qm+VCgcp6gaXjIQ6ahZzuGRlOUyOTapT4Bvhe6mRCyfgcfeac
 L71HRzvfT133/t8PK6e1y5rMxyDnG/UcziaQK4FEsCaERO8QZRPh/TMGJ7wbTZbjIC8h
 OV/rC3G4kUaqG+i8tI42LazQbC1r7UFY0G9Fs0CjrwA5iSbJ13D0o0SpujR/yk/I8C2i
 /OmPRGDtW7ybPTBBBpgy8Kolr8rUWEpgbZcVaVHyF23U8i5Su+m1IPdbOcYbtOnppZ7Q
 uNgt2LV2tbgFFDlJJkx4cI3lE0ZSYtPNgrdZUugzzKR/qW0H9BkUlhCU/4XHg15OUxZV
 hoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vPFG14ZLoXv6rUK5NBabMwsr/zCnN6MHR7a2QHzSP9Y=;
 b=MDUow8sy+lYLZLLSAXNBJXJvRIah6yfg2tJ76T0gPREyW49qabXsxp0HH6ibj5Yd+X
 CWXHZFf+dwuxUV6aI487J+QLSwUrxU6823bppcWM4thQ6s7lNahzS8olIJJfokXPXbeM
 yrukmMDjg3ywlKGo3anvY7bpINkUIY37UUg+KWS/x/V5Kpl+3dr2SvhGAoWPjStX4G9Z
 l5l7fXgT7ed6O9jm3gLA+8M0yiU5LZZKgf/KWsGw3W0DJqdSXWUQYUg4/uQ7k2rZAsf7
 nQnWNLUTRG1SgXiaufg0RvIAQUEcKkdg/AxFtSImNjAVDrz+UPlc1q3i4yclcMeH4ozr
 /Lsw==
X-Gm-Message-State: AOAM531keim0FZ7gzrtrJQ9OEbygv5Z7gVQXGWHrN8I889haHzY78MRU
 XP9PbKBm5OBaz630+kb3uImg9Pe8EHI=
X-Received: by 2002:a2e:720b:: with SMTP id n11mr2725889ljc.142.1589464571603; 
 Thu, 14 May 2020 06:56:11 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id x2sm1536060ljc.106.2020.05.14.06.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 06:56:11 -0700 (PDT)
Date: Thu, 14 May 2020 15:55:54 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/5] docs/system: Document Arm Versatile Express boards
Message-ID: <20200514135554.GY5519@toto>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151819.28444-4-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARxK3Ka/2y2P

On Thu, May 07, 2020 at 04:18:17PM +0100, Peter Maydell wrote:
> Provide a minimal documentation of the Versatile Express boards
> (vexpress-a9, vexpress-a15).

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/vexpress.rst | 60 ++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst   |  1 +
>  MAINTAINERS                  |  1 +
>  3 files changed, 62 insertions(+)
>  create mode 100644 docs/system/arm/vexpress.rst
> 
> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
> new file mode 100644
> index 00000000000..7f1bcbef078
> --- /dev/null
> +++ b/docs/system/arm/vexpress.rst
> @@ -0,0 +1,60 @@
> +Arm Versatile Express boards (``vexpress-a9``, ``vexpress-a15``)
> +================================================================
> +
> +QEMU models two variants of the Arm Versatile Express development
> +board family:
> +
> +- ``vexpress-a9`` models the combination of the Versatile Express
> +  motherboard and the CoreTile Express A9x4 daughterboard
> +- ``vexpress-a15`` models the combination of the Versatile Express
> +  motherboard and the CoreTile Express A15x2 daughterboard
> +
> +Note that as this hardware does not have PCI, IDE or SCSI,
> +the only available storage option is emulated SD card.
> +
> +Implemented devices:
> +
> +- PL041 audio
> +- PL181 SD controller
> +- PL050 keyboard and mouse
> +- PL011 UARTs
> +- SP804 timers
> +- I2C controller
> +- PL031 RTC
> +- PL111 LCD display controller
> +- Flash memory
> +- LAN9118 ethernet
> +
> +Unimplemented devices:
> +
> +- SP810 system control block
> +- PCI-express
> +- USB controller (Philips ISP1761)
> +- Local DAP ROM
> +- CoreSight interfaces
> +- PL301 AXI interconnect
> +- SCC
> +- System counter
> +- HDLCD controller (``vexpress-a15``)
> +- SP805 watchdog
> +- PL341 dynamic memory controller
> +- DMA330 DMA controller
> +- PL354 static memory controller
> +- BP147 TrustZone Protection Controller
> +- TrustZone Address Space Controller
> +
> +Other differences between the hardware and the QEMU model:
> +
> +- QEMU will default to creating one CPU unless you pass a different
> +  ``-smp`` argument
> +- QEMU allows the amount of RAM provided to be specified with the
> +  ``-m`` argument
> +- QEMU defaults to providing a CPU which does not provide either
> +  TrustZone or the Virtualization Extensions: if you want these you
> +  must enable them with ``-machine secure=on`` and ``-machine
> +  virtualization=on``
> +- QEMU provides 4 virtio-mmio virtio transports; these start at
> +  address ``0x10013000`` for ``vexpress-a9`` and at ``0x1c130000`` for
> +  ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
> +  provided on the command line then QEMU will edit it to include
> +  suitable entries describing these transports for the guest.
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index d1196cbe01c..4779293d731 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -73,6 +73,7 @@ undocumented; you can get a complete list by running
>     arm/integratorcp
>     arm/realview
>     arm/versatile
> +   arm/vexpress
>     arm/musicpal
>     arm/nseries
>     arm/orangepi
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f84e3ae2c6..74cff1c3818 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -826,6 +826,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/vexpress.c
> +F: docs/system/arm/vexpress.rst
>  
>  Versatile PB
>  M: Peter Maydell <peter.maydell@linaro.org>
> -- 
> 2.20.1
> 
> 
