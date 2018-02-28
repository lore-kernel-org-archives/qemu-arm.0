Received: by 10.28.91.67 with SMTP id p64csp472308wmb;
        Wed, 28 Feb 2018 03:02:35 -0800 (PST)
X-Google-Smtp-Source: AG47ELvSvKavcQBmlCdTOb/j2uOsI4sdPmdHD9SxFfJ62j6RB57Y2ZrfGfTCJAi3bbP+FWcgaJLL
X-Received: by 10.13.234.151 with SMTP id t145mr11290142ywe.346.1519815755317;
        Wed, 28 Feb 2018 03:02:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519815755; cv=none;
        d=google.com; s=arc-20160816;
        b=RvlpLQf3YFhvrGrBFHiD7esMeGJQu5/r76G0LrdkMwv0xqWdAD7qXacgmhL0lQov8f
         Ikugny8cAty7l7ubZErupJhNN2BsSJBq580Q5RfyYG13YKnFFJ7WP4VM/sO2AAEwVi+U
         oCo2E/+N+Bm/EN7tGOhTbviVouZ6440wX39ie+2ME/37R+UpaSq2P3hxqlRw4OllxQuH
         4PNYlDAsFZ8nwrRfVd+QCZACTYqzS5LHohYpPhc7TtsAENkIuAkRrkzdrHRf6gj5qe4h
         S/0LuS5F/zU3c+2uRB8D/79W7A5W6e/BgRrouhPdPdl9eytEoxAqt1H6dqq+xuwkIByx
         ZrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gbEk+9NAQKiTCq+g2PoFMZiY1UOs/FBsDl8wOZkZE2U=;
        b=vi2rK2EChS3/uIYxTEpXEs/Sr5LUPb2/4VHbvmvy467btvfEUnxPmdN/Iwl2lAJTKb
         259GNHkrp73+IJQOWJ6UsdkUcFPvTFcK2/dXBteso7B+tkOw0XxGLX5iM1cQOl4x2Q1N
         I9hXc4ig5CbyaTrrf6J/42Ydriavb/76fxxjOIWtAjEmxncF4Ac4luqE4/yvrWg73gHI
         nsE0BiYzc4Z+xIfa+csZDRT+awf09vsQdqa++swlDmLmKZbDThJTRAM5tAB1zCOMSmUy
         EHGPMMhIx6XRHoVWC2AxewoDqdGZ3s+Fd/Sv5gCLdPE9x9GlThwchDpkNRq0s6Iw6G0C
         4ZDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si232408ywi.713.2018.02.28.03.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 03:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqzVK-0003eB-Ok
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 06:02:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV6-0003bm-Ok
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 06:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV0-0007Lj-Ps
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 06:02:20 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:46071)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV0-0007Dn-Eu
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 06:02:14 -0500
Received: (qmail 1032 invoked by uid 484); 28 Feb 2018 11:01:57 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.110572 secs); 28 Feb 2018 11:01:57 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 28 Feb 2018 11:01:56 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 28 Feb 2018 12:01:23 +0100
Message-Id: <1519815685-29200-3-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v3 2/4] target/arm: Add "_S" suffix to the secure
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
X-TUID: SPAlSYNa1Cg+

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
Add "_S" suffix to the secure version of sysregs that have both S and NS views
Replace (S) and (NS) by _S and _NS for the register that are manually defined,
so all the registers follow the same convention.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
 target/arm/helper.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bdd212f..1594ec45 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -694,12 +694,12 @@ static const ARMCPRegInfo cp_reginfo[] = {
      * the secure register to be properly reset and migrated. There is also no
      * v8 EL1 version of the register so the non-secure instance stands alone.
      */
-    { .name = "FCSEIDR(NS)",
+    { .name = "FCSEIDR_NS",
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.fcseidr_ns),
       .resetvalue = 0, .writefn = fcse_write, .raw_writefn = raw_write, },
-    { .name = "FCSEIDR(S)",
+    { .name = "FCSEIDR_S",
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.fcseidr_s),
@@ -715,7 +715,7 @@ static const ARMCPRegInfo cp_reginfo[] = {
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
-    { .name = "CONTEXTIDR(S)", .state = ARM_CP_STATE_AA32,
+    { .name = "CONTEXTIDR_S", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_s),
@@ -1966,7 +1966,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
                                    cp15.c14_timer[GTIMER_PHYS].ctl),
       .writefn = gt_phys_ctl_write, .raw_writefn = raw_write,
     },
-    { .name = "CNTP_CTL(S)",
+    { .name = "CNTP_CTL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
       .secure = ARM_CP_SECSTATE_S,
       .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
@@ -2005,7 +2005,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .accessfn = gt_ptimer_access,
       .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
     },
-    { .name = "CNTP_TVAL(S)",
+    { .name = "CNTP_TVAL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
       .secure = ARM_CP_SECSTATE_S,
       .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
@@ -2059,7 +2059,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .accessfn = gt_ptimer_access,
       .writefn = gt_phys_cval_write, .raw_writefn = raw_write,
     },
-    { .name = "CNTP_CVAL(S)", .cp = 15, .crm = 14, .opc1 = 2,
+    { .name = "CNTP_CVAL_S", .cp = 15, .crm = 14, .opc1 = 2,
       .secure = ARM_CP_SECSTATE_S,
       .access = PL1_RW | PL0_R,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
@@ -5562,7 +5562,8 @@ CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    void *opaque, int state, int secstate,
-                                   int crm, int opc1, int opc2)
+                                   int crm, int opc1, int opc2,
+                                   const char *name)
 {
     /* Private utility function for define_one_arm_cp_reg_with_opaque():
      * add a single reginfo struct to the hash table.
@@ -5572,6 +5573,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
+    r2->name = name;
     /* Reset the secure state to the specific incoming state.  This is
      * necessary as the register may have been defined with both states.
      */
@@ -5803,19 +5805,26 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                         /* Under AArch32 CP registers can be common
                          * (same for secure and non-secure world) or banked.
                          */
+                        const char *name;
+                        GString *s;
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
+                            s = g_string_new(r->name);
+                            g_string_append_printf(s, "_S");
+                            name = g_string_free(s, false);
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                    ARM_CP_SECSTATE_S,
-                                                   crm, opc1, opc2);
+                                                   crm, opc1, opc2, name);
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                    ARM_CP_SECSTATE_NS,
-                                                   crm, opc1, opc2);
+                                                   crm, opc1, opc2, r->name);
                             break;
                         }
                     } else {
@@ -5823,7 +5832,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
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

