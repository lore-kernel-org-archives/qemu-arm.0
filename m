Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2816913ejy;
        Wed, 21 Sep 2022 18:51:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oh2xVDNS6XVhvJ1jBaNzmv40jnpBpI0Ma6B91v4zeXWq3T1C0+Y0f7imXilUYCABWWyk1
X-Received: by 2002:ad4:5c63:0:b0:4a8:a722:3296 with SMTP id i3-20020ad45c63000000b004a8a7223296mr749176qvh.23.1663811473497;
        Wed, 21 Sep 2022 18:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663811473; cv=none;
        d=google.com; s=arc-20160816;
        b=Va7OdBwEM0oDDGJMzkL+39Ybz+fROrud6Q7sJ6TRORkW5ExGf0S5NuwJh0DabimHxf
         EAdo1NlIvDSHnp4jGtSKt1jMXxm6UNhwiCH/kJ2a1cWDsmlyH3b8Y504PqhBLbiZ2EZk
         qah82YzmqYtE2btJTYJpwZbAlxKrpG9d3w6CVbBmznycK7my71TFsTiWi5tJemVaJual
         e4AB0tLRuhCw2HHzChfcsggh26XeH/OgjBkcs3T4xSnrKDCB5Qs82UBHyUv4Jy3e6ewI
         vnb1M2+9jyC0i352NiMPSeoSwOGW4Gd5wXtWXWrsFTGj+Lor0Zid3qI9dbpHYJ+MwT0E
         ZNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1um9klPdk3CcEerjvvH7WZmMwhJGzjlCdLbZamzUYtg=;
        b=lwpPrwse/d19lHJ8kv7sfwQ9OQAwN4otPOLGWRxK+y854q2nZmOMf8yiNVIu/LUdtQ
         OiBSFF440FOZnH6uhi4yjTHLVmIZylBf/bIE2pZ6jIV2OSjVhGSe3jzodpTFkrLA8b2Y
         WUF4sEcqVhSBUNUUiLUi+r5Yrhgx9he+ChBeJRYBW0fX3IbXdhXjpvFiL0DlbP5nKXJ8
         543VaquqvzTp3Ic3pwTmdEgCI1NnPDD4LHQuphavv1w+/YAZ6NTaib60259cb9h1A6/q
         fpKUnxsIgxW/enaHe/Nk3/gv32GPvqCTs/DpLDb9e+sYXyKjff0rt3/6+htbtdzsA9Wq
         oObQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gluBDb6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a05620a298b00b006c9ab327674si3081733qkp.508.2022.09.21.18.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 18:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gluBDb6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obBMu-00012u-ND
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 21:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1obBMi-00012c-KR
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 21:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1obBMe-0003Rb-Jb
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 21:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663811444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1um9klPdk3CcEerjvvH7WZmMwhJGzjlCdLbZamzUYtg=;
 b=gluBDb6Q/np9+/IUhibXIaXqgjrgmvYZo6XK3JhcW/qjuv2Y1EDfS2RPlqv6xeBSY5ubdu
 VCwZyplUkIdpaVvGRClHZh0lX0AldTzZjHH1tkSRuF5dlHpFHZRDF6AaTdUorfrUnfXkup
 Xuq7eCTQlPsts/GfYaZC3cOK02p3wwk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-KK4d9u8MODa7prjUu4Qbgg-1; Wed, 21 Sep 2022 21:50:43 -0400
X-MC-Unique: KK4d9u8MODa7prjUu4Qbgg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sg44-20020a170907a42c00b007822e506a4fso1057210ejc.16
 for <qemu-arm@nongnu.org>; Wed, 21 Sep 2022 18:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1um9klPdk3CcEerjvvH7WZmMwhJGzjlCdLbZamzUYtg=;
 b=fKktCZDxbuYu1CZ5DsuERloZGNf/Z8REHtfCRGLOjj95SrUocg01WbwoR1hEY/skEm
 E9ZL7t1odd/joxwBVymnRjoylR1TnP+vhBp7WvIIk+aW9nkvsY9cz9vWwK43t45bVkn/
 BKr2DYVBWHRi/++cUMBfeXqWEQf1qbfYSdF2Q+lnFyBSKvbmG02V7qY3AebXxQIBq16n
 P5C1oCdztMJWTHbHdvkJIRorc1EjVRfY+hZWEKApWnqLoHakC1BWiOKSIsFz89IY4j6L
 OrFxJ90zJ5i060EX2LpSx4eMbi4/xTekTDn5y8WWhX1WssEdgPG5durD7XFI812QauwF
 Mcag==
X-Gm-Message-State: ACrzQf31JnleSLre/kGd35A2gtwrnkGJbtJso6SKNyBR8jmLcxqmchJ5
 35Arn8oS6yijBklb1mRh7cVHtAV0XfXn2OvmvhyK61ybeB9+flQbvSpdY9YGPxQ4gQBhCO6Cv88
 EeU09R4d0YYDcVeqK0tGVXn/I8qPe
X-Received: by 2002:a17:906:fd8b:b0:779:dcbe:3a9d with SMTP id
 xa11-20020a170906fd8b00b00779dcbe3a9dmr867341ejb.235.1663811440940; 
 Wed, 21 Sep 2022 18:50:40 -0700 (PDT)
X-Received: by 2002:a17:906:fd8b:b0:779:dcbe:3a9d with SMTP id
 xa11-20020a170906fd8b00b00779dcbe3a9dmr867330ejb.235.1663811440670; Wed, 21
 Sep 2022 18:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220921231349.274049-1-gshan@redhat.com>
In-Reply-To: <20220921231349.274049-1-gshan@redhat.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Thu, 22 Sep 2022 09:50:04 +0800
Message-ID: <CAJFLiBKDY8TRRXMkoUcA0nT0MTb2K_U24iTUQm0AExczuCXtnw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 eric.auger@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 peter.maydell@linaro.org, shan.gavin@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fdtdsJTD0zxA

[PATCH v3 0/5] hw/arm/virt: Improve address assignment for high memory regions
Author: Gavin Shan <gshan@redhat.com>
Date:   Thu Sep 22 07:13:45 2022 +0800

    PATCH[1-3] preparatory work for the improvment
    PATCH[4]   improve high memory region address assignment
    PATCH[5]   adds 'highmem-compact' to enable or disable the optimization

    Signed-off-by: Gavin Shan <gshan@redhat.com>

The patchs works well on "IPA Size Limit: 40" FUJITSU machine.
I added some debug code to show high memory region address.
The test results are as expected.

1. virt-7.2 default
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.2 -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_MMIO] enabled, highest_gpa=0xffffffffff

2. When virt-7.2,highmem-compact=off
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.2,highmem-compact=off -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x8003ffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x801fffffff    [no] [yes]
[HIGH_PCIE_MMIO]: disabled, highest_gpa=0x801fffffff    [no] [no]

3. virt-7.1 default
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.1 -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x8003ffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x801fffffff    [no] [yes]
[HIGH_PCIE_MMIO]: disabled, highest_gpa=0x801fffffff    [no] [no]

2. When virt-7.1,highmem-compact=on
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.1,highmem-compact=on -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_MMIO] enabled, highest_gpa=0xffffffffff


Tested-by: Zhenyu Zhang<zhenyzha@redhat.com>

On Thu, Sep 22, 2022 at 7:13 AM Gavin Shan <gshan@redhat.com> wrote:
>
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> The series intends to improve the address assignment for these
> high memory regions.
>
> PATCH[1-3] preparatory work for the improvment
> PATCH[4]   improve high memory region address assignment
> PATCH[5]   adds 'highmem-compact' to enable or disable the optimization
>
> History
> =======
> v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>
> Changelog
> ==========
> v3:
>   * Reorder the patches                                        (Gavin)
>   * Add 'highmem-compact' property for backwards compatibility (Eric)
> v2:
>   * Split the patches for easier review                        (Gavin)
>   * Improved changelog                                         (Marc)
>   * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
>
> Gavin Shan (5):
>   hw/arm/virt: Introduce virt_set_high_memmap() helper
>   hw/arm/virt: Rename variable size to region_size in
>     virt_set_high_memmap()
>   hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
>   hw/arm/virt: Improve high memory region address assignment
>   hw/arm/virt: Add 'highmem-compact' property
>
>  docs/system/arm/virt.rst |   4 ++
>  hw/arm/virt.c            | 116 ++++++++++++++++++++++++++++-----------
>  include/hw/arm/virt.h    |   2 +
>  3 files changed, 89 insertions(+), 33 deletions(-)
>
> --
> 2.23.0
>

