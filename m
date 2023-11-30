Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp272174ejb;
        Thu, 30 Nov 2023 06:36:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIVfF4Ehu7ZOXhNcoj3KH4/Y1dSGDBtvMoqUFr77bx+DuR5tdoUbuNFaLByRi+YMN9XxHr
X-Received: by 2002:a05:620a:2811:b0:77b:aafe:dca2 with SMTP id f17-20020a05620a281100b0077baafedca2mr28096767qkp.40.1701355006156;
        Thu, 30 Nov 2023 06:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701355006; cv=none;
        d=google.com; s=arc-20160816;
        b=Rv2tJjZCUuZi+uWKQ8lhP8UBpJanRJPlWeC++0Osca6vk0mJowv5Lu57dmNyUevybP
         +8QqljFGErftD72mQmFSkoA+/GFHYSYy9ys+doQ9WwUKnXM2gLmGH2a7OYu/Bu2Dc6iP
         XxXsVx9rl8zguqpTa5LZG0VFeXTlVbWAsw8wTs8TZUiHtCQbm0YlgTkkqUMJP7dg8uTS
         M29zxxwnR5LZtqqMzf2DuXaSBoDj8ObWTCVdbKBBnDvmGvMo1jOKcUp+LcK/ScHCT+ZH
         AqCDRVaoJMqk8XbJKGWrwGh2XCsyWqUNo/RIXwqJE2eTrtR9WhgAmEwfFMc8/zG1yxOA
         /MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z4L3nI7wR/SVhNHr/XVqJtZAzytK6Ic2h7XDN6tz6YM=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=MQfqlc0Xdl5doKs3PMij48RVThQbQlOJ3ThrmXvEpjPCood4ImWiz5MXtQF0GuB5es
         STQ7YM/2nxZ2LnBAQmlO7z/qXvRypAgNlITuovEP21q2T8CCwiZaD1xANBdW5diOWMkt
         tjIBB14VSC2LF8u3MlJ9qMrgnj1Sa9m55HV/XGc0+t7EdYQJs1/YD3JrQKyqvkGi8IBt
         5I0ePNY5Jz3Cyi7+j0XvVXx93tPg2Xu3ynlOzYUnfKM8zaEsebtjKryPPDT/DnAJI16N
         zEqP4sIgVQDgk6Tufvvp2TRigVGltd8mNScYip1KafrGKPUladN/2oJdkT4P2x3ioSRE
         YvVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=I2Zpp7Yf;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id p9-20020a05620a22a900b0077a2952b4a0si1103260qkh.696.2023.11.30.06.36.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:36:46 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=I2Zpp7Yf;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355005; x=1732891005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q0lEBoFOr9b0x5amAD6sBLj9mxt45Se06XmWgm72SHY=;
  b=I2Zpp7YfKafKc+4uvKI8wb5m2sbw2DBaNkKbjkebWHu6uP60+DGO6EiB
   hjRGH4Kq2qoPWZ2aREu+Ee9svZVtMHQm2XYaLqsC8Fr+IfmMQsegrjL7Q
   0BoqxjLrzcKPXRHCFVdH71eae8PvGqTijXkyBdJ5ycz4FCYMUDaXWw+9Z
   QepGwSLS0BsMQOImCKm10AvPZR5iUmXeHW7Xo+HRql/hYn5GB79fjZHdl
   Gr++MZLnFQjL+nWOhcQm80vOBrcDd3eqtxcMFsFVxUZtlnoenuZqs+eHl
   84fGA1prnqvmrWM8eex/NFp79c/6FahW32xdGQ8nqbJsqpYbOZlGTi32u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532781"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730530"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730530"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:33 -0800
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
Subject: [RFC 39/41] hw/i386: Add the interface to search parent for QOM topology
Date: Thu, 30 Nov 2023 22:42:01 +0800
Message-Id: <20231130144203.2307629-40-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: goK05fgIH8x2

From: Zhao Liu <zhao1.liu@intel.com>

QOM topology needs to search parent cpu-core for hotplugged CPU to
create topology child<> property in qdev_set_id().

This process is before x86_cpu_pre_plug(), thus place 2 helpers
x86_cpu_assign_apic_id() and x86_cpu_assign_topo_id() in
x86_cpu_search_parent_pre_plug() to help get the correct topology sub
indexes. Then x86_cpu_search_parent_pre_plug() searches the parent
cpu-core with these sub indexes.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c         | 128 +++++++++++++++++++++++++++++++++++++++---
 include/hw/i386/x86.h |   3 +
 2 files changed, 122 insertions(+), 9 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 04edd6de6aeb..595d4365fdd1 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -460,16 +460,18 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* if 'address' properties socket-id/core-id/thread-id are not set, set them
-     * so that machine_query_hotpluggable_cpus would show correct values
+    /*
+     * possible_cpus_qom_granu means the QOM topology support.
+     *
+     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
+     * i386 completes QOM topology support.
      */
-    /* TODO: move socket_id/core_id/thread_id checks into x86_cpu_realizefn()
-     * once -smp refactoring is complete and there will be CPU private
-     * CPUState::nr_cores and CPUState::nr_threads fields instead of globals */
-    x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
-    x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
-    if (*errp) {
-        return;
+    if (!mc->smp_props.possible_cpus_qom_granu) {
+        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+        x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
+        if (*errp) {
+            return;
+        }
     }
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
@@ -484,6 +486,114 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     numa_cpu_pre_plug(cpu_slot, dev, errp);
 }
 
+static int x86_cpu_get_topo_id_by_level(X86CPU *cpu,
+                                        CPUTopoLevel level)
+{
+    switch (level) {
+    case CPU_TOPO_THREAD:
+        return cpu->thread_id;
+    case CPU_TOPO_CORE:
+        return cpu->core_id;
+    case CPU_TOPO_DIE:
+        return cpu->die_id;
+    case CPU_TOPO_SOCKET:
+        return cpu->socket_id;
+    default:
+        g_assert_not_reached();
+    }
+
+    return -1;
+}
+
+typedef struct SearchCoreCb {
+    X86CPU *cpu;
+    CPUTopoState *parent;
+    int id;
+} SearchCoreCb;
+
+static int x86_cpu_search_parent_core(CPUTopoState *topo,
+                                      void *opaque)
+{
+    SearchCoreCb *cb = opaque;
+    CPUTopoLevel level = CPU_TOPO_LEVEL(topo);
+
+    cb->parent = topo;
+    cb->id = x86_cpu_get_topo_id_by_level(cb->cpu, level);
+
+    if (cb->id == topo->index) {
+        if (level == CPU_TOPO_CORE) {
+            return TOPO_FOREACH_END;
+        }
+        return TOPO_FOREACH_CONTINUE;
+    }
+    return TOPO_FOREACH_SIBLING;
+}
+
+Object *x86_cpu_search_parent_pre_plug(CPUTopoState *topo,
+                                       CPUTopoState *root,
+                                       Error **errp)
+{
+    int ret;
+    SearchCoreCb cb;
+    X86CPUTopoIDs topo_ids;
+    X86CPUTopoInfo topo_info;
+    X86CPU *cpu = X86_CPU(topo);
+    CPUSlot *slot = CPU_SLOT(root);
+    MachineState *ms = slot->ms;
+    DECLARE_BITMAP(foreach_bitmap, USER_AVAIL_LEVEL_NUM);
+
+    topo_info.dies_per_pkg = ms->smp.dies;
+    topo_info.cores_per_die = ms->smp.cores;
+    topo_info.threads_per_core = ms->smp.threads;
+
+    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
+        x86_cpu_assign_apic_id(ms, cpu, &topo_ids, &topo_info, errp);
+        if (*errp) {
+            return NULL;
+        }
+    } else {
+        /*
+         * if 'address' properties socket-id/core-id/thread-id are not set,
+         * set them so that machine_query_hotpluggable_cpus would show
+         * correct values.
+         *
+         * TODO: move socket_id/core_id/thread_id checks into
+         * x86_cpu_realizefn() once -smp refactoring is complete and there
+         * will be CPU private CPUState::nr_cores and CPUState::nr_threads
+         * fields instead of globals.
+         */
+        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+    }
+
+    x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
+    if (*errp) {
+        return NULL;
+    }
+
+    cb.cpu = cpu;
+    cb.parent = NULL;
+    cb.id = -1;
+    bitmap_fill(foreach_bitmap, USER_AVAIL_LEVEL_NUM);
+    clear_bit(CPU_TOPO_UNKNOWN, foreach_bitmap);
+    clear_bit(CPU_TOPO_THREAD, foreach_bitmap);
+
+    ret = cpu_topo_child_foreach_recursive(root, foreach_bitmap,
+                                           x86_cpu_search_parent_core, &cb);
+    if (ret != TOPO_FOREACH_END) {
+        g_autofree char *search_info = NULL;
+
+        search_info = !cb.parent ? g_strdup("") :
+            g_strdup_printf(" for %s level with id: %d",
+            cpu_topo_level_to_string(CPU_TOPO_LEVEL(cb.parent)), cb.id);
+        error_setg(errp, "Can't find parent%s", search_info);
+        return NULL;
+    }
+
+    /* Keep the index of CPU topology device the same as the thread_id. */
+    topo->index = cpu->thread_id;
+    return OBJECT(cb.parent);
+}
+
 CpuInstanceProperties
 x86_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 19e9f93fe286..e8c9ddc36359 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -104,6 +104,9 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx);
 const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms);
 CPUArchId *x86_find_cpu_slot(MachineState *ms, uint32_t id, int *idx);
 void x86_rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count);
+Object *x86_cpu_search_parent_pre_plug(CPUTopoState *topo,
+                                       CPUTopoState *root,
+                                       Error **errp);
 void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
                       DeviceState *dev, Error **errp);
 void x86_cpu_plug(HotplugHandler *hotplug_dev,
-- 
2.34.1
