Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4276185lfk;
        Tue, 7 Dec 2021 01:29:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJkWmezbq5AhlAb9jOUNZjm3yxUUW8i9PzFiPkTbOKcbiYx2jjkCpcfogD3NKeUtTXwUUa
X-Received: by 2002:a67:db13:: with SMTP id z19mr43276716vsj.4.1638869398973;
        Tue, 07 Dec 2021 01:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638869398; cv=none;
        d=google.com; s=arc-20160816;
        b=t0Oe++MYtOJWqK2P/TVQxFjqcB1YmoDd1jJ2NJG6NLLHji7Uka0if8L53pO4YHfNvn
         hUtraOHS2bKPyv5nMcRI1T60raO8KrhE7kDNcKDo8FwiTIkpz/+y40kLHdkVOOXIDoH5
         I4uQcV/ZiIqJ7QL1BAHvxElEWnq6BAFSUqgYYeB8zFBu1InDQAUBKvj2Sw1uAh3TjLPY
         XUObp7W/h4TjbD6AfVHMO6ecI6T+JqBo1llacl56DF0CsjVEn8S2fsyZyQvR+RPLBjGS
         0CXIzi+Gp33xLbpIO+VbMxxAyLR/Tp0m/Gzy2hBSlVLLlnety6VCIbolJuWgKg5wRTtE
         lFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=q+wsgEKYHH0GZAcD6mbppeicxI3uNfV0UmrKJ4XSx78=;
        b=wfEhE74yJDLV0GQ2bZ9mzK16D3Sdzm7ElP0+cJT/OnAK2gb5PP9c3auOqhvcMrsDw5
         /fbLXpYJgeL9m2/ZvSjAnPBce+dJH9NF/8hMmRqxpmpRdBP/RjDZjwlvv57ZClQHcCA9
         brjiorkgxoq6wLrnLR43PxPeTJA5obXsAorDQpIj4x1ZwCoKCPlS2zhWZjP8Gg90Ohsk
         d1KUH+qnjEVoy9jtBzsCIKrSM/aQlAlOwWFiQ0akeXnE+swc6ClBnfopp02wDp9e1t4K
         ziHW8YTzPXPdX5NaFEnjgvq7+fblZn1a1yPI8JaWb11jWbDoRyHHQS5SWS7Nh+2Wr6Zo
         O78w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=sazD7xCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si13323390vkk.182.2021.12.07.01.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 01:29:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=sazD7xCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muWnO-0005Hq-6x
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 04:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muWmj-0005H1-MG; Tue, 07 Dec 2021 04:29:17 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muWmh-0008NJ-CD; Tue, 07 Dec 2021 04:29:17 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C769120775;
 Tue,  7 Dec 2021 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638869350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+wsgEKYHH0GZAcD6mbppeicxI3uNfV0UmrKJ4XSx78=;
 b=sazD7xCBpLFcRsyFWiBO6YtzC+1RjhIHeH1SQwrrYfVALWVgQFCxfNh3KP0NXXWKg5dKNN
 je1rkjhEMUcOUZsK5l4OdGDUA/lOIldBAJL8PUroUmt26GojtohbH+DKwSHqcN1G6jayTj
 wAEY3HhQK3lw/XaqsiEby1+PeVHkgks=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: 
Date: Tue,  7 Dec 2021 10:29:09 +0100
Message-Id: <20211207092909.2933-1-damien.hedde@greensocs.com>
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
X-TUID: NUZQ0LiJLqrf

Subject: [PATCH for 6.2?] gicv3: fix ICH_MISR's LRENP computation

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

