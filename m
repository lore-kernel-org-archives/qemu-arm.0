Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp201204ejb;
        Fri, 26 Apr 2024 00:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSkcPH4zy+uuWS4nLXDTO+dF8SXy+EI6b3wKy3oERJDtrhzOoG9qIPVS8Yfsp0lAb/4Uxh8aibeAM6sFz0Iri8e5fRf9eP
X-Google-Smtp-Source: AGHT+IEBzFA+BXZPH34PS3A5RvXJoagtaiwQj5GQyS2FLc/McxfxHkvwuSMOJlhNIN+GLfwfx1pO
X-Received: by 2002:a25:8488:0:b0:dcc:efa2:93fb with SMTP id v8-20020a258488000000b00dccefa293fbmr1867410ybk.45.1714117027359;
        Fri, 26 Apr 2024 00:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714117027; cv=none;
        d=google.com; s=arc-20160816;
        b=zehbM1PIR/cbyyd6zznJboTQKyl0XfTnE9aVHm+t1arH3jWQ+rLhafkDM9BAP4fiaN
         b1cB+dt03IN/fTOr/JZya2aQrN5Zb5Vl+hREYsvJ1fwDn4JK86TQ+lcBOBJjlAa0F6GJ
         O2Q4lSl5OaXoQY0rtflCaz+WmkkUTbMQ+UR4Y9r8fxux1QRi2OOSh+FyvW4rOnlU/6KY
         yPJfXJv6ZhxUnqefitvzkkfGUFAjCAQvgsio/Uy1yclsHyVBzorYzQ9XsLU7ZW6ke3kB
         uvL1OaOQbOTZ4UYeicahvXG2iIKLi0F2i4RK/UR5iKXDqOrespCL8YhzmSjFlI+8rSl7
         ZFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=epUGY+yZE+6gPMMVuWJFgox8WGtjJ3BUeefRV9d0O6Q=;
        fh=Py5POnVFwKa5nIG4yqo8GLc7pcTV2IK7kvzXmVEf5Ro=;
        b=tHKplYf+tmzM0WOEqdt68rJd6qsO80J8miVgibI8vd234pikuHnkbnL9FovijgCfPA
         e6K6PVtU6ev3DLi9plzsNPQVPyYCa32BWg08dKk6nxmI4Wjjs+N6Caj7qyuVXlR8A+dp
         gySg1GBAB96OgDmxCPrL3s6UIsksp0f27esOCinzvaG+Cz5LL7ULZABDrbKQ6SgDLidO
         GQ+jsvjlfMHCQWd7EaLlLvlM/e9g8wINjMTN4dfB97Hd5Ap2dJyi3Iw1zK2ccR3Q5QwG
         Ng2tHJ+JniYMJG3eoMg3nXkoW0LodZAtCpI2POMt+KgfHojg+VQd+/XR3zJXzjslJNyc
         GOZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020a05620a439500b0078fd6159c10si17393982qkp.7.2024.04.26.00.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 00:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0G8c-0001QD-Jf; Fri, 26 Apr 2024 03:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G8E-0001JQ-Iz; Fri, 26 Apr 2024 03:36:35 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G89-0002VW-G8; Fri, 26 Apr 2024 03:36:30 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwBnFwhqWStmB_j1CQ--.74S2;
 Fri, 26 Apr 2024 15:36:10 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwAH2EtlWStmgmcAAA--.464S4;
 Fri, 26 Apr 2024 15:36:08 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,
 xiongyining1480 <xiongyining1480@phytium.com.cn>
Subject: [PATCH v4 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa machine
Date: Fri, 26 Apr 2024 07:35:53 +0000
Message-Id: <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
References: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwAH2EtlWStmgmcAAA--.464S4
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAHBmYqsHgCMQAAs3
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw1fuw17CF4rXrWxurWxJFb_yoW5trWkpr
 4UKF9IvrWxCrnIvw4fW3W29FyrWw4Fqw47Aw47KrWrCwnxG34xXF40yryFkr1UWrn7uFy5
 uF4DCFyFgayvvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L7pt0ewTX7LP

From: xiongyining1480 <xiongyining1480@phytium.com.cn>

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
this topology can be passed to the firmware through DT cpu-map.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst |  4 ++++
 hw/arm/sbsa-ref.c        | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index 2bf22a1d0b..783b87cad7 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -62,6 +62,7 @@ The devicetree reports:
    - platform version
    - GIC addresses
    - NUMA node id for CPUs and memory
+   - CPU topology information
 
 Platform version
 ''''''''''''''''
@@ -88,3 +89,6 @@ Platform version changes:
 
 0.3
   The USB controller is an XHCI device, not EHCI.
+
+0.4
+  CPU topology information is present in devicetree
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f5709d6c14..0c2ebe0417 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -210,7 +210,7 @@ static void create_fdt(SBSAMachineState *sms)
      *                        fw compatibility.
      */
     qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
-    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 3);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 4);
 
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
@@ -264,9 +264,43 @@ static void create_fdt(SBSAMachineState *sms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        qemu_fdt_setprop_cell(sms->fdt, nodename, "phandle",
+                        qemu_fdt_alloc_phandle(sms->fdt));
+
         g_free(nodename);
     }
 
+    /*
+     * Add vCPU topology description through fdt node cpu-map.
+     * See fdt_add_cpu_nodes() on hw/arm/virt.c for longer description.
+     */
+    qemu_fdt_add_subnode(sms->fdt, "/cpus/cpu-map");
+
+    for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
+        char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+        char *map_path;
+
+        if (ms->smp.threads > 1) {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
+                cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
+                (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
+                (cpu / ms->smp.threads) % ms->smp.cores,
+                cpu % ms->smp.threads);
+        } else {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/cluster%d/core%d",
+                cpu / (ms->smp.clusters * ms->smp.cores),
+                (cpu / ms->smp.cores) % ms->smp.clusters,
+                cpu % ms->smp.cores);
+        }
+        qemu_fdt_add_path(sms->fdt, map_path);
+        qemu_fdt_setprop_phandle(sms->fdt, map_path, "cpu", cpu_path);
+
+        g_free(map_path);
+        g_free(cpu_path);
+    }
+
     sbsa_fdt_add_gic_node(sms);
 }
 
@@ -886,6 +920,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->smp_props.clusters_supported = true;
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.34.1

