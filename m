Received: by 10.28.71.27 with SMTP id u27csp2346500wma;
        Mon, 5 Feb 2018 03:02:29 -0800 (PST)
X-Google-Smtp-Source: AH8x226awI62tKd5sLIHmPtLXE8YRVaC97RhECr0cflaSe07eGLDZe+Ml3ddFHH+Iqm0a1VJdgKO
X-Received: by 10.37.13.86 with SMTP id 83mr13259541ybn.362.1517828549630;
        Mon, 05 Feb 2018 03:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828549; cv=none;
        d=google.com; s=arc-20160816;
        b=D+h3mH1fr6peyO6iEWcCIRXEeLRIUw4nlXR/9FWwpnwfqm7spsWTQWr2MoxaN7fGkx
         jPUHS1KzasWRLd1+l0/yAHNg9Idn3JEnl3X5BOO7ZFEOQBxA75LmzSvADPfex4jVUQsa
         ET5zvJ/ch6+Qz4f3IJqoj5SWt0XsGfxFYnh0ndiIYYIbdBDh4WGRoGbxTnA7hvAlG9sX
         i9gSEuN+aq63RNpPXroY//CWqhE+ywMe0oojtQRynX0tW4oQWUWs4LSHzN3j0gC5/vW8
         JE0JkhOAN8u2KGMIutH4zAWE9kAyIq93i5L3k2fSTq6trJ2VLHt/RCPwDGv5J00uwC9b
         2o+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ec7mIdSwcJgfdIlW71xx0VmWQ297zJiYxFWj8SDvo8g=;
        b=L6wgkhiZnsc777KCaSR5MZtvMACxq8igPfcodIfJ69I0f9MPjTq36irrG3NF9yNnh1
         T2uY5kACGw5RU1kUWYpGoNM0H2qfVJDwmEnH2uI0M/V1TjSY+FhHAerA6u9xcP5NGSjW
         bD0xWCtXyghQiE21mzahh2TpKdBLP6zmcwx768smXhQqWoI8MeTO4I0mykzW4P67ibki
         LH6cWKk2kR0x4bvZ+rSXnscRr0Br3zV456h+0fkurT+0bRnTP5dfUUia8/dXyaRYBX3c
         +qMsFKhrStlGJT6LXmCqAft5opjc+hmdzfaz0NRT2jGdhrQefdkRLUidJ+u24J2YcLHK
         Tw2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si1377863ywm.337.2018.02.05.03.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 03:02:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieXd-0001Fj-4H
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 06:02:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieT0-0006AM-A4
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 05:57:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSz-0007IN-E5
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 05:57:42 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSt-00076t-Gc; Mon, 05 Feb 2018 05:57:35 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSj-0004FA-29; Mon, 05 Feb 2018 10:57:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:16 +0000
Message-Id: <20180205105720.14620-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 4/8] hw/intc/armv7m_nvic: Implement v8M CPPWR
 register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAaHITJO7nPa

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

