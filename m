Received: by 10.25.27.66 with SMTP id b63csp1557431lfb;
        Mon, 6 Jun 2016 08:45:45 -0700 (PDT)
X-Received: by 10.55.134.6 with SMTP id i6mr16645975qkd.185.1465227945675;
        Mon, 06 Jun 2016 08:45:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x63si11310817qkd.159.2016.06.06.08.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9wim-0000rv-NT
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:45:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH2-0000Op-Vw
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH1-0006wl-Of
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wH1-0006wZ-FT; Mon, 06 Jun 2016 11:17:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04D8F80F65;
	Mon,  6 Jun 2016 15:17:02 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtmv013155; Mon, 6 Jun 2016 11:17:00 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:44 +0200
Message-Id: <1465226212-254093-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 06 Jun 2016 15:17:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 02/10] target-i386: cpu: move features logic that
 requires CPUState to realize time
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
X-TUID: 62e9CNrZoQIP

Making x86_cpu_parse_featurestr() a pure convertor
of legacy feature string into global properties, needs
it to be called before a CPU instance is created so
parser shouldn't modify CPUState directly or access
it at all. Hence move current hack that directly pokes
into CPUState, to set/unset +-feats, from parser to
CPU's realize method.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
 - rewrite commit message
 - add comment why +-feat is special
 - add TODO comment to remove plus_features & minus_features static vars
---
 target-i386/cpu.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 07bbab7..79a9b61 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1932,6 +1932,14 @@ static inline void feat2prop(char *s)
     }
 }
 
+/* Compatibily hack to maintain legacy +-feat semantic,
+ * where +-feat overwrites any feature set by
+ * feat=on|feat even if the later is parsed after +-feat
+ * (i.e. "-x2apic,x2apic=on" will result in x2apic disabled)
+ */
+static FeatureWordArray plus_features = { 0 };
+static FeatureWordArray minus_features = { 0 };
+
 /* Parse "+feature,-feature,feature=foo" CPU feature string
  */
 static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
@@ -1939,12 +1947,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
 {
     X86CPU *cpu = X86_CPU(cs);
     char *featurestr; /* Single 'key=value" string being parsed */
-    FeatureWord w;
-    /* Features to be added */
-    FeatureWordArray plus_features = { 0 };
-    /* Features to be removed */
-    FeatureWordArray minus_features = { 0 };
-    CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
 
     featurestr = features ? strtok(features, ",") : NULL;
@@ -1985,18 +1987,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         }
         featurestr = strtok(NULL, ",");
     }
-
-    if (cpu->host_features) {
-        for (w = 0; w < FEATURE_WORDS; w++) {
-            env->features[w] =
-                x86_cpu_get_supported_feature_word(w, cpu->migratable);
-        }
-    }
-
-    for (w = 0; w < FEATURE_WORDS; w++) {
-        env->features[w] |= plus_features[w];
-        env->features[w] &= ~minus_features[w];
-    }
 }
 
 /* Print all cpuid feature names in featureset
@@ -2878,12 +2868,28 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
+    FeatureWord w;
 
     if (cpu->apic_id < 0) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
     }
 
+    /* TODO: convert plus_features & minus_features static vars
+     * to global properties, once broken host_features is fixed
+     */
+    if (cpu->host_features) {
+        for (w = 0; w < FEATURE_WORDS; w++) {
+            env->features[w] =
+                x86_cpu_get_supported_feature_word(w, cpu->migratable);
+        }
+    }
+
+    for (w = 0; w < FEATURE_WORDS; w++) {
+        cpu->env.features[w] |= plus_features[w];
+        cpu->env.features[w] &= ~minus_features[w];
+    }
+
     if (env->features[FEAT_7_0_EBX] && env->cpuid_level < 7) {
         env->cpuid_level = 7;
     }
-- 
1.8.3.1

