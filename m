Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4038066lfg;
        Mon, 28 Jun 2021 07:10:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRO5VN5duQf4d44j7fip9eibwPEIb013okJaoQ9n4ZfYnLk3/p6IhWZ1441XLf4tTqHqrd
X-Received: by 2002:a17:906:af0f:: with SMTP id lx15mr24963384ejb.324.1624889430737;
        Mon, 28 Jun 2021 07:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624889430; cv=none;
        d=google.com; s=arc-20160816;
        b=z3pzcrtH9z4ZLLbFC8E0VSuj1vb1I2RoEJTeyQ3OBKE1kYF/FuwYVPQqoBLwNJ1YL1
         3Rhu5/bNyMlN5+dXXTW2FUvPuWskOl1annl4HTF+5xfpcYf2+EAKKexf5xovWwYio3j5
         hRwOtmXyj9+/tHjbIUmVQJZzz7VKdjUHySCcgQvis+HLH9E1S/o3DcRTfF5/fZntH/5e
         9y4jo3BmgGFJ7K97kDaMP/Q7+ZzH3GQVMGk2d4hInsNgszvpb24deww9djxILc05Hmul
         XKPWTxxR2lI3fc0mmm7ZwR2Akg82ELbkpFHHclNbJb2ehWIp7DMKG9v0B6xkdtNBBUot
         71HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MO7EnfqeS+5+LjEI/4TRRgbaYtZtkXCDU/l/d4rp/vo=;
        b=Ad4cfx354AjqTeosH8r9LDcfnpYVynKwdflhLyuu4R+3/n7T+yTES2ezG+LumXNr5V
         9mW6oKja6UK1AwZy+NAYasMcztU0gS92ilqP4O21JICzXMTTjchmiAHA46tpLcBKpc4r
         1M4DAbGBPix5C6Z0gZkkMDn/AcjaLGyaaz85aw75pyCwq2yirPCBPWwkkJ1gB+cuO6QG
         6MiYVAZwuRS6Nx4+dS6FoF3IJ9d9RGvZIqQUH37qQ8TuOx25HrnPS8TPXnBnr4cPaIu4
         I3m/FDNQG0RvKZqP0aNfLw9LTqg9jTdLYe+jPyJ/tjruRTKefjDsEKAEQg4RuV383Ip8
         mNoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDW+Jrhp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi15si15961938edb.459.2021.06.28.07.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDW+Jrhp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxry1-0008Kz-Lc
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmx-0003MM-6f
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-00065X-QT
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l21-20020a05600c1d15b02901e7513b02dbso8434934wms.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MO7EnfqeS+5+LjEI/4TRRgbaYtZtkXCDU/l/d4rp/vo=;
 b=XDW+Jrhpy2+qA+I7Zno5t6BOELAjsLLtFD1fuXECucSBHshMwYQia5yi4cYAgeFZhf
 GgB3krJVhP/BrpbSXSDCSdnpNqDWtdGAAHrwjwwyqHSnsggVj9cn4r9M1JPk3AoN3O1R
 Wf5GLz6utoc5g3jhDPKaZr6kI1hjyGOOSBg0ShXtlSYUzq6uFmkwYjLBAAI+8JrDfN4S
 1dQzlvdfAn+S5xqGgPc5uUMaFNMHmpiB8fufuuyLP5wvMT6IZR82g7RO6jcwx9qMlG1S
 YCf6yjuSI4F6s22AkniFskXNNUBlt8OOv9g7D4fi7d0Wj1t4+0eIUVlvDhExy3TeWSJs
 8gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MO7EnfqeS+5+LjEI/4TRRgbaYtZtkXCDU/l/d4rp/vo=;
 b=rNDzkTGQ9DfF4XcRrIJ0+tzHfXCjZ9yCpVItio+Ionm8tekTy2KQGIKVQ2N3qAYFBL
 rA5e6ZduujKEYjkXolIuTZRgyzWJhMeCIsBGpNr0fRQThzSQja/SFTq+vgJAXvOVk5Is
 PzSopFamzZvuoYPRAxZtoybV22X2Wt81SOlSyYfAr5PpGKm9RrP5aqIeI59peX7L4hWo
 wYE1p+QjkAt9j/g+2Hz3u9wQSGVD+xXNOLqFDHIqnITIkX1Za1Iq/gvvKLfAQwwNlH/l
 LzgBxYw93yAhSfM3/0cB6tJhNny9bd53bjvBlQsg4ukmYGbmnPNqpDNZFeAePyjWNrPv
 lcYw==
X-Gm-Message-State: AOAM531sDx7NfY8AAJ9F/J7xSt0fdP5zv6AkUZ6JoK4s5O5TOGfsbzqr
 oPRQYXbZcNlXIsLt7kTr+/miJE9Ww1tY1Koi
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr24179004wmq.68.1624888725005; 
 Mon, 28 Jun 2021 06:58:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/18] target/arm: Implement MVE VSHRN, VRSHRN
Date: Mon, 28 Jun 2021 14:58:28 +0100
Message-Id: <20210628135835.6690-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: plsY90tL2+KQ

Implement the MVE shift-right-and-narrow insn VSHRN and VRSHRN.

do_urshr() is borrowed from sve_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 10 ++++++++++
 target/arm/mve.decode      | 11 +++++++++++
 target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 15 ++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e452d2ef7a0..323ac07fa35 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -404,3 +404,13 @@ DEF_HELPER_FLAGS_4(mve_vsriw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vslib, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vslih, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vsliw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vshrnbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshrnbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshrntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshrnth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vrshrnbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshrnbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshrntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshrnth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c3b5366617a..e2c177f56a2 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -380,3 +380,14 @@ VSRI              111 1 1111 1 . ... ... ... 0 0100 0 1 . 1 ... 0 @2_shr_w
 VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_b
 VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_h
 VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_w
+
+# Narrowing shifts (which only support b and h sizes)
+VSHRNB            111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_b
+VSHRNB            111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_h
+VSHRNT            111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_b
+VSHRNT            111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_h
+
+VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_b
+VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_h
+VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_b
+VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_h
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 24336d1d28a..a97942208ba 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1324,3 +1324,43 @@ DO_2SHIFT_INSERT(vsliw, 4, DO_SHL, SHL_MASK)
 
 DO_VSHLL_ALL(vshllb, false)
 DO_VSHLL_ALL(vshllt, true)
+
+/*
+ * Narrowing right shifts, taking a double sized input, shifting it
+ * and putting the result in either the top or bottom half of the output.
+ * ESIZE, TYPE are the output, and LESIZE, LTYPE the input.
+ */
+#define DO_VSHRN(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)       \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
+                                void *vm, uint32_t shift)       \
+    {                                                           \
+        LTYPE *m = vm;                                          \
+        TYPE *d = vd;                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned le;                                            \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
+            TYPE r = FN(m[H##LESIZE(le)], shift);               \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+    }
+
+#define DO_VSHRN_ALL(OP, FN)                                    \
+    DO_VSHRN(OP##bb, false, 1, uint8_t, 2, uint16_t, FN)        \
+    DO_VSHRN(OP##bh, false, 2, uint16_t, 4, uint32_t, FN)       \
+    DO_VSHRN(OP##tb, true, 1, uint8_t, 2, uint16_t, FN)         \
+    DO_VSHRN(OP##th, true, 2, uint16_t, 4, uint32_t, FN)
+
+static inline uint64_t do_urshr(uint64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else if (sh == 64) {
+        return x >> 63;
+    } else {
+        return 0;
+    }
+}
+
+DO_VSHRN_ALL(vshrn, DO_SHR)
+DO_VSHRN_ALL(vrshrn, do_urshr)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b031f84966e..f1a8f21b772 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -911,3 +911,18 @@ DO_VSHLL(VSHLL_BS, vshllbs)
 DO_VSHLL(VSHLL_BU, vshllbu)
 DO_VSHLL(VSHLL_TS, vshllts)
 DO_VSHLL(VSHLL_TU, vshlltu)
+
+#define DO_2SHIFT_N(INSN, FN)                                   \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
+    {                                                           \
+        static MVEGenTwoOpShiftFn * const fns[] = {             \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+        };                                                      \
+        return do_2shift(s, a, fns[a->size], false);            \
+    }
+
+DO_2SHIFT_N(VSHRNB, vshrnb)
+DO_2SHIFT_N(VSHRNT, vshrnt)
+DO_2SHIFT_N(VRSHRNB, vrshrnb)
+DO_2SHIFT_N(VRSHRNT, vrshrnt)
-- 
2.20.1

