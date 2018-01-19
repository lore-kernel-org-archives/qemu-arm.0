Received: by 10.28.71.27 with SMTP id u27csp828493wma;
        Fri, 19 Jan 2018 06:51:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBos2ia05ijWIe2xXBaBDgYnzPosoDl1JWRezDIqMNbfYVPLkuc7jb3k0Af1ApUQnvWHLJiyy
X-Received: by 10.37.244.13 with SMTP id q13mr10503182ybd.308.1516373469068;
        Fri, 19 Jan 2018 06:51:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516373469; cv=none;
        d=google.com; s=arc-20160816;
        b=L7ab3i0wtF2oLByxGi2pjJ6A0eoks+t3Um/zgNTZ51lRr+APEbFQ/Z2gmQ/6t2UeZC
         ut/eyfsaikQXtbZcNQpUFp1ZZ/UE9CxzGmKOIn/sQ9bvufEhafGl0jtOkWWSHwv2O4rV
         vcJcBUWLSPQK27xmk+YHx7MovDW3beeNZ3XosO1I5JsH3tjXj2PY/KoLbwhIiXmQk1+Q
         4frbRHVRobXqFchtzjSaplVO0xYEcGUd27UcnI+7170kivuwFxJc29wSnfVLc/pmdcAf
         wjjD6Qd0dhRVdw5R4L3tokX59FWFsVWs8ysl/vg8a6W9hE+k2Us+sl8nfp2N2MQodNQ3
         m9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bpIR84TfsCwf0+y42TGSX/t33pwiLqxqE+w4Xnv89Yk=;
        b=H8B47l08hBZCq8MX3VS7ccB4hhewH/smLX/Z2rxMcFil52y3nzhzolY9fzg+9pVTF4
         dP9MUSQdHEhlcZUzzv01dvMJQ1YqOoOTZWvmOPt9TA3Kb+4S2+cBHp3S/6trEQHN6LCH
         4F0LrQ5gTM0HXAnF4ass9e6YF7AULyUd5FQXauviRF1FBVvHBadboObfgc/AVwUf1QEC
         YeV8xs760+Z4tDm7Jp9ojc68o7S3yKpqTfr0dzEbDwgnfooER6ttK4Mo8AGmXlQ6u1c8
         riKuZk0Odiupxtb+xX/4rtJX4Ao63XghD/cu34SAaFgOVXW8cyCUsSyVoXBIGhF+73Ng
         U7Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si2524615ywf.291.2018.01.19.06.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 06:51:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecY0a-0004na-Di
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 09:51:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY03-0004kx-VP
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 09:50:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY03-0006Zr-1i
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 09:50:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecXzx-0006Y4-Nu; Fri, 19 Jan 2018 09:50:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2E537CB84;
	Fri, 19 Jan 2018 14:50:28 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBE1D5C885;
	Fri, 19 Jan 2018 14:49:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:48:54 +0000
Message-Id: <1516373355-305-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 19 Jan 2018 14:50:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 01/22] machine: Add a get_primary_pci_bus
 callback
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ikIOlhhf59wH

After e492dc5a267e "pci: Eliminate pci_find_primary_bus()" we don't
have an easy mean to retrieve the primary bus of a machine. This will be
needed by virtio-iommu-device which is bound to be dynamically instantiated
in at least ARM virt and Q35 machines.

Adding a get_primary_pci_bus() callback allows to retrieve the PCIBus the
iommu is connected to.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

This is a temporary solution until we decide whether the
virtio-iommu-device should be instantiable through a -device command
line or through a machine command line, as already suggested by Peter
(for vsmmuv3 though).
---
 include/hw/boards.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 156b16f..3a65701 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -151,6 +151,8 @@ typedef struct {
  *    should instead use "unimplemented-device" for all memory ranges where
  *    the guest will attempt to probe for a device that QEMU doesn't
  *    implement and a stub device is required.
+ * @get_primary_pci_bus: return the primary PCI bus or NULL if there are
+ *    several root buses
  */
 struct MachineClass {
     /*< private >*/
@@ -207,6 +209,7 @@ struct MachineClass {
                                                          unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
+    PCIBus *(*get_primary_pci_bus)(const MachineState *ms);
 };
 
 /**
-- 
1.9.1

