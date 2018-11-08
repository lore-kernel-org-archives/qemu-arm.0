Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3199378wrw;
        Thu, 8 Nov 2018 02:18:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5crhp3K13VnLaUrVJBhLhN0mG2SjUcUIpAZYc9VnHf25dLXAmqZeVCbgzA2ix7I1fNkTZUe
X-Received: by 2002:a17:902:a58c:: with SMTP id az12-v6mr3898130plb.266.1541672334072;
        Thu, 08 Nov 2018 02:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541672334; cv=none;
        d=google.com; s=arc-20160816;
        b=ogE3h0RZiCx++7BoTHCBxSue/lVGNT/bSrxAPismb8dXRMkwdCNRgbZ4EWrUEuQNEz
         eQ6TkDzUI3GMa2EDVa32jSHo490fC+hAN5+LgfyyR3di7kANRk6x274qVl2Ei72cQv7i
         +iSN5rwMDjoVfIELdTmVeF5Moll1QnOfu7BRKhlqsaUUboFRs50T+gcPdTWqJLYzR0cz
         gsyIPInP9L4MpYd4dtdiv5jXB7YoxK79MKKTKD4s4ZaYssLH4UX5W3c+rc8z8LecEhTA
         7zfb1dWjK7ldp2PV6W+ei6atIKZ6IuYd+QKqDounXabUtIjk9E0sb5Zuo5RPOqxUq+SK
         LeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=niBdxLvIn7xvqpNdZmyRvxb8sAHhqB5p6uymCC+ashE=;
        b=zSsU9hjXy6glBhzWpt6JPnTaRQ9/pGyurYtKhxaDTKtMZUFaUayEWKtcC/rY6BQArX
         KpJNBIE6uM9odimhJAKN0H4gKewf11ik+rdsOgsyV6eyP7iuitCSP6CtFkZX4qB0ABZn
         ms9L98krtU43JXH0187VC7zdMHSpiwDz030Er+/wL5LTdGL+VCJnUzViC/UFCiFZR6Ij
         oCv+1rHoPAgjOYDHJNH/BEVxEihVuwQQ3zfi4MMAqNua0J+BEqwvc37Y7dukVOh+EHGY
         76BQkH1tehkUyOY/Ig8PW69VD+2KifJ11yS7l/+jwb8M9VVyKc1Up+fPc7pt+HtGf7Rw
         RVyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v26-v6si3400052pge.101.2018.11.08.02.18.53;
        Thu, 08 Nov 2018 02:18:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbeKHTxd (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 14:53:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14622 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727051AbeKHTxc (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 14:53:32 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 529B44B7998FE;
        Thu,  8 Nov 2018 18:18:44 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:18:38 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v15 09/10] hw/arm/virt: Add RAS platform version for migration
Date:   Thu, 8 Nov 2018 02:15:52 -0800
Message-ID: <1541672153-15529-10-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: tJIjS1PkF5AM

Support this feature since version 2.12, disable it by
default in the old version.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Address Shannon's comments to add platform version in [1].

[1]: https://lkml.org/lkml/2017/8/25/821
---
 hw/arm/virt-acpi-build.c | 14 +++++++++-----
 hw/arm/virt.c            |  4 ++++
 include/hw/arm/virt.h    |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 19c1b7e..6f50a29 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -836,10 +836,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
-    acpi_add_table(table_offsets, tables_blob);
-    build_hardware_error_table(tables->hardware_errors, tables->linker);
-    build_apei_hest(tables_blob, tables->hardware_errors, tables->linker);
-
+    if (!vmc->no_ras) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_hardware_error_table(tables->hardware_errors, tables->linker);
+        build_apei_hest(tables_blob, tables->hardware_errors, tables->linker);
+    }
 
     if (nb_numa_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
@@ -926,6 +927,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
 
 void virt_acpi_setup(VirtMachineState *vms)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
 
@@ -957,7 +959,9 @@ void virt_acpi_setup(VirtMachineState *vms)
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
 
-    ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
+    if (!vmc->no_ras) {
+        ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
+    }
 
     build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
                                               ACPI_BUILD_RSDP_FILE, 0);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2b8d8f..367306b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1920,6 +1920,10 @@ static void virt_machine_2_11_options(MachineClass *mc)
     virt_machine_2_12_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
     vmc->smbios_old_sys_ver = true;
+    /* Disable memory recovery feature for 2.11 as RAS support was
+     * introduced with 2.12.
+     */
+    vmc->no_ras = true;
 }
 DEFINE_VIRT_MACHINE(2, 11)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7..a4490dd 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -98,6 +98,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_ras;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
-- 
1.8.3.1
