Received: by 2002:a05:6214:430:0:0:0:0 with SMTP id a16csp1111568qvy;
        Mon, 7 Feb 2022 06:58:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaELW91GdOvZsYOBA/2/XhBEXypBecyJzRZPi92MekdFbuwrDa41tmzjNWtB09UGrGzVgy
X-Received: by 2002:a25:e0c7:: with SMTP id x190mr50964ybg.642.1644245938063;
        Mon, 07 Feb 2022 06:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644245938; cv=none;
        d=google.com; s=arc-20160816;
        b=Hfg8XUyjxj1UQ7/znUdwS35itmxgV16GVFLXrh4N6Nhlft7/7IgRm5izZdqpv0e6aw
         nzJxFaF2+Pua5ayFTFvS5hX4KeBfzGH7EB45oi03s0s+EFJWlJl30P34GDzfY4fhffFl
         uqXCyGAkSj1fG/SVrJ/lgZ0Z1Itnhq/sfFkcisrMpp/6HUjP32oE6uo2HdQk5y7XLv+0
         W7iL18tUs8rHqpfx5n+8HpL/tCIaqKqg7gH7pEtbFuY/l/Vzq87o7y1F6eO84O0kXDQ7
         ckpqHvI40MddPhsGRZaAnqljzDhdMKCq6u5LOZegd0QvRWh6zg6FyKoVtbcVcsezJKpk
         XNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:subject:user-agent:mime-version:date
         :message-id;
        bh=mt8jjThMcT0DtpZ3Op8hZFR1KHhaYtBPmInK5G4KGIg=;
        b=JaiQFPl8NaygvPBC0wMCfUYWUZQnMA2Kfm9bhHSYS6LqzfRqaNTFBNB1XrfOpYZjDj
         n/p2haiHggG704uRv+uVW+DLxP0tIcmKT8Ct6BI5XlZzmmjw/3qrQhpce0HPoQ187gGV
         BjzKrHENCY2xrvFrIEJSWdkVq7U0dCpHw3CCUz+zn5Wj35MTeZlFZKBir/NX9u8dzhV7
         tD92ZsvMJLn0IkDe4ygx/o3P0mi0th35U1RmCcm549ys42nzAw/HtWgVAuXdvQo8ggn2
         SMsfqB6D2wDXbj9ZFxCUvE5ZcSzeHLxalmYIC25Mjkc6VEOAJXaQZtrQi2OKO9lK4pIr
         C+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k65si4255148ywb.473.2022.02.07.06.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 06:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH5Tl-0000oY-Iu
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 09:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH4yI-0005JJ-VF; Mon, 07 Feb 2022 09:26:27 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33714 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH4yB-0006Gy-JB; Mon, 07 Feb 2022 09:26:24 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 510C36080D88;
 Mon,  7 Feb 2022 15:26:12 +0100 (CET)
Message-ID: <76af11e5-8727-86da-cd09-d15002dc0427@csgraf.de>
Date: Mon, 7 Feb 2022 15:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 07/16] hw/arm/versal: Let boot.c handle PSCI enablement
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-8-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220127154639.2090164-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: br07P1mx1GDJ


On 27.01.22 16:46, Peter Maydell wrote:
> Instead of setting the CPU psci-conduit and start-powered-off
> properties in the xlnx-versal-virt board code, set the arm_boot_info
> psci_conduit field so that the boot.c code can do it.
>
> This will fix a corner case where we were incorrectly enabling PSCI
> emulation when booting guest code into EL3 because it was an ELF file
> passed to -kernel.  (EL3 guest code started via -bios, -pflash, or
> the generic loader was already being run with PSCI emulation
> disabled.)
>
> Note that EL3 guest code has no way to turn on the secondary CPUs
> because there's no emulated power controller, but this was already
> true for EL3 guest code run via -bios, -pflash, or the generic
> loader.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Let's try with the same CCs here too - Versal uses the same mechanism as 
ZynqMP :)


Alex


> ---
>   include/hw/arm/xlnx-versal.h | 1 -
>   hw/arm/xlnx-versal-virt.c    | 6 ++++--
>   hw/arm/xlnx-versal.c         | 5 +----
>   3 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 895ba12c61e..2de487564e4 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -89,7 +89,6 @@ struct Versal {
>   
>       struct {
>           MemoryRegion *mr_ddr;
> -        uint32_t psci_conduit;
>       } cfg;
>   };
>   
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 0c5edc898e1..1b25342501b 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -626,6 +626,9 @@ static void versal_virt_init(MachineState *machine)
>        * When loading an OS, we turn on QEMU's PSCI implementation with SMC
>        * as the PSCI conduit. When there's no -kernel, we assume the user
>        * provides EL3 firmware to handle PSCI.
> +     *
> +     * Even if the user provides a kernel filename, arm_load_kernel()
> +     * may suppress PSCI if it's going to boot that guest code at EL3.
>        */
>       if (machine->kernel_filename) {
>           psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> @@ -635,8 +638,6 @@ static void versal_virt_init(MachineState *machine)
>                               TYPE_XLNX_VERSAL);
>       object_property_set_link(OBJECT(&s->soc), "ddr", OBJECT(machine->ram),
>                                &error_abort);
> -    object_property_set_int(OBJECT(&s->soc), "psci-conduit", psci_conduit,
> -                            &error_abort);
>       sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>   
>       fdt_create(s);
> @@ -677,6 +678,7 @@ static void versal_virt_init(MachineState *machine)
>       s->binfo.loader_start = 0x0;
>       s->binfo.get_dtb = versal_virt_get_dtb;
>       s->binfo.modify_dtb = versal_virt_modify_dtb;
> +    s->binfo.psci_conduit = psci_conduit;
>       if (machine->kernel_filename) {
>           arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
>       } else {
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b2705b6925e..458ba33815f 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -35,10 +35,8 @@ static void versal_create_apu_cpus(Versal *s)
>           object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i],
>                                   XLNX_VERSAL_ACPU_TYPE);
>           obj = OBJECT(&s->fpd.apu.cpu[i]);
> -        object_property_set_int(obj, "psci-conduit", s->cfg.psci_conduit,
> -                                &error_abort);
>           if (i) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> +            /* Secondary CPUs start in powered-down state */
>               object_property_set_bool(obj, "start-powered-off", true,
>                                        &error_abort);
>           }
> @@ -481,7 +479,6 @@ static void versal_init(Object *obj)
>   static Property versal_properties[] = {
>       DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> -    DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   
