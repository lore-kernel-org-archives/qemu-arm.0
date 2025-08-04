Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D93CC87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:47:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj18m-0003ho-4b; Mon, 04 Aug 2025 15:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj0oA-0001Cn-9E
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:25:21 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj0o7-0001j9-U2
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:25:17 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76bdc73f363so2914546b3a.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754335513; x=1754940313; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JGANcVUiiuONpbbaYskZ8YJrHCfleaK8xNXIYfCKDng=;
 b=V2x7rx3K49PRI5EvzDKp+gRTvK2CltreqsTmc4Kkn0CHmTdO6dKSotZJQwSyAfafd6
 lUdAutGc+e2Z+ys2orDgItBGeebG7Oyy5hhA/Yn9neip+27KmaiyGs90T66G8tM4sw4i
 XwwL951AwcMCDLyiDxTZsChQfPWfTZJpAwHEgVNVKtmTfpzYo9NJIhTXMixj9jH8BvDb
 icgDTVYLoHZbEA1B2HKCoZFDohQvmyy97jcUHdAn20gBOUArPSG7bZT1vinRygMvDK4n
 lrswBtQ+TZ66N2cswhnMWligi5+dsfG9Ww8junOMJp/RiPGV0FEoLwxWPvnOxR5UgfvH
 ezPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754335513; x=1754940313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JGANcVUiiuONpbbaYskZ8YJrHCfleaK8xNXIYfCKDng=;
 b=RgFcTVTTScVWQSOKcWjV1AsJHQZP8dknyIlpQl3jI1M7WenluMMwhg95KVilPeYNIl
 9hHfxxHIK0UvBGpvskI9chAOB9yidnHwcXAHdEMmAqIM9iep3HKgKmUZzKptDOBv8EBs
 WQvfn4D1W5rctf0VB/tHSB8MwA+xCpuIDNieZB8SYujszKmmHVuWfVRIS7t5sulw9ghl
 ZAjzuLNzU0Sfbph7+sslf5251QXy4dnJT5+GV9zJT12B4sXK8FZZSdoOqcPvRAvo59Bi
 92bqxlRkh6QWKNzZuBj8ihf9OvaGrQW6eE13AsNyP0pK13XJJB5UThVgV6ToChnKZwe6
 pOMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7FS0hh9Qxf27KCOQ6H4Y9Xgz0fajaK4qHM3/yyBwae/K3/L0F/VB/LN1hmuUlOI7GNepdsI5rjQ==@nongnu.org
X-Gm-Message-State: AOJu0YxYNsURjJ+LxmI9Y5qrmBZiovJ8BGjiPZtN9QALRCj716plK2Jo
 VdYDmr5asAXQbDxbnKtuAhNi/wjqZBYNeTKRGn/JQ6o8Jvydl/FJRCQVzLlyw8Lr2fs=
X-Gm-Gg: ASbGncuBJdiipSRBmogiQNdlohaR779884kuD2GRSzIn4xSMiuCe1UUD8s+Yk4OdtRd
 0SgV2zQMeOsr43OTNiRpKsNkLV61MplYRK7Lspzfo3SZ98DwEK25HQ5eqOwnnqsYJNQSPVO0ZX5
 xymWFB0ebsGSVgVDerXdZwc97M8XZQxkk1VcT3vcvQonFWeM+XEZ0McWEx602bpRGLI0h9htl4K
 XCMV4g8TrChA1d/86Uo7xvYvLJq2bQ3GZcGxJ3izmiCbsozMeT2ctQK+uo1U3Hz0cM4wZHm0VzM
 UdhAAoFJD3vu1qEwixbho+ggnkpqCek8oSCRXOR6XFSV6lke/nXbWcLbljqI7N8SAh5WfuRWolE
 tn4vEct31gGYduk48eo64RNrK9+yR0pOAc4aVRAF9IsESKw==
X-Google-Smtp-Source: AGHT+IHD1Fy7bc7g6MHOn4T/j/mdi120ydEmLe2Sedk2/9/tYMqQkikHBxBXdeHk9dTgibGj6NTPeA==
X-Received: by 2002:a05:6a00:92a9:b0:76b:d93a:69e2 with SMTP id
 d2e1a72fcca58-76bec4ec3b8mr14615999b3a.19.1754335512792; 
 Mon, 04 Aug 2025 12:25:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bdbda5f23sm8916366b3a.112.2025.08.04.12.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:25:12 -0700 (PDT)
Message-ID: <b5ffb299-b4e7-4220-8652-67fdd56c6246@linaro.org>
Date: Mon, 4 Aug 2025 12:25:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/17] hw/arm: virt: add GICv2m for the case when ITS
 is not available
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-3-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-3-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> On Hypervisor.framework for macOS and WHPX for Windows, the provided environment is a GICv3 without ITS.
> 
> As such, support a GICv3 w/ GICv2m for that scenario.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt-acpi-build.c | 4 +++-
>   hw/arm/virt.c            | 8 ++++++++
>   include/hw/arm/virt.h    | 2 ++
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b01fc4f8ef..969fa3f686 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -848,7 +848,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>               build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
>               build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
>           }
> -    } else {
> +    }
> +
> +    if (!vms->its && !vms->no_gicv3_with_gicv2m) {
>           const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
>   
>           /* 5.2.12.16 GIC MSI Frame Structure */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ef6be3660f..5951b331f3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -953,6 +953,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>   
>       if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
>           create_its(vms);
> +    } else if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->no_gicv3_with_gicv2m) {
> +        create_v2m(vms);
>       } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
>           create_v2m(vms);
>       }
> @@ -2402,6 +2404,8 @@ static void machvirt_init(MachineState *machine)
>       vms->ns_el2_virt_timer_irq = ns_el2_virt_timer_present() &&
>           !vmc->no_ns_el2_virt_timer_irq;
>   
> +    vms->no_gicv3_with_gicv2m = vmc->no_gicv3_with_gicv2m;
> +
>       fdt_add_timer_nodes(vms);
>       fdt_add_cpu_nodes(vms);
>   
> @@ -3410,6 +3414,7 @@ static void virt_instance_init(Object *obj)
>       vms->its = true;
>       /* Allow ITS emulation if the machine version supports it */
>       vms->tcg_its = !vmc->no_tcg_its;
> +    vms->no_gicv3_with_gicv2m = false;
>   
>       /* Default disallows iommu instantiation */
>       vms->iommu = VIRT_IOMMU_NONE;
> @@ -3462,8 +3467,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>   
>   static void virt_machine_10_0_options(MachineClass *mc)
>   {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>       virt_machine_10_1_options(mc);
>       compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> +    vmc->no_gicv3_with_gicv2m = true;
>   }
>   DEFINE_VIRT_MACHINE(10, 0)
>   
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 365a28b082..725ec18fd2 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -131,6 +131,7 @@ struct VirtMachineClass {
>       bool no_cpu_topology;
>       bool no_tcg_lpa2;
>       bool no_ns_el2_virt_timer_irq;
> +    bool no_gicv3_with_gicv2m;
>       bool no_nested_smmu;
>   };
>   
> @@ -178,6 +179,7 @@ struct VirtMachineState {
>       char *oem_id;
>       char *oem_table_id;
>       bool ns_el2_virt_timer_irq;
> +    bool no_gicv3_with_gicv2m;
>       CXLState cxl_devices_state;
>   };
>   

I'm not an expert about GIC, but this patch looks sane to me.
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

