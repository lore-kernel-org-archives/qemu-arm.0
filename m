Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4492786lfp;
        Mon, 27 Sep 2021 21:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyQ8OdCiH8lSExdf9jF2JXVML1HIFbqUzjoPACb11EeM+zq6usd8T++ZSPzXVZZxUqNd96
X-Received: by 2002:a54:418a:: with SMTP id 10mr2021755oiy.13.1632801992591;
        Mon, 27 Sep 2021 21:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632801992; cv=none;
        d=google.com; s=arc-20160816;
        b=w5DuN3oY7WaO30gJtqmLwkSVnIu2gHxJK66dJG49Km5VbQbbKO25/9ZpoHTEBesCQK
         i5QoOfT0TyLPAe4aNhNLLvjjljwIyiOxrVuGPti/vC9kUke7G4XhqmkJFSKd3vqGshrt
         SZIYXnuQ0RTHLaHHvFtjJkiMwUD6zGjF5NxtG/2Vw3YLUivalKhFVSUpDrVzEXKjACvV
         PQtt+sn5yFkWC/Hc3uFIpMo8Y4lfPxfRPV0pADIugTSBXp6sntjksM312Q6QU1NbLyqo
         Gd85YP+XtPON1RstApTqsHG5+sZb1zkyHVKGfF6oewiwqbY5NvPZB/fWhU6+fvav0dew
         5J/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=g2o3l7qB2/yGsqXOLek+s+5G4nmwwmZxdU1AsJtmkEE=;
        b=EE1OwU2qWlA/Uru7kT+Rk9Dzb3e9SixVIJ4pUxat5tDhxEraQjRmkhSayrJVaNwS9N
         yD6MMAAykSQJEp6k7VbZv8TE7x5/rRxdAyAoZZVsEGCrcR8Dt8QjWJM2fJgOODZRkroH
         I65yDPkctJubxfBqx9GPl7iatlcQzsC1S/RYvpMAhwOD3QcmGNPFe4fGmBOMW8HBJWRS
         kN850YpZ4Dc629Z8xPucbcY6e0Z61Yytvi1l+eQlVflXm0yPVVemU+iss2xZlhvKPZ5O
         da3W7VZXmvDB4RDrtMw5Iibk4R89r047WqLfN1Wo2lop9MlT6eHlvqKqZsswJoqgHRRC
         npgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bd24si5746258oib.301.2021.09.27.21.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 21:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mV4Nz-0003aq-RR
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 00:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4G3-0001YC-OC; Mon, 27 Sep 2021 23:58:19 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4Fw-0002HI-Bz; Mon, 27 Sep 2021 23:58:19 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HJQg60QZkz1DHMl;
 Tue, 28 Sep 2021 11:56:50 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:07 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:06 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: [PATCH v11 08/14] machine: Prefer cores over sockets in smp parsing
 since 6.2
Date: Tue, 28 Sep 2021 11:57:49 +0800
Message-ID: <20210928035755.11684-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210928035755.11684-1-wangyanan55@huawei.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DuXmppKca6ZK

In the real SMP hardware topology world, it's much more likely that
we have high cores-per-socket counts and few sockets totally. While
the current preference of sockets over cores in smp parsing results
in a virtual cpu topology with low cores-per-sockets counts and a
large number of sockets, which is just contrary to the real world.

Given that it is better to make the virtual cpu topology be more
reflective of the real world and also for the sake of compatibility,
we start to prefer cores over sockets over threads in smp parsing
since machine type 6.2 for different arches.

In this patch, a boolean "smp_prefer_sockets" is added, and we only
enable the old preference on older machines and enable the new one
since type 6.2 for all arches by using the machine compat mechanism.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/arm/virt.c              |  1 +
 hw/core/machine.c          | 35 ++++++++++++++++++++++++++---------
 hw/i386/pc.c               | 35 ++++++++++++++++++++++++++---------
 hw/i386/pc_piix.c          |  1 +
 hw/i386/pc_q35.c           |  1 +
 hw/ppc/spapr.c             |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 +
 include/hw/boards.h        |  1 +
 qemu-options.hx            |  3 ++-
 9 files changed, 60 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1d59f0e59f..8c13deb5db 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2815,6 +2815,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 
     /* qemu ITS was introduced with 6.2 */
     vmc->no_tcg_its = true;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f1b30b3101..0df597f99c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -748,6 +748,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
@@ -759,7 +760,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -767,14 +768,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            sockets = maxcpus / (cores * threads);
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = maxcpus / (sockets * threads);
-        } else if (threads == 0) {
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            }
+        }
+
+        /* try to calculate omitted threads at last */
+        if (threads == 0) {
             threads = maxcpus / (sockets * cores);
         }
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a37eef8057..447114e57a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,6 +716,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
@@ -726,7 +727,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     /* directly default dies to 1 if it's omitted */
     dies = dies > 0 ? dies : 1;
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -734,14 +735,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            sockets = maxcpus / (dies * cores * threads);
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = maxcpus / (sockets * dies * threads);
-        } else if (threads == 0) {
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            }
+        }
+
+        /* try to calculate omitted threads at last */
+        if (threads == 0) {
             threads = maxcpus / (sockets * dies * cores);
         }
     }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c5da7739ce..077644ee9c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -431,6 +431,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46cd542d17..2d97c0ab3e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -371,6 +371,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d39fd4e644..a481fade51 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4702,6 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 61aeccb163..5401c985cf 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -814,6 +814,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 463a5514f9..2ae039b74f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -247,6 +247,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
+    bool smp_prefer_sockets;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
diff --git a/qemu-options.hx b/qemu-options.hx
index 9d71a661bb..5c1b0311c0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -238,7 +238,8 @@ SRST
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
-    liable to change.
+    liable to change. Prior to 6.2 the preference was sockets over cores
+    over threads. Since 6.2 the preference is cores over sockets over threads.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1

