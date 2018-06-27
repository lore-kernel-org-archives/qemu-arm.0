Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5773641wrq;
        Tue, 26 Jun 2018 21:40:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdzEp7wSy9YKm4t5kfrZMxckauDVTv8VMD9hsvzzL4ndmPbLTWfjVqU4YPc0pTq9OonCTyd
X-Received: by 2002:a0c:8404:: with SMTP id l4-v6mr4094577qva.32.1530074413860;
        Tue, 26 Jun 2018 21:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074413; cv=none;
        d=google.com; s=arc-20160816;
        b=wq7iQAXJlhu/ZAYMnto/oFuwWhJpKXqqs5c8PUcUQiCen9Y5Jo0SAkIkTCfw9+28/k
         AkqDU/6RcmggCbFUpn5XRymmoPf2Jo0wqfjEewR8F+968sDt5RAAh+A6ly/OKWdneFPU
         YWOf06ywkighFi02LWwKmknGzwka+cOerf+k/CcrzeBGSRtMqbMaos0vUBFBX5zl/jmj
         AWns65gc499j4TIOJynadk3MnkegXiqDKBejLZtMYpPq9+yE8Zom0qZgv4erKIZooBkl
         5s9XrMu+9fSGSDojjYGw2PvdscrWfehUysyiOYgIkWjkUL+xAhIcy1Rf9kPEKVXoh1hT
         xnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Z1YLZRLEbj7aorz8UjYdcjeWqwKLgRDQNDaDKpgC6UY=;
        b=RXWFsNdyXldkKbjJzMNrmQxtBESMZDqrns+fBdEWOnCuatGsT2DujSCzLrI5Jc6JGA
         Qq0IvV3DFf9X/jE5UpafV47GaddALSCEHBOmGnMv3y6Q1fiQFjsvCnK0aoO8ScUAg0ZE
         7AqGiD4/ZtWqrmBXqXQ/C74yc6RmnyUmoWjbmwDUUFHTLT1RADx44D9IENDaqrmiu8WZ
         PCz0t8/ZNv/A01F4XquiY1YCj4Bc6w4e5pdlpwecewvMZMdrXZL/jXttcIb6GQqkldNy
         ag/tFqNW4iYDURxoY9dYRvM8xEagqe1r3RO25BwmSRfxxiOpfQi9+NU2endazswgX3tH
         cHNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iM8wVUdJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y5-v6si1772003qvn.85.2018.06.26.21.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iM8wVUdJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2FZ-0000MA-8q
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29M-00049p-6R
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29J-0000Ke-Ml
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:48 -0400
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:46870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29J-0000IM-94
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:45 -0400
Received: by mail-pf0-x22f.google.com with SMTP id q1-v6so379241pff.13
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z1YLZRLEbj7aorz8UjYdcjeWqwKLgRDQNDaDKpgC6UY=;
	b=iM8wVUdJnnf+peyqEnLTOTvNqikAjaigTyfg6IevPRdn0/rCpctrSgIXNqdzzBjYM1
	l0J84ZRsgbQ4VoQ2KCHJ+9FbQ/nUhmbbcIZiJqvWQyQq/68zXu/9cIW4TKdNMpcRiK/u
	USv86+x4xqagAzQtavDkX2Yr+1Ez55aSV4zGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z1YLZRLEbj7aorz8UjYdcjeWqwKLgRDQNDaDKpgC6UY=;
	b=NjRwu6jhDhHmcUCH6HyuEaTWZGEimMWxCP3ta9uN2a1doAmU27MR/PyTMSrMgyohl7
	ZTVsnsSEM2te3W1tlW/tHv7OyPLPOvBLTRb1FgFV6Y/3byRmfcvGFo1DRkCVIQhIVOyU
	dKke9xHqTGhlJUxVeayHg+EXaxLTHe/q9+lFUFmPF56RA0zzhrLreVTKDFAGDHuSdnIu
	3y29ozQTSHR/KgpKIhBtuqh6rRkovfx7ghkru0coXvfW4evrh+mD316jRhXJSwuj6y9S
	jLyEoC8uL8VPcAA3gUOHknnEvMq9L6d6d3qwGkgvsXD8JURwBY4XDQbwOyn6iNhE9bg/
	Wscw==
X-Gm-Message-State: APt69E1IWZXbE61OAd/68ytNhhZTjJijaqpCFBi5M5ldgzFVUMbFLxnO
	86kygdJfmE++8dX3pYB5brg7P7XASis=
X-Received: by 2002:a63:3190:: with SMTP id
	x138-v6mr3761884pgx.60.1530074023945; 
	Tue, 26 Jun 2018 21:33:43 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:02 -0700
Message-Id: <20180627043328.11531-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22f
Subject: [Qemu-devel] [PATCH v6 09/35] target/arm: Implement SVE load and
 broadcast element
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
X-TUID: AbPp+dn8ZHjk

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Fix typo in comment.
---
 target/arm/helper-sve.h    |  5 +++
 target/arm/sve_helper.c    | 41 +++++++++++++++++++++++++
 target/arm/translate-sve.c | 62 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  5 +++
 4 files changed, 113 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 68e55a8d03..a5d3bb121c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -274,6 +274,11 @@ DEF_HELPER_FLAGS_3(sve_clr_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_clr_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_clr_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_movz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_movz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_movz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_movz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_asr_zpzi_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_asr_zpzi_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_asr_zpzi_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2d08b7dcd3..93f2942590 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -995,6 +995,47 @@ void HELPER(sve_clr_d)(void *vd, void *vg, uint32_t desc)
     }
 }
 
+/* Copy Zn into Zd, and store zero into inactive elements.  */
+void HELPER(sve_movz_b)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] & expand_pred_b(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_movz_h)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] & expand_pred_h(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_movz_s)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] & expand_pred_s(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_movz_d)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[1] & -(uint64_t)(pg[H1(i)] & 1);
+    }
+}
+
 /* Three-operand expander, immediate operand, controlled by a predicate.
  */
 #define DO_ZPZI(NAME, TYPE, H, OP)                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 483ad33179..954d6653d3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -606,6 +606,20 @@ static bool do_clr_zp(DisasContext *s, int rd, int pg, int esz)
     return true;
 }
 
+/* Copy Zn into Zd, storing zeros into inactive elements.  */
+static void do_movz_zpz(DisasContext *s, int rd, int rn, int pg, int esz)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_movz_b, gen_helper_sve_movz_h,
+        gen_helper_sve_movz_s, gen_helper_sve_movz_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       pred_full_reg_offset(s, pg),
+                       vsz, vsz, 0, fns[esz]);
+}
+
 static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
                         gen_helper_gvec_3 *fn)
 {
@@ -3999,6 +4013,54 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
     return true;
 }
 
+/* Load and broadcast element.  */
+static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned psz = pred_full_reg_size(s);
+    unsigned esz = dtype_esz[a->dtype];
+    TCGLabel *over = gen_new_label();
+    TCGv_i64 temp;
+
+    /* If the guarding predicate has no bits set, no load occurs.  */
+    if (psz <= 8) {
+        /* Reduce the pred_esz_masks value simply to reduce the
+         * size of the code generated here.
+         */
+        uint64_t psz_mask = MAKE_64BIT_MASK(0, psz * 8);
+        temp = tcg_temp_new_i64();
+        tcg_gen_ld_i64(temp, cpu_env, pred_full_reg_offset(s, a->pg));
+        tcg_gen_andi_i64(temp, temp, pred_esz_masks[esz] & psz_mask);
+        tcg_gen_brcondi_i64(TCG_COND_EQ, temp, 0, over);
+        tcg_temp_free_i64(temp);
+    } else {
+        TCGv_i32 t32 = tcg_temp_new_i32();
+        find_last_active(s, t32, esz, a->pg);
+        tcg_gen_brcondi_i32(TCG_COND_LT, t32, 0, over);
+        tcg_temp_free_i32(t32);
+    }
+
+    /* Load the data.  */
+    temp = tcg_temp_new_i64();
+    tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << esz);
+    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
+                        s->be_data | dtype_mop[a->dtype]);
+
+    /* Broadcast to *all* elements.  */
+    tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
+                         vsz, vsz, temp);
+    tcg_temp_free_i64(temp);
+
+    /* Zero the inactive elements.  */
+    gen_set_label(over);
+    do_movz_zpz(s, a->rd, a->rd, a->pg, esz);
+    return true;
+}
+
 static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
                       int msz, int esz, int nreg)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 675b81aaa0..765e7e479b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -28,6 +28,7 @@
 %imm8_16_10     16:5 10:3
 %imm9_16_10     16:s6 10:3
 %size_23        23:2
+%dtype_23_13    23:2 13:2
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz     22:2 5:5 !function=tszimm_esz
@@ -751,6 +752,10 @@ LDR_pri         10000101 10 ...... 000 ... ..... 0 ....         @pd_rn_i9
 # SVE load vector register
 LDR_zri         10000101 10 ...... 010 ... ..... .....          @rd_rn_i9
 
+# SVE load and broadcast element
+LD1R_zpri       1000010 .. 1 imm:6 1.. pg:3 rn:5 rd:5 \
+                &rpri_load dtype=%dtype_23_13 nreg=0
+
 ### SVE Memory Contiguous Load Group
 
 # SVE contiguous load (scalar plus scalar)
-- 
2.17.1

