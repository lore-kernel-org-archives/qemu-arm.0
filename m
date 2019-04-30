Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4468989wrh;
        Tue, 30 Apr 2019 01:52:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySXk2eZ0LZiXdXJEqIBdXmj+0/g6AX0Pd0H5G7u2N8x5oV7fPqHPNC0V8PJmRIrikRCU4x
X-Received: by 2002:adf:fb11:: with SMTP id c17mr16664038wrr.237.1556614361083;
        Tue, 30 Apr 2019 01:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556614361; cv=none;
        d=google.com; s=arc-20160816;
        b=wU1J6NS2EVcqQZy91M369NghnNjEoKG0nZdXXGEThiwB6yLejezDnrUkqSUmT9FbFe
         VhRwQS1TWcy6CpU+9NYMpvjg+ve/5kO0+dQwWHdocDLRxBUSxyX2AQa+zvWgvKX0KZLR
         rlMQ881Gv9Njj3D7SUmbRHEtBBtmttZ8KE0dWAFcrnFVuLeUqJH+hIM5Rh5vnjJXkCjL
         Ojz5tWD+ZNS6B52cHANDRzmwj1P7AZ4n7paclWiL7WUpBtdMPpu76KPm2qp7Twegx0CH
         nEUkIs0HqTy+P05+aNPtIRWMOF69Ug+dATN3a2AC/IbMS1emUPJPqbcO7Pw6jGFmprTM
         EIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=02xSXlA4/Gd6KZQntE+66tue8TEkZ9fLqtEmZRuo3Pg=;
        b=t6rJrgHRdwkEfcSbp8my96w7WwZi0+I+rkZDwJLo2yrKQj3/TENVfY2litTlR0J9Zt
         7Say9Zxg4sf2lvnJ1n+U+BQEukmXi6MUTehWdLsUczeWQoXpI1A1dJElew8vLRSAxEFT
         ml47QcN1y2ZRUtwiyCymXhJS7FI/ObnBa716695dhQpOtubIIYcouNGpZMje3g6BcH8H
         wgQzSkbxCYIFLLVlOJKLO1qVo+YU2Gt+NFy24g9tr2NNE7XrL+la5ubwldODikicgcaI
         HuUQaUI1aO8gBKaN4HIQb4wpSpPxVA5kJe6C4OTp2tUougLhnPlTIsikQ3mou5wz/bw/
         ydmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si6049469wrs.232.2019.04.30.01.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 01:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:41740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLOVE-0000Wg-8m
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 04:52:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hLOUs-0000WV-MZ
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 04:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hLOUr-0006MC-DC
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 04:52:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:63395)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hLOUk-0006ID-UU; Tue, 30 Apr 2019 04:52:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Apr 2019 01:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,413,1549958400"; d="scan'208";a="295728798"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga004.jf.intel.com with ESMTP; 30 Apr 2019 01:52:07 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 16:50:40 +0800
Message-Id: <1556614240-36369-1-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH] hw/arm/fsl-imx: move cpus initialization to
 realize time after smp_cpus check
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbQulPTk3v4/

If "smp_cpus> FSL_IMX6_NUM_CPUS" fails in *_realize(), there is no need to
initialize the CPUs in *_init(). So it could be better to create all cpus
after the validity in *_realize(). On the other hand, it makes the usages
of global variable smp_cpus more centrally for maintenance.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/arm/fsl-imx6.c   | 13 +++++++------
 hw/arm/fsl-imx6ul.c | 12 ++++++------
 hw/arm/fsl-imx7.c   | 15 +++++++--------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 7b7b97f..14015a1 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -37,12 +37,6 @@ static void fsl_imx6_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    for (i = 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
-        snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
-                                "cortex-a9-" TYPE_ARM_CPU, &error_abort, NULL);
-    }
-
     sysbus_init_child_obj(obj, "a9mpcore", &s->a9mpcore, sizeof(s->a9mpcore),
                           TYPE_A9MPCORE_PRIV);
 
@@ -95,6 +89,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 {
     FslIMX6State *s = FSL_IMX6(dev);
     uint16_t i;
+    char name[NAME_SIZE];
     Error *err = NULL;
 
     if (smp_cpus > FSL_IMX6_NUM_CPUS) {
@@ -103,6 +98,12 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    for (i = 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
+        snprintf(name, NAME_SIZE, "cpu%d", i);
+        object_initialize_child(OBJECT(dev), name, &s->cpu[i],
+            sizeof(s->cpu[i]), "cortex-a9-" TYPE_ARM_CPU, &error_abort, NULL);
+    }
+
     for (i = 0; i < smp_cpus; i++) {
 
         /* On uniprocessor, the CBAR is set to 0 */
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 4b56bfa..7f30eb7 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -32,12 +32,6 @@ static void fsl_imx6ul_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    for (i = 0; i < MIN(smp_cpus, FSL_IMX6UL_NUM_CPUS); i++) {
-        snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
-                                "cortex-a7-" TYPE_ARM_CPU, &error_abort, NULL);
-    }
-
     /*
      * A7MPCORE
      */
@@ -167,6 +161,12 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    for (i = 0; i < MIN(smp_cpus, FSL_IMX6UL_NUM_CPUS); i++) {
+        snprintf(name, NAME_SIZE, "cpu%d", i);
+        object_initialize_child(OBJECT(dev), name, &s->cpu[i],
+            sizeof(s->cpu[i]), "cortex-a7-" TYPE_ARM_CPU, &error_abort, NULL);
+    }
+
     for (i = 0; i < smp_cpus; i++) {
         Object *o = OBJECT(&s->cpu[i]);
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 7663ad6..2580348 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -34,14 +34,6 @@ static void fsl_imx7_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-
-    for (i = 0; i < MIN(smp_cpus, FSL_IMX7_NUM_CPUS); i++) {
-        snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
-                                ARM_CPU_TYPE_NAME("cortex-a7"), &error_abort,
-                                NULL);
-    }
-
     /*
      * A7MPCORE
      */
@@ -167,6 +159,13 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    for (i = 0; i < MIN(smp_cpus, FSL_IMX7_NUM_CPUS); i++) {
+        snprintf(name, NAME_SIZE, "cpu%d", i);
+        object_initialize_child(OBJECT(dev), name, &s->cpu[i],
+            sizeof(s->cpu[i]), ARM_CPU_TYPE_NAME("cortex-a7"),
+            &error_abort, NULL);
+    }
+
     for (i = 0; i < smp_cpus; i++) {
         o = OBJECT(&s->cpu[i]);
 
-- 
1.8.3.1

