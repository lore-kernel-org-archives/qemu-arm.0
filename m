Received: by 10.25.27.66 with SMTP id b63csp270885lfb;
        Wed, 1 Jun 2016 09:38:22 -0700 (PDT)
X-Received: by 10.55.68.78 with SMTP id r75mr37504825qka.189.1464799102038;
        Wed, 01 Jun 2016 09:38:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93si35408538qtd.37.2016.06.01.09.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b899x-0005rO-4j
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:38:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899O-0005Ix-Gw
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899M-0007se-Dt
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899M-0007sa-5e; Wed, 01 Jun 2016 12:37:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B206F85543;
	Wed,  1 Jun 2016 16:37:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqg025067; Wed, 1 Jun 2016 12:37:41 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:26 +0200
Message-Id: <1464799050-11002-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 01 Jun 2016 16:37:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 4/8] target-i386: cpu: consolidate calls of
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
X-TUID: ZndUO41IzN9O

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 238f69d..618aef9 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1945,12 +1945,15 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
     X86CPU *cpu = X86_CPU(cs);
     char *featurestr; /* Single 'key=value" string being parsed */
     uint32_t numvalue;
+    char num[32];
+    const char *name;
+    char *err;
     Error *local_err = NULL;
 
     featurestr = features ? strtok(features, ",") : NULL;
 
     while (featurestr) {
-        char *val;
+        char *val = NULL;
         if (featurestr[0] == '+') {
             add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
         } else if (featurestr[0] == '-') {
@@ -1958,10 +1961,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         } else if ((val = strchr(featurestr, '='))) {
             *val = 0; val++;
             feat2prop(featurestr);
+            name = featurestr;
             if (!strcmp(featurestr, "xlevel")) {
-                char *err;
-                char num[32];
-
                 numvalue = strtoul(val, &err, 0);
                 if (!*val || *err) {
                     error_setg(errp, "bad numerical value %s", val);
@@ -1973,11 +1974,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                     numvalue += 0x80000000;
                 }
                 snprintf(num, sizeof(num), "%" PRIu32, numvalue);
-                object_property_parse(OBJECT(cpu), num, featurestr, &local_err);
+                val = num;
             } else if (!strcmp(featurestr, "tsc-freq")) {
                 int64_t tsc_freq;
-                char *err;
-                char num[32];
 
                 tsc_freq = qemu_strtosz_suffix_unit(val, &err,
                                                QEMU_STRTOSZ_DEFSUFFIX_B, 1000);
@@ -1986,12 +1985,11 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                     return;
                 }
                 snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
-                object_property_parse(OBJECT(cpu), num, "tsc-frequency",
-                                      &local_err);
+                val = num;
+                name = "tsc-frequency";
             } else if (!strcmp(featurestr, "hv-spinlocks")) {
-                char *err;
                 const int min = 0xFFF;
-                char num[32];
+
                 numvalue = strtoul(val, &err, 0);
                 if (!*val || *err) {
                     error_setg(errp, "bad numerical value %s", val);
@@ -2004,14 +2002,18 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                     numvalue = min;
                 }
                 snprintf(num, sizeof(num), "%" PRId32, numvalue);
-                object_property_parse(OBJECT(cpu), num, featurestr, &local_err);
-            } else {
-                object_property_parse(OBJECT(cpu), val, featurestr, &local_err);
+                val = num;
             }
         } else {
             feat2prop(featurestr);
-            object_property_parse(OBJECT(cpu), "on", featurestr, &local_err);
+            name = featurestr;
+            val = (char *)"on";
         }
+
+        if (val) {
+            object_property_parse(OBJECT(cpu), val, name, &local_err);
+        }
+
         if (local_err) {
             error_propagate(errp, local_err);
             return;
-- 
1.8.3.1

