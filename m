Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491B2C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:04:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfq-00067B-88; Mon, 13 Jul 2026 19:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfo-00064x-G9
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:52 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfm-0005mc-FA
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:52 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cac59f8b64so40364635ad.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983769; x=1784588569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hx2UipEvcD0cL3stpkPbQTGggpLNP935LYuwW72ZW4w=;
 b=aCG3LpBY3v4ZdjrF0d8WoEL/0CbCmRfNydYwd6e81+zOLpsYdw+8/8ymTlX9nMasdo
 4FEuNorlUjTZv2WAJr3MU0XXOtzgMK6s8KhsURjRbESASpwz1UBqIH7pyshcViAl9URZ
 JFjeN1bT5Q41JEPLXPSFUPPII8i02Ve7CkClO6mb6rh6PaqZKZJ+fA6zd9ko8sVIstZF
 TtIGP6cib+7fujwuP/gsX0/f5ylsDi1GHjyKAqRlrz38AbagLbR2FQtTq1qQRSOVDRMa
 /hyciGEtOr5vtYiEOXrBmzbDetmryqgugnZXSe4t4sWjNmzrE68ObWwQrEDnqmrnzw00
 jwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983769; x=1784588569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hx2UipEvcD0cL3stpkPbQTGggpLNP935LYuwW72ZW4w=;
 b=PkvT30XVyh8eDAoK7hxVeYZBqyHMHblkxtxXSk4xCPKwkDRofutYYX7vcvCQwmSuwo
 Wbzy3cnWet1Jn8P/tIczHVE4VcSfKsaX9t8VImhq5HGbzv8Aw8ehcSEao98XfHnczkEa
 cld1jmNlLZB/O0rMfRnmAVm+DBBesPA994lG/pKOyWtWZoexsIGgIkGdIGcfYpkCJfdU
 fuxxPbBsGi8etKIi9crULTUFAeBucCCTWSa5gKGydMlvhPgRRDkztqRNlG564MbX5EOO
 aur0DzuVrvMe0KDfj9B5g93HpHAv3WzALVlXKuEgNPmVqDTVb06K7iG/T7Suzq2EywDm
 +wFw==
X-Gm-Message-State: AOJu0Yzu/Qa/8bku0UWNtXtrpxnhrNS0NaPrR1ETN075e1K1PDNpczxt
 ZQwzOiNncvqVdo9KAT/rO3zrzvp+tIOoOQanIx7hfmnPsktW8LLKSxoG5fe1kPWIof0=
X-Gm-Gg: AfdE7cmvlJ9nmY1JO6pWxwwxS+F4HMFauOpIidEgfcPjzKNPILddtLBY5OxWl0X5ELS
 iYF7yZtk/X4ZCwleMa1PQXcNL54EgzYwkIDgoJCssbUdoWErY6Dp4j/9lydJCAS6Hj4e1tDrsXv
 Qs45bkDkcmEqwkbRcwcBUYVNygSWJrHkp1h3l204o1yyOFv0v+NP9xr860e25Zb+aIYd7WdxSbM
 YZaHTZt03V3Le5OwIzyEwxCcoryAE1e4yKcCVd/B2+9K4eauM0LcYgJyAHEPmClz4jXyl+0PaFi
 eJPjYvb2ydvKu4JqUm+dkTxbOIArUh6OaR2cq58e/VAeT3dRnaA4QHansGesWIhUKQN4eOYT8cu
 iaj4+HZDsSNYwppPdBgca8bRTsLuRKaiT89Ecp33b4QQqzTInoFBbu8jL6clqqK6mZk0z1W5KaC
 7NuY/rmSuJ9fcwlDQhBw==
X-Received: by 2002:a17:903:3905:b0:2c8:248a:5dbb with SMTP id
 d9443c01a7336-2ce9e9a701fmr103267885ad.7.1783983768803; 
 Mon, 13 Jul 2026 16:02:48 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/10] target/arm: Implement BFTMOPA (widening)
Date: Mon, 13 Jul 2026 16:02:38 -0700
Message-ID: <20260713230244.70174-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
References: <20260713230244.70174-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h |  2 ++
 target/arm/tcg/sme_helper.c      | 54 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  3 ++
 target/arm/tcg/sme.decode        |  2 ++
 4 files changed, 61 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 224de45294..f05b53f412 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -408,3 +408,5 @@ DEF_HELPER_FLAGS_4(sme_usmop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme_bftmopa_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sme_ftmopa_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sme_ftmopa_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sme_bftmopa_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index e57c56d5f2..91447d9c0e 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2679,6 +2679,50 @@ static void sme_tmop(void *vza, void *vzn, void *vzm, uint64_t *zk,
     }
 }
 
+/*
+ * Sparse outer product, widening 2-way, 16 to 32-bit.
+ */
+static void sme_tmop_2way_sh(uint32_t *za, uint16_t *zn0, uint32_t *zm,
+                             uint64_t *zk, void *fn_opaque, uint32_t desc,
+                             void (*fn)(void *, void *, void *, void *))
+{
+    intptr_t oprsz = simd_maxsz(desc);
+    intptr_t dim = oprsz >> MO_32;
+    intptr_t index = simd_data(desc);
+    intptr_t ctrl_base = (index * oprsz) >> 1;
+    uint16_t *zn1 = zn0 + sizeof(ARMVectorReg) / 2;
+
+    for (intptr_t row = 0; row < dim; row++) {
+        uint32_t *za_row = za + tile_vslice_offset(row);
+
+        for (intptr_t col = 0; col < dim; col++) {
+            uint32_t *e2 = zm + H4(col);
+            uint32_t *e3 = za_row + H4(col);
+            uint32_t e1 = 0;
+
+            /*
+             * Four control bits select two elements.  The two elements
+             * may be non-contiguous, so assemble them locally into e1.
+             * Pseudo-code has a double loop running forward, with a
+             * test for (i < 2) to limit construction to 2 elements.
+             * Easier to run a single loop backward, shifting extra
+             * elements off the top of our uint32_t.
+             */
+            uint64_t this_ctrl = extractn(zk, ctrl_base + col * 4, 4);
+            for (int i = 3; i >= 0; i--) {
+                if (this_ctrl & (1 << i)) {
+                    bool e = i & 1;
+                    bool r = i & 2;
+                    uint16_t *p = (r ? zn1 : zn0) + H2(2 * row + e);
+                    e1 = (e1 << 16) | *p;
+                }
+            }
+
+            fn(e3, &e1, e2, fn_opaque);
+        }
+    }
+}
+
 static void inner_fmop4a_hh(void *vd, void *vn, void *vm, void *vinfo)
 {
     float16 *d = vd, *n = vn, *m = vm;
@@ -2893,6 +2937,16 @@ void HELPER(sme_bfmop4a_sh)(void *vza, void *vzn, void *vzm,
                                 : inner_bfmop4a_sh);
 }
 
+void HELPER(sme_bftmopa_sh)(void *vza, void *vzn, void *vzm, void *vzk,
+                            CPUArchState *env, uint32_t desc)
+{
+    float_status fpst;
+
+    sme_tmop_2way_sh(vza, vzn, vzm, vzk, &fpst, desc,
+                     is_ebf(env, &fpst) ? inner_ebf_bfmop4a_sh
+                                        : inner_bfmop4a_sh);
+}
+
 static void inner_bfmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
 {
     float32 *d = vd;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7d21ebabc3..8548bfd5c9 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2162,3 +2162,6 @@ TRANS_FEAT(FTMOPA_hh, aa64_sme_tmop_f16f16, do_tmop_fp,
            a, MO_16, FPST_ZA_F16, gen_helper_sme_ftmopa_hh)
 TRANS_FEAT(FTMOPA_ss, aa64_sme_tmop, do_tmop_fp,
            a, MO_32, FPST_ZA, gen_helper_sme_ftmopa_ss)
+
+TRANS_FEAT(BFTMOPA_sh, aa64_sme_tmop, do_tmop_fp,
+           a, MO_32, FPST_ENV, gen_helper_sme_bftmopa_sh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index f0f9b3f61d..49af8fd19e 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1145,3 +1145,5 @@ USMOP4_dh       1010 0001 110. ...0 0000 00.. ..0. 1...         @mop4_o3
 BFTMOPA_hh      1000 0001 011 ..... 000 ... .... .. 100 .       @tmop_o1
 FTMOPA_hh       1000 0001 010 ..... 000 ... .... .. 100 .       @tmop_o1
 FTMOPA_ss       1000 0000 010 ..... 000 ... .... .. 00 ..       @tmop_o2
+
+BFTMOPA_sh      1000 0001 010 ..... 000 ... .... .. 00 ..       @tmop_o2
-- 
2.43.0


