Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp118746ejk;
        Thu, 30 May 2024 03:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3Qn3nE9Pmfa+p73YPAJqjW7V03PfIhl0GgymTPN8PavOY1CL65tvT8MpcR0f/Tus3YcUbL6HHrV5lOkm6BihLenxriI92
X-Google-Smtp-Source: AGHT+IFoHbSzNvX4kGdc0DfwjigCcfyOg4ZVPe6BxFk3la9tlcIyGV4/LFYr0ywB76NM7toAr8ss
X-Received: by 2002:a67:f64a:0:b0:47c:cbf:d124 with SMTP id ada2fe7eead31-48baeab1c53mr1852250137.28.1717063253475;
        Thu, 30 May 2024 03:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717063253; cv=none;
        d=google.com; s=arc-20160816;
        b=IpMaxpW/8TfR17W3my9JLwBm6mTe6pT7VpNcpct5KOnjLr0yWL3GEtriFSNTHNEQK2
         MAJe4X9XtmErxhVT9/gkMrcvigOcWX4Bs/8vUXvECYOYWDklR7BJOmhkDpERAq+2duJt
         b0sPTke5wCWAe8I9lskXn6Y2gxIPJ0dTZoZhuLg6Mvkww/x7le1+bnW/cJeHdfc6+r+v
         ju1Ik99j9lVu9igMimIUj4Bc1ZEHeGXTDYDydtpEjjRhg7W1/r1Wsxq4A0LKWQOKRoEC
         8ScdXDqiik/d54IjVhqPXFDb4t1U+912BYwjH2F11HyHhziHicseEKmFTUtnFagq973E
         YDwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kK7zTAWEcLivY3V+bR6lLCUegcec9ydIu2IQXQq8dUk=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=RxZqyOsHU9RC5A8Nw4CBRDe84BtJh+kXUiHyNPCeZfxghcu5alr696sOAqwz4Rx/Hh
         CzHgDcXBi8e82civ9Xc1b0IigYmHTJWR4ak5aKjzqGW7zGuh1S603uSH6ZmRLMqkC9rX
         cQM6tv+RMuqwiGuvTjKpvEFqV64Z22HAudzxxgsfd10CypLr952NtxmW9UQBNpo1NpfE
         74tePQmSKWBBIGev1o6aZ6L7Xn4OZwYtctKuK44Ol/i97O6T8OwMjzxAy3fetR+F76n4
         nrdpXIDQXgMI0bpNOn6ksBHhwES4Slq29jYyUCDYTIBXywb8bSKUp98DQlVZv+N4r6AB
         ICDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=i95r1A8S;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-804cc02cc8asi2656177241.162.2024.05.30.03.00.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:00:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=i95r1A8S;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063254; x=1748599254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkFL4JGvaBtqT8WMIo99wxT4H70mghAQsEG6xdgy1EE=;
  b=i95r1A8S4Z+qlEM7Da8nR7T2oOlWC9ARLgQpYWP602j4xoph9W+ecze8
   eUmLK5CHvo0ZaW4FU4l+Z00Il8fSMgfRJOdb3vPIjU1uJVkJWaPV3MRGO
   bQyjCaL/QZu6eJnF9EQENwLx8Da3ujCDBdo7BiuCWGXJyFulkdNGBoxQY
   Dh+MHYU8E+n7QJFSXOhwiSzDqBG3jyL5gP3U8rpXtx/KHe4GqspqZwYZt
   yBfy+5EbVcoCaB6B3MNZmsvYeuDyvciOZPmeMAzQYbhTUWfFmGJUfwRIg
   WOUAnKLciWmFlCfxIgBRFXrr8uiki+RNpHFpZXx94S3NreUqijtEelKHK
   g==;
X-CSE-ConnectionGUID: w46EdfBcTiWMiI+XyJl1UA==
X-CSE-MsgGUID: IPEJNObGQqG9eDbJ5zcbdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31032563"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31032563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:00:52 -0700
X-CSE-ConnectionGUID: /YQgvYFURk+y03VbFGoVyw==
X-CSE-MsgGUID: DC+EoqJ5R4+XMosDINLHMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35705107"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 03:00:47 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 5/7] i386/cpu: Update cache topology with machine's configuration
Date: Thu, 30 May 2024 18:15:37 +0800
Message-Id: <20240530101539.768484-6-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530101539.768484-1-zhao1.liu@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: koXNk6btgNKY

User will configure SMP cache topology via -smp.

For this case, update the x86 CPUs' cache topology with user's
configuration in MachineState.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3a2dadb4bce0..1bd1860ae625 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7764,6 +7764,27 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (ms->smp_cache.l1d != CPU_TOPO_LEVEL_INVALID) {
+        env->cache_info_cpuid4.l1d_cache->share_level = ms->smp_cache.l1d;
+        env->cache_info_amd.l1d_cache->share_level = ms->smp_cache.l1d;
+    }
+
+    if (ms->smp_cache.l1i != CPU_TOPO_LEVEL_INVALID) {
+        env->cache_info_cpuid4.l1i_cache->share_level = ms->smp_cache.l1i;
+        env->cache_info_amd.l1i_cache->share_level = ms->smp_cache.l1i;
+    }
+
+    if (ms->smp_cache.l2 != CPU_TOPO_LEVEL_INVALID) {
+        env->cache_info_cpuid4.l2_cache->share_level = ms->smp_cache.l2;
+        env->cache_info_amd.l2_cache->share_level = ms->smp_cache.l2;
+    }
+
+    if (ms->smp_cache.l3 != CPU_TOPO_LEVEL_INVALID) {
+        env->cache_info_cpuid4.l3_cache->share_level = ms->smp_cache.l3;
+        env->cache_info_amd.l3_cache->share_level = ms->smp_cache.l3;
+    }
+
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
     if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) {
-- 
2.34.1
