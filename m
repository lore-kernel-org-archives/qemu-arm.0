Received: by 10.25.27.66 with SMTP id b63csp270963lfb;
        Wed, 1 Jun 2016 09:38:30 -0700 (PDT)
X-Received: by 10.140.98.140 with SMTP id o12mr36436169qge.8.1464799110661;
        Wed, 01 Jun 2016 09:38:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g37si35373644qte.124.2016.06.01.09.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89A6-00062N-3X
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:38:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899N-0005Hv-IR
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899G-0007rK-Da
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899G-0007rD-5E; Wed, 01 Jun 2016 12:37:38 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3CB4C049D5C;
	Wed,  1 Jun 2016 16:37:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqd025067; Wed, 1 Jun 2016 12:37:36 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:23 +0200
Message-Id: <1464799050-11002-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 01 Jun 2016 16:37:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 1/8] target-i386: cpu: move features logic
 that requires CPUState to realize time
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
X-TUID: jxiLCrJR/ocq

it will allow to make x86_cpu_parse_featurestr() a pure convertor
of legacy features string into global properties.
That way -cpu FOOCPU,feat1=x,feat2=y,... is parsed only once
and as result of x86_cpu_parse_featurestr() a corresponding set
of global properties for specified CPU type are registered.
So whenever a CPU device is created, generic device machinery
will apply that global properties for us.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 3fbc6f3..6159a7f 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1932,6 +1932,11 @@ static inline void feat2prop(char *s)
     }
 }
 
+/* Features to be added */
+static FeatureWordArray plus_features = { 0 };
+/* Features to be removed */
+static FeatureWordArray minus_features = { 0 };
+
 /* Parse "+feature,-feature,feature=foo" CPU feature string
  */
 static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
@@ -1939,13 +1944,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
 {
     X86CPU *cpu = X86_CPU(cs);
     char *featurestr; /* Single 'key=value" string being parsed */
-    FeatureWord w;
-    /* Features to be added */
-    FeatureWordArray plus_features = { 0 };
-    /* Features to be removed */
-    FeatureWordArray minus_features = { 0 };
     uint32_t numvalue;
-    CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
 
     featurestr = features ? strtok(features, ",") : NULL;
@@ -2019,18 +2018,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
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
@@ -2912,12 +2899,25 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
+    FeatureWord w;
 
     if (cpu->apic_id < 0) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
     }
 
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

