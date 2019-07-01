Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3062082wru;
        Mon, 1 Jul 2019 14:06:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK610pRkX8WsmsDb2VlMed0wHSXqo8zfsaX2s9zLa9g1XnZJiRQQ3se6Yo9MpFCsWz+W1W
X-Received: by 2002:a17:906:838a:: with SMTP id p10mr24345159ejx.237.1562015183686;
        Mon, 01 Jul 2019 14:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562015183; cv=none;
        d=google.com; s=arc-20160816;
        b=c7Je6fi9DMa6ibXRPkXDKMlsHy58PfJXBBv/OLbdrcPUatpwGUw2sMqxoIP/SSlN5I
         DyLZp5Zjiw6F9Wy5/1oyOIO05e3E7pXcSjyJTxejcX18IjTRZCu3YNJIprYJWIV378eO
         mr1A+O7VNJFEmVgEcv6gHshGrvski8weCncpvwuTJ2jfgShzR8uzBR0fZ7r4vYIgrrPc
         tRVORis/bbSGxx8uSHtZnkxLXJS5ERRveG208o/4lFNN0Xgoqe1rqzUK7nSXqjh7V2/5
         Lm223Ii7wdMMqCmzGsEhp17H5HL1Jfc59L9KctoRNkq/jnsM5EBRalWbMpM7j42hGOpb
         2sVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=yYrPcmmp1UW8mdrcYTwNmqpepWMqdK+PjTB0qr+FSFs=;
        b=o5hsbBd6apPcyb1JFZO/Xc1ZMIulx9LJJkBv52deOcZq0+k5q9Z/LlbyxsX0391NEs
         2Q4z8ekcbATbzkLWYTMTXzUmbCNKvfZuVuoE387pMDyjxFUdy+8HFHqSEcJrejBghpZO
         pfrndnTvzOBEoYTwrWh6HA3Xtdz06wHs6NiglcEZKF0ZxYfa/7l65hq+YIQ/YplVBIQW
         QX1YQtWouRnaHArwiS4cVPARigxjiIrEppYWh68Ph4V9wWWZKO8vBvAVT8OHqqD9T5/n
         WWrIcxss63DNZtCs7qxMdZEvgjkMTPZeN31IWSu3v+tK7LCo+AZjdmze8YiuA6VQXGc7
         8ZHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="EaF/EWyT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si7688538ejc.278.2019.07.01.14.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 14:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="EaF/EWyT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi3VG-0005PC-M6
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 17:06:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43181)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hi3Aq-00089E-7m
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hi3Ak-0008En-3Q
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:45:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hi3Ag-00089T-UY; Mon, 01 Jul 2019 16:45:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id a21so14604560ljh.7;
 Mon, 01 Jul 2019 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yYrPcmmp1UW8mdrcYTwNmqpepWMqdK+PjTB0qr+FSFs=;
 b=EaF/EWyTjnYI6PsrdklxFCOe+RTL/w7W0DTLX9EAKXS6+gtInMO3Y4GrOHWBQB9GbO
 /wjw0ODq6W7DZJG6WqtPH0fmJvePLeaCBDLPP+YF0QIGDbl24Huk6Xgx/AXfAKWUnaYC
 FwaneTl9tjH2/2igs4PB/j70GzPBiOxJbV3aKT9tSsl3HmL+JQGMkyXt22/7/ZyuTEcj
 RojomE+quGb1if7tLRlIa+fftvKAiRb3+DjP4OYZfYT8jV2/ruXtjzrt4c90xAeQs60w
 Uk3Dn2oiXTU9C8M1L0SeHqUvKd9AsdOCFfH/j8X6s73A8I1bLqNvgGZd9OuSbUOKiGsz
 Zltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yYrPcmmp1UW8mdrcYTwNmqpepWMqdK+PjTB0qr+FSFs=;
 b=YUPhN5Mxki3w+oIzRYb20Na51FoHLtNx+mJLGlkN+W5mIyEO5xWUruS3SmnPpiYt4i
 8QHd8oqaUXFJxjNnlW1IONLRkWuwquq22Y3HIQDBfwCstulDAyn2oYNGq0FPFHwoM9Wz
 XLwMT38D92O591zUwqYadymkp+J0KZSwhn1zoXR6Dp9dynLnBWQEfy1oQV22UteG20C2
 BgUxOHprW64Pzvour/auotExvh8w0vlzZq5iIGIfAdh5FK3PQhcc+0Og/liDQbtgxvxq
 9VASLkE4GqJhsqtBOXqy0wBLWMkIaNgHnRkCdc9a20XTNm2b8BQyCI+AYakLwRFXrqlu
 ZODg==
X-Gm-Message-State: APjAAAWjj0zem6/09n0+1sRKENhH2YXl4Enxk1ZOZ66LcZ/cWYQxPe6T
 2w1lt02UhQ77Ar8ww6iCFyaXVPv5S/RcGttEGxcqRfML
X-Received: by 2002:a2e:9158:: with SMTP id q24mr14872226ljg.119.1561999159508; 
 Mon, 01 Jul 2019 09:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190701123108.12493-1-philmd@redhat.com>
 <20190701123108.12493-2-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jul 2019 09:36:17 -0700
Message-ID: <CAKmqyKOscAyPAjgeNNdEwLCwpsKDKo9JJUA-HRZ8Oc-egaamHQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.194
Subject: Re: [Qemu-devel] [PATCH 1/6] hw/arm: Use ARM_CPU_TYPE_NAME() macro
 when appropriate
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
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4crkKwrPsI89

On Mon, Jul 1, 2019 at 5:37 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Commit ba1ba5cca introduce the ARM_CPU_TYPE_NAME() macro.
> Unify the code base by use it in all places.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/allwinner-a10.c | 3 ++-
>  hw/arm/cubieboard.c    | 3 ++-
>  hw/arm/digic.c         | 3 ++-
>  hw/arm/fsl-imx6.c      | 3 ++-
>  hw/arm/fsl-imx6ul.c    | 3 ++-
>  hw/arm/xlnx-zynqmp.c   | 8 ++++----
>  6 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 35e906ca54..49d4d76686 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -28,7 +28,8 @@ static void aw_a10_init(Object *obj)
>      AwA10State *s =3D AW_A10(obj);
>
>      object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> -                            "cortex-a8-" TYPE_ARM_CPU, &error_abort, NUL=
L);
> +                            ARM_CPU_TYPE_NAME("cortex-a8"),
> +                            &error_abort, NULL);
>
>      sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
>                            TYPE_AW_A10_PIC);
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index f7c8a5985a..a4d3d7a6a0 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -80,7 +80,8 @@ static void cubieboard_init(MachineState *machine)
>
>  static void cubieboard_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "cubietech cubieboard";
> +    mc->desc =3D "cubietech cubieboard (Cortex-A9)";
> +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
>      mc->init =3D cubieboard_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->units_per_default_bus =3D 1;
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 9015b60c23..05db06be5e 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -36,7 +36,8 @@ static void digic_init(Object *obj)
>      int i;
>
>      object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> -                            "arm946-" TYPE_ARM_CPU, &error_abort, NULL);
> +                            ARM_CPU_TYPE_NAME("arm946"),
> +                            &error_abort, NULL);
>
>      for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
>  #define DIGIC_TIMER_NAME_MLEN    11
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index 7129517378..9b259c54b3 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -40,7 +40,8 @@ static void fsl_imx6_init(Object *obj)
>      for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
>          snprintf(name, NAME_SIZE, "cpu%d", i);
>          object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i])=
,
> -                                "cortex-a9-" TYPE_ARM_CPU, &error_abort,=
 NULL);
> +                                ARM_CPU_TYPE_NAME("cortex-a9"),
> +                                &error_abort, NULL);
>      }
>
>      sysbus_init_child_obj(obj, "a9mpcore", &s->a9mpcore, sizeof(s->a9mpc=
ore),
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index 05505bac56..1cbd8674bf 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -35,7 +35,8 @@ static void fsl_imx6ul_init(Object *obj)
>      for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6UL_NUM_CPUS); i++) {
>          snprintf(name, NAME_SIZE, "cpu%d", i);
>          object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i])=
,
> -                                "cortex-a7-" TYPE_ARM_CPU, &error_abort,=
 NULL);
> +                                ARM_CPU_TYPE_NAME("cortex-a7"),
> +                                &error_abort, NULL);
>      }
>
>      /*
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index a1ca9b5adf..2acd032df6 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -193,8 +193,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s=
, const char *boot_cpu,
>
>          object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
>                                  &s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> -                                "cortex-r5f-" TYPE_ARM_CPU, &error_abort=
,
> -                                NULL);
> +                                ARM_CPU_TYPE_NAME("cortex-r5f"),
> +                                &error_abort, NULL);
>
>          name =3D object_get_canonical_path_component(OBJECT(&s->rpu_cpu[=
i]));
>          if (strcmp(name, boot_cpu)) {
> @@ -233,8 +233,8 @@ static void xlnx_zynqmp_init(Object *obj)
>      for (i =3D 0; i < num_apus; i++) {
>          object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
>                                  &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
> -                                "cortex-a53-" TYPE_ARM_CPU, &error_abort=
,
> -                                NULL);
> +                                ARM_CPU_TYPE_NAME("cortex-a53"),
> +                                &error_abort, NULL);
>      }
>
>      sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> --
> 2.20.1
>
>
