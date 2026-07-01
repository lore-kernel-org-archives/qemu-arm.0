Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88343C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 11:57:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wetZS-0006Ge-Fa; Wed, 01 Jul 2026 07:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wetZR-0006GV-P7
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 07:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wetZQ-00039I-8G
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 07:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782907053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=432ulGUAbt4oLutAXtqbHCNZcDQegPBUPaOBFpat778=;
 b=Ffnmaft46jNH7BHwnouiMZ3BXbmyRUmT0qShbs83A7tuLJSc3ILQTLPIQ+EW3AsK9zxZ5h
 2Wirze9biilC0/pv97KlYobNzp3P7dfvi/LzGUsTLhopRD00sAVkto77CJRRwNKOu4iN28
 EZxgdw8d6YtzREzS6mzPf6x/VCnEtx4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-ZoqJCGeWOlm2P_SlBN5IpQ-1; Wed, 01 Jul 2026 07:57:32 -0400
X-MC-Unique: ZoqJCGeWOlm2P_SlBN5IpQ-1
X-Mimecast-MFC-AGG-ID: ZoqJCGeWOlm2P_SlBN5IpQ_1782907051
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47499916233so80918f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 04:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782907051; x=1783511851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=432ulGUAbt4oLutAXtqbHCNZcDQegPBUPaOBFpat778=;
 b=JkhPChMcq50xcwbQcnw31e50ETkgBu77by8WQssX1onwDKyf/JzBCPU57znzGeBPUW
 wSq+RiA24zgUOYvUgdGIL0uWKx3XxWBhnbSnLJe7EnF95jgAhPk+lKAB2vVrGHru38ht
 w8pPX5I7RLV5/igGnG/tST4gcGKYBBmZyrQMQES2MorcHd98Y8+YS4AAFeByq3IShd9U
 3V6UlkFSZVo2CWLIY8M8/S8M57KgQRMNdQgOOdOBrNXO9i3YdItPKq+9VDGOKGXkmSGK
 IZdClusPPvMqi2VDt9eE3FzRAhfgxF2SFETl8NMcmdusUK4Vh6H6uc5275Q+eqxaHxv+
 Wg4w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq67oIDFNafcU/KzEobg0iZRUT0L9YkALihbYEqelaRfM96deDwQE4zXJpzfC9fd/59FsoA08huaw==@nongnu.org
X-Gm-Message-State: AOJu0Yy59993ynA/Bb3rLL9EgdygBu4kAzkWpSvAKzxPpF2sM7f9k3sO
 ayz1gYvx1I+qiSaivLpcPIMtY3AZdR2BCejOeFUeh92LO51E/FVjFLnFO1vHd6oTEs62TlcVt+g
 jmWT8sVkGAu2r9kuPijo8o3sfOTXRnacIA8hqnh3zM8FahuxaVqSu0w==
X-Gm-Gg: AfdE7cm3p8HI/CgpyzlrpjwkPKFuOcFaU2pwwtw4VyzmJlyKJLoN5kwInuT7Se+YGh9
 io2STLpEPZEuj5Ofqn6cuFKJLnR9Kyjo6finmayqY8w6ElE9r2xUwaBalWKQYaYzUdaOk1fgECP
 C0KoMNAAjGbTNOQxWL+AzVY8uIGPTSMkjNcOCHiM6/l434kx90Ct7fd7vEA4jp9FjrCfF/+4HQ1
 sNQNCVbVBB4AHiOuaJHKWpKl11CH0sj+Jr7YfSThNchZo1hgpb9BdUEI/AmJbY6IvL7P+uBN3dH
 t6LnXh8lzSupPe4KQAbNarE6eTBYvKTzv2ka7MQxQCd7bTbarsVqWdOzxdxnwMzXxd92kQoakdk
 tSPXRav02pTAaZIMoAr20gWXob0vtTLLyTXc9K0wkRXgAoSzFryqcEA==
X-Received: by 2002:adf:e009:0:20b0:475:f0d1:eb6d with SMTP id
 ffacd0b85a97d-4775cf541b2mr1689029f8f.58.1782907051515; 
 Wed, 01 Jul 2026 04:57:31 -0700 (PDT)
X-Received: by 2002:adf:e009:0:20b0:475:f0d1:eb6d with SMTP id
 ffacd0b85a97d-4775cf541b2mr1688995f8f.58.1782907051095; 
 Wed, 01 Jul 2026 04:57:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756797a8besm17387521f8f.35.2026.07.01.04.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 04:57:30 -0700 (PDT)
Message-ID: <ffffe2fc-a2fd-445a-876a-dddd1f1cc798@redhat.com>
Date: Wed, 1 Jul 2026 13:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/17] arm: virt: create sbsa-gwdt watchdog
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-5-imammedo@redhat.com>
 <db203d86-7280-4210-8640-e94c9f11f9da@redhat.com>
 <20260629153642.14ce960e@imammedo>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260629153642.14ce960e@imammedo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5YrPhRY-HbDF47vxAW6PtyJut8NBXSvkvjCt6OhbIM_1782907051
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 6/29/26 3:36 PM, Igor Mammedov wrote:
> On Mon, 29 Jun 2026 10:37:59 +0200
> Eric Auger <eauger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 6/24/26 12:28 PM, Igor Mammedov wrote:
>>> Allow to use SBSA generic watchdog with virt machine type.
>>> (includes conditional generation of corresponding FDT and
>>> ACPI GTDT descriptors)
>>>
>>> Use '-device sbsa-gwdt' to command line to enable it.
>>>
>>> Instead of using dynamic sysbus infra to wire up MMIO/IRQ/FDT,
>>> statically assign resources in machine's mem/irq maps and wire
>>> them up at device (pre_)plug handlers. It's similar to dynamic
>>> sysbus wiring, modulo resources are nailed down statically,
>>> and wiring is limited to virt machine only.
>>> (Benefit is that tests don't break anymore on rebase due to
>>> address being stable)
>>>
>>> Tested with Fedora 43:
>>>   FDT: -M virt,acpi=off -device sbsa-gwdt
>>>   ACPI: -M virt -device sbsa-gwdt
>>>
>>> Note:
>>> Windows sees GTDT, initializes watchdog but instead pinging WRR
>>> it sets/advances WOR to way too large value, so it's never going
>>> to trigger watchdog reboot (it's Windows driver issue though).
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> v3:
>>>   - (Eric) assign MMIO/IRQ statically and abandon most of
>>>      dynamic sysbus machinery.
>>>   - (Peter) set watchdog freq to system clock explicitly,
>>>     machine version compat won't work in case host is not runing
>>>     1GHz clock. (Tested on Jetson machine)
>>> ---
>>>  include/hw/arm/virt.h    |  3 +++
>>>  hw/arm/Kconfig           |  1 +
>>>  hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++++--
>>>  hw/arm/virt.c            | 37 +++++++++++++++++++++++++++++++++++++
>>>  hw/core/sysbus-fdt.c     |  2 ++
>>>  hw/watchdog/sbsa_gwdt.c  |  1 +
>>>  6 files changed, 71 insertions(+), 2 deletions(-)
>>>
> [...]
>>> @@ -3820,6 +3824,10 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>>          qlist_append_str(reserved_regions, resv_prop_str);
>>>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>>>          g_free(resv_prop_str);
>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_WDT_SBSA)) {
>>> +        uint64_t cntfrq = object_property_get_int(OBJECT(qemu_get_cpu(0)),
>>> +                                                  "cntfrq", &error_abort);  
>> missing extra line.
>>> +        qdev_prop_set_uint64(dev, "clock-frequency", cntfrq);  
>>
>> Can you explain why you cannot do that in virt_machine_device_plug_cb()?
> 
> sure,
> all prep work, typically is done at pre_plug time. (it's stage we are allowed to fail)
> 
> While at plug time we typically do final (post realize) wiring/exposing model to guest
> (no allowed to fail (I need to do cleanup and remove errp from all plug handlers
> but that is orthogonal to series))
> 
>>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
>>>          if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
>>>              error_setg(errp, "virt machine already has %s set. "
OK
> [...]
> 
>>> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
>>> index acb970e8b3..c4dd8005b7 100644
>>> --- a/hw/watchdog/sbsa_gwdt.c
>>> +++ b/hw/watchdog/sbsa_gwdt.c
>>> @@ -285,6 +285,7 @@ static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
>>>      dc->realize = wdt_sbsa_gwdt_realize;
>>>      device_class_set_legacy_reset(dc, wdt_sbsa_gwdt_reset);
>>>      dc->hotpluggable = false;
>>> +    dc->user_creatable = true;
>>>      set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
>>>      dc->vmsd = &vmstate_sbsa_gwdt;
>>>      dc->desc = "SBSA-compliant generic watchdog device";  
>> You may document somewhere that the device can be dynamically
>> instantiated, in machvirt alone and this required machine specific
>> hardwiring.
> 
> Any suggestion wrt where to put it? 

At least you need to update system/arm/virt.rst with the new support of
the sbsa-gwdt device.

wrt the fact dt bindings are not created by default I would add least
add a comment above dc->user_creatable = true;
saying it requires manual dt bindings in the machine that uses it.

Thanks

Eric

> 
>>
>> Thanks
>>
>> Eric
>>
> 


