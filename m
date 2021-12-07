Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4289589lfk;
        Tue, 7 Dec 2021 01:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNIb1H+csfvKPD1FAHPShI+P7g2ilrAiMLSs4ez7L0XgYvI2vzjoPjyqM17r3bPeX/YYN0
X-Received: by 2002:a05:6214:d8e:: with SMTP id e14mr43691547qve.37.1638870369113;
        Tue, 07 Dec 2021 01:46:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638870369; cv=none;
        d=google.com; s=arc-20160816;
        b=DsnzD9H/FYOmgqNeFbEtCfoHGM5JJg8h6ZtyqyyIB2FquvqWF0RBFNIFNhP0yMfTX2
         5EjX+G+n/iuGopRVaGSeLJHqgUnHTq1T5yPH9A0keu/EspOHNIqiTA6vP1YJc2SuTpBi
         grGajGmVe2OAyrkOQRfIGK8cyzLCSBibLom8Y14AcSrH0hgMqxN4HDQVWFmxaZZBw5ht
         OkGW9YNkTLCAFViDyY8BQ6ZM9t+cLnr/GTmVGRWZC86C4OhAPQ7Y9B40yODJZa1Vx736
         qZv07rIngA/nS2ECJ9El+GL4wNlzm3xKdkZtnAIMnDED1aNqgDT8r0B8YQ/xJj1vx6Qg
         vzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9voYB0aqtI0B+yUvk4Gsn7Y7XtnXn4zagg3/8GYKj6I=;
        b=UvR8WDe1+n4WaWkCGCjaGQOo1vUU0v2QdmB2LeVDMI0qSehUioZpCaemAhpQyT7Oc6
         BthQtHlOKFdtNUGtayJHHIeo1flX4yhkWtA2z8z5uX4xx8gJ7OcNBFlO7gmhxN2Omzqt
         QNvYtO9hQ2G2Q+46shG+xqVHfYg1gcp5CiFzuU2EHWmw0lsrSrAfzD3Np6fNb6QD/885
         ksyQKFgBWrF2s06id73JXjTDazlVKM/TsPmlk2hkcPpA7J8UvzmQbCFKYtdtGSOa6AaY
         MlVCdYU1EqFt/fUdnIQ4siTj8/8X1RYpZiZr58G6dK/Jn5IMI5XAM8eAGPeIpLQSAMJ8
         Y9ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=x+uH6pYN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si19058805qtk.686.2021.12.07.01.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 01:46:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=x+uH6pYN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muX32-0005mm-F5
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 04:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muX1Y-0004Q8-Jc; Tue, 07 Dec 2021 04:44:36 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muX1V-0003mS-1C; Tue, 07 Dec 2021 04:44:36 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 432C020778;
 Tue,  7 Dec 2021 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638870270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9voYB0aqtI0B+yUvk4Gsn7Y7XtnXn4zagg3/8GYKj6I=;
 b=x+uH6pYN/jdxnEeaGHDgQ9c9TsgWovLsNgBQkLWArqY5Kgm/2bU3ee0zPavZ45VToomfTJ
 3/XipwYpO4+gPYcTCBH1l6QL5f9Rze2Q+T4mnwa9jg6/LGeWMvxTTwz29UeMH9uVswp4HL
 D+UC3VTkC2o0coao58ekoImiFieqAMc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Date: Tue,  7 Dec 2021 10:44:27 +0100
Message-Id: <20211207094427.3473-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A2xUPnXOafci

According to the "Arm Generic Interrupt Controller Architecture
Specification GIC architecture version 3 and 4" (version G: page 345
for aarch64 or 509 for aarch32):
LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
ICH_HCR.EOIcount is non-zero.

When only LRENPIE was set (and EOI count was zero), the LRENP bit was
wrongly set and MISR value was wrong.

As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
the maintenance interrupt was constantly fired. It happens since patch
9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
which fixed another bug about maintenance interrupt (most significant
bits of misr, including this one, were ignored in the interrupt trigger).

Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
The gic doc is available here:
https://developer.arm.com/documentation/ihi0069/g

v2: identical resend because subject screw-up (sorry)

Thanks,
Damien
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7fba931450..85fc369e55 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -351,7 +351,8 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
     /* Scan list registers and fill in the U, NP and EOI bits */
     eoi_maintenance_interrupt_state(cs, &value);
 
-    if (cs->ich_hcr_el2 & (ICH_HCR_EL2_LRENPIE | ICH_HCR_EL2_EOICOUNT_MASK)) {
+    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_LRENPIE) &&
+        (cs->ich_hcr_el2 & ICH_HCR_EL2_EOICOUNT_MASK)) {
         value |= ICH_MISR_EL2_LRENP;
     }
 
-- 
2.34.0

