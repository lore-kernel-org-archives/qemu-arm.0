Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp869565ejf;
        Thu, 11 Aug 2022 19:22:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5P6ANLRNFWDKtjevHTiN5tWPq0q5aPURqkfOpwkUXYvmhw3Ovh4etxB6E315rp/rR3wySJ
X-Received: by 2002:a05:622a:5d2:b0:31e:e353:4f76 with SMTP id d18-20020a05622a05d200b0031ee3534f76mr1886543qtb.99.1660270945837;
        Thu, 11 Aug 2022 19:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660270945; cv=none;
        d=google.com; s=arc-20160816;
        b=J1Fh0Jod7wp1sgN39uCcBN74y+qfQOoRQ+1/fDkSiA0c1h+wXMsxMl2jGl/TnpwDH8
         CHmvt2B5iIAOWNtMJZzTmRPuC+SexFf0vcQNcmkPixmv17tPgHA4w5uQIdi4IrDie/cT
         Fynwp74PFufHPNgcQd+18HmmcaDq7O2o7AU/1dk73L8/YlIOOceGzI8XDngBZw08c/kH
         8qWkjFvPATQNAXCtpGrsLHaH/Ibi9rGrCIBsn55q/o0Hk4nwX+f02Lx644Kq+nPTSdXu
         Hbb21hLaBKDSr7NWpqeRMN4Z0Kg7BmOnr2aXB+EGDBNgAom5cOeynDPO47/8YlL3+ayY
         jmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=RI/8XtV4BajcHPM09AG1Y7XiStvHQ6IYmyQd+jnrKSc=;
        b=c6hVxUZTS7GxL5fVFMY+bXmBVsqFmfpfTzeO06o8uFLwRnmzyqqZLJjO8ZlxT4zmg1
         Xr704xnnf5i4x1BnwkPGGaeKvOSD4rTVr2YTFGHTq8yRwtfHl8MVFpJyrzxRoUpAHNX1
         i26PDNNVG+UV2VW3qL0xs3S+5ZP7aG5vhQlducq57FyobDOTrBymHB6oOE1KqMAZJWmL
         fZVn8dJy+I/Snkw++vmuDzHJuDn9bRtJidtr9Hi5+a0IaUGk1XUSEzrYjJpNUMnzUaok
         T7vWyrS/VHu3o+vsWbSwe+TW9VEuXt7NirtIPWV1CS7vFsj0AorCg0dlONbM2eRFJEcj
         4pNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a05620a299400b006b994355c7bsi711814qkp.582.2022.08.11.19.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 19:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMKJd-0004Hp-BF
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 22:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oMKIP-0003YS-Az; Thu, 11 Aug 2022 22:21:09 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oMKIM-0002PB-P9; Thu, 11 Aug 2022 22:21:09 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M3nPl5pfxzkWKN;
 Fri, 12 Aug 2022 10:17:31 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 10:20:45 +0800
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 10:20:44 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>,
 <wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] hw/arm/virt-acpi-build: Present the GICR structure properly
 for GICv4
Date: Fri, 12 Aug 2022 10:20:18 +0800
Message-ID: <20220812022018.1069-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
X-TUID: VEOpa6+kEO7Q

With the introduction of the new TCG GICv4, build_madt() is badly broken
as we do not present any GIC Redistributor structure in MADT for GICv4
guests, so that they have no idea about where the Redistributor
register frames are. This fixes a Linux guest crash at boot time with
ACPI enabled and '-machine gic-version=4'.

While at it, let's convert the remaining hard coded gic_version into
enumeration VIRT_GIC_VERSION_2 for consistency.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..9b3aee01bf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -732,7 +732,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
                                              PPI(VIRTUAL_PMU_IRQ) : 0;
 
-        if (vms->gic_version == 2) {
+        if (vms->gic_version == VIRT_GIC_VERSION_2) {
             physical_base_address = memmap[VIRT_GIC_CPU].base;
             gicv = memmap[VIRT_GIC_VCPU].base;
             gich = memmap[VIRT_GIC_HYP].base;
@@ -762,7 +762,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
     }
 
-    if (vms->gic_version == 3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         build_append_gicr(table_data, memmap[VIRT_GIC_REDIST].base,
                                       memmap[VIRT_GIC_REDIST].size);
         if (virt_gicv3_redist_region_count(vms) == 2) {
-- 
2.33.0

