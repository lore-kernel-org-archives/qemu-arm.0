Received: by 10.25.150.194 with SMTP id y185csp318294lfd;
        Wed, 16 Nov 2016 12:18:39 -0800 (PST)
X-Received: by 10.55.41.39 with SMTP id p39mr5692886qkh.245.1479327519177;
        Wed, 16 Nov 2016 12:18:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 51si7309839qtt.270.2016.11.16.12.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 12:18:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c76fG-0006WR-EP
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 15:18:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76RB-0002VG-4n
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 15:04:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76RA-0002bS-Cs
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 15:04:05 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1c76R7-0002XD-ME; Wed, 16 Nov 2016 15:04:01 -0500
Received: by mail-wm0-x241.google.com with SMTP id u144so14617565wmu.0;
	Wed, 16 Nov 2016 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AftISOLO2War52udVsco0abKH7+leItGQemovEPHvFI=;
	b=KBHO8O17iUx8uzbQFdVrcK/kALBomnJbLTMO4tPEzYwcNzIMLe2+HRzBGz2JQX3C2x
	/zhd4nDFS2M90sYklrTUofPu3ZKu1BvwLdptjXw9UKrIAEMLi/yLpmtzI1G4hX59wF6K
	Qwvv4b/Fo8TrWH5I+vYENDjcPuPbY9p0ZhhLbNKPNCWBbk6x/VidxfGISiH3vJ/xA0wy
	AZ2r+BTptZnJsRD1xT1Hv0QWGgzJvVlA94jIGu/JkSojgYEI0Icd7io5MW8V9y9VKilY
	WwpVBEOCDefuUOTtxMNaY/BiKw/9ANmUQ1FYA+7t3H4tVSvC+r+ZCC1z2fWJ7Xwn36xG
	JYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=AftISOLO2War52udVsco0abKH7+leItGQemovEPHvFI=;
	b=Okkp1dHx/nLd5Zv3w1KMMYgOh5w+Z0NW9HSUVv4YM7gg7CXT8+ONIQwMDwyVNNz/sK
	cuEVk7ty+OvXQ9x+rWN9s4o8A5Jsct4IZKWlGB0FZkw60Ir+i4qh4viwHwmg3o7cNUJ4
	WWJ6Iju+Lor8aKrEQXZIg0IgphmTP3K0asBSsKGoyarGQWbXh9L1af8gq5zq6WFZMlHm
	IbKNbdYNvravtZL01uB2/HiT7zsPBlj7Kw6uSxs0nQTxwH+sHl170Od9C+vhcEivapIG
	ERsA/Wx+QHMi1iAA7jzWokawoot8+C7g0IGr2Gm56iTyR4pomn2NLZonatWPs5Jak5vc
	+Z9Q==
X-Gm-Message-State: ABUngve0ITWD3slJNT/P9J3WlUVINYVMXrsLidyEJ4fJu7ZO2j8tmrZDF7QtLqw9zDJvtQ==
X-Received: by 10.28.226.7 with SMTP id z7mr12650238wmg.83.1479326640177;
	Wed, 16 Nov 2016 12:04:00 -0800 (PST)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.gmail.com with ESMTPSA id x188sm3292wmx.4.2016.11.16.12.03.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 12:03:59 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2016 21:03:33 +0100
Message-Id: <1479326625-10682-7-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479326625-10682-1-git-send-email-rth@twiddle.net>
References: <1479326625-10682-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-arm] [patch v3 06/18] tcg/arm: Implement field extraction
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 55C6tYOVQa7Y

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/arm/tcg-target.h     |  4 ++--
 tcg/arm/tcg-target.inc.c | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index d1fe12b..4e30728 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -111,8 +111,8 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
 #define TCG_TARGET_HAS_deposit_i32      use_armv7_instructions
-#define TCG_TARGET_HAS_extract_i32      0
-#define TCG_TARGET_HAS_sextract_i32     0
+#define TCG_TARGET_HAS_extract_i32      use_armv7_instructions
+#define TCG_TARGET_HAS_sextract_i32     use_armv7_instructions
 #define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_mulu2_i32        1
 #define TCG_TARGET_HAS_muls2_i32        1
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 1415c27..6765a9d 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -713,6 +713,20 @@ static inline void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((ofs + len - 1) << 16));
 }
 
+static inline void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
+                                   TCGArg a1, int ofs, int len)
+{
+    tcg_out32(s, 0x07e00050 | (cond << 28) | (rd << 12) | a1
+              | (ofs << 7) | ((len - 1) << 16));
+}
+
+static inline void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
+                                    TCGArg a1, int ofs, int len)
+{
+    tcg_out32(s, 0x07a00050 | (cond << 28) | (rd << 12) | a1
+              | (ofs << 7) | ((len - 1) << 16));
+}
+
 /* Note that this routine is used for both LDR and LDRH formats, so we do
    not wish to include an immediate shift at this point.  */
 static void tcg_out_memop_r(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
@@ -1894,6 +1908,12 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_deposit(s, COND_AL, args[0], args[2],
                         args[3], args[4], const_args[2]);
         break;
+    case INDEX_op_extract_i32:
+        tcg_out_extract(s, COND_AL, args[0], args[1], args[2], args[3]);
+        break;
+    case INDEX_op_sextract_i32:
+        tcg_out_sextract(s, COND_AL, args[0], args[1], args[2], args[3]);
+        break;
 
     case INDEX_op_div_i32:
         tcg_out_sdiv(s, COND_AL, args[0], args[1], args[2]);
@@ -1976,6 +1996,8 @@ static const TCGTargetOpDef arm_op_defs[] = {
     { INDEX_op_ext16u_i32, { "r", "r" } },
 
     { INDEX_op_deposit_i32, { "r", "0", "rZ" } },
+    { INDEX_op_extract_i32, { "r", "r" } },
+    { INDEX_op_sextract_i32, { "r", "r" } },
 
     { INDEX_op_div_i32, { "r", "r", "r" } },
     { INDEX_op_divu_i32, { "r", "r", "r" } },
-- 
2.7.4

