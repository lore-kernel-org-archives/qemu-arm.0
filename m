Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9486AC87FCF
	for <qemu-arm@archiver.kernel.org>; Sat,  9 Aug 2025 16:22:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukmJv-0000b8-Ak; Sat, 09 Aug 2025 12:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ukmJq-0000XW-4s
 for qemu-arm@nongnu.org; Sat, 09 Aug 2025 12:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ukmJo-00012t-34
 for qemu-arm@nongnu.org; Sat, 09 Aug 2025 12:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754756474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+mjs/R5edYirAIx5YSfsrmLD1mUJiE6SJ5/8ozOwWI0=;
 b=aAAtWp4EVmUYO9oI2MXB2Y0wX+jSa00gU/nWloaxWuKpRtOm461rOl8eLlOeAYfrYxOzQW
 e4cLzI7uy3P1OGgTu36JrTT36BS2VVb8Zk1vQaGEAwlZmyo6i2ls5fVi7hyYZmOSC8BorW
 1GedzMTF+VObOMXpo7eSwgQL1HtsXnc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-TppbETDiMLytZ_2wDunbWA-1; Sat, 09 Aug 2025 12:21:11 -0400
X-MC-Unique: TppbETDiMLytZ_2wDunbWA-1
X-Mimecast-MFC-AGG-ID: TppbETDiMLytZ_2wDunbWA_1754756470
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-459db6e35c3so22826615e9.2
 for <qemu-arm@nongnu.org>; Sat, 09 Aug 2025 09:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754756470; x=1755361270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+mjs/R5edYirAIx5YSfsrmLD1mUJiE6SJ5/8ozOwWI0=;
 b=nvVXvdFFuo4qdSByajq0oI/jVopg4V9nIeu/OLQpJO/fQyM77f/saf9XXvKY8hzJRw
 L29Q5vnDt67cyyhvdBbMQXcybjeh4+rpgDvfOYGAUZUSLqtj4WUnAFO7qLQlecTD0yND
 lpeqgxXc1zlWx1BpZAMfcWGSzvMsUKypjN/AnGsylEY25+5Styoc0mnXZO1au/N1hkzf
 e7oDSxlRzUz3op669c+Q7UkpYlMrQKHKP9iJ0+MzGJkic1/9hhSGK3VG2rYdu8+Yywz5
 ohIjaWnodWd5IwUpiKL8h+vlVz9jBI2EWNUUvZB9Y26buwdGetgjUbf6VJ7T4sJBvLgl
 zWug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc5y6bj8a0PtaPZ+FicI9YEqSCiEFhrZ8IHtbiiPTuTDLh6WWL69wt9kUq7AKnaQ4yjQyb9gzmCg==@nongnu.org
X-Gm-Message-State: AOJu0Yyw4+xaoXHg+D/nPiWErW1IcSvr7lGNUwlZhNy8E3Ai1LlRJ8X2
 grJY2Q/kmqDLA1OoszSmiw4efHgNoObcZyfFrcKM2zdwFwXU6h35Z7YjFx00KWvich60Ie0wdtK
 0FDFuNC6oesFArbdDoCtWsbyCbSGIYILiNmZZ/8hB5WHD3Q/rhf8t6w==
X-Gm-Gg: ASbGncsMKlLM2i53QyoGdC0/YGyQK2Zx1+tJLnIojpcTT0ZW2aj+NQWiLIKX9zzKmpj
 2sHO3HORFcVDPrSlc4mf5B5lOUKnyIcUjcLQ3eEIAhEXcLzYyVMpmNXNrn5K8Dgq0XidI4kulCg
 vfJns87ly4oGNBnpBu+KZoDE/gGwlVzU8wQRTWa3lgTq9CGgVa1ChVW/YF0PZFFp5BPTj6VW2/F
 jNiqoo8DsxJxfEu4MI8A9KPM2stfr7LFxQrAn/yilpxC0SVJxcOuw0dgRm8Mv1OofkY3Uf3kwtB
 0kAdVQTH67E5LgnBImPjPUUk497/NDNfLI63w3Hbgf51sjociMhCkeSNlzdMj7JoKbqoGX0becy
 iOJkuvNxbD88=
X-Received: by 2002:a05:600c:6307:b0:459:d709:e5d4 with SMTP id
 5b1f17b1804b1-459f7a1d7c9mr62191365e9.0.1754756469828; 
 Sat, 09 Aug 2025 09:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtuUj2xnoFSmG2X5FTIRfBk/PtyQZGDTLAi5lOwWqckgw7Tuloef6ww6XnWzvt+j9ANdcvWg==
X-Received: by 2002:a05:600c:6307:b0:459:d709:e5d4 with SMTP id
 5b1f17b1804b1-459f7a1d7c9mr62191095e9.0.1754756469414; 
 Sat, 09 Aug 2025 09:21:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e586ad64sm179096065e9.20.2025.08.09.09.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 09:21:08 -0700 (PDT)
Message-ID: <5c4dab6f-6e14-4a05-b967-b9068144a079@redhat.com>
Date: Sat, 9 Aug 2025 18:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH RESEND 4/4] hw/arm/virt: Add Target Implementation CPU
 support
To: Shameer Kolothum <shameerkolothum@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 berrange@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 armbru@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, salil.mehta@huawei.com,
 yangjinqian1@huawei.com, shameerali.kolothum.thodi@huawei.com
References: <20250801074730.28329-1-shameerkolothum@gmail.com>
 <20250801074730.28329-5-shameerkolothum@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250801074730.28329-5-shameerkolothum@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OWkpLuo1XolOex9fC8RKxp6YYYYRoZ0zxX3ZuBPCy_8_1754756470
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,
On 8/1/25 9:47 AM, Shameer Kolothum wrote:
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>
> Add the impl-cpu property to virt machine. This will enable
> user to specify the target implementation CPUs as the example
> below:
>
> ...
> -M impl-cpu.0.midr=1,impl-cpu.0.revidr=1,impl-cpu.0.aidr=1,\
> impl-cpu.1.midr=2,impl-cpu.1.revidr=2,impl-cpu.1.aidr=2 \
>
> Make use of helper functions to check the KVM support for target
> Impl CPUs and if supported set the user specified target CPUs.

I think you need to document the new virt options in
docs/system/arm/virt.rst

>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt.c         | 66 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  3 ++
>  2 files changed, 69 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a96452f17a..72a0cd3ea8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -71,6 +71,7 @@
>  #include "hw/firmware/smbios.h"
>  #include "qapi/visitor.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "qapi/qapi-visit-machine.h"
>  #include "qobject/qlist.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> @@ -2232,6 +2233,20 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>  
> +    if (vms->target_cpus_num) {
> +        if (!kvm_enabled()) {
> +            error_report("Target Impl CPU requested, but not supported "
> +                         "without  KVM");
> +            exit(1);
> +        }
> +
> +        if (!kvm_arm_target_impl_cpus_supported()) {
> +            error_report("Target Impl CPU requested, but not supported by KVM");
> +            exit(1);
> +        }
> +        kvm_arm_set_target_impl_cpus(vms->target_cpus_num, vms->target_cpus);
> +    }
> +
>      create_fdt(vms);
>  
>      assert(possible_cpus->len == max_cpus);
> @@ -2666,6 +2681,45 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
>      strncpy(vms->oem_table_id, value, 8);
>  }
>  
> +static void virt_set_target_impl_cpus(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +    ArmTargetImplCPUList *list = NULL;
> +    ArmTargetImplCPUList *iter = NULL;
> +    ArmTargetImplCPU *target_cpus;
> +    uint64_t target_num = 0;
> +    int i;
> +
> +    visit_type_ArmTargetImplCPUList(v, name, &list, errp);
> +    if (!list) {
> +        return;
> +    }
> +
> +    for (iter = list; iter; iter = iter->next) {
> +        target_num++;
> +    }
> +
> +    target_cpus = g_new0(ArmTargetImplCPU, target_num);
> +    for (i = 0, iter = list; iter; iter = iter->next, i++) {
> +        target_cpus[i].midr = iter->value->midr;
> +        target_cpus[i].revidr = iter->value->revidr;
> +        target_cpus[i].aidr = iter->value->aidr;
> +    }
Can't you avoid having both an array and a list. Can you use the list
all the way?
> +    vms->target_cpus_num = target_num;
> +    vms->target_cpus = target_cpus;
> +    vms->target_cpus_list = list;
> +}
> +
> +static void virt_get_target_impl_cpus(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +    ArmTargetImplCPUList **list = &vms->target_cpus_list;
> +
> +    visit_type_ArmTargetImplCPUList(v, name, list, errp);
> +}
>  
>  bool virt_is_acpi_enabled(VirtMachineState *vms)
>  {
> @@ -3326,6 +3380,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Override the default value of field OEM Table ID "
>                                            "in ACPI table header."
>                                            "The string may be up to 8 bytes in size");
> +    object_class_property_add(oc, "impl-cpu", "ArmTargetImplCPU",
> +                              virt_get_target_impl_cpus,
> +                              virt_set_target_impl_cpus,
> +                              NULL, NULL);
> +    object_class_property_set_description(oc, "impl-cpu",
> +                                          "Describe target implementation CPU in the format: "
> +                                          "impl-cpu.0.midr=1,"
> +                                          "impl-cpu.0.revidr=1,"
> +                                          "impl-cpu.0.aidr=1,"
> +                                          "impl-cpu.1.midr=2,"
> +                                          "impl-cpu.1.revidr=2,"
> +                                          "impl-cpu.1.aidr=2");
>  
>  }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c8e94e6aed..cf462fcb37 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -180,6 +180,9 @@ struct VirtMachineState {
>      char *oem_id;
>      char *oem_table_id;
>      bool ns_el2_virt_timer_irq;
> +    uint64_t target_cpus_num;
> +    ArmTargetImplCPU *target_cpus;
> +    ArmTargetImplCPUList *target_cpus_list;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
Thanks

Eric


