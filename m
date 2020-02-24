Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp558805lfg;
        Mon, 24 Feb 2020 09:10:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOh2K3QLw/Lw/IRXQZKhQ2/MIycfeI7UIG8S0TtA0KqgZGIfzGJ66oUWJ+XHxF+sozfpIT
X-Received: by 2002:aed:31e2:: with SMTP id 89mr48954727qth.35.1582564202009;
        Mon, 24 Feb 2020 09:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582564202; cv=none;
        d=google.com; s=arc-20160816;
        b=uTXIr1afqlyltraEegtyMrLa4J1KLyRrFzAX+L4I43PDEpTCuFLPjUwt1Zg5zkOTK+
         pZPuDU6SPQEOONydF84RHQRwF3wTh/oq7VCUQfv9+AArUs7AUhsaaZ9MSil8iIRse3OH
         o5Dy8b8qjZHA3Qq6dfsHHq4VI0F5VNiiVzUTG1ZnP/twY6ZtSHW6GyaLOT5Fn7VD85KG
         HlLJlI64P3Zzszj1Sl0hEokhWuNuKEfPlEMm+Sn6Jy5av/iXGrAesahZlFxg504bKK2y
         gB022c3Zw8DWvpY6oNhC/7mp6QMZbwwg7BiHMj7EjNvoZP5vvdU++/kLzgzOQaR3ViZl
         I14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=orrvvzInLtQuwUUgLtyXlZ9FER/ZvACaLeTV6qD2WlY=;
        b=tFaQ7R90AKkjxQ8w8T2c7/m2bymluQdFBJRR7cJ2dnzxH+67zrFXDrIpFwNAw9s21F
         bARWNEZJhGJXB+Gtn/OewFbjvntk7DS5rWfZw7BbpI1qd34NyVeq0sp9kLkTFpp54nfN
         OT30FKzDDwvTT5WXXiAFn/xxJ9HOyO4kQld+KAuCuCSWk/qUawBQ3traLR0sdlPwrUeo
         G0EqspgGi8w0kmmS64/6kyaMurl16jgJTiCQMMPRgUgXFqAlaLXQYrX+i6KuFG0gDqI9
         PbzVh7viYAG3dejWe7gm5avCN3AO3tL/49urVMaHBMIXG0GHf5EL51RFTR+wIDvvsMqj
         ViEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sxc5meTR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si3194970qki.266.2020.02.24.09.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:10:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sxc5meTR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HF3-0000ZW-E8
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6HCY-000718-CW
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6HCU-0007vl-BN
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:07:26 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34911)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6HCU-0007tZ-36; Mon, 24 Feb 2020 12:07:22 -0500
Received: by mail-lj1-x243.google.com with SMTP id q8so10945166ljb.2;
 Mon, 24 Feb 2020 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orrvvzInLtQuwUUgLtyXlZ9FER/ZvACaLeTV6qD2WlY=;
 b=Sxc5meTRsoNNB9r+BapQ/KDLbFIx8CfK7pKz+sqLFyKrgKyrleSHFTvp/mN8W72kB8
 4eVMb8t6Y6hnavHAwdnrXr4vb+MljR8T2sDLUiT5vLAUiPZpObe2l3wBCcd1SWLBEuR4
 Sf1Ad4CkJVgQYP3C9lO6C2aAG9/rMt1VXknwN5d4mGcHsELKXELvxj63nU/myJaafJAR
 c3otTv7JM7FjTw0ZF7yj25v2Q1e3uLefzyXe9nSo2etpb7Xca/ZTuFHtW1LDy4VgKtcy
 Zeha/A1CdV9dpebV0rLJtMqRR1VdUbKdRT4oMUvKOm7cQ4PfulJn3vfinLuMV0g5ESQp
 bf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orrvvzInLtQuwUUgLtyXlZ9FER/ZvACaLeTV6qD2WlY=;
 b=cFlDMp+Q66DR85FWIpaQNMcDBotKCnl48fuUSSDWxdCh975DpKX7H/uSDk2aFGJmrQ
 XNCZdIKKbd/LF9rPljpGQBMNeUAz0sv9vL9H3R8N5v9Li/ipaqb5u+8OPTpyRSw4jNOh
 BABSPcYE94n//nUzm/BYk42moRh2F6+dzSmfjiT0lcJ5J++2x/XB+DmtphLb5eqBaNHC
 H9hL4C3YokuKVr2YDGBSgXqsbc0U44kHjA5sWJor8t7YY1+g6QuypGGxZamBEw6UAzmS
 /vzjoWSib2YNZ6BEcarbFxwV1HTFCbz8G9us3rbDGdeN19nAh1C5+Zh0P9LQwmJR4RTv
 HxhQ==
X-Gm-Message-State: APjAAAUqAJ2MKrBC5u4oeFPDUKy2So1uQvZEbUU7csdvy60tguwkMjuE
 AR+V23uKA8xu+gS4+GqCPhuaIvDhe5Dhw0y/pKQ=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr29587890ljg.250.1582564040727; 
 Mon, 24 Feb 2020 09:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20200224041633.97345-1-gshan@redhat.com>
In-Reply-To: <20200224041633.97345-1-gshan@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 08:59:46 -0800
Message-ID: <CAKmqyKNTL8Z74aKiM9ve8pDTEKjf3cSq+E+43TQhTUbupfc-oA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Use TYPE_PL011 to create serial port
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, shan.gavin@gmail.com,
 Edgar Iglesias <edgar.iglesias@gmail.com>, leif@nuviainc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Ir+3XO4w0tc

On Sun, Feb 23, 2020 at 8:17 PM Gavin Shan <gshan@redhat.com> wrote:
>
> This uses TYPE_PL011 when creating the serial port, to make the code
> a bit more atomatic.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/sbsa-ref.c    | 3 ++-
>  hw/arm/virt.c        | 3 ++-
>  hw/arm/xlnx-versal.c | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9b5bcb5634..df0a165047 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -39,6 +39,7 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/usb.h"
> +#include "hw/char/pl011.h"
>  #include "net/net.h"
>
>  #define RAMLIMIT_GB 8192
> @@ -409,7 +410,7 @@ static void create_uart(const SBSAMachineState *sms, int uart,
>  {
>      hwaddr base = sbsa_ref_memmap[uart].base;
>      int irq = sbsa_ref_irqmap[uart];
> -    DeviceState *dev = qdev_create(NULL, "pl011");
> +    DeviceState *dev = qdev_create(NULL, TYPE_PL011);
>      SysBusDevice *s = SYS_BUS_DEVICE(dev);
>
>      qdev_prop_set_chr(dev, "chardev", chr);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f788fe27d6..d0da513737 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -71,6 +71,7 @@
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
>  #include "hw/acpi/generic_event_device.h"
> +#include "hw/char/pl011.h"
>
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -724,7 +725,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
>      int irq = vms->irqmap[uart];
>      const char compat[] = "arm,pl011\0arm,primecell";
>      const char clocknames[] = "uartclk\0apb_pclk";
> -    DeviceState *dev = qdev_create(NULL, "pl011");
> +    DeviceState *dev = qdev_create(NULL, TYPE_PL011);
>      SysBusDevice *s = SYS_BUS_DEVICE(dev);
>
>      qdev_prop_set_chr(dev, "chardev", chr);
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 1cf3daaf4f..403fc7b881 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -22,6 +22,7 @@
>  #include "hw/misc/unimp.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "hw/arm/xlnx-versal.h"
> +#include "hw/char/pl011.h"
>
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define GEM_REVISION        0x40070106
> @@ -144,7 +145,7 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
>          DeviceState *dev;
>          MemoryRegion *mr;
>
> -        dev = qdev_create(NULL, "pl011");
> +        dev = qdev_create(NULL, TYPE_PL011);
>          s->lpd.iou.uart[i] = SYS_BUS_DEVICE(dev);
>          qdev_prop_set_chr(dev, "chardev", serial_hd(i));
>          object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
> --
> 2.23.0
>
>
