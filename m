Received: by 10.223.172.38 with SMTP id v35csp7464090wrc;
        Tue, 12 Sep 2017 11:14:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBD7SARpACqhj5/wNjbqHPchXW8KWSMNCxr9t+TP6ti3UtRLsc27g3gvSI6adh1AwxZ/Dez
X-Received: by 10.55.74.133 with SMTP id x127mr19911979qka.239.1505240054295;
        Tue, 12 Sep 2017 11:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240054; cv=none;
        d=google.com; s=arc-20160816;
        b=YlCVzGHXzMm/90rcAce6ZTZCer+6OClSdSMQ5rcv5tpW7l6Ls88I2Bxzx6xkmQjF3N
         Pblky1nWdlinIOlBpTsKg8rFV644AYGOc+UrWv7gzuwBxICbD1QYesym6I3SiqUjNyvw
         vQEkEgZSoCYaxsr84Tj5WIj7vwzzqQ/vfGWE1pt89cNq6/8MNAx2exgaSXoKf8Zl2hr7
         2ZpTEhGNuQeXX4UWl2tDCXRkGrIqh18EN76+34quXStD3Zh6pbGC9N3vRkuDe2rmVxv3
         i20kw6XfZUZGztYYA2gxOBftqoEDKLPGCILZRu+wTYvFctUK0gBPW5R1iLmxKzhwSXKh
         OO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SJLISZy0Y2yXJJx7XEJ/sXNFvSm2YfyZNNF2xFwHRMc=;
        b=VAtCwgnT1FC6WEDGuDKLmWCbUCGYkc36jjaxEUMz8BHpY8UUMnblrJ0gScKt2ENOpB
         K7Ll9Gps45v1mb0e9h/gP3wMvUXMmYo9uVrR+KFXQS5YS5nOmOP0gvUUNfHIpGNxEVfQ
         2dLvE+7bBVqjQ9d0WCVRgJG8pQ6YVEsppjTil2BrJfXZRb7M0AmgUzwHYdSqQzDenRYb
         Gs+deeWO2VDX35R5uZTI2G8gCiuasTFI2buTbJ9iS0M3tfx6A5f//nqmk1SQgjaALM0H
         R1lxkZqsjr+UobQUd9O/2Ir3OfIA/A0kMx+0sRaCBAGZBZP+KsvsBodZkjbwRqjMRwfi
         ijag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o42si13044184qta.496.2017.09.12.11.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:14:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drphM-0003eQ-44
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:14:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgu-0003K6-RF
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgt-0006LP-Cj
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgt-0006Js-5P; Tue, 12 Sep 2017 14:13:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgs-000141-6X; Tue, 12 Sep 2017 19:13:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:51 +0100
Message-Id: <1505240046-11454-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/19] nvic: Add cached vectpending_prio state
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
X-TUID: uUfh/ZqP6Svw

Instead of looking up the pending priority
in nvic_pending_prio(), cache it in a new state struct
field. The calculation of the pending priority given
the interrupt number is more complicated in v8M with
the security extension, so the caching will be worthwhile.

This changes nvic_pending_prio() from returning a full
(group + subpriority) priority value to returning a group
priority. This doesn't require changes to its callsites
because we use it only in comparisons of the form
  execution_prio > nvic_pending_prio()
and execution priority is always a group priority, so
a test (exec prio > full prio) is true if and only if
(execprio > group_prio).

(Architecturally the expected comparison is with the
group priority for this sort of "would we preempt" test;
we were only doing a test with a full priority as an
optimisation to avoid the mask, which is possible
precisely because the two comparisons always give the
same answer.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  2 ++
 hw/intc/armv7m_nvic.c         | 23 +++++++++++++----------
 hw/intc/trace-events          |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 87c78b3..329774e 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -62,6 +62,7 @@ typedef struct NVICState {
      *  - vectpending
      *  - vectpending_is_secure
      *  - exception_prio
+     *  - vectpending_prio
      */
     unsigned int vectpending; /* highest prio pending enabled exception */
     /* true if vectpending is a banked secure exception, ie it is in
@@ -69,6 +70,7 @@ typedef struct NVICState {
      */
     bool vectpending_is_s_banked;
     int exception_prio; /* group prio of the highest prio active exception */
+    int vectpending_prio; /* group prio of the exeception in vectpending */
 
     MemoryRegion sysregmem;
     MemoryRegion sysreg_ns_mem;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 417a456..8388d64 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -61,10 +61,10 @@ static const uint8_t nvic_id[] = {
 
 static int nvic_pending_prio(NVICState *s)
 {
-    /* return the priority of the current pending interrupt,
+    /* return the group priority of the current pending interrupt,
      * or NVIC_NOEXC_PRIO if no interrupt is pending
      */
-    return s->vectpending ? s->vectors[s->vectpending].prio : NVIC_NOEXC_PRIO;
+    return s->vectpending_prio;
 }
 
 /* Return the value of the ISCR RETTOBASE bit:
@@ -156,10 +156,17 @@ static void nvic_recompute_state(NVICState *s)
         active_prio &= nvic_gprio_mask(s);
     }
 
+    if (pend_prio > 0) {
+        pend_prio &= nvic_gprio_mask(s);
+    }
+
     s->vectpending = pend_irq;
+    s->vectpending_prio = pend_prio;
     s->exception_prio = active_prio;
 
-    trace_nvic_recompute_state(s->vectpending, s->exception_prio);
+    trace_nvic_recompute_state(s->vectpending,
+                               s->vectpending_prio,
+                               s->exception_prio);
 }
 
 /* Return the current execution priority of the CPU
@@ -323,7 +330,6 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
     CPUARMState *env = &s->cpu->env;
     const int pending = s->vectpending;
     const int running = nvic_exec_prio(s);
-    int pendgroupprio;
     VecInfo *vec;
 
     assert(pending > ARMV7M_EXCP_RESET && pending < s->num_irq);
@@ -333,13 +339,9 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
     assert(vec->enabled);
     assert(vec->pending);
 
-    pendgroupprio = vec->prio;
-    if (pendgroupprio > 0) {
-        pendgroupprio &= nvic_gprio_mask(s);
-    }
-    assert(pendgroupprio < running);
+    assert(s->vectpending_prio < running);
 
-    trace_nvic_acknowledge_irq(pending, vec->prio);
+    trace_nvic_acknowledge_irq(pending, s->vectpending_prio);
 
     vec->active = 1;
     vec->pending = 0;
@@ -1251,6 +1253,7 @@ static void armv7m_nvic_reset(DeviceState *dev)
     s->exception_prio = NVIC_NOEXC_PRIO;
     s->vectpending = 0;
     s->vectpending_is_s_banked = false;
+    s->vectpending_prio = NVIC_NOEXC_PRIO;
 }
 
 static void nvic_systick_trigger(void *opaque, int n, int level)
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 4762329..5635a5f 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -167,7 +167,7 @@ gicv3_redist_set_irq(uint32_t cpu, int irq, int level) "GICv3 redistributor 0x%x
 gicv3_redist_send_sgi(uint32_t cpu, int irq) "GICv3 redistributor 0x%x pending SGI %d"
 
 # hw/intc/armv7m_nvic.c
-nvic_recompute_state(int vectpending, int exception_prio) "NVIC state recomputed: vectpending %d exception_prio %d"
+nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
 nvic_set_prio(int irq, uint8_t prio) "NVIC set irq %d priority %d"
 nvic_irq_update(int vectpending, int pendprio, int exception_prio, int level) "NVIC vectpending %d pending prio %d exception_prio %d: setting irq line to %d"
 nvic_escalate_prio(int irq, int irqprio, int runprio) "NVIC escalating irq %d to HardFault: insufficient priority %d >= %d"
-- 
2.7.4

