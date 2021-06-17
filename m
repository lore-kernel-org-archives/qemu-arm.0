Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp498347lff;
        Thu, 17 Jun 2021 05:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyrqMK7++iF2Vn68YVzpIgMMhhEoCS8g4PDqWJZSvPczk+TrgVm1eNQlXDqG8MqCKRswtX
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr4798136wmf.47.1623933469291;
        Thu, 17 Jun 2021 05:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933469; cv=none;
        d=google.com; s=arc-20160816;
        b=zgwcO84aHbvB4DsOGFI9WLZ8NakoMAdcGguhHZ5J2mIpfTYXWF+e9ygWmpCNMmXsTu
         QL/x63OpdML7kB5FgQVEzCPdevGZnm9hA5ypbSY/e1V8rLWnHSBYO5iVhOQ4p8Qyu3Vo
         lKSoazuISnRkOP28/lXznFG6T5TaPIGVUL4nczS/Ruv7wBhGdykmLNdKaXScSAZAvtIh
         kGi3Z0upmB1KaLPKUBaI+uAdBKnDfhTqFWd6xmgspHITHEnR7d0kuoZxjEmhd0EKq5vt
         MObNVnH5cmKE99bNnb4b1QdK3JTSjHcWWBPVNzEaR+bo1SYMfV2yvHo3yb8GWT8tCtqy
         oj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5qmLB52alQAnpXTYDj3Qp/nIG1JcS6NDWaXrOL1QvHk=;
        b=zXvSX9NH71apCrFco95luZrSpzqFq55aBkgMTpHC0ubQKl/Ro3ilUdzlSKQNdXRboj
         E1AEaLQZHxIvNvrBmqux0Q4aUKsjdZPqO9kOF8zlx6I+P3J5JLWUsw5XyM87MAcQhXCg
         wceBRV+dioDdx8yNVGNVE5CAoWdHinReg43PcDae1sF8tN3b9vAdHlnPih8BACo47vA5
         M6S1/mw+Z6LJiQy867lW3OQzGcFjoAYvseyFJszpC7naykoLFTjwNE/CE0CHfUx/t9oq
         KMI7xCOrk71xeZ37GLdV3nLKXgDG4NGp+CFSpjxgHEsuxaGP+QIFDto1wUSvVy9ZZcSo
         qSEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o1SsaHCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si5878865wml.69.2021.06.17.05.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o1SsaHCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrHI-00073f-9w
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx8-0001lK-Pf
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwy-00073b-8q
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y7so6505049wrh.7
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qmLB52alQAnpXTYDj3Qp/nIG1JcS6NDWaXrOL1QvHk=;
 b=o1SsaHCmCVGhkP72uRCqTl5DLyx84zxQFr4YXonIs8nkG2TWgNvscXoqYQjQtnMs6i
 c0qgoJowSn3DEQhXKPkSyTqKtUsh3+SVE/RzJL+VYzR4/kOj64MbEPpEm8TNis6gk05b
 qCUg/AyHrZ7o48YmZGUN3t6gOQA6VAUa5+fL2+40UPVggE1h3bT6Bg9sUmyP5Q2xzJli
 eYqGT6IYqrtWu6cbuXt49puVvYiV5daWUv829XVat0KmoPrTRt3gJ4EU54gP9HGzS49w
 zkbIK5lHGjV3H2i9i4sN8iKmV6z5fCTg2XfRzhP2/QDTNK2fFXR6zajBmrZhprGyFVdA
 c8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qmLB52alQAnpXTYDj3Qp/nIG1JcS6NDWaXrOL1QvHk=;
 b=erX8t2Zwr2FNZyKFF/K92JvqaXGFPQ8cuW+l1IrZ3uIpNGsnibQv567/CaYfsWB0H1
 BYKCnhK2mcxuP4oYyzoViJlWPZ7pPElBZ1mBPjcIStRQ9OYhQIs868Py8SC+6Cn+uK9H
 pPHs3rfCBO1iX4up2A2GXWYPADhGbdMNMSg4JNjqlCpm4d1xwSMe/L8qYkWjP8dEpiTq
 h6pjSn05uyGd7GbRzKfmBUFulmGCZJgj3SJJBple21LilNbXWLk2qUIi8iU9Ky1hgFMQ
 dQTNH6vzuHlPAjXyhYMpWqWpl3VSb+n22+U29oFR1Q67XCihaYYQ+dTjGXO6ZFnamqvo
 VaeA==
X-Gm-Message-State: AOAM531YITj/MGScUc2TTRL+GR3kCk7wUYpyukK1MkE0M7hqgNeNw+iC
 5Q+1zfWAu2L5u5Jk9qpI16dRlYQCnGhqhw==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr5304838wrd.405.1623932206797; 
 Thu, 17 Jun 2021 05:16:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 21/44] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
Date: Thu, 17 Jun 2021 13:16:05 +0100
Message-Id: <20210617121628.20116-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YwjQY/X2GQsf

Implement the MVE VRMLALDAVH and VRMLSLDAVH insns, which accumulate
the results of a rounded multiply of pairs of elements into a 72-bit
accumulator, returning the top 64 bits in a pair of general purpose
registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  7 +++++++
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 24 ++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 7356385d60c..f9d4b242beb 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -157,3 +157,11 @@ DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1be2d6b270f..ac68f072bbe 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -143,7 +143,14 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 @vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
+@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+                 qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 
 VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 618f0e66d1d..b51b7cd52e4 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/int128.h"
 #include "cpu.h"
 #include "internals.h"
 #include "vec_internal.h"
@@ -542,3 +543,39 @@ DO_LDAV(vmlsldavsh, 2, int16_t, false, +=, -=)
 DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
 DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
 DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
+
+/*
+ * Rounding multiply add long dual accumulate high: we must keep
+ * a 72-bit internal accumulator value and return the top 64 bits.
+ */
+#define DO_LDAVH(OP, ESIZE, TYPE, XCHG, EVENACC, ODDACC, TO128)         \
+    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint64_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        Int128 acc = int128_lshift(TO128(a), 8);                        \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    acc = ODDACC(acc, TO128(n[H##ESIZE(e - 1 * XCHG)] * \
+                                            m[H##ESIZE(e)]));           \
+                } else {                                                \
+                    acc = EVENACC(acc, TO128(n[H##ESIZE(e + 1 * XCHG)] * \
+                                             m[H##ESIZE(e)]));          \
+                }                                                       \
+                acc = int128_add(acc, 1 << 7);                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return int128_getlo(int128_rshift(acc, 8));                     \
+    }
+
+DO_LDAVH(vrmlaldavhsw, 4, int32_t, false, int128_add, int128_add, int128_makes64)
+DO_LDAVH(vrmlaldavhxsw, 4, int32_t, true, int128_add, int128_add, int128_makes64)
+
+DO_LDAVH(vrmlaldavhuw, 4, uint32_t, false, int128_add, int128_add, int128_make64)
+
+DO_LDAVH(vrmlsldavhsw, 4, int32_t, false, int128_add, int128_sub, int128_makes64)
+DO_LDAVH(vrmlsldavhxsw, 4, int32_t, true, int128_add, int128_sub, int128_makes64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 77b461c2186..a0c4f10a935 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -472,3 +472,27 @@ static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[] = {
+        gen_helper_mve_vrmlaldavhsw, gen_helper_mve_vrmlaldavhxsw,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
+
+static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[] = {
+        gen_helper_mve_vrmlaldavhuw, NULL,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
+
+static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[] = {
+        gen_helper_mve_vrmlsldavhsw, gen_helper_mve_vrmlsldavhxsw,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
-- 
2.20.1

