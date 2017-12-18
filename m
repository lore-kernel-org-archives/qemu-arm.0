Received: by 10.223.159.74 with SMTP id f10csp2990688wrg;
        Mon, 18 Dec 2017 10:43:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBovcAo5NbqLaLCByfOTvRH4RKlXUzgLQCgEsdeoUYzOCyqSR4FyA+UIaKDuKBOjKJsgipVKR
X-Received: by 10.13.207.3 with SMTP id r3mr549006ywd.287.1513622604966;
        Mon, 18 Dec 2017 10:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513622604; cv=none;
        d=google.com; s=arc-20160816;
        b=RU1jd1Akv3A076Y7XHyLgTN5wdl1FCKtHc7TRRbV5te7a3zicJdUTWhzxvS2tV+DKB
         px+rr2vonIjohXjJ+rK1WTKhjTapXQ0Ib+35wnHi7umhtQGgqluinb8gN3YLiN4BPvQ3
         2ieLJbf4J8/rY9I/ld2cYlyut9CBQnlOWRCUwcXPwOvJJTfs7SlYKBxq3ZsFy7xLRan+
         m6Ob71P6y8nI2yqQV+rh8gffTMZNrGpl1VAEyPughWZWTQN8GKAxXlM96cBfxQ4eHGUn
         CNFWw1N0hLsuqPsTQX1lkSk/3svtF9x7xmK7Qxi15vGDsHCm0bseNteR4cvqIKuK+rbk
         7e0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zOMNyAcRduqLy3rPHjhFl619bBAjJ5WdPzQQou1JeW8=;
        b=rDFsuTyXYyLW2zlvf2MQo+ysfJyAOLBjH0LgpqDgWMNWDzwBfQ7YcECuhAPFeuZWh5
         2NxrjnmzTha2MnlsvMBSDg1qz64UMWeGWx5BbafQC3OtzvxrxMWU2D2QXnXZBRfPYTU5
         IdH1x5rSF854F8Dn7MuJGaCV3M5IvLRCzH1na4SalJydR/8cB1mii0mdL88zWkKit9nm
         5CKeEDS/LMHRsF5bTGaXmqgk8jeeBLQW57dpRI8pFbykwOPbls5Llx24EA7Mk9YeQ4GR
         aXrnAvySfm+3lPNqzNc6zV3r/pjxAKvauy8qAeD4NWWsVgx/u0FyEkb3yjR5CPTg20Xz
         8uHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aV3hinnE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k127si1416385ywc.471.2017.12.18.10.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aV3hinnE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0No-0007ix-Co
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:43:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUK-00083P-70
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUI-0001pM-6x
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:04 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUH-0001oV-V8
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:02 -0500
Received: by mail-pf0-x241.google.com with SMTP id p84so9976341pfd.3
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zOMNyAcRduqLy3rPHjhFl619bBAjJ5WdPzQQou1JeW8=;
	b=aV3hinnEjUUyGOCP6X/9vCfCQESge3iMy7lsox0hE4O7mk+34aW4Rf3kVCsOO/zKZm
	7/UTJgS86mSZWKgxrSiI/9p1feh0lxFiPJ+H3CbG0te+wqRdPyVj7vg8tRErr8RB1itQ
	cuEFvPy3a2bX++YMvPmn59Uw/bJ4syGg7mcX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zOMNyAcRduqLy3rPHjhFl619bBAjJ5WdPzQQou1JeW8=;
	b=Jtcaq+ZDSMNtNgyF17TSKliOSraDXlotNP5/Jby/qL4NV8DvVk6Dlxew+cRvXga4NV
	Oc5nah9o7T1SsSupWTINPjPHDsCJ5jiAhJduohU8pT7Tupoy153eUqgZlwQdu+JqgHbP
	pLGwob4ir97RYXG85u3E9atd4WB6c2s/Bx3lhw77XZxlWEdYACjArtGozVA/Y3pPO+4x
	FsnI1dizUEWeWUJBBCDhUkpV/pjphRr8kBxilzZ2vHc120xsQAST7K5Ds1h5i6z0nH6B
	Cw9PnmXrtCij6J2LBWPxXqw5O2XZeukvJYzLDG9orHmetVTfDpx7hqzygv+xXiWpP7xj
	RSsw==
X-Gm-Message-State: AKGB3mI5gYQwTX8x2Fx0z+nLFicrapTCin3FwWWAXRKQ7UQ7QhIt0Is5
	90fgh5qcddDC6IR0ypsc4CoC/60nCvc=
X-Received: by 10.99.125.69 with SMTP id m5mr389166pgn.415.1513619160510;
	Mon, 18 Dec 2017 09:46:00 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:45:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:33 -0800
Message-Id: <20171218174552.18871-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH 04/23] target/arm: Implement PTRUE, PFALSE,
 SETFFR
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
X-TUID: r6b+8RW3KDft

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 117 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.def         |  12 +++++
 2 files changed, 129 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 43420fa124..fabf6f0a67 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -99,3 +99,120 @@ void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
 {
     do_zzz_genfn(s, a, tcg_gen_gvec_andc);
 }
+
+static uint64_t pred_esz_mask[4] = {
+    0xffffffffffffffffull, 0x5555555555555555ull,
+    0x1111111111111111ull, 0x0101010101010101ull
+};
+
+/* See the ARM pseudocode DecodePredCount.  */
+static unsigned decode_pred_count(unsigned fullsz, int pattern, int esz)
+{
+    unsigned elements = fullsz >> esz;
+
+    switch (pattern) {
+    case 0x0: /* POW2 */
+        return pow2floor(elements);
+    case 0x1: /* VL1 */
+    case 0x2: /* VL2 */
+    case 0x3: /* VL3 */
+    case 0x4: /* VL4 */
+    case 0x5: /* VL5 */
+    case 0x6: /* VL6 */
+    case 0x7: /* VL7 */
+    case 0x8: /* VL8 */
+        return MIN(pattern, elements);
+    case 0x9: /* VL16 */
+    case 0xa: /* VL32 */
+    case 0xb: /* VL64 */
+    case 0xc: /* VL128 */
+    case 0xd: /* VL256 */
+        return MIN(16 << (pattern - 9), elements);
+    case 0x1d: /* MUL4 */
+        return elements - elements % 4;
+    case 0x1e: /* MUL3 */
+        return elements - elements % 3;
+    case 0x1f: /* ALL */
+        return elements;
+    default:   /* #uimm5 */
+        return 0;
+    }
+}
+
+/* For PTRUE, PTRUES, PFALSE, SETFFR.  */
+void trans_pred_set(DisasContext *s, arg_pred_set *a, uint32_t insn)
+{
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem, setsz, setalign, allalign, ofs;
+    uint64_t word, lastword;
+    TCGv_i64 t;
+
+    numelem = decode_pred_count(fullsz, a->pat, a->esz);
+
+    /* Determine what we must store into each bit, and how many.  */
+    if (numelem == 0 || a->i == 0) {
+        lastword = word = 0;
+        setsz = fullsz;
+    } else {
+        setsz = numelem << a->esz;
+        lastword = word = pred_esz_mask[a->esz];
+        if (setsz % 64) {
+            lastword &= ~(-1ull << (setsz % 64));
+        }
+    }
+
+    /* Rescale from bits to bytes.  */
+    fullsz /= 8;
+    setsz /= 8;
+
+    ofs = pred_full_reg_offset(s, a->rd);
+    setalign = QEMU_ALIGN_DOWN(setsz, 8);
+    allalign = QEMU_ALIGN_UP(fullsz, 16);
+
+    /* Perform the stores.  Use the vector infrastructure if the sizes
+       are large enough.  */
+    if (fullsz > 8) {
+        if (setsz >= 16 && setsz % 16 == 0) {
+            tcg_gen_gvec_dup64i(ofs, setsz, allalign, word);
+        } else if (setsz <= 8 && fullsz > 16) {
+            tcg_gen_gvec_dup64i(ofs, allalign, allalign, 0);
+        } else if (fullsz - setsz <= 8 && fullsz > 16) {
+            tcg_gen_gvec_dup64i(ofs, allalign, allalign, word);
+        } else {
+            unsigned i = 0;
+
+            t = tcg_temp_new_i64();
+            if (setalign > 0) {
+                tcg_gen_movi_i64(t, word);
+                for (; i < setalign; i += 8) {
+                    tcg_gen_st_i64(t, cpu_env, ofs + i);
+                }
+            }
+            if (lastword != word) {
+                tcg_gen_movi_i64(t, lastword);
+                tcg_gen_st_i64(t, cpu_env, ofs + i);
+                i += 8;
+            }
+            if (i < fullsz) {
+                tcg_gen_movi_i64(t, 0);
+                for (; i < fullsz; i += 8) {
+                    tcg_gen_st_i64(t, cpu_env, ofs + i);
+                }
+            }
+            tcg_temp_free_i64(t);
+            goto done;
+        }
+    }
+    t = tcg_const_i64(lastword);
+    tcg_gen_st_i64(t, cpu_env, ofs + setalign);
+    tcg_temp_free_i64(t);
+
+ done:
+    /* PTRUES */
+    if (a->s) {
+        tcg_gen_movi_i32(cpu_NF, -(lastword != 0));
+        tcg_gen_movi_i32(cpu_CF, lastword != 0);
+        tcg_gen_movi_i32(cpu_ZF, lastword == 0);
+        tcg_gen_movi_i32(cpu_VF, 0);
+    }
+}
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 0f47a21ef0..f802031f51 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -25,6 +25,7 @@
 # instruction patterns.
 
 &rrr_esz		rd rn rm esz
+&pred_set		rd pat esz i s
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -43,3 +44,14 @@ AND_zzz			00000100 00 1 ..... 001 100 ..... .....		@rd_rn_rm
 ORR_zzz			00000100 01 1 ..... 001 100 ..... .....		@rd_rn_rm
 EOR_zzz			00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm
 BIC_zzz			00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm
+
+### SVE Predicate Generation Group
+
+# SVE initialize predicate (PTRUE, PTRUES)
+pred_set		00100101 esz:2 011 00 s:1 111000 pat:5 0 rd:4	&pred_set i=1
+
+# SVE zero predicate register (PFALSE)
+pred_set		00100101 00 011 000 1110 0100 0000 rd:4		&pred_set pat=31 esz=0 i=0 s=0
+
+# SVE initialize FFR (SETFFR)
+pred_set		00100101 0010 1100 1001 0000 0000 0000		&pred_set pat=31 esz=0 rd=16 i=1 s=0
-- 
2.14.3

