Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8069892wrt;
        Tue, 4 Dec 2018 05:30:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VjBzM/naFzIv9tRD1PjVgke1O3cJxFIHilq8Dzk8+ts8RvfBRXWe3V/8E0j01ohndl52d7
X-Received: by 2002:a0c:a1c6:: with SMTP id e64mr19713271qva.196.1543930229819;
        Tue, 04 Dec 2018 05:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930229; cv=none;
        d=google.com; s=arc-20160816;
        b=KzmilKoOjc6Ga0xBT6xGCistiE7zFqY9TurXx7+kJ0rkwPwEGex4FHrPAlazMM7lNc
         DpQRnltcd6b06IdzViY0McROBPxhCz5cPklnq6F/Rti3MW9dedGEtoy8bu1KgtbGs6Ip
         sfkTVfDGoDhjAQW3jBwKo1xxC0tzeSaDInDILOQIU07kypzHAdJ0VaWz5lwN1L4sXbLF
         3p+Qr5f+lZwg0sOuoEqa6drMdG98MozWYwAnVN38dzvQUuRvrFoqBfGRDzWKDvvRdqjm
         YAsd5j2SDQS7FFuU3q5dYL3R8XNcG1vOQWzdbcYH/gN4OUqk9Nnr06q8zcvbG6KPt8ny
         11hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5ODWp/MEZ7MIgMwbY8al9xKiOHBbFkpkw8heg21DcHc=;
        b=a84BF6d5kztmJ0fzIeG7wXsUVpeUL18ssAacnCjH2zTTx4F6s+D0bqS6AviDWOWdTg
         2f8BqqqAdJcqDyaqrnSGecSteJB9iRrEQs209P0ZwWnxxc8t9YyzG0yduRlx64L9KbpV
         5+/d53U5U6FRM5kx0cyb9Y1/SnP1vcEV8rP2H+4OSwO83jNptbC2aQtUzxQmiPdnUyp4
         AMp6HatEfHWTSwE1HbPPCstcBY3WM9ZRcOiKKWK8Tbqp9Q3aKdXXGpxaTly/FQtSht0D
         BA75waWuNijyH+SFO0Lw+Cyxu1t/T/x6HXZO+P3KEAYJuDvFKZ29Fe/l3+uT2db/aA/F
         oYKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g14si7521876qvj.193.2018.12.04.05.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:30:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAmS-0007q0-PI
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:30:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm9-0007jK-1E
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm3-0000yY-1P
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:08 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:53236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gUAm2-0000pO-Q1; Tue, 04 Dec 2018 08:30:02 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gUAlv-0008Cn-QU; Tue, 04 Dec 2018 13:29:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 13:29:52 +0000
Message-Id: <20181204132952.2601-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204132952.2601-1-peter.maydell@linaro.org>
References: <20181204132952.2601-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/5] target/arm: Create timers in realize,
 not init
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
X-TUID: L4fRhWhFILAr

The timer_new() function allocates memory; this means that
if we call it in the CPU's init method we would need
to provide an instance_finalize method to free it. Defer
the timer creation to the realize function instead.

This fixes a memory leak spotted by clang LeakSanitizer
when a CPU object is created for introspection.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b84a6c0e678..0e7138c9bfb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -679,14 +679,6 @@ static void arm_cpu_initfn(Object *obj)
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
 
-    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                                arm_gt_ptimer_cb, cpu);
-    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                                arm_gt_vtimer_cb, cpu);
-    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                                arm_gt_htimer_cb, cpu);
-    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                                arm_gt_stimer_cb, cpu);
     qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
                        ARRAY_SIZE(cpu->gt_timer_outputs));
 
@@ -882,6 +874,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             return;
         }
     }
+
+    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
+                                           arm_gt_ptimer_cb, cpu);
+    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
+                                           arm_gt_vtimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
+                                          arm_gt_htimer_cb, cpu);
+    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
+                                          arm_gt_stimer_cb, cpu);
 #endif
 
     cpu_exec_realizefn(cs, &local_err);
-- 
2.19.2

