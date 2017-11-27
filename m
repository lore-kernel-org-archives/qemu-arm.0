Received: by 10.223.159.82 with SMTP id f18csp1393529wrg;
        Mon, 27 Nov 2017 02:45:03 -0800 (PST)
X-Google-Smtp-Source: AGs4zMawxndGXe4OiFB/cmIRLZzZeCbMlJp7KZXaR2FWBWbw/uMWPqRLTLVCgfYQMhGmSC+/fw8S
X-Received: by 10.98.153.18 with SMTP id d18mr30510458pfe.145.1511779503319;
        Mon, 27 Nov 2017 02:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779503; cv=none;
        d=google.com; s=arc-20160816;
        b=cJgmX6jLINBiKPvGMsPLDR+0W3fvGSdgcVKd3/48dRfddT4ldDvjlk4uG5spoF3IcS
         r0ur4e/BKSmO+htoGQH0YKSbwLv41vdD/1zXLdeoPVtbwOjuaS06veAXSM1IjtMM1Fem
         eUVZOcfKtffr/qaw5G8uMZk5JdPu8erWWQ+TWkTZJyZwt30quWUek0Lr4EnJRjCmPN5j
         qoziQsEdWgDgM0nhQCzUAf8Dp2jKYJRLURRz8tiuQscC0HQqFQtPoD8jGOv6G6554EUT
         RPfSXrcwuSbnAYrm4FVGebqeYmMfTJxnqRiarV28hmWo6m7JH/xnDPUT1BwAherChLTJ
         bghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=pHjX/iaPIUVuQEH8o2n+ppTFt/KzwazOjiM7LO6Z+AA=;
        b=AEpRgDDvqEpBs50oSsQDIXcCPOtttYovJ77/acCftCTxX9icftKL6/QkWXzYBzwZzW
         RtWxZDoqpz17SwQXX/0twblK5GYhgegf+5wSO/0VjhHOjhg3EWaxO2dYFWMjFbulPYtL
         cO0UNJSZjrGoU4fgAdYA19Teu4ESRAA8Xet96hfqHgGU0BbzneHTpAPNaePBvALE2M/j
         WSih3nMiN5svJKikawtprNYybRRQgGbUcQuz00FdsK30/9/BCn73hhyvtQIAy+jpSw5E
         rm79okFJfjBMAcExelpYQea3Mcleih6bw6EOxCVAmq79TqibVnsYMCD7JGiKSgT3JO1p
         wKIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j24si18504689pff.153.2017.11.27.02.45.03;
        Mon, 27 Nov 2017 02:45:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751638AbdK0Kon (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 27 Nov 2017 05:44:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11432 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751732AbdK0Kok (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 27 Nov 2017 05:44:40 -0500
Received: from 172.30.72.59 (EHLO DGGEMS411-HUB.china.huawei.com) ([172.30.72.59])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLN07709;
        Mon, 27 Nov 2017 18:44:33 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.361.1; Mon, 27 Nov 2017 18:44:25 +0800
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
Subject: [PATCH v13 11/12] hw/arm/virt: Add RAS platform version for migration
Date:   Tue, 28 Nov 2017 02:49:54 +0800
Message-ID: <1511808595-24158-12-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090202.5A1BEC91.0089,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9551a392d6013e596b3e8ff46245ca4c
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 0zUK3pDWb8en

Support this feature since version 2.10, disable it by
default in the old version.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Shannon's comments to add platform version in [1].

[1]: https://lkml.org/lkml/2017/8/25/821
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
