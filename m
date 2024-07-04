Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333460njb;
        Wed, 3 Jul 2024 20:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbhnm5DjYoN3BcP0l3DSV1uudge6UGRzLphXrZNyAvyg+Ptfg9RBt7Y/OWCDOb0hYWj6ugR/7torweWHi2BLhA13NUQWbX
X-Google-Smtp-Source: AGHT+IGsAd3ZomOps8sICyQXXkrDBT2V9rk2sBhFSv7btYjoefmBIsOA1KElOs2xvakwtQqpKOmg
X-Received: by 2002:ac8:57d2:0:b0:446:4370:16bb with SMTP id d75a77b69052e-447cbf8b9e7mr4592201cf.47.1720062069950;
        Wed, 03 Jul 2024 20:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062069; cv=none;
        d=google.com; s=arc-20160816;
        b=JtmAL1EhBwk6IlV3XIBKLJTMQMwkHbGGpcwjYUVnc5DQE9ZOLO6tWM55bJ+L1PexKK
         Xa4LUrORayXMMAwFR39VfhyI8oq5T42dTNJ0PppFbY5HY94eIj1jEzimQ7AV3y616sqC
         68uT2OFKW286C3LkV/ge3SCZeJudBuWHQ2STKX7P98Hrp1SbvzlfiUm1xl7ulK2UFRpW
         FPntLnE4SSjqd0/GZLAeznljnak4nA+q8W8mPfHjylbiw+QfkiKxsYmX6eMDv3x4anW4
         n84pR4hOVBWH8ZLJCMeFxWPWJXgMQAEf4zEcrNqGZYNl0EY2cEoi2yBExpLJLkLxVrH1
         c9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F+RxG2ixtMHiDfsSYQd77uifxHjCOkrm6I2c2DU+vPA=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=nOyjKWzy5PRT3EPZxAyTyVPlcxg88uhxbFhiSYwx99dqFrOGn/S6rndLeDYwlIb10r
         Sck5A0KGCGJSlo7lrRAMoJZBFSyTI7xhl+Kx8szj7T6pb1UynmkSz7kKIy7xQ8RKg00H
         dH5N/e8h6ocOlt6OsMQfFus6EqjVOcIJqarxXYZsQ2zja3NJ52TcLBrnYgur2Qs2CJ9S
         8JPJ3QuaZt0vPGQ1B2N2qE4dO1WeziBXj13f4OWJzwaPZa0qpluAc7A76ZAhXQg9m3oU
         2dq4I9dXpKsbeJF2TaSTCLSbW+dSvi7X+pcCfbwp/ksJ3Oy/wIcVRkI+F4LyK6lATpY4
         MknA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KyWGuciY;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi141580431cf.89.2024.07.03.20.01.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KyWGuciY;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062070; x=1751598070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5b9XogeXsVEL7ylTEoEbdPkYX3f+Rc5K1Le5/8Ng2nM=;
  b=KyWGuciYJJdEQ17C54SHDaJ0kapyBFcbJ5sSMPAe7RWjIa0+G83zDuC3
   uiXUzDXgWjwqfD6zmvwaRdtulGr7BsUCdvoYhN82ssIY66/EjQXFYIcQ+
   aAxlW4H5gXY9lfdSQ/i4Ji7iPJq86hhYOkPKOdi1t09z/ECcEjyaGUVGE
   xzmMeur33QcBSaToijb/aeuhiJDJjO8fba3XK5uoScHXBeZ+JJaDtsDx5
   lveNpddKA5bMBy1yOhG29+Poc69HZZIHN3o5Kf6K9x1n7JyUg/cdJMSjO
   rMdvSddrvQEd0rPK4mi9M0uLaW1KNdUjyo3FZLnvBJrAKL/wQMTywPfGY
   A==;
X-CSE-ConnectionGUID: Ery0uNpmRiC+zkDeSOmrnw==
X-CSE-MsgGUID: TFgOpiRlRcqNu5np8PAEcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838153"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:01:08 -0700
X-CSE-ConnectionGUID: 7hVCaK83SaCzBXqUcS03NQ==
X-CSE-MsgGUID: MBIRtr8ERn++cWHf40ULow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052471"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:01:03 -0700
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
Subject: [PATCH 7/8] i386/pc: Support cache topology in -machine for PC machine
Date: Thu,  4 Jul 2024 11:16:02 +0800
Message-Id: <20240704031603.1744546-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z71wNo5T2pXc

Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
machine.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v2:
 * Used cache_supported array.
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 77415064c62e..1614a3b1bf19 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1773,6 +1773,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
     mc->smp_props.modules_supported = true;
+    mc->smp_props.cache_supported[SMP_CACHE_L1D] = true;
+    mc->smp_props.cache_supported[SMP_CACHE_L1I] = true;
+    mc->smp_props.cache_supported[SMP_CACHE_L2] = true;
+    mc->smp_props.cache_supported[SMP_CACHE_L3] = true;
     mc->default_ram_id = "pc.ram";
     pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_AUTO;
 
-- 
2.34.1
