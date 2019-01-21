Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6400989wrt;
        Mon, 21 Jan 2019 11:20:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5F/IGaoo1lt2e2mOVVeqdeIx942I5l6Dj/NRm7FFpKUERp2zNPq+UftEBmw8EZ95uCnqIq
X-Received: by 2002:a1c:1801:: with SMTP id 1mr628897wmy.153.1548098404928;
        Mon, 21 Jan 2019 11:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098404; cv=none;
        d=google.com; s=arc-20160816;
        b=T9m0GSjOxvjL74u5T1zYU9+XlAQbIpUrcv37c92VA+VuQ7o4d9e9X9GgcL+hm0F0sx
         bJ8+QoAQpTHR6pfPnj+bJPDYcaAB1SU/L+HjPBQjhRSd3Ckx3svoZN+rqE15ddy57LTD
         kSpG6SORyzItpirl+BA1ZKXNpJ/BdbEMjlzuB9paYBxvw48HAMF3RgBncXLlooSJdwyS
         /1eR6+6o1kl+piunsP0x7LWoA/j9+/QKIEHJ+hwNzuu1tMWk82o3hV+ClmpQZOcowB+o
         boIgS+ey9ffpXz5Kw88qASQLV8kHuXRKsxzwNj2S/h+RPJg2Lnshwrpl++MlhqJwwXOI
         2eqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=e/n/E9zIC87pmNrtpyul6OlAohOOfM09CA6XexX2VVY=;
        b=yT1vtPjIwDLpJx7+lFIG/JeSAhhVGqbXT3SoLqSfIDaN4jelzJ6hyHy7IadjpcNn7R
         5F3v4CkHHRekfqHpowUrdXkH3D9xfh8Ok7fsV2rFUgV4B0LTTlCUkP9G3dCRVmcQhKA+
         bx4wQHlWVKiYhtMOeeZal/OU2btwG1vttEkxKUmuTLhhucYucC5Eh/4vQPHvZUXQop6i
         Cu1rP9FgCrvWw5sl84bQNQBmPQgqhpbHzCmIu/chZ37HzEaGRAqQEoSxmpFCBts9O5Ej
         p/3wYbnnMWzk/rqU9JkZHAE82zURcJqbCSzcnMoELzvpHE5Uzw8vAs7PxLe5uMQBj44h
         OtyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fJcrt2ee;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si25133142wmw.118.2019.01.21.11.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fJcrt2ee;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf76-0000nI-1q
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:20:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevS-0008OY-R7
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002sm-3Y
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:45 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefe-0002iK-Nz
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:42 -0500
Received: by mail-wm1-x343.google.com with SMTP id p6so11831828wmc.1
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e/n/E9zIC87pmNrtpyul6OlAohOOfM09CA6XexX2VVY=;
	b=fJcrt2ee0cMoAYCl8VUBXDczHAbuDqtq7DELrUDquPqh7qPmJ/FmOgv6miS2LibFPa
	etUHy1h3HjFArQw7XTQwd0BFmHyfj9p8JPN61KDaq1FdK3aQ/QvoFU1FMsmuvB8kf6xm
	ASaLu9/85WEhGFmlgaAJTIevTxY1ySu+LmWtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e/n/E9zIC87pmNrtpyul6OlAohOOfM09CA6XexX2VVY=;
	b=nyJOS1vlnRUQL5A9KLb16gZsqBsBfHuw18a8+y3eLeIDU/Kunpkj24IIgiWLnLl0bq
	qMn8maKzhy9+kbGjZ+w6p5OYk35vcSF6ILkYsjPucrROVaJAFsR7Fe9J3zDeqlcUc5D3
	YdXA9JPHQ8VHg0r5Ajl/saJ79yRIBZZbyzXUpHngCU95ksqd5ubZ981uDaAmkm/0VgJB
	81TlPQpZcGJcNu8mo+UZlD+A2VBN8XrldtpmFb6//pyPiJiji+UX+AkvRmMO8V8XRI3o
	CnTOk9fK9I3huaTowXEmjLZRRbdboOidzXfGXLrs+KvDcTjXw3JFwhvDF96sH1MDX2N7
	ukNw==
X-Gm-Message-State: AJcUukfC0EqtkcYwif1uHij5r4qfvZJsPhMAZZ5aAqdaGi8+0y4ghW5n
	bnfkZVysPZidpSAUFclZ7jon5g==
X-Received: by 2002:a1c:ca15:: with SMTP id a21mr532240wmg.132.1548096695764; 
	Mon, 21 Jan 2019 10:51:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:08 +0000
Message-Id: <20190121185118.18550-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 13/23] hw/arm/armsse: Put each CPU in its own
 cluster object
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
X-TUID: x5M/8/QXieB2

Create a cluster object to hold each CPU in the SSE. They are
logically distinct and may be configured differently (for instance
one may not have an FPU where the other does).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  2 ++
 hw/arm/armsse.c         | 31 ++++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 89f19a971f4..999c2e4f7e5 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -80,6 +80,7 @@
 #include "hw/misc/iotkit-sysinfo.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
+#include "hw/cpu/cluster.h"
 
 #define TYPE_ARMSSE "arm-sse"
 #define ARMSSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARMSSE)
@@ -110,6 +111,7 @@ typedef struct ARMSSE {
 
     /*< public >*/
     ARMv7MState armv7m[SSE_MAX_CPUS];
+    CPUClusterState cluster[SSE_MAX_CPUS];
     IoTKitSecCtl secctl;
     TZPPC apb_ppc0;
     TZPPC apb_ppc1;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2472dfef3a1..2eb4ea3bfe0 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -147,9 +147,22 @@ static void armsse_init(Object *obj)
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
 
     for (i = 0; i < info->num_cpus; i++) {
-        char *name = g_strdup_printf("armv7m%d", i);
-        sysbus_init_child_obj(obj, name, &s->armv7m[i], sizeof(s->armv7m),
-                              TYPE_ARMV7M);
+        /*
+         * We put each CPU in its own cluster as they are logically
+         * distinct and may be configured differently.
+         */
+        char *name;
+
+        name = g_strdup_printf("cluster%d", i);
+        object_initialize_child(obj, name, &s->cluster[i],
+                                sizeof(s->cluster[i]), TYPE_CPU_CLUSTER,
+                                &error_abort, NULL);
+        qdev_prop_set_uint32(DEVICE(&s->cluster[i]), "cluster-id", i);
+        g_free(name);
+
+        name = g_strdup_printf("armv7m%d", i);
+        sysbus_init_child_obj(OBJECT(&s->cluster[i]), name,
+                              &s->armv7m[i], sizeof(s->armv7m), TYPE_ARMV7M);
         qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type",
                              ARM_CPU_TYPE_NAME("cortex-m33"));
         g_free(name);
@@ -406,6 +419,18 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             error_propagate(errp, err);
             return;
         }
+        /*
+         * The cluster must be realized after the armv7m container, as
+         * the container's CPU object is only created on realize, and the
+         * CPU must exist and have been parented into the cluster before
+         * the cluster is realized.
+         */
+        object_property_set_bool(OBJECT(&s->cluster[i]),
+                                 true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
 
         /* Connect EXP_IRQ/EXP_CPUn_IRQ GPIOs to the NVIC's lines 32 and up */
         s->exp_irqs[i] = g_new(qemu_irq, s->exp_numirq);
-- 
2.20.1

