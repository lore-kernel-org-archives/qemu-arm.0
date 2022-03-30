Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919078lfb;
        Wed, 30 Mar 2022 05:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK3V6zLhfxZZoSj+wPgK0cMslNdzXpvr5EtkjbYRzT+G6FUrrPBnET9kQwv+a9rWSGkHCg
X-Received: by 2002:a7b:cd01:0:b0:38c:9142:2006 with SMTP id f1-20020a7bcd01000000b0038c91422006mr4414424wmj.4.1648645008376;
        Wed, 30 Mar 2022 05:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645008; cv=none;
        d=google.com; s=arc-20160816;
        b=iySqenyfUmxWIydAhrEfmgJ2tQZRgiF3DCD1LtCpmwysvEZhZC473TpJ2anCUXOcFR
         n8cIGwqlPXi7kxR0KN7Gz51BVZsRWtBrxqYoh8uudkl1mrenDBHgfsTHYEhRmxsjcBsR
         Uz/Oq9f+jhDbGKUQ/q9VYlBrDO46GSEkU3sr42E7ja9t3Vg7sf2VyrtYEokmiNg/wkkO
         nwwvRM9A7yu5+0OJVS5CqRGnLTX62jYkiT0LNaUf4PnSQ3+aoKiqVP+CC80WCOoOiKwv
         8IbRcHW6q17UekGqJNPouSNUc5uEVt96ks7JXj9Pys2b5ELdZ6PNX5D8Q19pVr05VEv3
         YE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2qMcRfqsf2VMb4SH2mPd35TAbTZeVEgiMZ9x1BDL3IQ=;
        b=GGMGpiy35NZpyOdBBYGCgWf4lWIMEXiET7xFDrrmUpAkom5n+bdtjdmyFyyj3WCT5v
         rbL8E2inG67f8EaG0J28e/puraultdMMmAiB9lryaPSpWDKRFYLYSc+scZUO5WoWpBme
         pdyb5duEuPW47L+3yrG3HMaFNgy8dtTWBlMsbRBe4cFpMQch+pDoYEeMI1qPk05n98XH
         qK2cKPax5ObC+8rz/OvpP+LRT9z373gCoJi3x2S0xlN1WF7C5pdAqyCxXeaOCQRfqmRG
         X0hrqjIkzuxBLT+Z3HjlQAdDld7qzKQx0kMnfr26fxhQ0R8KtmpfiGOg167RBaRV57O1
         9vsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b="b6/5z9ht";
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id z6-20020adfc006000000b00203e90195e0si17719691wre.868.2022.03.30.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b="b6/5z9ht";
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id C78A021EBD;
	Wed, 30 Mar 2022 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qMcRfqsf2VMb4SH2mPd35TAbTZeVEgiMZ9x1BDL3IQ=;
	b=b6/5z9hthw543VWfCfDIavYU8c9uDHVEQsj+PxanIuFw9EZeRkI5paMMv54AMfpTiioBHr
	c1fqUuitSBI88gDJuS51wgLQOi3+3hJcv/1cBHlWhV7+MLaSkkiFttZ+pRssQQCGvihYGH
	qzR6xwdsnqq/C62A91DWuQ6yMObSXSE=
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
Subject: [RFC PATCH 03/18] hw/cpu/cpus: prepare to handle cpu clusters
Date: Wed, 30 Mar 2022 14:56:24 +0200
Message-Id: <20220330125639.201937-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: lnstC/wA5RLZ

Some group of cpus need to form a cpu cluster to be exposed
in gdb as inferiors.

Note: 'is_cluster' field is required at least to
transition the riscv_hart_array (see following commits about that)

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cpus.h | 19 +++++++++++++
 hw/cpu/cpus.c         | 65 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
index c65f568ef8..295d7537e2 100644
--- a/include/hw/cpu/cpus.h
+++ b/include/hw/cpu/cpus.h
@@ -24,6 +24,10 @@
  * This is an abstract class, subclasses are supposed to be created on
  * per-architecture basis to handle the specifics of the cpu architecture.
  * Subclasses are meant to be user-creatable (for cold-plug).
+ *
+ * Optionnaly a group of cpus may correspond to a cpu cluster and be
+ * exposed as a gdbstub's inferior. In that case cpus must have the
+ * same memory view.
  */
 
 #define TYPE_CPUS "cpus"
@@ -37,10 +41,18 @@ OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
  *      order to eventually update this smoothly with a full
  *      CpuTopology structure in the future.
  * @cpus: Array of pointer to cpu objects.
+ * @cluster_node: node in the global cluster list.
+ * @is_cluster: true if the object corresponds to a cpu cluster. It can be
+ *      written before realize in order to enable/disable clustering.
+ * @cluster_index: The cluster ID. This value is for internal use only and
+ *      should not be exposed directly to the user or to the guest.
  */
 struct CpusState {
     /*< private >*/
     DeviceState parent_obj;
+    bool is_cluster;
+    int32_t cluster_index;
+    QLIST_ENTRY(CpusState) cluster_node;
 
     /*< public >*/
     char *cpu_type;
@@ -68,4 +80,11 @@ struct CpusClass {
     bool skip_cpus_creation;
 };
 
+/**
+ * cpus_disable_clustering:
+ * Disable clustering for this object.
+ * Has to be called before realize step.
+ */
+void cpus_disable_clustering(CpusState *s);
+
 #endif /* HW_CPU_CPUS_H */
diff --git a/hw/cpu/cpus.c b/hw/cpu/cpus.c
index 5fad1de2c7..ed9402c100 100644
--- a/hw/cpu/cpus.c
+++ b/hw/cpu/cpus.c
@@ -16,9 +16,17 @@
 #include "hw/resettable.h"
 #include "sysemu/reset.h"
 
+static QLIST_HEAD(, CpusState) clusters =
+    QLIST_HEAD_INITIALIZER(clusters);
+
 static Property cpus_properties[] = {
     DEFINE_PROP_STRING("cpu-type", CpusState, cpu_type),
     DEFINE_PROP_UINT16("num-cpus", CpusState, topology.cpus, 0),
+    /*
+     * Default behavior is to automatically compute a valid index.
+     * FIXME: remove this property to keep it internal ?
+     */
+    DEFINE_PROP_INT32("cluster-id", CpusState, cluster_index, -1),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -30,6 +38,20 @@ static void cpus_reset(Object *obj)
     }
 }
 
+static void cpus_init(Object *obj)
+{
+    CpusState *s = CPUS(obj);
+
+    /* may be overriden by subclasses or code to disable clustering */
+    s->is_cluster = true;
+}
+
+void cpus_disable_clustering(CpusState *s)
+{
+    assert(!DEVICE(s)->realized);
+    s->is_cluster = false;
+}
+
 static void cpus_create_cpus(CpusState *s, Error **errp)
 {
     Error *err = NULL;
@@ -44,6 +66,11 @@ static void cpus_create_cpus(CpusState *s, Error **errp)
         object_property_add_child(OBJECT(s), "cpu[*]", OBJECT(cpu));
         object_unref(OBJECT(cpu));
 
+        /* set index in case of cluster */
+        if (s->is_cluster) {
+            cpu->cluster_index = s->cluster_index;
+        }
+
         /* let subclass configure the cpu */
         if (cgc->configure_cpu) {
             cgc->configure_cpu(s, cpu, i);
@@ -60,7 +87,7 @@ static void cpus_create_cpus(CpusState *s, Error **errp)
 
 static void cpus_realize(DeviceState *dev, Error **errp)
 {
-    CpusState *s = CPUS(dev);
+    CpusState *item, *s = CPUS(dev);
     CpusClass *cgc = CPUS_GET_CLASS(s);
 
     /* if subclass defined a base type, let's check it */
@@ -77,6 +104,38 @@ static void cpus_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->is_cluster) {
+        if (s->cluster_index < 0) {
+            int32_t max = -1;
+            QLIST_FOREACH(item, &clusters, cluster_node) {
+                if (max < item->cluster_index) {
+                    max = item->cluster_index;
+                }
+            }
+            s->cluster_index = max + 1;
+        } else {
+            /*
+             * Check the index is not already taken.
+             */
+            QLIST_FOREACH(item, &clusters, cluster_node) {
+                if (s->cluster_index == item->cluster_index) {
+                    error_setg(errp, "cluster index %d already exists",
+                               s->cluster_index);
+                    return;
+                }
+            }
+        }
+
+        if (s->cluster_index >= MAX_CLUSTERS) {
+            error_setg(errp, "cluster index must be less than %d",
+                       MAX_CLUSTERS);
+            return;
+        }
+
+        /* Put the cpus in the inferior list */
+        QLIST_INSERT_HEAD(&clusters, s, cluster_node);
+    }
+
     /* create the cpus if needed */
     if (!cgc->skip_cpus_creation) {
         cpus_create_cpus(s, errp);
@@ -89,6 +148,9 @@ static void cpus_finalize(Object *obj)
     CpusState *s = CPUS(obj);
 
     g_free(s->cpus);
+
+    /* it may not be in the list */
+    QLIST_SAFE_REMOVE(s, cluster_node);
 }
 
 static void cpus_class_init(ObjectClass *klass, void *data)
@@ -114,6 +176,7 @@ static const TypeInfo cpus_type_info = {
     .parent            = TYPE_DEVICE,
     .abstract          = true,
     .instance_size     = sizeof(CpusState),
+    .instance_init     = cpus_init,
     .instance_finalize = cpus_finalize,
     .class_size        = sizeof(CpusClass),
     .class_init        = cpus_class_init,
-- 
2.35.1
