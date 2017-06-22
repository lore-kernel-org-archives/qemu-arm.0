Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q143sm1037423wmg.14.2017.06.22.04.18.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jun 2017 04:18:10 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7BECC3E0201;
	Thu, 22 Jun 2017 12:18:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Christoffer Dall <cdall@linaro.org>
Subject: [PATCH] target/arm/helper: document potential CNTV register bear trap
Date: Thu, 22 Jun 2017 12:18:45 +0100
Message-Id: <20170622111845.5296-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7gmMFA7mgdVj

The ARM KVM encodings have been inadvertently switched for
CNTV_CVAL_EL0/CNTVCT_EL0 in the register API since its introduction.
Fortunately this doesn't currently mater as the reset values for both
are the same. However if this ever changes things will break in
interesting ways.

Migration is currently unaffected as we just use
cpu->cpreg_vmstate_indexes/cpreg_vmstate_values verbatim. However this
would break if we ever supported migration between KVM and TCG models.

For now we just warn future generations who may touch this code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Christoffer Dall <cdall@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2594faa9b8..e7a0e39583 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -211,6 +211,11 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     return true;
 }
 
+/*
+ * FIXME: the KVM API has switched encodings for
+ * CNTV_CVAL_EL0/CNTVCT_EL0 which need to be fixed if we want to
+ * change the reset values or support KVM<->TCG migration.
+ */
 bool write_cpustate_to_list(ARMCPU *cpu)
 {
     /* Write the coprocessor state from cpu->env to the (index,value) list. */
@@ -234,6 +239,7 @@ bool write_cpustate_to_list(ARMCPU *cpu)
     return ok;
 }
 
+/* FIXME: see above re:CNTV_CVAL_EL0/CNTVCT_EL0 encodings */
 bool write_list_to_cpustate(ARMCPU *cpu)
 {
     int i;
@@ -1961,6 +1967,11 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
                                    cp15.c14_timer[GTIMER_VIRT].ctl),
       .writefn = gt_virt_ctl_write, .raw_writefn = raw_write,
     },
+    /* WARNING! For *KVM only* the switched API encoding means this
+     * actually gets loaded in fresh VMs as CNTV_CVAL_EL0. This will
+     * need to be fixed in write_[cpustate_to_list|list_to_cpustate]
+     * if you want to change the reset value.
+     */
     { .name = "CNTV_CTL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 1,
       .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
@@ -2053,6 +2064,11 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .accessfn = gt_vtimer_access,
       .writefn = gt_virt_cval_write, .raw_writefn = raw_write,
     },
+    /* WARNING! For *KVM only* the switched API encoding means this
+     * actually gets loaded in fresh VMs as CNTVCT_EL0. This will need
+     * to be fixed in write_[cpustate_to_list|list_to_cpustate] if you
+     * want to change the reset value.
+     */
     { .name = "CNTV_CVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 2,
       .access = PL1_RW | PL0_R,
-- 
2.13.0
