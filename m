Received: by 10.223.172.38 with SMTP id v35csp7468665wrc;
        Tue, 12 Sep 2017 11:17:37 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAVWJRasIM/m3LhqxqnTCPwtAQoBp7pDjXbAhHynsUTr1GIQ2C9vEMouP94ylF9nXsROK0D
X-Received: by 10.55.110.3 with SMTP id j3mr20201409qkc.195.1505240257364;
        Tue, 12 Sep 2017 11:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240257; cv=none;
        d=google.com; s=arc-20160816;
        b=NLkEme8qr7x3voKIS557QHsnJK786K8WDn6FehyR1aPaVbL9nQ+7pOiGaIxriVR3Yn
         TrTBgT8i3EFydiIb0UmXlh/zo+doiZym8d4MEk3kJyOg/H9tFU9M57JO4pCUq65btCVn
         Ocfy8AmOZkex49p1ub8TA4qXDmjN+SwpV2buLfBfKhPfv210e39zMssfaju8jNaVQq4r
         d9kYFml1VpYPgWKWKM8RZYS3G7bppL9I7jBX12H9Kyj31KCCmILlOc4rHKOP6+a+b1xm
         I+dnYY07ORTaIJnAy7F93QvRxceTevfRMxcgJXLYOW0TvvN3Wt6D/qI1+89Zh98uJhqP
         CYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Hi4KEYkOeqiZNTWr9KA2PYqFwLBCrciDgI8JaNsGQn4=;
        b=LSLR+/dHtq+kMbMdewph7v48zXY01qPU19ZlZ29VDkUBbMmYwGEmanYdrjPGOFgE3v
         lYTWgtMtVdCwBqXXsjwIgLrYBzNxPEc0XgPjBKu9fLU/++PasBqpY7fcM7KE1+UH1YCU
         9nOYIZND9m07cP/oECxYRp6CsDz6yU9E9vQ4Nq+XKvb63sKYOQkOOApQxR/P4kjfxsnf
         K9OCpjBL7eZ+h2dnAVcG1hnvr5TNDR9WW0qrdQhncZ1fyor6CEuupv0CrQJFLCpu3/X/
         MRQfPJKTStCtzptkkVKWBXXAJNrtuxCx6Kq2dc2wqf69ABoxuFojzFsr3Mcxzb10n4wj
         6Z3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38si2598412qtc.151.2017.09.12.11.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpkd-0006lL-40
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:17:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph0-0003Pd-99
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgy-0006Q2-UI
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:50 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgy-0006PL-Mt; Tue, 12 Sep 2017 14:13:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgx-000180-Mu; Tue, 12 Sep 2017 19:13:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:59 +0100
Message-Id: <1505240046-11454-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 12/19] nvic: In escalation to HardFault,
 support HF not being priority -1
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
X-TUID: 9YCtsz8pLAtC

When escalating to HardFault, we must go into Lockup if we
can't take the synchronous HardFault because the current
execution priority is already at or below the priority of
HardFault. In v7M HF is always priority -1 so a simple < 0
comparison sufficed; in v8M the priority of HardFault can
vary depending on whether it is a Secure or NonSecure
HardFault, so we must check against the priority of the
HardFault exception vector we're about to use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 3361a28..c4670f7 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -487,18 +487,8 @@ void armv7m_nvic_set_pending(void *opaque, int irq, bool secure)
         }
 
         if (escalate) {
-            if (running < 0) {
-                /* We want to escalate to HardFault but we can't take a
-                 * synchronous HardFault at this point either. This is a
-                 * Lockup condition due to a guest bug. We don't model
-                 * Lockup, so report via cpu_abort() instead.
-                 */
-                cpu_abort(&s->cpu->parent_obj,
-                          "Lockup: can't escalate %d to HardFault "
-                          "(current priority %d)\n", irq, running);
-            }
 
-            /* We can do the escalation, so we take HardFault instead.
+            /* We need to escalate this exception to a synchronous HardFault.
              * If BFHFNMINS is set then we escalate to the banked HF for
              * the target security state of the original exception; otherwise
              * we take a Secure HardFault.
@@ -511,6 +501,17 @@ void armv7m_nvic_set_pending(void *opaque, int irq, bool secure)
             } else {
                 vec = &s->vectors[irq];
             }
+            if (running <= vec->prio) {
+                /* We want to escalate to HardFault but we can't take the
+                 * synchronous HardFault at this point either. This is a
+                 * Lockup condition due to a guest bug. We don't model
+                 * Lockup, so report via cpu_abort() instead.
+                 */
+                cpu_abort(&s->cpu->parent_obj,
+                          "Lockup: can't escalate %d to HardFault "
+                          "(current priority %d)\n", irq, running);
+            }
+
             /* HF may be banked but there is only one shared HFSR */
             s->cpu->env.v7m.hfsr |= R_V7M_HFSR_FORCED_MASK;
         }
-- 
2.7.4

