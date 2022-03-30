Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919095lfb;
        Wed, 30 Mar 2022 05:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs7lxC4mecTThheGFBQfY9F0eIIpJVPmg2kgd8Ht7t69PrHuUCnHaqsSxwE2gHK40YafB1
X-Received: by 2002:a05:600c:1d24:b0:38c:9f89:d1ac with SMTP id l36-20020a05600c1d2400b0038c9f89d1acmr4204393wms.69.1648645009282;
        Wed, 30 Mar 2022 05:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645009; cv=none;
        d=google.com; s=arc-20160816;
        b=ejkP2LPY3AYfOUPdNJpKSMPLJZF2icgudM4wCcD8vH/CF2fvmvdCZJSGo4qxM8myzs
         WEnbXbYh0UaOrlYJOw4XS4+eWsX1v8+7CK0vA2pKYYHgUscIZJXJQlDNYjAeZgnzwXk5
         zHAmnT+OOH0fXshKFCj3fDLi2W56POj//QW0mM/tdOuPUXkX510sY5Iw1CQ6kVv+OA/f
         p1EkdjrJhp7cU2D3B/hSFEoCjwwjHGh+BQaEfe5Tw1LUvffplDx+tZGwyBD5fXEfn73l
         AiDz6y3G4Y9t95jdh+EMBPzw3Qnr6vsfDom9dABeQndbTSGC6i/7/pty2/Oh+ZBBqlOa
         pVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MCPBp1rxd0BRI6uj/DUHFvNtQuIDUwFbXBbxFs483vY=;
        b=G0DT2Bm3V8amCgCfFhCp25gbrcWqhuRh9hs5LQm+B+6bj4dxAPkXKx0u02sTQhFMOo
         5eMjwlFIX9W2pp6HKVd8Hdm350XVtZBLzAjCWj1yWDhEJmCA9D/Qi/BdxBCxYCwzBhg7
         eyM409bgMU02B1kjYrEvGjZwvmNnncMfdHGY8CFVrXhxaDuri2TW1r4tsLbONVJuciRl
         5f/oYxPYytOGF9N55jsg5mXEjH/t7xoAW9dQylIYbiKN5suTpUyKT7ThQ+tcB9v08vE7
         MjIaRYpm3kJ07EWSPUA64nLUXgk6tNrU9xTclnXh8a+x2BKaLtFiejvZ2IhDwqgo9CaS
         tsiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=nKJcCtPa;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id c12-20020adfc04c000000b00203e9019443si18239954wrf.455.2022.03.30.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=nKJcCtPa;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id CE63B21C73;
	Wed, 30 Mar 2022 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCPBp1rxd0BRI6uj/DUHFvNtQuIDUwFbXBbxFs483vY=;
	b=nKJcCtPaxEONZtKtaky16eXmfZBjJCFDMEzhFmw+sBkyt89HEW5sszhygVqDI71jsnF0N2
	YxfX9oolBJ6A4PgC2KXPv6zotxOAM3xZOrQ5vuTK/8bt/1UrBAeb7mCVDoNVxEUTt8iMGd
	g3TsB122VzbFlEAjD+Ezgc+DxC7mJH4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 04/18] hw/cpu/cluster: make _cpu-cluster_ a subclass of _cpus_
Date: Wed, 30 Mar 2022 14:56:25 +0200
Message-Id: <20220330125639.201937-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: 7jirTpCEcRwQ

Drop the cluster-id property as base class defines one.
cluster_id field is temporarily kept until gdbstub
is updated.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cluster.h | 17 ++++++++++--
 hw/cpu/cluster.c         | 58 +++++++++++++++++++++-------------------
 2 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 09a2b86832..2125765f21 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -22,6 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "qom/object.h"
+#include "hw/cpu/cpus.h"
 
 /*
  * CPU Cluster type
@@ -55,7 +56,7 @@
  */
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
-OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
+OBJECT_DECLARE_TYPE(CPUClusterState, CPUClusterClass, CPU_CLUSTER)
 
 /**
  * CPUClusterState:
@@ -66,10 +67,22 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
  */
 struct CPUClusterState {
     /*< private >*/
-    DeviceState parent_obj;
+    CpusState parent_obj;
 
     /*< public >*/
     uint32_t cluster_id;
 };
 
+/**
+ * CPUClusterClass:
+ * @parent_realize: to store base class realize method
+ */
+struct CPUClusterClass {
+    /*< private >*/
+    CpusClass parent_class;
+
+    /*< public >*/
+    DeviceRealize parent_realize;
+};
+
 #endif
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index e444b7c29d..3daf897bd9 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -20,50 +20,39 @@
 
 #include "qemu/osdep.h"
 #include "hw/cpu/cluster.h"
+#include "hw/cpu/cpus.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
 
-static Property cpu_cluster_properties[] = {
-    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
-    DEFINE_PROP_END_OF_LIST()
-};
-
-typedef struct CallbackData {
-    CPUClusterState *cluster;
-    int cpu_count;
-} CallbackData;
-
 static int add_cpu_to_cluster(Object *obj, void *opaque)
 {
-    CallbackData *cbdata = opaque;
+    CpusState *base = CPUS(opaque);
     CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
 
     if (cpu) {
-        cpu->cluster_index = cbdata->cluster->cluster_id;
-        cbdata->cpu_count++;
+        cpu->cluster_index = base->cluster_index;
+        base->topology.cpus++;
     }
     return 0;
 }
 
 static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 {
-    /* Iterate through all our CPU children and set their cluster_index */
+    CPUClusterClass *ccc = CPU_CLUSTER_GET_CLASS(dev);
     CPUClusterState *cluster = CPU_CLUSTER(dev);
+    CpusState *base = CPUS(dev);
     Object *cluster_obj = OBJECT(dev);
-    CallbackData cbdata = {
-        .cluster = cluster,
-        .cpu_count = 0,
-    };
 
-    if (cluster->cluster_id >= MAX_CLUSTERS) {
-        error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
-        return;
-    }
+    /* This is a special legacy case */
+    assert(base->topology.cpus == 0);
+    assert(base->cpu_type == NULL);
+    assert(base->is_cluster);
 
-    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, &cbdata);
+    /* Iterate through all our CPU children and set their cluster_index */
+    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, base);
 
     /*
      * A cluster with no CPUs is a bug in the board/SoC code that created it;
@@ -71,24 +60,39 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
      * created the CPUs and parented them into the cluster object before
      * realizing the cluster object.
      */
-    assert(cbdata.cpu_count > 0);
+    assert(base->topology.cpus > 0);
+
+    /* realize base class (will set cluster field to true) */
+    ccc->parent_realize(dev, errp);
+
+    /*
+     * Temporarily copy the cluster id from the base class as
+     * gdbstub still uses our field.
+     */
+    cluster->cluster_id = base->cluster_index;
 }
 
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CPUClusterClass *ccc = CPU_CLUSTER_CLASS(klass);
+    CpusClass *cc = CPUS_CLASS(klass);
 
-    device_class_set_props(dc, cpu_cluster_properties);
-    dc->realize = cpu_cluster_realize;
+    device_class_set_parent_realize(dc, cpu_cluster_realize,
+                                    &ccc->parent_realize);
 
     /* This is not directly for users, CPU children must be attached by code */
     dc->user_creatable = false;
+
+    /* Cpus are created by external code */
+    cc->skip_cpus_creation = true;
 }
 
 static const TypeInfo cpu_cluster_type_info = {
     .name = TYPE_CPU_CLUSTER,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_CPUS,
     .instance_size = sizeof(CPUClusterState),
+    .class_size = sizeof(CPUClusterClass),
     .class_init = cpu_cluster_class_init,
 };
 
-- 
2.35.1
