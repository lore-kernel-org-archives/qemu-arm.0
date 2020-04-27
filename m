Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4697956lfm;
        Mon, 27 Apr 2020 15:29:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqDw/ma4TV289pkknmFbR4Q3Q5M9qYIjzcTEWM1tx9tZ/nlnk1peLptzwfBzVexLcsm/A/
X-Received: by 2002:a0c:f781:: with SMTP id s1mr24810468qvn.182.1588026595368;
        Mon, 27 Apr 2020 15:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588026595; cv=none;
        d=google.com; s=arc-20160816;
        b=taCjUnm04r8zMSH6xi2e2rt44QhUMs5YF3HYMb4KU/RKcrx6g4F/7Xvu+CgRLEK55q
         69egQR+FUPcSh1qUCQ5MV7rtLTUGan0lVVE89MrsPuSvupdEr5yos691Cx/9msM33jAb
         6RQGUGZHHFXQX5d9A0nbGe+7ZGPkCb0PnY3gP2zr9pEram2zR0ILjHM0uBdADG8kE+TB
         Mm3//GEgLcnpUTWMh994wlVZLRLbJzFPPi4FolwlQ3LbtVlsBk1l6nXRkVgwEtU9G98y
         /snjz/BS1/q+/Ve2M9dnUWT205arY3aiv2yxj3wqcjyBzcb3vIiucjXfzffl6eJoAxAr
         7DoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ju2jKZ21QV29q1siA4KW+cjXBNIc1W7uUcHg60LkNr8=;
        b=rZ033yL6DxDXutpBEUz1hvC+RtQ2QzI7FHHeWs5gzvBzRwIjE37+QDuzSeFN8xy3GP
         YP3OsZ75TKTfr0Q/ygMCpVRA1yzOmdUXvDG5su264iQOUjamuOaHv3SsYW5/pNla/p0l
         6NCJAb60/j65A+sy3HOtgJro0lxWp2Khi8lwQfk+syD8330AFAP6tdlvh9QC5MKmc9Ds
         eG05GHSo/EnC7LSeNng1i+QI0Gk0UdqmDO8oLu1980Ca2ZZcIMCNL0/zL8j3B/R7ulmr
         d2GOUx6JHo93flEcb4wQ/z3l5iXsbAtchr3r/NmyHHu6fAyZfJQtiBZxFzgdpUrJGgou
         wIfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NUoLXUMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r63si9353205qkd.340.2020.04.27.15.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 15:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NUoLXUMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTCGA-00023l-PR
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 18:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCFG-0000mw-9B
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 18:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTCFF-0004vr-P4
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 18:28:58 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:43218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTCFE-0004gG-0X; Mon, 27 Apr 2020 18:28:56 -0400
Received: by mail-io1-xd42.google.com with SMTP id 19so20692996ioz.10;
 Mon, 27 Apr 2020 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ju2jKZ21QV29q1siA4KW+cjXBNIc1W7uUcHg60LkNr8=;
 b=NUoLXUMfTK7614ppGI9bD6QBXFJFKXxwC6hG4gLr1J10PQsHNTDXUcTV45JLYME5Np
 pJWoVQ5vuNbQfHFrxJGjypMhmbymw3N2a6mdIliaELtkjFBz6aUiZc8ORFmgbmoSK0VP
 C+sSGdyD0rzgER7fyEf134TKLfGommfyv7pvW6i5TQxuZS5GrF09tSAxMH+pJv0+hU2p
 elcUEesbHcNszBgapJYs/1LSLZwCPZu3ayjsaAivE/0GI1GjWPIvBjil7S8G3PxL4q4r
 zkwS/fZeTKMzSt3Z5h9VUl+chIRapNon69WPLefeviIKfZX5LYYrVzWor52SJxjXr41Y
 OmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ju2jKZ21QV29q1siA4KW+cjXBNIc1W7uUcHg60LkNr8=;
 b=tmdPfJFTiC1nbZKce2HtHNfYLIjTpiVSTYZU3ElOycMauH7JXsrZIFtGO8+Z3v926L
 fb4MKL+aVZZRUVFdYosB1uy/WTJybxaqncxJuVZ8JjPlNOs85BEwVcVQmlyrcyWXzf8k
 H0iLDR6ji0l89fWSo4ETDstdZ7Ye5glMfoIdDVIH9VEZ0goG+RFTRWlDm4+1z9d4I7Dc
 lHRX0ZoIfMhS19Nq/A5CQkGvTKWHfGrO5W1r4G8G3PtTH46tZJ69WXDLoeb9AatFVU8X
 q5FZRuMLlzJaXXCc/s3EqcHYjd/5CxfPMc4li6wFJ1itHKWGHkzLLv3fImDEsqyy5qtO
 WqFQ==
X-Gm-Message-State: AGi0PuZgMsTY7TpGYX3sDL3j4JfeWdPwKczXJrzEd8gA1YbhPtxb2uws
 EWg3MTwWfeFIFkkR/Vv+K1aC7tzp9VwsfwpmdPk=
X-Received: by 2002:a05:6602:d:: with SMTP id
 b13mr23423004ioa.176.1588026534550; 
 Mon, 27 Apr 2020 15:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-8-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-8-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 15:20:16 -0700
Message-ID: <CAKmqyKMoXWg-2gWX9-p3zqH3Dh=27-aGwELgzE-Juie2vdc1XA@mail.gmail.com>
Subject: Re: [PATCH v1 07/11] hw/arm: versal: Embedd the APUs into the SoC type
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d42
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
X-TUID: lJlITTrfKIh4

On Mon, Apr 27, 2020 at 11:20 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Embedd the APUs into the SoC type.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c    |  4 ++--
>  hw/arm/xlnx-versal.c         | 19 +++++--------------
>  include/hw/arm/xlnx-versal.h |  2 +-
>  3 files changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 8a608074d1..d7be1ad494 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -469,9 +469,9 @@ static void versal_virt_init(MachineState *machine)
>      s->binfo.get_dtb = versal_virt_get_dtb;
>      s->binfo.modify_dtb = versal_virt_modify_dtb;
>      if (machine->kernel_filename) {
> -        arm_load_kernel(s->soc.fpd.apu.cpu[0], machine, &s->binfo);
> +        arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
>      } else {
> -        AddressSpace *as = arm_boot_address_space(s->soc.fpd.apu.cpu[0],
> +        AddressSpace *as = arm_boot_address_space(&s->soc.fpd.apu.cpu[0],
>                                                    &s->binfo);
>          /* Some boot-loaders (e.g u-boot) don't like blobs at address 0 (NULL).
>           * Offset things by 4K.  */
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index ebd2dc51be..c8a296e2e0 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -31,19 +31,11 @@ static void versal_create_apu_cpus(Versal *s)
>
>      for (i = 0; i < ARRAY_SIZE(s->fpd.apu.cpu); i++) {
>          Object *obj;
> -        char *name;
> -
> -        obj = object_new(XLNX_VERSAL_ACPU_TYPE);
> -        if (!obj) {
> -            error_report("Unable to create apu.cpu[%d] of type %s",
> -                         i, XLNX_VERSAL_ACPU_TYPE);
> -            exit(EXIT_FAILURE);
> -        }
> -
> -        name = g_strdup_printf("apu-cpu[%d]", i);
> -        object_property_add_child(OBJECT(s), name, obj, &error_fatal);
> -        g_free(name);
>
> +        object_initialize_child(OBJECT(s), "apu-cpu[*]",
> +                                &s->fpd.apu.cpu[i], sizeof(s->fpd.apu.cpu[i]),
> +                                XLNX_VERSAL_ACPU_TYPE, &error_abort, NULL);
> +        obj = OBJECT(&s->fpd.apu.cpu[i]);
>          object_property_set_int(obj, s->cfg.psci_conduit,
>                                  "psci-conduit", &error_abort);
>          if (i) {
> @@ -57,7 +49,6 @@ static void versal_create_apu_cpus(Versal *s)
>          object_property_set_link(obj, OBJECT(&s->fpd.apu.mr), "memory",
>                                   &error_abort);
>          object_property_set_bool(obj, true, "realized", &error_fatal);
> -        s->fpd.apu.cpu[i] = ARM_CPU(obj);
>      }
>  }
>
> @@ -95,7 +86,7 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
>      }
>
>      for (i = 0; i < nr_apu_cpus; i++) {
> -        DeviceState *cpudev = DEVICE(s->fpd.apu.cpu[i]);
> +        DeviceState *cpudev = DEVICE(&s->fpd.apu.cpu[i]);
>          int ppibase = XLNX_VERSAL_NR_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
>          qemu_irq maint_irq;
>          int ti;
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 94b7826fd4..426b66449d 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -36,7 +36,7 @@ typedef struct Versal {
>      struct {
>          struct {
>              MemoryRegion mr;
> -            ARMCPU *cpu[XLNX_VERSAL_NR_ACPUS];
> +            ARMCPU cpu[XLNX_VERSAL_NR_ACPUS];
>              GICv3State gic;
>          } apu;
>      } fpd;
> --
> 2.20.1
>
>
