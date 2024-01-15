Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp206793ejf;
        Mon, 15 Jan 2024 04:38:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg9HQXaKlnAYjthayqXTGNMUbSSLo2wAeBB/cDWT2xJnMa9ANB1IES5AAEWcC8z/Qpzwtv
X-Received: by 2002:a05:6214:1948:b0:67a:a721:caf8 with SMTP id q8-20020a056214194800b0067aa721caf8mr7466516qvk.89.1705322299378;
        Mon, 15 Jan 2024 04:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705322299; cv=none;
        d=google.com; s=arc-20160816;
        b=WpzKZ/mW9mZqSVF4Bgs/pHHMmpKo5UkLhI+0gnscr8p7eEEPjQzhOG5Gu5jI7bBa9R
         SWUpAWbmEShXGpxsn00Ttwm1wexhKafSszoqKGmZtLNl6j8myawzAfyyV2alx3SpDDGe
         9T9lrX16tvBHq56QaH/RTqWajJV9eOBFglx4EruFWclrPpiEiEUToTy263d5N148h2dw
         WUqzHmQX8mDqw4+hDHuvoxbITyKKqa/fRJKiJExp8dlogxTK+3+YZWRIOvVo/zIQa1NX
         JBZU4JzfwT+PITbJEy7QynxpqSLDk6CeGUc6UFa+Bt/xGUBWCRGrQQo0M6ANVEzaNyDE
         As8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4sN+doTRwrHfIkeiDu7vHDmBaAiyxzHeegCf/TanPj8=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=zlFvwHN4ccyDjWO8YnZqcC5JF9C3/QsUyUEoZFd7lNIkZ2JpIjzDLMKsPt0/rc440Q
         epyNuh2TIRH9ESPC9Lbjwq07n6THDdujLPsBykMxxId6p8VTE6fromn9brAArvTq2gcD
         /jgkBkOAtONkp5qK2qVx22d9jmpZ8TtGvRXpKcXFyRuv0c7vj488Oiu0NaSJJYLS2gSH
         ITy0HUZhzUdC9AjjOL0Iayb5BCGnCQRJuYkL4lkJA0mfKu2qj3qwc4lasMIVxKmdbsVJ
         UySiasTHPPwwiAf2FiI06PBeSRJFGwagYbandLjbWUlRuefaLwUqlvKxvb5fCcEBafI/
         6c9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIA43Ytw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a0ceb4c000000b006809d5461a6si3923975qvq.510.2024.01.15.04.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 04:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIA43Ytw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPMEI-00051S-Jd; Mon, 15 Jan 2024 07:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPMEH-00050b-4M
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 07:38:13 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPMEE-0003Ku-84
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 07:38:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so9822757a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 04:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705322288; x=1705927088; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4sN+doTRwrHfIkeiDu7vHDmBaAiyxzHeegCf/TanPj8=;
 b=XIA43YtwrtvlRhWOisNvNKDOCWdo2ZNzP8gDZtthBgSV3ajML+HNHWsIr9LU/P1x3L
 FkAnOsnNAg7VigyCJRPOCFlme/vWwP2r9etw/v3gHRlks+FerWNeNfOhiXTE8lqtohE5
 i9N/j04rZ+KMTLJsjXFg6zNRjCpQL6Way1Wk/YOadRh6zShLipHtTcYMRXniWNuP88Jx
 ZMo0wwpfP5blVJCjeJQrufC/edJ+YNrOr+eopGAObGqNINusRvoRx/rfUDDrHhigVi2A
 SF9bGtsiavLdBZ5PY6BvFU3kkCVgG6Nb/5Cd4T5uiZOSdxkp5AnaoUmCDFqn5PN82yh1
 uu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705322288; x=1705927088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4sN+doTRwrHfIkeiDu7vHDmBaAiyxzHeegCf/TanPj8=;
 b=lTH1cNlzT6bs9oVnKQeRy+cf+Kez39SmwRkKCsLJgtpAOJ8v2gG4EWfl8iW3tscYHk
 qhc+EZQlzEbm4jBGFeGLhwNJjnsa1ZnN6rN4ChR0j8nBS3DlolKBVG5hRritdr5ticCY
 kEk94hfs/8xi8fqyCu4n+aMCA/CqUy3IOGPIkZrCZ47xPhDs41R17onGttYt4dkI1za5
 PV+e3kjX8Apy8QZFQB9kt702YYaioogsb3skUT2ZRAWDBs1I4QD6Rny6kjT0TUMZ4aJC
 HGICDx+G6hzkadRXzDtHoCWEoV0SDeJ3/DKmimHJRNlm4gfPqWwKTZetCNR5JEWTUp4T
 6uBg==
X-Gm-Message-State: AOJu0YxKmPFEDyXH7K3tgVuxJYIqx79K7tXkQIuRxlMXbFP/VbMJZTSY
 YCRaGzbLFCQ8mfmojr0P6bjPtpRZX6+fnHBCCpGRd7iKBTzAWDt9k75QAuZP
X-Received: by 2002:aa7:cd62:0:b0:557:9018:9980 with SMTP id
 ca2-20020aa7cd62000000b0055790189980mr2598737edb.52.1705322287874; Mon, 15
 Jan 2024 04:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-13-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-13-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 12:37:57 +0000
Message-ID: <CAFEAcA9SjMYg72nHeYeCfbHgWzFAiRqmc63zmcGTDNu6f=5Z5A@mail.gmail.com>
Subject: Re: [PATCH v4 12/45] Temporarily disable unimplemented rpi4b devices
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 62uv9fsH0Gbd

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> This commit adds RPi4B device tree modifications:
> - disable pcie, rng200, thermal sensor and genet devices
>   (they're going to be re-enabled in the following commits)
> - create additional memory region in device tree
>   if RAM amount exceeds VC base address.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/raspi.c                  |  5 +--
>  hw/arm/raspi4b.c                | 60 +++++++++++++++++++++++++++++++++
>  include/hw/arm/raspi_platform.h |  4 +++
>  3 files changed, 65 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index da1e9e7c13..895c305122 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -37,9 +37,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(RaspiMachineState, RASPI_MACHINE)
>  #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
>  #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
>
> -/* Registered machine type (matches RPi Foundation bootloader and U-Boot) */
> -#define MACH_TYPE_BCM2708   3138
> -
>  struct RaspiMachineState {
>      /*< private >*/
>      RaspiBaseMachineState parent_obj;
> @@ -75,7 +72,7 @@ static const struct {
>      [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS},
>  };
>
> -static uint64_t board_ram_size(uint32_t board_rev)
> +uint64_t board_ram_size(uint32_t board_rev)
>  {
>      assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
>      return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
> diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> index 2d33861c57..10376b62dc 100644
> --- a/hw/arm/raspi4b.c
> +++ b/hw/arm/raspi4b.c
> @@ -21,6 +21,7 @@
>  #include "hw/arm/boot.h"
>  #include "qom/object.h"
>  #include "hw/arm/bcm2838.h"
> +#include <libfdt.h>
>
>  #define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b-2g")
>  OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
> @@ -32,6 +33,64 @@ struct Raspi4bMachineState {
>      BCM2838State soc;
>  };
>
> +/* Add second memory region if board RAM amount exceeds VC base address
> + * (see https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf
> + * 1.2 Address Map)
> + */

Our coding style says that for multiline comments the initial
"/*" should be on a line of its own.

> +static int raspi_add_memory_node(void *fdt, hwaddr mem_base, hwaddr mem_len)
> +{
> +    int ret;
> +    uint32_t acells, scells;
> +    char *nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +
> +    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
> +                                   NULL, &error_fatal);
> +    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
> +                                   NULL, &error_fatal);
> +    if (acells == 0 || scells == 0) {
> +        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
> +        ret = -1;
> +    } else {
> +        qemu_fdt_add_subnode(fdt, nodename);
> +        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> +                                           acells, mem_base,
> +                                           scells, mem_len);
> +    }
> +
> +    g_free(nodename);
> +    return ret;
> +}
> +
> +static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
> +{
> +
> +    /* Temporarily disable following devices until they are implemented*/

Missing space before "*/"

> +    const char *to_be_removed_from_dt_as_wa[] = {
> +        "brcm,bcm2711-pcie",
> +        "brcm,bcm2711-rng200",
> +        "brcm,bcm2711-thermal",
> +        "brcm,bcm2711-genet-v5",
> +    };

What does the "_as_wa" part of this variable name mean ?
Since it's local to this function we don't need to use a
super long variable name to keep it distinct; I think
something like "nodes_to_remove" would be fine.

> +
> +    for (int i = 0; i < ARRAY_SIZE(to_be_removed_from_dt_as_wa); i++) {
> +        const char *dev_str = to_be_removed_from_dt_as_wa[i];
> +
> +        int offset = fdt_node_offset_by_compatible(fdt, -1, dev_str);
> +        if (offset >= 0) {
> +            if (!fdt_nop_node(fdt, offset)) {
> +                warn_report("bcm2711 dtc: %s has been disabled!", dev_str);
> +            }
> +        }
> +    }
> +
> +    uint64_t ram_size = board_ram_size(info->board_id);

Variable declarations should always be at the start of a
code block, not in the middle.

> +
> +    if (info->ram_size > UPPER_RAM_BASE) {
> +        raspi_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
> +    }
> +}
> +
>  static void raspi4b_machine_init(MachineState *machine)
>  {
>      Raspi4bMachineState *s = RASPI4B_MACHINE(machine);
> @@ -39,6 +98,7 @@ static void raspi4b_machine_init(MachineState *machine)
>      RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
>      BCM2838State *soc = &s->soc;
>
> +    s_base->binfo.modify_dtb = raspi4_modify_dtb;
>      s_base->binfo.board_id = mc->board_rev;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
