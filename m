Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3827529lfp;
        Mon, 10 Feb 2020 05:16:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPl5zfzLJxDzjax9WfGvhQPY0chJkH/D/0LHVXTdUamtPSIHgDCaZkskocYFy8nDR6DuU2
X-Received: by 2002:a37:a451:: with SMTP id n78mr1189577qke.481.1581340568480;
        Mon, 10 Feb 2020 05:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581340568; cv=none;
        d=google.com; s=arc-20160816;
        b=1IARHzDww3cFIZVuQJDoZDqPZ3MGF2LW/v6BLonnc48KnysFEAvMVDnaR9lrd/fUvd
         i6aVFmWXElcCl2uAaTqdOn0ilk0v+JPhejgRZFMLl4SwPsOrNN20S9RuigCfG6BKUTGI
         HDRDS5tl3TyTuPOHRx3NxXZEhjtYLKnW6yIGWCdJzPsgzALhvDxsEEJ3zN/2XEnWJBjY
         DVlJ683VCjOlk6iTG7xkY7yYI2kkTTLHrSVdJKekh9U6ps7x4vaIwq8HGXuRKMPy3ExC
         vz7bwofHJ3WOuOgVc6OZRXTMeVKuCBWyBB+aNJOq929xAj2oaorkRdbG5sKmAhkvPVy+
         1QJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DravC8YXTkGc7LI6oW602bIznZkWbfHP2rsChoxtCaY=;
        b=auLM/1Xem8XF/VjPJAJE9Iz1sbzN0gLt/r1FI8+GrzS7HjGp99+PL+BrybA3iAFz/B
         lQwRYle/tK+v4bxeGqchB3mpuoCLhO8UbrUDF4sj5xWCX+XouOT3QZXefzAR3Qbzrj8o
         M8rtjsoy1HDfkD37sjQ5Fvr5WwchRxRdjS5HgTLXPH26ehiFlCo8MJUnsq5CZ5zO5O2j
         3rVwXtEKZNb1Oq7ZeIsLRCjAQjzg/wuArjEqedssLzkhE3HfbNw7sOCiVNr+RQpIN6H3
         CLfu23mlXld8iSEtTehPGIUT6Xy9xSH11tjj+ay5wpy58U8Pp3o5qd/yvtqDFM2GeHfa
         pMUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BFEBx4Qu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si153949qvk.94.2020.02.10.05.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BFEBx4Qu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j18v1-000468-UY
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j18uq-00041l-Cc
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j18up-0007JJ-A5
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:15:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44385
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j18up-0007IR-5v
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581340554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DravC8YXTkGc7LI6oW602bIznZkWbfHP2rsChoxtCaY=;
 b=BFEBx4Qu7Wv6tg42jguFL9rPUnGpPoCJ698jWtXYwHsX4l/JWro5Y9reHtF623fCQvDh6Y
 PqQbl81rHYlRzUogEGpwIhbLl2Y82zVyeqLs1fupudFIQ/CI0uUCV0rMmsedkHiWRZhUmu
 gXhtwhXueDYyQtDuHr6mR6ZmAXuA9Xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-3RqJDGWEN_aFKsPGiGkIoA-1; Mon, 10 Feb 2020 08:15:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1446E13E4;
 Mon, 10 Feb 2020 13:15:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB48B26DF6;
 Mon, 10 Feb 2020 13:15:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [RFC 1/2] tpm: Let the TPM TIS device be usable on ARM
Date: Mon, 10 Feb 2020 14:15:22 +0100
Message-Id: <20200210131523.27540-2-eric.auger@redhat.com>
In-Reply-To: <20200210131523.27540-1-eric.auger@redhat.com>
References: <20200210131523.27540-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 3RqJDGWEN_aFKsPGiGkIoA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: Ox00NaNDxSKZ

Implement support for TPM on aarch64 by using the
TPM TIS MMIO frontend. Instead of being an ISA device,
the TPM TIS device becomes a sysbus device on ARM. It is
bound to be dynamically instantiated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

I am aware such kind of #ifde'fy is frown upon but this is just
for starting the discussion
---
 hw/tpm/Kconfig   |  2 +-
 hw/tpm/tpm_tis.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index 9e67d990e8..326c89e6df 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -4,7 +4,7 @@ config TPMDEV
=20
 config TPM_TIS
     bool
-    depends on TPM && ISA_BUS
+    depends on TPM
     select TPMDEV
=20
 config TPM_CRB
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 31facb896d..cfc840942f 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -30,6 +30,7 @@
=20
 #include "hw/acpi/tpm.h"
 #include "hw/pci/pci_ids.h"
+#include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "sysemu/tpm_backend.h"
@@ -65,7 +66,11 @@ typedef struct TPMLocality {
 } TPMLocality;
=20
 typedef struct TPMState {
+#ifdef CONFIG_ISA_BUS
     ISADevice busdev;
+#else
+    SysBusDevice busdev;
+#endif
     MemoryRegion mmio;
=20
     unsigned char buffer[TPM_TIS_BUFFER_MAX];
@@ -967,6 +972,7 @@ static void tpm_tis_realizefn(DeviceState *dev, Error *=
*errp)
         error_setg(errp, "'tpmdev' property is required");
         return;
     }
+#ifdef CONFIG_ISA_BUS
     if (s->irq_num > 15) {
         error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
                    s->irq_num);
@@ -982,6 +988,7 @@ static void tpm_tis_realizefn(DeviceState *dev, Error *=
*errp)
         tpm_ppi_init(&s->ppi, isa_address_space(ISA_DEVICE(dev)),
                      TPM_PPI_ADDR_BASE, OBJECT(s));
     }
+#endif
 }
=20
 static void tpm_tis_initfn(Object *obj)
@@ -991,6 +998,10 @@ static void tpm_tis_initfn(Object *obj)
     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
                           s, "tpm-tis-mmio",
                           TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT=
);
+#ifndef CONFIG_ISA_BUS
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+#endif
 }
=20
 static void tpm_tis_class_init(ObjectClass *klass, void *data)
@@ -1002,6 +1013,7 @@ static void tpm_tis_class_init(ObjectClass *klass, vo=
id *data)
     device_class_set_props(dc, tpm_tis_properties);
     dc->reset =3D tpm_tis_reset;
     dc->vmsd  =3D &vmstate_tpm_tis;
+    dc->user_creatable =3D true;
     tc->model =3D TPM_MODEL_TPM_TIS;
     tc->get_version =3D tpm_tis_get_tpm_version;
     tc->request_completed =3D tpm_tis_request_completed;
@@ -1009,7 +1021,11 @@ static void tpm_tis_class_init(ObjectClass *klass, v=
oid *data)
=20
 static const TypeInfo tpm_tis_info =3D {
     .name =3D TYPE_TPM_TIS,
+#ifdef CONFIG_ISA_BUS
     .parent =3D TYPE_ISA_DEVICE,
+#else
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+#endif
     .instance_size =3D sizeof(TPMState),
     .instance_init =3D tpm_tis_initfn,
     .class_init  =3D tpm_tis_class_init,
--=20
2.20.1

