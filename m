Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2323569lfg;
        Mon, 2 Mar 2020 03:23:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9MzdFHWz6HAZeyXEk93x2xa/GxH3ejKobZcgap5shRKxoYSO56GH9Qms9oeoM1qbSASnZ
X-Received: by 2002:ac8:1ca:: with SMTP id b10mr14973356qtg.314.1583148198508;
        Mon, 02 Mar 2020 03:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583148198; cv=none;
        d=google.com; s=arc-20160816;
        b=MlRZlx6pRkWOUgCpxCW4f153ZPFGYXuq1GtQXB9EZueN4XVQxGn+luBtRvlSsky3uh
         6EkjkTDY2OtMxvAfuDpnx5pBR3opAuOZvt7kWUaDhKp1U958auFNv+3RezTbIkYCiU3a
         JKbV085UnIleRsTpUbUHjgFnnaeZBdSjN/Aw24ItgVJ3dj345LZiwPdJ0K2CchaBOjaB
         cULvyMVN7RtkPGAoTiBcDGFlUaK7QlGqCom+69bKZNfWrbpihi9Wni2O5GWgg2Es1jkF
         aN0KPYjcDX7sujTU7JqFEnb/ZIPJunv0LP/W4DYmBdmrocGs1UFJORBhepFDep90u7Lm
         P6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Axy/r17mlcKBB2b5GnWrMnEY/Pjs/UUWkrC5McDPdg=;
        b=yQvOZm5Ws5404m2Z91qYv8T7hpy22TynxrMQT0Ecy2P1pSBnqWLGBPBDYOHhir4pIR
         Wox85aoFHR6rQ7V4k9FwTp08Mf5BaSNdNj81sxBWsJZI3JIROGYWPEQrWMsAl2Iv7WQc
         MHWaFKDwcVaNqb9aLXil6mvRXFSdASGxdeK3gaqxJqqQPDw1li6pwoqTM9tcQIbHnXRn
         yM7nk5ItQdNw7Y0LC2fgDq3DgY6PorMEe4gixhr5ruBgSmSkQA9jI7Q6ELgN8QBqmypw
         O0fDNQlKx//o14RYIryC8vc44Fe49dwS7/YcsUggY+X9TwL8NzjqqIq3rVncWA924kjt
         V3nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQqXr+pj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si1358063qvw.150.2020.03.02.03.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 03:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQqXr+pj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jAL-0003cb-V0
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 06:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jAE-0003ap-B8
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:23:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jAD-0005lT-CS
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:23:10 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jAD-0005lH-7r
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:23:09 -0500
Received: by mail-oi1-x243.google.com with SMTP id g6so8199669oiy.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Axy/r17mlcKBB2b5GnWrMnEY/Pjs/UUWkrC5McDPdg=;
 b=XQqXr+pj+ebDznUxaHFEl6QMw9MFOy0HJELLEWE25FDoACcZqWwQXS2LQadk7WTIHJ
 d4GzYP4scZHRQaSG1PD5k8Ql2jOOggfGgbiJ7+VK/PwoD+cFH2XkRfBIGaArnJDr77s1
 wC2XPWYvfeQrPOAnQdhNgAErUH25pmw3N7Tdaw5jA4BjuLnk71mio7QApqhOGRAWG3t1
 gt3xOkLp+0rlKqYtcsZXzfsUza81YDPLfbMyljIFMQzGvcxRj3hR33mrOmpb3+/nU/EB
 ZDj+H8plyCu9UGJY/3BpfDep9bHKyhf9AWK0mD8JhmUQB1MDvfJZcCbBHiGLk/svc/lv
 Syxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Axy/r17mlcKBB2b5GnWrMnEY/Pjs/UUWkrC5McDPdg=;
 b=gv4EyG9N4yoKC0EFSAngqL2ugisvdAOkC1uU2eMbV5DSw/ePXWClW5jUiVyD0MnJct
 hFXJux2wIRTmMAINuM9jjUiijf6kU+hkveFiY5dItrMaXtl34HRKrQOP0/aRcBMXl9zT
 MBwjjGfwLvCC62vj4L3SV5YpcWegtPcxkjOtuXD+pDEHuLYqZTc4oXniRjnkW5sJDyFJ
 MKOvzN+pbl2/wQ8roO8QMb0KQa/4Tsdp2ly6DWBCKiFg7tfC6zWLevmqaRbF0sPI3ZdR
 yWKRTBeIE5l0Z0KR6KbwyjmOXr26Tow97f9oRlFb1JtpEjmTkjx8JxD4UsD0WIdkxvs4
 EqLg==
X-Gm-Message-State: APjAAAVPx0DemcNwKuzzvajQbE99Z3mK+ZxcJFwTs8WBHOmFDfRxaLi1
 ixuJxaPl2xLcHV6nyuLY5jutxfHC6thtRPRK8A/xCw==
X-Received: by 2002:aca:b2c5:: with SMTP id
 b188mr11333058oif.163.1583148187792; 
 Mon, 02 Mar 2020 03:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20200227154424.6849-1-edgar.iglesias@gmail.com>
 <20200227154424.6849-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200227154424.6849-2-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:22:56 +0000
Message-ID: <CAFEAcA9ap6MLmQvdD82HaioDeQj3vxtsyLaTN-OGEu0BDygBCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/arm: versal: Add support for the LPD ADMAs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /gFjKqk4uw4i

On Thu, 27 Feb 2020 at 03:17, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for the Versal LPD ADMAs.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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

It would be more in the modern style to write it with the child device
struct embedded in the parent struct, object_initialize_child() in the
parent init, and object_property_set_bool(..., true, "realized", ...)
in the parent realized, but I guess this fits with the way the
rest of the existing device is written.

Series applied to target-arm.next, thanks.

thanks
-- PMM
