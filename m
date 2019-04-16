Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3908386wrx;
        Tue, 16 Apr 2019 06:10:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO7EZbkchHudLjsYJ2HllgLzfC6dfevobURWmWV2ISfWXcQTmkC5SF70CqihzvAGz54ZAG
X-Received: by 2002:a1c:6c04:: with SMTP id h4mr27094453wmc.135.1555420222563;
        Tue, 16 Apr 2019 06:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420222; cv=none;
        d=google.com; s=arc-20160816;
        b=slE4v3XQnoWBhYPS+MDKER/S2qDJgE9AJB0xPHvQ46tyJH3XSyQ4s5gbL5S80rl1on
         58iAX1NZLuBJP+G8DKJDN7gQBwCkGB+jp5Y0oCPLFBsDAGTv5zcupDqkALyUpeDvIwRw
         kgNX+0JIlFrDhkqfm+Ju65hmyOg++eii+6E5oJB7XYki9nlAIRHM7ayT/AfWA3fO7DtY
         Roil3qRuq2RVnr3fb/IeH0eY2b5btPsxQLcB7VweB1B9MBT06ixlEFiqZA0mkg4ieVh0
         j703D8nYa2xjp8b+nqtcywctb4fPVaVkyw8brbjxFnB/MHLb0FgTSjskuBVAM00I14hQ
         lHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=oKhQw5TgUN0CJPeTbE7gAN8kI/N1+VlPzRCCDtvAZtE=;
        b=lpYK+19dGHeP370GC2O0TUaXY2WLwpide2W3NKcECdEkfUfzY6Zj10Qg5lUuXuMpgw
         TwomXWleSruLBbkOWm5Fl3H72tdwIUZVNOc55hty8Ra/yTw1VbXOZC903c4y9KGHZOUy
         3BSEcdz/HkA322n4og5l7GXEjC9tiKhRJ8UjDqwJn/FrBSEF38cCjprMxRlu/ONE1N4l
         Mam/mYnbxbVhrk+bRQC4zuIaNZqImf/FW7U+99oVuDC3blT0mGz085JncikyU4Y6ItLH
         tU6C2bufbDIYl4/SKabeGQoq7swWD0MK6W9J0PkQQuMVi/GfAq2bAlCvoZHU98VUUmX1
         bEKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HreNCUuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si35788670wrw.87.2019.04.16.06.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HreNCUuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNqv-0006Nu-Jx
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:10:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfL-0004t4-Mw
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfJ-0001NN-VM
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfI-0001LT-G5
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id z24so25492277wmi.5
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oKhQw5TgUN0CJPeTbE7gAN8kI/N1+VlPzRCCDtvAZtE=;
	b=HreNCUuvD0e5wQi79dWBWrQu3YZa7sNIr2l3kmLrc2xcNsq2h4683HclK6gO+ngrci
	JJCuYA9A+T3gDvIW5mvk/0YPo05OjNJPFsN30neivj+YJUQlyAaeqyvJ6x5QHcs/JA+Z
	mbwKJHL3UQ+lS5P3LS61SMqJtpC6sM3DxeS9KkXybVqskZjkVJ4vxMYljFnzXNS5wfSc
	e2fHGU4zj346ylL09uE5ZbVKuucmEf4ZIid7mtvQ2NSAi5qo9DHtONczqaqoDE5zLaoI
	glpWQUuAo2XasdZsXGjn+jq/KXlEbUCzgkNYNgjK415krxxnEYIjEFOJhAQP5hQ12jtE
	WZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oKhQw5TgUN0CJPeTbE7gAN8kI/N1+VlPzRCCDtvAZtE=;
	b=FbW1wwatYVFZvEeLXgmguBASaff1/RrdvT/lmnH4m1hz9udNLQ8ne85JLyF/mzj/KG
	yO/nw/TAoRLChJxMvOnjdqviHhzx1IJA38tSbS/aizsXQ4mR8Xy9KsUTWLMNGiUc7eTG
	NYyZNI1z0R1v+RjaMuKWoHo/S38IntPcnHZLwfpyIUNNy3nNWeKaVj4p7LDOQN0Q+wOp
	pTeKRsXBVUgD/eQU5t21j9kF+rxLygL/6Jw1OwczDfoECkdftWBerE6LWk8VK653zgkl
	rw4RzRnlafSAT6oH3+UDZvRqkvPtghAmElOjQ2SafnfR+UVvAje9euIhZYsEcjkzXN4s
	0Sjw==
X-Gm-Message-State: APjAAAV5JODOUqqjTDQQ6x0Uelo19Zyx5/sNxx3tKF08DKD2YVb3Wnp5
	2NY5XMw+QjPO8F/INlxSqKrbDcwI84c=
X-Received: by 2002:a1c:f204:: with SMTP id s4mr26600232wmc.51.1555419498715; 
	Tue, 16 Apr 2019 05:58:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:32 +0100
Message-Id: <20190416125744.27770-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::332
Subject: [Qemu-arm] [PATCH 14/26] target/arm: Allow for floating point in
 callee stack integrity check
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
X-TUID: 7JjEqVYV7ZGr

The magic value pushed onto the callee stack as an integrity
check is different if floating point is present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fe8e78fe36d..2f6382a0b24 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7984,6 +7984,21 @@ load_fail:
     return false;
 }
 
+static uint32_t v7m_integrity_sig(CPUARMState *env, uint32_t lr)
+{
+    /*
+     * Return the integrity signature value for the callee-saves
+     * stack frame section. @lr is the exception return payload/LR value
+     * whose FType bit forms bit 0 of the signature if FP is present.
+     */
+    uint32_t sig = 0xfefa125a;
+
+    if (!arm_feature(env, ARM_FEATURE_VFP) || (lr & R_V7M_EXCRET_FTYPE_MASK)) {
+        sig |= 1;
+    }
+    return sig;
+}
+
 static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
                                   bool ignore_faults)
 {
@@ -7998,6 +8013,7 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     bool stacked_ok;
     uint32_t limit;
     bool want_psp;
+    uint32_t sig;
 
     if (dotailchain) {
         bool mode = lr & R_V7M_EXCRET_MODE_MASK;
@@ -8039,8 +8055,9 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     /* Write as much of the stack frame as we can. A write failure may
      * cause us to pend a derived exception.
      */
+    sig = v7m_integrity_sig(env, lr);
     stacked_ok =
-        v7m_stack_write(cpu, frameptr, 0xfefa125b, mmu_idx, ignore_faults) &&
+        v7m_stack_write(cpu, frameptr, sig, mmu_idx, ignore_faults) &&
         v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx,
                         ignore_faults) &&
         v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx,
@@ -8645,12 +8662,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         if (return_to_secure &&
             ((excret & R_V7M_EXCRET_ES_MASK) == 0 ||
              (excret & R_V7M_EXCRET_DCRS_MASK) == 0)) {
-            uint32_t expected_sig = 0xfefa125b;
             uint32_t actual_sig;
 
             pop_ok = v7m_stack_read(cpu, &actual_sig, frameptr, mmu_idx);
 
-            if (pop_ok && expected_sig != actual_sig) {
+            if (pop_ok && v7m_integrity_sig(env, excret) != actual_sig) {
                 /* Take a SecureFault on the current stack */
                 env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-- 
2.20.1

