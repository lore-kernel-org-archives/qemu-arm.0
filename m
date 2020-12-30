Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12100250lfq;
        Wed, 30 Dec 2020 09:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPMZIqNXbOabbwN0NPBSD3OmCvEcNNEtHgGgvve/JXFkBmEVllk81TCgEhtkUqu3NU5vjC
X-Received: by 2002:a25:d392:: with SMTP id e140mr81873650ybf.70.1609349150905;
        Wed, 30 Dec 2020 09:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609349150; cv=none;
        d=google.com; s=arc-20160816;
        b=P10Yzkw3hNkbyL6u3njxEIUGNlUSPlmGlUdfQWOyR0r/TYAN/6FVwB+ZzVkQCTpfpY
         /8xJS6PCGv3k+ZmZL8B93Bj8BsxQRH45qAbDB/mgr7JunNKuXkgIVnmixCho61I5sqBt
         l1+mWRYcyXwGoyWlkTPOCS5sK8cvrHY0Pj5ih75ZbFmUDfjIFSg24D/ldF3CyPFxc5Sz
         tF2DN4q14d4zAzzk5bjlKoW7oVPJEEPIDsEHh0CdvER1Z3+yUN3+T4EGE5zaMHsRJ56X
         X485E9wftuKRBSWW9vG895NJbiCSbVsMIV7Baxbx8vtakLq1ubMnAfj0RRgyX0fzQPGo
         tmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=KGtZvuF9EUsrpUsokKnKrv1xAf0EI+EpgdABgrDkMzI=;
        b=QyaksQHQe/gsG/O0SYmVAJVMunXCb1zLyZxjmVzcUf8YKveuo4CAT7KqdlVTQ53tyB
         qGUL3QU8G8CFdY31WG99h/IQsDfqssEW+rUbv76e933oXNol0zoKD3YxnFqYbN2wqssw
         3mP/+f5R3HGyONKbK4eKBIiEA2auNeirAo3d4yB5L6YP3aq84qP2EIw36NR3hebVO78A
         duz92sx0oAS1a7ntLD95cEXSFfDcKa/CW4z/zs8SLKwDO08mKw3I1Go+YZS9b8u1aH1C
         je0ifG/hpJSaSzGCq7h+pRxB7zbbSstdZBML7Vw/axg0Ok9aaJpLBFhSk+PNaR0P4EMs
         jAqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ut+pHL1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si40119704ybm.252.2020.12.30.09.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 09:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ut+pHL1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kufEM-0005OI-9i
	for alex.bennee@linaro.org; Wed, 30 Dec 2020 12:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kufE8-0005Kl-4e
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 12:25:36 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kufDz-0003rj-OU
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 12:25:35 -0500
Received: by mail-pg1-x530.google.com with SMTP id n7so11712916pgg.2
 for <qemu-arm@nongnu.org>; Wed, 30 Dec 2020 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGtZvuF9EUsrpUsokKnKrv1xAf0EI+EpgdABgrDkMzI=;
 b=ut+pHL1Zdy15YcbmSTbXCTHFjVw0+yyvs5oUFHklGKArkamUGx5JH16m+0Cl2eckkb
 I0WWoViROLPIpgS6JcNOrizITzciI94mupNyG6cS1MXlcRlhyQLjGAvHzRnbx21NqCGt
 Tj2nq6eOEs5w/zTa/Gp/limhyeV9G4KP/tV6QYIiZerIBr6Q8jRvptwgQSPQYtfuG7tN
 +Zfbn4xih+O+kPfORvC00pcUdEx8/YT6bbgsgubX3GI+B36laVR3Uq7Wwhxp5L0Bik86
 NBqAsJyH69oxns8Ust73tNkgpl9IlbO4jZcAKSEyBxIUOfJBSybN7S1xceYXuoGoJpkO
 hv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGtZvuF9EUsrpUsokKnKrv1xAf0EI+EpgdABgrDkMzI=;
 b=LXQIPJ90LiWxNFLAFaIxgECiR1q7q3UaxsbVFN4PYdF4V37b2d3NQzfdxnIrFUAVpD
 uSx2L3eG4HAJ0Yb2j4c4/rbD/ZcAFdzXmz1FzvWJq49CGZefasLsivr1LfrgaEjsHaek
 /BCBaN2FvO9Ba1Vs35/A1YIThGij0/Zzy4ZYH/GFI509yH5Qz4a3h+Ub5eBdHd4R/9IY
 odGaz8/x00HpkAx/zu8en4n8Q2XkqQ8eAzh0qgrZ/VtQPfGVIOssiJCDHxLnfLLpGpVT
 erK1ZQYE2yg55nIYxDnks7SktsLFNXitqDnDrnlz8h8SJ3nxUzjRxbH7RLUHLqnuJwMu
 tWKQ==
X-Gm-Message-State: AOAM531U9E07JGgpbozmaZzPrfx4CAX4wHzS5QmsyH6L9R3UpdIFVMTp
 m7SvN2wthgLRbpAKhI1BGdDeFg==
X-Received: by 2002:a62:5547:0:b029:1a4:cb2a:2833 with SMTP id
 j68-20020a6255470000b02901a4cb2a2833mr48721493pfb.35.1609349124352; 
 Wed, 30 Dec 2020 09:25:24 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w2sm44274786pfj.110.2020.12.30.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 09:25:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix sve pred_desc decoding
Date: Wed, 30 Dec 2020 09:25:22 -0800
Message-Id: <20201230172522.33629-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sa/0/MDlGTqC

There was an inconsistency between encoding, which uses
SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
This happened to be ok, until e2e7168a214, which reduced
the size of SIMD_OPRSZ_BITS, which lead to truncating all
predicate vector lengths.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1908551
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Ouch.  The patch that exposed this, e2e7168a214, went in near
the start of the 5.2 devel period, and I never noticed.  I've
been doing most of my testing vs ArmIE of late, which due to
lack of a proper sve signal frame restricts RISU to sve128,
which worked fine with this truncation.  I need to spend some
time getting FVP working again...


r~

---
 target/arm/sve_helper.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5f037c3a8f..99e4b70d2f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -914,7 +914,7 @@ uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
 
 uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
 {
-    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
+    intptr_t words = extract32(pred_desc, 0, SIMD_DATA_SHIFT);
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     uint32_t flags = PREDTEST_INIT;
     uint64_t *d = vd, *g = vg, esz_mask;
@@ -1867,7 +1867,7 @@ static uint64_t compress_bits(uint64_t x, int n)
 
 void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
     uint64_t *d = vd;
@@ -1928,7 +1928,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     int odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1) << esz;
     uint64_t *d = vd, *n = vn, *m = vm;
@@ -1985,7 +1985,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_trn_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     uintptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     bool odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
     uint64_t *d = vd, *n = vn, *m = vm;
@@ -2035,7 +2035,7 @@ static uint8_t reverse_bits_8(uint8_t x, int n)
 
 void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     intptr_t i, oprsz_2 = oprsz / 2;
 
@@ -2065,7 +2065,7 @@ void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 
 void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
     uint64_t *d = vd;
     intptr_t i;
@@ -2221,7 +2221,7 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
  */
 int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
 
     return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
@@ -2694,7 +2694,7 @@ static uint32_t do_zero(ARMPredicateReg *d, intptr_t oprsz)
 void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2705,7 +2705,7 @@ void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2716,7 +2716,7 @@ uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
 void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2727,7 +2727,7 @@ void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2737,55 +2737,55 @@ uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
 
 void HELPER(sve_brka_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_z(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_z(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_z(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_z(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brka_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_m(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_m(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_m(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_m(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
 
     if (!last_active_pred(vn, vg, oprsz)) {
         do_zero(vd, oprsz);
@@ -2811,7 +2811,7 @@ static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
 
 uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
 
     if (last_active_pred(vn, vg, oprsz)) {
         return predtest_ones(vd, oprsz, -1);
@@ -2822,7 +2822,7 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     uint64_t *n = vn, *g = vg, sum = 0, mask = pred_esz_masks[esz];
     intptr_t i;
@@ -2836,7 +2836,7 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 
 uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
 {
-    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
-- 
2.25.1

