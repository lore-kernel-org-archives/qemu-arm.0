Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp197431ejb;
        Fri, 26 Apr 2024 00:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5FPvAt/G0aU8DoZCXz6PDSFR2fajS/9p3+/mSLxl3Ke2TeY6JRTegHRzEeIRNJuuQiOuwvgb2mw3KoRxEV/Ds5fuLRN6Q
X-Google-Smtp-Source: AGHT+IGYH3j+WoPD3ZXG3EkPuM2lynQUYFtKuligas2ATu6NFyxn6gF3H5kQORcre+NFHWkOhpKo
X-Received: by 2002:a05:622a:298d:b0:437:bec6:7354 with SMTP id hd13-20020a05622a298d00b00437bec67354mr2517225qtb.28.1714116519834;
        Fri, 26 Apr 2024 00:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714116519; cv=none;
        d=google.com; s=arc-20160816;
        b=1D5PznQE40Tk8NKfqHN121NXXRVj+Ka2HAKc7J5in7zJY0x+4Ygfy37sQaZgiacrdl
         UhG+z6IpYqQcvP92jPbXjRO69lVqPQgT4GiiWdh4e4vvQkGjX0humddro8myQ8xmGTtp
         P+zWCNGrlWhEXm9NFXHIXto6m1FOIfvBCVf5CtFqUIUyV/DAC1FciwKESoaWm7au2ATu
         siz7zeshHKf+JxKlUWBoNhjK4JhrNJhY97+cxKqHEPQ2VfpqKz3w45EIfguIRMHcBMxv
         zMhON0ULfQYGXxfuSeoOn9RzfOz8sJO3u7gKeE2gGYDdlpQR0KNqOb/kbXnH30ov73cD
         zOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=y+Mx9OGdvGyY/wjML7DrvVS2U08L+JPe4WyEP1oALsg=;
        fh=Py5POnVFwKa5nIG4yqo8GLc7pcTV2IK7kvzXmVEf5Ro=;
        b=HAsJ6y7P6Gknkm1Sn+FPoEN+Xvy0uDePLsRd8ETruE3ihHA4kUC1kWCRjaEeJnifv8
         y76CXP9c6XnbHbwjt8tW0KBOT/+Bo35lUKPkBHwcSLhRqG8JDVLtXBVNU/gaHddWGho+
         kLwKmi1YXC1yMBs0rsUJw24bZ/ma0c9nmKeXqRVdxKgSuQcIPDsaCugSA0Jfe+jGOEwK
         2RIz4m4O59CWGGGnrfYE40lI6rzrxPG8YQD/z7AeIdebBad+N+Sh9j9yajOoxLW0zrdG
         sdUKYTdcyR4jjb1mrSNHG1PFmYcTMTFVvOgwBRTixk6xMColqz+pYHZyh8oNynJ/fkTW
         XVrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020ac85a43000000b00437b7e41ddesi17661664qta.84.2024.04.26.00.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 00:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0G0Q-0006zx-T1; Fri, 26 Apr 2024 03:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G0Q-0006zN-4Z; Fri, 26 Apr 2024 03:28:26 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G0N-0008Go-Vo; Fri, 26 Apr 2024 03:28:25 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwBHJ6yRVytmPFMAAA--.242S2;
 Fri, 26 Apr 2024 15:28:17 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwCXaEyDVytmqGUAAA--.521S4;
 Fri, 26 Apr 2024 15:28:08 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,
 xiongyining1480 <xiongyining1480@phytium.com.cn>
Subject: [PATCH v3 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa machine
Date: Fri, 26 Apr 2024 07:27:04 +0000
Message-Id: <20240426072704.325883-2-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426072704.325883-1-xiongyining1480@phytium.com.cn>
References: <20240426072704.325883-1-xiongyining1480@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwCXaEyDVytmqGUAAA--.521S4
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAGBmYpXuMFaAAGsY
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw1fCF45Jw45uF4UGw4xXrb_yoW5CrW8pr
 4UKF9avrWUCrnIva1fW3W29FyYgw4Fqw4UAw42k3yrCwnxG34xXFs2vF9Ykr1UWr97uFyY
 9Fs7CFyFgayvyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ziutk/Dbx+tF

From: xiongyining1480 <xiongyining1480@phytium.com.cn>

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
this topology can be passed to the firmware through DT cpu-map.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Change-Id: Iac58c5a0cf6d30c9168c378d78c658c5e0a5116c
---
 docs/system/arm/sbsa.rst |  4 ++++
 hw/arm/sbsa-ref.c        | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

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
index f5709d6c14..5b2c32515d 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
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

