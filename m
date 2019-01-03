Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp704695wrt;
        Thu, 3 Jan 2019 06:41:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4NyxrK0FmvjhbaL1BNResMhrBd9LT1bo2mQgQV3L4KJKV9PimUitfc+PBbkU8W/zu9anjv
X-Received: by 2002:a37:4145:: with SMTP id o66mr42787484qka.129.1546526491662;
        Thu, 03 Jan 2019 06:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546526491; cv=none;
        d=google.com; s=arc-20160816;
        b=xUeP/Y2Mdg4Va5JvvBAnEbYf0jxW1NWgZGkjMEW5CcCO99EXEKsaV33SK3XxgUhUXf
         CJox45VfYahSyYcbLquLWEZjBrPTU3coD48226sy4rvbmMjymW5WgWHT0buaHqxC8akS
         83BYpWDrSQDFKDyqM+yAjMJ/BFz3yLg0EDvu4J+JdngJv5HSxpj0aEChqhqSxE+JOgx6
         j8S+uwiDbsCpBlCkFn/NVrfw7n9dTUfYlNZ2cTM9wilqrziNWv4tpiNCYY0i4lbG5tsp
         yuRLxnmFPigLxvUHWLK7vpc10qbAQaR5kY8FRnr+4/Acufb8G5ZVsQcd4Y8BoeCfqVdz
         A4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=HZejvBvL6cVFGUrZql9sEHMcNBkSfU3xKDW64f8ZOFM=;
        b=dY0pOvqe3HCzPP6ExvakavbiGjU1YpO8rLYmD22VBTiYo0pM8DJ+EMqQhIvV0NuWl3
         km8fMQATr8s+0WzWhU1Fy4IYePzhq5k46YBzvpuVFpy0hQ8hXRnj3VB5/nArTMikJJTL
         6AsFMB0eblZii2DT1bpPYFn93AekaieVdMr7XRqs6wVG0M5znryTLfn3RDiIdxT/p2jD
         TNoW2RphvJI8OLzEkKhaxABUvoilZCQwYSHRiCiCVgbP4yAUL9/vTscqth9e44eKCtfX
         MHRaHCGjX+uHodKqlTOZsep3c+1C3aYB/kAYFYb2tznuBU3Lf8h7gFkLCqHYcPrNzPKZ
         nigA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n26si4462339qki.136.2019.01.03.06.41.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jan 2019 06:41:31 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9087C81DEA;
	Thu,  3 Jan 2019 14:41:30 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E049B60BEC;
	Thu,  3 Jan 2019 14:41:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: jim@groklearning.com,
	jusual@mail.ru,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] Revert "armv7m: Guard against no -kernel argument"
Date: Thu,  3 Jan 2019 14:41:24 +0000
Message-Id: <20190103144124.18917-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 03 Jan 2019 14:41:30 +0000 (UTC)
X-TUID: FJtJ3q8OSQbC

This reverts commit 01fd41ab3fb69971c24a69ed49cde96086d81278.

The generic loader device (-device loader,file=kernel.bin) can be used
to load a kernel instead of the -kernel option.  Some boards have flash
memory (pflash) that is set via the -pflash or -drive options.

Allow starting QEMU without the -kernel option to accommodate these
scenarios.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/armv7m.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 4bf9131b81..f444652830 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -285,11 +285,6 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     big_endian = 0;
 #endif
 
-    if (!kernel_filename && !qtest_enabled()) {
-        error_report("Guest image must be specified (using -kernel)");
-        exit(1);
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         asidx = ARMASIdx_S;
     } else {
-- 
2.20.1
