Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7563195lff;
        Wed, 15 Jan 2020 15:00:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9hYigqQ6twnW3dVBPPoIHCRgOyeIS/3+28A+Mn4NQWKfhKHD3B8Ysdk9DIuyvODv6RVRh
X-Received: by 2002:a05:620a:1403:: with SMTP id d3mr29702260qkj.243.1579129244171;
        Wed, 15 Jan 2020 15:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579129244; cv=none;
        d=google.com; s=arc-20160816;
        b=y+7RHuj34Hc123Y+jeFpk3KpK4oUejRAybv8rwOvorCm2z8Sm/lLCylDud3XVot4lY
         H82LVuL18DeheTFsYccVK+yj8N8ygAYIL1JNgx7NNfJxz7YBvjnJy5ZKN1t5D+1nIaiB
         dd4AECI5X9/MMa8O8OF7PIh85FMSjKEdnhVjfhl88zfU8Sa0yk+HLaFDO34Cq+bjFgnz
         E9tmrCI6A0mqg/VsI+P/yUYZWhjtYpHBwFLgvf0Ry/R2l6VmQepF6CmdrEYQY0hFMOX9
         3lKWqTpPxFZMblQv8YdzjlOA1mISO5K3I8EW+ajc2O0AXW1moG4lq1iz3zWAzNhS/0Em
         Hlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rQxx2E+RqsLgZZ3wmjIiPqxTF03UXBdbmbAnvJu02Dg=;
        b=b9wnLAoQH9Bi+3WJeNXtP9gUPghAOxkdapcf7AvSH6sYVjtmPH5hH9KyHXNzw1eBPL
         +7xx16YQo/1wS0etvutlmW24He0uG/37ehfpRn0mFfgS3e7ne1XtwnQKos3aOpU3k7v8
         Oyiw2gTcbL7ut3mXg5flM+n3d3B1/y/WngE5N9eg9idMysM4X0P3gTjrDWTeEiefci4g
         8bpnja+SCbgN7EG9a1LuNPV9WoOQd2oWsgky7lDoTziYgnTh9lrVui3EEhDQQ9dxUMAc
         VTR5gH1TXjsGfEhlTBh1lmD1PU7vfJmtDzUbYaiEc+WKIQ3NXfAH3rex5xBjAECTJRzZ
         XX1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qDcJczlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q53si11207162qta.148.2020.01.15.15.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 15:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qDcJczlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irreV-0001Ca-F6
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 18:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1irreB-0001Ax-KB
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 18:00:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1irreA-0002tu-DQ
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 18:00:23 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:38730)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1irre7-0002qx-MD; Wed, 15 Jan 2020 18:00:19 -0500
Received: by mail-lj1-x242.google.com with SMTP id w1so20446123ljh.5;
 Wed, 15 Jan 2020 15:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQxx2E+RqsLgZZ3wmjIiPqxTF03UXBdbmbAnvJu02Dg=;
 b=qDcJczlSEAjf6NqD2mXwpyetH8OOf8tbBIg84oAQoFk+I40eRvbTycetGDkPUlcg8K
 JpAZkdkvYOMUK18rHJ/FEcFlSw3H48ndnSAvknr1sJMmln9M2YBKK6pq2GQpyoS6l2N5
 Xur24KYSXWHJA1xSZwzFUt9v+MKdho1y+WXZochp7grq5bMGf1NNMkpZurOkbauCPII4
 BdhZ5kJjoR9mq1HWkLQBcaEkU2dmX4FcFTuOnZ8oFjn/GFwemVLlJB88VvXjCp5W7qcH
 UgnV4XK+DLzzA4SQVWbxieq/RxhMDrDpiJRLpt4cGj7JTpEqPXMa4eZjqPALGQWNJl/z
 tD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQxx2E+RqsLgZZ3wmjIiPqxTF03UXBdbmbAnvJu02Dg=;
 b=F7stv4qUvm5VaUrnmKv69w7rYtcxNVY1EDegNmV/NLlpufc2CSP0vldT8Q5IeR1+0D
 r3JsixpDo8SZWpy5wsh9CH+m6rPtl3q71YLylXmqZN2AOrcTcDCFuJfsj+AIF9HRgurS
 DrcIh+yAfLIfSiQIxx69veMOc1tWBBSy+5gBPwm4QgCwMM7zsOBO40JVz4JaHR2gyfDP
 /o+xyc+ddb7grmoDOFgj60mNo6hqrRSf+2Tdty3FSEmUfgGm8yr5CY++9W+tZuIcNF4W
 3HjNX+7llwk4sDhdIF2nTGsjrwdKtTEN1aO1Ltv5TYJCrNzfvlj++T0n1p3lW6kRzOQq
 3Y3Q==
X-Gm-Message-State: APjAAAWwvYMTV0SkkAUFbeYJjXOUFpgW/3cOr0Ra56imDSJHOTV/+kE/
 48RldbTJ17w6RKpG/vAuW5pMTbH86oiEOMO3VJg=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr417496lja.204.1579129217904; 
 Wed, 15 Jan 2020 15:00:17 -0800 (PST)
MIME-Version: 1.0
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-35-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-35-git-send-email-imammedo@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jan 2020 08:59:50 +1000
Message-ID: <CAKmqyKO2Y5kZsJ3h7Ezpv-bmPhQyueGR-rpSRyLqBhuMXOkjxg@mail.gmail.com>
Subject: Re: [PATCH v2 34/86] arm:xilinx_zynq: drop RAM size fixup
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B7YUJtQ8uY2X

On Thu, Jan 16, 2020 at 1:25 AM Igor Mammedov <imammedo@redhat.com> wrote:
>
> If user provided non-sense RAM size, board will complain and
> continue running with max RAM size supported.
> Also RAM is going to be allocated by generic code, so it won't be
> possible for board to fix things up for user.
>
> Make it error message and exit to force user fix CLI,
> instead of accepting non-sense CLI values.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> CC: edgar.iglesias@gmail.com
> CC: alistair@alistair23.me
> ---
>  hw/arm/xilinx_zynq.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3a0fa5b..df950fc 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -158,7 +158,6 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>
>  static void zynq_init(MachineState *machine)
>  {
> -    ram_addr_t ram_size = machine->ram_size;
>      ARMCPU *cpu;
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
> @@ -168,6 +167,12 @@ static void zynq_init(MachineState *machine)
>      qemu_irq pic[64];
>      int n;
>
> +    /* max 2GB ram */
> +    if (machine->ram_size > 0x80000000) {
> +        error_report("RAM size more than %d is not supported", 0x80000000);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      cpu = ARM_CPU(object_new(machine->cpu_type));
>
>      /* By default A9 CPUs have EL3 enabled.  This board does not
> @@ -184,14 +189,9 @@ static void zynq_init(MachineState *machine)
>                              &error_fatal);
>      object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);
>
> -    /* max 2GB ram */
> -    if (ram_size > 0x80000000) {
> -        ram_size = 0x80000000;
> -    }
> -
>      /* DDR remapped to address zero.  */
>      memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
> -                                         ram_size);
> +                                         machine->ram_size);
>      memory_region_add_subregion(address_space_mem, 0, ext_ram);
>
>      /* 256K of on-chip memory */
> @@ -300,7 +300,7 @@ static void zynq_init(MachineState *machine)
>      sysbus_connect_irq(busdev, 0, pic[40 - IRQ_OFFSET]);
>      sysbus_mmio_map(busdev, 0, 0xF8007000);
>
> -    zynq_binfo.ram_size = ram_size;
> +    zynq_binfo.ram_size = machine->ram_size;
>      zynq_binfo.nb_cpus = 1;
>      zynq_binfo.board_id = 0xd32;
>      zynq_binfo.loader_start = 0;
> --
> 2.7.4
>
>
