Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5830470lfm;
        Tue, 28 Apr 2020 11:05:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIYx96HiI7/BtnxTst+mnhMwUzqq8inrxp8mW5CQ5hMu/pEeoPD6zESKaC7+2f2O4AdqQdP
X-Received: by 2002:ae9:e10b:: with SMTP id g11mr30857896qkm.449.1588097151845;
        Tue, 28 Apr 2020 11:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588097151; cv=none;
        d=google.com; s=arc-20160816;
        b=LINqWgRyd1iMBF4PL9AvREpexOvS1JXuOFXGOKLdFhhUfgI8KrvxmyyZVkbONocCgR
         K6A2hS9fhAKj+wTWckhE5uXz5kYjWVq+seyOdR106e/RQOlhlvBHnhEN6NRAcgTu06X7
         jI9/eyL3AzPuRx66+LgM0MrzUYYheae7YFpn4/SOTYz8+M+cVi2Ueef8ADAPbr2ZNChp
         W4kV43N2+5bHjmVXyUbScmK5oCET/seNWLE/Ox2mHeIrqJ1uWRQF86IJrIYfvJglEj17
         DOWs90JuSc2orhJr+wDJA0XFb2HH149OXKCEjlie9RD0DMLib8LamrwBXDg/DQQj0xtc
         tttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uu3s5aXZm1z/tpMzctzNOl49/zW6r4r/WN270b2Pon4=;
        b=e6XsNhVFTqfe87TzRPrPq2dhfVQ9IqIMZIyZxAGunlWK5XhIWn4iLV8y1pywa8Wwm6
         p4xCf6Jt+XB25ac8mffaRL0MXwp0oQVTrnYmPlMNfCu5606P+nSDNrAIpIrbAkx2r1Y7
         HnL4buGB4CT1FZ10/57R7ri6smCV+C9X0/sEw7JPWO0/OYtIJN2xTTyUJuN6v8lM5w96
         tmrek9oPp8zewoaT9F03q9x9XeU22Z0ysV7wzWoktWVKthmo3b8UMC3hV+7FPlr2tsDd
         91mg1FDvrWAH65L0tBrRf9aJOYGirdJXeirfNpzlFaxAI1Es6GhF5Vkf3oUwYApaJ/G8
         Y6XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jAtaai/p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si11654329qvk.208.2020.04.28.11.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 11:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jAtaai/p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTUcB-00054t-4c
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 14:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTUbl-0004UH-6g
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 14:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTUbb-0006rI-9z
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 14:05:24 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTUZT-0005tg-OA; Tue, 28 Apr 2020 14:03:03 -0400
Received: by mail-io1-xd43.google.com with SMTP id 19so24080000ioz.10;
 Tue, 28 Apr 2020 11:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uu3s5aXZm1z/tpMzctzNOl49/zW6r4r/WN270b2Pon4=;
 b=jAtaai/pHIleJIGJZ+o7t42RriRobhlkgSY3At7vYknCigelmu5LCKg0tpPHZcxm0L
 ZhevH6GuItAfQ5OKxQCArF+0yfzIYm0pq8C65i/YILtFslZVolq/jGItQE893MJEmbLS
 kKjxsHiDVw8SrRwiHNMs9M+CpbDm9fpS6l0M/9MFalgEGXg28HJ6lzpV20L5+PdyVsW1
 tqAxM77ShoByEOV0NNLYyyU1pYIwRbi7/cCuOrI9Pw0ZR9hW0R9T3jjTbmhIv7WVthzi
 hltdUwgRV9lhfTX9G8RQf8E4lJvigKJIFNAMaSGfW8Zq/cXWHQpZsoqd1qhAdMj2GFEm
 zyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uu3s5aXZm1z/tpMzctzNOl49/zW6r4r/WN270b2Pon4=;
 b=iUe9EYtuDcQ71cwPWsImFc0/M/dhkXqhhXSaWnbxDwwsOFTUZ905lSQiCk5GqsCJ2h
 J1M5RD9A/H+YAEeyzoJm1B3m1TkIBwVVKvrBeVkeQgDTeTJ2wFB44gHxmn9Ye9Vj4TI1
 3fbvFd5JI5fMBAkHfgKWECnEHUGkIoD4uDHMNFDqiiFaOsW+08Mm2crZZ+FAhrE8aXHM
 DlfSQkvMYQlOqHEysAjI3mKl50r3HNBZwwyMgMxaVLwrAPSYXRl26Bt3qkPmlSkGQ8VT
 05uCxrRLVVsJU6MyvOlJMtEIg/XgoKe0HKdUM0DcQvTItaLypT+aQkiJH5PHlAi4rFnM
 Y15w==
X-Gm-Message-State: AGi0PuZcnTPDv3BMQDQjA2/FqJcxeRgHtdNYy7Czn75cdKYuPfLVPams
 0iKS0c9PhREgdPbKdO05snpy5v4QkArPW3OCQ5A=
X-Received: by 2002:a5d:984b:: with SMTP id p11mr27057653ios.175.1588096982272; 
 Tue, 28 Apr 2020 11:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-11-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-11-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Apr 2020 10:54:22 -0700
Message-ID: <CAKmqyKMoomzGq6_ZRLr2Cm6Tuz8EMWnDyX_V1Enj_Hp4wOV4jQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] hw/arm: versal-virt: Add support for SD
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d43
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
X-TUID: Tat5pXXPG/eW

On Mon, Apr 27, 2020 at 11:25 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for SD.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c | 46 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index d7be1ad494..0afee48672 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -20,6 +20,7 @@
>  #include "hw/arm/sysbus-fdt.h"
>  #include "hw/arm/fdt.h"
>  #include "cpu.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/arm/xlnx-versal.h"
>
>  #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
> @@ -256,6 +257,32 @@ static void fdt_add_zdma_nodes(VersalVirt *s)
>      }
>  }
>
> +static void fdt_add_sd_nodes(VersalVirt *s)
> +{
> +    const char clocknames[] = "clk_xin\0clk_ahb";
> +    const char compat[] = "arasan,sdhci-8.9a";
> +    int i;
> +
> +    for (i = ARRAY_SIZE(s->soc.pmc.iou.sd) - 1; i >= 0; i--) {
> +        uint64_t addr = MM_PMC_SD0 + MM_PMC_SD0_SIZE * i;
> +        char *name = g_strdup_printf("/sdhci@%" PRIx64, addr);
> +
> +        qemu_fdt_add_subnode(s->fdt, name);
> +
> +        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> +                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> +        qemu_fdt_setprop(s->fdt, name, "clock-names",
> +                         clocknames, sizeof(clocknames));
> +        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                               GIC_FDT_IRQ_TYPE_SPI, VERSAL_SD0_IRQ_0 + i * 2,
> +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                     2, addr, 2, MM_PMC_SD0_SIZE);
> +        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +        g_free(name);
> +    }
> +}
> +
>  static void fdt_nop_memory_nodes(void *fdt, Error **errp)
>  {
>      Error *err = NULL;
> @@ -411,10 +438,23 @@ static void create_virtio_regions(VersalVirt *s)
>      }
>  }
>
> +static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
> +{
> +    BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +    DeviceState *card;
> +
> +    card = qdev_create(qdev_get_child_bus(DEVICE(sd), "sd-bus"), TYPE_SD_CARD);
> +    object_property_add_child(OBJECT(sd), "card[*]", OBJECT(card),
> +                              &error_fatal);
> +    qdev_prop_set_drive(card, "drive", blk, &error_fatal);
> +    object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
> +}
> +
>  static void versal_virt_init(MachineState *machine)
>  {
>      VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
>      int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> +    int i;
>
>      /*
>       * If the user provides an Operating System to be loaded, we expect them
> @@ -455,6 +495,7 @@ static void versal_virt_init(MachineState *machine)
>      fdt_add_gic_nodes(s);
>      fdt_add_timer_nodes(s);
>      fdt_add_zdma_nodes(s);
> +    fdt_add_sd_nodes(s);
>      fdt_add_cpu_nodes(s, psci_conduit);
>      fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
>      fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
> @@ -464,6 +505,11 @@ static void versal_virt_init(MachineState *machine)
>      memory_region_add_subregion_overlap(get_system_memory(),
>                                          0, &s->soc.fpd.apu.mr, 0);
>
> +    /* Plugin SD cards.  */
> +    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
> +        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
> +    }
> +
>      s->binfo.ram_size = machine->ram_size;
>      s->binfo.loader_start = 0x0;
>      s->binfo.get_dtb = versal_virt_get_dtb;
> --
> 2.20.1
>
>
