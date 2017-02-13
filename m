Received: by 10.25.77.65 with SMTP id a62csp896399lfb;
        Mon, 13 Feb 2017 06:41:21 -0800 (PST)
X-Received: by 10.55.15.13 with SMTP id z13mr10137909qkg.22.1486996881841;
        Mon, 13 Feb 2017 06:41:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n63si7364049qka.173.2017.02.13.06.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:41:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdHod-00026X-1V
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:41:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcK-0008Hq-7w
	for qemu-devel@nongnu.org; Mon, 13 Feb 2017 09:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcI-0005Id-Ov
	for qemu-devel@nongnu.org; Mon, 13 Feb 2017 09:28:36 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cdHcF-0005C4-3e; Mon, 13 Feb 2017 09:28:31 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cdHc5-00014d-2h; Mon, 13 Feb 2017 14:28:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Feb 2017 14:28:16 +0000
Message-Id: <1486996099-15820-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 1/4] cpu: add cpu_generic_new()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qnr2mZLjko/o

From: Michael Davidsaver <mdavidsaver@gmail.com>

Add a new API cpu_generic_new() which creates a QOM CPU object
(including calling the CPU class parse_features method) but
does not realize it, and reimplement cpu_generic_init() to
simply call cpu_generic_new() and then immediately realize.
the CPU.

The motivation for this is that there is currently no
way for board code to take advantage of the cpu_generic_init()
convenience function if it needs to set QOM properties
on the created CPU. Instead it has to do it all manually, which
is prone to bugs like that fixed in commit 00909b585861 (where
a board code forgot to call parse_features which meant that
command line +feature,-feature flags were ignored).

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: renamed new function to cpu_generic_new(), rewrote
 commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qom/cpu.h | 17 +++++++++++++++++
 qom/cpu.c         | 27 ++++++++++++++++++---------
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 45bcf21..e900586 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -599,11 +599,28 @@ void cpu_reset(CPUState *cpu);
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 
 /**
+ * cpu_generic_new:
+ * @typename: The CPU base type.
+ * @cpu_model: The model string including optional parameters.
+ *
+ * Instantiates a CPU, processes optional parameters but does not realize it.
+ * This is the recommended way to create a CPU object which needs to be
+ * configured by then setting QOM properties on it. The configured CPU can
+ * then be realized in the usual way by calling
+ *    object_property_set_bool(cpuobj, true, "realized", &err);
+ *
+ * Returns: A #CPUState or %NULL if an error occurred.
+ */
+CPUState *cpu_generic_new(const char *typename, const char *cpu_model);
+
+/**
  * cpu_generic_init:
  * @typename: The CPU base type.
  * @cpu_model: The model string including optional parameters.
  *
  * Instantiates a CPU, processes optional parameters and realizes the CPU.
+ * This is equivalent to calling cpu_generic_new() and then immediately
+ * realizing the CPU object.
  *
  * Returns: A #CPUState or %NULL if an error occurred.
  */
diff --git a/qom/cpu.c b/qom/cpu.c
index 0e19b1a..a783aec 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -47,6 +47,22 @@ bool cpu_exists(int64_t id)
 
 CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
 {
+    CPUState *cpu = cpu_generic_new(typename, cpu_model);
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
+CPUState *cpu_generic_new(const char *typename, const char *cpu_model)
+{
     char *str, *name, *featurestr;
     CPUState *cpu = NULL;
     ObjectClass *oc;
@@ -70,19 +86,12 @@ CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
     cc->parse_features(object_class_get_name(oc), featurestr, &err);
     g_free(str);
     if (err != NULL) {
-        goto out;
-    }
-
-    cpu = CPU(object_new(object_class_get_name(oc)));
-    object_property_set_bool(OBJECT(cpu), true, "realized", &err);
-
-out:
-    if (err != NULL) {
         error_report_err(err);
-        object_unref(OBJECT(cpu));
         return NULL;
     }
 
+    cpu = CPU(object_new(object_class_get_name(oc)));
+
     return cpu;
 }
 
-- 
2.7.4

