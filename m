Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp621839wrd;
        Sat, 1 Sep 2018 07:28:51 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbDEYSlWKG+n0ux7dcWfM7Z/gE3qTP8hJcCztdUjy9snvEWj7omZPVgxqaXqOp9s2ymFTPO
X-Received: by 2002:a37:c987:: with SMTP id m7-v6mr19487736qkl.324.1535812131463;
        Sat, 01 Sep 2018 07:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812131; cv=none;
        d=google.com; s=arc-20160816;
        b=TnMI7PWn7EZLPnEvgjdqxwL+tA+rW+cEGiPjrK/hrb8HEDcOSpnHiUfqZFCGy1CGN2
         gpsdREKBkihCpiTi+WeSw1+zBc05H0MrZZwmqEP1a/Txfxock8nt78lLzIOTgGPM4pAw
         YvXoQQQXBkQsI6COlRK1zNIMvtvWZ+QFCcnSZDUW/rLkG/vrXNhtv87ee6KBarbaXUTd
         PrRgHFVvzRd7ue8LuPKzaWPw7wjr5Q9KQDU4kVgiqtnDb2Jm01JCvSscc4uBQOaX73o5
         z8qIPg64HNYDw7jJvKNkK11IpqCpwfCgKr3z8hFTgqwGypscbi9u6coeW5hQpvEJMi1d
         thFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2DFiN3Vvfmxu45A1nfprxy6HgDXtS1oeXdIUrFScx/A=;
        b=P4c5e8YBc3lx9AjDFtSzbuTRNGmdBQG4HCdOk0OqRLknH1BjX7Xwst012IDwJhP/cw
         Kqm9Huand9bEDix+iyblEi9xGR9jxBtXmdAW0vv9ArbM/3ki9b+q8SXvS0v5CeXcRh9L
         VjuY5NHL++7/XIVxa+6aqAlM+e1MNv2EQ45wnV6h+u8661l9lh4wOpmtp7p8d1NUm/z7
         4PziqcO/dwTFMAIi0odCd68xUPQHWp+P6bEsRPxcSTR2Wf8bkw3MpZ2eb+FvCJ4HM1ok
         b7R1eo6VZdls7QjpmuJw5udnoYxdOeDLHdzWaGRvUF0ptJ5GARyxcD5sbT5P73ke8FF0
         DfrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5-v6si48859qvp.16.2018.09.01.07.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6tO-0000jn-S1
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:28:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6q8-0005sK-9I
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6pA-00063M-O5
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:24:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51182 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6p9-00061T-8P; Sat, 01 Sep 2018 10:24:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6111885748;
	Sat,  1 Sep 2018 14:24:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A76C2166B41;
	Sat,  1 Sep 2018 14:24:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:10 +0200
Message-Id: <20180901142312.11662-19-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:24:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:24:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 18/20] target/arm/kvm: Notifies IOMMU on MSI stage
 1 binding
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RRA+WIWM8H/q

When the MSI route is setup, we know the MSI IOVA and
the doorbell GPA . At that point we can communicate this guest
stage 1 binding to the host. Then the host will be able
to construct a stage 2 binding taking as input address the
doorbell GPA.

We also directly use the iommu memory region translate() callback
as the addr_mask is returned in IOTLB entry. address_space_translate
does not return this information.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

TODO: access to as->root field may be cleaned later on
---
 target/arm/kvm.c | 46 ++++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 65f867d569..6f905215b8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -661,41 +661,35 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
     AddressSpace *as = pci_device_iommu_address_space(dev);
-    hwaddr xlat, len, doorbell_gpa;
-    MemoryRegionSection mrs;
-    MemoryRegion *mr;
-    int ret = 1;
+    IOMMUMemoryRegionClass *imrc;
+    IOMMUMemoryRegion *iommu_mr;
+    IOMMUTLBEntry entry;
 
     if (as == &address_space_memory) {
         return 0;
     }
 
+    iommu_mr = IOMMU_MEMORY_REGION(as->root);
+    imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
+
     /* MSI doorbell address is translated by an IOMMU */
 
     rcu_read_lock();
-    mr = address_space_translate(as, address, &xlat, &len, true,
-                                 MEMTXATTRS_UNSPECIFIED);
-    if (!mr) {
-        goto unlock;
-    }
-    mrs = memory_region_find(mr, xlat, 1);
-    if (!mrs.mr) {
-        goto unlock;
-    }
-
-    doorbell_gpa = mrs.offset_within_address_space;
-    memory_region_unref(mrs.mr);
-
-    route->u.msi.address_lo = doorbell_gpa;
-    route->u.msi.address_hi = doorbell_gpa >> 32;
-
-    trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
-
-    ret = 0;
-
-unlock:
+    entry = imrc->translate(iommu_mr, address, IOMMU_WO, 0);
     rcu_read_unlock();
-    return ret;
+
+    if (entry.perm == IOMMU_NONE) {
+        return -ENOENT;
+    }
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    memory_region_iotlb_notify_iommu(iommu_mr, 0, entry);
+
+    trace_kvm_arm_fixup_msi_route(address, entry.translated_addr);
+
+    return 0;
 }
 
 int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
-- 
2.17.1

