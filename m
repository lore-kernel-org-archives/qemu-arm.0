Received: by 10.28.71.27 with SMTP id u27csp1158740wma;
        Fri, 9 Feb 2018 08:58:41 -0800 (PST)
X-Google-Smtp-Source: AH8x224/0E7dTk3HLsjpEzz9nnb1ALeRCvfI1VKW36+E11Fs3Q5z+A+ndfTbVVkqrKu2Jc+ELIb6
X-Received: by 10.37.73.6 with SMTP id w6mr2275599yba.35.1518195521650;
        Fri, 09 Feb 2018 08:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195521; cv=none;
        d=google.com; s=arc-20160816;
        b=K7cdZeLDUpRextPLkono1/iKQ6JIvCROkfF0m5sO5oFMixvM3saQ6zi35n7UsDcaHO
         e87K8iu3DLUvovmOwop/IBpI791/jF6TuH4VxD4XoJKRPxxTTnWn36118B9n1jFEQ0LH
         glAZ/i2DjCKM9WSTKxpORu7i5zbDMm8Pi+lenUYAgYiiq2kvnCTVwKQ/OOlYn8x+NBoX
         Rq63zGrH5qU6EH3oxw2uwEEucTOsw42t45X6FlXQIOHmRm9XaVyBTL1KcTq56Obrt120
         cM4jUt3f+fTRXD1ZjBDBj/Fm5qaTjN8CqQmqmlINromQyO6+VIsKjKbRcF1Za6YH5cBG
         FPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ec7mIdSwcJgfdIlW71xx0VmWQ297zJiYxFWj8SDvo8g=;
        b=aDXxq0LluET0F91Lh0mNk8mvRLixH/GjnmV/+vboRhDHf7yVlKLnbTD/+g2dPPY7G5
         4z06M9bPhGkq88iMvow73SmmlXsAsreovl7ywKNs0jzGj+/OznO+gTWBTv5gij7cFvlw
         SwP+f2xjq0BpgBIExnEn/UBSogL6Kyw6BpBQZyBKgqeq78Bj0cijhT+l29aMekpJKyy2
         dGiMSmKwMkKzzde8JmNhsDzhORkzPPHR5PQl50J8ikC3d+qUOFT7gT8UmIhgMGn+kYLw
         /KG9XS0mMwHlLw0S/zBeUwg1pvCd0yNK82pYIV+q74UTXR7v1MdkrFr6mVCyOlJpu07X
         kv9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11si477618ywj.11.2018.02.09.08.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:58:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC0X-00040j-2V
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:58:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0A-0003uR-4f
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC09-0007ja-2e
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:18 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC08-0007fy-Qj; Fri, 09 Feb 2018 11:58:16 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC06-000303-RW; Fri, 09 Feb 2018 16:58:14 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:03 +0000
Message-Id: <20180209165810.6668-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 04/11] hw/intc/armv7m_nvic: Implement v8M
 CPPWR register
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cd5QDqsyPQ2E

The Coprocessor Power Control Register (CPPWR) is new in v8M.
It allows software to control whether coprocessors are allowed
to power down and lose their state. QEMU doesn't have any
notion of power control, so we choose the IMPDEF option of
making the whole register RAZ/WI (indicating that no coprocessors
can ever power down and lose state).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 74b25ce92c..eb49fd77c7 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -776,6 +776,14 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     switch (offset) {
     case 4: /* Interrupt Control Type.  */
         return ((s->num_irq - NVIC_FIRST_IRQ) / 32) - 1;
+    case 0xc: /* CPPWR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            goto bad_offset;
+        }
+        /* We make the IMPDEF choice that nothing can ever go into a
+         * non-retentive power state, which allows us to RAZ/WI this.
+         */
+        return 0;
     case 0x380 ... 0x3bf: /* NVIC_ITNS<n> */
     {
         int startvec = 8 * (offset - 0x380) + NVIC_FIRST_IRQ;
@@ -1175,6 +1183,12 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
     ARMCPU *cpu = s->cpu;
 
     switch (offset) {
+    case 0xc: /* CPPWR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            goto bad_offset;
+        }
+        /* Make the IMPDEF choice to RAZ/WI this. */
+        break;
     case 0x380 ... 0x3bf: /* NVIC_ITNS<n> */
     {
         int startvec = 8 * (offset - 0x380) + NVIC_FIRST_IRQ;
-- 
2.16.1

