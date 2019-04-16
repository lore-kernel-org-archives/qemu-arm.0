Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3900095wrx;
        Tue, 16 Apr 2019 06:03:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyYltDkm8wejs+7/W/+YNBrAOSugMqAPLolW2QYGF/0j6o43MzTBTHsCaHDXcuv0SianPe
X-Received: by 2002:a5d:5310:: with SMTP id e16mr31817403wrv.142.1555419836956;
        Tue, 16 Apr 2019 06:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419836; cv=none;
        d=google.com; s=arc-20160816;
        b=lauEp0iPXvkdMqjdZO5DIk2qAGzyZt17VYsEslKaOo1cYn5uokgw0S8V1+i+1b1Sfq
         nGRnxr/ZIasuWYhgcF2JLCabroM/VywLSwI1DLOfdOSM5AMfRmNl0ysZ+sKJARE4QD4j
         x5Wl/FboVpnscrvWamD1+6Me9SLzVei1aS5u8nR1BTIZvkaZjQJCXF17WrXUIO8lhhBa
         VuBB1HO0BBp/qIe6cMduIJrhzEA4P6p7jVi2OiiwY8M1uvJt4wg9CTuQFa0Q+DIEj0dY
         iBN4aXwTRFvAtfubYwewf4CfRt7Z2TcO7QE4D/hFKgBNNtfrW00HOfXrbSqR+Cw8BRXf
         ZpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=FJePOyZA9Q3WiPn2k7ahGOza/ZX3bYrlq3y5WZmHrm8=;
        b=m32wVB3yFrZtf3dZzouKCQr0Gqt7N3OdKoCCr5OKreWw4T4Gi2+HdM3+KusJw7MuFU
         AgtMpTFnFfycEIV/404NgZ6ERnMfDoqb+mz57W9MtIEswFT4GUGIpI0yGroFCeq+gttM
         eM0ZU7CP4lmHqJI3w2U994PKohaP7hhzpTkQeOS9gD9+hGMkphVKkado0YgJjZjue+fN
         1Gns9vCFl2WbSRtX3+bkIe9hAhGJuU+mHhynqjhW+9ZQxLUZYF/HRMQ6kE1FfPg6DM3w
         7c4vsvXZYMBTMbl/pRFGzkZRcUeQqkIxpJAz4JVl3cv+PiUZ8+docwTERBaev8+I0au5
         LYsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UCxrSCP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si12953320wmc.80.2019.04.16.06.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UCxrSCP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNkh-0000wc-TC
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf8-0004cA-50
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf6-0001BT-LB
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:10 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNf4-00018F-PE
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:07 -0400
Received: by mail-wr1-x442.google.com with SMTP id y13so26978025wrd.3
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FJePOyZA9Q3WiPn2k7ahGOza/ZX3bYrlq3y5WZmHrm8=;
	b=UCxrSCP0eboG54fxzgq65yS18UP31ZSBcboUV8nMm2G9k2XUGj7s8gq9Q9NtIjzq94
	4DCyBggg0BKfLwtJFNiytIcIuhBN+7Rpjt5svYgPHLJqJtl8AWp8R4pWsVDqP2w38SXq
	ua9Rufc8OiECFQwTH3mMmxMZYvqWPDku/ryXgWbW1SnT0ptgP9jkNHmt+w9SO/oQ9gRp
	wQ1cmyQLhOBE4pE31iNmPscs4Z5j4nawFqSHRXgg14IYjmYVwK3agPBCet0ZkO7HhFSL
	68WucII1TcFTeLuzaB36FkvCzBfvVYuSeDSFCTHYfbmfAOjp2MPI6dMABPlCEJwgVo9g
	ByYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FJePOyZA9Q3WiPn2k7ahGOza/ZX3bYrlq3y5WZmHrm8=;
	b=b74kRVxq/OX7hOvqda23PZecnzd9jWZ1Z4FjWqJPLwXR+oTkJHdHoVguhtG6gdNwZ9
	tNmOyTyVINyQCUcJ/V3N7h21+io7W7wkQedjWmFMthL/92oRxYHBJXTmc4l0tQ0GiAaD
	ferM3mVfOfaAxDqLtoPdh9qpTKInlWpiNHvKxG72GfO9PfjLYgPo0wGX5uvQqPHHp6fv
	v/NRTnoMhppwqtkv9gwP7n7FDIId9wnqpSON82PQ1Hu3tokixMsBC9aIsCG6wZyPEpiL
	gyvHmeUJK2mmpA44nxt/985fnE3PJD8JpjyaBcgDStxCbh5Ly4a9/ajRMx9L20fc2msN
	jEnw==
X-Gm-Message-State: APjAAAXrtMjsY7jTEQF8NZgvdfm6+HyOfF2yz+7nC0iTpN663NjmcNgN
	qhDQazQYTjRh7/hzJFukh0Jr1J9k6BY=
X-Received: by 2002:adf:e951:: with SMTP id m17mr42025658wrn.287.1555419482909;
	Tue, 16 Apr 2019 05:58:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:26 +0100
Message-Id: <20190416125744.27770-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 08/26] target/arm: Handle SFPA and FPCA bits in
 reads and writes of CONTROL
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMUvRIjifkG6

The M-profile CONTROL register has two bits -- SFPA and FPCA --
which relate to floating-point support, and should be RES0 otherwise.
Handle them correctly in the MSR/MRS register access code.
Neither is banked between security states, so they are stored
in v7m.control[M_REG_S] regardless of current security state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 57 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b4f1609a1c6..297eb38fef0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12032,7 +12032,14 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return xpsr_read(env) & mask;
         break;
     case 20: /* CONTROL */
-        return env->v7m.control[env->v7m.secure];
+    {
+        uint32_t value = env->v7m.control[env->v7m.secure];
+        if (!env->v7m.secure) {
+            /* SFPA is RAZ/WI from NS; FPCA is stored in the M_REG_S bank */
+            value |= env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK;
+        }
+        return value;
+    }
     case 0x94: /* CONTROL_NS */
         /* We have to handle this here because unprivileged Secure code
          * can read the NS CONTROL register.
@@ -12040,7 +12047,8 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         if (!env->v7m.secure) {
             return 0;
         }
-        return env->v7m.control[M_REG_NS];
+        return env->v7m.control[M_REG_NS] |
+            (env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK);
     }
 
     if (el == 0) {
@@ -12146,9 +12154,13 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
      */
     uint32_t mask = extract32(maskreg, 8, 4);
     uint32_t reg = extract32(maskreg, 0, 8);
+    int cur_el = arm_current_el(env);
 
-    if (arm_current_el(env) == 0 && reg > 7) {
-        /* only xPSR sub-fields may be written by unprivileged */
+    if (cur_el == 0 && reg > 7 && reg != 20) {
+        /*
+         * only xPSR sub-fields and CONTROL.SFPA may be written by
+         * unprivileged code
+         */
         return;
     }
 
@@ -12207,6 +12219,15 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
                 env->v7m.control[M_REG_NS] &= ~R_V7M_CONTROL_NPRIV_MASK;
                 env->v7m.control[M_REG_NS] |= val & R_V7M_CONTROL_NPRIV_MASK;
             }
+            /*
+             * SFPA is RAZ/WI from NS. FPCA is RO if NSACR.CP10 == 0,
+             * RES0 if the FPU is not present, and is stored in the S bank
+             */
+            if (arm_feature(env, ARM_FEATURE_VFP) &&
+                extract32(env->v7m.nsacr, 10, 1)) {
+                env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_FPCA_MASK;
+                env->v7m.control[M_REG_S] |= val & R_V7M_CONTROL_FPCA_MASK;
+            }
             return;
         case 0x98: /* SP_NS */
         {
@@ -12309,21 +12330,41 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         env->v7m.faultmask[env->v7m.secure] = val & 1;
         break;
     case 20: /* CONTROL */
-        /* Writing to the SPSEL bit only has an effect if we are in
+        /*
+         * Writing to the SPSEL bit only has an effect if we are in
          * thread mode; other bits can be updated by any privileged code.
          * write_v7m_control_spsel() deals with updating the SPSEL bit in
          * env->v7m.control, so we only need update the others.
          * For v7M, we must just ignore explicit writes to SPSEL in handler
          * mode; for v8M the write is permitted but will have no effect.
+         * All these bits are writes-ignored from non-privileged code,
+         * except for SFPA.
          */
-        if (arm_feature(env, ARM_FEATURE_V8) ||
-            !arm_v7m_is_handler_mode(env)) {
+        if (cur_el > 0 && (arm_feature(env, ARM_FEATURE_V8) ||
+                           !arm_v7m_is_handler_mode(env))) {
             write_v7m_control_spsel(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
         }
-        if (arm_feature(env, ARM_FEATURE_M_MAIN)) {
+        if (cur_el > 0 && arm_feature(env, ARM_FEATURE_M_MAIN)) {
             env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
             env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
         }
+        if (arm_feature(env, ARM_FEATURE_VFP)) {
+            /*
+             * SFPA is RAZ/WI from NS or if no FPU.
+             * FPCA is RO if NSACR.CP10 == 0, RES0 if the FPU is not present.
+             * Both are stored in the S bank.
+             */
+            if (env->v7m.secure) {
+                env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
+                env->v7m.control[M_REG_S] |= val & R_V7M_CONTROL_SFPA_MASK;
+            }
+            if (cur_el > 0 &&
+                (env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_SECURITY) ||
+                 extract32(env->v7m.nsacr, 10, 1))) {
+                env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_FPCA_MASK;
+                env->v7m.control[M_REG_S] |= val & R_V7M_CONTROL_FPCA_MASK;
+            }
+        }
         break;
     default:
     bad_reg:
-- 
2.20.1

