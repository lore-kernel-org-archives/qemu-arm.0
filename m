Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4693731lfm;
        Mon, 27 Apr 2020 15:25:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypJRvverqALTh6jYeZt0rRdR/2v3jZ2l2VAoSWuSGs8C17Z345VBo6lQzppZVllw4hpiJAXx
X-Received: by 2002:a05:620a:16db:: with SMTP id a27mr23504806qkn.116.1588026320243;
        Mon, 27 Apr 2020 15:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588026320; cv=none;
        d=google.com; s=arc-20160816;
        b=NPcAqB/ZwHhAsPNIneMsXS+7jzWCg+a5zINqFEJtxymRk3WVnMzYnMi/HOz7mVGFJy
         NB5y5zpXTmcBGTPOM6qzE/fjY3VE2Bdqbrrqgli+KR9TNtTVPyc9Eknd85/rMu7S+qhA
         ha9T3MAbjyRmBRa6z5C8O/mkOF/lWDut3QxjAlIFXZlKpEGo35NoTErOUZ0/ZrYs+eki
         rXUFPfkq8myLcI6m9+8PKxk7kmagaTc1v7B9nboWPsvUCFGztrz5a7Krgoc+QAM+NQH0
         +P4C7Gy7GFVZHqpqk+scC75AoMN0frsBy50+h5MuTGoy9W7xpuU0eh+6LDkV2PGPJKN9
         M+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4d6orcMdn3i38NRXjqfckA7ZIJIuprEpeNRLSnhBce8=;
        b=q0r8+w7f4Ec87XQyCDTwb3i2q5G8tGb1JhHxy3b83q01coX5GPlOqL/ZqSItBgqBdT
         pybQbaWOpG9b5x/+U489JiRcWJKXXlsdrcDRMC+3Jt7ydE0fvjlxa1cwxUnDZfU08Vob
         Abj2li5C00azh22r/zk2AaTz+aI8FYc2jCvQm7LQTK5pueUL22ho81mPsuF/rwgfp2sC
         wPUs11GMnIzfQs+YF7t/MXoJFsIPaE7vieZf5aN/kgPrcy/24TihSLIvyg+Em1Hz6C0l
         WQ3hnTeBcbX7BKZcd0MnMSgdgpTapuPSllwfExBdBNoVg0FceOcPlQ5ylesdKnW8rzsG
         6Okg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GQoGpVWe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si1373406qvu.154.2020.04.27.15.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 15:25:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GQoGpVWe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTCBi-0003W5-K0
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 18:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCBX-0003Ug-52
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 18:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCBW-0001a5-Ln
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 18:25:06 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:39388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTCBU-0001Ze-Du; Mon, 27 Apr 2020 18:25:04 -0400
Received: by mail-il1-x143.google.com with SMTP id r2so18368361ilo.6;
 Mon, 27 Apr 2020 15:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4d6orcMdn3i38NRXjqfckA7ZIJIuprEpeNRLSnhBce8=;
 b=GQoGpVWewjY9XNx8Gnb9BsAKWvo36OVkwpkt4i5O+PQhCr4S4QWD7op0YjlbnNjclZ
 HmwK/ghEdKEwrE1OeE8XCWOoXwu4tbrT7mj09Vtfg7uMYqV1psl4OXcbSkyBkvRicuLT
 rsVV11fXlPxPjuxnYSbLhjFM35FDzUOXOKZPwRAqY3fDeUUClPJljWRoy05NQr3tZEGO
 6I1Li1gcKZI1ojp3MIuiG/gxlU9butuQkpH5WtW6N3VZpQCgfsfh7OiEkwzps63VtUl3
 cMqz4yr1Gr3KLiCTrjMYPrkLvO79a6IU9+pvk7F5nKUgVUvNLHFJKca7WWsh9dWuFk9t
 FgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4d6orcMdn3i38NRXjqfckA7ZIJIuprEpeNRLSnhBce8=;
 b=FaNN5QcbwgfOiTV0Pu3SKrOK84Vtv45S+GIGLQK/Yjss3QOXTHkjgj3qlkY4qAOTpx
 9whkCtk3SqmssDdw0Ww4E2JmPXYY9/Qu7EAlySu7fDoooapW6QcauH8qr6021NgiYBO2
 EI5iZwYbgZJWTttSASzlkIY+PBd2xp6P0IgTxu3S5SK2RuzGRKmZbWG2rWBfGHFerM4/
 0z5gH14bFCoufe3L+Q9P9TB+6W+8IZ7NNr2GDMfRrqUHH5T5/xGG3F2yxqKF2QC52UIj
 1X6dl4fuClpdtENO4dVnNp5+dh4CghzPrn128Ojx3CTJxMCi83gTrpk2wVtTS0VhQ67E
 HduA==
X-Gm-Message-State: AGi0PuY2cGUUp1W8PMhQp0fAZpnFELTvVwhcq+IvCJK8It9TPkwgCC5l
 bUtjFsGTUuG8fDRxK1P91ucceDB50bFe02NldIU=
X-Received: by 2002:a92:9a5c:: with SMTP id t89mr24196092ili.267.1588026302807; 
 Mon, 27 Apr 2020 15:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-5-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-5-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 15:16:24 -0700
Message-ID: <CAKmqyKNd55rbOCtWYk8LUJ31WhpDsp9AN+qtYqmEyh6QTKG4EA@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] hw/arm: versal: Embedd the UARTs into the SoC
 type
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::143
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B4lofBshZw77

On Mon, Apr 27, 2020 at 11:17 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Embedd the UARTs into the SoC type.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c         | 12 ++++++------
>  include/hw/arm/xlnx-versal.h |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index cc696e44c0..dbde03b7e6 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -21,7 +21,6 @@
>  #include "kvm_arm.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/xlnx-versal.h"
> -#include "hw/char/pl011.h"
>
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define GEM_REVISION        0x40070106
> @@ -144,16 +143,17 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
>          DeviceState *dev;
>          MemoryRegion *mr;
>
> -        dev = qdev_create(NULL, TYPE_PL011);
> -        s->lpd.iou.uart[i] = SYS_BUS_DEVICE(dev);
> +        sysbus_init_child_obj(OBJECT(s), name,
> +                              &s->lpd.iou.uart[i], sizeof(s->lpd.iou.uart[i]),
> +                              TYPE_PL011);
> +        dev = DEVICE(&s->lpd.iou.uart[i]);
>          qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> -        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
>          qdev_init_nofail(dev);
>
> -        mr = sysbus_mmio_get_region(s->lpd.iou.uart[i], 0);
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
>
> -        sysbus_connect_irq(s->lpd.iou.uart[i], 0, pic[irqs[i]]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irqs[i]]);
>          g_free(name);
>      }
>  }
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 6c0a692b2f..a3dfd064b3 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -15,6 +15,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/intc/arm_gicv3.h"
> +#include "hw/char/pl011.h"
>
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  #define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
> @@ -49,7 +50,7 @@ typedef struct Versal {
>          MemoryRegion mr_ocm;
>
>          struct {
> -            SysBusDevice *uart[XLNX_VERSAL_NR_UARTS];
> +            PL011State uart[XLNX_VERSAL_NR_UARTS];
>              SysBusDevice *gem[XLNX_VERSAL_NR_GEMS];
>              SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
>          } iou;
> --
> 2.20.1
>
>
