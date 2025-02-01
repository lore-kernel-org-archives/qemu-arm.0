Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143871njb;
        Sat, 1 Feb 2025 08:44:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwuLFUuR7+ZjL2DIgws0wm5Y8gVOlobXmgJzIHcoPT14dZb9ooElOVN+o+u8WY4AA7SyYFWj4FHA1vog==@linaro.org
X-Google-Smtp-Source: AGHT+IFe3F5DKCJBve245dbi0FcHLLJrdjeX+FfxkpUJKwIdgex3Y3lj7vFWkzwO/KQor2TXvhvF
X-Received: by 2002:a05:622a:1a98:b0:467:517b:90ca with SMTP id d75a77b69052e-46fea10acd5mr130261551cf.21.1738428296997;
        Sat, 01 Feb 2025 08:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428296; cv=none;
        d=google.com; s=arc-20240605;
        b=WIAUq510CY9bZ98Cjh5Goz5QzLoXLFLjfRxTH+uy2dDrQKUhP/YTtf+AoYUtCsqRg4
         Mu+AiSsRuZ1VMQWjdqFuLakL1EWuswj/acfj6Tv2Y7O7XmH96//tWBozqRvBwmjqy9xZ
         5cq1XR6AKrdDd3B9apzlyqOzVzDbaBH1kUvQqN2iSVO+u5GwGkio484svzu4w/a8ZY+1
         gRjeRuN10y/sqwXmjbL1n2OTJVZUTCU7gvzVDlBSP6kT0BxPQMq+95L/FCaxIGUCFlvS
         tkJm771Upk5lVhdBjpAI/tB2aPg0fYhcj4k28H9Vw1HXWd0OHQw9uW6VR09sGSVsOY/1
         cQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ayRctYXCTiKB54pe99hiltIMpcbOdgZRWtck3crpBoI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=PNwgebJz/F3bJPD6p1xfwGJH0bFcTs/AUsGA1XKcIZtosqpdvfVcNGLGz+XA8X7XsV
         0RxolJ0Ar7tUdlG8cLGgh00bmdNX2F80sfqpESuSAYeMZL6e/M0IbZy54lkfv6j57OFg
         vqcnxAWZGYM4Ls8aJB+iLWSmF5xW4pt/VXIhRxWzEKWI1iHHBY82neQy4I21CwbpvSst
         W+3ff9xn/P0z0DrimC8iTA+1ZZrFDR0wvPanf5pST6AUpFH6edVlbr+Bp0hYr3MJUtZi
         8SR5/dQ3iziy3Bqtzr31bFfAzPz5pU4QS0KalXvKuvJBBmtVpyEhCMHsqAcdFtUsFxXI
         6S9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEU85cvk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e3214si59525331cf.583.2025.02.01.08.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEU85cvk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYZ-00075b-7v; Sat, 01 Feb 2025 11:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYU-0006sA-6A
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYR-0001GY-Ss
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so30981205e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428070; x=1739032870; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ayRctYXCTiKB54pe99hiltIMpcbOdgZRWtck3crpBoI=;
 b=hEU85cvkGdZtywsJ7fmfF3Z4YaihkMRT0pTNsHDUZVebjTMLWwtE8RIaLxYMf4c7DA
 s3k1TD3RcyrkKZO2fR6vDbG6e9Rcdn9hGozkiCXiwLrswAIB0xVjaFu8ihYfl+gIXLHM
 sTswObv2EImjJGE9ouB5OU7q7JbWmSjfkJmZKICs7KxaE0GnBiQMJn95p0xQQ32beid0
 EQWz97hnBuAnkZ7RcDxuUtodU+yL8xtlxZSpb9dbm+WGy5GG/ZO3oms/uxEWJoAnTW8p
 FxpH7ZMb6gSMpPwfp3uMMMyhcr0pmIaWxSshXqmDpz4QA1b88wSqrIOdLoScCWFICVF3
 FTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428070; x=1739032870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayRctYXCTiKB54pe99hiltIMpcbOdgZRWtck3crpBoI=;
 b=AgT+vdC1400rjrniqoOPT/F0Ci5vtReHaNypIq04w+ddf+G32qUZUSzThwiG05w52D
 RRpYYYSGAxZ1nrtDyKIfZjuEtbvLU9PZBBLDoCJ5FX+m1IXhk1OVLMMxwwWcyJPGiPPb
 47ZPY1qOywvyOzy9qlsnk6hyRFfMIv7nAjJTKiILXOknxZ6nEDBS1TZ8P4heTIgLytb0
 4jhYvCQBOTiTPaZaI0rvpxVfubpdQK9ihYw6h5GJSK8sN6CpqnBlEy0IXm5LWDEreCs8
 7/htX/7eMq7PDmZ+FPk7Wi/8U2aLbk5WpE7LxW/9qqOyGVGlU5AX0ANlRq8cHAefHho3
 a0BA==
X-Gm-Message-State: AOJu0YyoSHcPfYRm3aUnDOM6TUAlzBvnmou7RJoO7Ic9T8oKGMg3Fpv/
 aCfbQvaKL0rLFFlEf70ygDJVYThzraLqeLu6f/wjLZsUfb3NDD+BzCxtTRTus5Fn93rfkZFTuPl
 w
X-Gm-Gg: ASbGncsGzUS9jfd6w81w09/hqrCIIySo2cLTp2xLOqyz2QReJrG4lO6KZjhTX3gjuHV
 hgo38G9+j/sJmrLrTJxoYaQ93K25W98hUhon01BVQorodQtncHSy9bYvWy5akjdoA1oAeWRiRUm
 vMIZfJAfNDHY4RrQnJlkRSGS+EaWVBfXt89Qgp0koHrvMFLIhuOq/qtDY4RbTHH3C2jpk2xqqZl
 U8RzZeAibj1hxRgneYsvqKlh27SxZOhz7yzZqccVbsjzUAuMBDzYpRY0AR0Yh2775wSQRhdijls
 HikbWP/Q+vLJGbgPkDYI
X-Received: by 2002:a05:600c:4fc1:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-438dc40d46amr127434555e9.23.1738428070104; 
 Sat, 01 Feb 2025 08:41:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 43/69] target/arm: Handle FPCR.AH in negation step in SVE
 FMLS (vector)
Date: Sat,  1 Feb 2025 16:39:46 +0000
Message-Id: <20250201164012.1660228-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eM7aJqthlUWC

Handle the FPCR.AH "don't negate the sign of a NaN" semantics fro the
SVE FMLS (vector) insns, by providing new helpers for the AH=1 case
which end up passing fpcr_ah = true to the do_fmla_zpzzz_* functions
that do the work.

The float*_muladd functions have a flags argument that can
perform optional negation of various operand.  We don't use
that for "normal" arm fmla, because the muladd flags are not
applied when an input is a NaN.  But since FEAT_AFP does not
negate NaNs, this behaviour is exactly what we need.

The non-AH helpers pass in a zero flags argument and control the
negation via the neg1 and neg3 arguments; the AH helpers always pass
in neg1 and neg3 as zero and control the negation via the flags
argument.  This allows us to avoid conditional branches within the
inner loop.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 21 ++++++++
 target/arm/tcg/sve_helper.c    | 99 +++++++++++++++++++++++++++-------
 target/arm/tcg/translate-sve.c | 18 ++++---
 3 files changed, 114 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index a2e96a498dd..0b1b5887834 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1475,6 +1475,27 @@ DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_7(sve_ah_fmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_7(sve_ah_fnmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_7(sve_ah_fnmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_7(sve_ah_fnmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 770945a2c6a..90d4defc0d5 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4802,7 +4802,7 @@ DO_ZPZ_FP(flogb_d, float64, H1_8, do_float64_logb_as_int)
 
 static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint16_t neg1, uint16_t neg3)
+                            uint16_t neg1, uint16_t neg3, int flags)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4817,7 +4817,7 @@ static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
                 e1 = *(uint16_t *)(vn + H1_2(i)) ^ neg1;
                 e2 = *(uint16_t *)(vm + H1_2(i));
                 e3 = *(uint16_t *)(va + H1_2(i)) ^ neg3;
-                r = float16_muladd(e1, e2, e3, 0, status);
+                r = float16_muladd(e1, e2, e3, flags, status);
                 *(uint16_t *)(vd + H1_2(i)) = r;
             }
         } while (i & 63);
@@ -4827,30 +4827,51 @@ static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0, 0);
 }
 
 void HELPER(sve_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0, 0);
 }
 
 void HELPER(sve_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000, 0);
 }
 
 void HELPER(sve_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000, 0);
+}
+
+void HELPER(sve_ah_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product);
+}
+
+void HELPER(sve_ah_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product | float_muladd_negate_c);
+}
+
+void HELPER(sve_ah_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_c);
 }
 
 static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint32_t neg1, uint32_t neg3)
+                            uint32_t neg1, uint32_t neg3, int flags)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4865,7 +4886,7 @@ static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
                 e1 = *(uint32_t *)(vn + H1_4(i)) ^ neg1;
                 e2 = *(uint32_t *)(vm + H1_4(i));
                 e3 = *(uint32_t *)(va + H1_4(i)) ^ neg3;
-                r = float32_muladd(e1, e2, e3, 0, status);
+                r = float32_muladd(e1, e2, e3, flags, status);
                 *(uint32_t *)(vd + H1_4(i)) = r;
             }
         } while (i & 63);
@@ -4875,30 +4896,51 @@ static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0, 0);
 }
 
 void HELPER(sve_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0, 0);
 }
 
 void HELPER(sve_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000, 0);
 }
 
 void HELPER(sve_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000, 0);
+}
+
+void HELPER(sve_ah_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product);
+}
+
+void HELPER(sve_ah_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product | float_muladd_negate_c);
+}
+
+void HELPER(sve_ah_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_c);
 }
 
 static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint64_t neg1, uint64_t neg3)
+                            uint64_t neg1, uint64_t neg3, int flags)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4913,7 +4955,7 @@ static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
                 e1 = *(uint64_t *)(vn + i) ^ neg1;
                 e2 = *(uint64_t *)(vm + i);
                 e3 = *(uint64_t *)(va + i) ^ neg3;
-                r = float64_muladd(e1, e2, e3, 0, status);
+                r = float64_muladd(e1, e2, e3, flags, status);
                 *(uint64_t *)(vd + i) = r;
             }
         } while (i & 63);
@@ -4923,25 +4965,46 @@ static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0, 0);
 }
 
 void HELPER(sve_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0, 0);
 }
 
 void HELPER(sve_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN, 0);
 }
 
 void HELPER(sve_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN, 0);
+}
+
+void HELPER(sve_ah_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product);
+}
+
+void HELPER(sve_ah_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product | float_muladd_negate_c);
+}
+
+void HELPER(sve_ah_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, float_status *status, uint32_t desc)
+{
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_c);
 }
 
 /* Two operand floating-point comparison controlled by a predicate.
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e81e996c56e..17016854d87 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3927,19 +3927,25 @@ TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
            a->rd, a->rn, a->rm, a->pg, a->rot | (s->fpcr_ah << 1),
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
-#define DO_FMLA(NAME, name) \
+#define DO_FMLA(NAME, name, ah_name)                                    \
     static gen_helper_gvec_5_ptr * const name##_fns[4] = {              \
         NULL, gen_helper_sve_##name##_h,                                \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d            \
     };                                                                  \
-    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_zzzzp, name##_fns[a->esz], \
+    static gen_helper_gvec_5_ptr * const name##_ah_fns[4] = {           \
+        NULL, gen_helper_sve_##ah_name##_h,                             \
+        gen_helper_sve_##ah_name##_s, gen_helper_sve_##ah_name##_d      \
+    };                                                                  \
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_zzzzp,                     \
+               s->fpcr_ah ? name##_ah_fns[a->esz] : name##_fns[a->esz], \
                a->rd, a->rn, a->rm, a->ra, a->pg, 0,                    \
                a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
-DO_FMLA(FMLA_zpzzz, fmla_zpzzz)
-DO_FMLA(FMLS_zpzzz, fmls_zpzzz)
-DO_FMLA(FNMLA_zpzzz, fnmla_zpzzz)
-DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
+/* We don't need an ah_fmla_zpzzz because fmla doesn't negate anything */
+DO_FMLA(FMLA_zpzzz, fmla_zpzzz, fmla_zpzzz)
+DO_FMLA(FMLS_zpzzz, fmls_zpzzz, ah_fmls_zpzzz)
+DO_FMLA(FNMLA_zpzzz, fnmla_zpzzz, ah_fnmla_zpzzz)
+DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz, ah_fnmls_zpzzz)
 
 #undef DO_FMLA
 
-- 
2.34.1

