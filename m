Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269423ejb;
        Thu, 30 Nov 2023 06:33:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/LgL3z3EpYCsMdDZIcQ5uYyDPB1QQVv8u8/JJXYgavfNAWoSYuQwLVp0Ob4bNBlka+9WC
X-Received: by 2002:a05:6214:b0c:b0:65b:2660:f58b with SMTP id u12-20020a0562140b0c00b0065b2660f58bmr23441662qvj.12.1701354785932;
        Thu, 30 Nov 2023 06:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354785; cv=none;
        d=google.com; s=arc-20160816;
        b=BauszvGfblUwYJwGrgXR4TPVgls8LbO205dcpo8qVAhIb44OPdV2tduBLRbkOGTxEe
         cDkt8cb0mbVL0apgxyPBLfwKZDboxYnup6eBu3RFEMoFX0TOx0Hmn1R1MRUGaUpBrYej
         XWeJTZ5x5VrYKDJLmTLASnRjWhjvkByTSVKe4AiGqfm/dZQ3n4WqupjFRYRiMUxZf538
         a+aFM3+46U4sNp+Udw0GG2HsDcKuYV266acX1dwwoEM/Evzd345nkjPqiIocAJMUtvar
         Glv5vn3MdFQiGBKR+X8ZQIuc5/o4zvXR+R1O50t67+OFo7rYXpTgPMg79CVEswTd8BTR
         ya/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=U4LNWwiOs6ki2FoDEsFF1f0dT3yNScsGQRkBIApn0/k=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=gf39xfJeGdk2DCOAIw+/sypQ2QF/JRrCE/7nLFaDl5APmMefZFMeAul44OSXcygb5h
         iC6SBBB+rs05vfceN8sEMJZV5dn65A0J/2LPFg9o+apD7xuqrvtY4hF3AcfgsKBxO26P
         PTsfJK02eB1iht8SHou7WdhpCY+AisBr8VtbnMsq8iZSGqyP/HidOe0CaHkdcA4fyoBc
         vT81+cauFAw64hhfQvMmTj7XbAbi7mEVben4hL6IFPvxTxAttaV6rfp9v2brx+OT3GCu
         gVl56tOMLCyKSjts9S+sD0J42MbjtAQAHseEKUSd8Z2MsIXesAywQwT9QUrDrcnkaw42
         29hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=AdEdBnAD;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id c5-20020ad45ae5000000b0067a9038bd92si125442qvh.12.2023.11.30.06.33.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:33:05 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=AdEdBnAD;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354785; x=1732890785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/4XB1+0XSfZXJW6ggYvVG8+UQ24RT1LIudOfD5YSaJw=;
  b=AdEdBnADDPOfngJmnCDo3tMVWf0TdAiE3DK+7/WDeJJVf1ytwjyjAuAy
   qQuMCW9IU9DmRsMb8dZ1NBlruQLBI2hGutCQX/915crA0oveTquYSlEUC
   l1AszSGUSaGl4SA/d8h0tlJEzgrettOfGMPvs1hz9m6nae2DSetpK3AUn
   mgm35ezbJ2oVvaJMu9Ygd9czoiP7EZrGsFUFPLLwVac4znIBOkLyGtq0q
   crFTzEYC/GBtYscSSiEIRiiDsFDY+Zdi0OeVlQ01jGanb8GrFYnJ+Cqf6
   lnkzwacW2BuMh5MzQUEKToHoSwYW8FLP48JCeBEOxN70M+rGZxgM53Com
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531855"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:33:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729971"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729971"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:54 -0800
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
Subject: [RFC 16/41] PPC/ppc-core: Limit plugged-threads and nr-threads to be equal
Date: Thu, 30 Nov 2023 22:41:38 +0800
Message-Id: <20231130144203.2307629-17-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: C9OQprq9nLSl

From: Zhao Liu <zhao1.liu@intel.com>

PPC supports CPU hotplug at core granularity, thus ppc-core only accepts
all CPUs in a core are plugged.

Check if plugged_threads and nr_threads are equal when ppc-core
realizes.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/ppc/ppc_core.c         | 18 ++++++++++++++++++
 include/hw/ppc/ppc_core.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/hw/ppc/ppc_core.c b/hw/ppc/ppc_core.c
index 4433b54af506..3857f3150052 100644
--- a/hw/ppc/ppc_core.c
+++ b/hw/ppc/ppc_core.c
@@ -53,20 +53,38 @@ static void powerpc_core_prop_set_core_id(Object *obj, Visitor *v,
     core->core_id = value;
 }
 
+static void powerpc_core_realize(DeviceState *dev, Error **errp)
+{
+    CPUCore *core = CPU_CORE(dev);
+    PowerPCCoreClass *ppc_class = POWERPC_CORE_GET_CLASS(dev);
+
+    if (core->plugged_threads != -1 &&
+        core->nr_threads != core->plugged_threads) {
+        error_setg(errp, "nr_threads and plugged-threads must be equal");
+        return;
+    }
+
+    ppc_class->parent_realize(dev, errp);
+}
+
 static void powerpc_core_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCoreClass *ppc_class = POWERPC_CORE_CLASS(oc);
 
     object_class_property_add(oc, "core-id", "int",
                               powerpc_core_prop_get_core_id,
                               powerpc_core_prop_set_core_id,
                               NULL, NULL);
+    device_class_set_parent_realize(dc, powerpc_core_realize,
+                                    &ppc_class->parent_realize);
 }
 
 static const TypeInfo powerpc_core_type_info = {
     .name = TYPE_POWERPC_CORE,
     .parent = TYPE_CPU_CORE,
     .abstract = true,
+    .class_size = sizeof(PowerPCCoreClass),
     .class_init = powerpc_core_class_init,
     .instance_size = sizeof(PowerPCCore),
 };
diff --git a/include/hw/ppc/ppc_core.h b/include/hw/ppc/ppc_core.h
index bcc83e426e3f..1207d220872a 100644
--- a/include/hw/ppc/ppc_core.h
+++ b/include/hw/ppc/ppc_core.h
@@ -34,6 +34,7 @@ struct PowerPCCoreClass {
     CPUCoreClass parent_class;
 
     /*< public >*/
+    DeviceRealize parent_realize;
 };
 
 struct PowerPCCore {
-- 
2.34.1
