Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4381453lfp;
        Sun, 16 Feb 2020 13:42:36 -0800 (PST)
X-Received: by 2002:a17:90a:8806:: with SMTP id s6mr15410007pjn.141.1581889356430;
        Sun, 16 Feb 2020 13:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581889356; cv=none;
        d=google.com; s=arc-20160816;
        b=VmhHrmNMrzTDOqMra87UVL6GSzZot5bugkk7vncVpAqZ8iDRHn5c8E5YikhdGAGeKd
         E8g470ZFyehx5PFBaE0QBXF61lpzLJs2u05GIY8js8Dviw3Mot85NgJsySupEaiD17RS
         x9B2D5QRV7vA+r+W77fZ2maQxHYO7+0Fbr+Rg6g6/LAcKNliywN3Frb2AkZIBRguJFJB
         c9XDdEMmSZWRS9eDskZF7LNteQoPhF+HckGcJuDmibxPNlfNbRIckMfZi+uyIuhH2oi8
         Gh8ai2jLWpPIOcZnJbGJA5/WUM1JpafZMrt2I6P8Z7Wpwcqc6RqBSHC/Rj+rrKxCUWjH
         OPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O2GXPDLFXihWuaiW0fDwrNaCDa99hsJ9UfIJrAM1orM=;
        b=GCeeSLixDlHMo9yKXO7qdxrtsfmGMT3IV2Cc8mm1JyXcuWyslkET1cNApWokda4yYO
         I06GLZXe3YClCgy8c0em08BRkZXX9yqk7XVQJBymagE+GtMKr96ComLDI1giYYW0ufau
         YvjoWBXuF4LxWt3U4JpzJ5M1kReYnybb0GG23yyCUH2QuYPJJa10PRuKljHloUZlSnvV
         ufSay1HXu64lYPgV32RXQSnh6YZHcZUh6LfLUYSvqiCSyLQliZwNXGPAqD9Q2VGSWsSa
         BGy4WZx2b1OZdoY3BnHPhM5M9Tf6upk/1vc43mFz9AzUZskoLCFyD9ZmlCZRGpc1vQ3H
         bEXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TW3t5Ayc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m5sor15113918pfm.22.2020.02.16.13.42.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 16 Feb 2020 13:42:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TW3t5Ayc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O2GXPDLFXihWuaiW0fDwrNaCDa99hsJ9UfIJrAM1orM=;
        b=TW3t5Ayc5JouTnjfgnOAe8PSFoU5aml6f3YdB6tJvjBpXz/XkQ8WALVeO8veWPXxmj
         w7QlzmW7xF/hGsi2paL1BGdTRSuii27ZHEWanO8eMz56WsN2hc/vax8OF7gXlR+L6dwq
         7KJ2p/RMCpyMhdQkKfrMfJ0mVByAXNnPQu5oUYjK5sAefpo8V/ulhgR2AF9obxwBysxE
         dGGc4//aaocKAIxswi5nG+vjyVuLv48QaxUStjYRmwhxhL8MqE8SmyuGBn02umo6AgBS
         m46seyWnj3KrwNyLNaQdnauNzj9Zzs70NzzJwxuGLWxgNBbK6gcLPUlem9O/oPAJgbQP
         TV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2GXPDLFXihWuaiW0fDwrNaCDa99hsJ9UfIJrAM1orM=;
        b=CZfH4CQiHTVPdvLYhQtiGC0Q/9HqmIKLNwXPyZ5rNB8I01QVU3t57B1Kcc6jJj3EUN
         Hkk3uig+Xk9FTsiB1EekYn3FIRMSSymA+bnbR7XfPb2ZPwA+BDk8wl4cHGbr5OjPIdWB
         dqqXMndaHnl5R2W6wKT67Blvn71dXOg489x2mpFMQicCQ2Fs72pDXtlGc0MqHccITY3H
         4OwRALJvCaEVLMbqq564uM0SR7o0WNEjKCZmsi5vGDzsmm2eIpC1NCQi9CzPXq180q9A
         p3L4w73APr2pJg5jHl/ZSeS6OLiytyKAkrHsU4a4RI8iUMg3YigK4uUyDaORCX6RcE7+
         D0YA==
X-Gm-Message-State: APjAAAXH5D9KAscfH6czRysX25Nt0OOSsRBx5F2FjmZ03fQbll0suW9H
	lMpBK+1kfKEp7rdocVbmsH1H0SjM
X-Google-Smtp-Source: APXvYqwCX+NSsYSzBinz2e50TmZeK3ZWAh9Y/JrnDSB9C4rMkSEpMI8Es2Jr5UAoNX8zEOXhsfCnqQ==
X-Received: by 2002:a63:4a47:: with SMTP id j7mr14571862pgl.196.1581889355873;
        Sun, 16 Feb 2020 13:42:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id z29sm14821848pgc.21.2020.02.16.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 13:42:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/4] target/arm: Convert PMUL.8 to gvec
Date: Sun, 16 Feb 2020 13:42:30 -0800
Message-Id: <20200216214232.4230-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216214232.4230-1-richard.henderson@linaro.org>
References: <20200216214232.4230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: grlYvdUP6vVG

The gvec form will be needed for implementing SVE2.

Extend the implementation to operate on uint64_t instead of uint32_t.
Use a counted inner loop instead of terminating when op1 goes to zero,
looking toward the required implementation for ARMv8.4-DIT.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Elide mask after right-shift on N, as we already do N & 1
    at the top of the loop.
---
 target/arm/helper.h        |  3 ++-
 target/arm/neon_helper.c   | 22 ----------------------
 target/arm/translate-a64.c | 10 +++-------
 target/arm/translate.c     | 11 ++++-------
 target/arm/vec_helper.c    | 30 ++++++++++++++++++++++++++++++
 5 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 459a278b5c..82450a3f96 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -342,7 +342,6 @@ DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
 DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
 DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
 DEF_HELPER_2(neon_mul_u16, i32, i32, i32)
-DEF_HELPER_2(neon_mul_p8, i32, i32, i32)
 DEF_HELPER_2(neon_mull_p8, i64, i32, i32)
 
 DEF_HELPER_2(neon_tst_u8, i32, i32, i32)
@@ -696,6 +695,8 @@ DEF_HELPER_FLAGS_4(gvec_sshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ushl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ushl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_pmul_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
index c581ffb7d3..9e7a9a1ac5 100644
--- a/target/arm/neon_helper.c
+++ b/target/arm/neon_helper.c
@@ -1131,28 +1131,6 @@ NEON_VOP(mul_u16, neon_u16, 2)
 
 /* Polynomial multiplication is like integer multiplication except the
    partial products are XORed, not added.  */
-uint32_t HELPER(neon_mul_p8)(uint32_t op1, uint32_t op2)
-{
-    uint32_t mask;
-    uint32_t result;
-    result = 0;
-    while (op1) {
-        mask = 0;
-        if (op1 & 1)
-            mask |= 0xff;
-        if (op1 & (1 << 8))
-            mask |= (0xff << 8);
-        if (op1 & (1 << 16))
-            mask |= (0xff << 16);
-        if (op1 & (1 << 24))
-            mask |= (0xff << 24);
-        result ^= op2 & mask;
-        op1 = (op1 >> 1) & 0x7f7f7f7f;
-        op2 = (op2 << 1) & 0xfefefefe;
-    }
-    return result;
-}
-
 uint64_t HELPER(neon_mull_p8)(uint32_t op1, uint32_t op2)
 {
     uint64_t result = 0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e42dcfebdd..c96ed28f9d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11160,9 +11160,10 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x13: /* MUL, PMUL */
         if (!u) { /* MUL */
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_mul, size);
-            return;
+        } else {  /* PMUL */
+            gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0, gen_helper_gvec_pmul_b);
         }
-        break;
+        return;
     case 0x12: /* MLA, MLS */
         if (u) {
             gen_gvec_op3(s, is_q, rd, rn, rm, &mls_op[size]);
@@ -11292,11 +11293,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genfn = fns[size][u];
                 break;
             }
-            case 0x13: /* MUL, PMUL */
-                assert(u); /* PMUL */
-                assert(size == 0);
-                genfn = gen_helper_neon_mul_p8;
-                break;
             case 0x16: /* SQDMULH, SQRDMULH */
             {
                 static NeonGenTwoOpEnvFn * const fns[2][2] = {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c4dd14e053..4581373e31 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5007,16 +5007,17 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
 
         case NEON_3R_VMUL: /* VMUL */
             if (u) {
-                /* Polynomial case allows only P8 and is handled below.  */
+                /* Polynomial case allows only P8.  */
                 if (size != 0) {
                     return 1;
                 }
+                tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size,
+                                   0, gen_helper_gvec_pmul_b);
             } else {
                 tcg_gen_gvec_mul(size, rd_ofs, rn_ofs, rm_ofs,
                                  vec_size, vec_size);
-                return 0;
             }
-            break;
+            return 0;
 
         case NEON_3R_VML: /* VMLA, VMLS */
             tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size,
@@ -5206,10 +5207,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rd, pass);
             gen_neon_add(size, tmp, tmp2);
             break;
-        case NEON_3R_VMUL:
-            /* VMUL.P8; other cases already eliminated.  */
-            gen_helper_neon_mul_p8(tmp, tmp, tmp2);
-            break;
         case NEON_3R_VPMAX:
             GEN_NEON_INTEGER_OP(pmax);
             break;
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index fcb3663903..854de0e279 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1134,3 +1134,33 @@ void HELPER(gvec_ushl_h)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+/*
+ * 8x8->8 polynomial multiply.
+ *
+ * Polynomial multiplication is like integer multiplication except the
+ * partial products are XORed, not added.
+ *
+ * TODO: expose this as a generic vector operation, as it is a common
+ * crypto building block.
+ */
+void HELPER(gvec_pmul_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint64_t nn = n[i];
+        uint64_t mm = m[i];
+        uint64_t rr = 0;
+
+        for (j = 0; j < 8; ++j) {
+            uint64_t mask = (nn & 0x0101010101010101ull) * 0xff;
+            rr ^= mm & mask;
+            mm = (mm << 1) & 0xfefefefefefefefeull;
+            nn >>= 1;
+        }
+        d[i] = rr;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.20.1
