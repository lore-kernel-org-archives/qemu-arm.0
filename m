Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827927ejb;
        Tue, 21 Feb 2023 18:36:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9YlWP+X+AqV3wzguJTSgnyey7+x4zKydatwuyfJQOD1SYd5UqdrhWpcrqjh+WjiaITGcNg
X-Received: by 2002:a05:622a:155:b0:3b9:bda7:bfa7 with SMTP id v21-20020a05622a015500b003b9bda7bfa7mr11049335qtw.40.1677033383101;
        Tue, 21 Feb 2023 18:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033383; cv=none;
        d=google.com; s=arc-20160816;
        b=Fy+XBViqqTYniKe0fYlfPq/OgD5WAXz+tttbR758sv8gjM4CqtYl7QVu+1Bq8BDw4K
         EL9iuo9MJAwQ0JA9qs/L9Uv0i6WFuPVnVRpMJX/beZAXHukMLxYzqNh2bhwqoNh3VYix
         nvQsEfYo2lepaIdmMlsUGXx38VeunqUzNWLjWN6iZa4usNtJuRMSQzasjf7V6B+L4Uzv
         pPiMdKFSYTbawF/aQGpiQHXNWh7VT8DCZ2VELj7lDeegruxuQj5p/3mMMxCqhSvW/Tyy
         bSYKPntJCXt7tsP+Z0uEmuSP6tJEO4R6O9dEX5n4CZWhdR4CFGDu75qqYe85ET0TT1Wg
         ACjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vZ42O5SQoIJotc7B0HupvbG77824SBhRrElE1X3jpLY=;
        b=vgvWAuXDnNU2otps9CcEd53q5EITwOBqy/U6XgqAEYHoDvwEGPJVgk8scJ8MCqjMyv
         AEymBQDGs9Xna9y26YYgM1pfPx+hRMg6P1S4pcOHKgTmIvlSXxnnSD6DXMRFgdySyQm4
         QkOHmH2pPTlL6g9CZA9tAn/2k4w7dwVXX/fmCCffdf4blxdGziT80NgT/sOopk8MWPH/
         4/Uawg/oPqVGeMkpQX9n+GYydZMffSg+hNmhMxXetSV+zx7BiTAT6NoMAIjHa+BMI2et
         bW0TkaO7qcoU681+DTGdUOymcS7irced2duwgIZYW9+1+aL3+Hdr6gn7+JvLh5oROYmA
         nOtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pce8Ec/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020ac85c15000000b003b824b0e605si14035038qti.32.2023.02.21.18.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:36:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pce8Ec/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexR-0007ci-Ew; Tue, 21 Feb 2023 21:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexL-0007Ok-DY
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:07 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexF-0001gn-S6
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:03 -0500
Received: by mail-pl1-x634.google.com with SMTP id u14so3298095ple.7
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ42O5SQoIJotc7B0HupvbG77824SBhRrElE1X3jpLY=;
 b=pce8Ec/SaTsZ2O46hf0UgbCiRNOnqhvwbiZVSuSjFzOQlyzH73UYBlQ+VnArCsoGcg
 KrisqGapxxhprtrnm5hAbC+sR1N2B9vlz6mSYs1Y7TdfHdqzlFx7swA3MrJqHU4lc4/7
 KTCGwhOw5Mxur67/2Qfow5S15a1nmUZE+hMP8Pf1CG4deM2cDhccNQSDr6AvyYFpPfTF
 wELHHHvEtST2ra196AcQFYfSO7xMSbs7ECBpZLTfukI61dCbQGLJZw400zMJj/sjwE8d
 AZPfgFSX7lwxaA02Pa1qYCsbJQcR+1/MxB2vt8S5YW13uuDAbdIl5SZsDrm25xvqE0XQ
 JO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZ42O5SQoIJotc7B0HupvbG77824SBhRrElE1X3jpLY=;
 b=wrVG/cUuaHSQM9qmEstohWOFdzxdGG1B1vdJwlkNzLWBWyvCyXGCrOaJaAY4tWddXK
 6TqFd0dujuqYueLA9i3m0j6MaCOjOJ4kkvgr5MYpd7d4V8wisntNvh9vaLLd9y8TOO/G
 j7T5ZW3QCIxOyh6BhPrPywRx7xEQD2y+9/vwisK6dJVJ7HkfSHKaJlAoPtlQtSruRfji
 oaRRm49+E+JZjtlScfxiacHgvVyLnZ4LMSR3VfEkvxWJ159ktIfLT95Q5OR09t8yK9w2
 nY99IIunh8/H85j4DUfy0+A4zTF0F/4tDPaDXtI8TCZ58lcOeKNO+056jqBZ+44VLY+B
 QeaA==
X-Gm-Message-State: AO0yUKXcKNef6Sy6VMyTMR0r94+0PyUpJ1XUWNwi1AHmRIVQ3s3Q7MUC
 oAzPXZzL0Fi/+6vyZNN8pLCndyOkD0wReW+WQaY=
X-Received: by 2002:a17:902:facd:b0:19a:9b87:e73f with SMTP id
 ld13-20020a170902facd00b0019a9b87e73fmr7466085plb.1.1677033240587; 
 Tue, 21 Feb 2023 18:34:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/25] target/arm: NSTable is RES0 for the RME EL3 regime
Date: Tue, 21 Feb 2023 16:33:26 -1000
Message-Id: <20230222023336.915045-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: gXRiQnfjeXcn

Test in_space instead of in_secure so that we don't switch
out of Root space.  Handle the output space change immediately,
rather than try and combine the NSTable and NS bits later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a77db3dd43..8b3deb0884 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1238,7 +1238,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1254,7 +1253,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1415,20 +1413,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddrmask = MAKE_64BIT_MASK(0, 40);
     }
     descaddrmask &= ~indexmask_grainsize;
-
-    /*
-     * Secure accesses start with the page table in secure memory and
-     * can be downgraded to non-secure at any step. Non-secure accesses
-     * remain non-secure. We implement this by just ORing in the NSTable/NS
-     * bits at each step.
-     */
-    tableattrs = is_secure ? 0 : (1 << 4);
+    tableattrs = 0;
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
-    if (nstable && ptw->in_secure) {
+
+    /*
+     * Process the NSTable bit from the previous level.  This changes
+     * the table address space and the output space from Secure to
+     * NonSecure.  With RME, the EL3 translation regime does not change
+     * from Root to NonSecure.
+     */
+    if (extract32(tableattrs, 4, 1) && ptw->in_space == ARMSS_Secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert the relative order of the secure/non-secure indexes.
@@ -1437,7 +1434,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
+        ptw->in_space = ARMSS_NonSecure;
+        result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
+
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
         goto do_fault;
     }
@@ -1540,7 +1541,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= nstable << 5; /* NS */
+        attrs |= !ptw->in_secure << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
-- 
2.34.1

