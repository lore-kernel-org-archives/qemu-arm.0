Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp460017lfc;
        Thu, 27 Aug 2020 04:05:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7XoyaWKtislSK9z/lSCg9CPaOAc66s4HD36q+4CXpWvtw3v4ZmCxxw7kf8mzji82JitkP
X-Received: by 2002:a25:aae6:: with SMTP id t93mr28996147ybi.465.1598526351339;
        Thu, 27 Aug 2020 04:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598526351; cv=none;
        d=google.com; s=arc-20160816;
        b=1KApkw3ktLAwj1Il+lVf3y5SxOPeEqoujs7DJTQzYutKKEdxNXF/eF8x9w2Cev2RCy
         fv33KdbV7xB1KCW8LNbXLC1M0vMktK6tCs8dWzIg3xWKipnt882R7pUTBuQeYnBriS6n
         0z+5KgnqAanCz4j9StCMK8rsP66R77CBG66CZxH/NpfW4ggLOlPcBngLrATXiVixNBS0
         6ohO9GrXBJ3EJUG26HHcHb/2ADnVoVBFdBtcC3oOXO/7CSc8Q+xjvBQmNblB56FHpu6u
         MVIl2gfNOyigQLWLN2iiBBT8xQOVWAoYfGlfHD8lV5Ea2jzFBlJ8z4t93huyjV/mxvLk
         IoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=F7w0cdQGqE+alPXXcYsyddG5YfckdHtI63p3drBcw+E=;
        b=RDyIJPtIda6j/oHz5hOINXFpZWpFdMOq81P63bquJ338ytK6+MEUbBp/aUFKNb7Txg
         CkN4FisBmvy17g2jVA0L9d/kxEB479Gxf7ATpEzdiGAbqMnXgxaXdqS/RVsPksugpxXM
         JMmzhe2/X82BltJxxByqG6ZMEtmvrQX+huLDRgzyDG1Nzp5v7r8hRnk/fvWmFh8RTXXp
         mazvIQziDYstMkFv5pUbQnzrma/dSYUFF9jJsvPWR5u9u2mSPcMzAqlWdBTUIF8Oh1aD
         4rsv3XuWa3Xj7T4NTJQDkhrBY41S3WlJx7mfvzY4lwniMA20QIu0P1bX54jVpfde6tU7
         tpZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f66si1975353ybf.369.2020.08.27.04.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 04:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBFj4-0005d6-M8
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 07:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFi8-0004S0-IU; Thu, 27 Aug 2020 07:04:52 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:55878 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFi6-0007YW-MO; Thu, 27 Aug 2020 07:04:52 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7A12B32A161703756873;
 Thu, 27 Aug 2020 19:04:45 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 19:04:24 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 01/10] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
Date: Thu, 27 Aug 2020 19:03:02 +0800
Message-ID: <20200827110311.164316-2-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 05:22:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>, pannengyuan@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Li Qiang <liq3ea@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLEWkkQdxSnY

Clang static code analyzer show warning:
hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
    madt = acpi_data_push(table_data, sizeof *madt);
    ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
---
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org
---
 hw/arm/virt-acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 91f0df7b13..f830f9b779 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -633,12 +633,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int madt_start = table_data->len;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
-    AcpiMultipleApicTable *madt;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
     int i;
 
-    madt = acpi_data_push(table_data, sizeof *madt);
+    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
 
     gicd = acpi_data_push(table_data, sizeof *gicd);
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
-- 
2.23.0

