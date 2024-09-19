Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85962dlb;
        Wed, 18 Sep 2024 22:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/2mPu42vk7eeud52q3VXIML4MJL9vgE/FDocHoVEk4zBvKC+dYnFL4uZEDMC5ntueNC62jqayCdk2yQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFusX1pj48O5S/iowW+Pczj8qqFK8NT+ZH3oq+daLHwBqlPYZdMEXkQ7K3q7OYNx/2wT7JG
X-Received: by 2002:a05:622a:5291:b0:458:38cf:410e with SMTP id d75a77b69052e-4599d23e041mr312201271cf.22.1726725393364;
        Wed, 18 Sep 2024 22:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725393; cv=none;
        d=google.com; s=arc-20240605;
        b=VD3T4N5ruRxLlWQTnIhDI57Pprgamrdg9xrZ+miBwHPg2s/fboa7ZwmwsrpLaGl5+4
         MpyXbtm42nBQGHnanH7EQ4j+i5d0o/fVAXQOLQ5LvW2IUea+U2BqXegzGBR+MKrN9s3F
         aDSmlG+feLPB+8fVuLEvL8vsKtC2JOso9yEEZVuuOn70byhy2zN1eFHPCq1LU66d8Y2M
         or1REo8CnQVzhyZIuQI7sNbYWfr7uxtC3V9jX7VvSppH2jPG+as41tIT5M2PwmJcz3g/
         y8BpTpoR5vGiraCXaaMkwUbzh2nmGQpwQMuLULQR3zp7FYMyVeH8sxMr3piA1N/9+Ifl
         UcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=20L2I9dJeIUR4ipJmLf1bLAHmxNtJN354pCYXA9cWDc=;
        fh=b+BiU4QRHZ3tlOavRLXGRtYOC8dzKcwvsuHv4suMOjE=;
        b=LTcPxw9Nf50CtdYRE83SdmaCx87AhSuMA33zVCpfuD4g5EyOJwuAh3x1XTh0yEVdY1
         v6CoWr0mUA2mPxvxTXt6+eKOyfB+rkh3s0mJfGumWk7BJ0qVtP1bWLEmzHmrFUPLd5mq
         umNK95i94HA2yuNK2Li5cz0fvzXJO7QNe72hM7SwUsQqWhScuyX0RpC/IPd9Zz6OI9hD
         wLQZWd5787R4303UMRAKpPe8u0bokh9tP7uiIFtpp5D6krY+930Or2Xva0U5/ofoQZqe
         AONVvPg+qcZHitjO/2/3pwggSxEVPHy3z8IuYQOiXsvjJ3BEhLurp6UGV7Nh/2zvVjAI
         pCig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DTFAEm5d;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e561fefsi11380346d6.306.2024.09.18.22.56.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DTFAEm5d;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725393; x=1758261393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oni1QkPfkrICnCBlh4UeJn1VwjE0CfJhi05hbONHUs0=;
  b=DTFAEm5ddw+fYAPze0C+t50KPF/nvDuL1J4fR/+a651FYDQvY10coPJW
   lJ7ArFOdc8z1uJPzipEDx4uAWzsJJknpu+LejoGKVADBaRSh0Z52EQ+ai
   oJFt6il4gqEHrfrciVMGImBoPfee9s0J/m28vRVvpnMnMCEvSGhNKYx/4
   3NWf2U9ux+z35xA6l/+HSzkLFdhbpyJfFaBAmRqIysahrtb9wZ2rjx+ec
   8/o9wWK2R0XsIGPQPjdu8EM7YNa1cmNS8w18S/COoxl6WdWb+gL22K1XC
   tCP6nafwlrIfvr2S65HydqMOnz4Rr+tafqK770Hn7nAvFGMTCnceFSL6X
   Q==;
X-CSE-ConnectionGUID: Myv/BSwkQ2C+xdsb6ILiZg==
X-CSE-MsgGUID: CSl87LzfRgW17byQdemprQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813712"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:32 -0700
X-CSE-ConnectionGUID: Sel7rERnT/aTpdzbHPcXrg==
X-CSE-MsgGUID: dLracHQoTbOgKrV0muLpCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418804"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:26 -0700
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
	Zhao Liu <zhao1.liu@intel.com>,
	Zhuocheng Ding <zhuocheng.ding@intel.com>
Subject: [RFC v2 10/12] i386/cpu: Support Intel hybrid CPUID
Date: Thu, 19 Sep 2024 14:11:26 +0800
Message-Id: <20240919061128.769139-11-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aH0H6s+Ymh8n

For hybrid cpu topology, Intel exposes these CPUIDs [1]:
1. Set CPUID.07H.0H:EDX.Hybrid[bit 15]. With setting as 1, the processor
   is identified as a hybrid part.
2. Have CPUID.1AH leaf. Set core type and native model ID in
   CPUID.1AH:EAX. Because the native model ID is currently useless for
   the software, no need to emulate.

For hybrid related CPUIDs, especially CPUID.07H.0H:EDX.Hybrid[bit 15],
there's no need to expose this feature in feature_word_info[] to allow
user to set directly, because hybrid features depend on the specific
core type information, and this information needs to be gathered
together with hybrid cpu topology.

[1]: SDM, vol.2, Ch.3, 3.2 Instructions (A-L), CPUID-CPU Identification

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |  5 ++++
 2 files changed, 63 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fb54c2c100a0..2f0e7f3d5ad7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/cutils.h"
 #include "qemu/qemu-print.h"
 #include "qemu/hw-version.h"
+#include "core.h"
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
 #include "sysemu/hvf.h"
@@ -743,6 +744,10 @@ static CPUCacheInfo legacy_l3_cache = {
 #define INTEL_AMX_TMUL_MAX_K           0x10
 #define INTEL_AMX_TMUL_MAX_N           0x40
 
+/* CPUID Leaf 0x1A constants: */
+#define INTEL_HYBRID_TYPE_ATOM         0x20
+#define INTEL_HYBRID_TYPE_CORE         0x40
+
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3)
 {
@@ -6580,6 +6585,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 *ecx |= CPUID_7_0_ECX_OSPKE;
             }
             *edx = env->features[FEAT_7_0_EDX]; /* Feature flags */
+
+            if (env->parent_core_type != COMMON_CORE &&
+                (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+                *edx |= CPUID_7_0_EDX_HYBRID;
+            }
         } else if (count == 1) {
             *eax = env->features[FEAT_7_1_EAX];
             *edx = env->features[FEAT_7_1_EDX];
@@ -6800,6 +6810,31 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         break;
     }
+    case 0x1A:
+        /* Hybrid Information Enumeration */
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        if (env->parent_core_type != COMMON_CORE &&
+            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+            /*
+             * CPUID.1AH:EAX.[bits 23-0] indicates "native model ID of the
+             * core". Since this field currently is useless for software,
+             * no need to emulate.
+             */
+            switch (env->parent_core_type) {
+            case INTEL_ATOM:
+                *eax = INTEL_HYBRID_TYPE_ATOM << 24;
+                break;
+            case INTEL_CORE:
+                *eax = INTEL_HYBRID_TYPE_CORE << 24;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        }
+        break;
     case 0x1D: {
         /* AMX TILE, for now hardcoded for Sapphire Rapids*/
         *eax = 0;
@@ -7459,6 +7494,14 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
             }
         }
 
+        /*
+         * Intel CPU topology with hybrid cores support requires CPUID.1AH.
+         */
+        if (env->parent_core_type != COMMON_CORE &&
+            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1A);
+        }
+
         /*
          * Intel CPU topology with multi-dies support requires CPUID[0x1F].
          * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
@@ -7650,6 +7693,20 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    /*
+     * TODO: Introduce parent_pre_realize to make sure topology device
+     * can realize first.
+     */
+    if (dev->parent_bus && dev->parent_bus->parent) {
+        DeviceState *parent = dev->parent_bus->parent;
+        X86CPUCore *core =
+            (X86CPUCore *)object_dynamic_cast(OBJECT(parent),
+                                              TYPE_X86_CPU_CORE);
+        if (core) {
+            env->parent_core_type = X86_CPU_CORE_GET_CLASS(core)->core_type;
+        }
+    }
+
     /*
      * Process Hyper-V enlightenments.
      * Note: this currently has to happen before the expansion of CPU features.
@@ -8048,6 +8105,7 @@ static void x86_cpu_initfn(Object *obj)
     CPUX86State *env = &cpu->env;
 
     x86_cpu_init_default_topo(cpu);
+    env->parent_core_type = COMMON_CORE;
 
     object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
                         x86_cpu_get_feature_words,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index afe2b5fd3382..38236df547e6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -21,6 +21,7 @@
 #define I386_CPU_H
 
 #include "sysemu/tcg.h"
+#include "core.h"
 #include "cpu-qom.h"
 #include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
@@ -920,6 +921,8 @@ uint64_t x86_cpu_get_supported_feature_word(X86CPU *cpu, FeatureWord w);
 #define CPUID_7_0_EDX_AVX512_VP2INTERSECT (1U << 8)
 /* SERIALIZE instruction */
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
+/* Hybrid */
+#define CPUID_7_0_EDX_HYBRID            (1U << 15)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* Architectural LBRs */
@@ -1996,6 +1999,8 @@ typedef struct CPUArchState {
 
     /* Bitmap of available CPU topology levels for this CPU. */
     DECLARE_BITMAP(avail_cpu_topo, CPU_TOPOLOGY_LEVEL__MAX);
+
+    X86CoreType parent_core_type;
 } CPUX86State;
 
 struct kvm_msrs;
-- 
2.34.1
