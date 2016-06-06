Received: by 10.25.27.66 with SMTP id b63csp1559278lfb;
        Mon, 6 Jun 2016 08:49:48 -0700 (PDT)
X-Received: by 10.200.46.82 with SMTP id s18mr16660481qta.12.1465228188817;
        Mon, 06 Jun 2016 08:49:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si11320708qkc.228.2016.06.06.08.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9wmi-0004QU-4p
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:49:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHD-0000Y7-JH
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH6-0006yF-EH
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wH6-0006y9-5y; Mon, 06 Jun 2016 11:17:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1C90C0703A4;
	Mon,  6 Jun 2016 15:17:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtn0013155; Mon, 6 Jun 2016 11:17:06 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:47 +0200
Message-Id: <1465226212-254093-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 06 Jun 2016 15:17:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 05/10] target-i386: cpu: consolidate calls of
 object_property_parse() in x86_cpu_parse_featurestr
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 994nnYh9Svrb

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
 - fix error handling in of +-feat, Igor Mammedov <imammedo@redhat.com>
 - rebase on top of
    "target-i386: Remove xlevel & hv-spinlocks option fixups"
---
 target-i386/cpu.c | 74 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 25 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 349b971..f791a06 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1957,43 +1957,67 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
     char *featurestr; /* Single 'key=value" string being parsed */
     Error *local_err = NULL;
 
-    featurestr = features ? strtok(features, ",") : NULL;
+    if (!features) {
+        return;
+    }
 
-    while (featurestr) {
-        char *val;
+    for (featurestr = strtok(features, ",");
+         featurestr;
+         featurestr = strtok(NULL, ",")) {
+        const char *name;
+        const char *val = NULL;
+        char *eq = NULL;
+
+        /* Compatibility syntax: */
         if (featurestr[0] == '+') {
             add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                return;
+            }
+            continue;
         } else if (featurestr[0] == '-') {
             add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
-        } else if ((val = strchr(featurestr, '='))) {
-            *val = 0; val++;
-            feat2prop(featurestr);
-            if (!strcmp(featurestr, "tsc-freq")) {
-                int64_t tsc_freq;
-                char *err;
-                char num[32];
-
-                tsc_freq = qemu_strtosz_suffix_unit(val, &err,
-                                               QEMU_STRTOSZ_DEFSUFFIX_B, 1000);
-                if (tsc_freq < 0 || *err) {
-                    error_setg(errp, "bad numerical value %s", val);
-                    return;
-                }
-                snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
-                object_property_parse(OBJECT(cpu), num, "tsc-frequency",
-                                      &local_err);
-            } else {
-                object_property_parse(OBJECT(cpu), val, featurestr, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                return;
             }
+            continue;
+        }
+
+        eq = strchr(featurestr, '=');
+        if (eq) {
+            *eq++ = 0;
+            val = eq;
         } else {
-            feat2prop(featurestr);
-            object_property_parse(OBJECT(cpu), "on", featurestr, &local_err);
+            val = "on";
+        }
+
+        feat2prop(featurestr);
+        name = featurestr;
+
+        /* Special case: */
+        if (!strcmp(name, "tsc-freq")) {
+            int64_t tsc_freq;
+            char *err;
+            char num[32];
+
+            tsc_freq = qemu_strtosz_suffix_unit(val, &err,
+                                           QEMU_STRTOSZ_DEFSUFFIX_B, 1000);
+            if (tsc_freq < 0 || *err) {
+                error_setg(errp, "bad numerical value %s", val);
+                return;
+            }
+            snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
+            val = num;
+            name = "tsc-frequency";
         }
+
+        object_property_parse(OBJECT(cpu), val, name, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
-        featurestr = strtok(NULL, ",");
     }
 }
 
-- 
1.8.3.1

