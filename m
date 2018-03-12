Received: by 10.28.91.67 with SMTP id p64csp596022wmb;
        Mon, 12 Mar 2018 03:32:33 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuAGmZbFyateSMKitVhb14K3mpeTaGfupcMvUN1wocKD4ysFV4XtCT52AQ+IgDRaCIuRQhw
X-Received: by 2002:a25:b841:: with SMTP id b1-v6mr4213643ybm.161.1520850752941;
        Mon, 12 Mar 2018 03:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520850752; cv=none;
        d=google.com; s=arc-20160816;
        b=tUotPJEhl5UXVyCcEu2bvGNkfCKjBmPK7xxpXwEm1g+0CJSIlCDncNRg/uu2FpHNhM
         Kt9YD7Q0bAed6Z7+jo/u7R6qLHuYGjmFjedE+MGoTTGL13BqEEpAdCS3GrJkj3cQvWBt
         t411KwFUf3HUk9qi2g2407+6IwW28WtTm9OxffLyWL8DoXxicq0Bp7QudFzRMbsZ98HC
         Cgg9ThYlJogGoX2GfzdQnuQkBkNwnxm5x7lmjyXxT4ueQ8/kinuIQo5tWDl49hktefHI
         Gc1BDBNIz8crr1vG9dkdN+KELZSBNbVzX7JnSIgm5/1XXFGF20YBGJaBtMY6FkkIh8VD
         KBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qTdH1r3W7+7XrJjtj3MXSfd+HsuREu6pxPWxSnOeN9M=;
        b=iFpbOzmffHaQhfq4PhEOnds/3WqrmO+cnuB4StMIcpuA+SAiO3WwvnJCwwwkHkBTdW
         myPBOn0W1e6Pu2AdcddFfn15wSKLE8EtiNj6qiglptVk1nAvLvRHYJmwXzU/awXUVJ6X
         MkMrSdLKWzHo/6G/pIoFrxeFeXgn7EW6EyHBikw8yeNaYrxKTcB5OESdACuKuzHjEC2h
         iqMDokH+V3iw8CtsI0h7xQ9U2o/4LXXNyFXBQYkgsK/xpTxRi5TM2CgjwhJjONecnjRg
         o3rvEa0QfQ35SRDOqq/rASrtuhm8gK2UT4XK+u+i6I0GJ2z18JcqhjrgIQtWROk6BgZy
         9siA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a69si320626ywh.579.2018.03.12.03.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 03:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evKkq-0004cc-9M
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 06:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkI-0004Mi-9a
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkG-0003bz-AE
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:58 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:35042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkF-00036t-Ur
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:56 -0400
Received: (qmail 13406 invoked by uid 484); 12 Mar 2018 10:31:39 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.051406 secs); 12 Mar 2018 10:31:39 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 12 Mar 2018 10:31:38 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 12 Mar 2018 11:31:28 +0100
Message-Id: <1520850690-23245-3-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v4 2/4] target/arm: Add "_S" suffix to the secure
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
X-TUID: Iglft2H4M8Gp

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
Add "_S" suffix to the secure version of sysregs that have both S and NS views
Replace (S) by _S and remove (NS) for the register that are manually defined,
so all the registers follow the same convention.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
 target/arm/helper.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c5d62c8..3b31f71 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -694,12 +694,12 @@ static const ARMCPRegInfo cp_reginfo[] = {
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
 
+    r2->name = g_strdup(name);
     /* Reset the secure state to the specific incoming state.  This is
      * necessary as the register may have been defined with both states.
      */
@@ -5803,19 +5805,24 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
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
@@ -5823,7 +5830,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
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

