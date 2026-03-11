Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F41C1125811
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 17:43:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0Nar-0002lq-E6; Wed, 11 Mar 2026 13:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0Nam-0002l7-GZ
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0Nak-0004Ct-Rd
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773251010;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0oLq2UGgSltExvyCfrZucZhsiIZB4Cqya7gV46+59w=;
 b=BTA9fmSEUZJyPEb2+21f+T+Q6nXUimUgafcrIBkWg40SOtdzVS6MxkDfusDkd52CkGE3U9
 DYouZBVnpg6MGKnwvBoKe23/qbLIsKM0UtS+vs1UwJVZ8roYGK3aRWC3izAivUmpcwhc2p
 OlDxdbQ5I4FVBx9okuEDFBH0/2FQri0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-GowUo0gvPkykMA2iHbojQg-1; Wed, 11 Mar 2026 13:43:29 -0400
X-MC-Unique: GowUo0gvPkykMA2iHbojQg-1
X-Mimecast-MFC-AGG-ID: GowUo0gvPkykMA2iHbojQg_1773251008
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439c54e0f6aso139044f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 10:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773251008; x=1773855808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0oLq2UGgSltExvyCfrZucZhsiIZB4Cqya7gV46+59w=;
 b=rAh6glA7cBtfzCRYb2OHoPf3zXkqT6p3SUgtiyPNLrHEtYY1BrwKtwkBh5Xl5bIPuH
 rxbf5lqFFf+rWJ+E9IygNVipP+O7d9EJsXYMfhnCRO3eO78tlyf3bIWJNqshwo71wGTn
 YhHgjuJwQsD5+ke5o5DIoVQ+u4kmEr6XXImgozb+2SDdH72fucdCmBNT9UIJ/D90CWlo
 xoimJTHMTwG4VxQb1eOydZwAQVvQEpZST+ryF2TrVVIrc36FXr8L6cLh67jnK4am9yzb
 D3fXEHQaBiHaSya8zf4vLIFLc2fi0dtmfXu/D2ir1n/GGtNpahWahY+m8Ip++7DZJj4y
 QyGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNeZZmTzhlLyWdT9tfUANaLMlGZ2iZebCb065Y1wQts5NtrfeQVNOxy0ftkHG2QPDtWkxzE0FNDw==@nongnu.org
X-Gm-Message-State: AOJu0Yym7j1xOoCfjDgUNvV8I+rs8ei960+FLvmfoz6ydWTrwJWGCEy9
 fYaOubQbNyKu2pLN1EhrsSeQ/3XIKoOCQFKM8/sJUnMgU6Y6p/PbBVOXioJ4IiK2f+mwYZAfTmL
 BLJdIAJGb9vXKpeYNcn9nAYNpIvu6Kv7cPM5fiDKNMHJZrfCGn7lgEw==
X-Gm-Gg: ATEYQzwOLlsxz8aPXKXbdCBysSrx6bVVRw2b9aGLfkUkX+uIsj1hLINnah107UpE7Oz
 jOtfW7dAjM2XH5/dn9Y/K9vIGP0Er2eNO1IEzRLHTLN/jaRgsVMJIn0MioSRiaLwZZIlgYXpgUG
 Eo4tJgHzg7asd6N6lfPusuM3DDG3kXBCkURrd/jcHBme1mPXpMIPfMTlZcjm1DAQ35iI4+ntAri
 WD01evM1OuKaNBj+I4xnLKwlJyg/vbGxGOPtgh28l+4os2afKlmfRi4vUuyQFVDJ+jWPg7IrW4y
 wVJWun5w32aap2FMtM9PJWCn9OLcc/Uy3nzWYLPb6X6gsm3ghoZW1QauytFa9LeO5oukuvRTiRv
 whLiOQxkpboiwqWAs/yri4tbjSYimvUJPKsTqCkB9cNMYwmyjYPNcmsGoObd8JNZ0kW8T6A==
X-Received: by 2002:a05:6000:400b:b0:439:ceca:421a with SMTP id
 ffacd0b85a97d-439fe096f3bmr930276f8f.9.1773251007742; 
 Wed, 11 Mar 2026 10:43:27 -0700 (PDT)
X-Received: by 2002:a05:6000:400b:b0:439:ceca:421a with SMTP id
 ffacd0b85a97d-439fe096f3bmr930221f8f.9.1773251007249; 
 Wed, 11 Mar 2026 10:43:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe20c0b4sm891303f8f.25.2026.03.11.10.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 10:43:26 -0700 (PDT)
Message-ID: <a9c03e3c-448e-480a-a6dd-b3c4c7903758@redhat.com>
Date: Wed, 11 Mar 2026 18:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] hw/arm/smmuv3-accel: Support AUTO properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260309192119.870186-1-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zRtBAl-l4J5nJzofOj53v5pHdd0T7djv9n9XmyVs3M8_1773251008
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/9/26 8:21 PM, Nathan Chen wrote:
> Hi,
>
> This series introduces support for specifying 'auto' for arm-smmuv3
> accelerated mode's ATS, RIL, SSIDSIZE, and OAS feature properties.
> When set to 'auto', these feature values are derived directly from
> host IOMMU capabilities, avoiding the need for management layers to
> introspect host settings.
>
> Accelerated SMMUv3 Address Translation Services support is derived
> from IDR0, Range Invalidation support is derived from IDR3, Substream
> ID size is derived from IDR1, and output address space is derived from
> IDR5.
>
> Additionally, an OnOffAuto "ats" property is added for vfio-pci devices,
> where setting 'auto' detects the per-device presence of
> IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED from the kernel, and the ATS cap can
> be advertised or hidden by setting 'on' or 'off'. This is dependent
> on Shameer's recent kernel series for reporting effective ATS support
> status [0].
>
> The default values are set to 'auto' for all properties.
>
> A complete branch can be found here:
> https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto

I have just noticed we are missing documentation for smmuv3 accel options in

qemu-options.hx

At the moment we just have:

``-device arm-smmuv3,primary-bus=id``
    This is only supported by ``-machine virt`` (ARM).

    ``primary-bus=id``
        Accepts either the default root complex (pcie.0) or a
        pxb-pcie based root complex.

Eric 
>
> Please take a look and let me know your feedback.
>
> Thanks,
> Nathan
>
> Example usage:
> qemu-system-aarch64 \
>   -object iommufd,id=iommufd0 \
>   -machine virt,accel=kvm,gic-version=3,ras=on,highmem-mmio-size=4T \
>   -cpu host -smp cpus=4 -m size=16G -nographic \
>   -object memory-backend-ram,size=16G,id=m0 \
>   -numa node,memdev=m0,cpus=0-3,nodeid=0 \
>   -numa node,nodeid=1 -numa node,nodeid=2 -numa node,nodeid=3 -numa node,nodeid=4 \
>   -numa node,nodeid=5 -numa node,nodeid=6 -numa node,nodeid=7 -numa node,nodeid=8 \
>   -device pxb-pcie,id=pcie.1,bus_nr=1,bus=pcie.0,numa_node=0 \
>   -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1,accel=on,ats=auto,ssidsize=auto,ril=auto,oas=auto \
>   -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1,io-reserve=0 \
>   -device vfio-pci-nohotplug,host=0009:06:00.0,bus=pcie.port1,rombar=0,id=dev0,iommufd=iommufd0,ats=auto \
>   -object acpi-generic-initiator,id=gi0,pci-dev=dev0,node=1 \
>   -object acpi-generic-initiator,id=gi1,pci-dev=dev0,node=2 \
>   -object acpi-generic-initiator,id=gi2,pci-dev=dev0,node=3 \
>   -object acpi-generic-initiator,id=gi3,pci-dev=dev0,node=4 \
>   -object acpi-generic-initiator,id=gi4,pci-dev=dev0,node=5 \
>   -object acpi-generic-initiator,id=gi5,pci-dev=dev0,node=6 \
>   -object acpi-generic-initiator,id=gi6,pci-dev=dev0,node=7 \
>   -object acpi-generic-initiator,id=gi7,pci-dev=dev0,node=8 \
>   -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>   -device nvme,drive=nvme0,serial=deadbeaf1,bus=pcie.0 \
>   -drive file=/var/lib/libvirt/images/guest.qcow2,index=0,media=disk,format=qcow2,if=none,id=nvme0 \
>   -device e1000,romfile=/usr/local/share/qemu/efi-e1000.rom,netdev=net0,bus=pcie.0 \
>   -netdev user,id=net0,hostfwd=tcp::5558-:22,hostfwd=tcp::5586-:5586
>
> The properties may also be omitted as they are set to auto by default:
>
>   -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1,accel=on \
>   -device vfio-pci-nohotplug,host=0009:06:00.0,bus=pcie.port1,rombar=0,id=dev0,iommufd=iommufd0 \
>
> Testing:
> Basic sanity testing was performed on an NVIDIA Grace platform with GPU
> device assignment and running CUDA test apps on the guest. Observed the
> feature properties being set based on host IOMMU capabilities and the
> ATS capability for a vfio-pci device reported based on what was reported
> from the host. Additional testing and feedback are welcome.
>
> [0] https://lore.kernel.org/all/20260303150348.233997-1-skolothumtho@nvidia.com/#r
>
> Nathan Chen (8):
>   hw/arm/smmuv3-accel: Add helper for resolving auto parameters
>   hw/arm/smmuv3-accel: Introduce _AUTO support for ATS
>   vfio/pci: Add ats property and mask ATS cap when not exposed
>   hw/arm/smmuv3-accel: Introduce _AUTO support for RIL
>   qdev: Add a SsidSizeMode property
>   hw/arm/smmuv3-accel: Introduce _AUTO support for SSID size
>   qdev: Add an OasMode property
>   hw/arm/smmuv3-accel: Introduce _AUTO support for OAS
>
>  backends/iommufd.c                       |  15 +++
>  hw/arm/smmuv3-accel.c                    | 118 ++++++++++++++++++++---
>  hw/arm/smmuv3-accel.h                    |   2 +
>  hw/arm/smmuv3.c                          |  43 +++++----
>  hw/arm/virt-acpi-build.c                 |   2 +-
>  hw/core/qdev-properties-system.c         |  27 ++++++
>  hw/vfio/pci.c                            |  63 ++++++++++++
>  hw/vfio/pci.h                            |   1 +
>  include/hw/arm/smmuv3.h                  |   9 +-
>  include/hw/core/qdev-properties-system.h |   6 ++
>  include/system/host_iommu_device.h       |  10 ++
>  qapi/misc-arm.json                       |  31 ++++++
>  qapi/pragma.json                         |   1 +
>  13 files changed, 292 insertions(+), 36 deletions(-)
>


