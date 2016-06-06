Received: by 10.25.27.66 with SMTP id b63csp1557093lfb;
        Mon, 6 Jun 2016 08:45:04 -0700 (PDT)
X-Received: by 10.55.77.130 with SMTP id a124mr16303663qkb.198.1465227903959;
        Mon, 06 Jun 2016 08:45:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si592317qtb.18.2016.06.06.08.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:45:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9wi7-0000CQ-75
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:45:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH5-0000RG-1Y
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wGy-0006wB-Mk
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wGy-0006w0-Ed; Mon, 06 Jun 2016 11:17:00 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 053A264089;
	Mon,  6 Jun 2016 15:17:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtmu013155; Mon, 6 Jun 2016 11:16:58 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:43 +0200
Message-Id: <1465226212-254093-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 06 Jun 2016 15:17:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 01/10] target-i386: Remove xlevel & hv-spinlocks
 option fixups
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
X-TUID: xQK15Y/JF6zQ

From: Eduardo Habkost <ehabkost@redhat.com>

The "fixup will be removed in future versions" warnings are
present since QEMU 1.7.0, at least, so users should have fixed
their scripts and configurations, already.

In the case of libvirt users, libvirt doesn't use the "xlevel"
option, and already rejects HyperV spinlock retry count < 0xFFF.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 3fbc6f3..07bbab7 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1944,7 +1944,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
     FeatureWordArray plus_features = { 0 };
     /* Features to be removed */
     FeatureWordArray minus_features = { 0 };
-    uint32_t numvalue;
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
 
@@ -1959,23 +1958,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         } else if ((val = strchr(featurestr, '='))) {
             *val = 0; val++;
             feat2prop(featurestr);
-            if (!strcmp(featurestr, "xlevel")) {
-                char *err;
-                char num[32];
-
-                numvalue = strtoul(val, &err, 0);
-                if (!*val || *err) {
-                    error_setg(errp, "bad numerical value %s", val);
-                    return;
-                }
-                if (numvalue < 0x80000000) {
-                    error_report("xlevel value shall always be >= 0x80000000"
-                                 ", fixup will be removed in future versions");
-                    numvalue += 0x80000000;
-                }
-                snprintf(num, sizeof(num), "%" PRIu32, numvalue);
-                object_property_parse(OBJECT(cpu), num, featurestr, &local_err);
-            } else if (!strcmp(featurestr, "tsc-freq")) {
+            if (!strcmp(featurestr, "tsc-freq")) {
                 int64_t tsc_freq;
                 char *err;
                 char num[32];
@@ -1989,23 +1972,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                 snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
                 object_property_parse(OBJECT(cpu), num, "tsc-frequency",
                                       &local_err);
-            } else if (!strcmp(featurestr, "hv-spinlocks")) {
-                char *err;
-                const int min = 0xFFF;
-                char num[32];
-                numvalue = strtoul(val, &err, 0);
-                if (!*val || *err) {
-                    error_setg(errp, "bad numerical value %s", val);
-                    return;
-                }
-                if (numvalue < min) {
-                    error_report("hv-spinlocks value shall always be >= 0x%x"
-                                 ", fixup will be removed in future versions",
-                                 min);
-                    numvalue = min;
-                }
-                snprintf(num, sizeof(num), "%" PRId32, numvalue);
-                object_property_parse(OBJECT(cpu), num, featurestr, &local_err);
             } else {
                 object_property_parse(OBJECT(cpu), val, featurestr, &local_err);
             }
-- 
1.8.3.1

