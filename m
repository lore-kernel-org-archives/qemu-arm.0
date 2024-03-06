Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp357704ejb;
        Wed, 6 Mar 2024 00:12:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVb9CES3npWAQ6vW0a+DiE1sp+EdEttqpgIX1OSmtgljVtaOQO/jdFR7POh8+kTBqfqojhfShaxBO7gcz3sTLk8u2T8llmL
X-Google-Smtp-Source: AGHT+IE/WXrCBwbQ82WAP82RYm4t3dhwabZNvdkZgEAPxVz9xXkq0uhR6pYO0bq5pBB4J+gfYwnd
X-Received: by 2002:a0c:fd8b:0:b0:690:65a9:3403 with SMTP id p11-20020a0cfd8b000000b0069065a93403mr4282020qvr.61.1709712737898;
        Wed, 06 Mar 2024 00:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709712737; cv=none;
        d=google.com; s=arc-20160816;
        b=Nmxko6UmXAtSayGZ5S6o4NJzIUJRhfv4raaK9R+CddUgdq48jHfXSDqgv7RV9qiI0d
         8QHC4SZcBCkF3AwNGAj5hkbQzTLMcrmFCJeQG/PMFaV+Nkd1alHzeuIu6+Tuv47StjAT
         ZWa9egFJ7sq+v87+/vNRO+SlIkkakEGcisXF2onnlGCuUuHm0v4dHZpWt761YdcVnnvU
         CAQ6DS4G5mziFf5og9UweoGelffayzNu5sKKEKpdOXlOClF5lKJRHm3wz679E4K7iUcQ
         Jl1NYCTp+INsG450SxcwFU9lljsPfXd9/zlWK9ns+hyi1/pMbAzE5g+ImZGevPQgaGFt
         X6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HbrxjbmwzxOLAsI68/9/0zanrrJV5hOKAirB2YP4Sog=;
        fh=fx37mVEYDP/P1sQm4evO1VSmvGxemS7qqx14BcJ/490=;
        b=bg2wvS8G9nydXZJOqX/Y/gB6JUmP6qEZtTQRZCE21ETaV7U521g+dXM5ryl9jBv1n7
         MC53IkI2C/jHFqY3juPmaGNEzXH8aiQGm5ivqaJOR/XtLXHnd70uKENTfKiib/QOmDzf
         +o2TAGgxAxGztnfJRR1BeiciQD3Quqh1tk/GF7tshxjucMdYa4MkItkKakH+/sLzIX/D
         nucdsmRh6t3iqb9VhxdGhSakS5xrMhkeQff+jIiCyInSYsttoWMolz6ZRxSmEy1CiywT
         LI0wzav7Yuoo/HRpvVThtyRqZv4VI4UHGBMmHy0/Mp28jCgRBQze4bGDJCL/+nQc4zcn
         DvYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G99PXCOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy6-20020a0562140f6600b0068f6601145dsi14596509qvb.114.2024.03.06.00.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 00:12:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G99PXCOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhmNO-0005XB-FK; Wed, 06 Mar 2024 03:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhmNN-0005Wy-GW
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 03:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhmNL-0007tU-G7
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 03:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709712702;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbrxjbmwzxOLAsI68/9/0zanrrJV5hOKAirB2YP4Sog=;
 b=G99PXCOyiq/msquQdp/tiPyHp0n52DkE8GbPyTGtLvG9gzomFz36RsxfVs84XJvwRh30sn
 Nl2ugE264ctU19qi6n2zM1FOguFiFZwqX5BD7RQgOq/eA0/BsMmRuWBszszib3iq70A/w1
 1E+S2U/t6/Isl5FUwvkezTF5ySM73vc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-5xO7q7rVNniUc7tmobpqXQ-1; Wed, 06 Mar 2024 03:11:41 -0500
X-MC-Unique: 5xO7q7rVNniUc7tmobpqXQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42ef02a3861so34737971cf.0
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 00:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709712696; x=1710317496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HbrxjbmwzxOLAsI68/9/0zanrrJV5hOKAirB2YP4Sog=;
 b=X9KtHVF8YJXQpl6JwYTga4fPeecSO6cyuloJZKXcccWlXuPPj51V83kgSYeCcRfUvG
 PuIWgO0f6DrjalQl5A9n/rzNvyfwlpfgem/1S691GqkeiwRGA4n+iNrz/0oDTLmzclat
 1smZPza5MRixsz1FSb7oTkdTbmHwV5mij2nTuSHbm9/se6WU9qWYSN4iFnDRWqibtvlK
 L3k8psYswWlg9O7O6JMo5Kd3WPUwBGfkvcqxztXc3f/FnPFz6jGhldwIiCEOLMbSe8Lv
 TM90KiguCN1wxRe2IgBOFyPTk5ZtrJJHiOMpp5wqh9UcCYgorE6lw5C2/u/Gz4nkxnwt
 28tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtHEzFpBoikGC9wwSt0EhXpN/18wuZicTAKOjFML9stOtLqd4laj4Jvaegj4o/ZzFvHsQni/w9xioIhNGAjFecro2L
X-Gm-Message-State: AOJu0YytDr4amKBWJKK3Jg8cdXDMR3TjJCo0z+GRapqXKX8+vBGpgJpD
 jXAw3mLGYqxh/8MfdFUWUTDzRLhii7tp/+WCFEWAGhPoG+KDwArVHBdcDkeTwS5ZAq1PH8JxutD
 BvoR/00lYNCDYuno4uPcFgAAHWr691q4kGJH+eFJO4tIPA80vKA==
X-Received: by 2002:a05:620a:8309:b0:788:31c7:ceb5 with SMTP id
 pa9-20020a05620a830900b0078831c7ceb5mr3757715qkn.30.1709712695963; 
 Wed, 06 Mar 2024 00:11:35 -0800 (PST)
X-Received: by 2002:a05:620a:8309:b0:788:31c7:ceb5 with SMTP id
 pa9-20020a05620a830900b0078831c7ceb5mr3757693qkn.30.1709712695622; 
 Wed, 06 Mar 2024 00:11:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a05620a400100b007881fbfea7bsm3867890qko.24.2024.03.06.00.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 00:11:35 -0800 (PST)
Message-ID: <83d37a18-ed8d-42d2-8272-6f95a637a0e9@redhat.com>
Date: Wed, 6 Mar 2024 09:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] hw/i386/q35: Set virtio-iommu aw-bits default
 value to 39
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "yanghliu@redhat.com"
 <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
 <20240305180734.48515-8-eric.auger@redhat.com>
 <SJ0PR11MB67443EC0B600D02A773AD20792212@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB67443EC0B600D02A773AD20792212@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DQYz1Y05c5a2

Hi Zhenzhong,

On 3/6/24 04:15, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH v6 7/9] hw/i386/q35: Set virtio-iommu aw-bits default
>> value to 39
>>
>> Currently the default input range can extend to 64 bits. On x86,
>> when the virtio-iommu protects vfio devices, the physical iommu
>> may support only 39 bits. Let's set the default to 39, as done
>> for the intel-iommu.
>>
>> We use hw_compat_8_2 to handle the compatibility for machines
>> before 9.0 which used to have a virtio-iommu default input range
>> of 64 bits.
>>
>> Of course if aw-bits is set from the command line, the default
>> is overriden.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v5 -> v6:
>> - split pc/arm settings
>>
>> v3 -> v4:
>> - update the qos test to relax the check on the max input IOVA
>>
>> v2 -> v3:
>> - collected Zhenzhong's R-b
>> - use &error_abort instead of NULL error handle
>>  on object_property_get_uint() call (Cédric)
>> - use VTD_HOST_AW_39BIT (Cédric)
>>
>> v1 -> v2:
>> - set aw-bits to 48b on ARM
>> - use hw_compat_8_2 to handle the compat for older machines
>>  which used 64b as a default
>> ---
>> include/hw/i386/pc.h            | 3 +++
>> hw/core/machine.c               | 1 +
>> hw/i386/pc.c                    | 6 ++++++
>> hw/i386/pc_q35.c                | 2 ++
>> tests/qtest/virtio-iommu-test.c | 2 +-
>> 5 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 5065590281..b3229f98de 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -198,6 +198,9 @@ void pc_system_parse_ovmf_flash(uint8_t
>> *flash_ptr, size_t flash_size);
>> /* sgx.c */
>> void pc_machine_init_sgx_epc(PCMachineState *pcms);
>>
>> +extern GlobalProperty pc_compat_defaults[];
>> +extern const size_t pc_compat_defaults_len;
> If we only want to support q35 and not i440fx, better to add _q35 suffix and move into pc_q35.c and made static?
Sure. I was initially following Igor's suggestion but it makes sense to
restrict to q35 and turn in static I think.
>
>> +
>> extern GlobalProperty pc_compat_8_2[];
>> extern const size_t pc_compat_8_2_len;
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 6bd09d4592..4b89172d1c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -35,6 +35,7 @@
>>
>> GlobalProperty hw_compat_8_2[] = {
>>     { TYPE_VIRTIO_IOMMU_PCI, "granule", "4k" },
>> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
>> };
>> const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index f5ff970acf..9024483356 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -59,6 +59,7 @@
>> #include "hw/i386/kvm/xen_evtchn.h"
>> #include "hw/i386/kvm/xen_gnttab.h"
>> #include "hw/i386/kvm/xen_xenstore.h"
>> +#include "hw/i386/intel_iommu.h"
> This can be removed?
yes
>
>> #include "hw/mem/memory-device.h"
>> #include "e820_memory_layout.h"
>> #include "trace.h"
>> @@ -78,6 +79,11 @@
>>     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version "
>> v, },\
>>     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>>
>> +GlobalProperty pc_compat_defaults[] =  {
>> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
>> +};
>> +const size_t pc_compat_defaults_len =
>> G_N_ELEMENTS(pc_compat_defaults);
>> +
>> GlobalProperty pc_compat_8_2[] = {};
>> const size_t pc_compat_8_2_len = G_N_ELEMENTS(pc_compat_8_2);
>>
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 45a4102e75..32421a0a5f 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -356,6 +356,8 @@ static void pc_q35_machine_options(MachineClass
>> *m)
>>     machine_class_allow_dynamic_sysbus_dev(m,
>> TYPE_INTEL_IOMMU_DEVICE);
>>     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>>     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>> +    compat_props_add(m->compat_props,
>> +                     pc_compat_defaults, pc_compat_defaults_len);
>> }
>>
>> static void pc_q35_9_0_machine_options(MachineClass *m)
>> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
>> index 068e7a9e6c..0f36381acb 100644
>> --- a/tests/qtest/virtio-iommu-test.c
>> +++ b/tests/qtest/virtio-iommu-test.c
>> @@ -34,7 +34,7 @@ static void pci_config(void *obj, void *data,
>> QGuestAllocator *t_alloc)
>>     uint8_t bypass = qvirtio_config_readb(dev, 36);
>>
>>     g_assert_cmpint(input_range_start, ==, 0);
>> -    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
>> +    g_assert_cmphex(input_range_end, >=, 32);
> UINT32_MAX?
sure!

Thank you for the review!

Eric
>
> Thanks
> Zhenzhong
>
>>     g_assert_cmpint(domain_range_start, ==, 0);
>>     g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
>>     g_assert_cmpint(bypass, ==, 1);
>> --
>> 2.41.0

