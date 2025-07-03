Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp392269dyc;
        Thu, 3 Jul 2025 01:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmw2vTu5Rh20SP3pPyWJLIoud7C7kpQtgGm7w8AeBvxX0t6Xadcp/oDOsB9eDlc/ZXnfQcWTWA/fxJdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE1scti4HO+9EXGZ6lrLW7y4u57lNIYm6+66mC4WPrd7SKwmTPp1eDJRGYRr335Pv+xEfKk
X-Received: by 2002:a05:620a:c42:b0:7d4:3c05:6306 with SMTP id af79cd13be357-7d5d14b3d10mr419819285a.57.1751532541620;
        Thu, 03 Jul 2025 01:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751532541; cv=none;
        d=google.com; s=arc-20240605;
        b=N449ubizBmO1nn0WQ3qBpY8GU1VSWWrbkLjkEcRuJ7gDnmGgnOh0wDxkJd8x4FHCqB
         7lUTgUnXWZ0TNdnbbOGFi1cw9X+n+ALiThDuE9JdAe9p/gPXdql+ZaSGUe86bz6oh11k
         LBXqOYKbw4FE5wJXQDvNyPET/k4z8LcPh4a/FgNtrPqt1rzEpvlqxEEZpNPXxtm1pOgr
         2bCP4Y16UtHmz5xGVQlqdUase6tyMXrcQs85l8Ej7YZ6zByEJR324Q6aprImU0I2U5Bg
         gZIBM5fBkPNgeTDpqjCZ4wsWz1BByUUOsGGWPYVAa2uFVy8ympVAohVqdPmKA9o0boox
         hBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=t31kdy+kQ8c5PIchM2lKtaPtNkDU81Ofo+ATKNztN0g=;
        fh=K6DRGZ9v0QUPI5y28IyZ3JGzxcTK+mf/rR6Wgk4w8yA=;
        b=RIOA1D113UkYfieEumdsdgqNVW4A+k2Tx+meFkLwk2/GUAHjITC3WgtvNngxQfezuk
         OSEDffDRk0J3jveXrhBS+7UbELwHpcSOvV34/5itzwBaM2vmy8L5+a21TnQl5g3UCmS3
         eMWzx9z44NrjGqN0BUzw6Fm8RZJsVMIkqnHNTyeozURcrMh5BBLbwWBzSbviiFMUHMY5
         hmARxlzMMV6mMxP+qqnINxG+lIKTCPs9vGTFpcy+21J3rx1LN7R+fTSBioFd4zQsNh8e
         oi+PR/oxmNeW4hczsg/aF8zjluDsDLVkuh172KCawR46wWtNVAfI9ZQLACC5a8gkCej1
         upRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4431a7461si1635983285a.157.2025.07.03.01.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 01:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXFcL-0007JW-VD; Thu, 03 Jul 2025 04:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uXFcJ-00078s-2d; Thu, 03 Jul 2025 04:48:27 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uXFcG-0004C7-RS; Thu, 03 Jul 2025 04:48:26 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXr4C4Ndpz6M55b;
 Thu,  3 Jul 2025 16:47:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5A95F140447;
 Thu,  3 Jul 2025 16:48:20 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Jul 2025 10:48:11 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v6 06/12] hw/arm/virt: Add an SMMU_IO_LEN macro
Date: Thu, 3 Jul 2025 09:46:37 +0100
Message-ID: <20250703084643.85740-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MDaiRf/J7An8

From: Nicolin Chen <nicolinc@nvidia.com>

This is useful as the subsequent support for new SMMUv3 dev will also
use the same.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Donald Dutile <ddutile@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Nathan Chen <nathanc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ee272b5b34..05a14881cf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -146,6 +146,9 @@ static void arm_virt_compat_set(MachineClass *mc)
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
 
+/* MMIO region size for SMMUv3 */
+#define SMMU_IO_LEN 0x20000
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -177,7 +180,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_UART1] =              { 0x09040000, 0x00001000 },
-    [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
-- 
2.34.1

