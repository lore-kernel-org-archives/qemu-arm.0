Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp174132njk;
        Thu, 20 Feb 2025 08:15:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVASqMdKLUHh2Ut2QrIAc+ylRehzRf8MeAO/rU3YoKA3DMZiNJOQkTw0acevsMMVAGE4/ArH5cFd+SSzg==@linaro.org
X-Google-Smtp-Source: AGHT+IFFvlRhdMPwCTIJQoN7XRLMS6Btg8peC4oEd2+eAvItIkUDcM6OCDLCiOMEUsFsj0Qai3he
X-Received: by 2002:a05:6214:f2d:b0:6d8:960e:5785 with SMTP id 6a1803df08f44-6e66cca3649mr368253646d6.13.1740068131188;
        Thu, 20 Feb 2025 08:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740068131; cv=none;
        d=google.com; s=arc-20240605;
        b=RNbvuRX9zuVd44PT8QPtV7AhPPASU2mItuvcObL2K9f6+vlI+AyF37bHDb4zu3v7js
         hIusg0fyiapPbxxSiRWVWNDWywrv6mMVqWwNDQF5NbrfBGNjbhYLYtlBTdQPfmwDyXtU
         PiNAshGvZelArSOLJCuXE7bsuP+mSlrEyejO/woswqTCai0MFpRhR+/DTPgz29om0ajQ
         ST15RT7Lb31dbsl59i3vcI1UdaXymIz9S0bOsM5pyd8JGWZoNmQlndTe9rCKX6ZGvEE/
         GmSRebfTOJh0C8Xbl56EPkujBqq/vEZulJhPOJOc3Js6CawUsEFsrW0SyOUJ6dEyL/nc
         R60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GPcuP887g9uPdc+DuVuyqpmDVpNdrQdWC0SI6zKSAgE=;
        fh=ARoT4oWY30c1kBopAsHUyi2RT2lOyN+WElwcOQcYM9k=;
        b=bLo6dqXLzZEy17TmCBx58QQbuSqevEM8wGc8ozEWPF4T0nbdO7z3wYOLih6sSpXNp/
         iIUWQWqARVfq0+7mblxWzChN7GwJWGpUiuyU3wIcMtPbWYsutiP7+qcDtkZKP/+8td6+
         Ue9nMjTg0LBrU7cIRd7hD4br5HOLYOq37oH398LbTxpjSv+whfAyqcDMsKRYunRcOE/6
         ekYr9xogd7HuZoLnm5uXSHHK9LJyPBz9wq9m4xd58YOuHnUoKAi3Ag5SA16JhHwvYtyk
         NEzooEmhtChKuyDIgaIeu3DiAY6Ge+80v/gWMwMDYvXMpM3YIivBmza8NFl5kEB5hoL0
         Q0QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3hZfRwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a1db0si149311556d6.234.2025.02.20.08.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 08:15:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3hZfRwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl9CY-0002WA-U8; Thu, 20 Feb 2025 11:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1tl9CW-0002UM-IX
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:15:00 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1tl9CT-0007Lv-AU
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:15:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso658595f8f.3
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740068094; x=1740672894; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPcuP887g9uPdc+DuVuyqpmDVpNdrQdWC0SI6zKSAgE=;
 b=K3hZfRwP8SbfHPw8G7vDlQ2/rOwEytVzZaGJWNAK6FGBe2cj5EVa4r6m+0IcOvqwU4
 E2WlEViuqe/G56SxHpIF6gz2HoVAn9m87BlBoYcfzKYqgtGxgLucC1gKXHihnmI4hp2v
 AnygA6X21DsMEh//uIwpVeWzQ1AFrFa15GcXviIHSs58PN5TjJPt71XlanR4Sr3X4j0T
 ZeY/jxrwzTFcvnElGj/VqN2//RaCX5t73gJ2Qaf6KiB9hi5hA16xJMPJg6Wbgix1eLUU
 Ak55GhQ6U+f3HjDskSqkSl7tzoSJPUGWpWYfaci8DyuLvomNJNHUUY4XkSnoPEcIutAl
 jIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068094; x=1740672894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPcuP887g9uPdc+DuVuyqpmDVpNdrQdWC0SI6zKSAgE=;
 b=RZ1JYRmSxgEp2W/8cG9jJ3KSGJ7oyJed8tNgZc7aKwS/uWmJV0cMCLEh9knyhnBsn1
 RpTT8pe2LDqyqT36MkJ8QImwKTwQPUhBnuZZ3g6YGH+LqtgBBJllAsmys1TylkSnyupq
 3Bc9DwRbJRcVD90u1u3RGVEi+i2y5MNfeFEunsoPYJ+K1f7ooTSFg7LcRAieAN8zeeAa
 3vjL94TVYNnEDsHcScYkr2Utcg0A5rlBXDgpyLK517w5PKGeXJ9C8jnyr2LZaxflICeE
 aLOjHc/85TOXI/CIl+YGw/P5OS99kFUrxGQcYABEWaXcLEz8KlaN/2BItmIBmoReIeKi
 FEVw==
X-Gm-Message-State: AOJu0Yy9HoQrAd9Wv1b2mW9EN7TQunkVjMmU+pXB1Vt4BvNiqf87aR1g
 g3CzK32c0L08uIZNtHYrUZc+7fwICl1hukTZN8JlUgHMUgvL/680JGw/uU6XK+o=
X-Gm-Gg: ASbGncv+1ejHvaK95cOgd8ffW4UI70KD1sp+YzenqNGDi/ZtDDETNpWBZ87vhD4X6kw
 jctyoVeADe6C/6fpKTiR0UC1RukTzpKjluE/94SS3hFCAtoRvK0eMcafr3OsyZQ2Fox2GfThZXs
 t5X0jowic2zyHDCGG78MprARJJruMvp5q5qxveT4a9q00cwl0yrs0Qv7RdpEDMsupVTK5UMuPfH
 PLGwd4wx0A2ERFI8FKsWy+Pb3zRxfuQujpZpOZwPQ4g6hsF8gXPoJlon6p0QOUYNCOGo5OZSkrX
 M2d1ye3FtadGOS7n9IVX7HUM/zS4Ypvm5Q==
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id
 ffacd0b85a97d-38f33f34e0fmr16937055f8f.32.1740068094419; 
 Thu, 20 Feb 2025 08:14:54 -0800 (PST)
Received: from localhost.localdomain ([2.221.137.100])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259fe1efsm21197741f8f.97.2025.02.20.08.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:14:54 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC 2/2] target/arm/kvm-rme: Add DMA remapping for the shared memory
 region
Date: Thu, 20 Feb 2025 16:13:21 +0000
Message-ID: <20250220161320.518450-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220161320.518450-2-jean-philippe@linaro.org>
References: <20250220161320.518450-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +bOaTPbaNDJ9

In Arm CCA, the guest-physical address space is split in half. The top
half represents memory shared between guest and host, and the bottom
half is private to the guest. From QEMU's point of view, the two halves
are merged into a single region, and pages within this region are
either shared or private.

Addresses used by device DMA can potentially target both halves.
Physical devices assigned to the VM access the top half, until they are
authenticated using features like PCIe CMA-SPDM at which point they can
also access memory private to the guest.

Virtual devices implemented by the host are only allowed to access the
top half. For emulated MMIO, KVM strips the GPA before returning to
QEMU, so the GPA already belongs to QEMU's merged view of guest memory.
However DMA addresses cannot be stripped this way and need special
handling by the VMM:

* When emulating DMA the VMM needs to translate the addresses into its
  merged view. Add an IOMMU memory region on the top half, that
  retargets DMA accesses to the merged sysmem.

* when creating IOMMU mappings for (unauthenticated) VFIO devices, the VMM
  needs to map the top half of guest-physical addresses to the shared pages.
  Install RAM discard listeners that issue IOMMU map and unmap requests
  to IOMMU listeners such as VFIO.

The resulting mtree looks like this:

  address-space: vfio-pci
    0000000000000000-ffffffffffffffff (prio 0, i/o): bus master container
      0000000000000000-000001ffffffffff (prio 0, i/o): alias bus master @realm-dma-region 0000000000000000-000001ffffffffff

  memory-region: realm-dma-region
    0000000000000000-000001ffffffffff (prio 0, i/o): realm-dma-region

There are at least two problems with this approach: given that we use
the PCI bus master address space, a vIOMMU cannot install its own
address space at the moment. And since sysbus devices can't have an
IOMMU at the moment, DMA from non-PCI devices isn't supported.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm_arm.h |  15 +++
 hw/arm/virt.c        |   2 +
 target/arm/kvm-rme.c | 220 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index ede6a7138c..13f2d76e2a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -268,6 +268,16 @@ int kvm_arm_rme_vcpu_init(CPUState *cs);
  */
 void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size);
 
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
 #else
 
 /*
@@ -298,6 +308,11 @@ static inline void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
 {
 }
 
+static inline void kvm_arm_rme_init_gpa_space(hwaddr highest_gpa,
+                                              PCIBus *pci_bus)
+{
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d14f54e3be..c28b2cc3ac 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2456,6 +2456,8 @@ static void machvirt_init(MachineState *machine)
                                vms->fw_cfg, OBJECT(vms));
     }
 
+    kvm_arm_rme_init_gpa_space(vms->highest_gpa, vms->bus);
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index ad099bffbb..f21499f699 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -9,6 +9,7 @@
 #include "hw/boards.h"
 #include "hw/core/cpu.h"
 #include "hw/loader.h"
+#include "hw/pci/pci.h"
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
@@ -24,6 +25,35 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
+/*
+ * Realms have a split guest-physical address space: the bottom half is private
+ * to the realm, and the top half is shared with the host. Within QEMU, we use a
+ * merged view of both halves. Most of RAM is private to the guest and not
+ * accessible to us, but the guest shares some pages with us.
+ *
+ * For DMA, devices generally target the shared half (top) of the guest address
+ * space. Only the devices trusted by the guest (using mechanisms like TDISP for
+ * device authentication) can access the bottom half.
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
+typedef struct RealmRamDiscardListener {
+    MemoryRegion *mr;
+    hwaddr offset_within_region;
+    uint64_t granularity;
+    RamDiscardListener listener;
+    QLIST_ENTRY(RealmRamDiscardListener) rrdl_next;
+} RealmRamDiscardListener;
+
 typedef struct {
     hwaddr base;
     hwaddr size;
@@ -39,6 +69,12 @@ struct RmeGuest {
     RmeGuestMeasurementAlgorithm measurement_algo;
 
     RmeRamRegion init_ram;
+    uint8_t ipa_bits;
+
+    RealmDmaRegion *dma_region;
+    QLIST_HEAD(, RealmRamDiscardListener) ram_discard_list;
+    MemoryListener memory_listener;
+    AddressSpace dma_as;
 };
 
 OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
@@ -305,6 +341,7 @@ static void rme_guest_init(Object *obj)
 
 static void rme_guest_finalize(Object *obj)
 {
+    memory_listener_unregister(&rme_guest->memory_listener);
 }
 
 static gint rme_compare_ram_regions(gconstpointer a, gconstpointer b)
@@ -405,3 +442,186 @@ int kvm_arm_rme_vm_type(MachineState *ms)
     }
     return 0;
 }
+
+static int rme_ram_discard_notify(RamDiscardListener *rdl,
+                                  MemoryRegionSection *section,
+                                  bool populate)
+{
+    hwaddr gpa, next;
+    IOMMUTLBEvent event;
+    const hwaddr end = section->offset_within_address_space +
+                       int128_get64(section->size);
+    const hwaddr address_mask = MAKE_64BIT_MASK(0, rme_guest->ipa_bits - 1);
+    RealmRamDiscardListener *rrdl = container_of(rdl, RealmRamDiscardListener,
+                                                 listener);
+
+    assert(rme_guest->dma_region != NULL);
+
+    event.type = populate ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.perm = populate ? (IOMMU_RW | IOMMU_POPULATING) : IOMMU_NONE;
+    event.entry.addr_mask = rrdl->granularity - 1;
+
+    assert(end <= address_mask);
+
+    /*
+     * Create IOMMU mappings from the top half of the address space to the RAM
+     * region.
+     */
+    for (gpa = section->offset_within_address_space; gpa < end; gpa = next) {
+        event.entry.iova = gpa + address_mask + 1;
+        event.entry.translated_addr = gpa;
+        memory_region_notify_iommu(IOMMU_MEMORY_REGION(rme_guest->dma_region),
+                                   0, event);
+
+        next = ROUND_UP(gpa + 1, rrdl->granularity);
+        next = MIN(next, end);
+    }
+
+    return 0;
+}
+
+static int rme_ram_discard_notify_populate(RamDiscardListener *rdl,
+                                           MemoryRegionSection *section)
+{
+    return rme_ram_discard_notify(rdl, section, /* populate */ true);
+}
+
+static void rme_ram_discard_notify_discard(RamDiscardListener *rdl,
+                                           MemoryRegionSection *section)
+{
+    rme_ram_discard_notify(rdl, section, /* populate */ false);
+}
+
+/* Install a RAM discard listener */
+static void rme_listener_region_add(MemoryListener *listener,
+                                    MemoryRegionSection *section)
+{
+    RealmRamDiscardListener *rrdl;
+    RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
+
+    if (!rdm) {
+        return;
+    }
+
+    rrdl = g_new0(RealmRamDiscardListener, 1);
+    rrdl->mr = section->mr;
+    rrdl->offset_within_region = section->offset_within_region;
+    rrdl->granularity = ram_discard_manager_get_min_granularity(rdm,
+                                                                section->mr);
+    QLIST_INSERT_HEAD(&rme_guest->ram_discard_list, rrdl, rrdl_next);
+
+    ram_discard_listener_init(&rrdl->listener,
+                              rme_ram_discard_notify_populate,
+                              rme_ram_discard_notify_discard, true);
+    ram_discard_manager_register_listener(rdm, &rrdl->listener, section);
+}
+
+static void rme_listener_region_del(MemoryListener *listener,
+                                    MemoryRegionSection *section)
+{
+    RealmRamDiscardListener *rrdl;
+    RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
+
+    if (!rdm) {
+        return;
+    }
+
+    QLIST_FOREACH(rrdl, &rme_guest->ram_discard_list, rrdl_next) {
+        if (MEMORY_REGION(rrdl->mr) == section->mr &&
+            rrdl->offset_within_region == section->offset_within_region) {
+            ram_discard_manager_unregister_listener(rdm, &rrdl->listener);
+            g_free(rrdl);
+            break;
+        }
+    }
+}
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
+
+    pci_setup_iommu(pci_bus, &rme_dma_ops, NULL);
+
+    /*
+     * Install notifiers to forward RAM discard changes to the IOMMU notifiers
+     * (ie. tell VFIO to map shared pages and unmap private ones).
+     */
+    rme_guest->memory_listener = (MemoryListener) {
+        .name = "rme",
+        .region_add = rme_listener_region_add,
+        .region_del = rme_listener_region_del,
+    };
+    memory_listener_register(&rme_guest->memory_listener,
+                             &address_space_memory);
+
+    rme_guest->ipa_bits = ipa_bits;
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
+        .addr_mask = address_mask,
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
+static void realm_dma_region_class_init(ObjectClass *oc, void *data)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(oc);
+
+    imrc->translate = realm_dma_region_translate;
+    imrc->replay = realm_dma_region_replay;
+}
-- 
2.48.1

