Received: by 10.223.172.38 with SMTP id v35csp5559696wrc;
        Mon, 11 Sep 2017 06:52:02 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDy2d3PHRwvQB4Hbd45gU5sIc2JaAHbPidF39atZawSI6PHayVSpjJcVVoSTD4FVJp2WYCl
X-Received: by 10.237.42.35 with SMTP id c32mr16972038qtd.171.1505137922498;
        Mon, 11 Sep 2017 06:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505137922; cv=none;
        d=google.com; s=arc-20160816;
        b=AhBcr+VR6uSvOnEiAIPCFhWd4rW4Gflr8MXEBCauU/KpfU07qUrtba1/iSCpNv0d6K
         HSiN8tCAf492o/gqUKZzaf6yWMMT30rfRT4TYbV18IfvPZMLJeIxwcIjrAwXhhl3HElV
         2zsah7FT8f+msQYR1K3/7yr9ZeTz3hv9Y3HJQVBO78S2C6wFbfM82iI+8W/qrZUmHrp8
         5XCFDMjjeqQLuuG8QlM04zF8iotxQ/4zwPjo5BoOOWiVdDXYjqLMk4K1XJbPkFvaNpJP
         eC81zpmQlo+PJYK46fzY7Y72/dWdIqyGgCJnFe/3UUwfBsfOgbtliKNFkW3clAVuN6jy
         e0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TEbPFvKwynEH4nFWQ+8A95zks8NameeaaLUNU2P4XeA=;
        b=idfHdIx0P8IGxOPlmPD3669JkuzfAB4b0J22V9n2ENFA2Xxn9getkiDoTW2swD+a/g
         t1E1KQO4Xvh+qIIh3A+LdHryrRj3ORw1YPxahQAnGvHi2iHHtyqHAnB/83GqUciHAhnw
         Jyx4RwdYijTXxT67yu9ToJRdqmFH0LZKan4wzGGfFDHv4Xu24ZG8KhpRxDoUQifIFMmH
         Gxo1vGFqeefcDN2x7Y9lFJnFK9a3T0TRJ+Qgm0b9ad/L3OAb6jYpp6MEX/OyOcm8HbrL
         FLC3kmxtkkOq7UUFR/qhB9nY+9bIi3aXrmM4yCXYOLSqw3WWM8SYH5zd4aREhOI/H3xx
         74jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si2970512qkd.252.2017.09.11.06.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drP84-0001cv-CC
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:52:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP81-0001cb-0g
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP80-000293-9a
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:51:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP80-00023m-2W; Mon, 11 Sep 2017 09:51:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7r-0007mR-ID; Mon, 11 Sep 2017 14:51:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:07 +0100
Message-Id: <1505137930-13255-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/7] nvic: Don't apply group priority mask to
 negative priorities
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
X-TUID: cMdZWR2RXfjo

In several places we were unconditionally applying the
nvic_gprio_mask() to a priority value. This is incorrect
if the priority is one of the fixed negative priority
values (for NMI and HardFault), so don't do it.

This bug would have caused both NMI and HardFault to be
considered as the same priority and so NMI wouldn't
correctly preempt HardFault.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1fecfd6..d3e2056 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -152,8 +152,12 @@ static void nvic_recompute_state(NVICState *s)
         }
     }
 
+    if (active_prio > 0) {
+        active_prio &= nvic_gprio_mask(s);
+    }
+
     s->vectpending = pend_irq;
-    s->exception_prio = active_prio & nvic_gprio_mask(s);
+    s->exception_prio = active_prio;
 
     trace_nvic_recompute_state(s->vectpending, s->exception_prio);
 }
@@ -329,7 +333,10 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
     assert(vec->enabled);
     assert(vec->pending);
 
-    pendgroupprio = vec->prio & nvic_gprio_mask(s);
+    pendgroupprio = vec->prio;
+    if (pendgroupprio > 0) {
+        pendgroupprio &= nvic_gprio_mask(s);
+    }
     assert(pendgroupprio < running);
 
     trace_nvic_acknowledge_irq(pending, vec->prio);
-- 
2.7.4

