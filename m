Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1231629lfg;
        Fri, 2 Apr 2021 01:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSGiSG4FIkOhKwrMDDIAXyndeTNlyV3FCQSa/q2jX9/1AW84kGwQ4Lciu/4uaPX/tWIeDm
X-Received: by 2002:a25:ab03:: with SMTP id u3mr17602060ybi.347.1617353304334;
        Fri, 02 Apr 2021 01:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617353304; cv=none;
        d=google.com; s=arc-20160816;
        b=D+KwFraCes+PWOQkjXukHNjq9DLyP8iaJl5jAo1baCXlcr0VyG/ptsJw0FRkKJhKZy
         O1/vjd88+csrS0VVjIlIivdhGilbE8PGc8hd1aUTC5ZgxppINyMfdWricReX5oq5FFLY
         eeX/2RV9UjBdpms6zvUvbVYDRas8xnfpXXDoXwtcg3Td2RihEm12RVqQ2SOSzhelZBRl
         bw4fjaIPHDp1RkhUCHLcoV9HjAHcoh85EkYRFGNCsUmStyqB2fOYcbIGPuekRmf0HY9N
         BFrlVYh3ggwfb2Yj26z2Mp9AlI1WM2FmUSYnZf+ENf5liZibfDxguK8YmqN1fFXkyeKc
         6QOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=yOZwuDKIU8q5RKDUlR1a7gZbm7aAMAjQ9LYFeSHkn8k=;
        b=IZw+B1AxG4/RiRI4LmUSpG7BWkkoKt0lgmZv3JthBTqERqZDMnstaBGzoj7nsW7/ch
         qJRQ7/o2vGBTWKcVtBlYeJojV28uJYYoFmg/PNddMEn1ebPXUybVV0paj4q9TgwPQI4C
         KEkZZwAPJUQgqcF4Acl7bDz7aAZ/AzZ+Qx4/9HwGaMKoDcmmT9hkyrSpNTz/TnbXKyk1
         cuvsK9p1ySWLNx/pqxVZ8feLoNjqs3ZG/DsdYosT9A1pRf1Zdzgp7k0F/yNjx2p93Ha5
         T6jqaPXohmUo0LM8tRF+MnLo3oiHDGvRvl+tAuoyWti8pLYVw4BCPHQVvmHI3pgIN67R
         +iRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si7871956ybl.296.2021.04.02.01.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 01:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSFTb-0006SV-NN
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 04:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lSFTP-0006S3-Du; Fri, 02 Apr 2021 04:48:11 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lSFTM-0006Yr-Ug; Fri, 02 Apr 2021 04:48:10 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FBYYb3MygzkhFT;
 Fri,  2 Apr 2021 16:46:11 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 16:47:47 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <peter.maydell@linaro.org>, <eric.auger@redhat.com>,
 <prem.mallappa@broadcom.com>, <shannon.zhaosl@gmail.com>
Subject: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
Date: Fri, 2 Apr 2021 16:47:31 +0800
Message-ID: <20210402084731.93-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LOXA477bQrqQ

The GSIV values in SMMUv3 IORT node are not correct as they don't match
the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
our emulated vSMMU.

Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f5a2b2d4cb..60fe2e65a7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -292,8 +292,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
         smmu->event_gsiv = cpu_to_le32(irq);
         smmu->pri_gsiv = cpu_to_le32(irq + 1);
-        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
-        smmu->sync_gsiv = cpu_to_le32(irq + 3);
+        smmu->sync_gsiv = cpu_to_le32(irq + 2);
+        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
 
         /* Identity RID mapping covering the whole input RID range */
         idmap = &smmu->id_mapping_array[0];
-- 
2.19.1

