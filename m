Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp718919wrv;
        Thu, 11 Jul 2019 06:12:44 -0700 (PDT)
X-Received: by 2002:a5d:62c9:: with SMTP id o9mr5022793wrv.186.1562850764079;
        Thu, 11 Jul 2019 06:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562850764; cv=none;
        d=google.com; s=arc-20160816;
        b=CvDN3sCvYa0kvsRIphpkmGYN0V2a1/S5wBeOF5L7Uo8xarDAm3Uf0b50xKiYmE9c1b
         nYZuvnCO8/kZDQcRqS9n65YE9icZmT4VAiGmdODy6foiZxIeQyOXZORe04FBVHqNLxRk
         jFu1oxh7br57iXS/oyDHNvgoXWPtGZT+mQWUu9jhcBbd+Ayq8e9Mr26yK5U+Q5T6LbA+
         WaEpJE5In28GM+RAVkKTTg+vxgJrfH5X/pCXhJ2M+Ef0PSEEF4Vz/QnmyZ16kqRCfpdA
         c6Chop19iNUbuzZiIXy92+59FdLHUZ4MzTz2VsNpcOSXVu9Xkx1jM0l6MgwunVnMeWHF
         9L9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=gY20XIqz7mV7zfDHHT5A+VN6sPrcRfLAjkaDTVDSoOA=;
        b=H+OY0AEtiT5tLsj4CCxMKPU0ERsWyFv8smVQ001Mh7oqjjvVx4JEk/NkbKfYj6qJdQ
         SDjcoeE2hH4wt8RVr/Zi2qLtC+PBuVevjuVL/6UNLsUgGS6HJFnJmwf+giVE1/cUaiPP
         +38LzohqbrOmyvURrsMfRnR2dtIJ40IRPxwEmDaIC4f0CBfTvTRyLqyXxMy61nxn/URx
         k6h+9LQy+qaRrNfqJaxKNYk7K9LcGISqPCO0UblagSFNcG1i/wCfCeafqEwc5YZ7Dfcr
         oi9b/TzydiAfszmM3E3TNUnDdoIDwMKRGvHAz6EHANs09GJj5XYQT+RuDRplFQ9yuhEe
         /6Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEZ1ygaG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t15sor3358107wmi.11.2019.07.11.06.12.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 06:12:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEZ1ygaG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gY20XIqz7mV7zfDHHT5A+VN6sPrcRfLAjkaDTVDSoOA=;
        b=KEZ1ygaGTHnpisWtq1VhUxy6tnUQuFKb6vPzeZSqPQnhlCLKp68SNULldgrqXJX2TY
         Zn4FF+qDsodkNd/Th1Y+HZqhw5omMIR+sagolW+Gq59LItrp7tr8Dlka8rldwCBeVtJJ
         r4ES9aDcO4q+eipy4r9gYZAVNZXGEmay4KXhHaOg1Ds+HvJ6LaqvDGIVZclMmmWB3hPB
         g+wo8f7gFkS1xbvtlAAoA6JEGVA+BD8FvmtGBOKCuoQJh8LiD5SzrBeKo1f5p761gIbT
         CkKG1KQaYBQfANCt4qTicRoWqffBjn6zBUfeFeIsrhI3/5OYAdNCKR8NhggFvA1HWyHy
         GzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gY20XIqz7mV7zfDHHT5A+VN6sPrcRfLAjkaDTVDSoOA=;
        b=DguROcRv5Ixg7fGulddZcVkYQYIoZT87nJTkTm2g1vV/jVp0V2C6ODXFmsXmacBcWj
         u65Ttq4U4aIhuPGOGEn9Nh3saCFIsqQ55/ZnrZepB+FK5OatCWkrIc4+S/zb3IC8IqBD
         duTxs44uzhTdj34+76awv6x47IwmaiOGas2oXQfcOXdWBGvO8g5K1fXIthYVHVyUHR42
         GmUuFM+E6A3PAgQf4OitE2Vp2jtKMStJcufrseS4dwVLNGL9hi5jApfUWWf+VsBqU/oD
         +d2APzf5wt4pk/sJbIOMrJ8eWK4pEScxo3Jj/3/pGcaTVsCTFEB0DM5Rm5e2tQC3QPtF
         08Hw==
X-Gm-Message-State: APjAAAX5qUtCT7NNEQZiM1/4RznYMV17fLYq8lv3beZIjpESBb99LDkG
	peEK1+qhHYWuFlI4SrdCNOieiggT
X-Google-Smtp-Source: APXvYqwclBEHaJdzgMBhYqtV8ugDNqk9R2hwXQ8H0E5vbluQxddrOlRUatdhmQz/Ti/jIz0V9s4hIQ==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr4158324wma.107.1562850763731;
        Thu, 11 Jul 2019 06:12:43 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id c30sm7684800wrb.15.2019.07.11.06.12.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 06:12:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christophe Lyon <christophe.lyon@linaro.org>
Subject: [PATCH v2 for-4.1] target/arm: Set VFP-related MVFR0 fields for arm926 and arm1026
Date: Thu, 11 Jul 2019 14:12:41 +0100
Message-Id: <20190711131241.22231-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SQoVHDlICEKQ

The ARMv5 architecture didn't specify detailed per-feature ID
registers. Now that we're using the MVFR0 register fields to
gate the existence of VFP instructions, we need to set up
the correct values in the cpu->isar structure so that we still
provide an FPU to the guest.

This fixes a regression in the arm926 and arm1026 CPUs, which
are the only ones that both have VFP and are ARMv5 or earlier.
This regression was introduced by the VFP refactoring, and more
specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
which accidentally disabled VFP short-vector support and
double-precision support on these CPUs.

Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 1120827fa182f0e
Fixes: 266bd25c485597c
Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
v1->v2: just move the arm1026_initfn() part up a few lines;
this seems trivial so I've retained the reviewed-by tags.

 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e75a64a25a4..05b78ba2662 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1666,6 +1666,12 @@ static void arm926_initfn(Object *obj)
      * set the field to indicate Jazelle support within QEMU.
      */
     cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable double precision
+     * and short vector support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
 static void arm946_initfn(Object *obj)
@@ -1702,6 +1708,12 @@ static void arm1026_initfn(Object *obj)
      * set the field to indicate Jazelle support within QEMU.
      */
     cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable double precision
+     * and short vector support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 
     {
         /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0,2 */
-- 
2.20.1
