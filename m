Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743446wrq;
        Mon, 4 Jun 2018 08:29:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJgBhbWrQWFhZJgbQPJ5f75Tq7kOZotdcSZK+n2XLca5B2yDwVbGmc4uy4ulxD0FbRv1BuH
X-Received: by 2002:a1c:7e87:: with SMTP id z129-v6mr9695023wmc.131.1528126184285;
        Mon, 04 Jun 2018 08:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126184; cv=none;
        d=google.com; s=arc-20160816;
        b=eb7x0P1pehkhSZflOJJRXTdqSrd2N7FlqdI3A+yiTaIcBnCM9/3x6LHNpSiGhBD1sH
         N3lu9MlfiWaDTUdhNaddnoP0TAii7XQfUkeVU0CcjiMJig13OXKpplkvCQ1kBtXpmHaY
         otJzSyFAUH5pNHu2F8/5Ci9oWcJkfSEmzkYRZGpbJZ50QvlnkNra9ARfqQ3zwGXUQA1N
         M2xJEQ4EFJWNTArs6SNLyk5G7j6Nrx+XI+S/fgampR3UkX5uyBbN1PGS16QSPZKEVy/o
         fPaRP8nTAbklNNQYEuVBgdb1+EDlvG+tWIraC7iK5Fkh5DscR/9OURu5gUDKGOAR1Al8
         oHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:arc-authentication-results;
        bh=97b3E/2rRWx2tOqehjmZi1tEAzjdko7QwghJuDn8dbo=;
        b=iFoC7sQYL0tcJ1Xdq5jYc5a8kdVwhJrL0WrS38uQEtQe6hnkRvzvIVS27VPy01DuIK
         67ENl4v7jtwCH6wUEeh5xH2bphHEseGM3NbVbuwCYeGUvTheEuGmltFrGpfHe/1QFn7o
         rhOkr7hAP47TvXVWXtIpZQUguPCQRDD6/nUEzz2qAiTvtvf4BqdQ7nyue+eRbog7539q
         3jeHbYq2WSun6pGLbzKauSjNIukwm26magdNXHlM35afoTvZ/YBd3U5MBdfDmxuoQ09e
         rXq8ZDsBiyCsyKiTd+ymSNV2naB2qiz8xPSvyNeoW/PqiMMyVcFDJQQ8krcU2FiUHmx7
         NAUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id k184-v6si316771wmg.182.2018.06.04.08.29.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQU-00070c-6x; Mon, 04 Jun 2018 16:29:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 00/13] iommu: support txattrs, support TCG execution, implement TZ MPC
Date: Mon,  4 Jun 2018 16:29:28 +0100
Message-Id: <20180604152941.20374-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ecjrj11B8JF7

Hi; this is v2 of my iommu patchset, which does:
 * support IOMMUs that are aware of memory transaction attributes and
   may generate different translations for different attributes
 * support TCG execution out of memory which is behind an IOMMU
 * implement the Arm TrustZone Memory Protection Controller
   (which needs both the above features in the IOMMU core code)
 * use the MPC in the mps2-an505 board

Patches 1-3 add the support for memory-transaction-aware
IOMMUs. The general approach is that we have the concept of an
IOMMU index (similar to the TCG MMU index), which selects which of
multiple possible translation tables in the IOMMU we're trying to use.
Most IOMMUs will support just a single index. When you register an
IOMMU notifier and when you call the translate method you have to
specify which IOMMU index you want. There's a method for getting the
index that applies for a particular set of transaction attributes.
All the current IOMMU implementations have just one iommu index, and
all the current users of the notify API assume that.

Patch 4 adds the support for TCG execution from memory that sits
behind an IOMMU. We do this in a fairly simple way on the assumption
that changes to the IOMMU config at runtime will be fairly uncommon:
we just flush the CPU TLB so it forgets about any cached results
when we get an IOMMU unmap notification. (This is similar to how
we handle reconfigurations of the memory map done by mapping or
unmapping MemoryRegions.) NB: I'm not completely sure that calling
tlb_flush() here is sufficient to be non-racy in the case where CPU A
has triggered the IOMMU unmap notify by changing the IOMMU config
while CPU B is executing from memory behind the IOMMU, but tlb_flush()
is what tcg_commit() uses so I guess it's OK. I think the idea here
is that any delay in flushing B's TLB is just equivalent to B having
executed a little bit further before A got to changing the config?

Patches 5-8 implement the TrustZone Memory Protection Controller,
which is a fairly simple piece of hardware that just configurably
either allows or blocks transactions depending on attrs.secure.

Patch 9 deals with a limitation in our or-irq device, which
currently only allows 16 input lines (we need 17 for one of the OR
gates in the IoTKit object). The patch raisees the limit to 32, but
in a way that means we can easily raise it further in future without
migration compatibility problems.

Patches 10-13 add MPCs to the IoTKit SoC object and to the mps2-an505
board model, and wire them up appropriately.

Unreviewed patches: 4, 6, 7, 8, 9, 10

v1->v2 changes:
 * the initial "attribute plumbing" patches are now in master
 * the patch to add VMSTATE_BOOL_SUB_ARRAY is also in master now
 * minor rebase fixup to patch 4 for changes in hw/i386/intel_iommu.c
 * moved the num_indexes method definition to the right patch
 * dropped unused iommu_idx field from IOMMUTLBEntry struct
 * tcg_iommu_notifier_destroy now unconditionally unregisters the notifier
 * patch 4: switched from GSList to GArray
 * patch 6: fixed reset values for MPC CTRL and INT_EN registers
 * I have left iommu_idx as signed, because that follows what we've
   done for TCG mmu indexes (and using 'int' for this kind of
   thing is common C practice IMHO)


Peter Maydell (13):
  iommu: Add IOMMU index concept to IOMMU API
  iommu: Add IOMMU index argument to notifier APIs
  iommu: Add IOMMU index argument to translate method
  exec.c: Handle IOMMUs in address_space_translate_for_iotlb()
  hw/misc/tz-mpc.c: Implement the Arm TrustZone Memory Protection
    Controller
  hw/misc/tz-mpc.c: Implement registers
  hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
  hw/misc/tz_mpc.c: Honour the BLK_LUT settings in translate
  hw/core/or-irq: Support more than 16 inputs to an OR gate
  hw/misc/iotkit-secctl.c: Implement SECMPCINTSTATUS
  hw/arm/iotkit: Instantiate MPC
  hw/arm/iotkit: Wire up MPC interrupt lines
  hw/arm/mps2-tz.c: Instantiate MPCs

 hw/misc/Makefile.objs           |   1 +
 include/exec/exec-all.h         |   3 +-
 include/exec/memory.h           |  65 +++-
 include/hw/arm/iotkit.h         |   8 +
 include/hw/misc/iotkit-secctl.h |   8 +
 include/hw/misc/tz-mpc.h        |  80 +++++
 include/hw/or-irq.h             |   5 +-
 include/qom/cpu.h               |   3 +
 accel/tcg/cputlb.c              |   3 +-
 exec.c                          | 146 +++++++-
 hw/alpha/typhoon.c              |   3 +-
 hw/arm/iotkit.c                 | 112 +++++-
 hw/arm/mps2-tz.c                |  71 ++--
 hw/arm/smmuv3.c                 |   2 +-
 hw/core/or-irq.c                |  39 ++-
 hw/dma/rc4030.c                 |   2 +-
 hw/i386/amd_iommu.c             |   2 +-
 hw/i386/intel_iommu.c           |   8 +-
 hw/misc/iotkit-secctl.c         |  38 +-
 hw/misc/tz-mpc.c                | 604 ++++++++++++++++++++++++++++++++
 hw/ppc/spapr_iommu.c            |   5 +-
 hw/s390x/s390-pci-bus.c         |   2 +-
 hw/s390x/s390-pci-inst.c        |   4 +-
 hw/sparc/sun4m_iommu.c          |   3 +-
 hw/sparc64/sun4u_iommu.c        |   2 +-
 hw/vfio/common.c                |   6 +-
 hw/virtio/vhost.c               |   7 +-
 memory.c                        |  33 +-
 MAINTAINERS                     |   2 +
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/trace-events            |   8 +
 31 files changed, 1206 insertions(+), 70 deletions(-)
 create mode 100644 include/hw/misc/tz-mpc.h
 create mode 100644 hw/misc/tz-mpc.c

-- 
2.17.1
