Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3263059lfb;
        Sun, 8 Nov 2020 19:08:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3tB1rJoSiYAZ9pgcTYF3KihBbCzr/stnc/hJdR2JIkG7XUrNibQqcbrZA1umbJ6w3e24M
X-Received: by 2002:a0c:f3c2:: with SMTP id f2mr11917924qvm.24.1604891326791;
        Sun, 08 Nov 2020 19:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891326; cv=none;
        d=google.com; s=arc-20160816;
        b=xV8j5U4C6yH1rRDvHnVZd/bUSizTSIxI0RiO0ta7vPgbPgTqou1ol2pPLnoomMYB4N
         ECjZLhGQaknGU6gySavHn4hwUa3uuhcwHnzitEf8Jh2w0r4TbdWBnB9QTtR5LEOJ4eXo
         OKLda3Di6loTSQu7zbyRN2b6ww0db4iYWprWdpHKT05oRXXivfPix0DO+BRTGn1dFwl/
         jbfA6evQXwis01gNE4YgUb/qsxUV+iQalvNd5p51w4H/KfT9ldLH0UhBb3FzufVLDZ2h
         z9ahIKOKL6E7QnHQBgUyU6Hv2KhRPCkRYyBkH1JOUE9BnSe6HPry9UzMyZRYp3kMZZEd
         9EeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=e1LJtuV9P59olwkEcpToTx59AeT+42JOFpAOO2/fjBU=;
        b=AWHwpj5v2e0XOrRqk51/f4Nujg9ZGTIZ5k7v/YOZ6G48eCSUJwt1Mc5P1UYJxvFVv5
         KRMrYsLxf7jKYkCHuTBnrs4iXHUTwbnBJunpxnxqEZY/l+Ghm5RFco/2jGvjk0zAsCpJ
         Ry0LhOVXWGL8UYCirnyKRnvaXjGs3hv5Crd8bAEMILmBmJTgAbvirboZDhkuIEkD4ei+
         xMLikbP1afpOXzDmExmKsTm8dzxydU1HxnpxJ5UyxGMSx6RnfMobKXVDhI6ngPnou1Br
         J+fcqdtNq3V2PHLGCr3t9R139534KZjp9+TBTJ17iy6ELfJynfHMmfbE2j50TqYVe/ol
         4QWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s61si4322218qtd.356.2020.11.08.19.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxXy-00062x-5s
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUt-0001cZ-D5; Sun, 08 Nov 2020 22:05:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUn-0006bL-JN; Sun, 08 Nov 2020 22:05:35 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CTwpb5JkMzhjGZ;
 Mon,  9 Nov 2020 11:05:11 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:11 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 03/13] hw/arm/virt: Replace smp_parse with one that
 prefers cores
Date: Mon, 9 Nov 2020 11:04:42 +0800
Message-ID: <20201109030452.2197-4-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:18
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMK+/Tm7MsCi

From: Andrew Jones <drjones@redhat.com>

The virt machine type has never used the CPU topology parameters, other
than number of online CPUs and max CPUs. When choosing how to allocate
those CPUs the default has been to assume cores. In preparation for
using the other CPU topology parameters let's use an smp_parse that
prefers cores over sockets. We can also enforce the topology matches
max_cpus check because we have no legacy to preserve.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea24b576c6..ba902b53ba 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -78,6 +78,8 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "qapi/qmp/qerror.h"
+#include "sysemu/replay.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -2444,6 +2446,79 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     return requested_pa_size > 40 ? requested_pa_size : 0;
 }
 
+/*
+ * Unlike smp_parse() in hw/core/machine.c, we prefer cores over sockets,
+ * e.g. '-smp 8' creates 1 socket with 8 cores.  Whereas '-smp 8' with
+ * hw/core/machine.c's smp_parse() creates 8 sockets, each with 1 core.
+ * Additionally, we can enforce the topology matches max_cpus check,
+ * because we have no legacy to preserve.
+ */
+static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
+{
+    if (opts) {
+        unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
+        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
+        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+
+        /*
+         * Compute missing values; prefer cores over sockets and
+         * sockets over threads.
+         */
+        if (cpus == 0 || cores == 0) {
+            sockets = sockets > 0 ? sockets : 1;
+            threads = threads > 0 ? threads : 1;
+            if (cpus == 0) {
+                cores = cores > 0 ? cores : 1;
+                cpus = cores * threads * sockets;
+            } else {
+                ms->smp.max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+                cores = ms->smp.max_cpus / (sockets * threads);
+            }
+        } else if (sockets == 0) {
+            threads = threads > 0 ? threads : 1;
+            sockets = cpus / (cores * threads);
+            sockets = sockets > 0 ? sockets : 1;
+        } else if (threads == 0) {
+            threads = cpus / (cores * sockets);
+            threads = threads > 0 ? threads : 1;
+        } else if (sockets * cores * threads < cpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) < "
+                         "smp_cpus (%u)",
+                         sockets, cores, threads, cpus);
+            exit(1);
+        }
+
+        ms->smp.max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+
+        if (ms->smp.max_cpus < cpus) {
+            error_report("maxcpus must be equal to or greater than smp");
+            exit(1);
+        }
+
+        if (sockets * cores * threads != ms->smp.max_cpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u)"
+                         "!= maxcpus (%u)",
+                         sockets, cores, threads,
+                         ms->smp.max_cpus);
+            exit(1);
+        }
+
+        ms->smp.cpus = cpus;
+        ms->smp.cores = cores;
+        ms->smp.threads = threads;
+        ms->smp.sockets = sockets;
+    }
+
+    if (ms->smp.cpus > 1) {
+        Error *blocker = NULL;
+        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
+        replay_add_blocker(blocker);
+    }
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -2469,6 +2544,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->smp_parse = virt_smp_parse;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
-- 
2.23.0

