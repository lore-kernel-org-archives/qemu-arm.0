Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp112360lfk;
        Thu, 21 Apr 2022 18:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaZ/xSc3WHPjFjxAFLoJn122z4P1ErIuFTvja2kZXSGQnZQuL6y4YEBT+p0yuSPQice4eh
X-Received: by 2002:a05:622a:1b91:b0:2f3:45f0:d9fb with SMTP id bp17-20020a05622a1b9100b002f345f0d9fbmr1701945qtb.147.1650592304768;
        Thu, 21 Apr 2022 18:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650592304; cv=none;
        d=google.com; s=arc-20160816;
        b=mBBYrYqvF3CcHONLsM8IC8yBZV4ARK7hyAl0Pii5zR/58oM7K+kMTzBOQGewl1rPNJ
         mcuMD62/fvqLOWyiaL3g0tvP8U9C45SzYreGwnb0yyAYkKaA2+S201vZjbxXEwhmnYZY
         p0qC2YUpHE9GDL0ysedUoG4/CGA+T6zbLaGHx41gd3Q3oq5EIO0HkKBFdZ6XLM9WqLHg
         qd/qZlcnibq1haD9CI+D8ngjQuKy5dQMxOPJGihrmEpHBhipko53DFyFTD02xKSl/3Rn
         L4q94+kM3SSP2eILfWpeBxIkp0vacfsH7QZ+mYaeAbqtiTg4361bkUQdfOYwoFgN432o
         IF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6/vOcH5BJgDa4oue3S4k1MLTrBs/D0JPaNdM4jRsbE=;
        b=OdC1tMVN1U/PTIZS2BORf2IYd3hOPirO/HT3DCU9FkKAJC7hDto3GXDpTauHZQt5mu
         xw2FvPtQPQ4vnyZQX6OKCUKHpPaFTKECorF5edVbBOwGQHGhRVN5LWkDE3CVxJpkfy2W
         cCu3qojOC14O4QVUyUQNgFkkCEakavhmJQkJfcP8PxU0FNWkrAMYRww932phzkeOSV5u
         NVe5paEMzQfTCM0jS2itLXIHx40FQ9BRoPmglg8VIqA2I+ORwxavzp57oedgojE2DEef
         q4oePu6UuRVh8vDWvb1od6U/Pn1JFQs9i+ECDlRgi7+y1nHbg+vwUC6jKXLNSv3uSzro
         BFqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SbJD5r3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020a05622a014700b002e1fbf3be22si2031162qtw.19.2022.04.21.18.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 18:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SbJD5r3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhiSW-0000dx-9Y
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 21:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhiRu-0000df-82; Thu, 21 Apr 2022 21:51:06 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhiRs-0006zT-Lu; Thu, 21 Apr 2022 21:51:05 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f4e375daaeso15716047b3.3; 
 Thu, 21 Apr 2022 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6/vOcH5BJgDa4oue3S4k1MLTrBs/D0JPaNdM4jRsbE=;
 b=SbJD5r3zf8RJxnElA4+gDLBJP3xBfyJ+TD3smkxS0HBAcyss9L3QqXPC942rv64E53
 1fsydY70iq5nsQ0ecCIDx+3/O8eH3kRBV+kdCzyMB/ToVSQwY+ba/a/e36P3u2esfOA0
 QnIi2rPUUhJuggW7d/FuvUZ4k3QZIZdhAfxRI0uapePupSv17sOYcWHLDWy2fZ96NBUL
 4IL1WS3IkfsRv8N81/dICVyBvkRrWqIuat+TmhkHDS32aSSyRO3TSzknjY5PvGjaGl68
 KKOzKwTBe4+hViSFSt9pYG/Svmh6T+ulM5oPet5QLijs1XMixpN+upzCrLNdWmoFahHq
 6lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6/vOcH5BJgDa4oue3S4k1MLTrBs/D0JPaNdM4jRsbE=;
 b=nuSmDIDkp4SqGF7WbSPXDZEnPdKHG2fYUu1CQptk7n0uq2y3tdc3sBttorPq+6ADvX
 xSU8sqFVFFYM0mRDE4P0NjOABG9spP9WTT7Il74HRgjROLC8jKl1QEDNblF5DMJyjyYK
 o7n1356/zAfgiHBNWkEMAcnWCXEaQz4m/mLvfrxjkBcSdpEHqr8bwAcBQpYMoHis829g
 kVREfYntgezETx9XqJdLVlnz+hAaNyqlh2kAFROL9YWhiAqMbEdeU96dlyf9XF3XYpL6
 yLNz8OKOF9LfyqegqWi6qOp/cVtacDVFgx78OuwdvoiJsQ9eg2SqSTBGmvncRnfJtplv
 hDqQ==
X-Gm-Message-State: AOAM532YhaSeerfakoOKGy5YpJAkYj+NGiGtP15WA4qvWKp4DR0MAGL4
 d9ksZwCDgDbdgeRMSB7hc1XeOUWoMZbfbe87aDk=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr2651096ywk.209.1650592262548; Thu, 21
 Apr 2022 18:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-5-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-5-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 09:50:51 +0800
Message-ID: <CAEUhbmUnafXGR11OCAf1mScXqhN+ncmwz+-4wYhDT+jkEKw1fw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] hw/riscv: virt: Add support for generating
 platform FDT entries
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3eu+XRX+ge5y

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Similar to the ARM virt machine add support for adding device tree
> entries for dynamically created devices.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/riscv/virt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 169da70350..e4a5c6c28b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -28,6 +28,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/char/serial.h"
>  #include "target/riscv/cpu.h"
> +#include "hw/core/sysbus-fdt.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
> @@ -411,6 +412,12 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
>          qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
>          riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +
> +        platform_bus_add_all_fdt_nodes(mc->fdt, name,
> +                                       memmap[VIRT_PLATFORM_BUS].base,
> +                                       memmap[VIRT_PLATFORM_BUS].size,
> +                                       VIRT_PLATFORM_BUS_IRQ);

This one is not needed.

> +
>          g_free(name);
>      }
>
> @@ -469,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
>          plic_phandles[socket]);
> +
> +    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
> +                                   memmap[VIRT_PLATFORM_BUS].base,
> +                                   memmap[VIRT_PLATFORM_BUS].size,
> +                                   VIRT_PLATFORM_BUS_IRQ);
> +
>      g_free(plic_name);
>
>      g_free(plic_cells);
> @@ -546,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>              IMSIC_MMIO_GROUP_MIN_SHIFT);
>      }
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
> +
> +    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
> +                                   memmap[VIRT_PLATFORM_BUS].base,
> +                                   memmap[VIRT_PLATFORM_BUS].size,
> +                                   VIRT_PLATFORM_BUS_IRQ);
> +
>      g_free(imsic_name);
>
>      /* S-level IMSIC node */
> @@ -683,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>          VIRT_IRQCHIP_NUM_SOURCES);
>      riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
> +
> +    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
> +                                   memmap[VIRT_PLATFORM_BUS].base,
> +                                   memmap[VIRT_PLATFORM_BUS].size,
> +                                   VIRT_PLATFORM_BUS_IRQ);
> +
>      g_free(aplic_name);
>
>      g_free(aplic_cells);
> --

Regards,
Bin
