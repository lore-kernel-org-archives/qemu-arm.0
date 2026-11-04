Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8156606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OTVFB6sm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOaly-0005qn-DG; Wed, 04 Nov 2026 08:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xOalv-0005q5-0f
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 08:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xOals-0002EX-KZ
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 08:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793797879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2d0yVPNE+dWSvbmpZmx3OcTzKGLua3Iw2hXVBqo74I=;
 b=OTVFB6smlqh90O4/SBWVgt7vCmS63wHM13beW8b1JINqfPtsoU2Yjz8BFm0xm1RqK9fchd
 CW2uMR9byQlIdJfNUVBl1N78C/4uRWvzd/5NCuOQZc0TcTuh/SeBO0BIzIVVHxPt9r2aH1
 KRyH/V/FZqKpd1dDAv6t1AtFgZ6mPe8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-u2n2Qc57PVisPEDBKE9spQ-1; Wed, 04 Nov 2026 08:11:17 -0500
X-MC-Unique: u2n2Qc57PVisPEDBKE9spQ-1
X-Mimecast-MFC-AGG-ID: u2n2Qc57PVisPEDBKE9spQ_1793797876
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5bfd9b4260eso492086e87.1
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 05:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793797876; x=1794402676;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N2d0yVPNE+dWSvbmpZmx3OcTzKGLua3Iw2hXVBqo74I=;
 b=XzcIGDoBIAkIg3jYyMtAsjNXskrGO+m2/zuB7NwscK2NoxlYCg2TpvpE/+MpX4LjQd
 iZJDwzh/WL8ZMmVei4rZtc3BIhkAkliDmErh5IRRmUnMlYlJFXIiv1Fu8cxoMLz+10bw
 oojb958FcTilX+qaQKGG/8/rHb0rcX3bs/SKUKTSw0VNRA5OY0fepSLzy4C3KSkJOIYD
 Zin/cacecYIHghTrllY6fC+ZjuOJvrN4kGGW8BpU1f/5+5H11/Px8d81SGwJHoBzEdjw
 upPMMGoECQd0iq6ZceT6faQtGXJPfsnT0RF+zVGbTP1JwwCX7zI5uTqN2gsiyi+dims4
 Y/eg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYrSwEc30UYIYT/nAAksN64Icoz4+OCPlz3gnnM0pC5yt3EFBIGREw32i2TCqlhlDFE/jF1qNQJg==@nongnu.org
X-Gm-Message-State: APuU4Z8wf7uen/sBfouqjxmqnui5eXlVKR4xYL8ka3L5fNduvsiYIJNP
 rVGHlr2m2brPKRdOJjqRJI0t58x2ZdbUV3HOpMxdv8bWADHdBORwMcp9DO1VQ+vIuhjtEvbcP66
 2cX4felNh1ugoeQ90rkb10a8ahr8ulW7SkSOrmPhA9BMqGZ1CXciESg==
X-Gm-Gg: AYBFou3d1Px4VDk+ugIeelGw1roVCyc74KgmCK14mvgjlYIM3BaePWx9cojXPOtk+c3
 b3+KHJ5AdoMufwmsaPeCwraQg8nRmjkTVmL7VXt44bYdjc0vxLnQZbNfK9yjTaXzPnw+KdSl9Km
 SNkMxCWZTsBbuF9dEDx3VL13vIcJjCEMZr4aR6QxdZQhgsqWPOQXZOlHiod5031ts5xGZt3Sx1s
 4a+eqklPrCmorCNQRGHRGovjTeNPTMxioIOvS9u+p3weBxGqKPcfDKj+kIJaZ4bJ8FUNc8T4CdK
 M17nkYgacOQiWu1o6cucROL5/dFa4jdCCAWOFhdxjZ17hkE9UVmPehEF9rZa0JNSgsBamDNz8rF
 61O0W7zodYvEIzFM2/Zf5o/5RTaA3t9JBJWe+dCRwhw==
X-Received: by 2002:a05:6512:4020:b0:5bf:a193:7a5b with SMTP id
 2adb3069b0e04-5bfd956d6f1mr5914615e87.34.1793797875604; 
 Wed, 04 Nov 2026 05:11:15 -0800 (PST)
X-Received: by 2002:a05:6512:4020:b0:5bf:a193:7a5b with SMTP id
 2adb3069b0e04-5bfd956d6f1mr5914598e87.34.1793797874886; 
 Wed, 04 Nov 2026 05:11:14 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bff38cf919sm379963e87.63.2026.11.04.05.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 05:11:14 -0800 (PST)
Date: Wed, 4 Nov 2026 08:11:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tushar Dave <tdave@nvidia.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 marcel@redhat.com, devel@edk2.groups.io, alwilliamson@nvidia.com,
 jgg@nvidia.com, skolothumtho@nvidia.com, ardb@kernel.org, kraxel@redhat.com
Subject: Re: [PATCH v2 0/5] hw/pci, hw/arm/virt: fixed PCI BAR placement
Message-ID: <20261104071853-mutt-send-email-mst@kernel.org>
References: <20261102181241.3077981-1-tdave@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102181241.3077981-1-tdave@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vARajbWgZ3yvU7YALpIWl94M0vojDrac-mtpzKyvUr4_1793797876
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:12:36PM -0600, Tushar Dave wrote:
> This patch series introduces a mechanism to specify Guest Physical Addresses
> (GPAs) for PCI BARs, allowing explicit placement of guest MMIO BAR addresses
> to match host physical addresses for assigned devices.


My understanding is that all this does it pass a property to
the firmware asking it to set the bar to a given value?

There are two standard ways to do this:
- EA capability in pci config space
- fixed BAR _DSM in ACPI


If none of these are appropriate, pls document why.



> On some platforms, P2P DMA between devices in the same IOMMU group is required
> for the desired data path and performance. The PCI fabric ACS is configured
> to permit direct P2P without routing traffic through the host bridge.
> 
> To support this multi-device IOMMU group P2P scenario in virtualization, the
> VM may need to preserve the host PCI BAR addresses in the guest.
> 
> A new fixed-bar-N property on a PCI endpoint device specifies the required
> guest address for BAR N (N = 0 through 5):
> 
>     -device some-device,fixed-bar-0=<addr>[,fixed-bar-1=<addr>]...
> 
> Once any fixed-bar-N property is set on a device, every memory BAR on that
> device must have a fixed address. Under a PCIe root port, fixed BAR placement
> is all-or-nothing within that root port's subtree. If one endpoint below the
> root port has a fixed BAR, every other endpoint with a memory BAR below that
> same root port must also have all of its memory BARs fixed.
> 
> QEMU validates the configuration when the machine is done initializing. Each
> address must be aligned to its BAR size, fall within the appropriate PCIe MMIO
> aperture, and not overlap any other fixed BAR. QEMU aborts on any validation
> failure. QEMU performs neither PCI enumeration nor BAR allocation; the
> validated configuration is exported to firmware through the "etc/fixed-bars"
> fw_cfg blob, which carries each PCI function's vendor/device identification,
> firmware device path, and, for fixed devices, the configured address, size,
> and type of each BAR. The blob format is documented in
> docs/specs/pci-fixed-bars.rst.
> 
> The fixed-bar-N property and its validation are generic and apply to any PCI
> device. A machine type opts in by setting the new pci_fixed_bar_supported
> MachineClass flag. Machine types that leave it unset reject fixed-bar-N. This
> series enables it on the virt machine only, by setting the flag and wiring up
> the fw_cfg export. Other machine types would need equivalent wiring to expose
> the same mechanism to firmware.
> 
> On the firmware side, the existing IncompatiblePciDeviceSupportDxe driver is
> extended to consume this blob. During device discovery, its CheckDevice()
> implementation returns ACPI address descriptors with _MIF|_MAF set for the
> fixed BARs found in the blob. PciBusDxe's resource allocator already supports
> fixed BARs, including sizing and pinning the bridge windows above them. It now
> treats a BAR as fixed when the descriptor carries _MIF|_MAF, and programs the
> fixed address into the BAR register.
> 
> Fixed BAR placement requires the guest to preserve the PCI resource
> configuration established by firmware. This is requested through the PCI boot
> configuration preservation mechanism using ACPI _DSM function 5. Fixed BAR
> configuration is rejected when firmware is not loaded or ACPI is disabled.
> 
> Example 1: VFIO passthrough device with fixed BARs and the PCIe MMIO
> aperture adjusted to accommodate the fixed addresses.
> 
>     -machine virt,...,highmem-mmio-base=4T,highmem-mmio-size=4T
>     -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1,io-reserve=0
>     -device x3130-upstream,id=upstream1,bus=pcie.port1
>     -device xio3130-downstream,id=downstream1_1,bus=upstream1,chassis=1,slot=2
>     -device vfio-pci-nohotplug,host=0018:06:00.0,bus=downstream1_1,id=dev0,\
>             fixed-bar-0=0x48000000000,fixed-bar-2=0x50000000000,fixed-bar-4=0x58000000000
> 
> Example 2: VFIO and emulated devices under the same root port with fixed BARs
> and the PCIe MMIO aperture adjusted using highmem-mmio-base.
> 
>     -machine virt,...,highmem-mmio-base=64T,highmem-mmio-size=64T
>     -device pxb-pcie,id=pcie.1,bus_nr=1,bus=pcie.0
>     -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1,io-reserve=0
>     -device x3130-upstream,id=upstream1,bus=pcie.port1
>     -device xio3130-downstream,id=downstream1_1,bus=upstream1,chassis=1,slot=1
>     -device vfio-pci-nohotplug,host=0018:06:00.0,bus=downstream1_1,rombar=0,id=dev0,iommufd=iommufd0,\
>             fixed-bar-0=0x6b4000000000,fixed-bar-2=0x6b8000000000,fixed-bar-4=0x6c0000000000
>     -device xio3130-downstream,id=downstream1_2,bus=upstream1,chassis=1,slot=2
>     -device vfio-pci,host=0012:03:00.1,bus=downstream1_2,id=nic1,iommufd=iommufd0,fixed-bar-0=0x6c8000000000
>     -device xio3130-downstream,id=downstream1_3,bus=upstream1,chassis=1,slot=3
>     -device e1000,netdev=net0,bus=downstream1_3,id=nic_emu,fixed-bar-0=0x20000000
> 
> Limitations:
> 
> * I/O BARs and the expansion ROM BAR are not covered by fixed-bar-N.
> * SR-IOV VF BARs are not covered.
> 
> Testing:
> 
> The series was tested on the AArch64 virt machine with a range of PCIe
> configurations, including emulated and VFIO passthrough devices, PCIe
> switches, single and multiple fixed-BAR endpoints behind a shared root port,
> devices attached directly to the host bridge, and endpoints behind nested
> bridges. All rejection paths were also exercised, with the corresponding
> error messages verified. These included unsupported machine types,
> hot-plugged devices, non-existent BARs, I/O BARs, unaligned, overlapping, or
> out-of-aperture BARs, incomplete BAR configurations, highmem-mmio=off,
> missing firmware, and highmem-mmio-base values that cause address-space
> overflow.
> 
> Changes since v1:
> 
> * Add a pci_fixed_bar_supported MachineClass flag; fixed-bar-N is rejected
>   on machine types that do not set it. virt sets it.
> * Keep the fixed BAR claims in FixedBarsInfo instead of a static array, and
>   report validation failures through Error ** to the machine code instead of
>   calling exit(1).
> * Allow a 64-bit non-prefetchable BAR in either aperture when the device is
>   attached to the host bridge; behind a PCI bridge it must lie below 4 GiB.
>   A 64-bit prefetchable BAR must still lie in the 64-bit aperture.
> * Treat the high PCIe MMIO aperture as absent with highmem-mmio=off, and
>   reject fixed BAR configuration unless firmware is loaded and ACPI is
>   enabled.
> * Check highmem-mmio-base + highmem-mmio-size against the PA space without
>   overflow, and document highmem-mmio-base in docs/system/arm/virt.rst.
> * Document the etc/fixed-bars format in docs/specs/pci-fixed-bars.rst, and
>   note that the firmware device path is carried for future matching.
> * Move pci-fixed-bar.h to include/hw/pci/.
> 
> v1:
> https://lore.kernel.org/qemu-arm/20260916185554.917526-1-tdave@nvidia.com/
> 
> A git branch with this series applied is available at:
> https://github.com/tdavenvidia/upstream-qemu/tree/Upstream-fixed-bar-Oct-29-V2
> 
> The related EDK2 change is available at:
> https://github.com/tianocore/edk2/pull/13183
> 
> Tushar Dave (5):
>   hw/pci: introduce PCI fixed BAR properties
>   hw/pci: add validation for fixed BAR configuration
>   hw/pci: add fixed BAR fw_cfg blob export
>   hw/arm/virt: export fixed BAR metadata via fw_cfg
>   hw/arm/virt: add highmem-mmio-base property
> 
>  docs/specs/index.rst            |   1 +
>  docs/specs/pci-fixed-bars.rst   |  75 +++++++
>  docs/system/arm/virt.rst        |   4 +
>  hw/arm/virt.c                   |  82 ++++++-
>  hw/pci/meson.build              |   2 +
>  hw/pci/pci-fixed-bar-blob.c     | 308 +++++++++++++++++++++++++++
>  hw/pci/pci-fixed-bar-validate.c | 365 ++++++++++++++++++++++++++++++++
>  hw/pci/pci-fixed-bar-validate.h |  22 ++
>  hw/pci/pci.c                    |  71 +++++++
>  include/hw/core/boards.h        |   3 +
>  include/hw/pci/pci-fixed-bar.h  |  63 ++++++
>  include/hw/pci/pci_device.h     |   7 +
>  12 files changed, 1002 insertions(+), 1 deletion(-)
>  create mode 100644 docs/specs/pci-fixed-bars.rst
>  create mode 100644 hw/pci/pci-fixed-bar-blob.c
>  create mode 100644 hw/pci/pci-fixed-bar-validate.c
>  create mode 100644 hw/pci/pci-fixed-bar-validate.h
>  create mode 100644 include/hw/pci/pci-fixed-bar.h
> 
> -- 
> 2.34.1


