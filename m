Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp883351lff;
        Wed, 11 Dec 2019 08:48:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqw0HiJ4427Nt6d3sB9i+lnA4w84PF7fUx/GAEOhPDKUnsYuWQG2FOEhJkd6mUTHwC+xVQZp
X-Received: by 2002:aed:256d:: with SMTP id w42mr3531815qtc.385.1576082928534;
        Wed, 11 Dec 2019 08:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576082928; cv=none;
        d=google.com; s=arc-20160816;
        b=DpPYLjN1Q/E41GvivnH5a7ghhQAEXaEpE5njdFKVpqdoYxV07kIzDcHTtkm5uBcAks
         +PFm0oukBSq0PhnV67DsQO0ik4fTzfY+cDIBWr5IE29PTA7cldCiZ93fV5CgFwvUoLsT
         LDRG8RJKbLRUftb+QVbOYjpEQC1PycPUYNpGdQLVO9amXhQ9LjINMesgNhkR1qIhgh6i
         NDa/SXebcPkGM+U8dMFoRw/HxLeRjoE7dgrF84DBns/9HUURWFYLpMvH89uqhsk2jW1P
         l92qgkyd51AzCM5bfKTOZSUMnzb7GBvF+1b97DI+mXU4GsXPhDWfgWTCFj28Eh4KWYpa
         dmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sG46IMvcj0yp0B5v1TxDs/8TYH5cRlwJHyrr9ml9234=;
        b=0qMHUttUS/fTY7GsJS96fkKc8SHU0XrYUZB88KJ5YxnW1og9+F27EhrsFOcVRSfvaG
         VRBgSRLjCUfP6c7sYDfdX/QnJLE6vL1mYFN2BCwoTdPAzJDaOZiHokW/Mr+pAbNOwm0S
         dCoREiof2M9skzdAeKYjXQ4AgnD0xZA5DSrZh2tfn6sioO7vwjKdUXqbX2Zyn3sz7K3G
         IEUaO26XSCyzkgyOD+jjXJOlfeOdt5enBxOqvhxLF3PbP684hKQZz6MV812BUGIX04Id
         JMUri19eBZkvfD8gmMSkBAtXtfwEd+G3MUcui29Hu/ZvauO1dejTTxlDwJB0rMXi819n
         /1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cueYOKsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 32si1332622qtu.202.2019.12.11.08.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 08:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cueYOKsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if5AN-0004RV-No
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 11:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1if5A5-0004O4-Lx
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 11:48:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1if5A2-0006f2-4i
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 11:48:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28469
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1if59y-0006bj-Ri
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 11:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576082901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sG46IMvcj0yp0B5v1TxDs/8TYH5cRlwJHyrr9ml9234=;
 b=cueYOKsfbqZ9YHXbeWloBMGeDHel/iQeluFYl5isegXK9lP2PhjyAb+lIINwdcZ4EVLQ0x
 gXMxTGjxVkzHK40J17P5USFa/79Bu/Wm/tkGzi3EM5Z7golq+zz49FVdr4Jq5/PzAmBGah
 7jc8oHEol3Uue0u+5dLrbUW3Hic1xv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-40gwlicCPmyLhWb8J6nfKA-1; Wed, 11 Dec 2019 11:48:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EDB38026A2;
 Wed, 11 Dec 2019 16:48:16 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 182675D6A3;
 Wed, 11 Dec 2019 16:48:07 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191211113936-mutt-send-email-mst@kernel.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <306e4e92-4e86-7a82-3777-fd85ffd0303c@redhat.com>
Date: Wed, 11 Dec 2019 17:48:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191211113936-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 40gwlicCPmyLhWb8J6nfKA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: 3jWwvoFKbvgT

Hi Michael,

On 12/11/19 5:40 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 22, 2019 at 07:29:23PM +0100, Eric Auger wrote:
>> This series implements the QEMU virtio-iommu device.
>>
>> This matches the v0.12 spec and the corresponding virtio-iommu
>> driver upstreamed in 5.3.
>>
>> The pci proxy for the virtio-iommu device is instantiated using
>> "-device virtio-iommu-pci". This series still relies on ACPI IORT/DT
>> integration. Note the ACPI IORT integration is not yet upstreamed
>> and testing needs to be based on Jean-Philippe's additional
>> kernel patches [1].
> 
> Or the config space approach? I really liked that one.
Yes this corresponds to the paragraph below.
> 
>>
>> Work is ongoing to remove IORT adherence and allow the
>> bindings between the IOMMU and the root complex to be defined
>> and written into the PCI device configuration space. The outcome
>> of this work is uncertain at this stage though. See [2].

Thanks

Eric

>>
>> So only patches 1-11 fully rely on upstreamed kernel code. Others
>> should be considered as RFC.
>>
>> This respin allows people to test on ARM and x86. It also
>> brings migration support (tested on ARM) and various cleanups.
>> Reserved regions are now passed through an array of properties.
>> A libqos test also is introduced to test the virtio-iommu API.
>>
>> Note integration with vhost devices and vfio devices is not part
>> of this series. Please follow Bharat's respins [3].
>>
>> The 1st Patch ("migration: Support QLIST migration") was sent
>> separately [4].
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v4.2-rc2-virtio-iommu-v11
>>
>> [1] kernel branch to be used for guest
>>     https://github.com/eauger/linux/tree/v5.4-rc8-virtio-iommu-iort
>> [2] [RFC 00/13] virtio-iommu on non-devicetree platforms
>> [3] VFIO/VHOST integration is not part of this series. Please follow
>>     [PATCH RFC v5 0/5] virtio-iommu: VFIO integration respins
>> [4] [PATCH v6] migration: Support QLIST migration
>>
>> Testing:
>> - tested with guest using virtio-net-pci
>>   (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
>>   and virtio-blk-pci
>> - migration on ARM
>> - on x86 PC machine I get some AHCI non translated transactions,
>>   very early. This does not prevent the guest from boot and behaving
>>   properly. Warnings look like:
>> qemu-system-x86_64: virtio_iommu_translate sid=250 is not known!!
>> qemu-system-x86_64: no buffer available in event queue to report event
>> qemu-system-x86_64: AHCI: Failed to start FIS receive engine: bad FIS
>> receive buffer address
>>
>> History:
>>
>> v10 -> v11:
>> - introduce virtio_iommu_handle_req macro
>> - migration support
>> - introduce DEFINE_PROP_INTERVAL and pass reserved regions
>>   through an array of those
>> - domain gtree simplification
>>
>> v9 -> v10:
>> - rebase on 4.1.0-rc2, compliance with 0.12 spec
>> - removed ACPI part
>> - cleanup (see individual change logs)
>> - moved to a PATCH series
>>
>> v8 -> v9:
>> - virtio-iommu-pci device needs to be instantiated from the command
>>   line (RID is not imposed anymore).
>> - tail structure properly initialized
>>
>> v7 -> v8:
>> - virtio-iommu-pci added
>> - virt instantiation modified
>> - DT and ACPI modified to exclude the iommu RID from the mapping
>> - VIRTIO_IOMMU_F_BYPASS, VIRTIO_F_VERSION_1 features exposed
>>
>> v6 -> v7:
>> - rebase on qemu 3.0.0-rc3
>> - minor update against v0.7
>> - fix issue with EP not on pci.0 and ACPI probing
>> - change the instantiation method
>>
>> v5 -> v6:
>> - minor update against v0.6 spec
>> - fix g_hash_table_lookup in virtio_iommu_find_add_as
>> - replace some error_reports by qemu_log_mask(LOG_GUEST_ERROR, ...)
>>
>> v4 -> v5:
>> - event queue and fault reporting
>> - we now return the IOAPIC MSI region if the virtio-iommu is instantiated
>>   in a PC machine.
>> - we bypass transactions on MSI HW region and fault on reserved ones.
>> - We support ACPI boot with mach-virt (based on IORT proposal)
>> - We moved to the new driver naming conventions
>> - simplified mach-virt instantiation
>> - worked around the disappearing of pci_find_primary_bus
>> - in virtio_iommu_translate, check the dev->as is not NULL
>> - initialize as->device_list in virtio_iommu_get_as
>> - initialize bufstate.error to false in virtio_iommu_probe
>>
>> v3 -> v4:
>> - probe request support although no reserved region is returned at
>>   the moment
>> - unmap semantics less strict, as specified in v0.4
>> - device registration, attach/detach revisited
>> - split into smaller patches to ease review
>> - propose a way to inform the IOMMU mr about the page_size_mask
>>   of underlying HW IOMMU, if any
>> - remove warning associated with the translation of the MSI doorbell
>>
>> v2 -> v3:
>> - rebase on top of 2.10-rc0 and especially
>>   [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
>> - add mutex init
>> - fix as->mappings deletion using g_tree_ref/unref
>> - when a dev is attached whereas it is already attached to
>>   another address space, first detach it
>> - fix some error values
>> - page_sizes = TARGET_PAGE_MASK;
>> - I haven't changed the unmap() semantics yet, waiting for the
>>   next virtio-iommu spec revision.
>>
>> v1 -> v2:
>> - fix redefinition of viommu_as typedef
>>
>>
>>
>> Eric Auger (20):
>>   migration: Support QLIST migration
>>   virtio-iommu: Add skeleton
>>   virtio-iommu: Decode the command payload
>>   virtio-iommu: Add the iommu regions
>>   virtio-iommu: Endpoint and domains structs and helpers
>>   virtio-iommu: Implement attach/detach command
>>   virtio-iommu: Implement map/unmap
>>   virtio-iommu: Implement translate
>>   virtio-iommu: Implement fault reporting
>>   virtio-iommu-pci: Add virtio iommu pci support
>>   hw/arm/virt: Add the virtio-iommu device tree mappings
>>   qapi: Introduce DEFINE_PROP_INTERVAL
>>   virtio-iommu: Implement probe request
>>   virtio-iommu: Handle reserved regions in the translation process
>>   virtio-iommu-pci: Add array of Interval properties
>>   hw/arm/virt-acpi-build: Introduce fill_iort_idmap helper
>>   hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table
>>   virtio-iommu: Support migration
>>   pc: Add support for virtio-iommu-pci
>>   tests: Add virtio-iommu test
>>
>>  hw/arm/virt-acpi-build.c         |  91 ++-
>>  hw/arm/virt.c                    |  53 +-
>>  hw/core/qdev-properties.c        |  90 +++
>>  hw/i386/acpi-build.c             |  72 +++
>>  hw/i386/pc.c                     |  15 +-
>>  hw/virtio/Kconfig                |   5 +
>>  hw/virtio/Makefile.objs          |   2 +
>>  hw/virtio/trace-events           |  22 +
>>  hw/virtio/virtio-iommu-pci.c     |  91 +++
>>  hw/virtio/virtio-iommu.c         | 952 +++++++++++++++++++++++++++++++
>>  include/exec/memory.h            |   6 +
>>  include/hw/acpi/acpi-defs.h      |  21 +-
>>  include/hw/arm/virt.h            |   2 +
>>  include/hw/i386/pc.h             |   2 +
>>  include/hw/pci/pci.h             |   1 +
>>  include/hw/qdev-properties.h     |   3 +
>>  include/hw/virtio/virtio-iommu.h |  67 +++
>>  include/migration/vmstate.h      |  21 +
>>  include/qemu/queue.h             |  39 ++
>>  include/qemu/typedefs.h          |   1 +
>>  migration/trace-events           |   5 +
>>  migration/vmstate-types.c        |  70 +++
>>  qdev-monitor.c                   |   1 +
>>  tests/Makefile.include           |   2 +
>>  tests/libqos/virtio-iommu.c      | 177 ++++++
>>  tests/libqos/virtio-iommu.h      |  45 ++
>>  tests/test-vmstate.c             | 170 ++++++
>>  tests/virtio-iommu-test.c        | 261 +++++++++
>>  28 files changed, 2253 insertions(+), 34 deletions(-)
>>  create mode 100644 hw/virtio/virtio-iommu-pci.c
>>  create mode 100644 hw/virtio/virtio-iommu.c
>>  create mode 100644 include/hw/virtio/virtio-iommu.h
>>  create mode 100644 tests/libqos/virtio-iommu.c
>>  create mode 100644 tests/libqos/virtio-iommu.h
>>  create mode 100644 tests/virtio-iommu-test.c
>>
>> -- 
>> 2.20.1
> 
> 

