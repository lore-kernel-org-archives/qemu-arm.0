Received: by 10.28.71.27 with SMTP id u27csp2082207wma;
        Sat, 17 Feb 2018 10:40:36 -0800 (PST)
X-Google-Smtp-Source: AH8x2255qi2X+ERVcaQ7UAGeDDDeTtcZRVpoNR2aA33UwP6PCjQ2kX5XCzqqqTJyZRUuXqDyaW22
X-Received: by 10.129.103.5 with SMTP id b5mr1227051ywc.11.1518892836504;
        Sat, 17 Feb 2018 10:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892836; cv=none;
        d=google.com; s=arc-20160816;
        b=W5xzmtJkxcV96zGOg7NFBteQ2Zw30n6jTWjgf8wmqbmhmVa9uRuzk5MKp8Af7ehhoh
         G1k/94IIGfMg3w56fs64DcDQWwYFgxPeS4XvgmE3CXFNUT2yhAdERhEm53+x8EPBWuW9
         Cv/445RG4Ei9LfD1ZagNtD1kwwhESkmoQ1QXSbNzI/00uUn1JzadvmqSvPCDJh2Kpsbq
         Z6gjneCwPQYmEVbzGetolSkUGt1W5RABHt01ECBJcAmSs+MtlI6xvpByzryZjgxBJOrj
         9u61i54P7noSxh0TpazomxHwJ1Gfj/GJpUMRIK3VtNJpOhhk+Dp8Kww5ibfTqerm0ueE
         LBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k4jL592UFSa2Gtp23s7RFTcDDeu5zdBjKBpgmgfqBXU=;
        b=GfxEANOaOdJzmqH1rDq2sR6jwcwuc+0zyfA3aQmz94qELrnD9aY4eF7ZpFDHZe3f4i
         qRXhbWaryYKrfLycqI4x5X78quwx8TRSrqRsdWQvntduM/7/JU9rftZ9ezeppe8iU8jv
         TmQruTz9Dp9n/fhc4w0jFOz5jAP/uVQcAo7PJpkul5Dj4brU6w6sY/oNAedCOB1CqrOi
         3LpbEpzCksI5YrShXAAxDjV7fWARPyXziV9viQ56AwORFir7UwO4aXnL2FUtNUls9Eun
         k+H4sJfudysgMXDUp8l6X83wfeZP9/hxtIfTAkz6uDk8vViZDbKmGr3hlFldcKPh9dvd
         357Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KatThmkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si1392839ybk.662.2018.02.17.10.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:40:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KatThmkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7PX-000636-Ui
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:40:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79t-00015B-5n
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79q-0001tr-0O
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:25 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79p-0001tb-QF
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:21 -0500
Received: by mail-pf0-x241.google.com with SMTP id g17so591369pfh.1
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k4jL592UFSa2Gtp23s7RFTcDDeu5zdBjKBpgmgfqBXU=;
	b=KatThmknFgzHb/Wf3HO7P2EK564kCbe3j/4RB061Jcs8gnNuWy6VTDIow5DZvgSiHR
	Ipot+dEmFcABolk0K8yYRySP08UKC24xJahxgpm2MFilWrc22VZmPWSS9GsnDiDf3toN
	338t0xA1WZ31bByeJosFPH95W0Lg89cZ/GCPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k4jL592UFSa2Gtp23s7RFTcDDeu5zdBjKBpgmgfqBXU=;
	b=G8vFn5AvWUXob8iX368lzIUn5aBHvUo7CpkgnYmbtCNj1DDIMAUsVLPEh+LouEuRF1
	/QJrAjoFv5x53bv+h16MIEHtsH7DyhoxXl7cXaeKhqhAhLkZYv0INunMCUkWIe4z46tl
	/YwS9jk2cbNKAMRsk8H1MkTtHnyvzCa7JHTKM6Q4MFlEic8EFC0tLsk0uToz7Y24tymd
	hnekBj5R0LBpj/d0ahVh/qdGVjBo4UjRctr2dp1dgsZ2msa27dphfbvLGM0+ZI8dCctU
	ZA/mBPYgrxNI12vdI9t/GQeRNzyqU5+EyJQShl18SlZQvO9NBD12xz+Q/zTivp+7gzey
	XOVw==
X-Gm-Message-State: APf1xPBZk94sa51ROzieyHZVIoRClmBD7yk8WG7G8bUsr5wICNWZ/jn6
	WFB65PUj2b0GLzQ+36nrmCwV6A==
X-Received: by 10.99.168.8 with SMTP id o8mr8387252pgf.42.1518891860910;
	Sat, 17 Feb 2018 10:24:20 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:50 -0800
Message-Id: <20180217182323.25885-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 34/67] target/arm: Implement SVE vector splice
 (predicated)
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
X-TUID: 5JqDrshcik+7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 10 ++++++++++
 target/arm/sve.decode      |  3 +++
 4 files changed, 52 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3b7c54905d..c3f8a2b502 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -479,6 +479,8 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a67bb579b8..f524a1ddce 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2088,3 +2088,40 @@ int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 
     return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
 }
+
+void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc) / 8;
+    int esz = simd_data(desc);
+    uint64_t pg, first_g, last_g, len, mask = pred_esz_masks[esz];
+    intptr_t i, first_i, last_i;
+    ARMVectorReg tmp;
+
+    first_i = last_i = 0;
+    first_g = last_g = 0;
+
+    /* Find the extent of the active elements within VG.  */
+    for (i = QEMU_ALIGN_UP(opr_sz, 8) - 8; i >= 0; i -= 8) {
+        pg = *(uint64_t *)(vg + i) & mask;
+        if (pg) {
+            if (last_g == 0) {
+                last_g = pg;
+                last_i = i;
+            }
+            first_g = pg;
+            first_i = i;
+        }
+    }
+
+    len = 0;
+    if (first_g != 0) {
+        first_i = first_i * 8 + ctz64(first_g);
+        last_i = last_i * 8 + 63 - clz64(last_g);
+        len = last_i - first_i + (1 << esz);
+        if (vd == vm) {
+            vm = memcpy(&tmp, vm, opr_sz * 8);
+        }
+        swap_memmove(vd, vn + first_i, len);
+    }
+    swap_memmove(vd + len, vm, opr_sz * 8 - len);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5a1ed379ad..559fb41fd6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2473,6 +2473,16 @@ static void trans_RBIT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     do_zpz_ool(s, a, fns[a->esz]);
 }
 
+static void trans_SPLICE(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       pred_full_reg_offset(s, a->pg),
+                       vsz, vsz, a->esz, gen_helper_sve_splice);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8903fb6592..70feb448e6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -464,6 +464,9 @@ REVH		00000101 .. 1001 01 100 ... ..... .....		@rd_pg_rn
 REVW		00000101 .. 1001 10 100 ... ..... .....		@rd_pg_rn
 RBIT		00000101 .. 1001 11 100 ... ..... .....		@rd_pg_rn
 
+# SVE vector splice (predicated)
+SPLICE		00000101 .. 101 100 100 ... ..... .....		@rdn_pg_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

