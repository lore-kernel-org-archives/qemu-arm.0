Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E8BCA5FE6
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:21:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkk-0007bb-7f; Fri, 02 Oct 2026 16:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkh-0007a0-Rk
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkf-0005qc-Uc
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2e4af975346so10005ad.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972464; x=1791577264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7qPKAWSfckJyJHNNtJXbCBKrySoQfPFDqXUJy/teu4w=;
 b=mfaijL63Nd9n8WZ7j5609nLTuicBk6MbTzeRpkGwtxe6fPhNcgz5/KJgFPixHI3cz1
 B5u64rjQF6k9pqCkj6zwTura7doQSjWrejveDC13mdaM3DbCmJlwkpFBAWrqjl6uktxq
 wi5vsGSmka7hsI3tJMTycxE+5ZFT8w/gG9NIjElaoqcSf6HjjovUDhTWDZK2cFq84ona
 j9OXpRfIDNDibTzkI+GIgnT3tHj3UP+wLV1NzHWEgquIIWX6YoNA8HApuJ0O3MjIikRK
 X/iyHJHPvh26SCSIuylU/AHr6+ebNTxLwbGrp81fAqd9dpMmbaL3PDHGV4X1sOtydiBr
 Q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972464; x=1791577264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7qPKAWSfckJyJHNNtJXbCBKrySoQfPFDqXUJy/teu4w=;
 b=uJle/0GKGWhgAbmyeuQrGbuqSBhO+OmrrNkOM4yUhwn9FF6Dzhec9WXlEvi3tGwLXx
 sXi1wf5diUlhAVu4hvOfMs8l3tb9m6usIkxbylrq2iMVt/pyyVBEIYVP0nXtVPqcYaaE
 WAP004i7lX6lHpBOGN+AVnRhwL0db00pjaqblq3dTnI6QNYMxq38FKN2RiFSqACfUMRC
 /BFKYdcLgrO86xCVkqRQ5OofH+iVls129Y2tm8PILVFEEonK9RLeaCj4bYcsSW6nFhUq
 bOwa7afmV9bDuPcN+5ZBOWh47FqqODO6PlzbnxdHnoe6ldhwHzJl633Yfz544kxgyYKP
 eBmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZDE6fevpoXKq5R6nu4606sqhXMxPacCfXqZzff74xCPqbXztafES7KJBGXxYoBIQO70TS+eADXQ==@nongnu.org
X-Gm-Message-State: AFq9FYLQqrnFey8A54TcGDHe3nB0IdxTfqAKBErPlf4+JA8HIVT+Mhxy
 rcu9cdRQ/yH3tV4b0w8+NAvEcOAYaD2dJ8Ki3hMV+USfejUWLe5akK7HpDYMjmmgqmk=
X-Gm-Gg: AYBFou2S3h8JwmkBPnURoBv4D3bt4lP67HDatko5qM0UdyHBkrhzDXIlaz3a2NeiJXA
 WLTzDmzfydvMn/fS0fRzu/4KllCwtJW5FI51qH0qrWi/bUjpobco3yBNaMcXUcl2JQJVbFvLi2n
 DUh2hMHPz2YjMyFgcSe+Ry3hkzo/xPPbL2Aa5kVIYm8Ck1/FBSU7yGljeeo3uS4gAKjpzvwhzTs
 wrlkc3fgvK+vwPSouJPI2lSg+31tqJkLpn984CQbTWQTcaUHtH3S9gBhfXhvN5AWNOJHxwS/Yfr
 lICynAsi8ZHIDFtMgbysVoBMaDQ0rlmyJ7IBd2sudUwTa7+VpgmdNDTBgJG+JiXl6gaPCVpfm8N
 QIR2jR6e266mNADbiVE1rTkJ1atxgbPB0LM3pot3EbKiq400DlQXR0WPvsH8bbKst8ToyxVIRaS
 1bgFKNSQSDrnQ/GWMykn3b+bRmvRgVNd7FdVgniXC6FFV/Q5jpF1TbFYWpuckDtCkLVn3dZWSug
 THIDe/+g/5TkSGR6BV2bitC
X-Received: by 2002:a17:902:f681:b0:2dd:ad74:ac1c with SMTP id
 d9443c01a7336-2e510562dfcmr4955525ad.23.1790972464350; 
 Fri, 02 Oct 2026 13:21:04 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:21:03 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 19/22] target/arm/kvm-rme: Add DMA remapping for the shared
 memory region
Date: Fri,  2 Oct 2026 14:20:23 -0600
Message-ID: <20261002202026.1204110-20-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

In Arm CCA, the guest-physical address space is split in half. The top
half represents memory shared between guest and host, and the bottom
half is private to the guest. From QEMU's point of view, the two halves
are merged into a single region, and pages within this region are either
shared or private.

Virtual devices implemented by the host are only allowed to access the
top half. For emulated MMIO, KVM strips the GPA before returning to
QEMU, so the GPA already belongs to QEMU's merged view of guest memory.
However DMA addresses cannot be stripped this way and need special
handling by the VMM.

When emulating DMA the VMM needs to translate the addresses into its
merged view. Add an IOMMU memory region on the top half, that
retargets DMA accesses to the merged sysmem.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c         |   2 +
 target/arm/kvm-rme.c  | 106 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm-stub.c |   4 ++
 target/arm/kvm_arm.h  |  10 ++++
 4 files changed, 122 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7accb9f55ec8..d915d80db50b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3320,6 +3320,8 @@ static void machvirt_init(MachineState *machine)
                                vms->fw_cfg, OBJECT(vms));
     }
 
+    kvm_arm_rme_init_gpa_space(vms->highest_gpa, vms->bus);
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 22c8afe21505..f53927c87076 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -11,11 +11,13 @@
 #include "hw/core/boards.h"
 #include "hw/core/cpu.h"
 #include "hw/core/loader.h"
+#include "hw/pci/pci.h"
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
+#include "qemu/units.h"
 #include "qom/object_interfaces.h"
 #include "system/confidential-guest-support.h"
 #include "system/kvm.h"
@@ -24,6 +26,23 @@
 #define TYPE_RME_GUEST "rme-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
+/*
+ * Realms have a split guest-physical address space: the bottom half is private
+ * to the realm, and the top half is shared with the host. Within QEMU, we use a
+ * merged view of both halves. Most of RAM is private to the guest and not
+ * accessible to us, but the guest shares some pages with us.
+ *
+ * RealmDmaRegion performs remapping of top-half accesses to system memory.
+ */
+struct RealmDmaRegion {
+    IOMMUMemoryRegion parent_obj;
+};
+
+#define TYPE_REALM_DMA_REGION "realm-dma-region"
+OBJECT_DECLARE_SIMPLE_TYPE(RealmDmaRegion, REALM_DMA_REGION)
+OBJECT_DEFINE_SIMPLE_TYPE(RealmDmaRegion, realm_dma_region,
+                          REALM_DMA_REGION, IOMMU_MEMORY_REGION);
+
 typedef struct {
     hwaddr base;
     hwaddr size;
@@ -34,6 +53,10 @@ struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     Notifier rom_load_notifier;
     GSList *ram_regions;
+    uint8_t ipa_bits;
+
+    RealmDmaRegion *dma_region;
+    AddressSpace dma_as;
 };
 
 OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
@@ -217,3 +240,86 @@ static void rme_guest_init(Object *obj)
 static void rme_guest_finalize(Object *obj)
 {
 }
+
+static AddressSpace *rme_dma_get_address_space(PCIBus *bus, void *opaque,
+                                               int devfn)
+{
+    return &rme_guest->dma_as;
+}
+
+static const PCIIOMMUOps rme_dma_ops = {
+    .get_address_space = rme_dma_get_address_space,
+};
+
+void kvm_arm_rme_init_gpa_space(hwaddr highest_gpa, PCIBus *pci_bus)
+{
+    RealmDmaRegion *dma_region;
+    const unsigned int ipa_bits = 64 - clz64(highest_gpa) + 1;
+
+    if (!rme_guest) {
+        return;
+    }
+
+    assert(ipa_bits < 64);
+
+    /*
+     * Setup a DMA translation from the shared top half of the guest-physical
+     * address space to our merged view of RAM.
+     */
+    dma_region = g_new0(RealmDmaRegion, 1);
+
+    memory_region_init_iommu(dma_region, sizeof(*dma_region),
+                             TYPE_REALM_DMA_REGION, OBJECT(rme_guest),
+                             "realm-dma-region", 1ULL << ipa_bits);
+    address_space_init(&rme_guest->dma_as, MEMORY_REGION(dma_region),
+                       TYPE_REALM_DMA_REGION);
+    rme_guest->dma_region = dma_region;
+    rme_guest->ipa_bits = ipa_bits;
+
+    pci_setup_iommu(pci_bus, &rme_dma_ops, NULL);
+}
+
+static void realm_dma_region_init(Object *obj)
+{
+}
+
+static IOMMUTLBEntry realm_dma_region_translate(IOMMUMemoryRegion *mr,
+                                                hwaddr addr,
+                                                IOMMUAccessFlags flag,
+                                                int iommu_idx)
+{
+    const hwaddr address_mask = MAKE_64BIT_MASK(0, rme_guest->ipa_bits - 1);
+    IOMMUTLBEntry entry = {
+        .target_as = &address_space_memory,
+        .iova = addr,
+        .translated_addr = addr & address_mask,
+        /*
+         * Somewhat arbitrary granule for users that need one, such as
+         * address_space_get_iotlb_entry(). Should be relatively large to
+         * avoid frequent TLB misses. It can't be larger than memory region
+         * alignment (eg. address_mask) because that would mask the whole
+         * address, preventing vhost from finding the correct memory region.
+         */
+        .addr_mask = 4 * KiB - 1,
+        .perm = IOMMU_RW,
+    };
+
+    return entry;
+}
+
+static void realm_dma_region_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    /* Nothing is shared at boot */
+}
+
+static void realm_dma_region_finalize(Object *obj)
+{
+}
+
+static void realm_dma_region_class_init(ObjectClass *oc, const void *data)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(oc);
+
+    imrc->translate = realm_dma_region_translate;
+    imrc->replay = realm_dma_region_replay;
+}
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 5fde96f9b281..e5af5d20367f 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -42,6 +42,10 @@ bool kvm_arm_el2_supported(void)
     return false;
 }
 
+void kvm_arm_rme_init_gpa_space(hwaddr highest_gpa, PCIBus *pci_bus)
+{
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index d95381c13afa..b4a293911f71 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -250,4 +250,14 @@ char *kvm_print_register_name(uint64_t regidx);
  */
 void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
 
+/**
+ * kvm_arm_rme_setup_gpa
+ * @highest_gpa: highest address of the lower half of the guest address space
+ * @pci_bus: The main PCI bus, for which PCI queries DMA address spaces
+ *
+ * Setup the guest-physical address space for a Realm. Install a memory region
+ * and notifier to manage the shared upper half of the address space.
+ */
+void kvm_arm_rme_init_gpa_space(hwaddr highest_gpa, PCIBus *pci_bus);
+
 #endif
-- 
2.43.0


