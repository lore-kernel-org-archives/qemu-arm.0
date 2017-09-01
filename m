Received: by 10.223.188.70 with SMTP id a6csp1294864wrh;
        Fri, 1 Sep 2017 10:31:07 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7scP/om6Uv16f5SEHqL9xJ6pCmIVWCn8GqNJKVwKjIKtLZbCq59dc4r3XHBp5Z5Zyb+Ion
X-Received: by 10.200.48.197 with SMTP id w5mr4103399qta.156.1504287067400;
        Fri, 01 Sep 2017 10:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287067; cv=none;
        d=google.com; s=arc-20160816;
        b=joGrPxPOXnCjjGf1fPwBG4oY5JcfYiyfO1FhmQhmj9ISnc2jcp41+ojAWshRvOl4oZ
         z4hu0CqZvuC6ptAK3GcVqrdoJGn6YrDj7geJpthFFI9i9qEefs5wpMgqlqdH0iWmpFRp
         l943s5iMkj2N2EWwbUPQczOeCXvhOmOkIhGifE919Aq7t4M3diFgwNbM9fuwMBhdok6g
         zrDjlMDZUKyRFJYxxcrN5++ILbsT02By0AxAjAZ6u0FgNOYpAHR8AbKZfPQDQubCPnTA
         DPTIiv8qYtzlmjP45CidGbCcjIXHjFcj5erbo5ykJQ5iafWGaPD+277Kd6fLZLLJKhXV
         I+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=aQZiDRLrZJfJSh3hCXlNDI5aty9jCmBJAXVllDvDXAk=;
        b=gt0HZ79cNNIybqFqahPZJpfJJqtYg6TVgEqEgxQjbb97frCBt2pyLWdUiXsMqrNeTK
         kAyYPimVBpcp08ANsG5Mz34pHLG3BlstKkaOo/LNO7cfrPpELRIhLvbO0JsB4DSFXkHy
         aB5PvTHhSSA/jupCC6wg5PRdTzsSGDnkTHlJSFDtz4yu72jMke+24cu1zVvLKLkonx4b
         p3nwm4eTYOnLQVawQzoHHZP3FCXB+f2RHkrSbWGZjg1D+frD45A7J+Oj66V/PwxdHdt3
         +oNc4vetCSNCe6furU5IjrSZQYk9waH/4z5P1q/X/lndHttPwFUmkoEQCUwUrEEJ4297
         1wJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c186si2172355qkg.140.2017.09.01.10.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:31:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpmb-0004rB-39
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:31:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpg7-0006ng-0V
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:24:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpg2-00048P-B3
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:24:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpfs-0003zx-Hg; Fri, 01 Sep 2017 13:24:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83F17267F2;
	Fri,  1 Sep 2017 17:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 83F17267F2
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4D5F17100;
	Fri,  1 Sep 2017 17:24:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:19 +0200
Message-Id: <1504286483-23327-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Sep 2017 17:24:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 16/20] hw/arm/sysbus-fdt: Pass the platform
 bus base address in PlatformBusFDTData
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J0p6s4Benv2J

The Base address of the platform bus may be useful for device node
creation function. This is typically the case if the node creation
function also prepares data for ACPI table generation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/sysbus-fdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index d92a983..f8c4909 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -46,6 +46,7 @@
 typedef struct PlatformBusFDTData {
     void *fdt; /* device tree handle */
     int irq_start; /* index of the first IRQ usable by platform bus devices */
+    hwaddr base; /* base address of the platform bus */
     const char *pbus_node_name; /* name of the platform bus node */
     PlatformBusDevice *pbus;
     VirtMachineState *vms;
@@ -514,6 +515,7 @@ static void add_all_platform_bus_fdt_nodes(ARMPlatformBusFDTParams *fdt_params)
     PlatformBusFDTData data = {
         .fdt = fdt,
         .irq_start = irq_start,
+        .base = addr,
         .pbus_node_name = node,
         .pbus = pbus,
         .vms = fdt_params->vms,
-- 
2.5.5

