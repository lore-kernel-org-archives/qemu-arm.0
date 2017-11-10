Received: by 10.223.150.237 with SMTP id u100csp3629018wrb;
        Fri, 10 Nov 2017 03:14:34 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QoNMFYSyamEJE7sCxf+2XX54cqDUEZaIdwhnLPGCuNljjDhyhxPew+KrTn6An4QQgg70Nf
X-Received: by 10.99.96.87 with SMTP id u84mr3734718pgb.407.1510312474267;
        Fri, 10 Nov 2017 03:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312474; cv=none;
        d=google.com; s=arc-20160816;
        b=HGCceInrANf0HE6x1zqkgNyEEPvMPL/PY5YFpJlnUmLV1A/JY2XT4krhj1zNnspbU8
         WiCC5MhCwXgKVhp6hdNsojOaaVxo1r946C/Fei1cHg7rC7IS+5/3TC/Cyy4AXct+KVdG
         Q2fNuigUbZxEua1UKuZrUUJz3uuYou9JTlcWl1o5PTc36a+w37lBTG3KwQ6J9kOwRyVM
         dstXsth+OH56hEEqzDxD7ckTAxPpSSak7zzGaSWWbwY0oU9W5W922GohiM7+aug2qtx6
         nSftiu8Ex+weEv1c7kpRgd2K7tIJRiwSX6uDrcu//poxY4PJo0COGGtsBOr3+0S8tlgm
         wgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=zXsVCT67SURp3/QFWBDnKkFBXe7rxCj/T4qq9amYivg=;
        b=TBBWFz3Fgw1q0Ap7pIROHgjAE638D2S5nMrJudu3S4Vgts8jI0+Uda0COkGng6N7vE
         EbnAHbTvteo4dki7QLtV9uRVmRQ+L1BV7RA5qHQwXemEe1O9JOzl9RMdADg5dbM9Hw8R
         Pj9lVi5zDiRlVdyIvYWQL9/83/coU52lrGgrje9g/tFzzdVfN0sVeA8Ai4+M3mWWO3Hn
         Cj7NubnTwVbizyd6Z/1/5Cr41qk9lyTfXp7e7dpLej+R7Gfs/yqE44o7+atlZC7q4nl2
         gC5y8Spw66AGFp01O7yF3bH6Wd0/Rr79dykf6BHU1mYAHMhpuR4poUU1d+Tdx2Fkl7Wr
         GkjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.34;
        Fri, 10 Nov 2017 03:14:34 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753000AbdKJLOc (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10506 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751983AbdKJLO3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:29 -0500
Received: from 172.30.72.60 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKR46786;
        Fri, 10 Nov 2017 19:14:16 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:08 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v12 11/12] hw/arm/virt: Add RAS platform version for migration
Date:   Sat, 11 Nov 2017 03:19:50 +0800
Message-ID: <1510341591-22817-12-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.5A058A08.021E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 98561ba3ba4902ded5da7bdb50bfbf91
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: vV3T76mIxCEm

Support this feature since version 2.10, disable it by
default in the old version.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Adding platform version is suggested here:
https://lkml.org/lkml/2017/8/25/821
---
 hw/arm/virt-acpi-build.c | 14 +++++++++-----
 hw/arm/virt.c            |  4 ++++
 include/hw/arm/virt.h    |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 92c8c38..961b67d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -801,10 +801,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
-    acpi_add_table(table_offsets, tables_blob);
-    build_error_block(tables->hardware_errors, tables->linker);
-    build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
-
+    if (!vmc->no_ras) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_error_block(tables->hardware_errors, tables->linker);
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
