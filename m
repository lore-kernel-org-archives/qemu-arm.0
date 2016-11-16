Received: by 10.25.150.194 with SMTP id y185csp302057lfd;
        Wed, 16 Nov 2016 11:40:44 -0800 (PST)
X-Received: by 10.200.51.119 with SMTP id u52mr3049447qta.226.1479325244770;
        Wed, 16 Nov 2016 11:40:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v90si7260704qte.313.2016.11.16.11.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 11:40:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c764Z-00070C-H4
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 14:40:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c75qf-0004HA-LZ
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 14:26:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c75qd-0005zd-EN
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 14:26:21 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1c75qd-0005yO-6v; Wed, 16 Nov 2016 14:26:19 -0500
Received: by mail-wm0-x242.google.com with SMTP id a20so14361385wme.2;
	Wed, 16 Nov 2016 11:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9K/gIUkRGdN7VqhrnINzUBvBRiOEK87DJVZEPSV1EFs=;
	b=wZHJ9lFwOCujs948jmDIkt2YEakwhmUPkjXlQTXNrZ3bvBHRc8sxwUaXI+aRUFN/NP
	dcXKZ31tRDX8Tz9ZYyGZhgZ94lU24mpNmVWJb30m+2oBgr6nE+ISQlJFaL2/trWkOQtC
	B9WEfiFMMCiEHns8bWiLEkwoc6xcyibKLSYwYkO+SVdELTeaJbK63uOuoD/z8+55G5b8
	+1dn4vRElLzBghDT973waMMy7ry86KQPjjwglxlUPRehzW57buZG7mpQHIbMejU9u+9x
	+IoVJGRcj2gO+zAU+844rHGYmSFeObT6EflrNIF5Ucr1Hx8dvlKB2TcVblj2mG6wlqGy
	dp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=9K/gIUkRGdN7VqhrnINzUBvBRiOEK87DJVZEPSV1EFs=;
	b=aheqsVZ4cbtE3pY+ZUQvM/CLQQUEWYs7j0RXh/dh1BMCICcJ+7fdieUicXkOhiMs4e
	hrK1iDpL7gKkzWW8gmc0+c5asuMeeszlFrEfJ3sCH5LV6Ki0MYDu4ZhCX3al+1RvoYq6
	z24krps2aYsT8HiJ9IKlDtTj0xbjOhimBr7szTmPFpDphux2wuwFcwhP0FGj7qS7PsFO
	OoaBT5Iba5BPG8BukoC3LNBG8a7WupvZB+5uauDzDo7zayNm2s5mclCOYTuboRQ02V96
	T+VnGnSHhFaWaq2bfz88JwQUSJOudPkWLWb6UOphsJZ+rP999fjKioCQwqC/OPw3aRGw
	AOUg==
X-Gm-Message-State: ABUngvdBrz1nY13KbTzvsuNIAz1VdBMTbIXMOgGVeboNIfh2xlCelRYC0Ksolm65uPD8Xw==
X-Received: by 10.28.107.21 with SMTP id g21mr11912529wmc.131.1479324377773;
	Wed, 16 Nov 2016 11:26:17 -0800 (PST)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.gmail.com with ESMTPSA id 197sm686930wmy.16.2016.11.16.11.26.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 11:26:17 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2016 20:25:29 +0100
Message-Id: <1479324335-2074-20-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479324335-2074-1-git-send-email-rth@twiddle.net>
References: <1479324335-2074-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-devel] [PATCH 19/25] tcg/arm: Handle ctz and clz opcodes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqaHRSg9WX2/

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/arm/tcg-target.h     |  4 ++--
 tcg/arm/tcg-target.inc.c | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 02cc242..4cb94dc 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -110,8 +110,8 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
-#define TCG_TARGET_HAS_clz_i32          0
-#define TCG_TARGET_HAS_ctz_i32          0
+#define TCG_TARGET_HAS_clz_i32          use_armv5t_instructions
+#define TCG_TARGET_HAS_ctz_i32          use_armv7_instructions
 #define TCG_TARGET_HAS_deposit_i32      use_armv7_instructions
 #define TCG_TARGET_HAS_extract_i32      use_armv7_instructions
 #define TCG_TARGET_HAS_sextract_i32     use_armv7_instructions
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 6765a9d..7595c04 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -261,6 +261,9 @@ typedef enum {
     ARITH_BIC = 0xe << 21,
     ARITH_MVN = 0xf << 21,
 
+    INSN_CLZ       = 0x016f0f10,
+    INSN_RBIT      = 0x06ff0f30,
+
     INSN_LDR_IMM   = 0x04100000,
     INSN_LDR_REG   = 0x06100000,
     INSN_STR_IMM   = 0x04000000,
@@ -1832,6 +1835,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_ctz_i32:
+        tcg_out_dat_reg(s, COND_AL, INSN_RBIT, TCG_REG_TMP, 0, args[1], 0);
+        a1 = TCG_REG_TMP;
+        goto do_clz;
+
+    case INDEX_op_clz_i32:
+        a1 = args[1];
+    do_clz:
+        a0 = args[0];
+        a2 = args[2];
+        c = const_args[2];
+        if (c && a2 == 32) {
+            tcg_out_dat_reg(s, COND_AL, INSN_CLZ, a0, 0, a1, 0);
+            break;
+        }
+        tcg_out_dat_imm(s, COND_AL, ARITH_CMP, 0, a1, 0);
+        tcg_out_dat_reg(s, COND_NE, INSN_CLZ, a0, 0, a1, 0);
+        if (c || a0 != a2) {
+            tcg_out_dat_rIK(s, COND_EQ, ARITH_MOV, ARITH_MVN, a0, 0, a2, c);
+        }
+        break;
+
     case INDEX_op_brcond_i32:
         tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
                        args[0], args[1], const_args[1]);
@@ -1966,6 +1991,8 @@ static const TCGTargetOpDef arm_op_defs[] = {
     { INDEX_op_sar_i32, { "r", "r", "ri" } },
     { INDEX_op_rotl_i32, { "r", "r", "ri" } },
     { INDEX_op_rotr_i32, { "r", "r", "ri" } },
+    { INDEX_op_clz_i32, { "r", "r", "rIK" } },
+    { INDEX_op_ctz_i32, { "r", "r", "rIK" } },
 
     { INDEX_op_brcond_i32, { "r", "rIN" } },
     { INDEX_op_setcond_i32, { "r", "r", "rIN" } },
-- 
2.7.4

