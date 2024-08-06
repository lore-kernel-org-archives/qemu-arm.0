Received: by 2002:a05:7022:e994:b0:85:21:bd5b with SMTP id py20csp1887055dlb;
        Tue, 6 Aug 2024 02:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUsJOHoXVVr003G8v2/jwt68t51yNV/1pBicj6zqF3OprNUZd5KJjsCFnWvV+aOZ8Ld6nZJx5ui9JPd4kSv4E4htBis1S5a
X-Google-Smtp-Source: AGHT+IHQ4bA9oWDqw8W/YlkxVzHI0EkKHrRMPI57sUpx4vu1pJnO28dPPBUOfkRhoATa8nb/bVse
X-Received: by 2002:a17:907:7ba1:b0:a7d:a008:abca with SMTP id a640c23a62f3a-a7dc509e2damr996884666b.56.1722935767948;
        Tue, 06 Aug 2024 02:16:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722935767; cv=pass;
        d=google.com; s=arc-20160816;
        b=JIoZCpT0+jwQ+reW5kRz4fpSKYIEXfJhhXXyiAO7G1G9ZlFoDwcl5l4au5CDtUae2V
         WrlAn48GeFDP697ErwT7vMczTliWgvc1/MAjpWV0vdvbobM60d0einGp91+wdGi+VYrT
         QXNt+1A9PSHAJrjGSFLpvBuKfCdTHbzDHWOSTfwImUoDZN3IzDFiwnJ7HyGZOuQ0bL57
         aWOeM0bif90HZYOBM0kmZpAu7Hr1qd9tlok+H/i3xQqZoO1GQUb+/NRG1Pv+fwUyCSZ7
         elflTRTd19/+wfQ3LkzS/oCBoRAG0WuRm2B7j6vTttIws90ZlJQXKz5VLuiY01RhaYFI
         P9Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from;
        bh=7EsrSKSGXLbVZXgHRQEjD4VtFCyQuIlW6nh+x+JbPMo=;
        fh=dtivHIa9qi1D8Nvrs+5d4HXVeVflH7CmhOBXHmhPvV0=;
        b=yjmBq4C+iKa0IVHLf34rxvDk76jkn9tmv40XePbtwf/HpFMyj4SgtnKoXUXV9xhf9/
         fszAxSrWNCT/cJiWcGzQb1mKuvSuzvLBTb3XkKM0upushjgq300clh2QcSaYImAXeP0c
         eFXV5xqxwosGMKFs+Sjk5azAt90Lxy53lgszEfy2pEbtWTQQ9w5taDpEqZLiZSUOup0o
         KdJlj59NqNHqqqdeyjykU1DZJvml8Xn+bQessjCi89eExYttjDVQRybY2Ss9wsl1lkMc
         dxwy6YsAJ5GcXD5LvB+wZKsADxrvymRS0U/69YgHJleBqGSwP7iwWAKNm5Zvo2ARbdxX
         5aWw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-275925-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275925-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-275925-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7dc9d6fa2esi530365766b.429.2024.08.06.02.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 02:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-275925-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-275925-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275925-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 539341F22682
	for <alex.bennee@linaro.org>; Tue,  6 Aug 2024 09:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C9D1BC9FD;
	Tue,  6 Aug 2024 09:16:02 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4ED1BC9E8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Aug 2024 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722935762; cv=none; b=oqEFtUvJDvWjOKZAA7CLcDZKpAMtXTxpogqXNEojTX61TwWfpfNC4Fvdw+NLxKBAbIuTzNM6m20N2/rao/1uSkZPQvslWnJG8Yn08pzyukBoAPb0zVoPiCOm+QLPaEkOAmsycbA4SzmPUSSS+4d7rIPI2vU5U97sw2dUTrwRFBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722935762; c=relaxed/simple;
	bh=YIqj2O9EJr0Ey9WgxTFoPvM0Pa+oxYWwQ39cnF7YPTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h39aJ/PTP5LGXHOK5ZqZfsdq3Z8YWQC13pNKbyS8ip2nZg9cK+yB8hUWM7tT61NZFXnYeQzCrx+WeBJG2fnykIOeB9+rfQ4WmbxkdKDcUFSu6EKaiB6Ta98PuFDhTMewBxwSqQLdKlRc8/jFv8ox8fUQLEV+dFFJcJ45x1pmPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WdSJf1RGcz6H6nL;
	Tue,  6 Aug 2024 17:13:06 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id 66A491404F9;
	Tue,  6 Aug 2024 17:15:56 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (7.191.161.198) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 10:15:56 +0100
Received: from lhrpeml500006.china.huawei.com ([7.191.161.198]) by
 lhrpeml500006.china.huawei.com ([7.191.161.198]) with mapi id 15.01.2507.039;
 Tue, 6 Aug 2024 10:15:56 +0100
From: Shiju Jose <shiju.jose@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
	<michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
Thread-Topic: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
Thread-Index: AQHa5SUrnXMtv9j2GEOPeOVXQpQotLIZ7iog
Date: Tue, 6 Aug 2024 09:15:56 +0000
Message-ID: <cf6581ad2d9846fbaf7ff8b5d424eeeb@huawei.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
 <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
In-Reply-To: <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TUID: AHqo17kEITDE



>-----Original Message-----
>From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>Sent: 02 August 2024 22:44
>Cc: Jonathan Cameron <jonathan.cameron@huawei.com>; Shiju Jose
><shiju.jose@huawei.com>; Mauro Carvalho Chehab
><mchehab+huawei@kernel.org>; Michael S. Tsirkin <mst@redhat.com>; Ani
>Sinha <anisinha@redhat.com>; Dongjiu Geng <gengdongjiu1@gmail.com>; Eric
>Blake <eblake@redhat.com>; Igor Mammedov <imammedo@redhat.com>;
>Markus Armbruster <armbru@redhat.com>; Michael Roth
><michael.roth@amd.com>; Paolo Bonzini <pbonzini@redhat.com>; Peter
>Maydell <peter.maydell@linaro.org>; linux-kernel@vger.kernel.org; qemu-
>arm@nongnu.org; qemu-devel@nongnu.org
>Subject: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic CPE=
R
>error injection
>
>Creates a QMP command to be used for generic ACPI APEI hardware error
>injection (HEST) via GHESv2.
>
>The actual GHES code will be added at the followup patch.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Few minor comments inline.
Signed-off-by: Shiju Jose <shiju.jose@huawei.com>

>---
> MAINTAINERS              |  7 +++++
> hw/acpi/Kconfig          |  5 ++++
> hw/acpi/ghes_cper.c      | 45 ++++++++++++++++++++++++++++++++
> hw/acpi/ghes_cper_stub.c | 18 +++++++++++++
> hw/acpi/meson.build      |  2 ++
> hw/arm/Kconfig           |  5 ++++
> include/hw/acpi/ghes.h   |  7 +++++
> qapi/ghes-cper.json      | 55 ++++++++++++++++++++++++++++++++++++++++
> qapi/meson.build         |  1 +
> qapi/qapi-schema.json    |  1 +
> 10 files changed, 146 insertions(+)
> create mode 100644 hw/acpi/ghes_cper.c
> create mode 100644 hw/acpi/ghes_cper_stub.c  create mode 100644
>qapi/ghes-cper.json
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 98eddf7ae155..655edcb6688c 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
> F: include/hw/acpi/ghes.h
> F: docs/specs/acpi_hest_ghes.rst
>
>+ACPI/HEST/GHES/ARM processor CPER
>+R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>+S: Maintained
>+F: hw/arm/ghes_cper.c
>+F: hw/acpi/ghes_cper_stub.c
>+F: qapi/ghes-cper.json
>+
> ppc4xx
> L: qemu-ppc@nongnu.org
> S: Orphan
>diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig index
>e07d3204eb36..73ffbb82c150 100644
>--- a/hw/acpi/Kconfig
>+++ b/hw/acpi/Kconfig
>@@ -51,6 +51,11 @@ config ACPI_APEI
>     bool
>     depends on ACPI
>
>+config GHES_CPER
>+    bool
>+    depends on ACPI_APEI
>+    default y
>+
> config ACPI_PCI
>     bool
>     depends on ACPI && PCI
>diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c new file mode 10064=
4
>index 000000000000..7aa7e71e90dc
>--- /dev/null
>+++ b/hw/acpi/ghes_cper.c
>@@ -0,0 +1,45 @@
>+/*
>+ * ARM Processor error injection
>+ *
>+ * Copyright(C) 2024 Huawei LTD.
>+ *
>+ * This code is licensed under the GPL version 2 or later. See the
>+ * COPYING file in the top-level directory.
>+ *
>+ */
>+
>+#include "qemu/osdep.h"
>+
>+#include "qemu/base64.h"
>+#include "qemu/error-report.h"
>+#include "qemu/uuid.h"
>+#include "qapi/qapi-commands-ghes-cper.h"
>+#include "hw/acpi/ghes.h"
>+
>+void qmp_ghes_cper(CommonPlatformErrorRecord *qmp_cper,
>+                   Error **errp)
>+{
>+    int rc;
>+    AcpiGhesCper cper;
>+    QemuUUID be_uuid, le_uuid;
>+
>+    rc =3D qemu_uuid_parse(qmp_cper->notification_type, &be_uuid);
>+    if (rc) {
>+        error_setg(errp, "GHES: Invalid UUID: %s",
>+                   qmp_cper->notification_type);
>+        return;
>+    }
>+
>+    le_uuid =3D qemu_uuid_bswap(be_uuid);
>+    cper.guid =3D le_uuid.data;
>+
>+    cper.data =3D qbase64_decode(qmp_cper->raw_data, -1,
>+                               &cper.data_len, errp);
>+    if (!cper.data) {
>+        return;
>+    }
>+
>+    /* TODO: call a function at ghes */
>+
>+    g_free(cper.data);
>+}
>diff --git a/hw/acpi/ghes_cper_stub.c b/hw/acpi/ghes_cper_stub.c new file
>mode 100644 index 000000000000..7ce6ed70a265
>--- /dev/null
>+++ b/hw/acpi/ghes_cper_stub.c
>@@ -0,0 +1,18 @@
>+/*
>+ * ARM Processor error injection
>+ *
>+ * Copyright(C) 2024 Huawei LTD.
>+ *
>+ * This code is licensed under the GPL version 2 or later. See the
>+ * COPYING file in the top-level directory.
>+ *
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "qapi/error.h"
>+#include "qapi/qapi-commands-ghes-cper.h"
>+#include "hw/acpi/ghes.h"
>+
>+void qmp_ghes_cper(CommonPlatformErrorRecord *cper, Error **errp) { }
May be add an unsupported or similar log in the stub function?=20

>diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build index
>fa5c07db9068..6cbf430eb66d 100644
>--- a/hw/acpi/meson.build
>+++ b/hw/acpi/meson.build
>@@ -34,4 +34,6 @@ endif
> system_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-bu=
ild-
>stub.c', 'ghes-stub.c', 'acpi_interface.c'))
> system_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge=
-
>stub.c'))
> system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>+system_ss.add(when: 'CONFIG_GHES_CPER', if_true: files('ghes_cper.c'))
>+system_ss.add(when: 'CONFIG_GHES_CPER', if_false:
>+files('ghes_cper_stub.c'))
> system_ss.add(files('acpi-qmp-cmds.c'))
>diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig index
>1ad60da7aa2d..bed6ba27d715 100644
>--- a/hw/arm/Kconfig
>+++ b/hw/arm/Kconfig
>@@ -712,3 +712,8 @@ config ARMSSE
>     select UNIMP
>     select SSE_COUNTER
>     select SSE_TIMER
>+
>+config GHES_CPER
>+    bool
>+    depends on ARM
>+    default y if AARCH64
>diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h index
>33be1eb5acf4..06a5b8820cd5 100644
>--- a/include/hw/acpi/ghes.h
>+++ b/include/hw/acpi/ghes.h
>@@ -23,6 +23,7 @@
> #define ACPI_GHES_H
>
> #include "hw/acpi/bios-linker-loader.h"
>+#include "qapi/error.h"
> #include "qemu/notify.h"
>
> extern NotifierList generic_error_notifiers; @@ -78,6 +79,12 @@ void
>acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                           GArray *hardware_errors);  int
>acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
>
>+typedef struct AcpiGhesCper {
>+    uint8_t *guid;
>+    uint8_t *data;
>+    size_t data_len;
>+} AcpiGhesCper;
>+
> /**
>  * acpi_ghes_present: Report whether ACPI GHES table is present
>  *
>diff --git a/qapi/ghes-cper.json b/qapi/ghes-cper.json new file mode 10064=
4
>index 000000000000..3cc4f9f2aaa9
>--- /dev/null
>+++ b/qapi/ghes-cper.json
>@@ -0,0 +1,55 @@
>+# -*- Mode: Python -*-
>+# vim: filetype=3Dpython
>+
>+##
>+# =3D GHESv2 CPER Error Injection
>+#
>+# These are defined at
>+# ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2 # (GHESv2
>+- Type 10) ##
>+
>+##
>+# @CommonPlatformErrorRecord:
>+#
>+# Common Platform Error Record - CPER - as defined at the UEFI #
>+specification.  See #
>+https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.htm
>+l#record-header
>+# for more details.
>+#
>+# @notification-type: pre-assigned GUID string indicating the record
>+#   association with an error event notification type, as defined
>+#   at
>https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html
>#record-header
>+#
>+# @raw-data: Contains a base64 encoded string with the payload of
>+#   the CPER.
>+#
>+# Since: 9.2
>+##
>+{ 'struct': 'CommonPlatformErrorRecord',
>+  'data': {
>+      'notification-type': 'str',
>+      'raw-data': 'str'
>+  }
>+}
>+
>+##
>+# @ghes-cper:
>+#
>+# Inject ARM Processor error with data to be filled according with #
>+ACPI 6.2 GHESv2 spec.
 Since ghes-cper is  generic interface, mentioning term "ARM Processor erro=
r" here may not be appropriate? =20

>+#
>+# @cper: a single CPER record to be sent to the guest OS.
>+#
>+# Features:
>+#
>+# @unstable: This command is experimental.
>+#
>+# Since: 9.2
>+##
>+{ 'command': 'ghes-cper',
>+  'data': {
>+    'cper': 'CommonPlatformErrorRecord'
>+  },
>+  'features': [ 'unstable' ]
>+}
>diff --git a/qapi/meson.build b/qapi/meson.build index
>e7bc54e5d047..bd13cd7d40c9 100644
>--- a/qapi/meson.build
>+++ b/qapi/meson.build
>@@ -35,6 +35,7 @@ qapi_all_modules =3D [
>   'dump',
>   'ebpf',
>   'error',
>+  'ghes-cper',
>   'introspect',
>   'job',
>   'machine-common',
>diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json index
>b1581988e4eb..c1a267399fe5 100644
>--- a/qapi/qapi-schema.json
>+++ b/qapi/qapi-schema.json
>@@ -75,6 +75,7 @@
> { 'include': 'misc-target.json' }
> { 'include': 'audio.json' }
> { 'include': 'acpi.json' }
>+{ 'include': 'ghes-cper.json' }
> { 'include': 'pci.json' }
> { 'include': 'stats.json' }
> { 'include': 'virtio.json' }
>--
>2.45.2

Thanks,
Shiju
