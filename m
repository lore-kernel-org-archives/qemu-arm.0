Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2954770wru;
        Fri, 5 Jul 2019 02:48:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMSzSdYEPpt7nVFlupy1/6sekRRv0UfifOjsyk1HC0WjogrF6f3zNrgYbGAEOHy8RveOKS
X-Received: by 2002:a05:6402:14d4:: with SMTP id f20mr3363975edx.125.1562320139949;
        Fri, 05 Jul 2019 02:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562320139; cv=none;
        d=google.com; s=arc-20160816;
        b=0VxC5UpIv4s6WrCytj28m0+rPj4c+1GpVV1Alqeoz90rGBnqojeYCCvD640x8u1cxE
         4dfQ4o9k3UQaOka2yISLuqT1dY02de42DnoUQV4ecpSQpzBbJE7hGnu5zNRSU99uhyYc
         odaNZcPIFlDxUVCe121mLrID95NKgZSrfgIIqFA9JfJtcmRbFH/ZmO5tWgZTDcyU/QEJ
         fh6F2o+KyIFa298a9jbn/9IMpRL9KQ8cWnMlACiciTcncQSd1UpfHW7Q0cyzQ75uclHz
         oLYa6+ReFpKGtroCEbTSR86ZL7Up1yyPf8vOPrVECwlk/Jv/cxXEr/lLvfiAKFKkpfEF
         /5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=DJgQt7YL6iWlivZMktmp+6RLn8cya2C11mFjRx5RqMo=;
        b=bjQcMlLLP9Bi69oWjM5THOERZ9wkEPHhcGtlUw+AGrFWxQYR53uxI1D4DjFscVnSo6
         +LtAv+dQlEHcDCni424asOYTqKmmpMfVEMIEsGWiadVC3NXQnNXbOSK/4Vd3DlFVy3Z0
         fvsNMbxf0TeB798rKHj/3Y9qhjiL+hNATBL5a9GneL1B/g7+Ibtt3hmzizCRoe1Y6nLC
         Hvj8YNH3OQNKnt8VB4T7RZh9Dz2Ebf5Y3+CRovHZWr9D+ZehfmINXkCFMi4uV9nf5Wz4
         9vLzqzNcwiaBPJz2jTIh5WjboY9Ds8yG41R+/9A1u+yiesOjJQC8euAgiWOyFndvQQod
         CVjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cnl+Xprr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si6594176edb.259.2019.07.05.02.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 02:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cnl+Xprr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjKpv-0008UY-1m
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 05:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45227)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hjKpS-0008Tq-KD
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 05:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hjKpQ-0007fo-Kh
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 05:48:30 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hjKpQ-0007df-BS
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 05:48:28 -0400
Received: by mail-wm1-x343.google.com with SMTP id g67so2483079wme.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2019 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJgQt7YL6iWlivZMktmp+6RLn8cya2C11mFjRx5RqMo=;
 b=cnl+XprrN7uiZs+5WlwwepCMKFBSOxpjXOndEN3uA2itR5tJsJvqTvccm1+mvJeqh9
 kidp/NsCD9ebJ+jjH35wrDh5r+7LlZ8XPaDH0psZMwECud0zYnq1u265XuKGVDu+JL+D
 MtsOBeZUIplC1ncSHn+40YBq8fxeZVBaXAxeQRepo10i6oJIP3MpJ2CbbF21pTxCfNGq
 Zsz1Ieidq6+V+u+UYFsPh2eTIntvt8826grN2VEd4BSEo+qHO8QELdkoucT0UOKu7t9/
 m4qejkexxvBuoRt7XjF3TXvOj4k894xQaMguJ2MaRTOB/Kp+UbTu82vVNkSm/mewxZBk
 8MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJgQt7YL6iWlivZMktmp+6RLn8cya2C11mFjRx5RqMo=;
 b=kLdFjLShDtvZZNzZ6kvggQCEE+4fhqGBgPv4tBQhMGQqw98W2buXxtLo6TFqICrGkz
 TamlbNWc0FZw1dj6KutdOHbmnYiOqIgWE1o80q03svKHFojnpxMShbIv10JkSRoB/rPY
 962IWC9y9uB/YuhvRgG/ZR0+c1mQq6bQKfjzlPe8IZbjrFFYAD4inn3Nx7E7qOOSG31+
 7Z+UpjMqe7bfDNhG/sC3eKLOJaz+STdLTSLiMlHjxtyMTzWHiFCF9PJHNNCgOFcZJId1
 TFGI1mhoYWytI+1g5T5d5jWdjri8DG/325QUq0UF6kmUaPVXCLvnc4+f5W8QMvDwfwsU
 pH0A==
X-Gm-Message-State: APjAAAWeNxV6bOm7z665nLpuQWZoV8VQI9mHS/poaia6KsMOT7ncLTzM
 HX432snvk/BNK2C4tt6rxXGc1vqxtTF63Q==
X-Received: by 2002:a05:600c:114f:: with SMTP id
 z15mr2675364wmz.131.1562320106509; 
 Fri, 05 Jul 2019 02:48:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v204sm9430455wma.20.2019.07.05.02.48.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 02:48:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 10:48:23 +0100
Message-Id: <20190705094823.28905-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v2 for-4.1] target/arm: NS BusFault on vector
 table fetch escalates to NS HardFault
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
X-TUID: /c3A7NxyYsTY

In the M-profile architecture, when we do a vector table fetch and it
fails, we need to report a HardFault.  Whether this is a Secure HF or
a NonSecure HF depends on several things.  If AIRCR.BFHFNMINS is 0
then HF is always Secure, because there is no NonSecure HardFault.
Otherwise, the answer depends on whether the 'underlying exception'
(MemManage, BusFault, SecureFault) targets Secure or NonSecure.  (In
the pseudocode, this is handled in the Vector() function: the final
exc.isSecure is calculated by looking at the exc.isSecure from the
exception returned from the memory access, not the isSecure input
argument.)

We weren't doing this correctly, because we were looking at
the target security domain of the exception we were trying to
load the vector table entry for. This produces errors of two kinds:
 * a load from the NS vector table which hits the "NS access
   to S memory" SecureFault should end up as a Secure HardFault,
   but we were raising an NS HardFault
 * a load from the S vector table which causes a BusFault
   should raise an NS HardFault if BFHFNMINS == 1 (because
   in that case all BusFaults are NonSecure), but we were raising
   a Secure HardFault

Correct the logic.

We also fix a comment error where we claimed that we might
be escalating MemManage to HardFault, and forgot about SecureFault.
(Vector loads can never hit MPU access faults, because they're
always aligned and always use the default address map.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is the one remaining patch from my earlier 'minor M-profile
bugfixes' series; the rest are in master now.

Changes v1->v2:
 * rebased on master (function has moved to m_helper.c)
 * fixed logic bug pointed out by rth
---
 target/arm/m_helper.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 1867435db7d..84609f446e6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -624,7 +624,11 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
         if (sattrs.ns) {
             attrs.secure = false;
         } else if (!targets_secure) {
-            /* NS access to S memory */
+            /*
+             * NS access to S memory: the underlying exception which we escalate
+             * to HardFault is SecureFault, which always targets Secure.
+             */
+            exc_secure = true;
             goto load_fail;
         }
     }
@@ -632,6 +636,11 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     vector_entry = address_space_ldl(arm_addressspace(cs, attrs), addr,
                                      attrs, &result);
     if (result != MEMTX_OK) {
+        /*
+         * Underlying exception is BusFault: its target security state
+         * depends on BFHFNMINS.
+         */
+        exc_secure = !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
         goto load_fail;
     }
     *pvec = vector_entry;
@@ -641,13 +650,17 @@ load_fail:
     /*
      * All vector table fetch fails are reported as HardFault, with
      * HFSR.VECTTBL and .FORCED set. (FORCED is set because
-     * technically the underlying exception is a MemManage or BusFault
+     * technically the underlying exception is a SecureFault or BusFault
      * that is escalated to HardFault.) This is a terminal exception,
      * so we will either take the HardFault immediately or else enter
      * lockup (the latter case is handled in armv7m_nvic_set_pending_derived()).
+     * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
+     * secure); otherwise it targets the same security state as the
+     * underlying exception.
      */
-    exc_secure = targets_secure ||
-        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
+    if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+        exc_secure = true;
+    }
     env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
     armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_secure);
     return false;
-- 
2.20.1

