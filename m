Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp547524lfb;
        Fri, 15 May 2020 07:21:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhj1r1WXyYriWMVBuLdCUeO5mZsc7JujgfPm0/UdUUtnMs54cxmgERZRx24LfpBY/UX04p
X-Received: by 2002:ac8:4a88:: with SMTP id l8mr3574599qtq.337.1589552488284;
        Fri, 15 May 2020 07:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589552488; cv=none;
        d=google.com; s=arc-20160816;
        b=lkasgSxXcDKbh5k1+FrpqPH6fhX3X3g7aqgDbOBuq0NsZ05iqXk6CRt532U004+hBS
         dIVyB1xLMYS7Zv7Yo68z38q8EIZS5HhR58jYqj3+fhHbPrBox0FsrAKiTnUCrwaNplDQ
         d8GXpjlUSZzY58QEgM2f2CWCOe3kgasrHIBIljrj+FjSCUsADgyAAmXlpHRLZrUqhsQL
         Uo0eDif2p3YUD8H1Mwjq7oL4BEFD2I3UzG7wR5LRNM9hNJwD/z9Or+MsMm/lx8wD0WY0
         435gu7638Ft8pNjfYiZ+NZEZaxx7SKJS3xvgi+HyL1T6Tr3jKuqjJfgVOOsp0T7RyaSf
         hfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hKEL7z4LxXMw8xsvvZqstECIgOw6TAEOPxp9PR9rpGE=;
        b=d+C8ilj1MQw2rc2b8mSIGD+pRx7p+99NafasWKs5n586PEtVRq7werLKHS97bmJE76
         Si8udxu0BFlZohqD6ucYVBftXJ+GklMF4bRgQbKwCo4dXxUUq2RHXzs7W/eSO8cnz/2M
         2601yuKuPZ3kSMmqGqtKjv8nhp6x+r/kDF0S+Y/nAI+tTko6hwWevYs2RQdxyeJ91SrP
         9/WgTFBtbtunWtYkPXjJqcZARX/q7YcNJZqjD2d800/cJMBRRdWhN223x65/DEUMKx46
         bgHa43BdlTqs9pHBCX5ZEw5lBWqrRfTdZKLq14+ObeSvFd43quBa0YZTmRPWyiNvmUjs
         yJpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GX+Cpsnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si1197831qkj.82.2020.05.15.07.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 07:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GX+Cpsnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZbDL-0001GN-Fd
	for alex.bennee@linaro.org; Fri, 15 May 2020 10:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCy-0000gN-S5
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:04 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCx-0003s6-Us
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:04 -0400
Received: by mail-wm1-x341.google.com with SMTP id u16so2854434wmc.5
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hKEL7z4LxXMw8xsvvZqstECIgOw6TAEOPxp9PR9rpGE=;
 b=GX+CpsnhbSVEVmKZ18h/6DwQfYUec0YIsWsoUXMn60OwTssJZJD0ObsjurPS9THSqI
 Ew668yFwCSigE4OUt8a/oL0/qJKvbAaqLdw9Gr2ncXbu7+QpKtyemXMV8yEhLETXEPe7
 KezTYlismGvSo7mgdquj5fRM2gvrDgGeyUFG7IRSu76Ds9IIJEWPyv5iokK2MISo5CrU
 GLRLAYevukem7yBF6SuqzxTFpg/YlPsQzqHfxQrYLrH/ISeQrd+zW1JomJaGnsYqQ9VO
 1HSFSaeJRJeftUuxLsSrJVsYyHnhUy4D86w37wkR0IW6ZKz6OEBs8v3CLchef2orARy2
 8tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKEL7z4LxXMw8xsvvZqstECIgOw6TAEOPxp9PR9rpGE=;
 b=AqML+WJ8K6hfOpzqGJbKNUkxsPnaQNe5fqIlt7/7z+KnvWUbj2xfMtevAbSD5EboWi
 Pz7beGDVeylFyHQAXIedxSYxOjcv9bnA/I9XQNq0xQ7Ldreufzky+NaQySZb31vrHFyb
 Y294dzCO/T88qA9PD+bDpogMQzx1+CjgMt31lVjrMOrXLDz6/6VqwL8xee7wvLP7TXWC
 Memlg3vwFLlZLcxwNYFrXKgzr3bjUX4ScYXXf5X1MTGSX9I/31mWuyMwoOOx8jh57C+A
 redFN3J65EyOq3bLSfINy649hAb6HgzNvQKm/PVL7rtkoWtiddsnCXeaoNeOjyGGKeQh
 Xm+w==
X-Gm-Message-State: AOAM533jgZYnD77plLlcUG03u2CvGGqA6fsfsyfpurXeCoQm1BFxZJEs
 UQdXSG8yGGdXRMvX+1hckQxFCGWb4g3ySw==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr4284214wmi.124.1589552462175; 
 Fri, 15 May 2020 07:21:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm3738327wmh.18.2020.05.15.07.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:21:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/10] target/arm: Convert Neon VSHR 2-reg-shift insns to
 decodetree
Date: Fri, 15 May 2020 15:20:49 +0100
Message-Id: <20200515142056.21346-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515142056.21346-1-peter.maydell@linaro.org>
References: <20200515142056.21346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TgQ2eAshE61H

Convert the VSHR 2-reg-shift insns to decodetree.

Note that unlike the legacy decoder, we present the right shift
amount to the trans_ function as a positive integer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 24 +++++++++++++++++++
 target/arm/translate-neon.inc.c | 41 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 21 +----------------
 3 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index df7b4798a5a..648812395f1 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -209,6 +209,30 @@ VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
 @2reg_shift      .... ... . . . ...... .... .... . q:1 . . .... \
                  &2reg_shift vm=%vm_dp vd=%vd_dp
 
+# Right shifts are encoded as N - shift, where N is the element size in bits.
+%neon_rshift_i6  16:6 !function=rsub_64
+%neon_rshift_i5  16:5 !function=rsub_32
+%neon_rshift_i4  16:4 !function=rsub_16
+%neon_rshift_i3  16:3 !function=rsub_8
+
+VSHR_S_2sh       1111 001 0 1 .  ......     .... 0000 1 . . 1 .... \
+                 @2reg_shift size=3 shift=%neon_rshift_i6
+VSHR_S_2sh       1111 001 0 1 . 1 .....     .... 0000 0 . . 1 .... \
+                 @2reg_shift size=2 shift=%neon_rshift_i5
+VSHR_S_2sh       1111 001 0 1 . 01 ....     .... 0000 0 . . 1 .... \
+                 @2reg_shift size=1 shift=%neon_rshift_i4
+VSHR_S_2sh       1111 001 0 1 . 001 ...     .... 0000 0 . . 1 .... \
+                 @2reg_shift size=0 shift=%neon_rshift_i3
+
+VSHR_U_2sh       1111 001 1 1 .  ......     .... 0000 1 . . 1 .... \
+                 @2reg_shift size=3 shift=%neon_rshift_i6
+VSHR_U_2sh       1111 001 1 1 . 1 .....     .... 0000 0 . . 1 .... \
+                 @2reg_shift size=2 shift=%neon_rshift_i5
+VSHR_U_2sh       1111 001 1 1 . 01 ....     .... 0000 0 . . 1 .... \
+                 @2reg_shift size=1 shift=%neon_rshift_i4
+VSHR_U_2sh       1111 001 1 1 . 001 ...     .... 0000 0 . . 1 .... \
+                 @2reg_shift size=0 shift=%neon_rshift_i3
+
 VSHL_2sh         1111 001 0 1 . shift:6     .... 0101 1 . . 1 .... \
                  @2reg_shift size=3
 VSHL_2sh         1111 001 0 1 . 1 shift:5   .... 0101 0 . . 1 .... \
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 305213fe6d9..0475696835f 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -31,6 +31,24 @@ static inline int plus1(DisasContext *s, int x)
     return x + 1;
 }
 
+static inline int rsub_64(DisasContext *s, int x)
+{
+    return 64 - x;
+}
+
+static inline int rsub_32(DisasContext *s, int x)
+{
+    return 32 - x;
+}
+static inline int rsub_16(DisasContext *s, int x)
+{
+    return 16 - x;
+}
+static inline int rsub_8(DisasContext *s, int x)
+{
+    return 8 - x;
+}
+
 /* Include the generated Neon decoder */
 #include "decode-neon-dp.inc.c"
 #include "decode-neon-ls.inc.c"
@@ -1348,3 +1366,26 @@ static bool do_vector_2sh(DisasContext *s, arg_2reg_shift *a, GVecGen2iFn *fn)
 
 DO_2SH(VSHL, tcg_gen_gvec_shli)
 DO_2SH(VSLI, gen_gvec_sli)
+
+static bool trans_VSHR_S_2sh(DisasContext *s, arg_2reg_shift *a)
+{
+    /* Signed shift out of range results in all-sign-bits */
+    a->shift = MIN(a->shift, (8 << a->size) - 1);
+    return do_vector_2sh(s, a, tcg_gen_gvec_sari);
+}
+
+static void gen_zero_rd_2sh(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    tcg_gen_gvec_dup_imm(vece, rd_ofs, oprsz, maxsz, 0);
+}
+
+static bool trans_VSHR_U_2sh(DisasContext *s, arg_2reg_shift *a)
+{
+    /* Shift out of range is architecturally valid and results in zero. */
+    if (a->shift >= (8 << a->size)) {
+        return do_vector_2sh(s, a, gen_zero_rd_2sh);
+    } else {
+        return do_vector_2sh(s, a, tcg_gen_gvec_shri);
+    }
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d0a4a08f6d9..f2ccab1b21c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5296,6 +5296,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             op = (insn >> 8) & 0xf;
 
             switch (op) {
+            case 0: /* VSHR */
             case 5: /* VSHL, VSLI */
                 return 1; /* handled by decodetree */
             default:
@@ -5330,26 +5331,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
 
                 switch (op) {
-                case 0:  /* VSHR */
-                    /* Right shift comes here negative.  */
-                    shift = -shift;
-                    /* Shifts larger than the element size are architecturally
-                     * valid.  Unsigned results in all zeros; signed results
-                     * in all sign bits.
-                     */
-                    if (!u) {
-                        tcg_gen_gvec_sari(size, rd_ofs, rm_ofs,
-                                          MIN(shift, (8 << size) - 1),
-                                          vec_size, vec_size);
-                    } else if (shift >= 8 << size) {
-                        tcg_gen_gvec_dup_imm(MO_8, rd_ofs, vec_size,
-                                             vec_size, 0);
-                    } else {
-                        tcg_gen_gvec_shri(size, rd_ofs, rm_ofs, shift,
-                                          vec_size, vec_size);
-                    }
-                    return 0;
-
                 case 1:  /* VSRA */
                     /* Right shift comes here negative.  */
                     shift = -shift;
-- 
2.20.1

