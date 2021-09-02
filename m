Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp395755lfb;
        Thu, 2 Sep 2021 08:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpSuQ9WqUfFFwG06JeJksmG8il7k1li2/YJL6OvySs6tt3SM4iRgHbP4QalffpDcKLVl+X
X-Received: by 2002:a67:d216:: with SMTP id y22mr2742029vsi.40.1630597965223;
        Thu, 02 Sep 2021 08:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630597965; cv=none;
        d=google.com; s=arc-20160816;
        b=KjAT2ERYFvL9SbUU4iBEaHGWM9KU/OQXoxceOJZNkz/ncCwCnJwWdborPaRsmjqRrk
         NoBjU8qJK76jQ49qwQErbKX32TfvpeFqGv1zhX8A7plli7l2K4/1zWJyPDSpmJgq0xsp
         tTcYuobXk2EbF8/6QeHFhBBYrKMa6zjh1jGzMlCITit4XAPQVYw20sSHpc+ttgdQ6Q1Z
         1plbRnInfjxN/3piXM4Wx4316oi1Nn7QxBVLas1QSHYcqBdGdS5h50tuX4Kp3mpT0yk0
         Czn05HIMbbxF0D8LlUPc2+OxvzKU/f1QDxaqJjgbS1BqV9HYhuTplGqGAPCUtFikiuBD
         pHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zfH8SyTJ8O8EKUloFW2XjBlIIzOxLPdSKQyAuV5NCbQ=;
        b=fVB1ylNdN9iNEkwey9sKIO/o8aV8gVE+LKxbcb+9+pf1tgMGWvJ+qNPiqBC4pV4qzc
         A6ApMUHTQBvi+vfPCqxYh/KTogIDHRdTGksj9JcfRFXT3LUQaWoUshH8pQDoXm7uqTx8
         VQ6dqFXOHpsvJXh1lKRoE5Zs+pBtNmYNfOPyh6vTVaBKq6pEtpppXoZvSgjfZbOluY/v
         EEbTXFZG2cyL1Rk5247BrSRj8E97xBofqA7n53kahBo2zIIN2j31O7yx9OYR0h4ZDsqi
         CQHxqKTfoh9s59r6WYRsbabKFVY7rkWBk/zSY4gnPPquPu1Mi7JYS1Ivsb2X0CDpG+4M
         Wg8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P5SEt/CL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m192si933646vke.38.2021.09.02.08.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P5SEt/CL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLp1A-0004W4-GJ
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLoyb-0002AC-1j
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLoyX-0003K9-O4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630597800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfH8SyTJ8O8EKUloFW2XjBlIIzOxLPdSKQyAuV5NCbQ=;
 b=P5SEt/CL3nahJ4gqyd7fyvb1l8LZaf1/yNe2kz4s2VENXBcNsl+QPtoJ8aSJgilkJMuF5N
 43QMmDs8LPAjQ+GRl1y1x2lGCio/nw+6HX8li7IliJyqPvXFgM4bmHSLR7nZrJ3bYhaeQC
 hExhY2uWbBsjFRBXzvM3N5j6QF37PuQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-98BNu8G7MianHbmok_9pig-1; Thu, 02 Sep 2021 11:49:58 -0400
X-MC-Unique: 98BNu8G7MianHbmok_9pig-1
Received: by mail-wm1-f69.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so1219153wmd.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zfH8SyTJ8O8EKUloFW2XjBlIIzOxLPdSKQyAuV5NCbQ=;
 b=jobdJvGYPj0NfDtgNk3lWQYmZ2DYO4JDqkE9/fzIGz1jIDX6JglhaAmCkhyM0CqOfQ
 iyR1eZwK7XYl42NZNO/87EizKiSERN8D/1jc5o7ybPvr0UX52JenI+t3UeUw43ka9lPc
 /SNlPbyyNLAjttwV0PiVo9ljR/tMuqlvJlMjHFvxdmQX0ooMhT1kzj+1X4lTwX4brNGM
 NUtj45UmJGqXqHQYopatwTqIMIbnkg0GdBbqu9H/cMfmSE7WQygla74IEmnUVmP4zgXc
 hK1cESmsz1+PsRmsIcMKDJbKnh9MCW7kvsPTICUb5vqotdsjh9EyMAg8Baj6k4F2Q8KY
 CJQQ==
X-Gm-Message-State: AOAM530ieVE9GolZU5dtw7pQ9oGFke6plR+RAI/Mo7nyU3BQ+pSI1qzf
 Urq7Id7TE5FKL4ynnJrfDgRXu/HI2Z9fXooVRqyWw+plCWXX/pbuWEyyNV0vTtxe2vgSJnAtLFC
 xGqKL2MtB5r4oRs0=
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr3899463wmq.6.1630597796983; 
 Thu, 02 Sep 2021 08:49:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr3899449wmq.6.1630597796780; 
 Thu, 02 Sep 2021 08:49:56 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r12sm2320512wrv.96.2021.09.02.08.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 08:49:56 -0700 (PDT)
Subject: Re: [PATCH v2 31/35] acpi: arm/virt: build_spcr: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-32-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <9c3ae446-3ed4-7a49-721a-95ad3e6d66cf@redhat.com>
Date: Thu, 2 Sep 2021 17:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-32-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1gJgHMEnoeI9

Hi Igor,

On 7/8/21 5:46 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> while at it, replace packed structure with endian agnostic
> build_append_FOO() API.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> ---
>  include/hw/acpi/acpi-defs.h | 32 -----------------
>  hw/arm/virt-acpi-build.c    | 68 ++++++++++++++++++++++---------------
>  2 files changed, 41 insertions(+), 59 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 6f2f08a9de..012c4ffb3a 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -117,38 +117,6 @@ typedef struct AcpiFadtData {
>  #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
>  #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
>  
> -/*
> - * Serial Port Console Redirection Table (SPCR), Rev. 1.02
> - *
> - * For .interface_type see Debug Port Table 2 (DBG2) serial port
> - * subtypes in Table 3, Rev. May 22, 2012
> - */
> -struct AcpiSerialPortConsoleRedirection {
> -    ACPI_TABLE_HEADER_DEF
> -    uint8_t  interface_type;
> -    uint8_t  reserved1[3];
> -    struct AcpiGenericAddress base_address;
> -    uint8_t  interrupt_types;
> -    uint8_t  irq;
> -    uint32_t gsi;
> -    uint8_t  baud;
> -    uint8_t  parity;
> -    uint8_t  stopbits;
> -    uint8_t  flowctrl;
> -    uint8_t  term_type;
> -    uint8_t  reserved2;
> -    uint16_t pci_device_id;
> -    uint16_t pci_vendor_id;
> -    uint8_t  pci_bus;
> -    uint8_t  pci_slot;
> -    uint8_t  pci_func;
> -    uint32_t pci_flags;
> -    uint8_t  pci_seg;
> -    uint32_t reserved3;
> -} QEMU_PACKED;
> -typedef struct AcpiSerialPortConsoleRedirection
> -               AcpiSerialPortConsoleRedirection;
> -
>  /*
>   * ACPI 1.0 Firmware ACPI Control Structure (FACS)
>   */
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a07540affb..e8553dcae5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -349,39 +349,53 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_composed(linker, &table);
>  }
>  
> +/*
> + * Serial Port Console Redirection Table (SPCR)
> + * Rev: 1.07
> + */
was
/*
 * Serial Port Console Redirection Table (SPCR), Rev. 1.02
 */

By the way
https://uefi.org/acpi/specs does not list 1.02 nor 1.07
https://docs.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
?

>  static void
>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    AcpiSerialPortConsoleRedirection *spcr;
> -    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> -    int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
> -    int spcr_start = table_data->len;
> -
> -    spcr = acpi_data_push(table_data, sizeof(*spcr));
> -
> -    spcr->interface_type = 0x3;    /* ARM PL011 UART */
> -
> -    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
> -    spcr->base_address.bit_width = 8;
> -    spcr->base_address.bit_offset = 0;
> -    spcr->base_address.access_width = 1;
> -    spcr->base_address.address = cpu_to_le64(uart_memmap->base);
> -
> -    spcr->interrupt_types = (1 << 3); /* Bit[3] ARMH GIC interrupt */
> -    spcr->gsi = cpu_to_le32(irq);  /* Global System Interrupt */
> +    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> -    spcr->baud = 3;                /* Baud Rate: 3 = 9600 */
> -    spcr->parity = 0;              /* No Parity */
> -    spcr->stopbits = 1;            /* 1 Stop bit */
> -    spcr->flowctrl = (1 << 1);     /* Bit[1] = RTS/CTS hardware flow control */
> -    spcr->term_type = 0;           /* Terminal Type: 0 = VT100 */
> +    acpi_init_table(&table, table_data);
>  
> -    spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
> -    spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
> +    /* Interface Type */
> +    build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
> +    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
> +    /* Base Address */
> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> +                     vms->memmap[VIRT_UART].base);
> +    /* Interrupt Type */
> +    build_append_int_noprefix(table_data,
> +        (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
> +    build_append_int_noprefix(table_data, 0, 1); /* IRQ */
> +    /* Global System Interrupt */
> +    build_append_int_noprefix(table_data,
> +                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
> +    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
> +    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
> +    /* Stop Bits */
> +    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
> +    /* Flow Control */
> +    build_append_int_noprefix(table_data,
> +        (1 << 1) /* RTS/CTS hardware flow control */, 1);
> +    /* Terminal Type */
> +    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
> +    build_append_int_noprefix(table_data, 0, 1); /* Language */
reserved2 -> language in 1.07? but that's fine
maybe just mention it in the commit msg?
> +    /* PCI Device ID  */
> +    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
> +    /* PCI Vendor ID */
> +    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
> +    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
> +    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
> +    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number */
> +    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
> +    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>  
> -    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
> -                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +    acpi_table_composed(linker, &table);
>  }
>  
>  /*
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

