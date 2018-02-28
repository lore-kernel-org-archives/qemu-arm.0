Received: by 10.28.91.67 with SMTP id p64csp669418wmb;
        Wed, 28 Feb 2018 06:25:46 -0800 (PST)
X-Google-Smtp-Source: AG47ELut8INIBTi/x2LOkAu7iN7xvoOI8fwPCS4k8ZttfMMaRcf2En6zUC7qep3FxI9aoaRoCNrU
X-Received: by 2002:a25:ed4:: with SMTP id 203-v6mr12443214ybo.448.1519827945971;
        Wed, 28 Feb 2018 06:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519827945; cv=none;
        d=google.com; s=arc-20160816;
        b=O/lXefAJHljucqJD6DOYn3liMHkp4MFOTCZ4GJNoIDPGvFQwuvPnoxQSFqA6RA+4f5
         RZmaucHtd+t2iwfPceH9Q1fMqEiovHtuvoktSuq1B8HbwNcl6PIqA8A5wk3boUtYWnBc
         gKF7gm2rozefAUSZw8S/sCS1rbFnXozEEh0rSV6Rpaps3Km4e+uzdZWXoKyx/+a456ql
         o0yH1BlNgVySFqKT8QxaY2b7IFkSzxjZld0U0OZ2wlwJc4kzTfE6vPfa57uePAZOUrKE
         clt7VS08XMZ/FF1eeyZ5eZ7iQStCJ7EAavYpB1haQiZMVfr0Hy3p3zWLH8XSu0UO/yNF
         VicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=EM1rNrIbifSNE0Vi1QfmpR5b+1tbkn5zG/BAuY7pyoQ=;
        b=GqoKuyV6/Dd6DEj0q1qPZgRa97OPFCwULnp/uJUIcZ9ecXSGdiQQQI3qtG0UUfRnAY
         AvtPplkujTgS6h7aK24BPhzQzokffY/U6qCpWmtFm2W7isyuGxo8PLpFaBMtxm9HmMQQ
         TXMPMol6jJ6rGBspN/SEWsuhtQgdRHKxkaJr6tEk4alNmizyKiLoDSdARGDXSPuPdSpS
         RpTw+MB8M0kyVdhS688XKx4XvR6X2d80HOXd9R01+kOsHDiLaY0JE7N1QxgrJV+czWic
         lCIJw6nAFSLQyVadlj6r+XOgB0gt0pabvObIBFcOA0qYWxsmTairlAZ8IwpBs///+K1m
         FDRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n1-v6si280887ybk.832.2018.02.28.06.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 06:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er2fx-0004kF-Ba
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 09:25:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fg-0004gy-Tb
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2ff-0001uu-Ps
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:28 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37544 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1er2ff-0001uH-DV; Wed, 28 Feb 2018 09:25:27 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF6EC40FB657;
	Wed, 28 Feb 2018 14:25:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EECEA946B7;
	Wed, 28 Feb 2018 14:25:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 15:23:50 +0100
Message-Id: <1519827835-239519-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 28 Feb 2018 14:25:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 28 Feb 2018 14:25:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 05/10] acpi: move ACPI_PORT_SMI_CMD define to
 header it belongs to
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
Cc: Auger Eric <eric.auger@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CjBb6dQewrG8

ACPI_PORT_SMI_CMD is alias for APM_CNT_IOPORT,
so make it really one instead of duplicating its value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/isa/apm.h | 3 +++
 hw/i386/acpi-build.c | 2 --
 hw/isa/apm.c         | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/isa/apm.h b/include/hw/isa/apm.h
index 4839ff1..b7098bf 100644
--- a/include/hw/isa/apm.h
+++ b/include/hw/isa/apm.h
@@ -5,6 +5,9 @@
 #include "hw/hw.h"
 #include "exec/memory.h"
 
+#define APM_CNT_IOPORT  0xb2
+#define ACPI_PORT_SMI_CMD APM_CNT_IOPORT
+
 typedef void (*apm_ctrl_changed_t)(uint32_t val, void *arg);
 
 typedef struct APMState {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b85fefe..699f3a0 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -255,8 +255,6 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
                                                NULL));
 }
 
-#define ACPI_PORT_SMI_CMD           0x00b2 /* TODO: this is APM_CNT_IOPORT */
-
 static void acpi_align_size(GArray *blob, unsigned align)
 {
     /* Align size to multiple of given size. This reduces the chance
diff --git a/hw/isa/apm.c b/hw/isa/apm.c
index e232b0d..c3101ef 100644
--- a/hw/isa/apm.c
+++ b/hw/isa/apm.c
@@ -34,7 +34,6 @@
 #endif
 
 /* fixed I/O location */
-#define APM_CNT_IOPORT  0xb2
 #define APM_STS_IOPORT  0xb3
 
 static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
-- 
2.7.4

