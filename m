Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1003564wrs;
        Tue, 12 Mar 2019 15:57:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzEioXsJp56m42yEz8VFhdcxFuggW3n4pPRi1LaCFE/e6NmuWMsAbLTrCq34NCQxNYV10v
X-Received: by 2002:a0d:c683:: with SMTP id i125mr31853225ywd.471.1552431440122;
        Tue, 12 Mar 2019 15:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552431440; cv=none;
        d=google.com; s=arc-20160816;
        b=YvqL27S0adlC6LWQSEs98QbAQRfYU6KTmjSEulVe1wdF556Cp0ucTlfeGOTIo+TRJh
         U4WTjTcWyXKYOGKnxL8S0CRHPFPvTA3IqNfZ007k7YVCLvZ8TGP/ydZgBjApO1k1ybTT
         Z93vmb9GKJh/8unl/kKi1X0XwWJTd2QBKMGJUlglXx7rnXEZhuzmZT+e+wRNL4hGRTjE
         TQvDWnRbk6NEOI9W/KBtEEugIcLotePRrViMLcx/H2vs18xwxoLy39fezT4BhgvEE+4K
         dRRVshOKlxQq3PU4pQsqk8QDbAzLYFnFiMGUg5lJ2rocHmf/7/sqrpCD6F+IMVpybO0q
         TCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gDJFpOY7S3/fGY8Hh9ceGDkwtX8O3A8L2uo7Z1AYgas=;
        b=zjIs/r8fQTTH6CMq20bk7XkbChpzVFleLkLcZaNdjlqHWopj1cpu3AClSZqawKK4lN
         bZ7Bg/32WLbfs0DrettZ9LX75skQg6Dl4vvPaPeB7lP0hdbs/RUsOb9YxTwpdXXLbHCI
         MeYu3EyRt9WKKaAk2LPdW26Van9aVahACHLRsL3GmLKU1b0ahtdauYXlMlNTtRoJISkz
         meG+NEGWgrIZftyfI3TTF18dhzns/Aam0VzAZnfdDPVwsbydbeWaY0fyoagxnk6jufdN
         Im68m/kVuoX870y+9PHU7igiAM9E7doDPSOU5ghhPw1IvDh2gkXhune9t1yqn3eHgrj4
         epJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n197si5843867yba.179.2019.03.12.15.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 15:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3qKl-0001rX-L3
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 18:57:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKc-0001pR-1q
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKa-0005tC-GN
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:57:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3qKa-0005sb-7A; Tue, 12 Mar 2019 18:57:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C290C049D63;
	Tue, 12 Mar 2019 22:57:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDFAA6919F;
	Tue, 12 Mar 2019 22:56:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 23:56:30 +0100
Message-Id: <20190312225632.29777-3-philmd@redhat.com>
In-Reply-To: <20190312225632.29777-1-philmd@redhat.com>
References: <20190312225632.29777-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Mar 2019 22:57:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 2/4] hw/firmware: Add Edk2Crypto and
 edk2_add_host_crypto_policy()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPB2BuRAVzFT

The Edk2Crypto object is used to hold configuration values specific
to EDK2.

The edk2_add_host_crypto_policy() function loads crypto policies
from the host, and register them as fw_cfg named file items.
So far only the 'https' policy is supported.

A usercase example is the 'HTTPS Boof' feature of OVMF [*].

Usage example:

  $ qemu-system-x86_64 \
      --object edk2_crypto,id=3Dhttps,\
              ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
              cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin

(On Fedora these files are provided by the ca-certificates and
crypto-policies packages).

[*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3:
- '-object' -> '--object' in commit description (Eric)
- reworded the 'TODO: g_free' comment
v4:
- INTERFACE_CHECK -> OBJECT_CLASS_CHECK (Markus)
- path -> filename (Markus)
- dropped the 'TODO: g_free' comment (Markus)
- only allow 1 singleton (Markus)
---
 MAINTAINERS                             |   8 ++
 hw/Makefile.objs                        |   1 +
 hw/firmware/Makefile.objs               |   1 +
 hw/firmware/uefi_edk2_crypto_policies.c | 182 ++++++++++++++++++++++++
 include/hw/firmware/uefi_edk2.h         |  30 ++++
 5 files changed, 222 insertions(+)
 create mode 100644 hw/firmware/Makefile.objs
 create mode 100644 hw/firmware/uefi_edk2_crypto_policies.c
 create mode 100644 include/hw/firmware/uefi_edk2.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d326756079..1d6c30cab4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2207,6 +2207,14 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
=20
+EDK2 Firmware
+M: Laszlo Ersek <lersek@redhat.com>
+M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+S: Maintained
+F: docs/interop/firmware.json
+F: hw/firmware/uefi_edk2_crypto_policies.c
+F: include/hw/firmware/uefi_edk2.h
+
 Usermode Emulation
 ------------------
 Overall
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 82aa7fab8e..2b075aa1e0 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -8,6 +8,7 @@ devices-dirs-$(CONFIG_SOFTMMU) +=3D char/
 devices-dirs-$(CONFIG_SOFTMMU) +=3D cpu/
 devices-dirs-$(CONFIG_SOFTMMU) +=3D display/
 devices-dirs-$(CONFIG_SOFTMMU) +=3D dma/
+devices-dirs-$(CONFIG_SOFTMMU) +=3D firmware/
 devices-dirs-$(CONFIG_SOFTMMU) +=3D gpio/
 devices-dirs-$(CONFIG_HYPERV) +=3D hyperv/
 devices-dirs-$(CONFIG_I2C) +=3D i2c/
diff --git a/hw/firmware/Makefile.objs b/hw/firmware/Makefile.objs
new file mode 100644
index 0000000000..ea1f6d44df
--- /dev/null
+++ b/hw/firmware/Makefile.objs
@@ -0,0 +1 @@
+common-obj-y +=3D uefi_edk2_crypto_policies.o
diff --git a/hw/firmware/uefi_edk2_crypto_policies.c b/hw/firmware/uefi_e=
dk2_crypto_policies.c
new file mode 100644
index 0000000000..c253115142
--- /dev/null
+++ b/hw/firmware/uefi_edk2_crypto_policies.c
@@ -0,0 +1,182 @@
+/*
+ * UEFI EDK2 Support
+ *
+ * Copyright (c) 2019 Red Hat Inc.
+ *
+ * Author:
+ *  Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "hw/firmware/uefi_edk2.h"
+
+
+#define TYPE_EDK2_CRYPTO "edk2_crypto"
+
+#define EDK2_CRYPTO_CLASS(klass) \
+     OBJECT_CLASS_CHECK(Edk2CryptoClass, (klass), \
+                        TYPE_EDK2_CRYPTO)
+#define EDK2_CRYPTO_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(Edk2CryptoClass, (obj), \
+                      TYPE_EDK2_CRYPTO)
+#define EDK2_CRYPTO(obj) \
+     OBJECT_CHECK(Edk2Crypto, (obj), \
+                  TYPE_EDK2_CRYPTO)
+
+typedef struct Edk2Crypto {
+    Object parent_obj;
+
+    bool initialized;
+
+    /*
+     * Path to the acceptable ciphersuites and the preferred order from
+     * the host-side crypto policy.
+     */
+    char *ciphers_filename;
+
+    /* Path to the trusted CA certificates configured on the host side. =
*/
+    char *cacerts_filename;
+} Edk2Crypto;
+
+typedef struct Edk2CryptoClass {
+    ObjectClass parent_class;
+} Edk2CryptoClass;
+
+
+static void edk2_crypto_prop_set_ciphers(Object *obj, const char *value,
+                                         Error **errp G_GNUC_UNUSED)
+{
+    Edk2Crypto *s =3D EDK2_CRYPTO(obj);
+
+    g_free(s->ciphers_filename);
+    s->ciphers_filename =3D g_strdup(value);
+}
+
+static char *edk2_crypto_prop_get_ciphers(Object *obj,
+                                          Error **errp G_GNUC_UNUSED)
+{
+    Edk2Crypto *s =3D EDK2_CRYPTO(obj);
+
+    return g_strdup(s->ciphers_filename);
+}
+
+static void edk2_crypto_prop_set_cacerts(Object *obj, const char *value,
+                                         Error **errp G_GNUC_UNUSED)
+{
+    Edk2Crypto *s =3D EDK2_CRYPTO(obj);
+
+    g_free(s->cacerts_filename);
+    s->cacerts_filename =3D g_strdup(value);
+}
+
+static char *edk2_crypto_prop_get_cacerts(Object *obj,
+                                          Error **errp G_GNUC_UNUSED)
+{
+    Edk2Crypto *s =3D EDK2_CRYPTO(obj);
+
+    return g_strdup(s->cacerts_filename);
+}
+
+static void edk2_crypto_finalize(Object *obj)
+{
+    Edk2Crypto *s =3D EDK2_CRYPTO(obj);
+
+    g_free(s->ciphers_filename);
+    g_free(s->cacerts_filename);
+}
+
+static void edk2_crypto_class_init(ObjectClass *oc, void *data)
+{
+    object_class_property_add_str(oc, "ciphers",
+                                  edk2_crypto_prop_get_ciphers,
+                                  edk2_crypto_prop_set_ciphers,
+                                  NULL);
+    object_class_property_add_str(oc, "cacerts",
+                                  edk2_crypto_prop_get_cacerts,
+                                  edk2_crypto_prop_set_cacerts,
+                                  NULL);
+}
+
+static const TypeInfo edk2_crypto_info =3D {
+    .parent =3D TYPE_OBJECT,
+    .name =3D TYPE_EDK2_CRYPTO,
+    .instance_size =3D sizeof(Edk2Crypto),
+    .instance_finalize =3D edk2_crypto_finalize,
+    .class_size =3D sizeof(Edk2CryptoClass),
+    .class_init =3D edk2_crypto_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void edk2_crypto_register_types(void)
+{
+    type_register_static(&edk2_crypto_info);
+}
+
+type_init(edk2_crypto_register_types);
+
+static Edk2Crypto *edk2_crypto_by_id(const char *edk_crypto_id, Error **=
errp)
+{
+    Object *obj;
+    Object *container;
+
+    container =3D object_get_objects_root();
+    obj =3D object_resolve_path_component(container,
+                                        edk_crypto_id);
+    if (!obj) {
+        error_setg(errp, "Cannot find EDK2 crypto object ID %s",
+                   edk_crypto_id);
+        return NULL;
+    }
+
+    if (!object_dynamic_cast(obj, TYPE_EDK2_CRYPTO)) {
+        error_setg(errp, "Object '%s' is not a EDK2 crypto subclass",
+                   edk_crypto_id);
+        return NULL;
+    }
+
+    return EDK2_CRYPTO(obj);
+}
+
+bool edk2_add_host_crypto_policy(FWCfgState *fw_cfg, Error **errp)
+{
+    Edk2Crypto *s;
+    Error *local_err =3D NULL;
+
+    s =3D edk2_crypto_by_id("https", NULL);
+    if (!s) {
+        return true;
+    }
+    if (s->initialized) {
+        error_setg(errp, "EDK2 host crypto policy already initialized");
+        return false;
+    }
+    s->initialized =3D true;
+
+    if (s->ciphers_filename) {
+        if (!fw_cfg_add_file_from_host(fw_cfg, "etc/edk2/https/ciphers",
+                                       s->ciphers_filename, NULL,
+                                       &local_err)) {
+            goto report_error;
+        }
+    }
+    if (s->cacerts_filename) {
+        if (!fw_cfg_add_file_from_host(fw_cfg, "etc/edk2/https/cacerts",
+                                       s->cacerts_filename, NULL,
+                                       &local_err)) {
+            goto report_error;
+        }
+    }
+    return true;
+
+ report_error:
+    error_propagate_prepend(errp, local_err, "EDK2 host crypto policy: "=
);
+    return false;
+}
diff --git a/include/hw/firmware/uefi_edk2.h b/include/hw/firmware/uefi_e=
dk2.h
new file mode 100644
index 0000000000..ff4a5439ce
--- /dev/null
+++ b/include/hw/firmware/uefi_edk2.h
@@ -0,0 +1,30 @@
+/*
+ * UEFI EDK2 Support
+ *
+ * Copyright (c) 2019 Red Hat Inc.
+ *
+ * Author:
+ *  Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_FIRMWARE_UEFI_EDK2_H
+#define HW_FIRMWARE_UEFI_EDK2_H
+
+#include "hw/nvram/fw_cfg.h"
+
+/**
+ * edk2_add_host_crypto_policy:
+ * @s: fw_cfg device being modified
+ * @errp: pointer to a NULL initialized error object
+ *
+ * Add a new named file containing the host crypto policy.
+ *
+ * Returns true on success, false on failure. In the latter case,
+ * an Error object is returned through @errp.
+ */
+bool edk2_add_host_crypto_policy(FWCfgState *fw_cfg, Error **errp);
+
+#endif /* HW_FIRMWARE_UEFI_EDK2_H */
--=20
2.20.1

