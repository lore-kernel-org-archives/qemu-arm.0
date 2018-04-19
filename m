Received: by 10.28.4.212 with SMTP id 203csp813083wme;
        Thu, 19 Apr 2018 08:56:35 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/ZGdyuzMdJZo/UUzLyg3wzWeIshea/UkTmc8uKGLaSsTcyhiV07YAXyVDoJjEPfGKazpSX
X-Received: by 2002:adf:ba50:: with SMTP id t16-v6mr2893107wrg.237.1524153395634;
        Thu, 19 Apr 2018 08:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524153395; cv=none;
        d=google.com; s=arc-20160816;
        b=iNGrm6Yv2EOhMzK3Lw2XSkWZQXfFtMRtFa0RjvXFVjN/XACxnXdv85DZTr0X7ASs4Q
         sXuMEfxi+nZ7CeDztB0sijq7ukgi9j9GxKpPq1jmSDWFnkDyRqylziEa1p9Jf3zMePrz
         BjY4sh5RJSqOE+R07EnBGpzT53ljt8ULE4n6RiXPlRUDkWE9jurYNQ+ghVLBvcG9sJQJ
         qhz70d61Qzlr5LFYWH/yXrKTeGm8yffGsE7jv8OlR63LxvgUA32TWQBeTqzM5DsYTbe/
         1zEUFC732uOU0UT/Up8QFijvQFxCvu/FhE4r0cLDdfqLVh6xK3KN7cmRGpInAL6MC6cq
         Umcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=hmLldIitxS8X+gALEbEslE9h7M11EOn6j4cPdIvetzs=;
        b=r9kdCua7cXUsdTbfzmPOmqAAYeHEWGbCqshcPiDlYGX0nbdcyxINmIwagulfNFnSVW
         1A4ZtL0Rm4vHuZlHJJByhIrhQLtDnzi6VVAOR7IVSKn9wxkxX3PinBnJR+o6LKRRlMa4
         UqOMKH9P/xwDU6KlEoCMu5DwUPsMr6fni4iKCBrWyvV96ul3DNo3EcLPmzj553ysC0M/
         G9c2JSS/MbMYHM5nJsnQNjiMQ7PqvmXJAcelibUSRx4qQB7yE9/82cBzJM8uRLxCnXVS
         JojYuXrFNG2so3sdOfBVQ+csxFPROlU3Of/zFdgaMbY7Z9h/Cw9K/kVl3d2NlagMJBVS
         aj4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id m5si2653376wme.8.2018.04.19.08.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Apr 2018 08:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 22699 invoked by uid 484); 19 Apr 2018 15:56:35 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.061551 secs); 19 Apr 2018 15:56:35 -0000
Received: from unknown (HELO abo-VirtualBox.8.8.4.4) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA encrypted SMTP
          for <qemu-devel@nongnu.org>; 19 Apr 2018 15:56:34 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org,
	khaled.jmal@lauterbach.com,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Subject: [PATCH v6 1/3] target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo type
Date: Thu, 19 Apr 2018 16:56:24 +0100
Message-Id: <1524153386-3550-2-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p910yo5lAYoc

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
A register has ARM_CP_NO_GDB enabled will not be shown in the dynamic XML.
This bit is enabled automatically when creating CP_ANY wildcard aliases.
This bit could be enabled manually for any register we want to remove from the
dynamic XML description.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h    | 3 ++-
 target/arm/helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 19a0c03..436f675 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1815,10 +1815,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
+#define ARM_CP_NO_GDB            0x4000
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL          0xffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x30ff
+#define ARM_CP_FLAG_MASK         0x70ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dcb8476..799e322 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5664,7 +5664,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     if (((r->crm == CP_ANY) && crm != 0) ||
         ((r->opc1 == CP_ANY) && opc1 != 0) ||
         ((r->opc2 == CP_ANY) && opc2 != 0)) {
-        r2->type |= ARM_CP_ALIAS;
+        r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
     /* Check that raw accesses are either forbidden or handled. Note that
-- 
2.7.4
