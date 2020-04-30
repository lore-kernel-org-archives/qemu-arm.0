Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2201926lfm;
        Thu, 30 Apr 2020 11:18:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypIw14dRfBe8rF1+OQB/dwydlKLRKrnn6wRtzOS+1etTorUisKlhXsIT1Bvu/vHyGq9dkrwc
X-Received: by 2002:a37:78c1:: with SMTP id t184mr4766500qkc.213.1588270739602;
        Thu, 30 Apr 2020 11:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270739; cv=none;
        d=google.com; s=arc-20160816;
        b=oo6Qj1MYvtCIO7YqiYUpw9jbgzQsS6xTF1Qo6NwCN3popHYUzxFe7S5Y4AKD3/mzba
         1JMjU/nTchY0BKnuBbvDhF7ZUqgdVFu1VvRrF8CyuBDpF9/4mE9983slgawODHXU2qao
         fj/B6c/a1GIY7fQ1zMgSawUwCdQme05Lep79lgMuUTcnBBVGYXYAgRLcGI/1MV8ABIgv
         JwUnl1dR7JXUbs7ArA6GYKVuDMe0qzjRakgtlW/Tk5Q04I2yfuJio3w5FfdUHf8FgwjO
         IFDjkp62Va/YOrkQ9pMQ+1MWDVagGs5gK0D7n3MvgFzO9mBieIv/kfc7eXW3owDQml1n
         IziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ktz+IFnCp3WGIM8gI5HERLwJEWJsvRvRgBzd2QeRej4=;
        b=Dq/HjiIosP/T+KiFyCu8+8QhxZwfToqkTUw5zDMWL5UL12ayRrHak3plABepTX4+bf
         fs4EQg/1LKbsSJu5bq6jl10LOR241RX/xjnrk86oNaw0pHop8AyqU/BPanMMSPaLYZq7
         Pnprzynli00cmRV0FySsZfBkn3UWL55HpnhuCqK0SnarU/Yud5iaqnU4RC5Z/H14kgtU
         xUDKnKr2TZkDhtSJ3x/uaoEfhdDdd1KKLvt+ltzm1bbu5XS+UeFEaHEbcxAAt0xBcpyX
         xsHdJGbapannnzna9HoSO0GCZPKin0RUp7SVBAcz+itVM2sLdSNFy+xnMBiqDY6/ks8U
         NRUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTSRPdyB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id m13si274781qtm.229.2020.04.30.11.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTSRPdyB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDly-0004tf-Tx
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeG-0001jm-Ff
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdk-0001Ar-QF
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:11:00 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdk-000122-CX
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:10:28 -0400
Received: by mail-wr1-x444.google.com with SMTP id x17so8174046wrt.5
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 11:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktz+IFnCp3WGIM8gI5HERLwJEWJsvRvRgBzd2QeRej4=;
 b=UTSRPdyBe6ll966cCrLPgCj0IicUKzxeGzcV4DGtYxx2+G5JeOIYa9gZR8D/Deq5LE
 A0BSBuLeAT3YqPLZxkX5dc4WdtM0JKsJZGbHYsoASEaZ4AZksflG6SZ85IBA8Uv5Fcfx
 Uw3flsEvOk3numcLBIJO0oIwAc2r3h5i4jJBr5cn/BYRoLnhF+RPP7ewfjgPsL88KswB
 t3j+rAYZl///NgIKKYJEoEx9eTwoz3sR8uFvMo7x7yN36dld8NJPz8v5A99rpy8UUKr4
 SmvW2ihugfFvbhrMViS0/nWGsqSlcIbPeaichpdQCjyuT1QLkjuwW+yzbHWxqPwNCVTY
 FQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktz+IFnCp3WGIM8gI5HERLwJEWJsvRvRgBzd2QeRej4=;
 b=DfrsyUwr7YuMP+L3Cq9eYnXrfng5QXUBaBcHP/s+nVqBz/10s429XMujQgUuPFTuN7
 rm0OEA3sDeQCX9Fj5mvB+QE9MpvGpW76maQSD5J9Q/S/2zJJUE78mMrwxnl0vyf+orMg
 FDpoK/+nhOdvdwgZdBbjhTII9+jMocgI7yaU2nh0qCqqhR2qC3Zp+lvXm1LSu6s/jqxi
 Z/yGW+RKr74w1BUEQhHN8P66nEwa7kxm4jWikLujev0AKN4lUXihkbMSEyjXl6Ozfssm
 I+r3ss+PJrHTpSBU6oL6kuUNbPu3lYyAncISl9LU62QeTIu4heLWzJmgJmZn7CZfrTI3
 mj4g==
X-Gm-Message-State: AGi0PuYAxhW9OW3Pp5itohFdouvd5+ROSsdy7S/ofOIVwVb6iDPlQ2WG
 zrd2Cgo0aXjQczOoZgAKqIpJ0w==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr5171455wrt.236.1588270224115; 
 Thu, 30 Apr 2020 11:10:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/36] target/arm: Convert Neon 3-reg-same VADD/VSUB to
 decodetree
Date: Thu, 30 Apr 2020 19:09:41 +0100
Message-Id: <20200430181003.21682-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WDhTlnnaaN6G

Convert the Neon 3-reg-same VADD and VSUB insns to decodetree.

Note that we don't need the neon_3r_sizes[op] check here because all
size values are OK for VADD and VSUB; we'll add this when we convert
the first insn that has size restrictions.

For this we need one of the GVecGen*Fn typedefs currently in
translate-a64.h; move them all to translate.h as a block so they
are visible to the 32-bit decoder.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h      |  9 --------
 target/arm/translate.h          |  9 ++++++++
 target/arm/translate-neon.inc.c | 38 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 14 ++++--------
 target/arm/neon-dp.decode       | 17 +++++++++++++++
 5 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 4c2c91ae1b2..f02fbb63a4a 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -115,13 +115,4 @@ static inline int vec_full_reg_size(DisasContext *s)
 
 bool disas_sve(DisasContext *, uint32_t);
 
-/* Note that the gvec expanders operate on offsets + sizes.  */
-typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
-typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t, int64_t,
-                         uint32_t, uint32_t);
-typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
-                        uint32_t, uint32_t, uint32_t);
-typedef void GVecGen4Fn(unsigned, uint32_t, uint32_t, uint32_t,
-                        uint32_t, uint32_t, uint32_t);
-
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 98b319f3f69..95b43e7ab65 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -305,4 +305,13 @@ void gen_sshl_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 #define dc_isar_feature(name, ctx) \
     ({ DisasContext *ctx_ = (ctx); isar_feature_##name(ctx_->isar); })
 
+/* Note that the gvec expanders operate on offsets + sizes.  */
+typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
+typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t, int64_t,
+                         uint32_t, uint32_t);
+typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
+                        uint32_t, uint32_t, uint32_t);
+typedef void GVecGen4Fn(unsigned, uint32_t, uint32_t, uint32_t,
+                        uint32_t, uint32_t, uint32_t);
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index c881d1cf607..bd9e697b3e2 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -560,3 +560,41 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
 
     return true;
 }
+
+static bool do_3same(DisasContext *s, arg_3same *a, GVecGen3Fn fn)
+{
+    int vec_size = a->q ? 16 : 8;
+    int rd_ofs = neon_reg_offset(a->vd, 0);
+    int rn_ofs = neon_reg_offset(a->vn, 0);
+    int rm_ofs = neon_reg_offset(a->vm, 0);
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fn(a->size, rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size);
+    return true;
+}
+
+#define DO_3SAME(INSN, FUNC)                                            \
+    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
+    {                                                                   \
+        return do_3same(s, a, FUNC);                                    \
+    }
+
+DO_3SAME(VADD, tcg_gen_gvec_add)
+DO_3SAME(VSUB, tcg_gen_gvec_sub)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8c059af0e7e..81a0df78e40 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4885,16 +4885,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             }
             return 0;
 
-        case NEON_3R_VADD_VSUB:
-            if (u) {
-                tcg_gen_gvec_sub(size, rd_ofs, rn_ofs, rm_ofs,
-                                 vec_size, vec_size);
-            } else {
-                tcg_gen_gvec_add(size, rd_ofs, rn_ofs, rm_ofs,
-                                 vec_size, vec_size);
-            }
-            return 0;
-
         case NEON_3R_VQADD:
             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
                            rn_ofs, rm_ofs, vec_size, vec_size,
@@ -4970,6 +4960,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tcg_gen_gvec_3(rd_ofs, rm_ofs, rn_ofs, vec_size, vec_size,
                            u ? &ushl_op[size] : &sshl_op[size]);
             return 0;
+
+        case NEON_3R_VADD_VSUB:
+            /* Already handled by decodetree */
+            return 1;
         }
 
         if (size == 3) {
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index c89a1a58591..a61b1e88476 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -18,6 +18,10 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+# VFP/Neon register fields; same as vfp.decode
+%vm_dp  5:1 0:4
+%vn_dp  7:1 16:4
+%vd_dp  22:1 12:4
 
 # Encodings for Neon data processing instructions where the T32 encoding
 # is a simple transformation of the A32 encoding.
@@ -27,3 +31,16 @@
 #   0b111p_1111_qqqq_qqqq_qqqq_qqqq_qqqq_qqqq
 # This file works on the A32 encoding only; calling code for T32 has to
 # transform the insn into the A32 version first.
+
+######################################################################
+# 3-reg-same grouping:
+# 1111 001 U 0 D sz:2 Vn:4 Vd:4 opc:4 N Q M op Vm:4
+######################################################################
+
+&3same vm vn vd q size
+
+@3same           .... ... . . . size:2 .... .... .... . q:1 . . .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VADD_3s          1111 001 0 0 . .. .... .... 1000 . . . 0 .... @3same
+VSUB_3s          1111 001 1 0 . .. .... .... 1000 . . . 0 .... @3same
-- 
2.20.1

