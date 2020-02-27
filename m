Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4213185lfg;
        Thu, 27 Feb 2020 01:48:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+A5B5vYugz3NGjxykQt/ZL+MFx2Yzj/DgRsv+Gml7MFHUlxE5RydVrHylKaT/b/VErHWt
X-Received: by 2002:ac8:425a:: with SMTP id r26mr3993492qtm.138.1582796906456;
        Thu, 27 Feb 2020 01:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582796906; cv=none;
        d=google.com; s=arc-20160816;
        b=h12jPTx5fL4Zu61/vPTUGfMJEKKmWvGwWwUOMqUrje6vZemvvkkVn8x+x8Ip7B1l+V
         eNj3iFtdkBCa61mMCpBc03wBxLiL6G7DXB8uurT0oywrqf3ZroH867gPmcbOlrXBCwe0
         KpZzw1CpVJcald6VRjOjNmeO4dRUgXY9P+fYCOxk5JReooQa1+h4A44YKh+nnKuhKu+Y
         h0mx2EM2FqdNeezTIZgGfX4dpdqhM5vl7cWu5psWCAS0cVs8zrwKn2bdti8i0HP8uUHg
         +Nk5WdnSULPHNuwzyL/lTU+IwlaTKCV0C2JUlRxSF1L4KA3LOAhLGfFxvyF4B9FzQMiS
         S25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Lt+Dpxb/bWDBt49mWdFLT5qQchHkjiDmAp18yA6U0L4=;
        b=uQ0z4pCnNjjQ7X2RmrFSN3t2IFPylAlVNK+Hv7cqvvCvBS/AD+aM5FvwbGDDhdbBrK
         Rod26EPzpp0g88cqbS/dCX84jzu1S34nAfhK/0QcZNk1G9Dv17Jvx9/IMICG+A//5hNp
         eQ98MPbkDRSIy9JU82PMl1wLpk2W0etDp3+xnsO0hN5HKHuyXlCUIjkr2/B7PYz9Xt5B
         P5jFSQYUcMah42GwVYL+qkuljgPSxNIVCbbdSiE5GPmu2XunIclqyH2DneIV09+W8C5+
         sjO85YT5MTu4DXZNzHIqRcGiVPM/liMVMpjweieJFEUjxOiBjdNjS2hI/eEEJvmE923M
         91DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jexaIojI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r188si1152567qke.50.2020.02.27.01.48.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 01:48:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jexaIojI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7FmL-00080t-TW
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 04:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1j7FmA-0007zC-OL
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1j7Fm9-0006Qt-ML
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:48:14 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40132)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1j7Fm6-0006PF-SV; Thu, 27 Feb 2020 04:48:11 -0500
Received: by mail-lj1-x242.google.com with SMTP id 143so2495519ljj.7;
 Thu, 27 Feb 2020 01:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Lt+Dpxb/bWDBt49mWdFLT5qQchHkjiDmAp18yA6U0L4=;
 b=jexaIojIjPIAZwnoIOT0E63rtYCjV5gJOD/TkJh7tiQ8zSAfkwEqIryC7oOCFmTFVh
 PlI0H+tDIr0RznZLpWu7k1MWpczwnNeDikbmjzcdJToiyU6joDk2rGNjpRW2E6tWa8dR
 7YAcwV1nysmj2DlAmN2jhrjro5Zs28CI5/6DgRg+vkcRYJsU9RL8I+HWJr1njg5BAAsN
 bre/KUO8w3LzZVjo4EHN4Hun+hjoKngNGDCtYF14fILkUnPJNzFBsmTbHEMUY60Glv86
 eZoHchx3qYAz8DeYXqN2lWq0ISLJEb0Oam03gY5pOu38KIVHlUpG/8PRFd0cQL3X5imS
 4YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Lt+Dpxb/bWDBt49mWdFLT5qQchHkjiDmAp18yA6U0L4=;
 b=EsIhdBFDP62btc/wKLKoSnMDxhMZ9JKHLCIK0Q732mlGdxnXDTjICv2gTO8Z8v55lh
 C3jmofmXpZx0Amqbx+4Hz1gazlJZJ/koLSA1UseAve1gcWPYdrgyA5sUNTFcLmit4fT3
 Uh2yu5ccGG4YIM5keE3e3ufW2roJKxKGf0mdWYMTwKjRjuhtO5IlxOZlGLNL0iODIdx3
 ImnqeQ0nnkE0k21jiElWtg7gWl3Iq4DFLSv8fML1hM+2UAyMzunqitMoGBifMrDsN+1d
 91Y7JGoxM4QobOgHaOQ+5jzDgwlSJMScJbq1gxtdeqenEw/JWM9OBv0VTs1IHC+jgjtm
 FmyQ==
X-Gm-Message-State: ANhLgQ0xyB5tlWf1I4P+CLiv1YTAmIChkzMwDYzRHmtytz1cuVbA+qfA
 uerE7p4UQG1OsaGTDolpt/U=
X-Received: by 2002:a2e:9744:: with SMTP id f4mr2429205ljj.267.1582796889137; 
 Thu, 27 Feb 2020 01:48:09 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 q6sm2414785lfo.69.2020.02.27.01.48.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 01:48:08 -0800 (PST)
Date: Thu, 27 Feb 2020 10:48:06 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 1/2] hw/arm: versal: Add support for the LPD ADMAs
Message-ID: <20200227094805.rnpfrvmpl7bovyqc@fralle-msi>
References: <20200227154424.6849-1-edgar.iglesias@gmail.com>
 <20200227154424.6849-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227154424.6849-2-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /DXUYCDjPzOC

On [2020 Feb 27] Thu 16:44:23, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for the Versal LPD ADMAs.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/arm/xlnx-versal.c         | 24 ++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h |  6 ++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 1cf3daaf4f..f9beba07ed 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -193,6 +193,29 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_admas(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.adma); i++) {
> +        char *name = g_strdup_printf("adma%d", i);
> +        DeviceState *dev;
> +        MemoryRegion *mr;
> +
> +        dev = qdev_create(NULL, "xlnx.zdma");
> +        s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
> +        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
> +        qdev_init_nofail(dev);
> +
> +        mr = sysbus_mmio_get_region(s->lpd.iou.adma[i], 0);
> +        memory_region_add_subregion(&s->mr_ps,
> +                                    MM_ADMA_CH0 + i * MM_ADMA_CH0_SIZE, mr);
> +
> +        sysbus_connect_irq(s->lpd.iou.adma[i], 0, pic[VERSAL_ADMA_IRQ_0 + i]);
> +        g_free(name);
> +    }
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -274,6 +297,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_apu_gic(s, pic);
>      versal_create_uarts(s, pic);
>      versal_create_gems(s, pic);
> +    versal_create_admas(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index d844c4ffe4..6c0a692b2f 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -22,6 +22,7 @@
>  #define XLNX_VERSAL_NR_ACPUS   2
>  #define XLNX_VERSAL_NR_UARTS   2
>  #define XLNX_VERSAL_NR_GEMS    2
> +#define XLNX_VERSAL_NR_ADMAS   8
>  #define XLNX_VERSAL_NR_IRQS    192
>  
>  typedef struct Versal {
> @@ -50,6 +51,7 @@ typedef struct Versal {
>          struct {
>              SysBusDevice *uart[XLNX_VERSAL_NR_UARTS];
>              SysBusDevice *gem[XLNX_VERSAL_NR_GEMS];
> +            SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
>          } iou;
>      } lpd;
>  
> @@ -74,6 +76,7 @@ typedef struct Versal {
>  #define VERSAL_GEM0_WAKE_IRQ_0     57
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
> +#define VERSAL_ADMA_IRQ_0          60
>  
>  /* Architecturally reserved IRQs suitable for virtualization.  */
>  #define VERSAL_RSVD_IRQ_FIRST 111
> @@ -96,6 +99,9 @@ typedef struct Versal {
>  #define MM_GEM1                     0xff0d0000U
>  #define MM_GEM1_SIZE                0x10000
>  
> +#define MM_ADMA_CH0                 0xffa80000U
> +#define MM_ADMA_CH0_SIZE            0x10000
> +
>  #define MM_OCM                      0xfffc0000U
>  #define MM_OCM_SIZE                 0x40000
>  
> -- 
> 2.20.1
> 
