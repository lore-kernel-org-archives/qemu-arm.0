Received: by 10.28.91.67 with SMTP id p64csp167145wmb;
        Wed, 14 Mar 2018 06:33:43 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtNAjjVRaQXfzts9wcDvAHZXr3QdFJlKY88njtn1mTD+7d2tx/1kQBM6xfUTkpFTHzIMmIl
X-Received: by 10.55.168.206 with SMTP id r197mr6587109qke.311.1521034423481;
        Wed, 14 Mar 2018 06:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521034423; cv=none;
        d=google.com; s=arc-20160816;
        b=L4GMhUqwFrh3171ieNO2F3CsAsKvSNxsasEfhLTfYDj3phEJHL1PO+Yn5ATtQaBJmS
         QE8V8vFoedwz9GLVQSJwl3DX0xmLFYwDqK4tbJfoxAx57JiM1KMEJ5V3Jf8et42WuawU
         3+KMzrYys9ONu402hnV1qiswPQfkSHW9+LTZQ+netnvVtC+BzzDgIAhWHWqiQ7WwCSNz
         wGx8Vi9ICau31wzBujBrCbdLR3XUqTTcsT10DMDjPi/1UO0W68J7gDvQ+o+j9DnT1CEg
         O+nnEUSkcoN301Tc+Nf+fWCj6BuAOEKXhjwrMAiQmBcLg1hKR2ZjRlKwpZJ8JTYOQsII
         swOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gYZ3b28UcfXUx04eBfoSbMiO/teNMF2nFjn892TLDSw=;
        b=mXCutWqGzAAHjYpIVWsi4hwq5OQtozlGeMTHn5SFsj6FnSM3ax82GQX7hQh/6Bspwt
         90M8vlckmlJdMfVYtjH8/Afu9TzNMH6EsryVcnI4eNyIerawuUiq/+2EBPwIsXehsSmh
         iNPghl1Jv+rR2PBf1Smmdcpsz7XN92R4qvmThW64jkQ9+KBopZYFTsr6v/KJeJgtO3sK
         75gm6hnpitk2yNx01Iz6aftMzIeAQfVK53Xp8kNN+pSUHTyqRBo6YWaqoN9iiadjxHFP
         /6MXGaMszekr4UofhJagRhQSsP9e1WjrY26aJN5tBkbF/jyAE+w49p1z/wqNx+3tgaRi
         60LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k126si2351503qkb.266.2018.03.14.06.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Mar 2018 06:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ew6XG-00078b-UA
	for alex.bennee@linaro.org; Wed, 14 Mar 2018 09:33:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6UD-0004Py-6Q
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6U9-0001x1-Im
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:33 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:36047)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6U8-0001mX-Ro
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:29 -0400
Received: (qmail 29394 invoked by uid 484); 14 Mar 2018 13:30:11 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.052037 secs); 14 Mar 2018 13:30:11 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 14 Mar 2018 13:30:11 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 14 Mar 2018 14:28:03 +0100
Message-Id: <1521034084-17344-3-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v5 2/3] target/arm: Add "_S" suffix to the secure
 version of a sysreg
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWIl4q29Vm1p

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
Add "_S" suffix to the secure version of sysregs that have both S and NS views
Replace (S) and (NS) by _S and _NS for the register that are manually defined,
so all the registers follow the same convention.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db8c925..1360a14 100644
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

