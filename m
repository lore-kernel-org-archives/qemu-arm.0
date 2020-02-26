Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3540644lfg;
        Wed, 26 Feb 2020 13:01:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxseyWEsNbCfI/l38F+mDtx+BUd68QNMrSGAbtr/mPtnWg2ICF8IWSgCDEAo6G4O4xWwH4r
X-Received: by 2002:ac8:5208:: with SMTP id r8mr856460qtn.131.1582750862571;
        Wed, 26 Feb 2020 13:01:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582750862; cv=none;
        d=google.com; s=arc-20160816;
        b=vWcDvR78uCvXFn/xs1bi9EHFOpIeGclmPVGS9Md9/aMWZG1cmEcomwookbWkBTSfo+
         Z/On81qvLBG3KyF2T5kEmb5bxtv6kS00OenN+kdq+tm/Ebj5NAxhvWcFqVA7MJqRjfH+
         N5TTJvfS5oqqtRVyRdu+eLEyMYNntNUTULRlsc7qNxhlTRf9yQvEGlXGPwLQ1AlTwb+E
         A3TzZGqflx8NlXr9CAwlr5J7g3aYOxs79EAKMFAwxvGVXu0lGZVG4ZFXzZ/vdEe94yQ+
         0XBncNYTfyAsBKtT5ZsUrc+szZ1NFfRf2LXBHqdA4z6xA69+aNekk/MQDrqLFTaIW/rW
         7Cuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9MgS0zRkLYHA7RulMO5RaxwHBvWpUCwd72ihYKie/Vw=;
        b=Meg6DlbzVaNplBsKA/74A2oZvIuaPkTE3RE/WxvPx7K/Yi8df0HRvW3KBzaDRQw3K9
         ulRu0NWzUxRcuMB5twRtmQTJA4yVJt4Eb5Xp5yScTN/Z59V04K3a5Uo4DZU4CNT6siNX
         WTF9eqMgY/kKhJndUr7NOjtwce7aZmHtAC40f6lh7v7yP8FSHdGr95hUbsY9CRHlweF/
         VydCTMh5iQLHhiPB4f3VxJzu5tz9aohW5CFRbQ1qI+LlhuXCNxpEKt7Zpu6M4n933GYH
         iNlbgUkJ3k4Wy5o0r+lGOj7OQ7yO7FeCLeJdo7DH765WAVblvP03xpEPTyThCgEl/yW9
         MgJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LYZU1Uy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p62si348616qtd.126.2020.02.26.13.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:01:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LYZU1Uy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73nh-0007Ua-UT
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73nE-00074g-9O
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73nC-0002ex-IV
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22753
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73nC-0002ed-B6
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MgS0zRkLYHA7RulMO5RaxwHBvWpUCwd72ihYKie/Vw=;
 b=LYZU1Uy/P4pymoGqZn515P3QVFI15EbR38uhtVLKtocc2koytSGPJ+3JzrEjLUyMrYq14A
 5Y+9XKrwqtIJH+t5+N/T6RmGNuP0YyAP3ZI4X9LjhCkApKXqY3kt7hXwFeYXMS/euoPOom
 9lG9s/h4W0NGbM2e2JoGigkKlR2mVBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-Msvqyrp8M9ewafa375WTKg-1; Wed, 26 Feb 2020 16:00:28 -0500
X-MC-Unique: Msvqyrp8M9ewafa375WTKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82F3800053;
 Wed, 26 Feb 2020 21:00:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 709935C296;
 Wed, 26 Feb 2020 21:00:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 05/10] tpm: Add the SysBus TPM TIS device
Date: Wed, 26 Feb 2020 21:59:37 +0100
Message-Id: <20200226205942.11424-6-eric.auger@redhat.com>
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
References: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DBGEfXV3o4o/

Introduce the tpm-tis-device which is a sysbus device
and is bound to be used on ARM.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

---

v2 -> v3:
- Added Stefan's R-b
---
 hw/tpm/Kconfig          |   5 ++
 hw/tpm/Makefile.objs    |   1 +
 hw/tpm/tpm_tis_sysbus.c | 159 ++++++++++++++++++++++++++++++++++++++++
 include/sysemu/tpm.h    |   1 +
 4 files changed, 166 insertions(+)
 create mode 100644 hw/tpm/tpm_tis_sysbus.c

diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index 686f8206bb..4794e7fe28 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -7,6 +7,11 @@ config TPM_TIS_ISA
     depends on TPM && ISA_BUS
     select TPM_TIS
=20
+config TPM_TIS_SYSBUS
+    bool
+    depends on TPM
+    select TPM_TIS
+
 config TPM_TIS
     bool
     depends on TPM
diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
index 3ef2036cca..f1ec4beb95 100644
--- a/hw/tpm/Makefile.objs
+++ b/hw/tpm/Makefile.objs
@@ -1,6 +1,7 @@
 common-obj-$(CONFIG_TPM) +=3D tpm_util.o
 obj-$(call lor,$(CONFIG_TPM_TIS),$(CONFIG_TPM_CRB)) +=3D tpm_ppi.o
 common-obj-$(CONFIG_TPM_TIS_ISA) +=3D tpm_tis_isa.o
+common-obj-$(CONFIG_TPM_TIS_SYSBUS) +=3D tpm_tis_sysbus.o
 common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_common.o
 common-obj-$(CONFIG_TPM_CRB) +=3D tpm_crb.o
 common-obj-$(CONFIG_TPM_PASSTHROUGH) +=3D tpm_passthrough.o
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
new file mode 100644
index 0000000000..18c02aed67
--- /dev/null
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -0,0 +1,159 @@
+/*
+ * tpm_tis_sysbus.c - QEMU's TPM TIS SYSBUS Device
+ *
+ * Copyright (C) 2006,2010-2013 IBM Corporation
+ *
+ * Authors:
+ *  Stefan Berger <stefanb@us.ibm.com>
+ *  David Safford <safford@us.ibm.com>
+ *
+ * Xen 4 support: Andrease Niederl <andreas.niederl@iaik.tugraz.at>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ * Implementation of the TIS interface according to specs found at
+ * http://www.trustedcomputinggroup.org. This implementation currently
+ * supports version 1.3, 21 March 2013
+ * In the developers menu choose the PC Client section then find the TIS
+ * specification.
+ *
+ * TPM TIS for TPM 2 implementation following TCG PC Client Platform
+ * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "tpm_util.h"
+#include "hw/sysbus.h"
+#include "tpm_tis.h"
+
+typedef struct TPMStateSysBus {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    TPMState state; /* not a QOM object */
+} TPMStateSysBus;
+
+#define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj), TYPE_TPM_T=
IS_SYSBUS)
+
+static int tpm_tis_pre_save_sysbus(void *opaque)
+{
+    TPMStateSysBus *sbdev =3D opaque;
+
+    return tpm_tis_pre_save(&sbdev->state);
+}
+
+static const VMStateDescription vmstate_tpm_tis_sysbus =3D {
+    .name =3D "tpm-tis",
+    .version_id =3D 0,
+    .pre_save  =3D tpm_tis_pre_save_sysbus,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_BUFFER(state.buffer, TPMStateSysBus),
+        VMSTATE_UINT16(state.rw_offset, TPMStateSysBus),
+        VMSTATE_UINT8(state.active_locty, TPMStateSysBus),
+        VMSTATE_UINT8(state.aborting_locty, TPMStateSysBus),
+        VMSTATE_UINT8(state.next_locty, TPMStateSysBus),
+
+        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateSysBus, TPM_TIS_NUM_LOCALI=
TIES,
+                             0, vmstate_locty, TPMLocality),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void tpm_tis_sysbus_request_completed(TPMIf *ti, int ret)
+{
+    TPMStateSysBus *sbdev =3D TPM_TIS_SYSBUS(ti);
+    TPMState *s =3D &sbdev->state;
+
+    tpm_tis_request_completed(s, ret);
+}
+
+static enum TPMVersion tpm_tis_sysbus_get_tpm_version(TPMIf *ti)
+{
+    TPMStateSysBus *sbdev =3D TPM_TIS_SYSBUS(ti);
+    TPMState *s =3D &sbdev->state;
+
+    return tpm_tis_get_tpm_version(s);
+}
+
+static void tpm_tis_sysbus_reset(DeviceState *dev)
+{
+    TPMStateSysBus *sbdev =3D TPM_TIS_SYSBUS(dev);
+    TPMState *s =3D &sbdev->state;
+
+    return tpm_tis_reset(s);
+}
+
+static Property tpm_tis_sysbus_properties[] =3D {
+    DEFINE_PROP_UINT32("irq", TPMStateSysBus, state.irq_num, TPM_TIS_IRQ),
+    DEFINE_PROP_TPMBE("tpmdev", TPMStateSysBus, state.be_driver),
+    DEFINE_PROP_BOOL("ppi", TPMStateSysBus, state.ppi_enabled, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void tpm_tis_sysbus_initfn(Object *obj)
+{
+    TPMStateSysBus *sbdev =3D TPM_TIS_SYSBUS(obj);
+    TPMState *s =3D &sbdev->state;
+
+    memory_region_init_io(&s->mmio, obj, &tpm_tis_memory_ops,
+                          s, "tpm-tis-mmio",
+                          TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT=
);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+}
+
+static void tpm_tis_sysbus_realizefn(DeviceState *dev, Error **errp)
+{
+    TPMStateSysBus *sbdev =3D TPM_TIS_SYSBUS(dev);
+    TPMState *s =3D &sbdev->state;
+
+    if (!tpm_find()) {
+        error_setg(errp, "at most one TPM device is permitted");
+        return;
+    }
+
+    if (!s->be_driver) {
+        error_setg(errp, "'tpmdev' property is required");
+        return;
+    }
+}
+
+static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    TPMIfClass *tc =3D TPM_IF_CLASS(klass);
+
+    device_class_set_props(dc, tpm_tis_sysbus_properties);
+    dc->vmsd  =3D &vmstate_tpm_tis_sysbus;
+    tc->model =3D TPM_MODEL_TPM_TIS;
+    dc->realize =3D tpm_tis_sysbus_realizefn;
+    dc->user_creatable =3D true;
+    dc->reset =3D tpm_tis_sysbus_reset;
+    tc->request_completed =3D tpm_tis_sysbus_request_completed;
+    tc->get_version =3D tpm_tis_sysbus_get_tpm_version;
+}
+
+static const TypeInfo tpm_tis_sysbus_info =3D {
+    .name =3D TYPE_TPM_TIS_SYSBUS,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(TPMStateSysBus),
+    .instance_init =3D tpm_tis_sysbus_initfn,
+    .class_init  =3D tpm_tis_sysbus_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_TPM_IF },
+        { }
+    }
+};
+
+static void tpm_tis_sysbus_register(void)
+{
+    type_register_static(&tpm_tis_sysbus_info);
+}
+
+type_init(tpm_tis_sysbus_register)
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 1691b92c28..f37851b1aa 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -44,6 +44,7 @@ typedef struct TPMIfClass {
 } TPMIfClass;
=20
 #define TYPE_TPM_TIS_ISA            "tpm-tis"
+#define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
 #define TYPE_TPM_CRB                "tpm-crb"
 #define TYPE_TPM_SPAPR              "tpm-spapr"
=20
--=20
2.20.1

