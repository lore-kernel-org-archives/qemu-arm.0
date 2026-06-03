Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202E1CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcI4-0006gy-68; Tue, 02 Jun 2026 23:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI1-0006e8-IB
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:09 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHz-0003cF-3O
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:09 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84234c83142so1386699b3a.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457346; x=1781062146; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/lrt+3/bQ6YgdVMn0NyzAOITcsoY40O+fBeq5WXXKY=;
 b=M7Bpv3x5C2dYISCxC+M1xhj4uYKPNU0HDV4CyqmUujGHqgWYwXiwfxtJZ3zUJw4p4X
 WjWSEeeVjlhHTe2JqTh4v0Ow7sdz/giIv6JPws/qi++pGQhThI868xhRBXRLLxgEAiUy
 +0ZIWROswEiyRPs4bnUY7wfjE05oE06wKR2saZLkiNbzJyLsmrgYOYZWpV75T66wOvUc
 JJNTI3ClBBipDS4Yf/MQ9ULGE38LW8NJbcakpal7xe9LcM+et0onyIs3HzkjBvdgkVYx
 UxGAVMblVOv3jiy+jpupjmEz6Uxmb/xDGLkqu04hYRFVuIh/mmJyblkaT7ZYn4CB7KDm
 9x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457346; x=1781062146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S/lrt+3/bQ6YgdVMn0NyzAOITcsoY40O+fBeq5WXXKY=;
 b=Os1evpbwtIR9GljYmrgpRw28R1hNrJz66ZC+g1JoWS152JkXF7plq7aNHLvgud3GAY
 ud0z5URAk9kT9s+KOhKXXm24jUOTfy9sCx+Sygx3wHYCo9WtoXMAWGKMR4p6D2iqz2+w
 xRBaMhK+1lNBq0XdlUaHLnYIPR1+2bXd69qQjdpCAz01Wse4DhLWb4KngAqKER2Ym9Y3
 1teGJeLyvABNF+bfVcanjzOSfVa4PF+x3kbfvqpJLH+lYp5DEOslPeL/iVFrpWOtY1xe
 1+Hli7FAH8npLz3gIFdgJbq0fOUrlJMTI1fjRWAK5DCOwddKXXV3N+gBfkeX+/LMNDcC
 tGWA==
X-Gm-Message-State: AOJu0YyJI0C0WoiEC1ft/1iOb0kekfgdZl//9ST+FHaZt0eXd5LC6Ll/
 h8m96fnMRqp3YILM6RrDR+lT5uFfhrH8AAI68v8WMzWJpMZlDBd724ftjzAFBYeLHKIuE2VSqIL
 jHItxjIk=
X-Gm-Gg: Acq92OFah0cF88ckDFPvDB4VlSeditk8cqO94a/UfexIruAKYaN6b3mCpZ8BIIDTzmr
 9oRkHhtu7pogrdBYXD70O467H5sHpyjSDC7wDqjqlinz+PlZ01tAcZxcZKlZOQM4G5bFambIwWZ
 eB548UbIOjcvxrsdlNdFtQPJgWkKEzIfrV7RRyS1NYtgZUuRZpXqHoqKNX8hZGuOnjS5kdJopHI
 CgQxK6C+sX5Ep2dffPJp3Nsl+Km1La/rEFNX/H+txKFUqEc3jTLMQ56+OJOIrDncxHzeKJo/eUk
 16HycJEEuI1e7lQm0RMMKdZQ2zqCJ7RS93lsDgXrMrs9W8qouwhT3OMRoN50I2f+e5Hr05j0Z/9
 KAPvfMj+mKeW/UPikua/eRFxvQTiBzg/JkdNMjOuQeH1ILHgfTHVf5Bi0oGFJPHpOyQ8LtSE/Ml
 PmFGd/WSePjK3S0ujpy15/rQOtZghu3sN/LRr5uF4=
X-Received: by 2002:a05:6a00:2351:b0:83e:f5d7:6e9a with SMTP id
 d2e1a72fcca58-84284fb1216mr1526105b3a.50.1780457345427; 
 Tue, 02 Jun 2026 20:29:05 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 13/45] target/arm: Implement F1CVT, F1CVTL, F2CVT,
 F2CVTL for SME
Date: Tue,  2 Jun 2026 20:28:22 -0700
Message-ID: <20260603032855.106930-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  5 ++++
 target/arm/tcg/sme.decode        |  5 ++++
 4 files changed, 59 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 3021dafd44..b5dc2b7064 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -10,3 +10,5 @@ DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 75c89203fe..e2330177ec 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -211,6 +211,33 @@ void HELPER(sme2_bfcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_cvt_finish(env, &ctx);
 }
 
+void HELPER(sme2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vectors_overlap(vd, 2, vn, 1)) {
+        n = memcpy(&scratch, vn, oprsz);
+    }
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d0[H2(i)] = fcvt_fp8_to_f16(n[H1(i)], input_fmt,
+                                    ctx.scale, &ctx.stat);
+    }
+    for (size_t i = 0; i < nelem; ++i) {
+        d1[H2(i)] = fcvt_fp8_to_f16(n[H1(i + nelem)], input_fmt,
+                                    ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
+
 void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -230,3 +257,23 @@ void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_cvt_finish(env, &ctx);
 }
+
+void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        uint8_t e0 = n[H1(2 * i + 0)];
+        uint8_t e1 = n[H1(2 * i + 1)];
+        d0[H2(i)] = fcvt_fp8_to_f16(e0, input_fmt, ctx.scale, &ctx.stat);
+        d1[H2(i)] = fcvt_fp8_to_f16(e1, input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 19a13a6506..c0fe77242b 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1546,6 +1546,11 @@ static bool do_f8cvt(DisasContext *s, arg_zz_n *a,
     return true;
 }
 
+TRANS_FEAT(F1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 0)
+TRANS_FEAT(F2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 1)
+TRANS_FEAT(F1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 0)
+TRANS_FEAT(F2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 1)
+
 TRANS_FEAT(BF1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 0)
 TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index df9586c1a5..d6192eb59d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -853,6 +853,11 @@ UUNPK_4bh       11000001 011 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4hs       11000001 101 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4sd       11000001 111 10101 111000 ....0 ...01       @zz_4x2_n1
 
+F1CVT           11000001 001 00110 111000 ..... ....0       @zz_2x1
+F2CVT           11000001 101 00110 111000 ..... ....0       @zz_2x1
+F1CVTL          11000001 001 00110 111000 ..... ....1       @zz_2x1
+F2CVTL          11000001 101 00110 111000 ..... ....1       @zz_2x1
+
 BF1CVT          11000001 011 00110 111000 ..... ....0       @zz_2x1
 BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
-- 
2.43.0


