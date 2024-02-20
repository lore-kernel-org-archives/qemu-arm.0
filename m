Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174772ejb;
        Tue, 20 Feb 2024 01:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVG00lkkbC1vSWkboieGMyzA6euJ+BNswzY6zliOe/nX2QTDyfumD1/p4kclt95FiBSo6D68kh/uSdwXL0iHHUWWuZorq2/
X-Google-Smtp-Source: AGHT+IHICGgkaHP+tiu79R02xAXCsQOpR6KuaXLa9SrpA1bjRSG7kVIyIJ8odijPAnpLwDqlVg4M
X-Received: by 2002:a05:620a:1673:b0:787:214c:3301 with SMTP id d19-20020a05620a167300b00787214c3301mr16853706qko.46.1708420338944;
        Tue, 20 Feb 2024 01:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420338; cv=none;
        d=google.com; s=arc-20160816;
        b=o7dq2yAPZVcnZqqmnf5QdLqzR4giRwnYRsxaoRdVb+OtbJag+/Uyq9oioRXeCwX8M5
         GP0TEJP5GWPuMT+P22UjcxThcySJdupW+p7vHkZWv0uEqT21L3Y/x46UaucbEiGVwidM
         ZyEjH7C/lU5QpQq3IGcISOBaaQRfqCUVJy+692SBBylBabG0Wi1HJwYeponb86HtGhSL
         Hx1njzcj2TiMw0gxledwjbkVnnmPZdRijaG292/Kx8KT/AYw8xzCCLrG2incilmeNS+W
         ol0sRRAI3+piALN15eetbVVrgdoZQhLp0xhwsAdupoKrMR20zvsbL+R9g0ggEWRWJLo4
         mWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YzBFThZ9pCwWaiwtxTUYlOw7wI/O3P3b6nC9JLqcu2A=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=KWzs116SzjsGPEUZDmtO8pcNXyGwFUjPbZDv0hmJRJ2KzPYlSF4Zt3hbsNEsBH7SM/
         cMT/bfq0niaPcI3lWKOo/7jxlJMpWBvEmrMyNPcZsUImWMo4jEFXX9/XiumGUxl+WDWr
         LWDAipYCqr9Gz2h4v/1KYgZ6uO1FOlAocD+5J+sZ7rx4Ngqv4tedHzCWnUX+2D3RuwzJ
         Giyztugv8NE9Y6gncZGbnUQ9GMFm7aJ/2y/pRbBl8I8lBb9XGMdTmA2XVFZ19ZBGj4rZ
         YSPg8++C4cHjG22AdI9Q5DAoyvIOAgUX/JEt4o70FOBEMNYYD2IsGvfyBmgRACgHH/05
         00oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BgM+jP6b;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.12.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:12:18 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BgM+jP6b;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420339; x=1739956339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sh2QkQ5wss3HOjZ8fhY8YalRgTw6t25jX5kKa/RtD7I=;
  b=BgM+jP6b0g3VoqDecxvtYsczNbqZ2Ev/g3KHu+9ioOkwlhyVugh6/TjP
   g9QmMH04g+JICvPWE6Xh0vpzZyzCUoIHlyrToxHNIrl3z9NJOT8AX0DTt
   ghHFfMBzgC/o3EjodkoJEqLLKav+9tB8+uHIcWygw3vKGDAOQuo+KIloh
   4FuYRvl/owqBosg5t7z6VIw2MWxVnf2ZRcztBIav7oVC0wACLGhttSi3h
   /gitxlMQnR86yhuB2Mgw9cqMFisRfSm185EL4wtOVfyCXV13yJV3tB+Jk
   triCOQ+dqY31oUgvWlzcLTIvRJROFF9IrqTkON5M99CuOkFEtTUmQLkh5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2375022"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2375022"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5013057"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:12:11 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
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
Subject: [RFC 6/8] i386/cpu: Update cache topology with machine's configuration
Date: Tue, 20 Feb 2024 17:25:02 +0800
Message-Id: <20240220092504.726064-7-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ex8TiWqk4NGq

From: Zhao Liu <zhao1.liu@intel.com>

User will configure SMP cache topology via -smp.

For this case, update the x86 CPUs' cache topology with user's
configuration in MachineState.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d7cb0f1e49b4..4b5c551fe7f0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7582,6 +7582,27 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
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
