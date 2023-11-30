Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp268738ejb;
        Thu, 30 Nov 2023 06:32:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ79CAVoHZCaUIn/S9fz6ODzAjer078Xd8o0h9LY540TSoJtvIyZP4bua4eIFgcQAoIX2D
X-Received: by 2002:ac8:5841:0:b0:423:8287:dc67 with SMTP id h1-20020ac85841000000b004238287dc67mr26272913qth.58.1701354730456;
        Thu, 30 Nov 2023 06:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354730; cv=none;
        d=google.com; s=arc-20160816;
        b=qMuEODXsTbh1JBYbndSdRW9OH8z1Xzl//UMlmL0jYFRjZKTw7bV/k4kDCHepOUX66r
         cWcOynPsWkk2yb/xJgbRnlyBiuZFgMpgczonb8X6FuCk9NSAb1R+VNXvuWuWoEtoAUHe
         jrsfdeVBVFAZWSVo023zGw1/oCoGF/O7dgGMnK3TqIjX2SNX931nOu8XE6tRaS2j/fxJ
         bV3s6cVMK8/QN3GqK/u0JtlvkBT20rS/eH51QP6MKJPZJ8XfppPN0LQO2nx550pu3TXS
         CP3ZHTDOQQ0VuJKlk6CgOv4cwDC16CR0hivkOLnIPzFOz0P6lU9Dsz1jlz9eCwt5Zuqv
         v1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mUPJ5SqK4srRxxomR4tbplrRs0HMKcgO8RlhqIvU96Y=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=lvpn7ziO9E8idRcSGThlS/SW5QzY4h/mq5u7V76m/4eGijhNseMcFeVslzNNE6Vl5j
         dL7gFwSfEn6b0cFCWmZWQHXoYmK+k9a1jlw0NBwAFYFtO0fkVxId4AcKTvGbPXOMuzVt
         K/XLz71GNEDyFZSqwwyP35k1HoyHr4mJjv9pVGZbILNNByDhXfQ7zLSIgbEhYm2fmZAe
         fJW7qcgwlZSYgiyv7kiEUcUTpVRwTw29+eSeucS7uAX2hoiynUph1nOcWhVZtH3e6q5u
         1KaSVogZ2ve/QIuFeXLRnw3WrhzpZ4r4ZEG+YKoI4qgxxBtyhTcml5rOz+bfaej8ni3j
         mnQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=T7lcvl+z;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id ke6-20020a05622a288600b004236d30b354si1081938qtb.732.2023.11.30.06.32.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:10 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=T7lcvl+z;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354730; x=1732890730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vOtFxW4vj/U4kztv92p8xu/6iieeFFSa0l7Rf+yqZFI=;
  b=T7lcvl+zX7uzYWwc/2bPQHEtEVuhMifmNFyH3Fb20hgMZJZHTsvkh2sK
   F2xnWIfaCeOMiCSi9YyJT+gQI9bGkyj6Bjn/9PU26jbUjS9M1CLRehNqh
   Izjhyprob1GYfE0rG+ztVX2bsYuxXFLQlwE0h5aFI1IPpnzM+6c/s5Z/U
   liVoSwH4SSDMAo3YD5kDuwOYhOwsBqOJXKin/9j3A5VJttdL1ZE/zyvaz
   cnLWm0pi3XoNX1ijCM1ig6UAmsyCvC7AlvzEcWHVILodSRfE9N1xQoVWG
   Q12DKekdCegHaKr2RiGo/qdJSi0WYliAeTK2ZvWG7LpCm+VzD8poJ/L2y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531337"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729711"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729711"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:29 -0800
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
Subject: [RFC 07/41] qdev: Introduce parent option in -device
Date: Thu, 30 Nov 2023 22:41:29 +0800
Message-Id: <20231130144203.2307629-8-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ojzja9cv0YzW

From: Zhao Liu <zhao1.liu@intel.com>

Currently, the devices added by "-device" are linked via bus, and are
set the parent as peripheral-anon or peripheral containers of the
machine.

But this is not enough for building CPU topology hierarchies as:
1. The relationship between different CPU hierarchies is child<>
   property other than link<> property, and they shouldn't be linked
   using the special bus.
2. The canonical path of device is built from the child<> property, and
   the well defined CPU topology hierarchies ask their canonical path to
   reflect the correct topological relationship.

With these, the child<> property support is needed for QDev interface to
allow user to configure proper parent in "-device".

Introduce the "parent" option in "-device" to create the child<>
property. This option asks for the device id of the parent device.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/xen/xen-legacy-backend.c |  2 +-
 include/monitor/qdev.h      |  3 ++-
 system/qdev-monitor.c       | 50 ++++++++++++++++++++++++++-----------
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 124dd5f3d687..70ad11c6287e 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -184,7 +184,7 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
     qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
-                &error_fatal);
+                NULL, &error_fatal);
     qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
     object_unref(OBJECT(xendev));
 
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index f5fd6e6c1ffc..3d9d06158e5f 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -16,6 +16,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
  * qdev_set_id: parent the device and set its id if provided.
  * @dev: device to handle
  * @id: id to be given to the device, or NULL.
+ * @parent: parent to be set for the device, or NULL.
  *
  * Returns: the id of the device in case of success; otherwise NULL.
  *
@@ -34,6 +35,6 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
  * returned string is owned by the corresponding child property and must
  * not be freed by the caller.
  */
-const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
+const char *qdev_set_id(DeviceState *dev, char *id, char *parent, Error **errp);
 
 #endif
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 0261937b8462..8f56113eef65 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -587,22 +587,33 @@ static BusState *qbus_find(const char *path, Error **errp)
 }
 
 static Object *qdev_find_peripheral_parent(DeviceState *dev,
+                                           char *parent_id,
                                            Error **errp)
 {
     Object *parent_obj, *obj = OBJECT(dev);
 
-    parent_obj = uc_provide_default_parent(obj, errp);
-    if (*errp) {
-        return NULL;
-    }
+    if (parent_id) {
+        parent_obj = object_resolve_path_from(qdev_get_peripheral(),
+                                              parent_id, NULL);
+        if (parent_obj) {
+            if (uc_check_user_parent(obj, parent_obj)) {
+                return parent_obj;
+            }
+        }
+    } else {
+        parent_obj = uc_provide_default_parent(obj, errp);
+        if (*errp) {
+            return NULL;
+        }
 
-    if (parent_obj) {
-        /*
-         * Non-anonymous parents (under "/peripheral") are allowed to
-         * be accessed to create child<> properties.
-         */
-        if (object_is_child_from(parent_obj, qdev_get_peripheral())) {
-            return parent_obj;
+        if (parent_obj) {
+            /*
+             * Non-anonymous parents (under "/peripheral") are allowed to
+             * be accessed to create child<> properties.
+             */
+            if (object_is_child_from(parent_obj, qdev_get_peripheral())) {
+                return parent_obj;
+            }
         }
     }
 
@@ -628,7 +639,8 @@ static bool qdev_pre_check_device_id(char *id, Error **errp)
 }
 
 /* Takes ownership of @id, will be freed when deleting the device */
-const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
+const char *qdev_set_id(DeviceState *dev, char *id,
+                        char *parent, Error **errp)
 {
     Object *parent_obj = NULL;
     ObjectProperty *prop;
@@ -639,7 +651,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
     uc = (UserChild *)object_dynamic_cast(OBJECT(dev), TYPE_USER_CHILD);
 
     if (uc) {
-        parent_obj = qdev_find_peripheral_parent(dev, errp);
+        parent_obj = qdev_find_peripheral_parent(dev, parent, errp);
         if (*errp) {
             goto err;
         }
@@ -655,6 +667,11 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
                 goto err;
             }
         }
+        g_free(parent);
+    } else if (parent) {
+        error_setg(errp, "Only the device implemented user-child "
+                   "interface supports `parent` option.");
+        goto err;
     }
 
     /*
@@ -684,6 +701,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
 
     return prop->name;
 err:
+    g_free(parent);
     g_free(id);
     return NULL;
 }
@@ -694,7 +712,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
     ERRP_GUARD();
     DeviceClass *dc;
     const char *driver, *path;
-    char *id;
+    char *id, *parent;
     DeviceState *dev = NULL;
     BusState *bus = NULL;
 
@@ -772,12 +790,14 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
     }
 
     id = g_strdup(qdict_get_try_str(opts, "id"));
+    parent = g_strdup(qdict_get_try_str(opts, "parent"));
 
     /* set properties */
     dev->opts = qdict_clone_shallow(opts);
     qdict_del(dev->opts, "driver");
     qdict_del(dev->opts, "bus");
     qdict_del(dev->opts, "id");
+    qdict_del(dev->opts, "parent");
 
     object_set_properties_from_keyval(&dev->parent_obj, dev->opts, from_json,
                                       errp);
@@ -789,7 +809,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
      * set dev's parent and register its id.
      * If it fails it means the id is already taken.
      */
-    if (!qdev_set_id(dev, id, errp)) {
+    if (!qdev_set_id(dev, id, parent, errp)) {
         goto err_del_dev;
     }
 
-- 
2.34.1
