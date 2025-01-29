Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3617271njk;
        Wed, 29 Jan 2025 00:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXgb66qjU6kY/TTPTNQrEir5quZ+vKJzSuqCsMqCk+WoaOpiTS7/obfwKKx65dMlePYn3MM/wuiVwErJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFD5cdMSCYp1/JcfWhmB+MKlmkr62VW5vOW5mapkyvfVXqszEgfI5KHhgKrh+YBp7kBlPRI
X-Received: by 2002:a17:907:7f26:b0:ab3:30c5:f6d3 with SMTP id a640c23a62f3a-ab6cfcb3a8bmr225075866b.9.1738137945716;
        Wed, 29 Jan 2025 00:05:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137945; cv=pass;
        d=google.com; s=arc-20240605;
        b=PPsLIF8EtFfhF9OncXFoqJvCa2ACJ68t6ZE9AGgcEHENaOKhrXm43tlOxuzMu5ojr0
         hAPXTUaA36yRdGF53cgru2N8/2mNHEdgwTjQhM0bIkSn4UF4tTGyslSV45Xy9QjU6Luo
         2EmExm/RfaDc+HmeNV1v8eH0XE6665a6o2fnaj9jvqMGJhVoQjb1pI+Db4+v+m7UrnhQ
         r3LOzhY2bMNxhuJOdx6aYBB84C1R/V1ku1O1fJLlnGy0w17K4EDSII7q5QnQRIW65i7u
         whOwh7heUW6TnR96kkC5sVGJZYl8wg+OcoQ2fJfJlSoHTRr246t6EVKU+jlfsAgYvx7P
         rx0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=srcIE/cKYSWyxazvxMNXeJa8d5Bd/WW5pS+RQXr6IoU=;
        fh=UDHcy7/9XtsBt6gMmc4ALsq+td4kcmvUIYwY5NsQm0E=;
        b=isCZfYRcrmbWGQ9i0gaZ5vxdAS0NP0Lk+cYkqMeObcizar3oxpA/Y//9k68y7qOv1O
         te4dMe+x8votp4sOT09FJZOpj55pDnjkWULY95LfkuzPXtbLJ/CwiyPxSkRaJdzh15xd
         reQ0Kk6idH7Z/J3SR2Lvw0JctxecCMS2lImJlFt33VtKgitALPtDrfVlv/HCEPCig8fV
         FsAdC4RUySho3l4iNkZnKGG1X2wye4n2ZOjwrD0EJvryzPSmoSPKuLg3f59BrrbrOHmp
         eBhGFq8hWbrJG4CfS4j5MMbwXf1LGjGHz5IsnEZGEnGnv9P5zA0DMP3S7BiT1YlFNvIr
         /cwA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="r+4Bvj/H";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492176-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492176-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492176-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab69000b471si613228166b.694.2025.01.29.00.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492176-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="r+4Bvj/H";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492176-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492176-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C973B1888EE7
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9357C1AC435;
	Wed, 29 Jan 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+4Bvj/H"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B13119993B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=FvkkI9hCcNzpaC0YifHtNHLL3hXdUs4faMWtplu+yJaZYQxTSRh79LzB9N6Y3q6FQFeuHh1ctHkqastFnCfbtKpq0XxLiPklkG4p0XMaUeHsdxLEum9I5ETM5p5ttTAv/jNnC6xKKg5V6pTI1cOanC/GSOfgj+M4T2hULCku+g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=BW2gABilgAqpOmee6YYHTP5ZxVti8bMxI7sEl/vZOdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcsunLJ43Gfa3OhzYr3GSYGEtcBNAHslAJlYhmwMhbF7i8sX53OYRWus8n29REumcT/ro5fBHak/Q+CMkZqp/xXiBa+Vki4nJ5nGshsfY3FrvArmI/zI6OUcEc9bbK87mGbibt9skCek82rS2OdVsGPY9jpJ1WRjmBKo/TKzzXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+4Bvj/H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E0AC4CED3;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=BW2gABilgAqpOmee6YYHTP5ZxVti8bMxI7sEl/vZOdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+4Bvj/HZBxCwfDWNYkxS+/n1pDfI2Pd57/D/7v5LsGuXR+XqFZz+GRt7UutqICVC
	 vuXUMOti85hp5rCmR+E2/SiiY9Pgbkptf2EAYGXBoa25x27jXs0ehWvYn92sAhUnvh
	 j78sK5DqvxL7/N+OMZXCGvvoaEu8ZrS0bs4p//DKWE/3QgKekG7sfS4+PboRiOYavm
	 uPoBIFkai2OotX6RnL3rd1lXozmmjq6sfHCBUcwR0Cg5LNfGOSckyEorwVRoPjX6g0
	 +HwAncNbNBggz2eCQeW7HRqsimjZp/CC7fYfQX0+f7OZ0WIZ56g5my/cUKsyFV0+Yq
	 EtuWWhMktVlyA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DQE-3xBG;
	Wed, 29 Jan 2025 09:04:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] qapi/acpi-hest: add an interface to do generic CPER error injection
Date: Wed, 29 Jan 2025 09:04:17 +0100
Message-ID: <51cae151a0b5398269ab22be3ee5a6eb506e8d1f.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: JiR4EHIRJOUM

Creates a QMP command to be used for generic ACPI APEI hardware error
injection (HEST) via GHESv2, and add support for it for ARM guests.

Error injection uses ACPI_HEST_SRC_ID_QMP source ID to be platform
independent. This is mapped at arch virt bindings, depending on the
types supported by QEMU and by the BIOS. So, on ARM, this is supported
via ACPI_GHES_NOTIFY_GPIO notification type.

This patch is co-authored:
    - original ghes logic to inject a simple ARM record by Shiju Jose;
    - generic logic to handle block addresses by Jonathan Cameron;
    - generic GHESv2 error inject by Mauro Carvalho Chehab;

Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---

Changes since v9:
- ARM source IDs renamed to reflect SYNC/ASYNC;
- command name changed to better reflect what it does;
- some improvements at JSON documentation;
- add a check for QMP source at the notification logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS              |  7 +++++++
 hw/acpi/Kconfig          |  5 +++++
 hw/acpi/ghes.c           |  2 +-
 hw/acpi/ghes_cper.c      | 38 ++++++++++++++++++++++++++++++++++++++
 hw/acpi/ghes_cper_stub.c | 19 +++++++++++++++++++
 hw/acpi/meson.build      |  2 ++
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            |  7 +++++++
 include/hw/acpi/ghes.h   |  1 +
 include/hw/arm/virt.h    |  1 +
 qapi/acpi-hest.json      | 35 +++++++++++++++++++++++++++++++++++
 qapi/meson.build         |  1 +
 qapi/qapi-schema.json    |  1 +
 13 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 hw/acpi/ghes_cper.c
 create mode 100644 hw/acpi/ghes_cper_stub.c
 create mode 100644 qapi/acpi-hest.json

diff --git a/MAINTAINERS b/MAINTAINERS
index 846b81e3ec03..8e1f662fa0e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
 F: include/hw/acpi/ghes.h
 F: docs/specs/acpi_hest_ghes.rst
 
+ACPI/HEST/GHES/ARM processor CPER
+R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+S: Maintained
+F: hw/arm/ghes_cper.c
+F: hw/acpi/ghes_cper_stub.c
+F: qapi/acpi-hest.json
+
 ppc4xx
 L: qemu-ppc@nongnu.org
 S: Orphan
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1d4e9f0845c0..daabbe6cd11e 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -51,6 +51,11 @@ config ACPI_APEI
     bool
     depends on ACPI
 
+config GHES_CPER
+    bool
+    depends on ACPI_APEI
+    default y
+
 config ACPI_PCI
     bool
     depends on ACPI && PCI
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 849abfa12187..ef57ad14a38b 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -546,7 +546,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
+    notifier_list_notify(&acpi_generic_error_notifiers, &source_id);
 }
 
 int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
new file mode 100644
index 000000000000..0a2d95dd8b27
--- /dev/null
+++ b/hw/acpi/ghes_cper.c
@@ -0,0 +1,38 @@
+/*
+ * CPER payload parser for error injection
+ *
+ * Copyright(C) 2024-2025 Huawei LTD.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/base64.h"
+#include "qemu/error-report.h"
+#include "qemu/uuid.h"
+#include "qapi/qapi-commands-acpi-hest.h"
+#include "hw/acpi/ghes.h"
+
+void qmp_inject_ghes_v2_error(const char *qmp_cper, Error **errp)
+{
+    AcpiGhesState *ags;
+
+    ags = acpi_ghes_get_state();
+    if (!ags) {
+        return;
+    }
+
+    uint8_t *cper;
+    size_t  len;
+
+    cper = qbase64_decode(qmp_cper, -1, &len, errp);
+    if (!cper) {
+        error_setg(errp, "missing GHES CPER payload");
+        return;
+    }
+
+    ghes_record_cper_errors(ags, cper, len, ACPI_HEST_SRC_ID_QMP, errp);
+}
diff --git a/hw/acpi/ghes_cper_stub.c b/hw/acpi/ghes_cper_stub.c
new file mode 100644
index 000000000000..5ebc61970a78
--- /dev/null
+++ b/hw/acpi/ghes_cper_stub.c
@@ -0,0 +1,19 @@
+/*
+ * Stub interface for CPER payload parser for error injection
+ *
+ * Copyright(C) 2024-2025 Huawei LTD.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-acpi-hest.h"
+#include "hw/acpi/ghes.h"
+
+void qmp_inject_ghes_v2_error(const char *cper, Error **errp)
+{
+    error_setg(errp, "GHES QMP error inject is not compiled in");
+}
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 73f02b96912b..56b5d1ec9691 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -34,4 +34,6 @@ endif
 system_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
 system_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
 system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
+system_ss.add(when: 'CONFIG_GHES_CPER', if_true: files('ghes_cper.c'))
+system_ss.add(when: 'CONFIG_GHES_CPER', if_false: files('ghes_cper_stub.c'))
 system_ss.add(files('acpi-qmp-cmds.c'))
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index af8588330103..7d3580244179 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -896,6 +896,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
 
 static const AcpiNotificationSourceId hest_ghes_notify[] = {
     { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+    { ACPI_HEST_SRC_ID_QMP, ACPI_GHES_NOTIFY_GPIO },
 };
 
 static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e272b35ea114..9074a540197d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1012,6 +1012,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
 
 static void virt_generic_error_req(Notifier *n, void *opaque)
 {
+    uint16_t *source_id = opaque;
+
+    /* Currently, only QMP source ID is async */
+    if (*source_id != ACPI_HEST_SRC_ID_QMP) {
+        return;
+    }
+
     VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
 
     acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index e1b66141d01c..376933a0024a 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -71,6 +71,7 @@ typedef struct AcpiGhesState {
  */
 enum AcpiGhesSourceID {
     ACPI_HEST_SRC_ID_SYNC,
+    ACPI_HEST_SRC_ID_QMP,       /* Use it only for QMP injected errors */
 };
 
 typedef struct AcpiNotificationSourceId {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index f3cf28436770..56f270f61cf5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -33,6 +33,7 @@
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
 #include "hw/boards.h"
+#include "hw/acpi/ghes.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/bsa.h"
 #include "hw/block/flash.h"
diff --git a/qapi/acpi-hest.json b/qapi/acpi-hest.json
new file mode 100644
index 000000000000..fff5018c7ec1
--- /dev/null
+++ b/qapi/acpi-hest.json
@@ -0,0 +1,35 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+
+##
+# == GHESv2 CPER Error Injection
+#
+# Defined since ACPI Specification 6.1,
+# section 18.3.2.8 Generic Hardware Error Source version 2. See:
+#
+# https://uefi.org/sites/default/files/resources/ACPI_6_1.pdf
+##
+
+
+##
+# @inject-ghes-v2-error:
+#
+# Inject an error with additional ACPI 6.1 GHESv2 error information
+#
+# @cper: contains a base64 encoded string with raw data for a single
+#     CPER record with Generic Error Status Block, Generic Error Data
+#     Entry and generic error data payload, as described at
+#     https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#format
+#
+# Features:
+#
+# @unstable: This command is experimental.
+#
+# Since: 10.0
+##
+{ 'command': 'inject-ghes-v2-error',
+  'data': {
+    'cper': 'str'
+  },
+  'features': [ 'unstable' ]
+}
diff --git a/qapi/meson.build b/qapi/meson.build
index e7bc54e5d047..35cea6147262 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -59,6 +59,7 @@ qapi_all_modules = [
 if have_system
   qapi_all_modules += [
     'acpi',
+    'acpi-hest',
     'audio',
     'cryptodev',
     'qdev',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index b1581988e4eb..baf19ab73afe 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -75,6 +75,7 @@
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
+{ 'include': 'acpi-hest.json' }
 { 'include': 'pci.json' }
 { 'include': 'stats.json' }
 { 'include': 'virtio.json' }
-- 
2.48.1

