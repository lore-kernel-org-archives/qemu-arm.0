Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp268461ejb;
        Thu, 30 Nov 2023 06:31:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFSlgJH6KR/c0MMJsZqOAMKQAx4pmEzt4vID6Nl2oL/bNia669ejgSYBzlm+/4lD7zHkKb
X-Received: by 2002:ac8:458d:0:b0:423:d75a:b126 with SMTP id l13-20020ac8458d000000b00423d75ab126mr8849404qtn.18.1701354712420;
        Thu, 30 Nov 2023 06:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354712; cv=none;
        d=google.com; s=arc-20160816;
        b=v2Uf9+8zyq1lHdINmOJzLScxUFadYeUHG2Q5retwTKhf6rUctEofkVkDXBn5fA//pE
         +H1WpK1JWECBh/h657g3SGXVTTmvVRHZz3k/ETm34j1uC7auIFsehqvbiDEDuKdqeiu5
         6sLC31NClLmLhbK0hZYav4fMuHcQ14HpK+EcwOk6+ZlSKE6RyGavzdzJ9UV0ohl3RyDW
         KCGpfihM8tZ7p0GvGH0PZFZNuXCJBglvnOS1JEW/SP3bi5zCI8AEyzXXthtZCBTR/qB/
         MsJu+9jK648D42KZXHlvqvUoznJ66BbNgcsshIMMEhq27/8tkCeEh5CO9uvBmq6Jhv1O
         l04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w83/n3empgceTkPoMm4A45im5C1+QxHglZQSpg6/p7M=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=D1pJNNU6Hw00+ylc42DdGlxuo6aZOylhJFMJEJmAD4ohyEInXkEq/Y67vKIYN/VbOg
         dBSXUxhktaY1mEw3TvLseslar6Crderwy7rHCLAVkDqK8nFBMGeTRTPMmJEUk0XGDqvq
         3n2tbGX3eClthQ318nDKwv2zqtzHscQ9uGk+3w7LL3Q2acFqUrK+ZDmavDDe+XKBloP7
         R10LHF52bVBl1s1C7NeUpwk1lOMUH8XwAaoFoe2i/lyzsfsiGcyfrJTQu6QevDjMWhfI
         iNT2OwBauEpSM3n3KnOClh7GtZWE8IJe0oQMW8CP0saO9p9WoRCBxeGLN2aSNQtnsAz4
         GXbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HtfMqBHH;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id r5-20020ac84245000000b004239af652ccsi1123374qtm.1.2023.11.30.06.31.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:31:52 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HtfMqBHH;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354712; x=1732890712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvkKzJCE6FUWENQ9f97m08P62P/QoMoZpAQ1rnP03oI=;
  b=HtfMqBHHZUN7GgJRWat9fIWsFbhJkMP4kLDyPJrkFVSgc68P71B6J9KH
   h4MDq+Da2PJF8O8mzW2oB7HcQtW9oQaBJzWha7RJrHOxgHxUajKXquZ5+
   k5SFchDNnnduvUwiL7l5Leg5heYe7kOS2aCbeACzpETnW/WU5jZiyR5CO
   ZByDc/4VqhgrTLErOHeCmuc1L954soYl7YZJ6bEQwOYnmhUVkeQ9dfZDQ
   Aj50DQIlBTJ64MBaIY+469zRzDq97JDKlDhbz187rR/cAOp7cM35d1N7y
   5VF7AFFvaQfOsz6AT5X7J1LB9tt5XSvqXlKoIjfUcn9HOGsNw3es/4S0l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531154"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531154"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729654"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729654"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:10 -0800
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
Subject: [RFC 05/41] qdev: Set device parent and id after setting properties
Date: Thu, 30 Nov 2023 22:41:27 +0800
Message-Id: <20231130144203.2307629-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WXZvxH7pk1qq

From: Zhao Liu <zhao1.liu@intel.com>

The properties setting does not conflict with the creation of child<>
property.

Pre-setting the device's properties can help the device's parent
selection. Some topology devices (e.g., CPUs that support hotplug)
usually define topology sub indexes as properties, and the selection of
their parent needs to be based on these proteries.

Move qdev_set_id() after properties setting to help the next user-child
introduction.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 system/qdev-monitor.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 7ee33a50142a..107411bb50cc 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -700,14 +700,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
         }
     }
 
-    /*
-     * set dev's parent and register its id.
-     * If it fails it means the id is already taken.
-     */
     id = g_strdup(qdict_get_try_str(opts, "id"));
-    if (!qdev_set_id(dev, id, errp)) {
-        goto err_del_dev;
-    }
 
     /* set properties */
     dev->opts = qdict_clone_shallow(opts);
@@ -721,6 +714,14 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
         goto err_del_dev;
     }
 
+    /*
+     * set dev's parent and register its id.
+     * If it fails it means the id is already taken.
+     */
+    if (!qdev_set_id(dev, id, errp)) {
+        goto err_del_dev;
+    }
+
     if (!qdev_realize(dev, bus, errp)) {
         goto err_del_dev;
     }
-- 
2.34.1
