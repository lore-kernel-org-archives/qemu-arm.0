Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp825504ejb;
        Fri, 7 Jul 2023 16:56:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGOrt50qpeZ+SiVLjhUM/e3kXQ+P9WiDc8N/fy2F7WnW6ItmPHe3ymElW+Oc2FAmdxhrfPW
X-Received: by 2002:a37:b804:0:b0:767:11b1:de03 with SMTP id i4-20020a37b804000000b0076711b1de03mr5775799qkf.29.1688774202987;
        Fri, 07 Jul 2023 16:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688774202; cv=none;
        d=google.com; s=arc-20160816;
        b=qYg8elhU+/tRmReD+s9jC3WQc71ph2efr0ctOHoBuaCX0SS4fEHUPNya6/jr+Fn565
         k7PoK3Qfc9zfWxscArKaFRjD7BNsKAFCeV8hP64OlZSARY3mv2TZdV1AOWQSpjIxNh/G
         d1p+agZJxR4frayrUjKuNsLgbtUcI6Ng4vZkjX+3HyHvZGTOXgUzuk5xW1qrZacKBkM8
         78gaG6BYnZaafxBKNOl31JowJSZah6SMTswrQlUXn0Eo+E76Y6XoQZGNqoBZO+tDgnRU
         t2NGotBsi/ImvApNG2z8boT7ZcAwsus/xCHhFmQZo/LPLv5GEaDYEsY1JrYeZqMU715M
         Nt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=LgcGSMJC/oTxJjDJ6dxB2vm+VuQeD+2kjcWApMoRZDI=;
        fh=qbIObOIBE5B8kuTBsGkrZT27804ckYsOvngIK4E9aZ4=;
        b=mRRKzKhURDMmoG44V+fh6Opb2A44otANGsyQBKXxodNAOxAGxRcwwWcw/Nx2mqcfAe
         0aCLRM4UKWxc74Kqj4akK7of7oGFnOOkx42qVSyiVlXjKI1M9L+xKziSGMvk/KEeFWOl
         aXQHWuctvJWtakoI2fzt9GsHJn3UNYwD4k/+iJR7GGYXKozu1s8eiecoUJqDJV7xvrwx
         h0b7CKQ6rthC3s7K8dWM8Jx2oVWygxrBYIyoyvpA6mhQ0syiK0HEf+y9Vrq2BvYT78gR
         Uvg9D+D1oxnsXKxmUJYz98a3d3tsIhwVu+94Fk+y/FR1VAEZuzCVV8d+BsD8VDWGIsoh
         nIuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VYzvKHzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a37f509000000b007672b4ff13fsi3383053qkk.604.2023.07.07.16.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 16:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VYzvKHzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qHvJJ-00071v-Ez; Fri, 07 Jul 2023 19:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1qHvJG-00070R-7s; Fri, 07 Jul 2023 19:56:22 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1qHvJD-00051V-G7; Fri, 07 Jul 2023 19:56:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFD1461A18;
 Fri,  7 Jul 2023 23:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71600C433C8;
 Fri,  7 Jul 2023 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688774177;
 bh=WX2Sda1IYYzMIkWYs5n4GNPmrKU2Jz2CRebnHv3lWpo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VYzvKHzS3LnVABGIm03f3ofj90QtroJfs6Fd+kcUuIYuOcs5d/aBCWDgcTEQNOHUQ
 r1N4uE66Ku63C5YmBAGp+QOWJN2kclI3LSY4ZN1qhZunKzWpgfXc6h69gTV3kxgy+e
 cobDNuMTClW2yzuNixX9NUiL03posQMgk0ASQx/tafM16TSmGgHsQrLsgJp9YGbkMm
 IpocxPCc4oyTAS7bS8ZM6VnuZ1rWDq/OxIDsDzQ6SeDTX+BWrUQpzVRQDVhE4i+Tzi
 mTL0OO4RpYzy44Ap1TfvClVJ1LcFwlk4Ih5ARjqvl1dVga9iLxyA5znHabQBdgz9nD
 AV048nZ/B8w4g==
Date: Fri, 7 Jul 2023 16:56:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v2 2/2] xen_arm: Initialize RAM and add hi/low
 memory regions
In-Reply-To: <20230707220358.920-3-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2307071655550.761183@ubuntu-linux-20-04-desktop>
References: <20230707220358.920-1-vikram.garhwal@amd.com>
 <20230707220358.920-3-vikram.garhwal@amd.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KlwIBE69jujn

On Fri, 7 Jul 2023, Vikram Garhwal wrote:
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
> "-m" arg. If "-m" is not given, create a QEMU machine without IOREQ and other
> emulated devices like TPM and VIRTIO. This is done to keep this QEMU machine
> usable for /etc/init.d/xencommons.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index e700829654..ec8de00cf5 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -60,6 +60,8 @@ struct XenArmState {
>      } cfg;
>  };
>  
> +static MemoryRegion ram_lo, ram_hi;
> +
>  /*
>   * VIRTIO_MMIO_DEV_SIZE is imported from tools/libs/light/libxl_arm.c under Xen
>   * repository.
> @@ -92,6 +94,39 @@ static void xen_create_virtio_mmio_devices(XenArmState *xam)
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
> @@ -141,6 +176,14 @@ static void xen_arm_init(MachineState *machine)
>  
>      xam->state =  g_new0(XenIOState, 1);
>  
> +    if (machine->ram_size == 0) {
> +        DPRINTF("ram_size not specified. QEMU machine started without IOREQ"
> +                "(no emulated devices including Virtio)\n");
> +        return;
> +    }
> +
> +    xen_init_ram(machine);
> +
>      xen_register_ioreq(xam->state, machine->smp.cpus, xen_memory_listener);
>  
>      xen_create_virtio_mmio_devices(xam);
> @@ -188,6 +231,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = xen_arm_init;
>      mc->max_cpus = 1;
>      mc->default_machine_opts = "accel=xen";
> +    /* Set explicitly here to make sure that real ram_size is passed */
> +    mc->default_ram_size = 0;
>  
>  #ifdef CONFIG_TPM
>      object_class_property_add(oc, "tpm-base-addr", "uint64_t",
> -- 
> 2.25.1
> 
