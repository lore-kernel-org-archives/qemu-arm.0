Received: by 10.223.134.117 with SMTP id 50csp5137077wrw;
        Wed, 27 Dec 2017 21:28:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotJMoiJVYy63RkqyMbOpPeCP3VZkrX6yorAPFp1lYXhTTJqsPpsplOQwdomq07IU+3ZfdeG
X-Received: by 10.84.164.104 with SMTP id m37mr30299650plg.29.1514438881279;
        Wed, 27 Dec 2017 21:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438881; cv=none;
        d=google.com; s=arc-20160816;
        b=DQuo5Xhn3P/wQqOvMeXMMS+W/wDEgdaoQ9gTYEcF4ibJWb7fNC5PKFXchdbGFBDybt
         p6vF8/ojVmObFI/c55vGLivU+y3qDu5ePTwiOo2+2mLPohZ6tXikPQdyK75R6D0BTXVS
         FmYWbnL4L5Zvu5UA4L2Ag0etSj98Ub+D9pS3KhOoIRIea+c103TzLQ8CgRs/XKm3RE0Y
         ZN16w/X1TD154boSzexAhQ6JlzOLhLZ3QYT82pwJcxCshY44DOC7+ZOhoOFUE5vb7FuL
         V1uR0xr9M/y6XVpfj/eOcxKNXrR1ycP1mCckz0Wn0TDB2mnagDxYzZHJpGraj+q3f/MK
         60rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=IClPGYA3mCWH8mubjl4/DtatoijdkGxEfvlcu55Tkp8=;
        b=lKiQrnkVGybQw3qwOCZqF15O22xFYnUbzQOHzNdnyeUFQHfXcCiAULLQN7/fW2ajas
         rlENQbcemIhpQhCZ08rCPr7ZE23/CgyWYwSIDAk5HxhQRpvOct6aOEgwFX+FvtBkMuiF
         eRVH2jQyjQOgzdh/XQ69A9RWBS4LPUanDW5Uwi7pWi9l+hwbz3FDgdCuDUGy5PkZ+c0D
         BENcYG+pEx8JeWITV6XLpCc/Jx3HcSh0ZFN1Ll8KY3sGphneiAi1odL56fsb+PxClKdn
         UnInH7ubNz+iSxKxkYHBFktr9e8GCleaA+e7C7sD59/WsST4h7jBkZiai1RBAwwi6TBG
         um4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.28.01;
        Wed, 27 Dec 2017 21:28:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751448AbdL1F17 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:27:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3186 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751353AbdL1F1y (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:54 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6453E2E2106B1;
        Thu, 28 Dec 2017 13:27:38 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:32 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 8/9] hw/arm/virt: Add RAS platform version for migration
Date:   Thu, 28 Dec 2017 13:54:17 +0800
Message-ID: <1514440458-10515-9-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: wLxIj4/ad2a9

Support this feature since version 2.10, disable it by
default in the old version.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Shannon's comments to add platform version in [1].

[1]: https://lkml.org/lkml/2017/8/25/821

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/arm/virt-acpi-build.c | 14 +++++++++-----
 hw/arm/virt.c            |  4 ++++
 include/hw/arm/virt.h    |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 06c14b3..b6974ef 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -801,10 +801,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
-    acpi_add_table(table_offsets, tables_blob);
-    build_hardware_error_table(tables->hardware_errors, tables->linker);
-    build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
-
+    if (!vmc->no_ras) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_hardware_error_table(tables->hardware_errors, tables->linker);
+        build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
+    }
 
     if (nb_numa_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
@@ -891,6 +892,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
 
 void virt_acpi_setup(VirtMachineState *vms)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
 
@@ -922,7 +924,9 @@ void virt_acpi_setup(VirtMachineState *vms)
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
 
-    ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
+    if (!vmc->no_ras) {
+        ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
+    }
 
     build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
                                               ACPI_BUILD_RSDP_FILE, 0);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 68495c2..ab79988 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1732,8 +1732,12 @@ static void virt_2_9_instance_init(Object *obj)
 
 static void virt_machine_2_9_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_10_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
+    /* memory recovery feature was introduced with 2.10 */
+    vmc->no_ras = true;
 }
 DEFINE_VIRT_MACHINE(2, 9)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..8fbd664 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -84,6 +84,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_ras;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
-- 
1.8.3.1
