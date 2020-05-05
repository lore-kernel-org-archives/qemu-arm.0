Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp118058lfb;
        Tue, 5 May 2020 07:18:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypILPVXafQc3+P+Kd614Qqn6GsJaBDExmjJ8bRlZi5PL/X3ERBPpxljuoUHBh07daume1FVI
X-Received: by 2002:a05:6214:54c:: with SMTP id ci12mr3055679qvb.50.1588688330810;
        Tue, 05 May 2020 07:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588688330; cv=none;
        d=google.com; s=arc-20160816;
        b=s4pTXUMr11x6n3BOExnry1LmhHnSQKaG9SCcU3f6ay1pcMeAXha01BFT91IDzhuEUr
         jiYfQ9Hab8138Jh/o90PrA6sjZrG38GY+Ba4fTt7XxKc9hebiQ6anIl8CRpoxGGYw0hl
         2uCicnKIO2eQOnrFcpJ+ATcgWlhiO6eo0xvtLXZFMZmdPbh+eLZ7cHL3Ja1yXRKChkaP
         rLDZaxUCWeOZd8UosACkdnzIOz12bgsP3tEiUt+pWTy8knhAMsYzdSgCwHyU2/+LcJpY
         wqDXhdOI7c0Sikz+WSGyikZGpl3wO7aQE+Gg9PJXqxxO98fLVHt8biFlhG+//iGH0xsr
         JTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D+s9RocNcIFxp3NrHvqCZUbCbQZq5W1Nleeta/NdFEs=;
        b=ZqFisa728djAndEr0zj4HcMAsWvOT/oJGkcgPAdxGyjChvL71U8tRO0Avcu7/UQdsA
         VL2xENNaxqQeKe7RTgkDTv4cleWqhTzsrgYm+1A7TvdnCX0ccUQNXnegpM5/u4eFaw1w
         Q9LpRtMTY3wouW8IWi7uHIWhVyvUIPlQ03fFt3HKpKLYJOF1lsqSCaSwFsxNw1IqoPO1
         vd+TOZHY6xbGCuNed9mzePaRmNj6a1gWcNZDj/p726TcWoyFtC5/n0U0AP8rQ6iCfJLg
         gJlJymrWADqHgnqZH+WHR0WWzcTXfRJNkEK6oIwQZmF8BducNVygcCFvq5CDBxFyY9XS
         O2BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kSqY6C38;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k10si1303279qke.64.2020.05.05.07.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 07:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kSqY6C38;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVyPK-0001GV-4z
	for alex.bennee@linaro.org; Tue, 05 May 2020 10:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVyO6-0008Ml-IT; Tue, 05 May 2020 10:17:34 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:37442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVyO5-0005HL-PJ; Tue, 05 May 2020 10:17:34 -0400
Received: by mail-lj1-x244.google.com with SMTP id b2so1796364ljp.4;
 Tue, 05 May 2020 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+s9RocNcIFxp3NrHvqCZUbCbQZq5W1Nleeta/NdFEs=;
 b=kSqY6C38uc+GAz1PqSVMSBfSSPjmog80j8osSHOrXkpO3IyUBJ5MalKPtzlr+YFVny
 8UAAYoC8T7VM4UUwSYr41RCx8N/6PLyjgub9fkblaNY4cBbsAZHXNtyYDmII938SFSMd
 UEOeuSK/krw/afyZzeqq7xRoPqi6P83CfvyzityrNSorl9AqwNqGMTSB7SSwFqa22Vyb
 Xu5uYp0O4z1JnUmmzzqWt4BX+s5vrpUo66Zn0Qp+FE/9YKamahOxJ3Hr17RxgrmkkeqQ
 PfqE3zD8PPWWunHFRzB6oPLBpjTOPEIgEHJvlByy2lT2WBN88lEwtSq2qXAInHoh6Emg
 4A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+s9RocNcIFxp3NrHvqCZUbCbQZq5W1Nleeta/NdFEs=;
 b=t6PY0Ru2oZ9pUsDMuobPmJqkm7DB/s2aiqccj9mQ4oCkw1tegoH/A3pnW5/6MkVgOU
 OfOcx9kAhmWnrKw7Zn/VMEI1+WEhZvz0lO0QULYonvlLedn/vBcWDrmkVRKrjDiBfYlg
 8eZNuC+8XOLKIeV7OrBVxn5PN2agwwBeFWViBysD5vs0m0NSypNYbNx5umPF6wk8yUAa
 gJP4Zbkt2jqhiv5SIAP+HdQQ3JCjbmoGUwze9XDovriXqxzkFRSfBMG1QYNt3O52XTyL
 wpcOcnT/8+dLuaB1RHEhHObsWMPYmUHgLx4d4fQ3C7IN3HFaPbDGcpzTAf39tM6SW0pG
 l2zg==
X-Gm-Message-State: AGi0PubyszM+4f1dpTaiBquKnd3F8z/EQHya4Aml46KfL0Z4k+bVw081
 dhdyLJaL4aWamwQXKr9SlFTD2H0kwbc=
X-Received: by 2002:a2e:2a42:: with SMTP id q63mr1852757ljq.81.1588688251571; 
 Tue, 05 May 2020 07:17:31 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id s27sm1784661ljo.80.2020.05.05.07.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:17:30 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] target/arm: Drop access_el3_aa32ns_aa64any()
Date: Tue,  5 May 2020 16:17:29 +0200
Message-Id: <20200505141729.31930-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200505141729.31930-1-edgar.iglesias@gmail.com>
References: <20200505141729.31930-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UPhPAYUhorx2

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Calling access_el3_aa32ns() works for AArch32 only cores
but it does not handle 32-bit EL2 on top of 64-bit EL3
for mixed 32/64-bit cores.

Merge access_el3_aa32ns_aa64any() into access_el3_aa32ns()
and only use the latter.

Fixes: 68e9c2fe65 ("target-arm: Add VTCR_EL2")
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/helper.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dfefb9b3d9..7d21bf1cc7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -502,35 +502,19 @@ void init_cpreg_list(ARMCPU *cpu)
 }
 
 /*
- * Some registers are not accessible if EL3.NS=0 and EL3 is using AArch32 but
- * they are accessible when EL3 is using AArch64 regardless of EL3.NS.
- *
- * access_el3_aa32ns: Used to check AArch32 register views.
- * access_el3_aa32ns_aa64any: Used to check both AArch32/64 register views.
+ * Some registers are not accessible from AArch32 EL3 if SCR.NS == 0.
  */
 static CPAccessResult access_el3_aa32ns(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
 {
-    bool secure = arm_is_secure_below_el3(env);
-
-    assert(!arm_el_is_aa64(env, 3));
-    if (secure) {
+    if (!is_a64(env) && arm_current_el(env) == 3 &&
+        arm_is_secure_below_el3(env)) {
         return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
-                                                const ARMCPRegInfo *ri,
-                                                bool isread)
-{
-    if (!arm_el_is_aa64(env, 3)) {
-        return access_el3_aa32ns(env, ri, isread);
-    }
-    return CP_ACCESS_OK;
-}
-
 /* Some secure-only AArch32 registers trap to EL3 if used from
  * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
  * Note that an access from Secure EL1 can only happen if EL3 is AArch64.
@@ -5236,7 +5220,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
@@ -5284,7 +5268,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
@@ -7626,12 +7610,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo vpidr_regs[] = {
                 { .name = "VPIDR_EL2", .state = ARM_CP_STATE_BOTH,
                   .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
                   .type = ARM_CP_CONST, .resetvalue = cpu->midr,
                   .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
                 { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_BOTH,
                   .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
                   .type = ARM_CP_NO_RAW,
                   .writefn = arm_cp_write_ignore, .readfn = mpidr_read },
                 REGINFO_SENTINEL
-- 
2.20.1

