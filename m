Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5703659lfm;
        Tue, 28 Apr 2020 09:14:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ+LXr8A0vqsuiXrWIigcrrhVa+HgyT5k1NfnBJwl06z4DsrKkEkQFjcxF545ii+F32CQ4O
X-Received: by 2002:ac8:1901:: with SMTP id t1mr29982444qtj.269.1588090448313;
        Tue, 28 Apr 2020 09:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588090448; cv=none;
        d=google.com; s=arc-20160816;
        b=PqfEtGY4p25mGyboKCgEEPmmwOryxbTkqNnd3ParQuFWoqW5fgRZyLcxYjDC6sl+lr
         UNUmMtPDIkgrkUVOmz+bGzAp2XpkZvBH/KiwH07FjMcsl94gHrVDq8oy6G0SDSP2froF
         RgB9QTDYWYEkXiX4raYBdq+dhLxMJ0q+bndN97EfKnV7qcsFV95pWuRjvSJfqNXEaZok
         wOTgZZe0/zJKk2eBo4BOWC4SQsbc58JCyydL6up13foX/OJcGBcrZuL5vJlQkBtYFUd6
         yltWt3+M7gBa+Q8iI3NHIao6lYn4eoyCw9nLoigrWm9KaWqI8oHf2ReKjmLcTplnFrSA
         x7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qx+l5p3S5NfNVmELJKcRzKnEh+5HV6ZDJ+IasaAkEMk=;
        b=Mwu7cQB507VGvSUb25vhGJelRZF5xgY0asz5SkOLjLdQHKZC38nc7TxBBHupe2gPSM
         0g2XHAL0oAu6qYRPsSb2/FXHrMSBYpku7evJm7UsVpKR0RiblCvg8Te+dWJpfl/8Co+L
         sNFkyGNoQvLic4GdDhMqwHe32g0r39zoqOP4YzemUwFhraYzVBhabyTCGIotSKa6Ct+O
         Z4qyaaJwkZpagtUw+ftDnX1u5ot/EA9cwYLZVtanKAA7g3RCFa8vs7bajWA2GLEvbWRR
         RuIOYmVEA2afC7GMumSkQqHrgnfwK4fYS74kkem9K4QvWyyHcycdSkol2nzRyiorsNYJ
         Ub6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E1wMhSht;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si11164208qvr.218.2020.04.28.09.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 09:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E1wMhSht;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTSs3-0001KT-Mp
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 12:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jTSkW-0001No-3c
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jTSiC-0004jv-4W
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:06:19 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jTSiB-0004eS-LB; Tue, 28 Apr 2020 12:03:55 -0400
Received: by mail-lf1-x144.google.com with SMTP id d25so2418546lfi.11;
 Tue, 28 Apr 2020 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qx+l5p3S5NfNVmELJKcRzKnEh+5HV6ZDJ+IasaAkEMk=;
 b=E1wMhSht8CtHaPfrabgX0UUhuCDZEWk1WMhs5lDeUqFdM0OoKYLVYgprBA8HdIwq3j
 VxHdeAPqlpg6BBQealKd5NS+hTgyrqDoHX+6jqL3+dLrw7ao6kH5/tC1/6tt6eD0k71T
 k+czAzyELX/YvCqqa3TzSzoYRbalXw66HGd+lXxMkIiZ056Ad0Gush5PpdErkQm2gBow
 J+uZPEaXJAhguQQJhzy2SyxENCCIMCIfzYmkQ+zus8UVeegCI6KPAN2iu/r9W1eWVFOS
 F+EcAhJoQK5432FcOCa5lvRoLCigiPva8Xk3ZJXtNXXdM/8VOZynUznTSbEYKjt2KThb
 3C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qx+l5p3S5NfNVmELJKcRzKnEh+5HV6ZDJ+IasaAkEMk=;
 b=JusfBJqguKukWV9P5Qxa0iP1mwzaKan+7SwdsO2ad1av4xznv2R0orQqeOO0Cy/cMZ
 dRlStZ/7r6jSEgkSzCDHvjqKqcpmYrvNkKWVBgFUi2OfyQiLvYuPRx1mhkibbGA870FX
 zSkTntrU5N7tzaj4ZpW+PdQ1hKJAWWJWsmC9Kj2Y32oFTyd7iVAyVCUZARwY2pimQXYZ
 ww+Cf94C4/8bbELrb8kJXFg+kWLlN88v4+asbejWfYwRpCmy8ex48k/W7LyB5fUgVSfo
 st1JHXw11mY2SlANAQ4jh5gH6H9blPbY/DdaorRI6Q4QN2JgLZH+tDLYxKSZWO6/K35B
 ZerQ==
X-Gm-Message-State: AGi0PuYXDylc2pHpkB3MSlvLF6LFcvqjxOGV6TlBlQxLzZO8xJaKhtC1
 rgkwCHlXpTuYjaEU2ZREAjIQUW4+o+Q=
X-Received: by 2002:a05:6512:3f4:: with SMTP id
 n20mr19783875lfq.100.1588089833406; 
 Tue, 28 Apr 2020 09:03:53 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b9sm16186195lfp.27.2020.04.28.09.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:03:52 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] target/arm: Drop access_el3_aa32ns()
Date: Tue, 28 Apr 2020 18:03:50 +0200
Message-Id: <20200428160350.10030-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428160350.10030-1-edgar.iglesias@gmail.com>
References: <20200428160350.10030-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::144
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
X-TUID: U7iVUDyuyddk

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Calling access_el3_aa32ns() works for AArch32 only cores
but it does not handle 32-bit EL2 on top of 64-bit EL3
for mixed 32/64-bit cores.

Fold access_el3_aa32ns() into access_el3_aa32ns_aa64any()
and replace all direct uses of the aa32 only version with
access_el3_aa32ns_aa64any().

Fixes: 68e9c2fe65 ("target-arm: Add VTCR_EL2")
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/helper.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e9ea5d20f..888f5f2314 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -504,29 +504,15 @@ void init_cpreg_list(ARMCPU *cpu)
 /*
  * Some registers are not accessible if EL3.NS=0 and EL3 is using AArch32 but
  * they are accessible when EL3 is using AArch64 regardless of EL3.NS.
- *
- * access_el3_aa32ns: Used to check AArch32 register views.
- * access_el3_aa32ns_aa64any: Used to check both AArch32/64 register views.
  */
-static CPAccessResult access_el3_aa32ns(CPUARMState *env,
-                                        const ARMCPRegInfo *ri,
-                                        bool isread)
-{
-    bool secure = arm_is_secure_below_el3(env);
-
-    assert(!arm_el_is_aa64(env, 3));
-    if (secure) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
-    }
-    return CP_ACCESS_OK;
-}
-
 static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
                                                 const ARMCPRegInfo *ri,
                                                 bool isread)
 {
-    if (!arm_el_is_aa64(env, 3)) {
-        return access_el3_aa32ns(env, ri, isread);
+    bool secure = arm_is_secure_below_el3(env);
+
+    if (!arm_el_is_aa64(env, 3) && secure) {
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return CP_ACCESS_OK;
 }
@@ -5223,7 +5209,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
       .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
     { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 0,
@@ -5556,7 +5542,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .type = ARM_CP_ALIAS,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
@@ -5568,7 +5554,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
       .type = ARM_CP_64BIT | ARM_CP_ALIAS,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
       .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2),
       .writefn = vttbr_write },
     { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
@@ -5708,7 +5694,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
       .fieldoffset = offsetof(CPUARMState, cp15.hpfar_el2) },
     { .name = "HPFAR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
@@ -7565,7 +7551,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo vpidr_regs[] = {
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
-              .access = PL2_RW, .accessfn = access_el3_aa32ns,
+              .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
               .resetvalue = cpu->midr, .type = ARM_CP_ALIAS,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vpidr_el2) },
             { .name = "VPIDR_EL2", .state = ARM_CP_STATE_AA64,
@@ -7574,7 +7560,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
             { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-              .access = PL2_RW, .accessfn = access_el3_aa32ns,
+              .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
               .resetvalue = vmpidr_def, .type = ARM_CP_ALIAS,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vmpidr_el2) },
             { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_AA64,
-- 
2.20.1

