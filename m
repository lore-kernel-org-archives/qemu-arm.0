Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1112933njg;
        Wed, 18 Sep 2024 18:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWituCSCfNa/mW0EjL7PL4bTXHOhzu0dd5zvc4wKkSBtUkmtZK5kf7Tg3Tc6xkBj/FI6FKeoYSeng2fnw==@linaro.org
X-Google-Smtp-Source: AGHT+IGS1eYgsqdTjVN3NqIyDmCIMX9hkBPNXkiF45BP3Pj4GdJE77v+5pKlWA2S8syuv+ltOIid
X-Received: by 2002:ac8:7d41:0:b0:458:3a65:1d14 with SMTP id d75a77b69052e-458602b9513mr446784301cf.6.1726710059167;
        Wed, 18 Sep 2024 18:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710059; cv=none;
        d=google.com; s=arc-20240605;
        b=W98ia1uZuSNWUXSSe01DSlXQyMkV84R9pP0Eux7X4xHx2fIfVbIoUuJyjDE3pDdfSl
         QdK4FERwYwz4nSxJ7wj2z36sgdJl/xzvtfKGJ6G093MnbVftNsrSNMvlBPOBhVjJ0I7J
         IwssScEF00rSzjFSyY5RIukmbUBZ8j4Gj7a2JrV1Wv4xg5EA1dnQ5iy2sWwd8a0+LvrX
         sGXNH1RUwCRKZKpGMxowal7BLExzbozMPUDRaO98xlOS6VEe8xYAK+iK2quC4FdJuhFe
         i9bHg4LF0fMKzQlSSmnXtYm2dWw/okGE3SP5iyzwarvLLI1kkoOLw5okkv8HrXvN39ed
         eNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AU6jgFDO6r5hz5BmlviESp13WRPd5XDRhS03Dc9ot0Q=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=ZLzpcQ5KCUvsnISl6Xici1N2dobHD27mSlwWN4s038HeRoNn1FUo63saUQv9mUZR5W
         ujVOugTld7JuIIo2Kp8FdqNgf8rjiU0idRxBrIpo3O1dKSkg15Vi8E2/cetxN8i0Iv0g
         At9CPTM4EM7TmXDIx0t134lSiY9nnlDvANiOgoCjnPbhPeOlcasZ9FECr13/8VRYsVu3
         iv3Cl5o9TvR/Cn5bNvk2kLUh6kpCRXJ+UfVtst1/uhfbSKcYcNRaGvIqxJ8iDUwziPCu
         WWVxA/8/ePKVQCueKdBLl7wOqH1i12gQ9wurG/UwbYV47IfRmm+303EyEDTJWvT2dfpt
         6OYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=heY2zlvo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1795df30si8300841cf.730.2024.09.18.18.40.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=heY2zlvo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710059; x=1758246059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yof4pkElgDw/rHKl12O9snBHTn5fw7x3AIk3IaZiwVQ=;
  b=heY2zlvoe0J+UMULvBIP+iAuaSOmQr50A+nULomSaF2Xb/5UfbD1rmkY
   h88/lUSki2Un2h5KIj+yuSMYrCFBxzxlR62/jw9JWwtj6SxlyDpSxrb4+
   ncZZsS8ec/IlIc4xdIK7W9g+KVYXkcm0WWyXdWmm0psHu25sVfDrBbgZH
   n+r3ncBFoNgN0HNkIAGb/D3Tb92pzfh/rl98cM2N1/0SS1uj2f2XQLgeU
   uK1hH4xzItLVLStxjqgt7ILaSBdh4pNdYvnBhdKaNB1V7Pg97PbzkwKyZ
   sQHrjptxZmymWa1oNIaIKKDa2lseLHl1FGfxLFr8SNzGo5fwbUjXGZEqX
   Q==;
X-CSE-ConnectionGUID: J9JcvqfsR62116UGCQUguw==
X-CSE-MsgGUID: Cry/voXYTC6KTNZFLsApEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25798037"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25798037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:40:58 -0700
X-CSE-ConnectionGUID: nl6/vbvKRUyF+/RLJLKJoA==
X-CSE-MsgGUID: zZt2sOthQ+SFZ3bJiPNv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058946"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:40:52 -0700
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 11/15] hw/core: Support topology tree in none machine for compatibility
Date: Thu, 19 Sep 2024 09:55:29 +0800
Message-Id: <20240919015533.766754-12-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CpQfZxvMSeAe

None machine accepts any CPU types, even some CPUs may have the
bus_type.

To address this, set topo_tree_supported as true for none machine, then
none machine will have a CPU slot with CPU bus to collect any topology
device with bus_type specified.

And since arch_id_topo_level is not set, the topology devices will be
directly inserted under the CPU slot without being organized into a tree
structure.

For the CPUs without bus_type, topo_tree_supported will not affect them.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/null-machine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef543..101649f3e8c1 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -54,6 +54,11 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_sdcard = 1;
+    /*
+     * For compatibility with arches and CPUs that already
+     * support topology tree.
+     */
+    mc->smp_props.topo_tree_supported = true;
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
-- 
2.34.1
