Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A0ECD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8S5-0007jn-KV; Thu, 07 May 2026 19:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rm-0007DI-AX
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:10 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Ri-00026G-9P
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:01 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-463a0e14abfso809701b6e.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197677; x=1778802477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXPj/QlpCYEFhtvvZEtY1JMDadNpGSOfaXgiXErZtmc=;
 b=zjBJN78GjE6+oegTt5+SutKoZQCa5M9b5aA94sBg82/N7LD8ybJeg/430UnDvrJDxw
 VAsk/i5Rq/n5pGgzDRpdpPyAPmBgb3rU0rEfRIoY+v3k5QYeKZESuASmSvtCp1t+Q1QA
 znzYzHjSFRJGo0ky55uZTsdrc3BSWq//zJQRSnkseIaxh9QVPMuFyxWYf4ARw/Sur81S
 BW7NSiue26w7XgZZcGKMd/G7FcyUxv40TDzE6JmhK48JoSlnLNb+9g6+wI5BzxCAhfXK
 +U2C8OSGJWfn3OBkTEMIIHod2zLQOqKb1s2o4CszdkJ8TxHuHPUk5jT57+VWRPHr93vu
 4X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197677; x=1778802477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fXPj/QlpCYEFhtvvZEtY1JMDadNpGSOfaXgiXErZtmc=;
 b=p3F0iDIEZSGCa7MaRZYsX45NX+R8v1Kb8pvBF3jW8Kf3tBQgUv9bqqQNGHdXkFkHQk
 FEJvc0wxwh0kPR6QFnzacZBbI8WcjOmUEd9lWZZbWDIs0XbThuW4+HTQLDQaipBbO3/f
 UbPH4o2iKMmTWVSfeJN1bRI8Qbit4woXbz0AbCclSSH5fJjHab8wnBaHPl52UCKzj4HP
 VvkEM3PzVvaXwQ36y/FWUNHQYKE57tFZYJn5U3wgoavALKFBFw+tvcfFFPNg6acgVcvP
 Y6Jb2g0pFkJxV71IHW0zVOTlnePapulXTOAQi0zg22DkSDAY4n85iI2gKYU5DkUGZgqJ
 VznQ==
X-Gm-Message-State: AOJu0YwLgI+SgJ6/Tp7VX5sJF/FQldqPKC8EFvjPbsCY1RGKeiWFYMOi
 zkNMd1XAO+5CH024fjHbPCYOOiSq8xG9vnzdxb7wbYKD5Dcq9t7dOcgPV/5pYtwx/EZKCOsUG+6
 ZnB2y
X-Gm-Gg: AeBDietiX8SR04jLnmmPsrwWFTnDUnpzI0j9vK/zrvd/+E/AjB/+FNCZvmqSN65tLp3
 pGU+T4ciq591odrlcaQy4j9XrheUw3nYNg90y6IJ8mUEFa5Sbz5tUx7I7HiAc6cFSBxxgxuFixk
 2cSq9bfYtArwHaSWv/dZoW+ZRSO1f+dm4tE8Sb1Hzc2XsbfOVzMiMvORKZXkK1KqbMcJXw7xroc
 4haDTugq0e3FPa1Z1e0jtl9jIzVNaY3htHtO3I63bahrePzIAQ91DqQku5qwqUx8P2tlidSL6ow
 4wOvpMxxFpWtCEn/LONZzcE7YaQ9KjubTUgrjugpSh7x6KgW+VjpIWEyw1o+kzM0mW+q/If8+bG
 TQM6BFh9/kNa6ttNu85cUBhVzv2mjkwXrIts9Lg3sj6GdNYa7aXVPpZ2XYHubNq/pVwUEzg/Xww
 5DR0+5XCUk4kGo8SNLvXevtEYHYJ//fxnSao6LkRBY1WbHqHpIfBEMPz7Xo/MetwWHOqM=
X-Received: by 2002:a05:6808:4f26:b0:46a:cb96:d2b7 with SMTP id
 5614622812f47-480424e1ed0mr7101205b6e.35.1778197676663; 
 Thu, 07 May 2026 16:47:56 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:47:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 42/60] target/arm: Implement LUTI4 (four registers, 8-bit)
Date: Thu,  7 May 2026 18:43:55 -0500
Message-ID: <20260507234413.643512-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/translate-sme.c |  6 ++++++
 target/arm/tcg/vec_helper.c    | 14 ++++++++++++++
 target/arm/tcg/sme.decode      |  6 ++++++
 5 files changed, 32 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fa8a619ae0..1963392730 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1637,6 +1637,11 @@ static inline bool isar_feature_aa64_sme2_f8cvt(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_f8cvt(id);
 }
 
+static inline bool isar_feature_aa64_sme2p1_lutv2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2p1(id) && isar_feature_aa64_sme_lutv2(id);
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 05ccf795e8..8ec6c16319 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -1120,6 +1120,7 @@ DEF_HELPER_FLAGS_4(sme2_luti4_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
+DEF_HELPER_FLAGS_4(sme2_luti4_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 214427db1f..0af133c1c4 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1846,6 +1846,9 @@ TRANS_FEAT(LUTI4_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2s, false)
 TRANS_FEAT(LUTI4_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4h, false)
 TRANS_FEAT(LUTI4_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4s, false)
 
+TRANS_FEAT(LUTI4_c_4b, aa64_sme_lutv2, do_lut, a,
+           gen_helper_sme2_luti4_4b, false)
+
 static bool do_lut_s4(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
 {
     return !(a->zd & 0b01100) && do_lut(s, a, fn, true);
@@ -1866,3 +1869,6 @@ TRANS_FEAT(LUTI4_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2b)
 TRANS_FEAT(LUTI4_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2h)
 
 TRANS_FEAT(LUTI4_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti4_4h)
+
+TRANS_FEAT(LUTI4_s_4b, aa64_sme2p1_lutv2, do_lut_s4, a,
+           gen_helper_sme2_luti4_4b)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index f0dc11bc8a..20ecdb0a9e 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3346,6 +3346,20 @@ DO_SME2_LUT(4,4,s, 4)
 
 #undef DO_SME2_LUT
 
+void helper_sme2_luti4_4b(void *zd, void *zn, CPUARMState *env, uint32_t desc)
+{
+    unsigned vl = simd_oprsz(desc);
+    unsigned strided = extract32(desc, SIMD_DATA_SHIFT, 1);
+    unsigned dstride = !strided ? 1 : 4;
+    uint64_t indexes[ARM_MAX_VQ * 4];
+
+    memcpy(&indexes, zn, vl);
+    memcpy((void *)&indexes + vl, zn + sizeof(ARMVectorReg), vl);
+
+    do_lut_b(zd, indexes, (void *)env->za_state.zt0, vl, 0,
+             dstride * sizeof(ARMVectorReg), 4, 32, 4);
+}
+
 void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     unsigned part = simd_data(desc);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 339de72b8a..495330aed7 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1014,8 +1014,14 @@ LUTI4_c_2s      1100 0000 1000 101 idx:2  1 10 00 zn:5 .... 0   &lut zd=%zd_ax2
 LUTI4_c_4h      1100 0000 1000 101 idx:1 10 01 00 zn:5 ... 00   &lut zd=%zd_ax4
 LUTI4_c_4s      1100 0000 1000 101 idx:1 10 10 00 zn:5 ... 00   &lut zd=%zd_ax4
 
+LUTI4_c_4b      1100 0000 1000 101     1 00 00 00 ....0 ...00   \
+                &lut zd=%zd_ax4 zn=%zn_ax2 idx=0
+
 # LUTI4, strided (must check zd alignment)
 LUTI4_s_2b      1100 0000 1001 101 idx:2  1 00 00 zn:5 zd:5     &lut
 LUTI4_s_2h      1100 0000 1001 101 idx:2  1 01 00 zn:5 zd:5     &lut
 
 LUTI4_s_4h      1100 0000 1001 101 idx:1 10 01 00 zn:5 zd:5     &lut
+
+LUTI4_s_4b      1100 0000 1001 101     1 00 00 00 ....0 zd:5    \
+                &lut zn=%zn_ax2 idx=0
-- 
2.43.0


