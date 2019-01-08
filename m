Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4779120wrt;
        Tue, 8 Jan 2019 08:34:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6qoSg6dR0Gv+MfrygjkWaVDOz7/wt1lRlxo4u688Lbbt2/apUZH/etBPKyx4Q0j3foN6uK
X-Received: by 2002:a5d:488f:: with SMTP id g15mr1964555wrq.15.1546965257605;
        Tue, 08 Jan 2019 08:34:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546965257; cv=none;
        d=google.com; s=arc-20160816;
        b=RmLqSSjtENxhIC2LvdlWjhBjWgBbuJZv2cPVDHnkU4MekGDGLzGNKQ9Bixhn+wiQcx
         B+P5Bwe4YzkIkwJ6QwyvLYvxsK0aIBr50DaIgGjWI2Qb+NAWL0RuyA4pKv56RsXupfKn
         L9LShylBnUYakrbVcITlPTcQ4ihTY1RZUNz7fR1NktZc7YGmdI/fqpr9ZYHQ+E64mmz+
         wcvcXlT+5pTW0ndFTf/LRzFie/dEKOCJez6yOGY4eb03fPgaegA66BgtjoyqUFVRV6Q5
         zbxgyL7JaeMXd5zOHefnnnGPyiHZBzeZvtTkdxLOq6cc0iS6tFNOhznmFvJ4++h5lAWb
         mBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YbQA+DVaTaDYVaQxTwMAtKAWfFrdJhgpXzSxOuBbRnM=;
        b=Ur8AceM+YL4hgJJwnPnc63wYViYVJSlj2hU+hEG0i/05eD0Sbc2rPWTH3aTpEYW8uK
         0QxHMFkMh3r/At+M242XXPrvup4bFIDnc0a8fgQHvSe6wpc5brL7jjzfsbkqDPrMGSsR
         3h5rhqwRlTcWnU0+ZwEdsMwaLz7lDkrck23jNCKJcsxV+2+XI6fP0iCpTRuMoljeGD3G
         +qoRjXQu+rACqETcVGFOdSoUtGhGrqqVt30an3hcIM/zZp6Ou2vlcCQK62eEyKWL76pJ
         VXE4PLZePlP6EJC3Q5cvNOqrf1W+lXCKZYTT9w2RYP1TP4kmNbLhRhV/9z8q9rL2gcnl
         Fu1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GC4QfhBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i64si7518401wmi.183.2019.01.08.08.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 08:34:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GC4QfhBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gguKW-0005kQ-Io
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 11:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGf-0002gs-W5
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGd-0003k7-FE
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:16 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37168)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gguGd-0003iU-87
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:15 -0500
Received: by mail-wm1-x343.google.com with SMTP id g67so5035683wmd.2
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YbQA+DVaTaDYVaQxTwMAtKAWfFrdJhgpXzSxOuBbRnM=;
	b=GC4QfhBeddbU6aUBlbRYZ6v4jU+85Qu2Z5QAfue52hBcgixrikT7jYJEkJ5+VZZQvW
	QvvA/jW7wOjhKOfoGFVWD766/SlAYy0SsplNHAvRp5nfv2SBQ78DQrfGyjiaQzgPnV/j
	MwwW0MfxWHQqlqqCUIpcNgxUquHfZt4HUD4Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YbQA+DVaTaDYVaQxTwMAtKAWfFrdJhgpXzSxOuBbRnM=;
	b=cGKmOLXEXel0RBb+sWX6ApYwEmi4ArNzMAWnYDNCH3ndyYnk4egciB6kswiJWO40oK
	eXEbqziz18tP42HvB+t1uBdBCEwcqzxT11+myfK/t6Wbdplv1dnRatZJ3H8jPNksR2Zi
	b+K9ZqzZShD5eFoYTx/96lVBH39om+zbf3OlHbBt2pTSBjVfmHn0H8/Yt70JTTocx67V
	CjzwGGIPDkyU8QaV2Janyf2IQ3VywtnB9yjXHcwoJ97D+T4dUsE1/8oNJL7mP34VGOOJ
	MYhakI3zrNSRMuSYzblXuggSXtTeszdJ1EmLEB6W4Ko0dN0DEeEf2XfEVqiZCUQHMtfu
	p3Tw==
X-Gm-Message-State: AJcUuke1NP1VI0BVmjst0Gh/CSM8OXxWktT4mWZm6fRbq58VKCMWyXVQ
	ftjUzs+HcArrx7BrshwuvuowmyTpy0NTWw==
X-Received: by 2002:a1c:9e4a:: with SMTP id h71mr2405012wme.82.1546965013904; 
	Tue, 08 Jan 2019 08:30:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	x81sm11278839wmg.17.2019.01.08.08.30.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Jan 2019 08:30:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  8 Jan 2019 16:30:06 +0000
Message-Id: <20190108163008.7006-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190108163008.7006-1-peter.maydell@linaro.org>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 2/4] qom/cpu: Add cluster_index to CPUState
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TpEJBWFzc2kb

For TCG we want to distinguish which cluster a CPU is in, and
we need to do it quickly. Cache the cluster index in the CPUState
struct, by having the cluster object set cpu->cluster_index for
each CPU child when it is realized.

This means that board/SoC code must add all CPUs to the cluster
before realizing the cluster object. Regrettably QOM provides no
way to prevent adding children to a realized object and no way for
the parent to be notified when a new child is added to it, so
we don't have any way to enforce/assert this constraint; all
we can do is document it in a comment.

The restriction on how many clusters can exist in the system
is imposed by TCG code which will be added in a subsequent commit,
but the check to enforce it in cluster.c fits better in this one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/cpu/cluster.h | 19 +++++++++++++++++++
 include/qom/cpu.h        |  7 +++++++
 hw/cpu/cluster.c         | 33 +++++++++++++++++++++++++++++++++
 qom/cpu.c                |  1 +
 4 files changed, 60 insertions(+)

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 73818232437..d1bef315d10 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -34,12 +34,31 @@
  * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
  * not have the same view of memory (for example the main CPU and a management
  * controller processor) they should be in different clusters.
+ *
+ * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
+ * adding the CPUs to it as QOM child objects (e.g. using the
+ * object_initialize_child() or object_property_add_child() functions).
+ * All CPUs must be added as children before the cluster is realized.
+ * (Regrettably QOM provides no way to prevent adding children to a realized
+ * object and no way for the parent to be notified when a new child is added
+ * to it, so this restriction is not checked for, but the system will not
+ * behave correctly if it is not adhered to.)
+ *
+ * A CPU which is not put into any cluster will be considered implicitly
+ * to be in a cluster with all the other "loose" CPUs, so all CPUs that are
+ * not assigned to clusters must be identical.
  */
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
 #define CPU_CLUSTER(obj) \
     OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
 
+/*
+ * This limit is imposed by TCG, which puts the cluster ID into an
+ * 8 bit field (and uses all-1s for the default "not in any cluster").
+ */
+#define MAX_CLUSTERS 255
+
 /**
  * CPUClusterState:
  * @cluster_id: The cluster ID. This value is for internal use only and should
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 1396f53e5b5..844becbcedc 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -279,6 +279,11 @@ struct qemu_work_item;
 /**
  * CPUState:
  * @cpu_index: CPU index (informative).
+ * @cluster_index: Identifies which cluster this CPU is in.
+ *   For boards which don't define clusters or for "loose" CPUs not assigned
+ *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
+ *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
+ *   QOM parent.
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
  * @running: #true if CPU is currently running (lockless).
@@ -404,6 +409,7 @@ struct CPUState {
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
+    int cluster_index;
     uint32_t halted;
     uint32_t can_do_io;
     int32_t exception_index;
@@ -1109,5 +1115,6 @@ extern const struct VMStateDescription vmstate_cpu_common;
 #endif /* NEED_CPU_H */
 
 #define UNASSIGNED_CPU_INDEX -1
+#define UNASSIGNED_CLUSTER_INDEX -1
 
 #endif
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 9d50a235d5c..d672f54a620 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -20,19 +20,52 @@
 
 #include "qemu/osdep.h"
 #include "hw/cpu/cluster.h"
+#include "qom/cpu.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/cutils.h"
 
 static Property cpu_cluster_properties[] = {
     DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
+static void cpu_cluster_realize(DeviceState *dev, Error **errp)
+{
+    /* Iterate through all our CPU children and set their cluster_index */
+    CPUClusterState *cluster = CPU_CLUSTER(dev);
+    ObjectPropertyIterator iter;
+    ObjectProperty *prop;
+    Object *cluster_obj = OBJECT(dev);
+
+    if (cluster->cluster_id >= MAX_CLUSTERS) {
+        error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
+        return;
+    }
+
+    object_property_iter_init(&iter, cluster_obj);
+    while ((prop = object_property_iter_next(&iter))) {
+        Object *cpu_obj;
+        CPUState *cpu;
+
+        if (!strstart(prop->type, "child<", NULL)) {
+            continue;
+        }
+        cpu_obj = object_property_get_link(cluster_obj, prop->name, NULL);
+        cpu = (CPUState *)object_dynamic_cast(cpu_obj, TYPE_CPU);
+        if (!cpu) {
+            continue;
+        }
+        cpu->cluster_index = cluster->cluster_id;
+    }
+}
+
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->props = cpu_cluster_properties;
+    dc->realize = cpu_cluster_realize;
 }
 
 static const TypeInfo cpu_cluster_type_info = {
diff --git a/qom/cpu.c b/qom/cpu.c
index 5442a7323be..f5579b1cd50 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -364,6 +364,7 @@ static void cpu_common_initfn(Object *obj)
     CPUClass *cc = CPU_GET_CLASS(obj);
 
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
+    cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
     cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
     /* *-user doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for softmmu */
-- 
2.19.2

