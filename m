Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1112625njg;
        Wed, 18 Sep 2024 18:39:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNeDPWfSvEm+aSpR4jEx7Vbk/jmYk4I0s8R8eQK5u7N+UjTcIcIWVfMJl+byiwPzLEHagpwZpVAHNSsA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0tvQMxv+Xg/TAFqMvL2PNYj+wp/QsvaHwIasUtXsPzndpPa+KCGMvLozvP/YDpb6yMRCF
X-Received: by 2002:ac8:5f08:0:b0:458:429a:4d76 with SMTP id d75a77b69052e-45860329286mr344689641cf.28.1726709999137;
        Wed, 18 Sep 2024 18:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726709999; cv=none;
        d=google.com; s=arc-20240605;
        b=dk+UyhL9wnMJoi3lm/P+khHnQYd7pDAAuC8G8MbZNGWWF8uRTxU+hUthgU6rD2Jtw3
         Dtb2qLKJFI2kgI3ZQyh5RQfO4JgIdJFxL526VYPQfxHOXVxdIM88JvvVyyc5sDQbd6z2
         FckIZ1G3FbmN86i71jzV8ClYd7m8bVLBGvF6YlaHZnbwITdNwYtxKrhkouZDDZVrBehB
         xu8MGnP7IWAXSeW30xAWhJX//OU0NO8uYgYceC9KcE6s9mW6C+BoYjju6XNc+IWF7zmC
         T53Fhh/AGL14f7P12qKLJLKEGHW9oFyrtEtou43kWMJ546jszy9e3WVJYHx1ZnD07bcV
         eMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X10jQlTYpcxg9AXNQn62SdrpQH11nnZd311IskdLLH0=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=UQgGQRlZ8tc482CuJS88dnuIyWxdgTe3c3nbrNTHX+quOLtBBB+d5tdawjbh2bXwjz
         Ao1huSr8wA4ShYkOp6su7DOcSJOpDCoEXB/P8/Pk+pLK3uYlcrWe1mH+mJ5EzEXv7MLu
         xBndX4P272JwaWYfodFOzDeFTSaghWq4azuwjcBl4N9z2+hyoIFuAVT/fM6F/HSCZS/1
         XPz86fxOwwzcJJOekns9lFrl6EVDZIGLXP+67JWU9bPiY7ieypKuvufrn1PYv21oD82X
         z6l9zaKPc1tAKwPvxOlwv5P3c2jtqeRqFa6Rk7bBmQOJONxdpjKcS6si9N86AIDtKcEM
         qlKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="kHdg/piR";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1786bff5si7491951cf.99.2024.09.18.18.39.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="kHdg/piR";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726709999; x=1758245999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GTUQ019BfwQpkrJFj+VNn+W9sPDXxvfUxmbaNbsBlZw=;
  b=kHdg/piR6khov4QszD7VMPwuoKWL7b6nIXqhjfq+wEhaMFoFB7Ffju4d
   MKE1g3+637Vsnz+ssonaWqMU4qH6AGT77VbGN0+SmZktEGn5blt9YPXd9
   U3cfgsa8ueJkGg13uB3TlwdEdZNNAxLMHcW9x4sCpR2YtuwBZ3ub68SxS
   itqc00Fkvq3efP63VEloUlot6YSnrJPeSuuliqOZ2/9amaCykl6LwU9ao
   US/bbWyoHsTYE9DG2xlEaBQf4gFfRrob5YjIdKO6aWyOWXdJqarhOqhd2
   EHPEsvEb1VU+wLzUol1zpXAOoG+FxON5RKN/k7UxV/4FIYT0eD7s1rv75
   Q==;
X-CSE-ConnectionGUID: CcmVCOSpQ++jXOaBKPMErQ==
X-CSE-MsgGUID: J7J0uS5jScu+hEE4Arcfcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25797820"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25797820"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:39:58 -0700
X-CSE-ConnectionGUID: I3knkL/jSee7aLywlolMUQ==
X-CSE-MsgGUID: yWAY1M6kTXWufBZ8mK+FLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058495"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:39:52 -0700
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
Subject: [RFC v2 02/15] qdev: Add the interface to reparent the device
Date: Thu, 19 Sep 2024 09:55:20 +0800
Message-Id: <20240919015533.766754-3-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ll5K1grt8leC

User created devices may need to adjust their default object parent or
parent bus.

User created devices are QOM parented to one of the peripheral
containers ("/peripheral" or "/peripheral-anon") in qdev_set_id() by
default. Sometimes, it is necessary to reparent a device to another
object to express the more accurate child<> relationship, as in the
cases of the PnvPHBRootPort device or subsequent topology devices.

The current pnv_phb_user_get_parent() implements such reparenting logic.
To allow it to be used by topology devices as well, transform it into a
generic qdev interface with custom device id ("default_id" parameter).

And add the code to handle the failure of object_property_add_child().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/qdev.c         | 52 +++++++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb.c  | 59 +++++++++---------------------------------
 include/hw/qdev-core.h |  3 +++
 3 files changed, 67 insertions(+), 47 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 4429856eaddd..ff073cbff56d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -143,6 +143,58 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
     return true;
 }
 
+/*
+ * Set the QOM parent and parent bus of an object child. If the device
+ * state associated with the child has an id, use it as QOM id.
+ * Otherwise use default_id as QOM id.
+ *
+ * This helper does both operations at the same time because setting
+ * a new QOM child will erase the bus parent of the device. This happens
+ * because object_unparent() will call object_property_del_child(),
+ * which in turn calls the property release callback prop->release if
+ * it's defined. In our case this callback is set to
+ * object_finalize_child_property(), which was assigned during the
+ * first object_property_add_child() call. This callback will end up
+ * calling device_unparent(), and this function removes the device
+ * from its parent bus.
+ *
+ * The QOM and parent bus to be set aren't necessarily related, so
+ * let's receive both as arguments.
+ */
+bool qdev_set_parent(DeviceState *dev, BusState *bus, Object *parent,
+                     char *default_id, Error **errp)
+{
+    Object *child = OBJECT(dev);
+    ObjectProperty *prop;
+
+    if (!dev->id && !default_id) {
+        error_setg(errp, "unknown device id");
+        return false;
+    }
+
+    if (child->parent == parent) {
+        return true;
+    }
+
+    object_ref(child);
+    object_unparent(child);
+    prop =  object_property_add_child(parent,
+                                      dev->id ? dev->id : default_id,
+                                      child);
+    object_unref(child);
+
+    if (!prop) {
+        error_setg(errp, "couldn't change parent");
+        return false;
+    }
+
+    if (!qdev_set_parent_bus(dev, bus, errp)) {
+        return false;
+    }
+
+    return true;
+}
+
 DeviceState *qdev_new(const char *name)
 {
     ObjectClass *oc = object_class_by_name(name);
diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index d4c118d44362..a26e7b7aec5c 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -19,49 +19,6 @@
 #include "qom/object.h"
 #include "sysemu/sysemu.h"
 
-
-/*
- * Set the QOM parent and parent bus of an object child. If the device
- * state associated with the child has an id, use it as QOM id.
- * Otherwise use object_typename[index] as QOM id.
- *
- * This helper does both operations at the same time because setting
- * a new QOM child will erase the bus parent of the device. This happens
- * because object_unparent() will call object_property_del_child(),
- * which in turn calls the property release callback prop->release if
- * it's defined. In our case this callback is set to
- * object_finalize_child_property(), which was assigned during the
- * first object_property_add_child() call. This callback will end up
- * calling device_unparent(), and this function removes the device
- * from its parent bus.
- *
- * The QOM and parent bus to be set aren´t necessarily related, so
- * let's receive both as arguments.
- */
-static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
-                             Object *child, int index,
-                             Error **errp)
-{
-    g_autofree char *default_id =
-        g_strdup_printf("%s[%d]", object_get_typename(child), index);
-    const char *dev_id = DEVICE(child)->id;
-
-    if (child->parent == parent) {
-        return true;
-    }
-
-    object_ref(child);
-    object_unparent(child);
-    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
-    object_unref(child);
-
-    if (!qdev_set_parent_bus(DEVICE(child), parent_bus, errp)) {
-        return false;
-    }
-
-    return true;
-}
-
 static Object *pnv_phb_user_get_parent(PnvChip *chip, PnvPHB *phb, Error **errp)
 {
     if (phb->version == 3) {
@@ -82,6 +39,7 @@ static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
     Object *parent = NULL;
+    g_autofree char *default_id = NULL;
 
     if (!chip) {
         error_setg(errp, "invalid chip id: %d", phb->chip_id);
@@ -98,8 +56,11 @@ static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
      * correctly the device tree. pnv_xscom_dt() needs every
      * PHB to be a child of the chip to build the DT correctly.
      */
-    if (!pnv_parent_fixup(parent, qdev_get_parent_bus(DEVICE(chip)),
-                          OBJECT(phb), phb->phb_id, errp)) {
+    default_id = g_strdup_printf("%s[%d]",
+                                 object_get_typename(OBJECT(phb)),
+                                 phb->phb_id);
+    if (!qdev_set_parent(DEVICE(phb), qdev_get_parent_bus(DEVICE(chip)),
+                         parent, default_id, errp)) {
         return false;
     }
 
@@ -246,6 +207,7 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     uint16_t device_id = 0;
     Error *local_err = NULL;
     int chip_id, index;
+    g_autofree char *default_id = NULL;
 
     /*
      * 'index' will be used both as a PCIE slot value and to calculate
@@ -273,8 +235,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
      * parent bus. Change the QOM parent to be the same as the
      * parent bus it's already assigned to.
      */
-    if (!pnv_parent_fixup(OBJECT(bus), BUS(bus), OBJECT(dev),
-                          index, errp)) {
+    default_id = g_strdup_printf("%s[%d]",
+                                 object_get_typename(OBJECT(dev)),
+                                 index);
+    if (!qdev_set_parent(dev, BUS(bus), OBJECT(bus),
+                         default_id, errp)) {
         return;
     }
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 85c7d462dfba..7cbc5fb97298 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1011,6 +1011,9 @@ char *qdev_get_human_name(DeviceState *dev);
 /* FIXME: make this a link<> */
 bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
 
+bool qdev_set_parent(DeviceState *dev, BusState *bus, Object *parent,
+                     char *default_id, Error **errp);
+
 extern bool qdev_hot_removed;
 
 char *qdev_get_dev_path(DeviceState *dev);
-- 
2.34.1
