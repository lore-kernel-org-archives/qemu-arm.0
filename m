Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85850dlb;
        Wed, 18 Sep 2024 22:56:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEAg4GCY89Oodg88fINJDzSvGT2NsXP7iF9N9gbtjsRrd9hKf7vvKTG2+xfNTNRC/wpiylJfMBY7pcaw==@linaro.org
X-Google-Smtp-Source: AGHT+IH/doYt68toBGb1dEZWd9VxLGSyPeEEmoWypYVONyxD2UYZlLG0TWTZPXtJRRrp2MdJnWBu
X-Received: by 2002:a05:6214:5983:b0:6c5:13f0:e2bf with SMTP id 6a1803df08f44-6c5735624c9mr400743146d6.19.1726725368654;
        Wed, 18 Sep 2024 22:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725368; cv=none;
        d=google.com; s=arc-20240605;
        b=cZ3ocLLwZaECXcNpYYxW3cbnU+Dq+5asOOTzfctiIlPzHXFEd0d+cYRxDYEbFjrxl7
         iRx8ZlUCiGuuN+motBjwrhhBguSgbDIlombTh6CZyJQ9B/zd4ngVozdv0yBnBH4StACf
         nclNtmJCPyBA+pgN79yS8ebhDf6aRe3H3yE+seSPRbhUkvINgw3Gjm5qpahszIoXkAdf
         Hfv3xIH4SH+mrlCmbZlVxTaCABE7LePkTx2cF1AKvIc+C+gIiRzpn/nRdxA6NWVvwLhu
         ZoXcAJkjBT/EYnR3pcbCaIakbP/xaJfr7unNiiWhByhh7PW32atfsNQORuObLWOTuUEo
         Imkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xXR3XGGYXWS+TpLAPs/Qt834zvnQSu+nJ0ihF3QdWh8=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=a/WO3Vz3E2wfdJnAS9/WwbUdNjBvGOeqByvvkHJdptGkp9IH/K3WvUgiY3ujGD/nHa
         z/eufLFMiiSl0lA83R7VLWKyOS+kzNItFATEe0RyUMUAos/0gg6pomkx/tLKYSUF0cmw
         OJR8wqVnYy+2mBWRIfT78K2qPGkIBSyPHpialrxDyN0FRcbG/uc74AfWsZToObIcmG4k
         HcY0o1IA+pXyx47gDYwH0v+FEKNR8IHGLsfa/21Y4RsAnc/5iugpwwhWy1w0z2DfHBOR
         N0mYLyYXxUCGBUZahnIFCQzFeKv3u4HgnzXDywCGA9Oz9bHd74k/cFN7ox/am4uanx6u
         vy9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gLMNdSB+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e561fefsi11380346d6.306.2024.09.18.22.56.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gLMNdSB+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725369; x=1758261369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8gzS+6OwF3KgPtXFuFeQ8LrUaVl5pHIgZpajPFYb5x4=;
  b=gLMNdSB+hEjWahiu/nabJN0euvoI5jMBX8n5tMX7TEU5iYlc0SUCfxYp
   OLenCyHTqGxkojVqLCJIovgaJ+71btDV9rroNXvqAp5WOC7V/pwBJop1D
   Kd7zEn1Yk+EGxYsHE86axjVwrGxLL9gMHGH7q94orkEwpPxJqEr7QjqCr
   O7Hp7eStwTuq0d0OhBxXOrJGCP2Z2uEwrIH9jy59SfilR9n+T9yIZSMsE
   ODjizIk9ZiwqBK11S6Wvj6R+mQOYHBLt/sQrlBWH9gYN77dxY+IuBnopW
   PDr56AYr9jbqU6p9mrRoyYNbcL96cwYhVijnAhSZvU40Ik4/uc8HI09XB
   Q==;
X-CSE-ConnectionGUID: +Y1Sff2dQYa/DbHFMliIWA==
X-CSE-MsgGUID: vYzbtQtGRFGuErrzH6ZAow==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813604"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:07 -0700
X-CSE-ConnectionGUID: gUHshS+6Qa+f/5DU/ygquA==
X-CSE-MsgGUID: cvkL99LVRG6pb7HnWQ57VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418731"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:01 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sergio Lopez <slp@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 06/12] hw/cpu: Constrain CPU topology tree with max_limit
Date: Thu, 19 Sep 2024 14:11:22 +0800
Message-Id: <20240919061128.769139-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SjtyEqBXqU2C

Apply max_limit to CPU topology and prevent the number of topology
devices from exceeding the max limitation configured by user.

Additionally, ensure that CPUs created from the CLI via custom topology
meet at least the requirements of smp.cpus. This guarantees that custom
topology will always have CPUs.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine.c         |  4 ++++
 hw/cpu/cpu-slot.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/cpu/cpu-slot.h |  1 +
 include/hw/qdev-core.h    |  5 +++++
 4 files changed, 42 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index dedabd75c825..54fca9eb7265 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1684,6 +1684,10 @@ void machine_run_board_post_init(MachineState *machine, Error **errp)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
 
+    if (!machine_validate_topo_tree(machine, errp)) {
+        return;
+    }
+
     if (machine_class->post_init) {
         machine_class->post_init(machine);
     }
diff --git a/hw/cpu/cpu-slot.c b/hw/cpu/cpu-slot.c
index 2d16a2729501..f2b9c412926f 100644
--- a/hw/cpu/cpu-slot.c
+++ b/hw/cpu/cpu-slot.c
@@ -47,6 +47,7 @@ static void cpu_slot_device_realize(DeviceListener *listener,
 {
     CPUSlot *slot = container_of(listener, CPUSlot, listener);
     CPUTopoState *topo;
+    int max_children;
 
     if (!object_dynamic_cast(OBJECT(dev), TYPE_CPU_TOPO)) {
         return;
@@ -54,6 +55,13 @@ static void cpu_slot_device_realize(DeviceListener *listener,
 
     topo = CPU_TOPO(dev);
     cpu_slot_add_topo_info(slot, topo);
+
+    if (dev->parent_bus) {
+        max_children = slot->stat.entries[GET_CPU_TOPO_LEVEL(topo)].max_limit;
+        if (dev->parent_bus->num_children == max_children) {
+            qbus_mark_full(dev->parent_bus);
+        }
+    }
 }
 
 static void cpu_slot_del_topo_info(CPUSlot *slot, CPUTopoState *topo)
@@ -79,6 +87,10 @@ static void cpu_slot_device_unrealize(DeviceListener *listener,
 
     topo = CPU_TOPO(dev);
     cpu_slot_del_topo_info(slot, topo);
+
+    if (dev->parent_bus) {
+        qbus_mask_full(dev->parent_bus);
+    }
 }
 
 DeviceListener cpu_slot_device_listener = {
@@ -443,3 +455,23 @@ bool machine_parse_custom_topo_config(MachineState *ms,
 
     return true;
 }
+
+bool machine_validate_topo_tree(MachineState *ms, Error **errp)
+{
+    int cpus;
+
+    if (!ms->topo || !ms->topo->custom_topo_enabled) {
+        return true;
+    }
+
+    cpus = ms->topo->stat.entries[CPU_TOPOLOGY_LEVEL_THREAD].total_instances;
+    if (cpus < ms->smp.cpus) {
+        error_setg(errp, "machine requires at least %d online CPUs, "
+                   "but currently only %d CPUs",
+                   ms->smp.cpus, cpus);
+        return false;
+    }
+
+    /* TODO: Add checks for other levels to honor more -smp parameters. */
+    return true;
+}
diff --git a/include/hw/cpu/cpu-slot.h b/include/hw/cpu/cpu-slot.h
index 8d7e35aa1851..f56a0b08dca4 100644
--- a/include/hw/cpu/cpu-slot.h
+++ b/include/hw/cpu/cpu-slot.h
@@ -84,5 +84,6 @@ int get_max_topo_by_level(const MachineState *ms, CpuTopologyLevel level);
 bool machine_parse_custom_topo_config(MachineState *ms,
                                       const SMPConfiguration *config,
                                       Error **errp);
+bool machine_validate_topo_tree(MachineState *ms, Error **errp);
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index ddcaa329e3ec..3f2117e08774 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1063,6 +1063,11 @@ static inline void qbus_mark_full(BusState *bus)
     bus->full = true;
 }
 
+static inline void qbus_mask_full(BusState *bus)
+{
+    bus->full = false;
+}
+
 void device_listener_register(DeviceListener *listener);
 void device_listener_unregister(DeviceListener *listener);
 
-- 
2.34.1
