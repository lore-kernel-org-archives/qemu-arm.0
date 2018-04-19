Received: by 10.28.4.212 with SMTP id 203csp813144wme;
        Thu, 19 Apr 2018 08:56:38 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49OlJMbU+Sh6yYgv0KZKhqC3gGSLPq+/WjphEef71fz/G7lDTBOVUirbsG5fvAtuc2J8fUR
X-Received: by 10.28.67.2 with SMTP id q2mr4676911wma.15.1524153398454;
        Thu, 19 Apr 2018 08:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524153398; cv=none;
        d=google.com; s=arc-20160816;
        b=KtVMVyHJubkEJHtXeBimOAiYnMaf0R1pjE1eY9ZuVrLhBcABLayf+8VGdxzJw282vG
         bwbWLi34MAjWpYSN9kVuDox02xK1bM/tUHmAgqNWyLJLDW2BLOxAuA793wqm/p0+Mqd3
         YKg2V9i8Rf5CXkMhx+4dU0hEcTF8ZgF9hMdxOq+9QseIUavPhzBcWXA6ikV+QB8ksmnR
         W6FQS2BCwlwmfUuS2Lm8hSFgbZ1o8Cqzmp/ZIKHyhfj6MCApLh6VNcDphnqPy9WEx/QG
         GHl+xyeQp16p0igKaKK+BbU6OYTUfcHrlokvDj8BzcK5XnDgvjii7oiWW3Jao/LbdRDP
         Y/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=px/wwCm91laZijgM286BJ0w3/v8OLv5cbbljJk75jW0=;
        b=eEHnVDRDR3DbsNE4JrRUonLL5ibon4+ldr3tZo4bqQP89dxnt1nMGcV/Drgtf/i6qz
         SppGm7/wxPcmgRFGs+tq5FdnrQo5AmJYBs7vhkJpZSgPaUBVMzw5YHg4xq7ktTnT2lVU
         YbF7ySVxT5zWOSEmkbICHS5s1WnMEqnKvk06CMk53k/UwoOakefEA0/T07mY8Vm2ghBt
         /86mc3wgaA/gYQVBYo2Eec+ToU5WQJ6GZYTYQ1pjfXyTSGYCaUm7q34dlvGZLounKxT2
         jvwKduMZ/wGKApQPIeOSE0nwAa2WVr2UDsLaPrslXQkG9T+r2B1AGEuPZTId8YkZ7wvw
         rPqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id i65si2805220wmg.40.2018.04.19.08.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Apr 2018 08:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 22740 invoked by uid 484); 19 Apr 2018 15:56:38 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.052325 secs); 19 Apr 2018 15:56:38 -0000
Received: from unknown (HELO abo-VirtualBox.8.8.4.4) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA encrypted SMTP
          for <qemu-devel@nongnu.org>; 19 Apr 2018 15:56:37 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org,
	khaled.jmal@lauterbach.com,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Subject: [PATCH v6 2/3] target/arm: Add "_S" suffix to the secure version of a sysreg
Date: Thu, 19 Apr 2018 16:56:25 +0100
Message-Id: <1524153386-3550-3-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fGDK7bDKeR/g

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
Add "_S" suffix to the secure version of sysregs that have both S and NS views
Replace (S) and (NS) by _S and _NS for the register that are manually defined,
so all the registers follow the same convention.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 799e322..858bda2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -695,12 +695,12 @@ static const ARMCPRegInfo cp_reginfo[] = {
      * the secure register to be properly reset and migrated. There is also no
      * v8 EL1 version of the register so the non-secure instance stands alone.
      */
-    { .name = "FCSEIDR(NS)",
+    { .name = "FCSEIDR",
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.fcseidr_ns),
       .resetvalue = 0, .writefn = fcse_write, .raw_writefn = raw_write, },
-    { .name = "FCSEIDR(S)",
+    { .name = "FCSEIDR_S",
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.fcseidr_s),
@@ -716,7 +716,7 @@ static const ARMCPRegInfo cp_reginfo[] = {
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
-    { .name = "CONTEXTIDR(S)", .state = ARM_CP_STATE_AA32,
+    { .name = "CONTEXTIDR_S", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_s),
@@ -1967,7 +1967,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
                                    cp15.c14_timer[GTIMER_PHYS].ctl),
       .writefn = gt_phys_ctl_write, .raw_writefn = raw_write,
     },
-    { .name = "CNTP_CTL(S)",
+    { .name = "CNTP_CTL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
       .secure = ARM_CP_SECSTATE_S,
       .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
@@ -2006,7 +2006,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .accessfn = gt_ptimer_access,
       .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
     },
-    { .name = "CNTP_TVAL(S)",
+    { .name = "CNTP_TVAL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
       .secure = ARM_CP_SECSTATE_S,
       .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
@@ -2060,7 +2060,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .accessfn = gt_ptimer_access,
       .writefn = gt_phys_cval_write, .raw_writefn = raw_write,
     },
-    { .name = "CNTP_CVAL(S)", .cp = 15, .crm = 14, .opc1 = 2,
+    { .name = "CNTP_CVAL_S", .cp = 15, .crm = 14, .opc1 = 2,
       .secure = ARM_CP_SECSTATE_S,
       .access = PL1_RW | PL0_R,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
@@ -5563,7 +5563,8 @@ CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    void *opaque, int state, int secstate,
-                                   int crm, int opc1, int opc2)
+                                   int crm, int opc1, int opc2,
+                                   const char *name)
 {
     /* Private utility function for define_one_arm_cp_reg_with_opaque():
      * add a single reginfo struct to the hash table.
@@ -5573,6 +5574,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
+    r2->name = g_strdup(name);
     /* Reset the secure state to the specific incoming state.  This is
      * necessary as the register may have been defined with both states.
      */
@@ -5804,19 +5806,24 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                         /* Under AArch32 CP registers can be common
                          * (same for secure and non-secure world) or banked.
                          */
+                        char *name;
+
                         switch (r->secure) {
                         case ARM_CP_SECSTATE_S:
                         case ARM_CP_SECSTATE_NS:
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
-                                                   r->secure, crm, opc1, opc2);
+                                                   r->secure, crm, opc1, opc2,
+                                                   r->name);
                             break;
                         default:
+                            name = g_strdup_printf("%s_S", r->name);
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                    ARM_CP_SECSTATE_S,
-                                                   crm, opc1, opc2);
+                                                   crm, opc1, opc2, name);
+                            g_free(name);
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                    ARM_CP_SECSTATE_NS,
-                                                   crm, opc1, opc2);
+                                                   crm, opc1, opc2, r->name);
                             break;
                         }
                     } else {
@@ -5824,7 +5831,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                          * of AArch32 */
                         add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                ARM_CP_SECSTATE_NS,
-                                               crm, opc1, opc2);
+                                               crm, opc1, opc2, r->name);
                     }
                 }
             }
-- 
2.7.4
