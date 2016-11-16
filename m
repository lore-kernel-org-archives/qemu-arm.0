Received: by 10.25.150.194 with SMTP id y185csp324469lfd;
        Wed, 16 Nov 2016 12:33:30 -0800 (PST)
X-Received: by 10.237.36.208 with SMTP id u16mr3235906qtc.213.1479328410577;
        Wed, 16 Nov 2016 12:33:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si22800878qkl.29.2016.11.16.12.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 12:33:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c76td-0001pl-TG
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 15:33:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76R9-0002Th-2s
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 15:04:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76R6-0002X9-QV
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 15:04:03 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35988)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1c76R4-0002Va-8Z; Wed, 16 Nov 2016 15:03:58 -0500
Received: by mail-wm0-x242.google.com with SMTP id m203so14602550wma.3;
	Wed, 16 Nov 2016 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bCH4AYru8YARmFi65snxTDdYvv7UsDLP2Y6ChoiogB8=;
	b=07O1oCWKsywx8PlAL2WmUBSYspCI5+Z81N/YVcTSxz/MlqjThQNU3CUl29TYhpGLl/
	ZsYMJiOvYBCH4ggnNFrZGMznJBlJ7VFZt8FjV8NwLR9/QP+HGRxnHjWkp1PMeNQ9w0Ww
	sC/RYgOh65MUKRJ+bdMVCpJlcrPX46tman6t5TO6icjbUa2zygyKpkKYQffUh0moGuDk
	MRsWa/DuJg/BtGXMCqwDwRPy9D0z+bCkwus90sX6CAtpdhSitAy9elGnGf9wKqxQwDHO
	xaYwUBHYNfO8Ljrwxi70RI88q15vxMDxvOCgF/MdaAfUleGvd6L3W2063OsxHrDYPViu
	Fjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=bCH4AYru8YARmFi65snxTDdYvv7UsDLP2Y6ChoiogB8=;
	b=lCXakweZDvezRQgAmXy6oKX6X+mVMV+vniwCs65WBLhfwE4Uxb9nV+dwJBdKJhzje3
	smy3c9UsyD+EW5zJoolANJn2Y5o9gzqQ6SDJKN1AYt9csQAEwkxf6NLATJcIbH6xClNc
	KG1QsKjoiN7cYh4hheoktqPWBsDzJwGo26/mxS/O1EkKUvqxH6iXncQgF4T5lx7KbAlF
	ONoXEjMOe8YNyI432k1o36uK26tLe64tjfgY1cE70mR4CDTPHCqBgYCVF04jBsWfczqz
	/fBfL95oWZJxehbBFIwtQH4Lk7CRsvfMIQeNm5/ZH6OJWiOAtB8Mf2mCEMmpqxCS96lv
	10Lw==
X-Gm-Message-State: ABUngvc8XkHrK3Zvj5Hg7BHw942EX4Zdr46nH6n1rQ2ipsE8PxdMsMERPKFlIwh2oYQhgQ==
X-Received: by 10.28.169.4 with SMTP id s4mr4070372wme.65.1479326636729;
	Wed, 16 Nov 2016 12:03:56 -0800 (PST)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.gmail.com with ESMTPSA id x188sm3292wmx.4.2016.11.16.12.03.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 12:03:56 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2016 21:03:31 +0100
Message-Id: <1479326625-10682-5-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479326625-10682-1-git-send-email-rth@twiddle.net>
References: <1479326625-10682-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-arm] [patch v3 04/18] tcg/aarch64: Implement field extraction
 opcodes
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
Cc: qemu-arm@nongnu.org, Claudio Fontana <claudio.fontana@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z6Vapk5t+fpA

Cc: qemu-arm@nongnu.org
Cc: Claudio Fontana <claudio.fontana@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/aarch64/tcg-target.h     |  8 ++++----
 tcg/aarch64/tcg-target.inc.c | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 410c31b..4a74bd8 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -63,8 +63,8 @@ typedef enum {
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
 #define TCG_TARGET_HAS_deposit_i32      1
-#define TCG_TARGET_HAS_extract_i32      0
-#define TCG_TARGET_HAS_sextract_i32     0
+#define TCG_TARGET_HAS_extract_i32      1
+#define TCG_TARGET_HAS_sextract_i32     1
 #define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_add2_i32         1
 #define TCG_TARGET_HAS_sub2_i32         1
@@ -95,8 +95,8 @@ typedef enum {
 #define TCG_TARGET_HAS_nand_i64         0
 #define TCG_TARGET_HAS_nor_i64          0
 #define TCG_TARGET_HAS_deposit_i64      1
-#define TCG_TARGET_HAS_extract_i64      0
-#define TCG_TARGET_HAS_sextract_i64     0
+#define TCG_TARGET_HAS_extract_i64      1
+#define TCG_TARGET_HAS_sextract_i64     1
 #define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_add2_i64         1
 #define TCG_TARGET_HAS_sub2_i64         1
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 1939d35..c0e9890 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -1640,6 +1640,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_dep(s, ext, a0, REG0(2), args[3], args[4]);
         break;
 
+    case INDEX_op_extract_i64:
+    case INDEX_op_extract_i32:
+        tcg_out_ubfm(s, ext, a0, a1, a2, a2 + args[3] - 1);
+        break;
+
+    case INDEX_op_sextract_i64:
+    case INDEX_op_sextract_i32:
+        tcg_out_sbfm(s, ext, a0, a1, a2, a2 + args[3] - 1);
+        break;
+
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, TCG_TYPE_I32, a0, a1, REG0(2), REG0(3),
                         (int32_t)args[4], args[5], const_args[4],
@@ -1785,6 +1795,10 @@ static const TCGTargetOpDef aarch64_op_defs[] = {
 
     { INDEX_op_deposit_i32, { "r", "0", "rZ" } },
     { INDEX_op_deposit_i64, { "r", "0", "rZ" } },
+    { INDEX_op_extract_i32, { "r", "r" } },
+    { INDEX_op_extract_i64, { "r", "r" } },
+    { INDEX_op_sextract_i32, { "r", "r" } },
+    { INDEX_op_sextract_i64, { "r", "r" } },
 
     { INDEX_op_add2_i32, { "r", "r", "rZ", "rZ", "rA", "rMZ" } },
     { INDEX_op_add2_i64, { "r", "r", "rZ", "rZ", "rA", "rMZ" } },
-- 
2.7.4

