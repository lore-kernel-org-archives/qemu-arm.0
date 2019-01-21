Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6175738wrt;
        Mon, 21 Jan 2019 07:23:10 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6yTVm3hypgj880FkB+sCKeBVk3GPkU7bJgmnJh/pUwvNOP0jPP+8AD0Jzr6ZGkYStWxZms
X-Received: by 2002:a1c:9183:: with SMTP id t125mr24566505wmd.79.1548084190310;
        Mon, 21 Jan 2019 07:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548084190; cv=none;
        d=google.com; s=arc-20160816;
        b=Z68BnrSjrZvCD6tFdpTPBv3i5MPzIwWDI+2catImcPt8ZgyWWKB484aJ/+vUfev8GJ
         onZfwtLsHdnRXoAqYTh+O+zPBW9XyFWtR1LNiTu8cv8KaJmAvxQdwK4gNoLuDYA0h7JL
         qgv7+qtJzYqCd6G3jWVhbxUmlEDuhGfArk5Ly9kfvntgex97mT8231kYnxIfkk7u5sOV
         DFFar1VEFlmNhwTGyTv/Tfbif+w7d8UERPGdg/QGSpJVPsxfHRIDlDd3x66bnJL2MLa3
         fxX9alSxESV3GZ9HUUdIHjL33junmj2CrJqJmwSBQl45qDlEaBQwjI5BqUcKFEIRIXzd
         Xa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=dW3XYUmi+127c7xazctmwe4gw2x2VuqOsI6Nkm1CZQ4=;
        b=ZvLJNytbvqIhWfptsOgw6OCcoTRkO9sI/EgVf1fLMqlf+Xe1a35/b1o9L8DZ0F90UV
         lg7m/E0rDbENYJGBdJHy6qFpveAdlhnbYwUx8zleo2bLixBLgbM6T3iEp+ILEevKtVS6
         tDK6W4n62M+BWERuS289FdjwSy0vLzR4DnMD9m6ldUnXKYrZ9IuMN5knxJT+GDNKbZ4J
         aBaWMdnyzYx8QGIZpYIF+LljD/bgV74TMmTtCZnOzbiw9QO07TPhSOAxYhQ4ox+6Vp30
         F0yX6b8rEdKzJFXXUXqP2/IKtYgCP/+LicwfVu4CjqwE6F3I3L29hNgtfXBdn8pXWza5
         EAxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JaiSTkMu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si35808808wmd.9.2019.01.21.07.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 07:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JaiSTkMu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glbPp-00084k-6L
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 10:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPL-000811-Pi
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPJ-0003wB-DR
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:39 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glbPH-0003rB-6H
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:35 -0500
Received: by mail-wm1-x342.google.com with SMTP id p6so11162599wmc.1
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 07:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dW3XYUmi+127c7xazctmwe4gw2x2VuqOsI6Nkm1CZQ4=;
	b=JaiSTkMuDG9yYdoVn9j8PHj//y1/3F+NUCp2oVY9uQ2/4l+rylAWmciwtoJymDGQ6e
	wwShQuxrOcdHRUlGapFVnEh3cDQ7sykiVfuLdgtISDCeLY9x/Jcv57qvtRQPt/6/8xsv
	stGTpvbhGrw+R5XeOIJO27BBg99GPoJgni040=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dW3XYUmi+127c7xazctmwe4gw2x2VuqOsI6Nkm1CZQ4=;
	b=GA9ovWR6EpFj+ATze7NWVGEikkEeACuwccDcwlofgic+dejC209JLsPRCm/BakPGSE
	O4o6VPOUSDtujBicUx40j0YNRGj1WV55hVfXHgru5BNfeQEONRSzQu6D2B1+RV8UCzmc
	J4X4p8ccfWl/RwJxEMTbnr2QR+JqYzTCTYpF84sZ1O6kF6ohIj18UnZdePbqIDlCoHUC
	8NDA73G+aqiy28WHKyX2zu1NgcrIy8JHAdNmkjy/dNQ71KQYnVnY1eObSx/ByU9oSa/Q
	8nXpM7LUK8o0y40ypJSVeJh8PTCC6Z+EpQ907AZUgEOxE4owYHttI6WpcINWtY3nERoM
	1jWw==
X-Gm-Message-State: AJcUukdVrH7yANZj4jjs/RMxihcxrIXsb+J6O0zAPgwyxksBtB8Volsw
	NlZUrq0GnYkIC512cD1qcEQhpQ==
X-Received: by 2002:a1c:e044:: with SMTP id x65mr10063934wmg.86.1548084144516; 
	Mon, 21 Jan 2019 07:22:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	o16sm128900134wrn.11.2019.01.21.07.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 07:22:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 15:22:16 +0000
Message-Id: <20190121152218.9592-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121152218.9592-1-peter.maydell@linaro.org>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v3 2/4] qom/cpu: Add cluster_index to CPUState
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SBaVHwtPYdh2

For TCG we want to distinguish which cluster a CPU is in, and
we need to do it quickly. Cache the cluster index in the CPUState
struct, by having the cluster object set cpu->cluster_index for
each CPU child when it is realized.

This means that board/SoC code must add all CPUs to the cluster
before realizing the cluster object. Regrettably QOM provides no
way to prevent adding children to a realized object and no way for
the parent to be notified when a new child is added to it, so
we don't have any way to enforce/assert this constraint; all
we can do is document it in a comment. We can at least put in a
check that the cluster contains at least one CPU, which should
catch the typical cases of "realized cluster too early" or
"forgot to parent the CPUs into it".

The restriction on how many clusters can exist in the system
is imposed by TCG code which will be added in a subsequent commit,
but the check to enforce it in cluster.c fits better in this one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v2->v3:
 * allow CPU objects to be indirect children of the cluster;
   this is useful for ARMv7M, where the CPU object is a child
   of the armv7m container and the board code that sets up
   the cluster object only has the armv7m container object:
   this is done by using object_child_foreach_recursive()
   rather than an open-coded child iteration
 * add an assertion that the cluster has at least one CPU,
   which catches the easiest-to-make errors when creating
   and populating the cluster
---
 include/hw/cpu/cluster.h | 24 +++++++++++++++++++++
 include/qom/cpu.h        |  7 ++++++
 hw/cpu/cluster.c         | 46 ++++++++++++++++++++++++++++++++++++++++
 qom/cpu.c                |  1 +
 4 files changed, 78 insertions(+)

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 73818232437..549c2d31d43 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -34,12 +34,36 @@
  * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
  * not have the same view of memory (for example the main CPU and a management
  * controller processor) they should be in different clusters.
+ *
+ * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
+ * adding the CPUs to it as QOM child objects (e.g. using the
+ * object_initialize_child() or object_property_add_child() functions).
+ * The CPUs may be either direct children of the cluster object, or indirect
+ * children (e.g. children of children of the cluster object).
+ *
+ * All CPUs must be added as children before the cluster is realized.
+ * (Regrettably QOM provides no way to prevent adding children to a realized
+ * object and no way for the parent to be notified when a new child is added
+ * to it, so this restriction is not checked for, but the system will not
+ * behave correctly if it is not adhered to. The cluster will assert that
+ * it contains at least one CPU, which should catch most inadvertent
+ * violations of this constraint.)
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
index 16bbed1ae09..4c2feb9c17b 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -280,6 +280,11 @@ struct qemu_work_item;
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
@@ -405,6 +410,7 @@ struct CPUState {
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
+    int cluster_index;
     uint32_t halted;
     uint32_t can_do_io;
     int32_t exception_index;
@@ -1111,5 +1117,6 @@ extern const struct VMStateDescription vmstate_cpu_common;
 #endif /* NEED_CPU_H */
 
 #define UNASSIGNED_CPU_INDEX -1
+#define UNASSIGNED_CLUSTER_INDEX -1
 
 #endif
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 9d50a235d5c..25f90702b16 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -20,19 +20,65 @@
 
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
 
+typedef struct CallbackData {
+    CPUClusterState *cluster;
+    int cpu_count;
+} CallbackData;
+
+static int add_cpu_to_cluster(Object *obj, void *opaque)
+{
+    CallbackData *cbdata = opaque;
+    CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+
+    if (cpu) {
+        cpu->cluster_index = cbdata->cluster->cluster_id;
+        cbdata->cpu_count++;
+    }
+    return 0;
+}
+
+static void cpu_cluster_realize(DeviceState *dev, Error **errp)
+{
+    /* Iterate through all our CPU children and set their cluster_index */
+    CPUClusterState *cluster = CPU_CLUSTER(dev);
+    Object *cluster_obj = OBJECT(dev);
+    CallbackData cbdata = {
+        .cluster = cluster,
+        .cpu_count = 0,
+    };
+
+    if (cluster->cluster_id >= MAX_CLUSTERS) {
+        error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
+        return;
+    }
+
+    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, &cbdata);
+
+    /*
+     * A cluster with no CPUs is a bug in the board/SoC code that created it;
+     * if you hit this during development of new code, check that you have
+     * created the CPUs and parented them into the cluster object before
+     * realizing the cluster object.
+     */
+    assert(cbdata.cpu_count > 0);
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
2.20.1

