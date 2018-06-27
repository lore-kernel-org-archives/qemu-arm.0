Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5781289wrq;
        Tue, 26 Jun 2018 21:52:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpenwhdPxzK8sHMteX6ViW3PcN5jWyANJpxI7d6axktt6iZlnd7MnmpxCoZGYQ98s1V1mjBQ
X-Received: by 2002:a0c:d610:: with SMTP id c16-v6mr4090875qvj.126.1530075156169;
        Tue, 26 Jun 2018 21:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075156; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnjAUJpHW0NrkuMiU8Vz2crbTIUVNL/8WhqB0LoXSun/sXUpTlck9r2wax1GPYcc70
         6O3TWhT48MdrzixQyit8GHz8l0nMHmpUZkjQ0CqTRf34ZJlivLV0bqZ8E8B1mRvnjKre
         W5dpIyABcbAEpg7fphZSyIhpZXLH2te719pwlemHAtVygz+J9x7pTmaUcpPEwdZeAkjZ
         bMlbMwe6YwwcXUryi9dWFv9dqXtKIXdJjKL4zFDlctW1zrvYgaEaJYCVPPyIEsan5stL
         0DSfG2tR+cqqV+r2cNCxuHQ/qCAM3k3DoLhCM0++5sagTj1LJZgQriPzUpyFTxt1O93l
         XbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jLi5kdXWigewkTKucYfYsu8zvwTxz4aJuC7qXtngMOQ=;
        b=VVuGDTK8qJecWJEvL5qnHVpd51RoSHd08oBDf6zlzCpCPlYwgEXOxCnUnG2VdaJRNT
         mxR4AqdbzOIB4Yox7nBKHT/8xWhpxkLjbZkho7Qe6JxjSc6/Lvx6Kp6ImcvZBxIWMHW3
         C+T2maWYoOqiu69LOY0wz4W/KV+H3bl87bJ98IUzxzxW2QPGcCV1Ym3iSjs53/FuspdY
         8dFdRT5tEzjQ08fLMk/TWoozJ8LOjdNopFrGBVpTmN8c4R0clyId3/q6HYBcdfFq59bS
         T0BTzSRJCC651MTQz/+eSmyCHG13HNxmsOF4QS5ZIdXgMK7UPrezlzxyFNWCiBE/KzFp
         wJYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhdOHjFY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u77-v6si404004qku.260.2018.06.26.21.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhdOHjFY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2RX-0002B6-JT
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:52:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29j-0004Z6-NW
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29i-0000xu-L7
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:11 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:38542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29i-0000wq-GX
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: by mail-pf0-x241.google.com with SMTP id j17-v6so387475pfn.5
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jLi5kdXWigewkTKucYfYsu8zvwTxz4aJuC7qXtngMOQ=;
	b=GhdOHjFYVgRUMkS6M7sRvhqp3XKkXgR70riE4PCAKKRi2qW6NQdd7XtsUQb4eAunCu
	bwKcdZuSn0VyUqRF7O6VjoiLsemR/6HF7RUGeKj9shZsrZzggNVFgZYqVnK5320jVY59
	L5i2SCZThddkhIe/qMnaAluXspX6XW1deNV0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jLi5kdXWigewkTKucYfYsu8zvwTxz4aJuC7qXtngMOQ=;
	b=C5p0o4aLr9e0+FsveJO5US4a9JhWchl0LiclBN2RH6MM6w7F2sBfeFOtys50pLVwRb
	pWUxLaZxWF9tfbkIRZ7ffZ6Rq+hnlZGOM/FEYynNJW4gXAwjX0l/1JNoTkebhH4olXFX
	oX9liJVddZ4Sh6548yysyG3uXLcKLQkhF5J5LUg5Mwe7T3OrppzhpYbDT0HuDEObfQv9
	E6Po3RrEQ2Q1ROv96aA6Q0x4bDa//hHMzoOPXXLonAsUoQuIo4FLUoIwybkKfesHwMav
	RX5WsuLJmkNMKIW/RETMPmpCpCVG3VpZx2r9MtKYMXgLyoIvSEx0kJvzfdmhqa7hC6N4
	tduQ==
X-Gm-Message-State: APt69E28w/Nrqnuz94ZWjd909op6rqp0uTYgqU0O54ed+4s09BZjbU8y
	g4vsN7uS9BRI4gcxIl0Wzx1XQhIsCTg=
X-Received: by 2002:a65:6689:: with SMTP id
	b9-v6mr3747646pgw.326.1530074049246; 
	Tue, 26 Jun 2018 21:34:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:20 -0700
Message-Id: <20180627043328.11531-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH v6 27/35] target/arm: Implement SVE MOVPRFX
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GwlRzoIqGinV

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Fix comment typos
---
 target/arm/translate-sve.c | 60 +++++++++++++++++++++++++++++++++++++-
 target/arm/sve.decode      |  7 +++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ff8ae67e2b..4883de3fab 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -351,6 +351,23 @@ static bool do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
     return true;
 }
 
+/* Select active elememnts from Zn and inactive elements from Zm,
+ * storing the result in Zd.
+ */
+static void do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
+{
+    static gen_helper_gvec_4 * const fns[4] = {
+        gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
+        gen_helper_sve_sel_zpzz_s, gen_helper_sve_sel_zpzz_d
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       pred_full_reg_offset(s, pg),
+                       vsz, vsz, 0, fns[esz]);
+}
+
 #define DO_ZPZZ(NAME, name) \
 static bool trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a,         \
                                 uint32_t insn)                            \
@@ -401,7 +418,13 @@ static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
     return do_zpzz_ool(s, a, fns[a->esz]);
 }
 
-DO_ZPZZ(SEL, sel)
+static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
+    }
+    return true;
+}
 
 #undef DO_ZPZZ
 
@@ -5035,3 +5058,38 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a, uint32_t insn)
     sve_access_check(s);
     return true;
 }
+
+/*
+ * Move Prefix
+ *
+ * TODO: The implementation so far could handle predicated merging movprfx.
+ * The helper functions as written take an extra source register to
+ * use in the operation, but the result is only written when predication
+ * succeeds.  For unpredicated movprfx, we need to rearrange the helpers
+ * to allow the final write back to the destination to be unconditional.
+ * For predicated zeroing movprfx, we need to rearrange the helpers to
+ * allow the final write back to zero inactives.
+ *
+ * In the meantime, just emit the moves.
+ */
+
+static bool trans_MOVPRFX(DisasContext *s, arg_MOVPRFX *a, uint32_t insn)
+{
+    return do_mov_z(s, a->rd, a->rn);
+}
+
+static bool trans_MOVPRFX_m(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
+    }
+    return true;
+}
+
+static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        do_movz_zpz(s, a->rd, a->rn, a->pg, a->esz);
+    }
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2aca9f0bb0..c725ee2584 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -270,6 +270,10 @@ ORV             00000100 .. 011 000 001 ... ..... .....         @rd_pg_rn
 EORV            00000100 .. 011 001 001 ... ..... .....         @rd_pg_rn
 ANDV            00000100 .. 011 010 001 ... ..... .....         @rd_pg_rn
 
+# SVE constructive prefix (predicated)
+MOVPRFX_z       00000100 .. 010 000 001 ... ..... .....         @rd_pg_rn
+MOVPRFX_m       00000100 .. 010 001 001 ... ..... .....         @rd_pg_rn
+
 # SVE integer add reduction (predicated)
 # Note that saddv requires size != 3.
 UADDV           00000100 .. 000 001 001 ... ..... .....         @rd_pg_rn
@@ -418,6 +422,9 @@ ADR_p64         00000100 11 1 ..... 1010 .. ..... .....         @rd_rn_msz_rm
 
 ### SVE Integer Misc - Unpredicated Group
 
+# SVE constructive prefix (unpredicated)
+MOVPRFX         00000100 00 1 00000 101111 rn:5 rd:5
+
 # SVE floating-point exponential accelerator
 # Note esz != 0
 FEXPA           00000100 .. 1 00000 101110 ..... .....          @rd_rn
-- 
2.17.1

