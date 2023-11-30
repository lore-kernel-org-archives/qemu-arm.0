Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp272089ejb;
        Thu, 30 Nov 2023 06:36:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHSEOWRicI/a8Kb5/UKCS/4QFqXDmzy4K+rqrOYdaZ2/Vjh62v9O5MblpIN071DG2uB3Dv
X-Received: by 2002:a05:620a:22ad:b0:77d:896a:cdb7 with SMTP id p13-20020a05620a22ad00b0077d896acdb7mr18163576qkh.33.1701354999752;
        Thu, 30 Nov 2023 06:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354999; cv=none;
        d=google.com; s=arc-20160816;
        b=Hl4NRIGxMBi9QjzZBuDYL28NvE8R6HtJDzZe07pYjVsrKo9jHZLS7MAwvTWklsEBIY
         TwmM+R7/uiXaHI3cwe+Zjtx16fGtPR9ntfE7mWSEcrCTv2hyCqNtdHA2yU8e/fWfZF0C
         HJfiazOeLjyQTn25YKfaSdZ6Y2Me/mhwTggcRSi/v6vNdcKpCgmdTblBJfa8D+3AYRWP
         vi+InRpZI2M7gkfv9Ku5uOux6LtaK6Y1IA0NNUX34l/h+vmngJBJC0RqyG6C8QgdvMxO
         5IO7XAK6z10F9/DMfAVCNl4m3yY/4rgivzdca8QMauAcKMdYq/ZjV1+ty33S28L8wLYn
         kFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hOnyms6Xj8MOjTu0mLFaVeWY9Z44zv8sVi+MLJlL2D8=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=Xm3J5Dg94Kp2SspDsV5aRhf3XRn4w1GU2xh9N+Dk7FpDJTI97fpw1MX99469Is2bJn
         shkuLEudxNcFVaxwRzVIhV8tJr86baOACpA1pe6HjIUrd7huiUX+gJF8K6yu4qlaypLI
         J8h1Re4wXIu93LuNHSsuTDoOuZfvz0QgYYKuQDNNZ56Z0NcPa4uslu9s5tQZPGw1Kmdz
         CCxX14Ug0tA4PdbbNUjOnfgXxg9SW87N2fK6RtxHcsIlMPU9KDw3z8uCGKPC0h7YEJh0
         ozSACAjoRDu+gmCFb6Pb4OAXJC0bnb5p6OegSlp+5hYEE7xvzNFEirGXRmIuqsO6ST+y
         44Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JvALYlC7;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id p9-20020a05620a22a900b0077a2952b4a0si1103260qkh.696.2023.11.30.06.36.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:36:39 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JvALYlC7;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354999; x=1732890999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xvYlraOGB3zayUrWIK0PscKH2Ic2SrgqXJLGzTM1XXI=;
  b=JvALYlC72IcjOZ3ZWf/3ovn6exdWPh00GuwbuBEtSugd+bIr0N/E4TNV
   YObAkqUxh7thq9HbZmP40RucmiW2mN1DZAaaAF2dlmp8cG7sXHmiioe9Q
   S5sODGQKsT5Y43HZeW5kV1SmNTXISyDHmGhH7iAI2Uz4P5ptb9hw2CdOA
   LD65pZoj2ARjwy4tC4Q5L83ZP6SCjy+xw1epSL8Cq84Sgq8t/3oa/aPTm
   iCc7X4ThaITLWmx3BgnN46A2Ir+TNCAmx6PkAPoj+o9teeXcJOoJzKHDh
   meRDUnPs0A56xPM2UYhlGVQ+b0L8QbnBZtF3Y3scGcyn1VXGCcZja9Etj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532646"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730473"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730473"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:03 -0800
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
Subject: [RFC 36/41] hw/i386: Allow x86_cpu_new() to specify parent for new CPU
Date: Thu, 30 Nov 2023 22:41:58 +0800
Message-Id: <20231130144203.2307629-37-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gko98yc0a0Q0

From: Zhao Liu <zhao1.liu@intel.com>

For QOM topology, CPU should be inserted under its parent core.

Extend x86_cpu_new() to allow caller to specify topology parent.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index d9293846db64..3c99f4c3ab51 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -94,15 +94,22 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
     return x86_apicid_from_cpu_idx(&topo_info, cpu_index);
 }
 
-
 static void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id,
-                        Error **errp)
+                        Object *parent, int index, Error **errp)
 {
-    Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
+    const char *cpu_type = MACHINE(x86ms)->cpu_type;
+    Object *cpu = object_new(cpu_type);
 
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
+
+    if (parent) {
+        char *name = g_strdup_printf("%s[%d]", cpu_type, index);
+        object_property_add_child(parent, name, cpu);
+        g_free(name);
+    }
+
     qdev_realize(DEVICE(cpu), NULL, errp);
 
 out:
@@ -146,7 +153,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
+        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
+                    NULL, i, &error_fatal);
     }
 }
 
-- 
2.34.1
