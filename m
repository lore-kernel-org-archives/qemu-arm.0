Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D41AEC1114
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMj-0005MI-MQ; Mon, 23 Feb 2026 12:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLD-0002uU-LV
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL8-0000Qs-06
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so26663905e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866196; x=1772470996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mcNmYKDo1AyTBqKWkeuzf3y95VGP3Xb6elYJJZdrymY=;
 b=Lqw9RkMTnO/iJLUNOj5EV/tON4t6DPvUzAd58+uuM+W0AQhO0YMGw+qpe1GKi5NxuG
 0XwsqlMzTJeNd1m0Xt37vCVM6gELFCHU+Y1EJOysaSB6ZtW2pfWMtSDAtglYGSrG7nQ3
 ZvSb6LfzJM+Fa/zMiQo46nbQSETeq1KdUGBrL3o+XIGo+WHHSAt2UOkdRH18Dq+EHOW7
 Frvd4DFqFRRZuzW+Hem3JS7JvyNDSe1UyE7cXWfvMSjKnl7NLJ8pjZ8gCSh5e9V6UMdT
 7lLWhgG3E0uALPKfjZVKiC0Va93Uyy2V82lDX9RKGpYbsC+Z/Ohn7IU43e97lcBgiFe4
 +33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866196; x=1772470996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mcNmYKDo1AyTBqKWkeuzf3y95VGP3Xb6elYJJZdrymY=;
 b=UBF+9jNqA0bO0pFHd/sOkMtcwERFMocbyUWP9tuPPVCGVAnc0nFbm3wLRjW5LHxEu5
 +zIlCpVx+5IedJ/sjMvW/hobhbGAJ9E8ZACU9fET+Q74BC9rOH6YpRUHxRMtUNOmBMOM
 i0hckizIsdViaJ/UQC12S6Ze+5FsRf+RGjyNu8d6j95FJgnmY7HBC4NjBFCGjVFQXdZb
 6arY2s54DWNgPMJ8RADw4Bv3/eGW8516Is9ouzPRQvMym9i2Lq4xnrht7XbXm3GPWFXm
 eYfRvnr1vz/gJDVN1ja8QyVA6DZSrn29hamA4mRuoDrQIR1wxynZ5NG5hhA4VWvXAWcg
 JUDQ==
X-Gm-Message-State: AOJu0YxXyJxJNopVi7hmOxkNTkBuLknCzw5MZpSnxUw8RdwVNlatZM2v
 Eg6CbwTso+hOY03W/Us+L6mSAY0g9CCS6qJxTfR2MdlG2cH728me+VQMG+mLObH6dDsVPe5lnGJ
 88h75
X-Gm-Gg: AZuq6aLYmCEEt1g1LBh4DK6cj4UDWG/HHhlhx0vdNMG/lNyVdvcptFBfQWD5gKTQOX2
 nQHsh3d39ju98+gbr/OBbcNT2+JAmIsZ+qSc+cHohiU/9PYm3g1fHj4lIex1F42mBka2Mv97GYq
 AYi4IfH8oDqWPq+UexE1mDkIHVmG2Rt73Ta4OSjV/PxDaaJReXLbK1q4DL7pTUUmuhxPS9W/Jl1
 FJ9aJe/dg6vNzUHokDVjbe4eTsumni8jmlno6U2BCXR18P7xxnEgb34j6i4aWNdElFJkFiiVz0k
 8VA7mMAt1oDMRCBijgqhzcGBnOWpoBQYBKZWVkTNTFqnv7dUNX8wWnrGyTgJA4BDgV5Kgu2snA6
 7kyCiebzL48Ef0AcuBo7i7uoMs+IzXEJSJje05v0VM5al7TSJOIDDHr3MdeUlaIdxu3NeI1TrYN
 vR/2A63oxYh7uLbSoMy41saNY83RMQsrDzkjS7GqaLHYGjG0KkDl8+f90wnGZLGkvwljMF6FY3J
 wxdrkK7XYUM/so5sSbpZWtorlZFtlk=
X-Received: by 2002:a05:600c:314a:b0:47e:e2eb:bc22 with SMTP id
 5b1f17b1804b1-483a95b3e62mr166806815e9.5.1771866196245; 
 Mon, 23 Feb 2026 09:03:16 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 56/65] hw/arm/virt: Remember CPU phandles rather than looking
 them up by name
Date: Mon, 23 Feb 2026 17:02:03 +0000
Message-ID: <20260223170212.441276-57-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In fdt_add_cpu_nodes(), we currently add phandles for each CPU node
if we are going to add a topology description, and when we do, we
re-look-up the phandle by node name when creating the topology
description.

For GICv5 we will also want to refer to the CPU phandles; so always
add a phandle, and keep track of those phandles in the
VirtMachineState so we don't have to look them up by name in the dtb
every time.

The phandle property is extra data in the final DTB, but only a tiny
amount, so it's not worth trying to carefully track the conditions
when we're going to need them so we only emit them when required.

(We need to change the smp_cpus variable to unsigned because
otherwise gcc thinks that we might be passing a negative number to
g_new0() and produces an error:

/usr/include/glib-2.0/glib/gmem.h:270:19: error: argument 1 range [18446744071562067968, 18446744073709551615] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
  270 |             __p = g_##func##_n (__n, __s);                      \
      |                   ^~~~~~~~~~~~~~~~~~~~~~~
/usr/include/glib-2.0/glib/gmem.h:332:57: note: in expansion of macro ‘_G_NEW’
  332 | #define g_new0(struct_type, n_structs)                  _G_NEW (struct_type, n_structs, malloc0)
      |                                                         ^~~~~~
../../hw/arm/virt.c:469:25: note: in expansion of macro ‘g_new0’
  469 |     vms->cpu_phandles = g_new0(uint32_t, smp_cpus);
      |                         ^~~~~~

)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 19 ++++++++++---------
 include/hw/arm/virt.h |  1 +
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8dc999712c..0d1032967c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -432,13 +432,13 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
     }
 }
 
-static void fdt_add_cpu_nodes(const VirtMachineState *vms)
+static void fdt_add_cpu_nodes(VirtMachineState *vms)
 {
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
     const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = ms->smp.cpus;
 
     /*
      * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
@@ -466,10 +466,13 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", addr_cells);
     qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
 
+    vms->cpu_phandles = g_new0(uint32_t, smp_cpus);
+
     for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
         CPUState *cs = CPU(armcpu);
+        uint32_t phandle;
 
         qemu_fdt_add_subnode(ms->fdt, nodename);
         qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "cpu");
@@ -494,10 +497,9 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
-        if (!vmc->no_cpu_topology) {
-            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
-                                  qemu_fdt_alloc_phandle(ms->fdt));
-        }
+        phandle = qemu_fdt_alloc_phandle(ms->fdt);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", phandle);
+        vms->cpu_phandles[cpu] = phandle;
 
         g_free(nodename);
     }
@@ -522,7 +524,6 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
         qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
 
         for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
-            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
             char *map_path;
 
             if (ms->smp.threads > 1) {
@@ -540,10 +541,10 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                     cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
-            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
+            qemu_fdt_setprop_cell(ms->fdt, map_path, "cpu",
+                                  vms->cpu_phandles[cpu]);
 
             g_free(map_path);
-            g_free(cpu_path);
         }
     }
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 8069422769..6b4691761e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -171,6 +171,7 @@ struct VirtMachineState {
     uint32_t gic_phandle;
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
+    uint32_t *cpu_phandles;
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *gic;
-- 
2.43.0


