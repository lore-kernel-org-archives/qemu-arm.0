Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2728791wru;
        Mon, 1 Jul 2019 07:45:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfp0+tcZFHyUFxGYKFb7/P1qeUzl6KEWgUlSfw+TIa+YUm1DGbIVq2kENH8xSbnnYcJ3QP
X-Received: by 2002:a05:6402:12d2:: with SMTP id k18mr28977235edx.197.1561992317359;
        Mon, 01 Jul 2019 07:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561992317; cv=none;
        d=google.com; s=arc-20160816;
        b=WaUrF98cWzHFzTUzhIPmScOLEm/RA14F8ycxjrTsY1C0VTP1TMuoHFL9V+nejGytWF
         9+4jNqR58TZgZ36Py/IBQAxtXy9C5sSiLpGvdllpCKzxqz6zSkArTef1ldpreeNpZiB2
         EHMTomWqdm8a+qBw0aaknflH72QATV/kbL5Bpkv862ynhDmhGowBhkCdxgJedynisgNH
         EwF1dRO8iQKS8jeKT+lcJIdEhXllgzZGwxuKMxK+1jqwa9SqgDDviryzGy9fEeWcC3K1
         QJ+eb7jq45qKBrppsgAmyiIEEry84Hubtqc1MKc4VbTJgfobvz7uwjPb3OIn6CR8vzQ5
         ys4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0bHov4AsMs+15g5Y8TaVCAZ0ewX/G2VwigLTPONJMo=;
        b=MvcZPVoO6oHXQqBJCgvTQWwpcuhuoY+4pof4g8I+dvYiZVSAhVrI84N53Iq1wdAcMy
         Ft/h2c6+Go1gguX6uJ5MmMPYgXZFCVrCuKuQPP6sp1sw9bFCyvdP1Ee8+PRRxY+vRbPk
         6jyLeLP0scrH4+KnAVEUjc46P0Yyl1plrhljH8KPjakDUb43Ia2AbyZUf88IMVtga9Is
         UHe2qrJjlq5gEiOkNlIFteHoxeUPIfZ0u7rZn2mNa8UTT6wR3Hj1BhMBj8npP65sZjPc
         pfGBBk+9XotjwkFgdRwD5ncNJQhZZaTa6EDMFL88bP+QQ3HhuS9IHI8BLnD/N5f6rYxL
         MzOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BNj/8Y+l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si7078840ejj.376.2019.07.01.07.45.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 07:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BNj/8Y+l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxYS-0006ov-BI
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 10:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52499)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhx9N-0004sE-C3
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhx9K-00080z-Mk
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:19:20 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40244)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhx9J-0007o8-TS
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:19:18 -0400
Received: by mail-ot1-x341.google.com with SMTP id e8so13613883otl.7
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M0bHov4AsMs+15g5Y8TaVCAZ0ewX/G2VwigLTPONJMo=;
 b=BNj/8Y+lyNYGiJCjI29HgDCsVw4KziBSXGJ1hYmClENkCGgghV3vXS7vzk63zl5ckQ
 cUoTZQlnzvnHBLzYbaJq8UW7TfGabi3cxVYFy4xc/OIR2+Nn5Clu7sQFDLR0uLUjtZ+P
 IUdpq/ot6/V02mAusbTUcTdWOVdFDadjWNqJRES/Uzp/5n0RovL2j5Cof1ZSzdl+Bs3s
 g0V59s6k74tOUXdxG8MTcBWhwE9eWRE6cWipqDkAeidw8bUUkwMHh1nmdtQ3bvOJpikj
 Qnzr2kNuW1p2483Se+eqNx9mn2R0MaQsbSJntUa0cEe4rvwGPNSGqpFjOsXWu+6qIQ9t
 AaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M0bHov4AsMs+15g5Y8TaVCAZ0ewX/G2VwigLTPONJMo=;
 b=HoVFTe2oWDFnNwm8raXTXg0RPPVtv7036LSR9AXiaxTY92Ik6s7UvGB54f8aOi0Y1+
 HZrpmfXM/2SR5tIoNY8rqj+OeoDI53fxNstkYD7rZvWvDRdM7fgNJhb7C5LJAQdKfKSb
 DUSvACzlwpHm0mkmrNQBFpCSOBDTSPS2wiq8k8TBx5cQG+/IPez9RgGsbMDeosBhepei
 9H76ezwPSQZtL6kgLuNMvR5m7EaCJRLuc6fgGd1Tn2KyhSlhYAqrpb3dL9QVmbX0rxsq
 JgZ5D+vLBJqzwHix2tjVEXblerb1uNkmkBC9VtKbodSSohJEFlJxFpDjQGBGgDAG4NJq
 9S1w==
X-Gm-Message-State: APjAAAU/BOAZtr9or14+qJZL6xmeTwQNkdBLXJFKkOAISezvDOs6gwUz
 dyJuekuW4LuVAiWZwaOKBET0TPzkXH0tUp2oEZ6LDA==
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20759321otk.232.1561990743623; 
 Mon, 01 Jul 2019 07:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <1561890034-15921-2-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1561890034-15921-2-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 15:18:52 +0100
Message-ID: <CAFEAcA8qi7zRiLwDP38cPax=gAfEK8WQm0i9ZxDLXeESqh79Wg@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v9 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MznQmMBAvFpH

On Sun, 30 Jun 2019 at 11:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
>
> This patch introduces new machine type 'sbsa-ref' with main features:
>  - Based on 'virt' machine type.
>  - A new memory map.
>  - CPU type cortex-a57.
>  - EL2 and EL3 are enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus EHCI controller.
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - No virtio deivces.
>  - No fw_cfg device.
>  - No ACPI table supplied.
>  - Only minimal device tree nodes.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> it should supply ACPI tables to load OS, the minimal device tree nodes
> supplied from this platform are only to pass the dynamic info reflecting
> command line input to firmware, not for loading OS.
>
> To make the review easier, this task is split into two patches, the
> fundamental sceleton part and the peripheral devices part, this patch is
> the first part.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Kconfig                  |  16 +++
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/sbsa-ref.c               | 281 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 299 insertions(+)
>  create mode 100644 hw/arm/sbsa-ref.c
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 1f2e0e7..f9fdb73 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -19,6 +19,7 @@ CONFIG_SX1=y
>  CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
>  CONFIG_REALVIEW=y
> +CONFIG_SBSA_REF=y
>  CONFIG_VERSATILE=y
>  CONFIG_VEXPRESS=y
>  CONFIG_ZYNQ=y

Adding CONFIG_SBSA_REF=y here is what makes the board
model available for the 32-bit-only qemu-system-arm.
If you put it in aarch64-softmmu.mak instead it will
be correctly restricted to the 64-bit binary.

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 9aced9d..18e47b2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -184,6 +184,22 @@ config REALVIEW
>      select DS1338 # I2C RTC+NVRAM
>      select USB_OHCI
>
> +config SBSA_REF
> +    bool
> +    imply PCI_DEVICES
> +    select A15MPCORE

This looks like a leftover from the virt config?

> +    select AHCI
> +    select ARM_SMMUV3
> +    select GPIO_KEY
> +    select PCI_EXPRESS
> +    select PCI_EXPRESS_GENERIC_BRIDGE
> +    select PFLASH_CFI01
> +    select PL011 # UART
> +    select PL031 # RTC
> +    select PL061 # GPIO
> +    select PLATFORM_BUS

I don't think you use the platform-bus either, do you?

> +    select USB_EHCI_SYSBUS
> +
>  config SABRELITE
>      bool
>      select FSL_IMX6

thanks
-- PMM
