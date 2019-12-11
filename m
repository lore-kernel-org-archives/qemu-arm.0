Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1151766lff;
        Wed, 11 Dec 2019 12:41:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWoJpNdAZUJpds/n9873tt1EffF5QlmTXjDjm0SDU7FOuAsTzAEpsJS3wchQVvdk4qrDxO
X-Received: by 2002:ac8:73cb:: with SMTP id v11mr4512619qtp.361.1576096884565;
        Wed, 11 Dec 2019 12:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576096884; cv=none;
        d=google.com; s=arc-20160816;
        b=pdN7AbsiFuh77gTn7fjPZ+4dj6C8sWUzjvuQHMuEFZpMAH7R0r/6fUiXVsm2txN7C0
         +ipAVQbmFwCVFr9xDvcg8oe762Ga9+F2wJ7FT68HRpnXCNHGya5FL1SJX60u/zsarkU1
         BN56q/fxaCkBbPSNraFTV+Cav2Z5td6bCvfuAo6tSEatrZsuz6UeMKnW4Q/WaaDKojfa
         LQP43bCilHNb66wgPTptTo5mim2on8hMO0NqBiV2MxdnJdioyX8PZSuzhHcUhOEQxn6b
         w2JvD0z8SHxXj/lxvHaN36ZsK+YbQ6Qa51ti80Rxa9XFVTbVOUBFI46VBsejDhpsuzPu
         ZzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=NrRrUhPU5kiDD/Je7tTZRhRQoriKSeToJdEWZeFSjE0=;
        b=wI12/QgO2MQAoclH8xOCO3bMKG/p26GcH+jSGBDcXuySBrv1khQ1VZEO1GsPgCjwp3
         PAZWlnNHhmGxzwcOE/0jxfdCH7gsk4Od90j1y/7pum+gmKQIPlUbKWNnSIIytNDgvu+W
         X3WScalYa2k5+XuTDDdCM0dQN1B61VZKSI0p+QULxYXOT2zFPBoXRr0FRzTgYaAJMOrc
         4DQojulOBAHdEvGY1uhTqP35PgvQLs7ukgTtDolaSxp7Y9AgH2QkS3D5Wto5HMaY0a6t
         e2YCJJAt3ztGJxLks63jodMykkUoCmnqSo+D37Jn0MSrJ0KoCjgIE3815ugttuAQdKq6
         yWkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D0aL2d7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si1769305qka.261.2019.12.11.12.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 12:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D0aL2d7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if8nT-0007Ox-U6
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 15:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1if8nJ-0007OW-Ka
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 15:41:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1if8nG-0001Us-Qe
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 15:41:12 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49260
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1if8nG-0001Sw-Ls
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 15:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576096869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrRrUhPU5kiDD/Je7tTZRhRQoriKSeToJdEWZeFSjE0=;
 b=D0aL2d7UggIdNwXVre23iYahNtqqGD/5oYLqbn/iadQ/hDyHWkShTDAabVTKwWskqneG9R
 hI7iSpBkXClqye1o7oSXJz6R9j5q8SWziFhmqxgmS712KOxA+3BM1PYYSh9jRFIdxaUSen
 q22fgjHeXirCC1WEwkSyGoHiFCQ4UkE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-iNHDmvOxPEaP9qbisYybzQ-1; Wed, 11 Dec 2019 15:41:05 -0500
Received: by mail-qt1-f199.google.com with SMTP id v25so5306594qtq.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2019 12:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=17CziYo9wQH3o4D35my+SN1e465XkC882Y9erLC41dA=;
 b=VVE+W/0r7Jf+lppP+Bi//MSae+JzSr33mmXAsgMdk9PAGDFUOeosRqnMld4WUne+i/
 U37op7twKgg7nQ6+cXHmobFOyJ/6I4zEBG10RS1R5ntn6ZjFGxd0ORbT7k9KzXfz6fRC
 fvsAjqZrkk0LgvK5d1bNOgEl0HfPFkOTO7Xtpx2YTl64LFw1grAC2kjBltgkfRAsNk4/
 XpI1QQYjivcip5qS/ePbdHaGfNI4dWEhhph9wCV4oRey9V2l9pmrZqcGUv/wWvE3gVSt
 Y4LZnGi5lvqEBCsQZYT81TzodxPe/GiGQlS/tkrZZp1k/y3lxbdlNNu7oNlIG/F/gmS6
 ZTKw==
X-Gm-Message-State: APjAAAXS9s9O3FhzGA3+7tWH22QlGvH+aaMtOX+1878P9cz2Li/wmEF3
 FBZPaDr0eJUnz28hBgPmIkh+VinVDK/KDt5CokbHn2S/63ovTJWRgiACk6aoF3bvnMlLDjV5q61
 orU/Nt+W0vRXj
X-Received: by 2002:ac8:5059:: with SMTP id h25mr4466640qtm.20.1576096864666; 
 Wed, 11 Dec 2019 12:41:04 -0800 (PST)
X-Received: by 2002:ac8:5059:: with SMTP id h25mr4466610qtm.20.1576096864336; 
 Wed, 11 Dec 2019 12:41:04 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id e2sm1017385qkb.112.2019.12.11.12.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 12:41:03 -0800 (PST)
Date: Wed, 11 Dec 2019 15:40:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
Message-ID: <20191211154027-mutt-send-email-mst@kernel.org>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191211113936-mutt-send-email-mst@kernel.org>
 <306e4e92-4e86-7a82-3777-fd85ffd0303c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <306e4e92-4e86-7a82-3777-fd85ffd0303c@redhat.com>
X-MC-Unique: iNHDmvOxPEaP9qbisYybzQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, quintela@redhat.com, jean-philippe.brucker@arm.com,
 qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oe2w4Sug8g/H

On Wed, Dec 11, 2019 at 05:48:05PM +0100, Auger Eric wrote:
> Hi Michael,
>=20
> On 12/11/19 5:40 PM, Michael S. Tsirkin wrote:
> > On Fri, Nov 22, 2019 at 07:29:23PM +0100, Eric Auger wrote:
> >> This series implements the QEMU virtio-iommu device.
> >>
> >> This matches the v0.12 spec and the corresponding virtio-iommu
> >> driver upstreamed in 5.3.
> >>
> >> The pci proxy for the virtio-iommu device is instantiated using
> >> "-device virtio-iommu-pci". This series still relies on ACPI IORT/DT
> >> integration. Note the ACPI IORT integration is not yet upstreamed
> >> and testing needs to be based on Jean-Philippe's additional
> >> kernel patches [1].
> >=20
> > Or the config space approach? I really liked that one.
> Yes this corresponds to the paragraph below.
> >=20
> >>
> >> Work is ongoing to remove IORT adherence and allow the
> >> bindings between the IOMMU and the root complex to be defined
> >> and written into the PCI device configuration space. The outcome
> >> of this work is uncertain at this stage though. See [2].

Oh right. Why is it uncertain? Anything can be done to help?

> Thanks
>=20
> Eric
>=20
> >>
> >> So only patches 1-11 fully rely on upstreamed kernel code. Others
> >> should be considered as RFC.
> >>
> >> This respin allows people to test on ARM and x86. It also
> >> brings migration support (tested on ARM) and various cleanups.
> >> Reserved regions are now passed through an array of properties.
> >> A libqos test also is introduced to test the virtio-iommu API.
> >>
> >> Note integration with vhost devices and vfio devices is not part
> >> of this series. Please follow Bharat's respins [3].
> >>
> >> The 1st Patch ("migration: Support QLIST migration") was sent
> >> separately [4].
> >>
> >> Best Regards
> >>
> >> Eric
> >>
> >> This series can be found at:
> >> https://github.com/eauger/qemu/tree/v4.2-rc2-virtio-iommu-v11
> >>
> >> [1] kernel branch to be used for guest
> >>     https://github.com/eauger/linux/tree/v5.4-rc8-virtio-iommu-iort
> >> [2] [RFC 00/13] virtio-iommu on non-devicetree platforms
> >> [3] VFIO/VHOST integration is not part of this series. Please follow
> >>     [PATCH RFC v5 0/5] virtio-iommu: VFIO integration respins
> >> [4] [PATCH v6] migration: Support QLIST migration
> >>
> >> Testing:
> >> - tested with guest using virtio-net-pci
> >>   (,vhost=3Doff,iommu_platform,disable-modern=3Doff,disable-legacy=3Do=
n)
> >>   and virtio-blk-pci
> >> - migration on ARM
> >> - on x86 PC machine I get some AHCI non translated transactions,
> >>   very early. This does not prevent the guest from boot and behaving
> >>   properly. Warnings look like:
> >> qemu-system-x86_64: virtio_iommu_translate sid=3D250 is not known!!
> >> qemu-system-x86_64: no buffer available in event queue to report event
> >> qemu-system-x86_64: AHCI: Failed to start FIS receive engine: bad FIS
> >> receive buffer address
> >>
> >> History:
> >>
> >> v10 -> v11:
> >> - introduce virtio_iommu_handle_req macro
> >> - migration support
> >> - introduce DEFINE_PROP_INTERVAL and pass reserved regions
> >>   through an array of those
> >> - domain gtree simplification
> >>
> >> v9 -> v10:
> >> - rebase on 4.1.0-rc2, compliance with 0.12 spec
> >> - removed ACPI part
> >> - cleanup (see individual change logs)
> >> - moved to a PATCH series
> >>
> >> v8 -> v9:
> >> - virtio-iommu-pci device needs to be instantiated from the command
> >>   line (RID is not imposed anymore).
> >> - tail structure properly initialized
> >>
> >> v7 -> v8:
> >> - virtio-iommu-pci added
> >> - virt instantiation modified
> >> - DT and ACPI modified to exclude the iommu RID from the mapping
> >> - VIRTIO_IOMMU_F_BYPASS, VIRTIO_F_VERSION_1 features exposed
> >>
> >> v6 -> v7:
> >> - rebase on qemu 3.0.0-rc3
> >> - minor update against v0.7
> >> - fix issue with EP not on pci.0 and ACPI probing
> >> - change the instantiation method
> >>
> >> v5 -> v6:
> >> - minor update against v0.6 spec
> >> - fix g_hash_table_lookup in virtio_iommu_find_add_as
> >> - replace some error_reports by qemu_log_mask(LOG_GUEST_ERROR, ...)
> >>
> >> v4 -> v5:
> >> - event queue and fault reporting
> >> - we now return the IOAPIC MSI region if the virtio-iommu is instantia=
ted
> >>   in a PC machine.
> >> - we bypass transactions on MSI HW region and fault on reserved ones.
> >> - We support ACPI boot with mach-virt (based on IORT proposal)
> >> - We moved to the new driver naming conventions
> >> - simplified mach-virt instantiation
> >> - worked around the disappearing of pci_find_primary_bus
> >> - in virtio_iommu_translate, check the dev->as is not NULL
> >> - initialize as->device_list in virtio_iommu_get_as
> >> - initialize bufstate.error to false in virtio_iommu_probe
> >>
> >> v3 -> v4:
> >> - probe request support although no reserved region is returned at
> >>   the moment
> >> - unmap semantics less strict, as specified in v0.4
> >> - device registration, attach/detach revisited
> >> - split into smaller patches to ease review
> >> - propose a way to inform the IOMMU mr about the page_size_mask
> >>   of underlying HW IOMMU, if any
> >> - remove warning associated with the translation of the MSI doorbell
> >>
> >> v2 -> v3:
> >> - rebase on top of 2.10-rc0 and especially
> >>   [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
> >> - add mutex init
> >> - fix as->mappings deletion using g_tree_ref/unref
> >> - when a dev is attached whereas it is already attached to
> >>   another address space, first detach it
> >> - fix some error values
> >> - page_sizes =3D TARGET_PAGE_MASK;
> >> - I haven't changed the unmap() semantics yet, waiting for the
> >>   next virtio-iommu spec revision.
> >>
> >> v1 -> v2:
> >> - fix redefinition of viommu_as typedef
> >>
> >>
> >>
> >> Eric Auger (20):
> >>   migration: Support QLIST migration
> >>   virtio-iommu: Add skeleton
> >>   virtio-iommu: Decode the command payload
> >>   virtio-iommu: Add the iommu regions
> >>   virtio-iommu: Endpoint and domains structs and helpers
> >>   virtio-iommu: Implement attach/detach command
> >>   virtio-iommu: Implement map/unmap
> >>   virtio-iommu: Implement translate
> >>   virtio-iommu: Implement fault reporting
> >>   virtio-iommu-pci: Add virtio iommu pci support
> >>   hw/arm/virt: Add the virtio-iommu device tree mappings
> >>   qapi: Introduce DEFINE_PROP_INTERVAL
> >>   virtio-iommu: Implement probe request
> >>   virtio-iommu: Handle reserved regions in the translation process
> >>   virtio-iommu-pci: Add array of Interval properties
> >>   hw/arm/virt-acpi-build: Introduce fill_iort_idmap helper
> >>   hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table
> >>   virtio-iommu: Support migration
> >>   pc: Add support for virtio-iommu-pci
> >>   tests: Add virtio-iommu test
> >>
> >>  hw/arm/virt-acpi-build.c         |  91 ++-
> >>  hw/arm/virt.c                    |  53 +-
> >>  hw/core/qdev-properties.c        |  90 +++
> >>  hw/i386/acpi-build.c             |  72 +++
> >>  hw/i386/pc.c                     |  15 +-
> >>  hw/virtio/Kconfig                |   5 +
> >>  hw/virtio/Makefile.objs          |   2 +
> >>  hw/virtio/trace-events           |  22 +
> >>  hw/virtio/virtio-iommu-pci.c     |  91 +++
> >>  hw/virtio/virtio-iommu.c         | 952 ++++++++++++++++++++++++++++++=
+
> >>  include/exec/memory.h            |   6 +
> >>  include/hw/acpi/acpi-defs.h      |  21 +-
> >>  include/hw/arm/virt.h            |   2 +
> >>  include/hw/i386/pc.h             |   2 +
> >>  include/hw/pci/pci.h             |   1 +
> >>  include/hw/qdev-properties.h     |   3 +
> >>  include/hw/virtio/virtio-iommu.h |  67 +++
> >>  include/migration/vmstate.h      |  21 +
> >>  include/qemu/queue.h             |  39 ++
> >>  include/qemu/typedefs.h          |   1 +
> >>  migration/trace-events           |   5 +
> >>  migration/vmstate-types.c        |  70 +++
> >>  qdev-monitor.c                   |   1 +
> >>  tests/Makefile.include           |   2 +
> >>  tests/libqos/virtio-iommu.c      | 177 ++++++
> >>  tests/libqos/virtio-iommu.h      |  45 ++
> >>  tests/test-vmstate.c             | 170 ++++++
> >>  tests/virtio-iommu-test.c        | 261 +++++++++
> >>  28 files changed, 2253 insertions(+), 34 deletions(-)
> >>  create mode 100644 hw/virtio/virtio-iommu-pci.c
> >>  create mode 100644 hw/virtio/virtio-iommu.c
> >>  create mode 100644 include/hw/virtio/virtio-iommu.h
> >>  create mode 100644 tests/libqos/virtio-iommu.c
> >>  create mode 100644 tests/libqos/virtio-iommu.h
> >>  create mode 100644 tests/virtio-iommu-test.c
> >>
> >> --=20
> >> 2.20.1
> >=20
> >=20

