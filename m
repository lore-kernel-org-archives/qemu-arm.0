Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp264686eja;
        Thu, 29 Feb 2024 01:20:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKA5cDFBB8vIILacDgkExFRXZdft9xlPPF9J9kH0VK0iMfbE4DuRoG02u3z3C62Fr982s5fCYTdKM0cbt+jMUIhboIFhJc
X-Google-Smtp-Source: AGHT+IHrFIgG3t0EM0ZbnTXtnRdo1XSYC0vREnB38aBRJNFuVXeh23lU+9id3ByZ9I3xCV2B9LXT
X-Received: by 2002:a05:620a:450c:b0:787:2009:600b with SMTP id t12-20020a05620a450c00b007872009600bmr1688341qkp.47.1709198442132;
        Thu, 29 Feb 2024 01:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709198442; cv=none;
        d=google.com; s=arc-20160816;
        b=OrPEnk1KPVcXL1Z+VfITF5+9U0axuFyCbuIpws+JXlg/TFMo2cX49fsuwksiFt0h37
         WZtaB01QAYc3gJLvEgFrjmcF6lQgFK9PBPml9GFbc8zK9D/6o8HSigUqQWmAJ3h8nSB5
         2qDfHJ+g73ZNOLOksJPg0EZbDy+mWEwVy45jqiiVL7jzvDzSxLIfQoyEO1KgHBHIT1ZU
         dt5Z+se3cowTGqcZ99gA0PXF4ReCJRTgcuHucPgC5o69aFqSEEz3+qsCeWTrKAvkS/ms
         zJWH0bq0A4n9irlzNnklAi9f7jSYO/9d0hR05IpzFW9jnPFwxGM12Ly/QryUz9CoO9st
         puVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=td0KONZYuF0qWHoQ/7T2k6xoWLXLjU4vIqKwf990Crc=;
        fh=5F/+pIssOmmXktgGuQoWRQ5MxuPxDTNy4+L1CfIe2Zs=;
        b=ajtN8/kG0cYhy+wN+hoqVv3+3xU8cQOQMPHXKeXZlBQhNhD5jlwEt7/q+/jWRTE5LG
         r4Y8CiHqZzUq+CYm4p9KcO1VE0OuSmCJWvy4T/GIIiLXJ4MYF6WhHvD3BdG/O8IZ4VJE
         Imz+BdZ7LRn847ces2bjUjhJP4LQXYvhFZz3Bt7hWbe/qRWzp5B3yo4FAZk6qTBNGIVH
         MMNHImZOIgBRMDRE0wq9v6KkbYStOTqaw0vhtkFNMp51dD4BxrjTRpkD2kJxo0TKLJb0
         4SBeVJ1ECE37lQ015RVR0xI53Hixh/yW30MJRQttiWUXGOx79uozNuBMFinG+uZ1DDvd
         Ls+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=egqd7nQo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a05620a118200b00787f48bdeebsi971848qkk.389.2024.02.29.01.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 01:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=egqd7nQo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfcae-0005wX-G4; Thu, 29 Feb 2024 04:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rfcac-0005tV-LI
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 04:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rfcaU-0000bJ-TP
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 04:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709198421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=td0KONZYuF0qWHoQ/7T2k6xoWLXLjU4vIqKwf990Crc=;
 b=egqd7nQophRziEN0xHBlrRaiw4zN1Eu4B3BWZb0M9u02LJUDcY3/QGDcP2q0fsfJ98aJPN
 EuWcK+YKGOt0IzvsuljB9/ToTEsva2t844oFxR6sTLKf/9rryVTtqU0meW4s9MZlh1ejXG
 2RSLVIE3e1b2fPF2NjX5CVCb4f5TEbA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-0-rE71qXPwij9i9GqCawYQ-1; Thu, 29 Feb 2024 04:20:17 -0500
X-MC-Unique: 0-rE71qXPwij9i9GqCawYQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33d0d313b81so361294f8f.3
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 01:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709198416; x=1709803216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epd5r8Aht0KH2PY0VvBXXlACH0mc8Tf1TL/ueYBMHWI=;
 b=X7kaHURHLAr5gdIGgL2BaIhQauLVjKSjuOGgFXBERJryenrD2jE606nM0XVnoQWSCK
 /QBDZOrFOyjpS/hW679t/9w0TRP3+vZYlS3JV2xHSp2M2phnKhqbX7vFhuhkDjHX3ArN
 2Dwgd7HSjUB09R/SR4EFlb5p2SLxsnA6vaopq5f6Plp11iMzMLYLQelU66MnVGPvLef3
 moHRy9vQwV+WufMl077A5T39vdCtwS6WG60Y26a6GdYJNH2JzbPUZGPLtsSBYZORVHnM
 GlTHob9OYyrU5//P2Lw2HogJJY4WUQTGsGonVjasPZgBz4UW2ogFfhjo0KMpddb3KF18
 2Ckg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpDKoek2mgO6k+BtaJAmVlK9DcbhdLBo1Cujl3SdDPdGpeOTJ8XR3ZrPHOjDh+0tJbYtfB4EDjunhenhHEvVi5Swrf
X-Gm-Message-State: AOJu0YwV2CNXZgwtHDOvuzlJaK6OsK5otkZJf7PpECYrwGEpz99Aq71c
 lEQJkyNoOvrhAfrcrdHFerWamJcE3KmJ0DljdovMaM5uuD4Dl368dOIWcSBXKEV2V8bQjJaUXdV
 5vCtwzYFGA1hVJWQYT6dnj9gWQkn08bVSbRoubIk0eQacHGo4tg==
X-Received: by 2002:adf:e507:0:b0:33d:a43d:75e8 with SMTP id
 j7-20020adfe507000000b0033da43d75e8mr1123383wrm.2.1709198416723; 
 Thu, 29 Feb 2024 01:20:16 -0800 (PST)
X-Received: by 2002:adf:e507:0:b0:33d:a43d:75e8 with SMTP id
 j7-20020adfe507000000b0033da43d75e8mr1123353wrm.2.1709198416300; 
 Thu, 29 Feb 2024 01:20:16 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q16-20020a5d6590000000b0033d56aa4f45sm1197575wru.112.2024.02.29.01.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 01:20:15 -0800 (PST)
Date: Thu, 29 Feb 2024 10:20:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, mst@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, zhenzhong.duan@intel.com, yanghliu@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH v5 3/4] hw: Set virtio-iommu aw-bits default value on
 pc_q35 and arm virt
Message-ID: <20240229102014.6c5e9f74@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240215084315.863897-4-eric.auger@redhat.com>
References: <20240215084315.863897-1-eric.auger@redhat.com>
 <20240215084315.863897-4-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Z64s86qvGnQN

On Thu, 15 Feb 2024 09:42:13 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Currently the default input range can extend to 64 bits. On x86,
> when the virtio-iommu protects vfio devices, the physical iommu
> may support only 39 bits. Let's set the default to 39, as done
> for the intel-iommu. On ARM we set 48b as a default (matching
> SMMUv3 SMMU_IDR5.VAX =3D=3D 0).
>=20
> We use hw_compat_8_2 to handle the compatibility for machines
> before 9.0 which used to have a virtio-iommu default input range
> of 64 bits.

so we have different defaults per target/machine
while open codding fixup in _pre_plug_ works it's
a bit unexpected place to manage defaults and
avoid adding 0 magic.

How about using compat machinery instead to set
machine dependent defaults:
For example:

pc_i440fx_machine_options(MachineClass *m)
{
...
+    compat_props_add(m->compat_props, pc_compat_defaults,pc_compat_default=
s_len);
 }

> Of course if aw-bits is set from the command line, the default
> is overriden.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Tested-by: Yanghang Liu<yanghliu@redhat.com>
>=20
> ---
>=20
> v3 -> v4:
> - update the qos test to relax the check on the max input IOVA
>=20
> v2 -> v3:
> - collected Zhenzhong's R-b
> - use &error_abort instead of NULL error handle
>   on object_property_get_uint() call (C=C3=A9dric)
> - use VTD_HOST_AW_39BIT (C=C3=A9dric)
>=20
> v1 -> v2:
> - set aw-bits to 48b on ARM
> - use hw_compat_8_2 to handle the compat for older machines
>   which used 64b as a default
> ---
>  hw/arm/virt.c                   | 6 ++++++
>  hw/core/machine.c               | 5 ++++-
>  hw/i386/pc.c                    | 6 ++++++
>  hw/virtio/virtio-iommu.c        | 2 +-
>  tests/qtest/virtio-iommu-test.c | 2 +-
>  5 files changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 368c2a415a..0994f2a560 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2716,10 +2716,16 @@ static void virt_machine_device_pre_plug_cb(Hotpl=
ugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>          virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),=
 errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) =
{
> +        uint8_t aw_bits =3D object_property_get_uint(OBJECT(dev),
> +                                                   "aw-bits", &error_abo=
rt);
>          hwaddr db_start =3D 0, db_end =3D 0;
>          QList *reserved_regions;
>          char *resv_prop_str;
> =20
> +        if (!aw_bits) {
> +            qdev_prop_set_uint8(dev, "aw-bits", 48);

s/48/macro name/?

> +        }
>
>
>          if (vms->iommu !=3D VIRT_IOMMU_NONE) {
>              error_setg(errp, "virt machine does not support multiple IOM=
MUs");
>              return;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index fb5afdcae4..70ac96954c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -30,9 +30,12 @@
>  #include "exec/confidential-guest-support.h"
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "audio/audio.h"
> =20
> -GlobalProperty hw_compat_8_2[] =3D {};
> +GlobalProperty hw_compat_8_2[] =3D {
> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
> +};
>  const size_t hw_compat_8_2_len =3D G_N_ELEMENTS(hw_compat_8_2);
> =20
>  GlobalProperty hw_compat_8_1[] =3D {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 196827531a..ee2d379c90 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1456,6 +1456,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHa=
ndler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>          virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),=
 errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) =
{
> +        uint8_t aw_bits =3D object_property_get_uint(OBJECT(dev),
> +                                                   "aw-bits", &error_abo=
rt);
>          /* Declare the APIC range as the reserved MSI region */
>          char *resv_prop_str =3D g_strdup_printf("0xfee00000:0xfeefffff:%=
d",
>                                                VIRTIO_IOMMU_RESV_MEM_T_MS=
I);
> @@ -1464,6 +1466,10 @@ static void pc_machine_device_pre_plug_cb(HotplugH=
andler *hotplug_dev,
>          qlist_append_str(reserved_regions, resv_prop_str);
>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
> =20
> +        if (!aw_bits) {
> +            qdev_prop_set_uint8(dev, "aw-bits", VTD_HOST_AW_39BIT);
> +        }
> +
>          g_free(resv_prop_str);
>      }
> =20
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 8b541de850..2ec5ef3cd1 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1526,7 +1526,7 @@ static Property virtio_iommu_properties[] =3D {
>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>                       TYPE_PCI_BUS, PCIBus *),
>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> -    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
I'd set some valid value here (obviously not universal) and skip
default property setting for that machine/target
For example pick x86 one.

>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-t=
est.c
> index 068e7a9e6c..0f36381acb 100644
> --- a/tests/qtest/virtio-iommu-test.c
> +++ b/tests/qtest/virtio-iommu-test.c
> @@ -34,7 +34,7 @@ static void pci_config(void *obj, void *data, QGuestAll=
ocator *t_alloc)
>      uint8_t bypass =3D qvirtio_config_readb(dev, 36);
> =20
>      g_assert_cmpint(input_range_start, =3D=3D, 0);
> -    g_assert_cmphex(input_range_end, =3D=3D, UINT64_MAX);
> +    g_assert_cmphex(input_range_end, >=3D, 32);
>      g_assert_cmpint(domain_range_start, =3D=3D, 0);
>      g_assert_cmpint(domain_range_end, =3D=3D, UINT32_MAX);
>      g_assert_cmpint(bypass, =3D=3D, 1);

