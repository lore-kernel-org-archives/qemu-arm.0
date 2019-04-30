Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4716453wrh;
        Tue, 30 Apr 2019 06:18:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTfIJ5MGoDeSrSEILNcqbczT9Mf41Zy+XjjXmpn70/BPdOx4X4szE7wOY1LD+LOqID/FYX
X-Received: by 2002:adf:c993:: with SMTP id f19mr4077025wrh.246.1556630308866;
        Tue, 30 Apr 2019 06:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556630308; cv=none;
        d=google.com; s=arc-20160816;
        b=Ez3B65O1fKjqwbZIt9XZ7d/xSgEYBQPBxBoiSjFZbASDEmM8o75M/gStlZRdaObXfq
         KXDjlaYNdHBHtyIaukaIj/FNRY9u3ZHxOLTt0CD/o8iLcOwUlSgLnkvsyiSwwHlYuMlm
         Sq1t04omRrt8WVCc1oWCwxo2Eh1pVQlv8C+cOAtrMczNNnVei6DrbLBICl+DzFGLfAeX
         f+3kIvK56ZydRVenC9ZuviZ8ft9w5+hFgKqaQgBL4gMRbr0L3Hvm9yq2Ze0LHiGUCXnT
         UzxZPSJmu27MPfKlJXGRydHN8bcwe0PcrP5ooYOnbvOmrT8zUsXAVkoaRS8VlnowUl66
         L81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=KjnNslhjeAVB43ev2plnZmB2mvGNvdHo3ozswBo1758=;
        b=YmQxPg6SQ/ycb7mUYpzJo6pl0xmAq0szIK7DFHJMfSdhyKpK04SUu8ycLwEPOx+Ga8
         /kbMpemP3aF5pcObGOn37xqJexIy5vhmQfspeZmCEuDWn6sq06DYOj0S0qEnMfG53If2
         E1REMBMfs7y5XGbmFV0s4wSwY4DegvvJ9UA7sR1QmeO2vXKIZlul/2cNQtaB495QfyhN
         Yy5A7UQ7TNWY/fQUd/oWAueTFG2XWbGDcrT5dgV3Ma/IMISlUhgruz4/i8e4lgDrv15P
         Djyrrdx4VTaIwaURFGxsx8pSGxF5x13zPKsyuLzmrMN6mLcENsToL4MwMLz+kaQXPraD
         xIdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HsV1RfBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si93281wrp.223.2019.04.30.06.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 06:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HsV1RfBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLSeR-0003xC-Q4
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 09:18:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSau-00012x-UT
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 09:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSat-0002E1-SK
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 09:14:48 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLSat-0002DT-MG
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 09:14:47 -0400
Received: by mail-wr1-x443.google.com with SMTP id f7so12462466wrs.2
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KjnNslhjeAVB43ev2plnZmB2mvGNvdHo3ozswBo1758=;
	b=HsV1RfBXMD1XBjZGomeprBuZWd2xYzlQWf1PoS+CplVCmcJVGdNJSYodcPJRrXcKgf
	pzinhIMtpePedJDmTHjGn1qOG4fjlqH3J80si0jFhzjZFwsxISkHEfuVjHIED4p9wLL+
	qOtg5Q0mvkVe0ji8YcKen1yDA73rJ8wGPIbilXpYbdMzuN1sM81cAIm57FKq0VlIHqmF
	sTGY1Rbr33CbktlWwjbnmrTZ+qtu5a4hvtf1QpQpWM76nQrvMnGJ2u7/pyV36Jvr6rsC
	ECubcTtARpa7NwZvN7rjAnqzO6dGcA8hfXe/Itd3gyrOQOKHdgbJzR/xnjYzMPDIZdOl
	QLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KjnNslhjeAVB43ev2plnZmB2mvGNvdHo3ozswBo1758=;
	b=Fht8bOUk6UbfDqopF6keOK1Lfl2tQOK2qIWInjl0icL8il9Zb5Cx6z4ALkHWcDNkX7
	HznsCL5lYCATDuQftZuFjcNt71RlLkUt8vdExfoaVH9J++ZVR22+1ZU7uuWAJQnA7mIW
	wI5COKGn3vSkqf8S615WOwxwzgFeXtwN73YUH1Mw+0wJ/Y6csJqh2CUgrrGH0ucpdvi7
	6Irt/8Cc5gwiHljOMK35uaudYMbq9QoO85kwhZ1tRCGuA/c/8VMG7kcrGMhVIwcM9MYG
	nmdue4H4lLhwOHjb5jTRZQNPoF4Alu3gfkiIyfp4gDS5tGuz/yQ085HLHbDnHp81emXe
	zebA==
X-Gm-Message-State: APjAAAV/HRneByt6dT3h4fsQ9oM9jFulIHgAmK9hyY7an06h8t9vFyp3
	KHkGbqlI50FWjHb2N9HCTJ6Y+NB5WEo=
X-Received: by 2002:a05:6000:11ce:: with SMTP id
	i14mr16693110wrx.37.1556630086557; 
	Tue, 30 Apr 2019 06:14:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	a12sm16557460wrh.46.2019.04.30.06.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 06:14:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 14:14:39 +0100
Message-Id: <20190430131439.25251-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430131439.25251-1-peter.maydell@linaro.org>
References: <20190430131439.25251-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 4/4] target/arm: Implement XPSR GE bits
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
X-TUID: w2DVCBu/p/vU

In the M-profile architecture, if the CPU implements the DSP extension
then the XPSR has GE bits, in the same way as the A-profile CPSR. When
we added DSP extension support we forgot to add support for reading
and writing the GE bits, which are stored in env->GE. We did put in
the code to add XPSR_GE to the mask of bits to update in the v7m_msr
helper, but forgot it in v7m_mrs. We also must not allow the XPSR we
pull off the stack on exception return to set the nonexistent GE bits.
Correct these errors:
 * read and write env->GE in xpsr_read() and xpsr_write()
 * only set GE bits on exception return if DSP present
 * read GE bits for MRS if DSP present

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  4 ++++
 target/arm/helper.c | 12 ++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 22bc6e00ab9..2ae1b36eaee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1285,6 +1285,7 @@ static inline uint32_t xpsr_read(CPUARMState *env)
         | (env->CF << 29) | ((env->VF & 0x80000000) >> 3) | (env->QF << 27)
         | (env->thumb << 24) | ((env->condexec_bits & 3) << 25)
         | ((env->condexec_bits & 0xfc) << 8)
+        | (env->GE << 16)
         | env->v7m.exception;
 }
 
@@ -1300,6 +1301,9 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
     if (mask & XPSR_Q) {
         env->QF = ((val & XPSR_Q) != 0);
     }
+    if (mask & XPSR_GE) {
+        env->GE = (val & XPSR_GE) >> 16;
+    }
     if (mask & XPSR_T) {
         env->thumb = ((val & XPSR_T) != 0);
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 81a92ab4911..59ee5ee7c4a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8704,7 +8704,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
     uint32_t excret;
-    uint32_t xpsr;
+    uint32_t xpsr, xpsr_mask;
     bool ufault = false;
     bool sfault = false;
     bool return_to_sp_process;
@@ -9156,8 +9156,13 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         }
         *frame_sp_p = frameptr;
     }
+
+    xpsr_mask = ~(XPSR_SPREALIGN | XPSR_SFPA);
+    if (!arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
+        xpsr_mask &= ~XPSR_GE;
+    }
     /* This xpsr_write() will invalidate frame_sp_p as it may switch stack */
-    xpsr_write(env, xpsr, ~(XPSR_SPREALIGN | XPSR_SFPA));
+    xpsr_write(env, xpsr, xpsr_mask);
 
     if (env->v7m.secure) {
         bool sfpa = xpsr & XPSR_SFPA;
@@ -12642,6 +12647,9 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         }
         if (!(reg & 4)) {
             mask |= XPSR_NZCV | XPSR_Q; /* APSR */
+            if (arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
+                mask |= XPSR_GE;
+            }
         }
         /* EPSR reads as zero */
         return xpsr_read(env) & mask;
-- 
2.20.1

