Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2811791ejf;
        Tue, 27 Feb 2024 09:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9NY13Qh18fgFemRjr0+ve5yrXLGvdB3gpjFArQrOU+cQONR9woKbub4ZF4aNg5xObdP1zl7nDVDoYmeLMGga8P0pvtczX
X-Google-Smtp-Source: AGHT+IFSudXIUCOAt9BblPC8m6vYCQ8ZL6olP2V7IsW4HAQt5/1lzQkjzMjmCFgc11f/9F8pTW9P
X-Received: by 2002:a05:600c:3b22:b0:412:967e:3a3a with SMTP id m34-20020a05600c3b2200b00412967e3a3amr9853389wms.15.1709054284263;
        Tue, 27 Feb 2024 09:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709054284; cv=none;
        d=google.com; s=arc-20160816;
        b=btI1pF0Ps3Er8eJ279OclbNgwf89iRwRIzXJa5se0RRXIW6z3+pV9pSF8lOqT0Q7fq
         XHkGdR35qunGAtAeQekICNurf3jlpru4VukwaynOaBCClKeVgGkt+ndAPyrv0Wrw65Gl
         auaaVZhJhy4DyKs3jZ4oe9Ix08sfRbX8Vo+xaYSXCt85/qXPRMB+W9qJAxewJR7VeJO5
         4tLTIjWF3glIIue0oT1rohCpb8RI0WTTT5awrutrBACojIj/1AKGhDnJg+RKgh1xC3fe
         frU45iMEodD3UlmWVeHPkkH83DnAzv68yckh5jBGxecrjKjA5wcvhRDCKEriF9SS0vKM
         bTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N0W6NjHy1O3beFA83G2xH6CBA5TI/HWbpIhKHp3KIHk=;
        fh=foHo6r+EcinX0k4ND6mhMl3xelUB0z9R4IF86SBytx0=;
        b=YJnwmHF+evvASh9pnIvTpFGPDejPWCwUvSOMHsQYGHfe0XzX6lxW9gJ8cGRz0kyOmf
         9ZUC3sy7ziTTSioUk3N2PL0ym1TcbogP/VZujkj/ZB9PRcOxegq65E7mSjByQAR3bKyc
         qlzI3tynd1UohwOu1Jy7XBdLDiu3u3Bc+nkyZK5nBob3UdFoeowYu695fMVDcc8Jv4jf
         9GJ9OarEEzaChurc9vDElP4VVC/x+WbyOVO6NhvJG/Fag2Fe5dfvWLObZk93zroKfy4V
         4ZI2R5pR1INl9yiVpaRoMlSoVmAIo3lHr0fdYdFAC9SUcXWPY2B3nSlKSmmHHPQiuge8
         aRZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cw1SFV5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dx4-20020a05600c63c400b0041285e43489si5297843wmb.232.2024.02.27.09.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 09:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cw1SFV5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rf15K-0004Ck-Ac; Tue, 27 Feb 2024 12:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rf15I-0004C8-56
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 12:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rf15F-0000JI-VW
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 12:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709054256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0W6NjHy1O3beFA83G2xH6CBA5TI/HWbpIhKHp3KIHk=;
 b=Cw1SFV5ZXg7hzS9Jklwj+mbXo/Knkadd2re3eqBRcuyT7eCNK2xYf/MH8scG+ac3SHi+Db
 qAAy6Xgi+keGT1NaNWH4y8GT/vYGJ+Pz8My7w7y0HIgGeJ6U8Dd0Xsmpqq4DCwSSMrrNvX
 l78IZbpThbH62gx/hfTLPGYrsZW83mc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-U3tYhaa0OdqTrZb2R1mUbg-1; Tue, 27 Feb 2024 12:17:34 -0500
X-MC-Unique: U3tYhaa0OdqTrZb2R1mUbg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42e91be9aaaso19591571cf.0
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 09:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709054253; x=1709659053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0W6NjHy1O3beFA83G2xH6CBA5TI/HWbpIhKHp3KIHk=;
 b=Q75FmY6NHbeam747q7JI3+CQM7Q+xOzW/vJpuMczfFBw7oE5PJbNPm2PDj5F5JT3Nf
 4glTIhMWsi594tlpC4afC4Op77ze1RBn/sDjARe6YrkaiGAMWyQ6lhIHnFKL48FBguVF
 47O61LJA6hnNT5acr8fX0TmecfhYCD9pplJa4TjVBx7ln7b/m4W2fhoaBY7K6BLS//jH
 Eqm1bYknFm+4dbfK7gZYlnhSu5BZTNCEFHTJlXdBDrHeMOMHu6G1p2pbebrkcloGXUJK
 8+YdONcYKq/0ROpkUw2wSJuNnR5FkGdRYMOqHIYYjw7YHZ8UcCdV9u9OAc+jllMfgAMk
 X9xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcSoIxMWniK0NXt+u7G1JJGJyUj9qT/H9a0vQgo/WEitFF82Xr1O4AGXBC1BCNzQZvU7nfZBINaAdBuPaUulqxbZd6
X-Gm-Message-State: AOJu0YxTD36Hg15nyNYs90ecXbbXnl1ZJXj5lfKPmgZSRzuUxI9laHKF
 in8/PCFrykGBOxjsdrLXgZkUCkXTFOvi+WrG/ICngv9TB+A9+G10o3ZPu3My7AkeTsf8XBNGsmi
 JWP7w90KT4O5TuHpWjdEF4sipBYlTLoQgahU+hwFoRP8lTCPLxw==
X-Received: by 2002:a05:622a:113:b0:42d:feeb:64df with SMTP id
 u19-20020a05622a011300b0042dfeeb64dfmr11952238qtw.36.1709054252761; 
 Tue, 27 Feb 2024 09:17:32 -0800 (PST)
X-Received: by 2002:a05:622a:113:b0:42d:feeb:64df with SMTP id
 u19-20020a05622a011300b0042dfeeb64dfmr11952200qtw.36.1709054252402; 
 Tue, 27 Feb 2024 09:17:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 fp7-20020a05622a508700b0042e6d2dd6bbsm3711686qtb.11.2024.02.27.09.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 09:17:31 -0800 (PST)
Message-ID: <2259fba1-4c57-420b-bcab-ecf202d10819@redhat.com>
Date: Tue, 27 Feb 2024 18:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] hw: Set virtio-iommu aw-bits default value on
 pc_q35 and arm virt
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 mst@redhat.com, peter.maydell@linaro.org, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com
References: <20240215084315.863897-1-eric.auger@redhat.com>
 <20240215084315.863897-4-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240215084315.863897-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: u8Qsz7KT6wFu

Hello Eric,

On 2/15/24 09:42, Eric Auger wrote:
> Currently the default input range can extend to 64 bits. On x86,
> when the virtio-iommu protects vfio devices, the physical iommu
> may support only 39 bits. Let's set the default to 39, as done
> for the intel-iommu. On ARM we set 48b as a default (matching
> SMMUv3 SMMU_IDR5.VAX == 0).
> 
> We use hw_compat_8_2 to handle the compatibility for machines
> before 9.0 which used to have a virtio-iommu default input range
> of 64 bits.
> 
> Of course if aw-bits is set from the command line, the default
> is overriden.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Tested-by: Yanghang Liu<yanghliu@redhat.com>

We need a property fixup for pseries also:

$ build/ppc64-softmmu/qemu-system-ppc64 -M pseries  -device virtio-iommu-pci,addr=04.0
qemu-system-ppc64: -device virtio-iommu-pci,addr=04.0: aw-bits must be within [32,64]


Thanks,

C.



> ---
> 
> v3 -> v4:
> - update the qos test to relax the check on the max input IOVA
> 
> v2 -> v3:
> - collected Zhenzhong's R-b
> - use &error_abort instead of NULL error handle
>    on object_property_get_uint() call (Cédric)
> - use VTD_HOST_AW_39BIT (Cédric)
> 
> v1 -> v2:
> - set aw-bits to 48b on ARM
> - use hw_compat_8_2 to handle the compat for older machines
>    which used 64b as a default
> ---
>   hw/arm/virt.c                   | 6 ++++++
>   hw/core/machine.c               | 5 ++++-
>   hw/i386/pc.c                    | 6 ++++++
>   hw/virtio/virtio-iommu.c        | 2 +-
>   tests/qtest/virtio-iommu-test.c | 2 +-
>   5 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 368c2a415a..0994f2a560 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2716,10 +2716,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
> +                                                   "aw-bits", &error_abort);
>           hwaddr db_start = 0, db_end = 0;
>           QList *reserved_regions;
>           char *resv_prop_str;
>   
> +        if (!aw_bits) {
> +            qdev_prop_set_uint8(dev, "aw-bits", 48);
> +        }
> +
>           if (vms->iommu != VIRT_IOMMU_NONE) {
>               error_setg(errp, "virt machine does not support multiple IOMMUs");
>               return;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index fb5afdcae4..70ac96954c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -30,9 +30,12 @@
>   #include "exec/confidential-guest-support.h"
>   #include "hw/virtio/virtio-pci.h"
>   #include "hw/virtio/virtio-net.h"
> +#include "hw/virtio/virtio-iommu.h"
>   #include "audio/audio.h"
>   
> -GlobalProperty hw_compat_8_2[] = {};
> +GlobalProperty hw_compat_8_2[] = {
> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
> +};
>   const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>   
>   GlobalProperty hw_compat_8_1[] = {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 196827531a..ee2d379c90 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1456,6 +1456,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
> +                                                   "aw-bits", &error_abort);
>           /* Declare the APIC range as the reserved MSI region */
>           char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
>                                                 VIRTIO_IOMMU_RESV_MEM_T_MSI);
> @@ -1464,6 +1466,10 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>           qlist_append_str(reserved_regions, resv_prop_str);
>           qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>   
> +        if (!aw_bits) {
> +            qdev_prop_set_uint8(dev, "aw-bits", VTD_HOST_AW_39BIT);
> +        }
> +
>           g_free(resv_prop_str);
>       }
>   
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 8b541de850..2ec5ef3cd1 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1526,7 +1526,7 @@ static Property virtio_iommu_properties[] = {
>       DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>                        TYPE_PCI_BUS, PCIBus *),
>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> -    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
> index 068e7a9e6c..0f36381acb 100644
> --- a/tests/qtest/virtio-iommu-test.c
> +++ b/tests/qtest/virtio-iommu-test.c
> @@ -34,7 +34,7 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>       uint8_t bypass = qvirtio_config_readb(dev, 36);
>   
>       g_assert_cmpint(input_range_start, ==, 0);
> -    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
> +    g_assert_cmphex(input_range_end, >=, 32);
>       g_assert_cmpint(domain_range_start, ==, 0);
>       g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
>       g_assert_cmpint(bypass, ==, 1);

