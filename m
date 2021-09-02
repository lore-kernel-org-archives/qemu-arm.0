Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp410901lfb;
        Thu, 2 Sep 2021 09:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Rl7csY3NTJJCEziZ/MZjnsqXfCd+rDnjGxJu1JrkTE+/iEFfdHL9aRwrPFnKei/dXvp6
X-Received: by 2002:a5d:6085:: with SMTP id w5mr4781928wrt.104.1630598908546;
        Thu, 02 Sep 2021 09:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630598908; cv=none;
        d=google.com; s=arc-20160816;
        b=AK8Hpdxok4Hr5KejojGRUtEgYsN7+H50B8bZ9CcOnZjenq0Er/qk4zbquJs39FOrvw
         U3CFlLv8Y7SIMSb9bXjzqTCYsx0Q3211I+2iGIqiMh6VvCreG3k2ahXTB/i/BSOw9jD7
         tO3LwCHEcFx//GGG7ggm9s2Yns7ZIT3rNhZ1TfYF2Vs83wP4akzjqGTj2xx0sM/hs9l+
         qNtk6/IUmz8WO2UFp7osK+wQNETqSKcLoUpUZhaVfQvCEvULzuFiz5Wma25Spj8c75uP
         9YEH8EqXUwk8gOKrVU7CsWT/3QtXxA2EBlmRGxjCE+CQd9lamOIG0z2epbPmz3BymNT+
         hKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a/RtGwwh3G9nvrE3auS/tDy7EVbBpvAbChB7o8ajWms=;
        b=msbIsb8aooPJeZ6qopWjooF2s5iHwReXtO0WPmM6U3dK2KiTF9uQjt+vtdrhFqTRpe
         uQOwIZGTf9BtqyF04eyKLod2i62VB7E0R5Meb40y9rZ9nQzOt26n5nMKP32QpvpZDfqS
         NKuKC4OyLv9IKsarN4pJzEPXUsJo7/Oa/zco7LCUFfNE5klX4twyCSS+aeCz1zin6ASG
         WVFYzQIJaPkB0f5ZT40uQqBATnKTuxgMsgQxJWRDM6ozQG/IaxqvqbW2GxQwA82eu1jT
         4Z9Zo0dTVX5mMxOAeQe2P1bvSHzKPdsUEt9pdTHEyWj4nG0csHKw1HIV4v/1P+c31eiG
         13Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ILrrGKP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si2432895wrc.225.2021.09.02.09.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 09:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ILrrGKP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLpGN-00062q-FV
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 12:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLpG4-0005wr-7O
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 12:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLpFz-000206-Ns
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 12:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630598882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/RtGwwh3G9nvrE3auS/tDy7EVbBpvAbChB7o8ajWms=;
 b=ILrrGKP0Fhs2qxVrbEJ7IB4Qt+NXEYfcGHWXbIXTvLIEPWf3k0F+LAHjZbG8DXYvP9oedl
 KweElLtjd78Q91lgUhtSgKRXjTHND6YeEWz5eAc+PrVGdxv7ELY0hn3sqhRQECsw+LMYIz
 e8f527ZL6Ol3/5xa35qG8ZLlWDDrdK8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-KxzmpqirMUu96jjOYKeqFQ-1; Thu, 02 Sep 2021 12:08:01 -0400
X-MC-Unique: KxzmpqirMUu96jjOYKeqFQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso716948wrw.5
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 09:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/RtGwwh3G9nvrE3auS/tDy7EVbBpvAbChB7o8ajWms=;
 b=gouOaQK5nSGZXf1AapGkHxreoR3bm8OqgqrT2HEA/wvdNM1ioWD+J79dup4oXGSiYS
 iJxAs5g40b4sPQEqtfUYTUfqn8j56w855FkmX4+fHveb5nxkiV5vfE4hZftDNgOdqb1o
 Ggs9SmcRrfY7ls2f6zY5PmWa2JI+Xf60ty9mHlBJmheUTJ5m7BK1kaSUIfx1oWookSW/
 67aICEHsAOLWwP0ev5YWo0GB824VlcH/KT0f0K+qu25YA/VBjtz5UHa0epXlk0V/Xfv3
 24/UQ2tfx06/zRY28i0XDTUco+crDIBoBDxqcI8z9yI1ioMLnKW9FctlmeumkJYzd6jf
 ldBg==
X-Gm-Message-State: AOAM532J2rXmTCOAIhdmjwamMQCK3kQKVKjValfPv3YOp5VGwdKaN76X
 i9QhAp1FxxPOgJv2tJOUDjiZ7LV+2ZtO6ilSk9GySHRy9afg+f//esQSSpM3GuR3d8xbH3JR2/K
 zoaVNLsc8G+Ct
X-Received: by 2002:adf:c449:: with SMTP id a9mr4604970wrg.256.1630598878798; 
 Thu, 02 Sep 2021 09:07:58 -0700 (PDT)
X-Received: by 2002:adf:c449:: with SMTP id a9mr4604938wrg.256.1630598878599; 
 Thu, 02 Sep 2021 09:07:58 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m11sm2287120wrz.28.2021.09.02.09.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 09:07:57 -0700 (PDT)
Subject: Re: [PATCH v2 32/35] acpi: arm/virt: build_gtdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-33-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <3a7029be-78c5-91b0-5eaa-42aee6064929@redhat.com>
Date: Thu, 2 Sep 2021 18:07:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-33-imammedo@redhat.com>
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z/laNHo617ht



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
>  include/hw/acpi/acpi-defs.h | 25 -------------
>  hw/arm/virt-acpi-build.c    | 75 ++++++++++++++++++++++++-------------
>  2 files changed, 48 insertions(+), 52 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 012c4ffb3a..0b375e7589 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -131,29 +131,4 @@ struct AcpiFacsDescriptorRev1 {
>  } QEMU_PACKED;
>  typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
>  
> -/*
> - * Generic Timer Description Table (GTDT)
> - */
> -#define ACPI_GTDT_INTERRUPT_MODE_LEVEL    (0 << 0)
> -#define ACPI_GTDT_INTERRUPT_MODE_EDGE     (1 << 0)
> -#define ACPI_GTDT_CAP_ALWAYS_ON           (1 << 2)
> -
> -struct AcpiGenericTimerTable {
> -    ACPI_TABLE_HEADER_DEF
> -    uint64_t counter_block_addresss;
> -    uint32_t reserved;
> -    uint32_t secure_el1_interrupt;
> -    uint32_t secure_el1_flags;
> -    uint32_t non_secure_el1_interrupt;
> -    uint32_t non_secure_el1_flags;
> -    uint32_t virtual_timer_interrupt;
> -    uint32_t virtual_timer_flags;
> -    uint32_t non_secure_el2_interrupt;
> -    uint32_t non_secure_el2_flags;
> -    uint64_t counter_read_block_address;
> -    uint32_t platform_timer_count;
> -    uint32_t platform_timer_offset;
> -} QEMU_PACKED;
> -typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
> -
>  #endif
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e8553dcae5..8f28e82760 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -455,40 +455,61 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_composed(linker, &table);
>  }
>  
> -/* GTDT */
> +/*
> + * ACPI spec, Revision 5.1
> + * 5.2.24 Generic Timer Description Table (GTDT)
> + */
>  static void
>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> -    int gtdt_start = table_data->len;
> -    AcpiGenericTimerTable *gtdt;
> -    uint32_t irqflags;
> -
> -    if (vmc->claim_edge_triggered_timers) {
> -        irqflags = ACPI_GTDT_INTERRUPT_MODE_EDGE;
> -    } else {
> -        irqflags = ACPI_GTDT_INTERRUPT_MODE_LEVEL;
> -    }
> -
> -    gtdt = acpi_data_push(table_data, sizeof *gtdt);
> -    /* The interrupt values are the same with the device tree when adding 16 */
> -    gtdt->secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_S_EL1_IRQ + 16);
> -    gtdt->secure_el1_flags = cpu_to_le32(irqflags);
> -
> -    gtdt->non_secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL1_IRQ + 16);
> -    gtdt->non_secure_el1_flags = cpu_to_le32(irqflags |
> -                                             ACPI_GTDT_CAP_ALWAYS_ON);
> +    /*
> +     * Table 5-117 Flag Definitions
> +     * set only "Timer interrupt Mode" and assume "Timer Interrupt
> +     * polarity" bit as '0: Interrupt is Active high'
> +     */
> +    uint32_t irqflags = vmc->claim_edge_triggered_timers ?
> +        1 : /* Interrupt is Edge triggered */
> +        0;  /* Interrupt is Level triggered  */
> +    AcpiTable table = { .sig = "GTDT", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> -    gtdt->virtual_timer_interrupt = cpu_to_le32(ARCH_TIMER_VIRT_IRQ + 16);
> -    gtdt->virtual_timer_flags = cpu_to_le32(irqflags);
> +    acpi_init_table(&table, table_data);
>  
> -    gtdt->non_secure_el2_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL2_IRQ + 16);
> -    gtdt->non_secure_el2_flags = cpu_to_le32(irqflags);
> +    /* CntControlBase Physical Address */
> +    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
> +    build_append_int_noprefix(table_data, 0, 8);
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    /*
> +     * FIXME: clarify comment:
> +     * The interrupt values are the same with the device tree when adding 16
> +     */
> +    /* Secure EL1 timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_S_EL1_IRQ + 16, 4);
> +    /* Secure EL1 timer Flags */
> +    build_append_int_noprefix(table_data, irqflags, 4);
> +    /* Non-Secure EL1 timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL1_IRQ + 16, 4);
> +    /* Non-Secure EL1 timer Flags */
> +    build_append_int_noprefix(table_data, irqflags |
> +                              1UL << 2, /* Always-on Capability */
> +                              4);
> +    /* Virtual timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_VIRT_IRQ + 16, 4);
> +    /* Virtual Timer Flags */
> +    build_append_int_noprefix(table_data, irqflags, 4);
> +    /* Non-Secure EL2 timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL2_IRQ + 16, 4);
> +    /* Non-Secure EL2 timer Flags */
> +    build_append_int_noprefix(table_data, irqflags, 4);
> +    /* CntReadBase Physical address */
> +    build_append_int_noprefix(table_data, 0, 8);
> +    /* Platform Timer Count */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    /* Platform Timer Offset */
> +    build_append_int_noprefix(table_data, 0, 4);
>  
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + gtdt_start), "GTDT",
> -                 table_data->len - gtdt_start, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +    acpi_table_composed(linker, &table);
>  }
>  
>  /*
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

