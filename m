Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1157190ejb;
        Fri, 20 Oct 2023 04:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8pgabga/oEJzI0ASpWbtVvRxWGFCeRD4UADQM4Gf99e3M3Pea6hMq5vCCsBs1jdlPZXAl
X-Received: by 2002:aca:1001:0:b0:3b2:f500:c1e5 with SMTP id 1-20020aca1001000000b003b2f500c1e5mr1554263oiq.29.1697802507895;
        Fri, 20 Oct 2023 04:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697802507; cv=none;
        d=google.com; s=arc-20160816;
        b=HacTUfQQ6PQQvZdZS3W/R8peijZelySvGd7e2oWnnd3ePgZqDs/AmWIwdPMqb8xCGS
         YWzJ1affj2F4vKOYNiMUCh1CO6GSzPeBwtkF9Us7627COBLYlxD6Xil3RfABEJj9ViGr
         wASjdb18OlF9kDrhhUqHkHP35C0zMNFwFlLOWzonzzeizCG7SnFBdea2QJdGvCyhmLH7
         yAyJvv4mqbjXaYYvJMz1gto1Ff0iGZD9mcSVSBBRHTKU6FmFXx1CrO0hPXVbTRn/fc7M
         QF04Fa4lSuWodREtxTLUcC3Mqwi0C84VEgj/L/lJh+I1u8eHAB10FOx6XMOltZCcv/9z
         R9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y85EpA4qfM/Xl7cuFTNb/PevodubnQnKmuyXDqJie4c=;
        fh=BiPEO9ks27M8Z+yWO7KETmJfWBYIhIIw/fZ9iDn9zgY=;
        b=ootoaYSVXfntuQhMe4VIOhSXqK57EYOT0bSGzcV3Nkb6nyt3UG8pVxJ240bhMlArl2
         rU/y4pJOZ/jsfAFxTLe5IxucP3ts9u174LN+Jul5T0df4B/Ft3jm6dD9c7CJlB6CWWH9
         z22wYgJoXemAtNuqXTGHlcQhVw1+Nh9NNwsrN4FylT6FjaPFk5np0hGJKo1+CQVKKmtL
         8xZezJyOpdc6eF7V6hXg55AdZP0Snyr1xCRv0yHp9i9itLqcdYkg43ReT5nRLKDGCa10
         jW+djmfmzTH2CcUdG7kprJM9bwzl2CPOIwCj6+4OTm5nMj0XMgPa/GnYxvlkxtoPtzf+
         MyqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lpHum43R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz17-20020ad45891000000b0064f6ab4d034si1230790qvb.512.2023.10.20.04.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 04:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lpHum43R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtnyz-0007i9-AK; Fri, 20 Oct 2023 07:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtnys-0007ZC-2u
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 07:47:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtnyj-000597-By
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 07:47:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cace3e142eso1802885ad.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697802459; x=1698407259; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y85EpA4qfM/Xl7cuFTNb/PevodubnQnKmuyXDqJie4c=;
 b=lpHum43RoKbGYsx/VINc/M1KH6qx32H1nZ1obxA1AU/nVAHXcMnvP3ExGnpjbM8BgC
 Cn8fG6Lt4BOnTwbmWSahzzWFClflNpdKso9o5OOLJFQqAGUFGT/O5g44TNWLz4+G93TZ
 B446tsArrjMo6sJ0aWs3+dBxftucMd6kAJtTPRl9Gda7bU5pkm0YszTxVgSMIpBB1Hbb
 JTbsqP+upzuFZ3GK8LTYhaRWsUA+ejWhse/ID04TFKJ+OzMpZT/PgyN/5micmJpXP0wf
 t+x2NBnzk2P6hYa9PzZ8zyy6HVAwu6wrqPHMOcIkRITNUH0uS8OZnzYuaOfyTK+9lkNe
 lhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697802459; x=1698407259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y85EpA4qfM/Xl7cuFTNb/PevodubnQnKmuyXDqJie4c=;
 b=GbXAbP42fL+dfnaQ3N8+9osAOktuhHTj2A8Glhxo7ZaBnRoJBj3nqMXpzWJ4nuQtds
 13gohMQnQLaWWqL9xlpZmZa/qGCyYHJzmOm9SGVZ5PJYdf7MAAs9qAxH3cdvMZubcu5Q
 LUF/qGkWQShygLgqJ1vRjmcPla82XJV80lUOP7v3wkjTlh2OsfdarH2mm1UpDlqSmEHj
 6ywLAcpk3qCRxBoVUDZmINmsIHrQs3MMS1XsBSSOc/6/jtxfSrRQMP7fm6yy3xfFxZVh
 d/CxhX8826glpXyXr8222MOcTL996MY8nLg+zd+hdxIKvOEeiq2E4kVoVjRpUQXK81Ph
 pBTQ==
X-Gm-Message-State: AOJu0Yw3PozLKgWfSLowTd+LZGIJQ0ZwMOT5EymX9MX74lX1c8wyn7si
 9tA7RsOJwNe5nD1xIWK5m400tg==
X-Received: by 2002:a17:902:db11:b0:1ca:8cb0:7ff5 with SMTP id
 m17-20020a170902db1100b001ca8cb07ff5mr1947567plx.9.1697802459150; 
 Fri, 20 Oct 2023 04:47:39 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a17090332d100b001c32fd9e412sm1349188plr.58.2023.10.20.04.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 04:47:38 -0700 (PDT)
Message-ID: <7e5ca488-4fc4-4a53-a092-28740adae806@ventanamicro.com>
Date: Fri, 20 Oct 2023 08:47:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] hw/riscv/virt: Update GPEX MMIO related
 properties
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>,
 Haibo Xu <haibo1.xu@intel.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-11-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231019132648.23703-11-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: d1VdRt3Al/vN



On 10/19/23 10:26, Sunil V L wrote:
> Update the GPEX host bridge properties related to MMIO ranges with values
> set for the virt machine.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt.c         | 47 ++++++++++++++++++++++++++++-------------
>   include/hw/riscv/virt.h |  1 +
>   2 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 085654ab2f..e64886a4d8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1049,21 +1049,45 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>   }
>   
>   static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> -                                          hwaddr ecam_base, hwaddr ecam_size,
> -                                          hwaddr mmio_base, hwaddr mmio_size,
> -                                          hwaddr high_mmio_base,
> -                                          hwaddr high_mmio_size,
> -                                          hwaddr pio_base,
> -                                          DeviceState *irqchip)
> +                                          DeviceState *irqchip,
> +                                          RISCVVirtState *s)
>   {
>       DeviceState *dev;
>       MemoryRegion *ecam_alias, *ecam_reg;
>       MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
> +    hwaddr ecam_base = s->memmap[VIRT_PCIE_ECAM].base;
> +    hwaddr ecam_size = s->memmap[VIRT_PCIE_ECAM].size;
> +    hwaddr mmio_base = s->memmap[VIRT_PCIE_MMIO].base;
> +    hwaddr mmio_size = s->memmap[VIRT_PCIE_MMIO].size;
> +    hwaddr high_mmio_base = virt_high_pcie_memmap.base;
> +    hwaddr high_mmio_size = virt_high_pcie_memmap.size;
> +    hwaddr pio_base = s->memmap[VIRT_PCIE_PIO].base;
> +    hwaddr pio_size = s->memmap[VIRT_PCIE_PIO].size;
>       qemu_irq irq;
>       int i;
>   
>       dev = qdev_new(TYPE_GPEX_HOST);
>   
> +    /* Set GPEX object properties for the virt machine */
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
> +                            ecam_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
> +                            ecam_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> +                             PCI_HOST_BELOW_4G_MMIO_BASE,
> +                             mmio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
> +                            mmio_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> +                             PCI_HOST_ABOVE_4G_MMIO_BASE,
> +                             high_mmio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
> +                            high_mmio_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
> +                            pio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
> +                            pio_size, NULL);
> +
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       ecam_alias = g_new0(MemoryRegion, 1);
> @@ -1094,6 +1118,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>           gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>       }
>   
> +    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
>       return dev;
>   }
>   
> @@ -1492,15 +1517,7 @@ static void virt_machine_init(MachineState *machine)
>               qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
>       }
>   
> -    gpex_pcie_init(system_memory,
> -                   memmap[VIRT_PCIE_ECAM].base,
> -                   memmap[VIRT_PCIE_ECAM].size,
> -                   memmap[VIRT_PCIE_MMIO].base,
> -                   memmap[VIRT_PCIE_MMIO].size,
> -                   virt_high_pcie_memmap.base,
> -                   virt_high_pcie_memmap.size,
> -                   memmap[VIRT_PCIE_PIO].base,
> -                   pcie_irqchip);
> +    gpex_pcie_init(system_memory, pcie_irqchip, s);
>   
>       create_platform_bus(s, mmio_irqchip);
>   
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 5b03575ed3..f89790fd58 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -61,6 +61,7 @@ struct RISCVVirtState {
>       char *oem_table_id;
>       OnOffAuto acpi;
>       const MemMapEntry *memmap;
> +    struct GPEXHost *gpex_host;
>   };
>   
>   enum {
