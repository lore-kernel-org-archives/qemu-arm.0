Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4889645njc;
        Fri, 8 Nov 2024 04:56:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+D8v82KRmMvIai9gwAC/HnGbTNFFLHhb4TO9oEhQE6RW2Ltgrg3XSKwqc/W0miM25liwdcZaIIiThSg==@linaro.org
X-Google-Smtp-Source: AGHT+IHYMmjYIpDWUgZr6ai1f57h3xBJv5+PCAf9jtgt9SG6zUQkI3ltyMvdc3KPxUJbTKIX/I/Z
X-Received: by 2002:a05:6902:2b85:b0:e20:25bb:7893 with SMTP id 3f1490d57ef6-e337f8f0f5amr2946441276.46.1731070579726;
        Fri, 08 Nov 2024 04:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731070579; cv=none;
        d=google.com; s=arc-20240605;
        b=RK31NtCsjAyv/GJ4N/jfzPX8NCrSZ0bqHyjmZSJTziIqc+pcuOZ3Ta6qFguwwFSpKY
         V222U/iFpmsyKqqIHQWCUKEgVnBABw6jerYVEoUwywg6UWgz2JlP9ViLaHC7MUVDbT3s
         1lArhgzyj91OUcN2RC4dpxj+ZagGkb20HOEdd6dGMsveLquOlRKql8t1o0NE0WtbYm75
         R0G5810EFgDYzDHn5SVzp3jJpaU7ZML2hSUgC1sNn6keiUHMuIye2UOON19qZxqMKP6S
         x8xsSF1Uw5dERXZOTqke7YmEM80S4KAD64T2BQ9G/RX22d7zUwog4+8r5NISBiCdhDrJ
         y7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=/FJB/ajS3FFVFeyEPyFfS3vmKMqrxCvHGvaARE2NkLc=;
        fh=cBv4SKPzbf4CEhFYoUFnssX5GAjcCEGzof5+BStAs6s=;
        b=VKmkDFfmNFBMxOEY6HLq5aj6kZl7WdKkoWNpT6tEOzmkqlXG9FIg76YvBHL3RnKmkJ
         JKrW2XQRlM5pCvu0HVMIcRWzmCo/unpGQdtMrcgcWT+jMzm3BiGP5kfQOoNkm3yUQIVc
         wmo3J/9I4QIXaH6RnO9vlYLO7xz3ZWWYEfYsZwALknKgF8akABufHLSFS2b9U59Bbklu
         xacXCxGubPXyjjJRrzrYhu0ohJdxoHKSX4ZMz1UHLG4CLaVt4wjc65BRhlsRm0c5j/L6
         HdebX0Gz2exLfPnbnSrR0BeK5SkXaz92j+Qg9NzcieisGHB68jv5Qd35akJVzPLLgHoi
         pfXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6c58fesi42337911cf.666.2024.11.08.04.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 04:56:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9OX1-0004zK-V1; Fri, 08 Nov 2024 07:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t9OWt-0004xh-Nx; Fri, 08 Nov 2024 07:55:59 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t9OWs-0006ek-AJ; Fri, 08 Nov 2024 07:55:59 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XlJmG1SqFz6K9Yf;
 Fri,  8 Nov 2024 20:54:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 409A9140133;
 Fri,  8 Nov 2024 20:55:49 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 13:55:43 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH 1/5] hw/arm/virt: Add an SMMU_IO_LEN macro
Date: Fri, 8 Nov 2024 12:52:38 +0000
Message-ID: <20241108125242.60136-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7tbge6NZhhiv

From: Nicolin Chen <nicolinc@nvidia.com>

A following patch will add a new MMIO region for nested SMMU instances.

This macro will be repeatedly used to set offsets and MMIO sizes in both
virt and virt-acpi-build.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c         | 2 +-
 include/hw/arm/virt.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 719e83e6a1..780bcff77c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -174,7 +174,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_UART1] =              { 0x09040000, 0x00001000 },
-    [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ab961bb6a9..46f48fe561 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -47,6 +47,9 @@
 /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
 #define PVTIME_SIZE_PER_CPU 64
 
+/* MMIO region size for SMMUv3 */
+#define SMMU_IO_LEN 0x20000
+
 enum {
     VIRT_FLASH,
     VIRT_MEM,
-- 
2.34.1

