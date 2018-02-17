Received: by 10.28.71.27 with SMTP id u27csp2082657wma;
        Sat, 17 Feb 2018 10:41:18 -0800 (PST)
X-Google-Smtp-Source: AH8x226lx2fv/aJGvoaQ3PuQIUnOE6p+fnBaQuC7She/sGPjM/2Wo8uJyckWJlgIujAl3zq58tlB
X-Received: by 10.37.186.9 with SMTP id t9mr7168007ybg.324.1518892878072;
        Sat, 17 Feb 2018 10:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892878; cv=none;
        d=google.com; s=arc-20160816;
        b=F/R1gqIS1fXp27KVctwhLm08MaRKX4JpNCCMo/GiynuQz5E5d/p2N7sLNmd2TT8+FL
         tO3QG+6osHMymUzkmA7TJVvxR1USePyx1uE/qFl0GSevMsW22Ian878I/F2oq5aAgSVq
         IkDtvMuUjpiNx70JMq/3IjXh8i4wWhgC6iy6EFqhZcYs91K+/y7aSGGhjTxjQYOyvwTQ
         uCpjMz3yk7P05YVgFKzHFMMgt43yBL8iDBeEAM8kLBqDzUIc77SP5Bg3y1YUDFG+8eBG
         7tB2XkGkN/8eKVcvoIHh0Yxin6FPifUu/ep5+32snVXefQSWUpod6ocgN3f4TcwxTWKa
         nKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=D1c9k2YAv4Fr2n1MAcDtQOvAWXUmnI0wi/JHbwXdfnk=;
        b=OD4ewoQHnotY69tKCfaFV0oYLw/8dttrQgeppNehhdAEla9kqyLtMvUeQa+2myuwHu
         P93tUMwFjtKmmpB8QZreoTGEPGV7/wk6Y3+E8IXqACIbSFjwBcO8QN0jxabzyPy0koms
         pcI5f/YAd7NiBlgY3JSrkLLxvN5Te7zOvg2kCW3MB68bzgoryswi8qLWUlRuClWTOsjp
         /7/YxKql1XI+vnBlR9TzGxXHdnCcD+pNAuNyyOcm9h8suTA+w6uXsx/doTcywxO++dWn
         aR8FSYm2BFAIP5G2Aw8A8Ww1/0hUXZu4VsO9yVAEBDyFFteXNzG50+2LI9VAIYwZNH16
         678g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZRog78h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184si3548677ywf.345.2018.02.17.10.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:41:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZRog78h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7QD-0006Fl-CM
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:41:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79w-00018M-0Z
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79t-0001vh-IM
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:27 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:40106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79t-0001uz-AW
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:25 -0500
Received: by mail-pg0-x242.google.com with SMTP id g2so4353515pgn.7
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D1c9k2YAv4Fr2n1MAcDtQOvAWXUmnI0wi/JHbwXdfnk=;
	b=eZRog78hIGdsi2vfSWPDH9iYdiOdARbuLZDL2bZB4GPr/6OO/lrODIzsUO6txgWzv6
	N10OrmvjV03Ex05rbmxQAC0L82XMXSWEcEwPyoZKZ4xVZzvGtrTzu0ZHOve0D7DA4GZb
	I2W5xlrAQEvO8sJQd+tUefpkiO6MFv1/NZzmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D1c9k2YAv4Fr2n1MAcDtQOvAWXUmnI0wi/JHbwXdfnk=;
	b=FbzyK6uwxazxMROjPIhibc2jQuHSh41jWuwgQbOCVokBzr6cHFkw631Oa3x6Boh38U
	Leejv8Z3wiYnzAkWT1Yf3YxUOQdX3mZ9yDcf4Gl9nkIKNQ3tTysqJURSrnyk+aFhBtMY
	bBi/BtzfQAKuwoyU5uSPqTnZItTxBYkh3TnLEiU42Qm3B7xpBrd9WcmzpNofpE8obtxB
	7xp24PU/KYM0syjiuBEu3M6YAcw/cl59JPdu6YiISltMrZpnBS4AJvZ/EP2iBNOjEhdZ
	LyXlQBEdRSrqCngJcThZI5xzmPw7h73JX4VbTQ+OaKlFjKpqSNGsGhzM5UVsBC0CVwRe
	0HYg==
X-Gm-Message-State: APf1xPCgn4mDl6vJEY8mBWZ4dFPlv3qFV0o/fLYLSqBQZDxWvYS+82lL
	1bIjAiheGTHwHhm3hNv5i4yJnIzzMxs=
X-Received: by 10.99.107.200 with SMTP id g191mr8139908pgc.165.1518891863804; 
	Sat, 17 Feb 2018 10:24:23 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:52 -0800
Message-Id: <20180217182323.25885-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v2 36/67] target/arm: Implement SVE Integer
 Compare - Vectors Group
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
X-TUID: eliWGKcxVxdk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 115 +++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 193 ++++++++++++++++++++++++++++++++++++++++++++-
 target/arm/translate-sve.c |  87 ++++++++++++++++++++
 target/arm/sve.decode      |  24 ++++++
 4 files changed, 416 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0f57f64895..6ffd1fbe8e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -490,6 +490,121 @@ DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzz_d, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmple_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplt_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmple_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplt_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_cmpeq_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpne_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpge_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpgt_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphi_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmphs_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmple_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplt_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_s, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 86cd792cdf..ae433861f8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -46,14 +46,14 @@
  *
  * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
  * and bit 0 set if C is set.
- *
- * This is an iterative function, called for each Pd and Pg word
- * moving forward.
  */
 
 /* For no G bits set, NZCV = C.  */
 #define PREDTEST_INIT  1
 
+/* This is an iterative function, called for each Pd and Pg word
+ * moving forward.
+ */
 static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
 {
     if (likely(g)) {
@@ -73,6 +73,28 @@ static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
     return flags;
 }
 
+/* This is an iterative function, called for each Pd and Pg word
+ * moving backward.
+ */
+static uint32_t iter_predtest_bwd(uint64_t d, uint64_t g, uint32_t flags)
+{
+    if (likely(g)) {
+        /* Compute C from first (i.e last) !(D & G).
+           Use bit 2 to signal first G bit seen.  */
+        if (!(flags & 4)) {
+            flags += 4 - 1; /* add bit 2, subtract C from PREDTEST_INIT */
+            flags |= (d & pow2floor(g)) == 0;
+        }
+
+        /* Accumulate Z from each D & G.  */
+        flags |= ((d & g) != 0) << 1;
+
+        /* Compute N from last (i.e first) D & G.  Replace previous.  */
+        flags = deposit32(flags, 31, 1, (d & (g & -g)) != 0);
+    }
+    return flags;
+}
+
 /* The same for a single word predicate.  */
 uint32_t HELPER(sve_predtest1)(uint64_t d, uint64_t g)
 {
@@ -2180,3 +2202,168 @@ void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
         d[i] = (pg[H1(i)] & 1 ? nn : mm);
     }
 }
+
+/* Two operand comparison controlled by a predicate.
+ * ??? It is very tempting to want to be able to expand this inline
+ * with x86 instructions, e.g.
+ *
+ *    vcmpeqw    zm, zn, %ymm0
+ *    vpmovmskb  %ymm0, %eax
+ *    and        $0x5555, %eax
+ *    and        pg, %eax
+ *
+ * or even aarch64, e.g.
+ *
+ *    // mask = 4000 1000 0400 0100 0040 0010 0004 0001
+ *    cmeq       v0.8h, zn, zm
+ *    and        v0.8h, v0.8h, mask
+ *    addv       h0, v0.8h
+ *    and        v0.8b, pg
+ *
+ * However, coming up with an abstraction that allows vector inputs and
+ * a scalar output, and also handles the byte-ordering of sub-uint64_t
+ * scalar outputs, is tricky.
+ */
+#define DO_CMP_PPZZ(NAME, TYPE, OP, H, MASK)                                 \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                            \
+    intptr_t opr_sz = simd_oprsz(desc);                                      \
+    uint32_t flags = PREDTEST_INIT;                                          \
+    intptr_t i = opr_sz;                                                     \
+    do {                                                                     \
+        uint64_t out = 0, pg;                                                \
+        do {                                                                 \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                         \
+            TYPE nn = *(TYPE *)(vn + H(i));                                  \
+            TYPE mm = *(TYPE *)(vm + H(i));                                  \
+            out |= nn OP mm;                                                 \
+        } while (i & 63);                                                    \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                            \
+        out &= pg;                                                           \
+        *(uint64_t *)(vd + (i >> 3)) = out;                                  \
+        flags = iter_predtest_bwd(out, pg, flags);                           \
+    } while (i > 0);                                                         \
+    return flags;                                                            \
+}
+
+#define DO_CMP_PPZZ_B(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP, H1,   0xffffffffffffffffull)
+#define DO_CMP_PPZZ_H(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP, H1_2, 0x5555555555555555ull)
+#define DO_CMP_PPZZ_S(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP, H1_4, 0x1111111111111111ull)
+#define DO_CMP_PPZZ_D(NAME, TYPE, OP) \
+    DO_CMP_PPZZ(NAME, TYPE, OP,     , 0x0101010101010101ull)
+
+DO_CMP_PPZZ_B(sve_cmpeq_ppzz_b, uint8_t,  ==)
+DO_CMP_PPZZ_H(sve_cmpeq_ppzz_h, uint16_t, ==)
+DO_CMP_PPZZ_S(sve_cmpeq_ppzz_s, uint32_t, ==)
+DO_CMP_PPZZ_D(sve_cmpeq_ppzz_d, uint64_t, ==)
+
+DO_CMP_PPZZ_B(sve_cmpne_ppzz_b, uint8_t,  !=)
+DO_CMP_PPZZ_H(sve_cmpne_ppzz_h, uint16_t, !=)
+DO_CMP_PPZZ_S(sve_cmpne_ppzz_s, uint32_t, !=)
+DO_CMP_PPZZ_D(sve_cmpne_ppzz_d, uint64_t, !=)
+
+DO_CMP_PPZZ_B(sve_cmpgt_ppzz_b, int8_t,  >)
+DO_CMP_PPZZ_H(sve_cmpgt_ppzz_h, int16_t, >)
+DO_CMP_PPZZ_S(sve_cmpgt_ppzz_s, int32_t, >)
+DO_CMP_PPZZ_D(sve_cmpgt_ppzz_d, int64_t, >)
+
+DO_CMP_PPZZ_B(sve_cmpge_ppzz_b, int8_t,  >=)
+DO_CMP_PPZZ_H(sve_cmpge_ppzz_h, int16_t, >=)
+DO_CMP_PPZZ_S(sve_cmpge_ppzz_s, int32_t, >=)
+DO_CMP_PPZZ_D(sve_cmpge_ppzz_d, int64_t, >=)
+
+DO_CMP_PPZZ_B(sve_cmphi_ppzz_b, uint8_t,  >)
+DO_CMP_PPZZ_H(sve_cmphi_ppzz_h, uint16_t, >)
+DO_CMP_PPZZ_S(sve_cmphi_ppzz_s, uint32_t, >)
+DO_CMP_PPZZ_D(sve_cmphi_ppzz_d, uint64_t, >)
+
+DO_CMP_PPZZ_B(sve_cmphs_ppzz_b, uint8_t,  >=)
+DO_CMP_PPZZ_H(sve_cmphs_ppzz_h, uint16_t, >=)
+DO_CMP_PPZZ_S(sve_cmphs_ppzz_s, uint32_t, >=)
+DO_CMP_PPZZ_D(sve_cmphs_ppzz_d, uint64_t, >=)
+
+#undef DO_CMP_PPZZ_B
+#undef DO_CMP_PPZZ_H
+#undef DO_CMP_PPZZ_S
+#undef DO_CMP_PPZZ_D
+#undef DO_CMP_PPZZ
+
+/* Similar, but the second source is "wide".  */
+#define DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H, MASK)                     \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                            \
+    intptr_t opr_sz = simd_oprsz(desc);                                      \
+    uint32_t flags = PREDTEST_INIT;                                          \
+    intptr_t i = opr_sz;                                                     \
+    do {                                                                     \
+        uint64_t out = 0, pg;                                                \
+        do {                                                                 \
+            TYPEW mm = *(TYPEW *)(vm + i - 8);                               \
+            do {                                                             \
+                i -= sizeof(TYPE), out <<= sizeof(TYPE);                     \
+                TYPE nn = *(TYPE *)(vn + H(i));                              \
+                out |= nn OP mm;                                             \
+            } while (i & 7);                                                 \
+        } while (i & 63);                                                    \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                            \
+        out &= pg;                                                           \
+        *(uint64_t *)(vd + (i >> 3)) = out;                                  \
+        flags = iter_predtest_bwd(out, pg, flags);                           \
+    } while (i > 0);                                                         \
+    return flags;                                                            \
+}
+
+#define DO_CMP_PPZW_B(NAME, TYPE, TYPEW, OP) \
+    DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1,   0xffffffffffffffffull)
+#define DO_CMP_PPZW_H(NAME, TYPE, TYPEW, OP) \
+    DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_2, 0x5555555555555555ull)
+#define DO_CMP_PPZW_S(NAME, TYPE, TYPEW, OP) \
+    DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_4, 0x1111111111111111ull)
+
+DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, uint8_t,  uint64_t, ==)
+DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, uint16_t, uint64_t, ==)
+DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, uint32_t, uint64_t, ==)
+
+DO_CMP_PPZW_B(sve_cmpne_ppzw_b, uint8_t,  uint64_t, !=)
+DO_CMP_PPZW_H(sve_cmpne_ppzw_h, uint16_t, uint64_t, !=)
+DO_CMP_PPZW_S(sve_cmpne_ppzw_s, uint32_t, uint64_t, !=)
+
+DO_CMP_PPZW_B(sve_cmpgt_ppzw_b, int8_t,   int64_t, >)
+DO_CMP_PPZW_H(sve_cmpgt_ppzw_h, int16_t,  int64_t, >)
+DO_CMP_PPZW_S(sve_cmpgt_ppzw_s, int32_t,  int64_t, >)
+
+DO_CMP_PPZW_B(sve_cmpge_ppzw_b, int8_t,   int64_t, >=)
+DO_CMP_PPZW_H(sve_cmpge_ppzw_h, int16_t,  int64_t, >=)
+DO_CMP_PPZW_S(sve_cmpge_ppzw_s, int32_t,  int64_t, >=)
+
+DO_CMP_PPZW_B(sve_cmphi_ppzw_b, uint8_t,  uint64_t, >)
+DO_CMP_PPZW_H(sve_cmphi_ppzw_h, uint16_t, uint64_t, >)
+DO_CMP_PPZW_S(sve_cmphi_ppzw_s, uint32_t, uint64_t, >)
+
+DO_CMP_PPZW_B(sve_cmphs_ppzw_b, uint8_t,  uint64_t, >=)
+DO_CMP_PPZW_H(sve_cmphs_ppzw_h, uint16_t, uint64_t, >=)
+DO_CMP_PPZW_S(sve_cmphs_ppzw_s, uint32_t, uint64_t, >=)
+
+DO_CMP_PPZW_B(sve_cmplt_ppzw_b, int8_t,   int64_t, <)
+DO_CMP_PPZW_H(sve_cmplt_ppzw_h, int16_t,  int64_t, <)
+DO_CMP_PPZW_S(sve_cmplt_ppzw_s, int32_t,  int64_t, <)
+
+DO_CMP_PPZW_B(sve_cmple_ppzw_b, int8_t,   int64_t, <=)
+DO_CMP_PPZW_H(sve_cmple_ppzw_h, int16_t,  int64_t, <=)
+DO_CMP_PPZW_S(sve_cmple_ppzw_s, int32_t,  int64_t, <=)
+
+DO_CMP_PPZW_B(sve_cmplo_ppzw_b, uint8_t,  uint64_t, <)
+DO_CMP_PPZW_H(sve_cmplo_ppzw_h, uint16_t, uint64_t, <)
+DO_CMP_PPZW_S(sve_cmplo_ppzw_s, uint32_t, uint64_t, <)
+
+DO_CMP_PPZW_B(sve_cmpls_ppzw_b, uint8_t,  uint64_t, <=)
+DO_CMP_PPZW_H(sve_cmpls_ppzw_h, uint16_t, uint64_t, <=)
+DO_CMP_PPZW_S(sve_cmpls_ppzw_s, uint32_t, uint64_t, <=)
+
+#undef DO_CMP_PPZW_B
+#undef DO_CMP_PPZW_H
+#undef DO_CMP_PPZW_S
+#undef DO_CMP_PPZW
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 021b33ced9..cb54777108 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -39,6 +39,9 @@ typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t,
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
 
+typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
+                                     TCGv_ptr, TCGv_ptr, TCGv_i32);
+
 /*
  * Helpers for extracting complex instruction fields.
  */
@@ -2485,6 +2488,90 @@ static void trans_SPLICE(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
                        vsz, vsz, a->esz, gen_helper_sve_splice);
 }
 
+/*
+ *** SVE Integer Compare - Vectors Group
+ */
+
+static void do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
+                          gen_helper_gvec_flags_4 *gen_fn)
+{
+    TCGv_ptr pd, zn, zm, pg;
+    unsigned vsz;
+    TCGv_i32 t;
+
+    if (gen_fn == NULL) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    vsz = vec_full_reg_size(s);
+    t = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    pd = tcg_temp_new_ptr();
+    zn = tcg_temp_new_ptr();
+    zm = tcg_temp_new_ptr();
+    pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(pd, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(zm, cpu_env, vec_full_reg_offset(s, a->rm));
+    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+
+    gen_fn(t, pd, zn, zm, pg, t);
+
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(zm);
+    tcg_temp_free_ptr(pg);
+
+    do_pred_flags(t);
+
+    tcg_temp_free_i32(t);
+}
+
+#define DO_PPZZ(NAME, name) \
+static void trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
+        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h,   \
+        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d,   \
+    };                                                                    \
+    do_ppzz_flags(s, a, fns[a->esz]);                                     \
+}
+
+DO_PPZZ(CMPEQ, cmpeq)
+DO_PPZZ(CMPNE, cmpne)
+DO_PPZZ(CMPGT, cmpgt)
+DO_PPZZ(CMPGE, cmpge)
+DO_PPZZ(CMPHI, cmphi)
+DO_PPZZ(CMPHS, cmphs)
+
+#undef DO_PPZZ
+
+#define DO_PPZW(NAME, name) \
+static void trans_##NAME##_ppzw(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
+        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h,   \
+        gen_helper_sve_##name##_ppzw_s, NULL                              \
+    };                                                                    \
+    do_ppzz_flags(s, a, fns[a->esz]);                                     \
+}
+
+DO_PPZW(CMPEQ, cmpeq)
+DO_PPZW(CMPNE, cmpne)
+DO_PPZW(CMPGT, cmpgt)
+DO_PPZW(CMPGE, cmpge)
+DO_PPZW(CMPHI, cmphi)
+DO_PPZW(CMPHS, cmphs)
+DO_PPZW(CMPLT, cmplt)
+DO_PPZW(CMPLE, cmple)
+DO_PPZW(CMPLO, cmplo)
+DO_PPZW(CMPLS, cmpls)
+
+#undef DO_PPZW
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7ec84fdd80..deedc9163b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -100,6 +100,7 @@
 @rdm_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5 \
 		&rprr_esz rm=%reg_movprfx
 @rd_pg4_rn_rm	........ esz:2 . rm:5  .. pg:4  rn:5 rd:5	&rprr_esz
+@pd_pg_rn_rm	........ esz:2 . rm:5 ... pg:3 rn:5 . rd:4	&rprr_esz
 
 # Three register operand, with governing predicate, vector element size
 @rda_pg_rn_rm	........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
@@ -473,6 +474,29 @@ SPLICE		00000101 .. 101 100 100 ... ..... .....		@rdn_pg_rm
 # SVE select vector elements (predicated)
 SEL_zpzz	00000101 .. 1 ..... 11 .... ..... .....		@rd_pg4_rn_rm
 
+### SVE Integer Compare - Vectors Group
+
+# SVE integer compare_vectors
+CMPHS_ppzz	00100100 .. 0 ..... 000 ... ..... 0 ....	@pd_pg_rn_rm
+CMPHI_ppzz	00100100 .. 0 ..... 000 ... ..... 1 ....	@pd_pg_rn_rm
+CMPGE_ppzz	00100100 .. 0 ..... 100 ... ..... 0 ....	@pd_pg_rn_rm
+CMPGT_ppzz	00100100 .. 0 ..... 100 ... ..... 1 ....	@pd_pg_rn_rm
+CMPEQ_ppzz	00100100 .. 0 ..... 101 ... ..... 0 ....	@pd_pg_rn_rm
+CMPNE_ppzz	00100100 .. 0 ..... 101 ... ..... 1 ....	@pd_pg_rn_rm
+
+# SVE integer compare with wide elements
+# Note these require esz != 3.
+CMPEQ_ppzw	00100100 .. 0 ..... 001 ... ..... 0 ....	@pd_pg_rn_rm
+CMPNE_ppzw	00100100 .. 0 ..... 001 ... ..... 1 ....	@pd_pg_rn_rm
+CMPGE_ppzw	00100100 .. 0 ..... 010 ... ..... 0 ....	@pd_pg_rn_rm
+CMPGT_ppzw	00100100 .. 0 ..... 010 ... ..... 1 ....	@pd_pg_rn_rm
+CMPLT_ppzw	00100100 .. 0 ..... 011 ... ..... 0 ....	@pd_pg_rn_rm
+CMPLE_ppzw	00100100 .. 0 ..... 011 ... ..... 1 ....	@pd_pg_rn_rm
+CMPHS_ppzw	00100100 .. 0 ..... 110 ... ..... 0 ....	@pd_pg_rn_rm
+CMPHI_ppzw	00100100 .. 0 ..... 110 ... ..... 1 ....	@pd_pg_rn_rm
+CMPLO_ppzw	00100100 .. 0 ..... 111 ... ..... 0 ....	@pd_pg_rn_rm
+CMPLS_ppzw	00100100 .. 0 ..... 111 ... ..... 1 ....	@pd_pg_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

