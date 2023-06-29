Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp580504ejy;
        Thu, 29 Jun 2023 16:02:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61QYHw9Q4eIV86mSOf2zjv7icRP43pkE4sBXtIw5m2s36M6vi2vOw8X6/bvTSptYuXuVvP
X-Received: by 2002:a05:620a:4107:b0:765:5ba6:a5c0 with SMTP id j7-20020a05620a410700b007655ba6a5c0mr1705004qko.14.1688079774275;
        Thu, 29 Jun 2023 16:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688079774; cv=none;
        d=google.com; s=arc-20160816;
        b=gxuQZmjUie5cCcjGveRG6oWHVYzSebBtyS1csz5jE92osCl8nI99swqU+rYkDBWjD0
         1Z8UUC8NVplZrfgR3cNEh5Kjxxc0QaqK185e0oyEp5pG9vrxX5VFB/1FHB1XXtbjuT46
         vanvfxf6L3jwytko2Ya5UwYLmQSJd0or1/sGZFFBNoYx9o5sq0CPSeCrzAo5N9q755KG
         xJT9VOyav38tg+X6mCv01EDmV8eKZJ1mx9KGTRYw4QWuVoGtGOLqVBBKVeRTl9BoipiV
         UnnMrHIqtfXkL5yOS3dR1uyXiaQjzdYnJGx6f3vEcIW2eyZ3HC+sresMlyAvcJjUbOK6
         0RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=44ROaaJSk69z1S1lmSIP+P27ng1LBtB77752aiPzef4=;
        fh=a3WyLXROjx3edIAeANKAJaJdRVEQebmXaWhOGO4D0n4=;
        b=J148oL2K7wHZ4qbGTGJ4T/PLeI0fVBEMvju0tr7aPclV57SqfaAxk33kaZDqEcV2Cb
         ApmFLtiKH9CtfphWkJLE1W14Y/koiVqt/pTvXbZ2R0uA8ixsPmJVgFggcElJH5+UpHku
         Jm4wZwnzMs29xV0zPSB/aeBWuj8Hh1Wpjfix4vD72dPmdm9OICgwqnmwLzLNXpner20y
         Uf6vxyyiFvil8vQhHbxnJmhbUHnKp6TeobCq4W3NU1uSQhGqcsGOkbBGPIWTHURr2pyR
         u7kJP/ihH45Dp1ED61WnSWYHEYPF1WpJziZ+23Z6H0rDCD9hpCxdZGrgUaY27XE5zK1R
         S4Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TjjAkxI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05620a20d400b00766fe283561si4888545qka.598.2023.06.29.16.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 16:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TjjAkxI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qF0ef-00089C-7U; Thu, 29 Jun 2023 19:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1qF0ee-00088v-HM; Thu, 29 Jun 2023 19:02:24 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1qF0ec-0007Rb-Kk; Thu, 29 Jun 2023 19:02:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D275661635;
 Thu, 29 Jun 2023 23:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B6DC433C0;
 Thu, 29 Jun 2023 23:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688079740;
 bh=aHn5PLTEUEUIZNeZuwQ6/n8rICCV9CLX6scPwU4BU5c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TjjAkxI2JPQa3ZWvpksWz1XN3D5H9zckR95EsPHs3Mxm+xq+HSNnhTvlGMjBaveKt
 t8LQESwv/o3MCbQCdiyFUVt1T3D74WrF6qZIm5t0vz0waIU+5XnfZ9mVLKKDeEt8P9
 SaR5j7HtMIb3X5JWv/GT7J2vAzsXstey6FpuitFYJpSeNNX7MYR7+SePfrcyGAFAKN
 LnyX7AKAbpS+qEg3VxI9BOBmdoRSheG9ICM2xwOYmzqF7PkbJDpTuSN48FPaUztWBE
 dOnwBDOKUyZd9828xCHfIix1DGot8kqaWcsla1hnyablLfY2GZboyiIVqgA7LUCVCk
 MSok/d+7KV/4A==
Date: Thu, 29 Jun 2023 16:02:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RESEND][PATCH v1 2/2] xen_arm: Initialize RAM and add hi/low
 memory regions
In-Reply-To: <20230629174310.14434-3-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306291557520.3936094@ubuntu-linux-20-04-desktop>
References: <20230629174310.14434-1-vikram.garhwal@amd.com>
 <20230629174310.14434-3-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pIwqRcitwIAe

On Thu, 29 Jun 2023, Vikram Garhwal wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> In order to use virtio backends we need to initialize RAM for the
> xen-mapcache (which is responsible for mapping guest memory using foreign
> mapping) to work. Calculate and add hi/low memory regions based on
> machine->ram_size.
> 
> Use the constants defined in public header arch-arm.h to be aligned with the xen
> toolstack.
> 
> While using this machine, the toolstack should then pass real ram_size using
> "-m" arg. If "-m" is not given, create a QEMU machine without IOREQ, TPM and
> VIRTIO to keep it usable for /etc/init.d/xencommons.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/arm/xen_arm.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index c0a93f2c9d..cc4dffee70 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -60,6 +60,8 @@ struct XenArmState {
>      } cfg;
>  };
>  
> +static MemoryRegion ram_lo, ram_hi;
> +
>  #define VIRTIO_MMIO_DEV_SIZE   0x200
>  
>  #define NR_VIRTIO_MMIO_DEVICES   \
> @@ -86,6 +88,39 @@ static void xen_create_virtio_mmio_devices(XenArmState *xam)
>      }
>  }
>  
> +static void xen_init_ram(MachineState *machine)
> +{
> +    MemoryRegion *sysmem = get_system_memory();
> +    ram_addr_t block_len, ram_size[GUEST_RAM_BANKS];
> +
> +    if (machine->ram_size <= GUEST_RAM0_SIZE) {
> +        ram_size[0] = machine->ram_size;
> +        ram_size[1] = 0;
> +        block_len = GUEST_RAM0_BASE + ram_size[0];
> +    } else {
> +        ram_size[0] = GUEST_RAM0_SIZE;
> +        ram_size[1] = machine->ram_size - GUEST_RAM0_SIZE;
> +        block_len = GUEST_RAM1_BASE + ram_size[1];
> +    }
> +
> +    memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
> +                           &error_fatal);
> +
> +    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
> +                             GUEST_RAM0_BASE, ram_size[0]);
> +    memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
> +    DPRINTF("Initialized region xen.ram.lo: base 0x%llx size 0x%lx\n",
> +            GUEST_RAM0_BASE, ram_size[0]);
> +
> +    if (ram_size[1] > 0) {
> +        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memory,
> +                                 GUEST_RAM1_BASE, ram_size[1]);
> +        memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
> +        DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n",
> +                GUEST_RAM1_BASE, ram_size[1]);
> +    }
> +}
> +
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>  {
>      hw_error("Invalid ioreq type 0x%x\n", req->type);
> @@ -135,6 +170,14 @@ static void xen_arm_init(MachineState *machine)
>  
>      xam->state =  g_new0(XenIOState, 1);
>  
> +    if (machine->ram_size == 0) {
> +        DPRINTF("ram_size not specified. QEMU machine will be started without"
> +                " TPM, IOREQ and Virtio-MMIO backends\n");
> +        return;
> +    }

I would say "ram_size not specified. QEMU machine started without IOREQ
(no emulated devices including Virtio)."

We might add more devices in the future beyond Virtio and TPM. I don't
think we want to call out the whole list here.



> +    xen_init_ram(machine);
> +
>      xen_register_ioreq(xam->state, machine->smp.cpus, xen_memory_listener);
>  
>      xen_create_virtio_mmio_devices(xam);
> @@ -182,6 +225,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = xen_arm_init;
>      mc->max_cpus = 1;
>      mc->default_machine_opts = "accel=xen";
> +    /* Set explicitly here to make sure that real ram_size is passed */
> +    mc->default_ram_size = 0;
>  
>      printf("CHECK for NEW BUILD\n");
>  #ifdef CONFIG_TPM
> -- 
> 2.25.1
> 
