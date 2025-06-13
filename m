Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp197869njc;
        Fri, 13 Jun 2025 04:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKmC2oVKs/jltaUgwoe4CNEMjoco//1WXTNuqMnf1JGs3IguYlKm9dwwwttOqEMP0wFzEmOjlC8Nxb9g==@linaro.org
X-Google-Smtp-Source: AGHT+IG0t8pjhopBdmhE6Bf9p7fErvDaYDS8bvaHQAni/2Qxk3Zj2XASzMcGBk/LLOO/V32vRivf
X-Received: by 2002:a05:620a:c4b:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d3bc47ddc0mr376048685a.29.1749815847655;
        Fri, 13 Jun 2025 04:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749815847; cv=none;
        d=google.com; s=arc-20240605;
        b=Oxvcb0qHSA1QqY/jr8V1epFTzXw8lmsUwQrt/+Gl4CmJ2WHJicZHV3ZdGaxK+gZ9IR
         33139nErwy1f/x51+19FGgtKXda7XuQ5QPVCC821+K8nBKEC3rIff0m9QBoWfcm0IMCI
         zdRHhVTaE/XAsBqFVQKsTgdDpdgy5zdYfqZAljx/emjbpsrFxbMSd0wpa8/XL9AxtG9F
         HI0ZZV/Ft5TrpUtMYH9WADbdODk+uVcuFH1wnDbji3QnAgWT+QeL8q3lmZdW74bTMYDq
         f9jrCgQODh7JrhSOrw5RrwWQUNwWMfxcLrv6dAD1w79PXUp+9zQynqQOGeOq3z+ak6f5
         wCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6vzaVIA9d+9s2Fziqj284tT6vvw/UIzD8MC8G8RTWz4=;
        fh=4M3RddSsO8ZHeTbj3Fx4V7nwdwJxWkQQh4305hOJaIA=;
        b=P2P7KGkMKCCw0GMatIjw79jEP6ltJIpBZHN/FJUAvCF67SWl9enfWT5oRUiXKF3iMv
         RqBHLkfw/uXktDJch55bicazd5qvqoTkD1deyJ/5EHZNMLv/cccU4ABHfQJBomHLmAss
         FKNs/Q+Mgc1CKMrxNJQCLbNQOXon5l9P92q3uxN0fS61LrWpmpiYV26t2DuIoGJDIMq4
         3OykSQ0cZl4q9e4He3XMDWAMud0f/kLTyds2sP0ymGOsvXDpI/S6zUwdBQpfR36ZT95S
         w82UanQMP4+5rfHIBH5CutpTY44ZzJispDRpsE4J4rWe1yUB5KulAujG+7XkcTdr2rry
         xfFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Yq/IObmI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ef84bdsi285824985a.408.2025.06.13.04.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 04:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Yq/IObmI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ321-0005L7-JT; Fri, 13 Jun 2025 07:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ31s-0005Ic-Ia
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 07:57:05 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uQ31n-0006mS-ML
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 07:57:04 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-70e5599b795so19341887b3.3
 for <qemu-arm@nongnu.org>; Fri, 13 Jun 2025 04:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749815816; x=1750420616; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vzaVIA9d+9s2Fziqj284tT6vvw/UIzD8MC8G8RTWz4=;
 b=Yq/IObmIahVO5N0QfCZGyjmvLXelc/bl+mALdwYAIYIQCa4/TYB0OitxMtdGXhX693
 /EMGLdS1GPyH7iKykHwsybxl46j6zxxqDoToQkj3QubE89trk3zEPxC4cysVIOWR1I/2
 D4AGOh28xzOL5aNwoqUzbfMkFptPj4jpfNPtOi98S20f0z8qO1+yULEKqiGp7ZmK1+BC
 q4ClELrTUYAhhYKFnESzrJqqpOMXFGdXMzBWZpTCnDFS0qNpE4b+NIJ6+rh6Uh6p0SV7
 KGCdaLogpAeRyoMz/HAx4D9fNeR28IIu7K28d8V3752gGtk8UtXp6ePLEn2HCDBnokXv
 LTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749815816; x=1750420616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vzaVIA9d+9s2Fziqj284tT6vvw/UIzD8MC8G8RTWz4=;
 b=JWIR8XO74658GNo7os5vRBgc1fEMCQjybZuKqHdUWvvjST6WYwZMgWC7yfVY1G1trM
 QqzxrvCnBZwQAoqU1SyI5l8AFC+AAfEg4/v6ZE66VUedYPAPEmNLmzWxIvlQQcl1tunW
 8rlyWScFjR5GYcTayoQG2u6+qG1uAVdUrd5/O7U9u6l+seRRZXVuNpv/vPdsFO7Yy1RS
 65zxdu1XVLLPyUaoGUhipZT6eiTmyunHObJSbnE/mEqNjFRzzdhKHwvji2J2FJLdAb+g
 ZBYuJtqWjBlOg3xiPrwXSF0ZToKITdCc43xjD61K6mbKP4wOdvTbMZUVW8/vt8vRMvpb
 XE2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY8caWqD9aWmpg3XTNi53YyPmQVpR9VG+enBLP3jPu1oyg5c9d5f7XDqGHXW3oU651VTs7StW0oA==@nongnu.org
X-Gm-Message-State: AOJu0YxpjnL/HNNWB9klFuOXcoET2YOtinNTO/h2plR2Hk3EqD6AUS6o
 xBpv3mHFj2suyPxrQ+QkLd7xlElgk8G6XdPWHe72Z2gT451Kpm+ccQGdYAsAAfki/cdmqEwf3Jz
 a22dMvq500VNlLNZJbi9Fo9ofa58A24nIUwU7IAME6A==
X-Gm-Gg: ASbGncsGxSajrpi+XeznGHFWBZwah+61LHyaB0V6w35ss6bOH7zx8kFzgn+pFxUZwmG
 jAH1Mm7fc/c5hMfgzsddHBZbG2VoSmXbzzbwDJl6DDRze/KC9fuBjGxLDqh+3tXBqQS7TYc41Sl
 vDR9XckGEz8q/HDdSe9VlKrMMvhSYhIQQSshbeZQC/GQC3
X-Received: by 2002:a05:690c:9684:b0:70f:8835:b767 with SMTP id
 00721157ae682-711636073femr36791167b3.5.1749815815922; Fri, 13 Jun 2025
 04:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250526085523.809003-1-chigot@adacore.com>
 <20250526085523.809003-4-chigot@adacore.com>
In-Reply-To: <20250526085523.809003-4-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 12:56:44 +0100
X-Gm-Features: AX0GCFubLDIpLL61bX_PZfKCL9rvgqpfC95cCKckZ_c2I88PqVyQH_kvIBGcSVs
Message-ID: <CAFEAcA_OLNWNMVe8wxCkg4JUkEvNP3ga_YpSnhYXHkD-criYEg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/arm/xlnx-zynqmp: wire a second GIC for the
 Cortex-R5
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KEt3FSTSYWmT

On Mon, 26 May 2025 at 09:55, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> From: Frederic Konrad <konrad.frederic@yahoo.fr>
>
> This wires a second GIC for the Cortex-R5, all the IRQs are split when th=
ere
> is an RPU instanciated.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

Some review of this from the Xilinx folks would be helpful.

> ---
>  hw/arm/xlnx-zynqmp.c         | 88 +++++++++++++++++++++++++++++++++---
>  include/hw/arm/xlnx-zynqmp.h |  6 +++
>  2 files changed, 87 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index ec96a46eec..be33669f87 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -26,8 +26,6 @@
>  #include "target/arm/cpu-qom.h"
>  #include "target/arm/gtimer.h"
>
> -#define GIC_NUM_SPI_INTR 160
> -
>  #define ARM_PHYS_TIMER_PPI  30
>  #define ARM_VIRT_TIMER_PPI  27
>  #define ARM_HYP_TIMER_PPI   26
> @@ -206,7 +204,7 @@ static const XlnxZynqMPGICRegion xlnx_zynqmp_gic_regi=
ons[] =3D {
>
>  static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
>  {
> -    return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
> +    return XLXN_ZYNQMP_GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_in=
dex;

Typo in your new constant name: should be XLNX_.

>  }
>
>  static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
> @@ -377,6 +375,8 @@ static void xlnx_zynqmp_init(Object *obj)
>      XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
>      int i;
>      int num_apus =3D MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> +    int num_rpus =3D MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
> +                       XLNX_ZYNQMP_NUM_RPU_CPUS);

This is kind of a complicated expression that we use twice, and
I think it would be worth abstracting out into a function.

>      object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
>                              TYPE_CPU_CLUSTER);
> @@ -390,6 +390,12 @@ static void xlnx_zynqmp_init(Object *obj)
>
>      object_initialize_child(obj, "gic", &s->gic, gic_class_name());
>
> +    if (num_rpus > 0) {
> +        /* Do not create the rpu_gic in case we don't have rpus..  */

stray ".." at end. Also I would say "if", rather than "in case".

> +        object_initialize_child(obj, "rpu_gic", &s->rpu_gic,
> +                                gic_class_name());
> +    }
> +
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
>          object_initialize_child(obj, "gem[*]", &s->gem[i], TYPE_CADENCE_=
GEM);
>          object_initialize_child(obj, "gem-irq-orgate[*]",
> @@ -439,6 +445,13 @@ static void xlnx_zynqmp_init(Object *obj)
>      object_initialize_child(obj, "qspi-irq-orgate",
>                              &s->qspi_irq_orgate, TYPE_OR_IRQ);
>
> +    for (i =3D 0; i < ARRAY_SIZE(s->splitter); i++) {
> +        g_autofree char *name =3D g_strdup_printf("irq-splitter%d", i);
> +        object_initialize_child(obj, name, &s->splitter[i], TYPE_SPLIT_I=
RQ);
> +    }

We don't need the splitters unless num_rpus > 0, so I think
it would be neater not to create/realize/use them.

> +
> +
> +
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
>          object_initialize_child(obj, "usb[*]", &s->usb[i], TYPE_USB_DWC3=
);
>      }
> @@ -452,10 +465,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>      uint8_t i;
>      uint64_t ram_size;
>      int num_apus =3D MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> +    int num_rpus =3D MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
> +                       XLNX_ZYNQMP_NUM_RPU_CPUS);
>      const char *boot_cpu =3D s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
>      ram_addr_t ddr_low_size, ddr_high_size;
> -    qemu_irq gic_spi[GIC_NUM_SPI_INTR];
> +    qemu_irq gic_spi[XLXN_ZYNQMP_GIC_NUM_SPI_INTR];
>      Error *err =3D NULL;
> +    DeviceState *splitter;

I think you can put this variable declaration inside the
loop where it is used, so it has a much smaller scope.

>      ram_size =3D memory_region_size(s->ddr_ram);
>
> @@ -502,13 +518,21 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>          g_free(ocm_name);
>      }
>
> -    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + =
32);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", XLXN_ZYNQMP_GIC_NUM=
_SPI_INTR + 32);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
>      qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->sec=
ure);
>      qdev_prop_set_bit(DEVICE(&s->gic),
>                        "has-virtualization-extensions", s->virt);
>
> +    if (num_rpus > 0) {
> +        qdev_prop_set_uint32(DEVICE(&s->rpu_gic), "num-irq",
> +                             XLXN_ZYNQMP_GIC_NUM_SPI_INTR + 32);
> +        qdev_prop_set_uint32(DEVICE(&s->rpu_gic), "revision", 1);
> +        qdev_prop_set_uint32(DEVICE(&s->rpu_gic), "num-cpu", num_rpus);
> +        qdev_prop_set_uint32(DEVICE(&s->rpu_gic), "first-cpu-index", 4);
> +    }
> +
>      qdev_realize(DEVICE(&s->apu_cluster), NULL, &error_fatal);
>
>      /* Realize APUs before realizing the GIC. KVM requires this.  */

> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index c137ac59e8..a69953650d 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -42,6 +42,7 @@
>  #include "hw/misc/xlnx-zynqmp-crf.h"
>  #include "hw/timer/cadence_ttc.h"
>  #include "hw/usb/hcd-dwc3.h"
> +#include "hw/core/split-irq.h"
>
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -87,12 +88,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQ=
MP)
>                                    XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
>
>  #define XLNX_ZYNQMP_NUM_TTC 4
> +#define XLXN_ZYNQMP_GIC_NUM_SPI_INTR 160
>
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
>  #define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
>
> +

Stray extra whitespace change.

>  struct XlnxZynqMPState {
>      /*< private >*/
>      DeviceState parent_obj;
> @@ -105,6 +108,9 @@ struct XlnxZynqMPState {
>      GICState gic;
>      MemoryRegion gic_mr[XLNX_ZYNQMP_GIC_REGIONS][XLNX_ZYNQMP_GIC_ALIASES=
];
>
> +    GICState rpu_gic;
> +    SplitIRQ splitter[XLXN_ZYNQMP_GIC_NUM_SPI_INTR];
> +
>      MemoryRegion ocm_ram[XLNX_ZYNQMP_NUM_OCM_BANKS];
>
>      MemoryRegion *ddr_ram;

thanks
-- PMM
