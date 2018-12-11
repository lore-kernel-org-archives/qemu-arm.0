Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp803885wrt;
        Tue, 11 Dec 2018 08:44:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WCoBxX2qK5Y/4hrx9aTUG7iKNKz7tAilYXwsD2Z5n8nMRatnmfgx9Ol+AJHNZpXwZAFssg
X-Received: by 2002:a37:6710:: with SMTP id b16mr15024332qkc.42.1544546697668;
        Tue, 11 Dec 2018 08:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544546697; cv=none;
        d=google.com; s=arc-20160816;
        b=yYws79HWLcYsZNmgc1NRZ0QC/YEsY/8TQ2BdFf06IG5nHQnfQYdBlpctHe5Li0Zr61
         ErocHFFI3g+Fnuin7ODIfOLDskYkyrLolxLurgsvzwQOBX7l8eF8W4Vf0PAOAUN1qsJI
         miQ0FCytQLkUB9HavcXetBiuQNkBEfeShGScQE5tA6V8IqIzfxXK8t4ydp6uqwPCApYx
         ZDWAqXcdEvtMHE02IDCPKVRZnTV0Vjiigj7avjQ/TVboPHYHBZ4xqs5qQX4PcOMtiSoi
         yM3CKJo8vM8h2VQYj0OI5vMw3zCJ6oHjbEvjaejosQc0mvLVliljjGGrDAYLLaYpq18T
         Cb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=W9tix3yL0608s482oqvQ7HUxZIOmB0ESHHylGmrG5cs=;
        b=bSTIwHf/oKg4ESGgQkcHrB4w+5jReUkaBVAHAMrnM+BW852lB/N6hZaOUMsK6DA9DC
         72CE6jZZ+C8/kXGPee+yw3h5qaMzA3UQ4KbJIrNLNRCkSl6SwrZ65rTfdEvhu+4UmbR8
         54colmM9bP/E9hmfjjRpozj93FRz+Yd8XB6mgXq63J0ZgFhxxFuBQz6sR1NuPLC5Y6Sk
         JuwE1licDoD91cvxm46tLwvLK0ACfT5WeoSKOQiDvbMuvfS0ujeZ1A45m6c0mVLGCwcI
         KtCFy0mIa5lQ/S5P/Q4r0Zh8hpqJBpr8u36KBamGTYt5BcVrz5drgiQvyjXH0kSMtahR
         GSDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y143si1671392qkb.69.2018.12.11.08.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 08:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWl9V-00037S-3R
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 11:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWl06-0003CO-FI
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 11:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzq-0006i5-Qq
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 11:35:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:24053)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gWkzq-0006gm-Dd; Tue, 11 Dec 2018 11:34:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33EA430DE020;
	Tue, 11 Dec 2018 16:34:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-183.brq.redhat.com [10.40.204.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F26265D9CC;
	Tue, 11 Dec 2018 16:34:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 11 Dec 2018 17:34:05 +0100
Message-Id: <20181211163406.3322-4-philmd@redhat.com>
In-Reply-To: <20181211163406.3322-1-philmd@redhat.com>
References: <20181211163406.3322-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 11 Dec 2018 16:34:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/4] hw/smbios: Remove "smbios_ipmi.h"
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
Cc: Corey Minyard <minyard@acm.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zVxcSrF358x3

This header only declare a single function: smbios_build_type_38_table().
We already have a header that declares such functions: "smbios_build.h".
Move the declaration and remove the header.

Reviewed-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/smbios/smbios.c              |  1 -
 hw/smbios/smbios_build.h        |  4 ++++
 hw/smbios/smbios_ipmi.h         | 15 ---------------
 hw/smbios/smbios_type_38-stub.c |  2 +-
 hw/smbios/smbios_type_38.c      |  1 -
 5 files changed, 5 insertions(+), 18 deletions(-)
 delete mode 100644 hw/smbios/smbios_ipmi.h

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 30bd4731cf..9d737642cb 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -28,7 +28,6 @@
 #include "hw/loader.h"
 #include "exec/cpu-common.h"
 #include "smbios_build.h"
-#include "smbios_ipmi.h"
=20
 /* legacy structures and constants for <=3D 2.0 machines */
 struct smbios_header {
diff --git a/hw/smbios/smbios_build.h b/hw/smbios/smbios_build.h
index 93b360d520..56b5a1e3f3 100644
--- a/hw/smbios/smbios_build.h
+++ b/hw/smbios/smbios_build.h
@@ -3,6 +3,7 @@
  *
  * Copyright (C) 2009 Hewlett-Packard Development Company, L.P.
  * Copyright (C) 2013 Red Hat, Inc.
+ * Copyright (c) 2015,2016 Corey Minyard, MontaVista Software, LLC
  *
  * Authors:
  *  Alex Williamson <alex.williamson@hp.com>
@@ -96,4 +97,7 @@ extern unsigned smbios_table_cnt;
         smbios_table_cnt++;                                             =
  \
     } while (0)
=20
+/* IPMI SMBIOS firmware handling */
+void smbios_build_type_38_table(void);
+
 #endif /* QEMU_SMBIOS_BUILD_H */
diff --git a/hw/smbios/smbios_ipmi.h b/hw/smbios/smbios_ipmi.h
deleted file mode 100644
index 1c9aae38f2..0000000000
--- a/hw/smbios/smbios_ipmi.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * IPMI SMBIOS firmware handling
- *
- * Copyright (c) 2015,2016 Corey Minyard, MontaVista Software, LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef QEMU_SMBIOS_IPMI_H
-#define QEMU_SMBIOS_IPMI_H
-
-void smbios_build_type_38_table(void);
-
-#endif /* QEMU_SMBIOS_IPMI_H */
diff --git a/hw/smbios/smbios_type_38-stub.c b/hw/smbios/smbios_type_38-s=
tub.c
index fc4516bc8a..14b53d004b 100644
--- a/hw/smbios/smbios_type_38-stub.c
+++ b/hw/smbios/smbios_type_38-stub.c
@@ -8,7 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
-#include "smbios_ipmi.h"
+#include "smbios_build.h"
=20
 void smbios_build_type_38_table(void)
 {
diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c
index d84e87d608..a1ad28d059 100644
--- a/hw/smbios/smbios_type_38.c
+++ b/hw/smbios/smbios_type_38.c
@@ -12,7 +12,6 @@
 #include "hw/smbios/smbios.h"
 #include "qemu/error-report.h"
 #include "smbios_build.h"
-#include "smbios_ipmi.h"
=20
 /* SMBIOS type 38 - IPMI */
 struct smbios_type_38 {
--=20
2.17.2

