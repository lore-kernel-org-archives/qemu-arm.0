Received: by 10.182.158.201 with SMTP id ww9csp3415409obb;
        Wed, 2 Dec 2015 16:27:34 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr7491213qka.58.1449102454639;
        Wed, 02 Dec 2015 16:27:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b43si6205440qga.13.2015.12.02.16.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HkE-0002kK-7y
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:27:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcC-0004XS-Vw
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcB-000255-Iu
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:16 -0500
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229]:33500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4HcB-00024m-CJ; Wed, 02 Dec 2015 19:19:15 -0500
Received: by qgea14 with SMTP id a14so48165546qge.0;
	Wed, 02 Dec 2015 16:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rq792ihuTBni4R6CANo35NfbYN05qt5Sw1rMBo/IHFc=;
	b=iMYWwB4rqumwOAFDQxj1SAY9InzSNfl0wZtM2gGBqd/0by7X/8TU7yrz7zBF4s6Pag
	aa0BhIJdiQ7SAMO0h2qP7nuFVzTY9NzniAu+aNGVi4ptJOfhBQKcoJaNcgJDgKMTvv/n
	F3iOJVutk0GgUKUpODe2amQNhSbWffmHEzWH6PLmXNJXHUk0FzVPZAB9+3vpKGskwoe9
	CwTV9L4gpiuXvqt//AFWxBMfWuhj4iNDWqRkgHVzTZldrsktBkKZvjpF7jcMKoxfNvWm
	S9V/4So5vLrRAs9sJ5H4JifClpPTDiB/2S3FripZIDbzk3OjUcZahk96yasVPcD4f95l
	UYMQ==
X-Received: by 10.140.19.36 with SMTP id 33mr7604487qgg.65.1449101955008;
	Wed, 02 Dec 2015 16:19:15 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:14 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:50 -0500
Message-Id: <1449101933-24928-24-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::229
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 23/26] qom: add cpu_generic_init_unrealized()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uq+d8Y0O5JHe

cpu_generic_init() without realized=true.
Gives board code an opportunity to change
CPU properties.
---
 include/qom/cpu.h | 12 ++++++++++++
 qom/cpu.c         | 23 +++++++++++++++++------
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 51a1323..9093500 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -489,6 +489,18 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 CPUState *cpu_generic_init(const char *typename, const char *cpu_model);
 
 /**
+ * cpu_generic_init_unrealized:
+ * @typename: The CPU base type.
+ * @cpu_model: The model string including optional parameters.
+ *
+ * Instantiates a CPU, processes optional parameters but does not realize it.
+ *
+ * Returns: A #CPUState or %NULL if an error occurred.
+ */
+CPUState *cpu_generic_init_unrealized(const char *typename,
+                                      const char *cpu_model);
+
+/**
  * cpu_has_work:
  * @cpu: The vCPU to check.
  *
diff --git a/qom/cpu.c b/qom/cpu.c
index fb80d13..f622fc2 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -42,6 +42,23 @@ bool cpu_exists(int64_t id)
 
 CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
 {
+    CPUState *cpu = cpu_generic_init_unrealized(typename, cpu_model);
+    if (cpu) {
+        Error *err = NULL;
+        object_property_set_bool(OBJECT(cpu), true, "realized", &err);
+
+        if (err != NULL) {
+            error_report_err(err);
+            object_unref(OBJECT(cpu));
+            return NULL;
+        }
+    }
+    return cpu;
+}
+
+CPUState *cpu_generic_init_unrealized(const char *typename,
+                                      const char *cpu_model)
+{
     char *str, *name, *featurestr;
     CPUState *cpu;
     ObjectClass *oc;
@@ -63,13 +80,7 @@ CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
     featurestr = strtok(NULL, ",");
     cc->parse_features(cpu, featurestr, &err);
     g_free(str);
-    if (err != NULL) {
-        goto out;
-    }
-
-    object_property_set_bool(OBJECT(cpu), true, "realized", &err);
 
-out:
     if (err != NULL) {
         error_report_err(err);
         object_unref(OBJECT(cpu));
-- 
2.1.4

