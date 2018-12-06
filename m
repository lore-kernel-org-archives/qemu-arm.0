Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10868413wrt;
        Thu, 6 Dec 2018 09:09:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VT0LfyVZeGp05Xp8vRTWxPq4c5LBqGMlkZ61+SUmS1HUmJ8oyN43UU32iVBMyy2zZ35bcK
X-Received: by 2002:ae9:f212:: with SMTP id m18mr26269304qkg.5.1544116158322;
        Thu, 06 Dec 2018 09:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544116158; cv=none;
        d=google.com; s=arc-20160816;
        b=OjIv9UFoVHepZfYs3oSWcI+zmn2Z+ogGJpa5MJnwHgQ11YCdcATvH9YjoAT1UfRiAA
         66adq1yVklljUiWAVureYjiHauTBcxDXwFMS+XnTPXyfhA5Q2jpGAZBooOf1crJCQLg0
         uUD1/utx3g67GiROAbAJXfDLdpdO/hjiwNMVAsPXQSsjeHSI0mKuungB6tZXapMqktI/
         PGv0VhbdOzS8xu/3RnBzPdE8lcXvyj1+FBWt+GguB7YMPB9qX/n0HSXGViH8ccilLSX6
         bPGz22yFnsjkgAWnYhBrRctSZrtQ4bCoNw/KxmtCm70lEbqWULR3wo218CIzDRr8SAWa
         EE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=A9ELnoB4X6y0P5h/QTe/LBh5DRk8yKlFmAIDxMdGJhY=;
        b=Ic2HLmDp30rMTQuTK+h9fFvYxlJyzppxmRFKsPqkc6fTG9j2MB3A75iX8+pWpDZ3Df
         Ql2GeLU0mJlDLe7afEh37kb7eeb+R7q5RKegfS7q6z/HeSMnGZodXs2lLU9ccgS0JfGM
         dK4sSoMPEBz/V7bmrcckiPofk4ksEVNGrEbtmXUO7yDTEyXyKPJ7e69AsHL5fZpMuFa2
         o/uBRE3hTSc3er1a5XI5jCaU4IsPSB/LFcRuHFjyS9uad3nB681G6iEkQS2S5LQbIYFz
         gzoaiTjiCqd1efT/ykqSZLVrYJt+ulmLUCY915kUrceYgCVKQJJi7OMKmqH4atNEii+X
         frWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a15si583438qtm.94.2018.12.06.09.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 09:09:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUx9J-00016m-Mf
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 12:09:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gUx7s-0008S0-4H
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 12:07:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gUx7l-0002lU-60
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 12:07:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gUx7k-0002kQ-VN; Thu, 06 Dec 2018 12:07:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAABA3084042;
	Thu,  6 Dec 2018 17:07:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D2675D9D6;
	Thu,  6 Dec 2018 17:07:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, shannon.zhaosl@gmail.com
Date: Thu,  6 Dec 2018 18:07:32 +0100
Message-Id: <20181206170733.7469-2-eric.auger@redhat.com>
In-Reply-To: <20181206170733.7469-1-eric.auger@redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 06 Dec 2018 17:07:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.0 v2 1/2] hw/arm/virt-acpi-build: Set
 COHACC override flag in IORT SMMUv3 node
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tGnQopapA4Y5

Let's report IO-coherent access is supported for translation
table walks, descriptor fetches and queues by setting the COHACC
override flag. Without that, we observe wrong command opcodes.
The DT description also advertises the dma coherency.

Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

---

- change the commit title
- addition of new fields (pxm and id_mapping_index) done in a
  separate patch
---
 hw/arm/virt-acpi-build.c    | 1 +
 include/hw/acpi/acpi-defs.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb697c..aa177ba64d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->mapping_count = cpu_to_le32(1);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
+        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
         smmu->event_gsiv = cpu_to_le32(irq);
         smmu->pri_gsiv = cpu_to_le32(irq + 1);
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023968..532eaf79bd 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -628,6 +628,8 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
+#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
+
 struct AcpiIortSmmu3 {
     ACPI_IORT_NODE_HEADER_DEF
     uint64_t base_address;
-- 
2.17.2

