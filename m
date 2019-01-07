Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3284468wrt;
        Mon, 7 Jan 2019 02:19:23 -0800 (PST)
X-Google-Smtp-Source: ALg8bN537TWqo7aMRGJIWlgm5LqGD7607LVWqucKb7uIfZKHYXGuTxriUOnnheIS8JDUCNlqssXC
X-Received: by 2002:adf:f091:: with SMTP id n17mr36218475wro.292.1546856363423;
        Mon, 07 Jan 2019 02:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546856363; cv=none;
        d=google.com; s=arc-20160816;
        b=AqmSB1oKsLytAtUutu0vSn/HmuD4S+0JULGm747dr8IErg05f8vMxHKlF8+/Y+wHy/
         3csJk/yZzvMIXWhFxHAyZX6oM/XWywNoH8nwVUngTVv3HggwIUVp3FKaKq8wZ4/iHalS
         3ZIYJUPv6+6Di8q2px3Q1I1A2z1Zj1tBmQvh5ffETTJAXXTHW6o4r6UnFJ7udIwBpguI
         7chEFgCNZQSc1vJ3w076m0+6Pmec5eO+gzZ4UJc3hpESBflx0/QoCTV2AXQZu25hzvzV
         etUeH/S0jEzskGXuzWjYdYW0UKl0xHLBEGa8vp5vAWyd47NqYqBdp8s12uZVCHjiWKW6
         NtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=w0C2rUUU4JpHw7epLI6QYWbfuFdqVsJWhnYDwGu7ouw=;
        b=n30Ii/yhDThk/ZxIpGQwoRMv8y9IfZf5BOlV5VaJzwpp0dEe0JdNDnDJfZuwVguZr7
         4UO1UOCak7QPS0IlKUoX5XNV+7DpQRJANqrOAFkMhNpJ0YczKcXJdzBjOLFGrvu3v8c2
         MIeb0Lo29nlYEgvODcXIUlZvvoRvTAMPGgPpmQZ8kfidup4avmvpeWjqJq9LSqzOoSBb
         jXiRinD2+Xwnyfu1KUD6qHGNuo6cirHzwbDu8zZ3inakPLPxma1jkd1Lzk0GHXjvfw3K
         dA0R6id1FJ9LMCKgJS2hNJKqWL+3kRTQvJYxyc7qK74LK8epTkNmCzskcJNPl85urrZZ
         v8gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h192si5102344wmg.145.2019.01.07.02.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 02:19:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggS0A-0005wb-IG
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 05:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ggRzu-0005vJ-IM
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 05:19:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ggRzt-0007zZ-Rl
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 05:19:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:18881)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ggRzt-0007yM-Mf; Mon, 07 Jan 2019 05:19:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 290C288312;
	Mon,  7 Jan 2019 10:10:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-249.ams2.redhat.com [10.36.116.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 050D5608C1;
	Mon,  7 Jan 2019 10:10:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, shannon.zhaosl@gmail.com
Date: Mon,  7 Jan 2019 11:10:41 +0100
Message-Id: <20190107101041.765-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 07 Jan 2019 10:10:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3] hw/arm/virt-acpi-build: Set COHACC override
 flag in IORT SMMUv3 node
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
Cc: drjones@redhat.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KITGa9YCgbaO

Let's report IO-coherent access is supported for translation
table walks, descriptor fetches and queues by setting the COHACC
override flag. Without that, we observe wrong command opcodes.
The DT description also advertises the dma coherency.

Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>

---
v2 -> v3:
- added cpu_to_le32
---
 hw/arm/virt-acpi-build.c    | 1 +
 include/hw/acpi/acpi-defs.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 95fad6f0ce..04b62c714d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -418,6 +418,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->mapping_count = cpu_to_le32(1);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
+        smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
         smmu->event_gsiv = cpu_to_le32(irq);
         smmu->pri_gsiv = cpu_to_le32(irq + 1);
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 5021cb9e79..df37f68757 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -623,6 +623,8 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
+#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
+
 struct AcpiIortSmmu3 {
     ACPI_IORT_NODE_HEADER_DEF
     uint64_t base_address;
-- 
2.17.2

