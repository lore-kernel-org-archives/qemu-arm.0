Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp271443ejb;
        Thu, 30 Nov 2023 06:35:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1faSEjnuj81ZQ6mgWd1h5F8KAu61U+6fxSgqPDrlTYT9YIYwKFa6TNCSSGeLJxwqw2Drn
X-Received: by 2002:a0c:fe06:0:b0:67a:89ec:48a8 with SMTP id x6-20020a0cfe06000000b0067a89ec48a8mr889403qvr.7.1701354947198;
        Thu, 30 Nov 2023 06:35:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354947; cv=none;
        d=google.com; s=arc-20160816;
        b=OfZjxALbOP1A9954ATCQBnn41sta4zMP6sWPuQj0E9pjHtrXcM7MBu/8wRxKBo/t7q
         PrIIN4dYuAzPCxfEWszxIYZmZbUc5XmQhVbZDD2bTzvNPOhKGRZ+2N28WMPQRsRdJ5pR
         kH2OsmebulHw3TE3pnPET3ga2R0y+86tZktpV099rSN1PGwv+msjr0JoYtDk4LTe6G67
         rqx8a78/4yaz2doopHj+By/iyiZhsbeVzFOX4IoDORjlfmkcIiZIHoPrw/va3/DS26Ef
         HcJgOVbRLUkwNLisq5Mqgd0fB/l6PSAS84iZZ2Hx0U3gDOzAhwQtNvxi44B5hgU232MA
         1z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UqEymSnO2UJ/jOwqPdfEx0Diu6WiaJcggjFVME9na9o=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=Cm/qZ9qspJKihARBojxyBGH1Hyp7wRRDgEcCoH1gAvTGxwNOHe9kNq+kEHXn0M0p8R
         1wuzWxKjFMZlt4PjHexgIW7m8EmavquBp7K/mH6/qbzALdk9AsVySK8la/Fc2VuFpmm0
         BLlp2urc6CPSP4sW92pXebJsrapv5XYaDaK0d+XBNcPeaMkUyn/rTFDlIkYsVh9rJ08N
         jnC75KfP53s5A3hIn+P95O7AqYUa0FJWGwtJu+y5Gtwd+y/4i4Q5+VJvk3tT5md8u8sM
         9GuUaH5Hh4zUR3BumJ/E2vkPwhKUO8CAwfwfpNyI4KiteRimX0MpDtWI/n1LcN0uo9TJ
         1lIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Nw9Zwe69;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id cy4-20020a05621418c400b0067a535ed94asi1116138qvb.113.2023.11.30.06.35.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:35:47 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Nw9Zwe69;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354947; x=1732890947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMs3wimSwFi3OS/xT8fCJCLyivsPCu0OTNgeR6TOgP0=;
  b=Nw9Zwe69Mk+TS601A3YuuhAalgfKvFgpVCFb1nIq3+pqYPt0WlQCT0xm
   umeFpcCRZAXdCRhocduL+Zy0/iuFg+C6Zm+ewBg9woT1xr/ra5LJwHv4X
   KWQ0Uql02opxuXzfEyMS3mb85SwAp+mW/Ir1f83khKERRKRzjIKttS8v1
   z3KwKEWA0gNRNSuTQQlMjJ/SRzuXFMwVzzzqn5n6QAlIQIgaMoYpPEqTq
   ULj3wcbKW7bb/RXwTA6RRpztzAO3oewm2YCYRyU9xnk37LoP7KmCAY2Ou
   XBMdNpi0oBQtU5BOBZU4C7JFj8p3TiXeOD9z0/dqy3Rn+O2x1YkAbpF6m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532469"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532469"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730310"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730310"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:35 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 33/41] hw/machine: Validate smp topology tree without -smp
Date: Thu, 30 Nov 2023 22:41:55 +0800
Message-Id: <20231130144203.2307629-34-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rNftfz2HZklt

From: Zhao Liu <zhao1.liu@intel.com>

QOM topology allows user to create topology tree from cli without -smp,
in this case, validate the topology tree to meet the smp requirement.

Currently, for compatibility with MachineState.smp, initialize
MachineState.smp from topology tree in this case.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 146 +++++++++++++++++++++++++++++++++++++
 hw/core/machine.c          |  10 +++
 include/hw/core/cpu-slot.h |   1 +
 3 files changed, 157 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index ade155baf60b..45b6aef0750a 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -413,3 +413,149 @@ void machine_create_smp_topo_tree(MachineState *ms, Error **errp)
     }
     slot->smp_parsed = true;
 }
+
+static void set_smp_child_topo_info(CpuTopology *smp_info,
+                                    CPUTopoStat *stat,
+                                    CPUTopoLevel child_level)
+{
+    unsigned int *smp_count;
+    CPUTopoStatEntry *entry;
+
+    smp_count = get_smp_info_by_level(smp_info, child_level);
+    entry = get_topo_stat_entry(stat, child_level);
+    *smp_count = entry->max_units ? entry->max_units : 1;
+
+    return;
+}
+
+typedef struct ValidateCbData {
+    CPUTopoStat *stat;
+    CpuTopology *smp_info;
+    Error **errp;
+} ValidateCbData;
+
+static int validate_topo_children(CPUTopoState *topo, void *opaque)
+{
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo), next_level;
+    ValidateCbData *cb = opaque;
+    unsigned int max_children;
+    CPUTopoStatEntry *entry;
+    Error **errp = cb->errp;
+
+    if (level != CPU_TOPO_THREAD && !topo->num_children &&
+        !topo->max_children) {
+        error_setg(errp, "Invalid topology: the CPU topology "
+                   "(level: %s, index: %d) isn't completed.",
+                   cpu_topo_level_to_string(level), topo->index);
+        return TOPO_FOREACH_ERR;
+    }
+
+    if (level == CPU_TOPO_UNKNOWN) {
+        error_setg(errp, "Invalid CPU topology: unknown topology level.");
+        return TOPO_FOREACH_ERR;
+    }
+
+    /*
+     * Only CPU_TOPO_THREAD level's child_level could be CPU_TOPO_UNKNOWN,
+     * but machine_validate_cpu_topology() is before CPU creation.
+     */
+    if (topo->child_level == CPU_TOPO_UNKNOWN) {
+        error_setg(errp, "Invalid CPU topology: incomplete topology "
+                   "(level: %s, index: %d), no child?.",
+                   cpu_topo_level_to_string(level), topo->index);
+        return TOPO_FOREACH_ERR;
+    }
+
+    /*
+     * Currently hybrid topology isn't supported, so only SMP topology
+     * is allowed.
+     */
+
+    entry = get_topo_stat_entry(cb->stat, topo->child_level);
+
+    /* Max threads per core is pre-configured by "nr-threads". */
+    max_children = topo->child_level != CPU_TOPO_THREAD ?
+                   topo->num_children : topo->max_children;
+
+    if (entry->max_units != max_children) {
+        error_setg(errp, "Invalid SMP topology: "
+                   "The %s topology is asymmetric.",
+                   cpu_topo_level_to_string(level));
+        return TOPO_FOREACH_ERR;
+    }
+
+    next_level = find_next_bit(cb->stat->curr_levels, USER_AVAIL_LEVEL_NUM,
+                               topo->child_level + 1);
+
+    if (next_level != level) {
+        error_setg(errp, "Invalid smp topology: "
+                   "asymmetric CPU topology depth.");
+        return TOPO_FOREACH_ERR;
+    }
+
+    set_smp_child_topo_info(cb->smp_info, cb->stat, topo->child_level);
+
+    return TOPO_FOREACH_CONTINUE;
+}
+
+/*
+ * Only check the case user configures CPU topology via -device
+ * without -smp. In this case, MachineState.smp also needs to be
+ * initialized based on topology tree.
+ */
+bool machine_validate_cpu_topology(MachineState *ms, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUTopoState *slot_topo = CPU_TOPO(ms->topo);
+    CPUTopoStat *stat = &ms->topo->stat;
+    CpuTopology *smp_info = &ms->smp;
+    unsigned int total_cpus;
+    ValidateCbData cb;
+
+    if (ms->topo->smp_parsed) {
+        return true;
+    } else if (!slot_topo->num_children) {
+        /*
+         * If there's no -smp nor -device to add topology children,
+         * then create the default topology.
+         */
+        machine_create_smp_topo_tree(ms, errp);
+        if (*errp) {
+            return false;
+        }
+        return true;
+    }
+
+    if (test_bit(CPU_TOPO_CLUSTER, stat->curr_levels)) {
+        mc->smp_props.has_clusters = true;
+    }
+
+    /*
+     * The next cpu_topo_child_foreach_recursive() doesn't cover the
+     * parent topology unit. Update information for root here.
+     */
+    set_smp_child_topo_info(smp_info, stat, slot_topo->child_level);
+
+    cb.stat = stat;
+    cb.smp_info = smp_info;
+    cb.errp = errp;
+
+    cpu_topo_child_foreach_recursive(slot_topo, NULL,
+                                     validate_topo_children, &cb);
+    if (*errp) {
+        return false;
+    }
+
+    ms->smp.cpus = stat->pre_plugged_cpus ?
+                   stat->pre_plugged_cpus : 1;
+    ms->smp.max_cpus = stat->max_cpus ?
+                       stat->max_cpus : 1;
+
+    total_cpus = ms->smp.drawers * ms->smp.books *
+                 ms->smp.sockets * ms->smp.dies *
+                 ms->smp.clusters * ms->smp.cores *
+                 ms->smp.threads;
+    g_assert(total_cpus == ms->smp.max_cpus);
+
+    return true;
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0c1739814124..5fa0c826f35e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1505,6 +1505,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
                                    "on", false);
     }
 
+    /*
+     * TODO: drop this check and validate topology tree by default
+     * when all arches support QOM topology.
+     */
+    if (machine_class->smp_props.possible_cpus_qom_granu) {
+        if (!machine_validate_cpu_topology(machine, errp)) {
+            return;
+        }
+    }
+
     accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index de3d08fcb2ac..9e1c6d6b7ff2 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -100,5 +100,6 @@ struct CPUSlot {
 
 void machine_plug_cpu_slot(MachineState *ms);
 void machine_create_smp_topo_tree(MachineState *ms, Error **errp);
+bool machine_validate_cpu_topology(MachineState *ms, Error **errp);
 
 #endif /* CPU_SLOT_H */
-- 
2.34.1
