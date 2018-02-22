Received: by 10.28.71.27 with SMTP id u27csp1913273wma;
        Thu, 22 Feb 2018 04:44:56 -0800 (PST)
X-Google-Smtp-Source: AH8x2276x6WHPKm6xc/J8CvadEauMlLfD5vJqEmRDrp/6yqdcaccXUu+HUXFTPdiJClgcyEK6EIa
X-Received: by 10.129.183.24 with SMTP id v24mr4680279ywh.147.1519303496306;
        Thu, 22 Feb 2018 04:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519303496; cv=none;
        d=google.com; s=arc-20160816;
        b=ld4XffST2q1zJh+lU8Ee82BB4Gchr6IkR5YuXWGo5QOxPXcgE9gzrf9IQp/plGcQSF
         yrP6cK6iizTym1MCTzCV0JuZkv2fJ7I82nqAhRDs/qwoUYjjx2gE0PNsWH4akJF1jZZY
         ufQbQeEt3DgjdmneaBWTxyLXIrjp7eFgp5TZzzxy5TIzd6aTY2CYBD/C4ljvd3GSgLHW
         xCAGq0XQ4FJNFtOfCDraO7smPz5xHT0wQUbjTW9suEZ3t7eqQEr5aECRIIkQzEDdvGhm
         b/7+yEnQCgM5Z7au0EP8TE1W2qap2vtVjOZUO4pnU4494I1WAHmhb2FvYpxiY/OexVOc
         royw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Z1LcYMHqA1LkjNus+mkm1p6G3Nwh4PDRhXp4iYtEPNc=;
        b=hP2HINP7jgB+zW4g/CQ2sF6NG62MdGZrxtZMwKdlAA5WDQB57camDHYzn2kE8L3YLU
         KkwRtQogDqv0aMIUqHgYxBb06TfYvjudcD2C7FuJXOKSIbAKnyT6oZ3jXg3lZTxvNhLs
         MdTFg7ojXjYfTMiQY0RV9zUtdssm5o/XLMwOZhD0V0YYEg3c7DBt6iDUnUsgloGKYAIM
         k8xspunZwzbVnQEovib84AeeCMcPJVBMEOS18YjB8tfuroLv5Z4BpeUU1Y22RBWvcpR8
         lSTMPcYVRKDN+HPbi/8uXsaf3XTJObGe95Ctxxe1Ovz8x2AuUGgh+OEEqyQov2nQur9O
         a03g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p188si2359301ybp.804.2018.02.22.04.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 04:44:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqF5-0005n6-Iy
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 07:44:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEb-0005V1-Pz
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEa-0004s2-N3
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48428 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoqEa-0004qz-Je; Thu, 22 Feb 2018 07:44:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D19B8182D20;
	Thu, 22 Feb 2018 12:44:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 251112024CA9;
	Thu, 22 Feb 2018 12:44:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Feb 2018 13:42:49 +0100
Message-Id: <1519303376-92875-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Feb 2018 12:44:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Feb 2018 12:44:24 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/9] pc: replace pm object initialization with
 one-liner in acpi_get_pm_info()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UbyzPd5LZBmS

next patch will need it before it gets to piix4/lpc branches
that initializes 'obj' now.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index deb440f..b85fefe 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -128,7 +128,7 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
 {
     Object *piix = piix4_pm_find();
     Object *lpc = ich9_lpc_find();
-    Object *obj = NULL;
+    Object *obj = piix ? piix : lpc;
     QObject *o;
 
     pm->force_rev1_fadt = false;
@@ -138,7 +138,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
     if (piix) {
         /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
         pm->force_rev1_fadt = true;
-        obj = piix;
         pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
         pm->pcihp_io_base =
             object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
@@ -146,7 +145,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
             object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
     }
     if (lpc) {
-        obj = lpc;
         pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
     }
     assert(obj);
-- 
2.7.4

