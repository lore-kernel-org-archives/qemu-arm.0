Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp86025dlb;
        Wed, 18 Sep 2024 22:56:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5iHhG5vXPxDNCSTrmu5KlDC5A1R3CUFb3L1axhfLki9EoDWE3vLkQU+IQd6KyZ6/qssI0UtTMlnP8QQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGY2TSKHqk5Q1yXLYkyEEiFy0AsyAiLtbFdcxIty1TnQkpALiI4YcdbqBHFIqo5Z53tTUYh
X-Received: by 2002:ac8:7d02:0:b0:458:3ac9:11ed with SMTP id d75a77b69052e-45b1609a3dcmr32343861cf.25.1726725408735;
        Wed, 18 Sep 2024 22:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725408; cv=none;
        d=google.com; s=arc-20240605;
        b=JGp2AsixqjV9t34+bTJ7weqzCzY+SsgO5WdaUpx1J8C+AY2HE4ogspNJTgBPkSv/K6
         8Bd7KKp/9/+6nWpaVxmrQsl9ruDMJ/81dpm0+rE7MeBvBCCbGDyYUaUheELeUpDGwtGP
         /r3GN+HJaIIEIkidE+d4Y5A/YKESnQQ47OinZn3lk77dv2z5sgTkHHe5t41uD0R/jkUu
         byzYKYodZNhrPprbuONcRRp4bJyoXsgTPbqmgV2anDRhahj7Bpn7mHe483fwfNh/qPFA
         rMgAZZnCbgLskLNDXUSX5CYWGyjcaatDnGtJnlZlle6l/SyI9+PjH4A1uKEymnbJlLL0
         k+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jYgY0be/ZfMboV1+zQaGeOUzGOdOxSNvqP3OXcgmMng=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=JOsUbF2L8rzI3eXjRNLlXYapnoeVAp3fz853tWfOQ95uNcJHXIA+Bz1d5aiHRDhGPP
         QKuRXEhxobrZ8/XwN32ciVt3h853dHLi0KhKSFK7aOHkySCyvmE1AEx/LSicqvH5Ns6d
         BIO9v4QSuOn59LjU4CBNeY7CgwfHBCUDJGBFxYBA2JldB2IzpS/Af84X/xF+Hbsy5sdD
         KmfjPMT2zXU4X2+p+yl8zhLYwDQTRVSVVshVxx9RatgKH/ZSmHa2HKaGXaUlDWa4kgEI
         5d7/7yIqfMg0kUOh/9prc7tEUg2JvV9P6Pe0QXlRH4WGPHGhWQCN23erP4DGjPGKmxhm
         WwWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SwTwys4l;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b17878befsi11303901cf.163.2024.09.18.22.56.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SwTwys4l;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725409; x=1758261409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQ08ivvbyToxE/NhN3+dCAQERQMlDYEq9vSrgiTrea4=;
  b=SwTwys4lQdupoEm7YRdBLe6RnhtPjAoysi8gt1QBkmwXZ5D//FRnup/8
   GOVs6UQm8yMcRQlYuZfKFQU4evY/AOsB0tx/fB0KnkHDAIHpxly2pv9ST
   9sSjhGy32LGAIT8/lOVYovtPRc6dUIaKQ6pb25WfSR8Q7/n3e6QQ0YG8w
   MoWqh7ikvV+ARBasRc3tHmzKvv1P+Ihuy3llydZn97ix/xDpHJtNYqZqT
   aN/+5G+F0Ql59upV8b1JVNDXE9vvppLpg6Cl4s+i9wo/Pf9lp0+h3gqiz
   +AYZ340cubu5uLgyXa3jv6eVmmWTCXrht8dQOJVBF55TStN+K9OaZry83
   g==;
X-CSE-ConnectionGUID: +qqg7egVTm6ioydQIoftlg==
X-CSE-MsgGUID: OySC4nPVTPihg1brt+cENA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813792"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813792"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:47 -0700
X-CSE-ConnectionGUID: rMNYl1sATnOo2bqgjGFlQw==
X-CSE-MsgGUID: V3LeJGc2RIC+vnG1nDqGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418845"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:41 -0700
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
Subject: [RFC v2 12/12] i386: Support custom topology for microvm, pc-i440fx and pc-q35
Date: Thu, 19 Sep 2024 14:11:28 +0800
Message-Id: <20240919061128.769139-13-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xG105WcuCN4b

With custom topology enabling, user could configure hyrid CPU topology
from CLI.

For example, create a Intel Core (P core) with 2 threads and 2 Intel
Atom (E core) with single thread for PC machine:

-smp maxsockets=1,maxdies=1,maxmodules=2,maxcores=2,maxthreads=2
-machine pc,custom-topo=on \
-device cpu-socket,id=sock0 \
-device cpu-die,id=die0,bus=sock0 \
-device cpu-module,id=mod0,bus=die0 \
-device cpu-module,id=mod1,bus=die0 \
-device x86-intel-core,id=core0,bus=mod0 \
-device x86-intel-atom,id=core1,bus=mod1 \
-device x86-intel-atom,id=core2,bus=mod1 \
-device host-x86_64-cpu,id=cpu0,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=0 \
-device host-x86_64-cpu,id=cpu1,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=1 \
-device host-x86_64-cpu,id=cpu2,socket-id=0,die-id=0,module-id=1,core-id=0,thread-id=0 \
-device host-x86_64-cpu,id=cpu3,socket-id=0,die-id=0,module-id=1,core-id=1,thread-id=0

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/microvm.c    | 1 +
 hw/i386/pc_piix.c    | 1 +
 hw/i386/pc_q35.c     | 1 +
 hw/i386/x86-common.c | 6 ++++++
 4 files changed, 9 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index dc9b21a34230..bd03b6946e6c 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -671,6 +671,7 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     mc->reset = microvm_machine_reset;
 
     mc->post_init = microvm_machine_state_post_init;
+    mc->smp_props.custom_topo_supported = true;
 
     /* hotplug (for cpu coldplug) */
     mc->get_hotplug_handler = microvm_get_hotplug_handler;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c1db2f3129cf..9c696a226858 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -473,6 +473,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->no_floppy = !module_object_class_by_name(TYPE_ISA_FDC);
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
     m->post_init = pc_post_init1;
+    m->smp_props.custom_topo_supported = true;
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 9ce3e65d7182..9241366ff351 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -356,6 +356,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 4096;
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
     m->post_init = pc_q35_post_init;
+    m->smp_props.custom_topo_supported = true;
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index 58591e015569..2995eed5d670 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -195,6 +195,12 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     }
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
+
+    /* Leave user to add CPUs. */
+    if (ms->topo->custom_topo_enabled) {
+        return;
+    }
+
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, i, possible_cpus->cpus[i].arch_id, &error_fatal);
     }
-- 
2.34.1
