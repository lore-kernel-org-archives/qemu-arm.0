Received: by 10.25.27.66 with SMTP id b63csp815494lfb;
        Thu, 2 Jun 2016 10:01:02 -0700 (PDT)
X-Received: by 10.55.168.137 with SMTP id r131mr22707543qke.24.1464886862483;
        Thu, 02 Jun 2016 10:01:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c128si38641812qkd.12.2016.06.02.10.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 10:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8VzR-0000wA-S0
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 13:01:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8Vu3-0004L3-Sj
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8Vtz-00065y-LJ
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 12:55:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8Vtz-00065i-Cs; Thu, 02 Jun 2016 12:55:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C8283B70B;
	Thu,  2 Jun 2016 16:55:22 +0000 (UTC)
Received: from localhost (vpn1-7-10.gru2.redhat.com [10.97.7.10])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52GtL5s030929; Thu, 2 Jun 2016 12:55:22 -0400
Date: Thu, 2 Jun 2016 13:55:20 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160602165520.GH19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
	<20160602142222.307ec4ee@nial.brq.redhat.com>
	<20160602145322.GG19055@thinpad.lan.raisama.net>
	<20160602183203.4814e984@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160602183203.4814e984@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 02 Jun 2016 16:55:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] target-i386: Remove xlevel & hv-spinlocks option
 fixups
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
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
	libvir-list@redhat.com, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Jiri Denemark <jdenemar@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4/uNAKPaipdn

The "fixup will be removed in future versions" warnings are
present since QEMU 1.7.0, at least, so users should have fixed
their scripts and configurations, already.

In the case of libvirt users, libvirt doesn't use the "xlevel"
option, and already rejects HyperV spinlock retry count < 0xFFF.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Igor, feel free to include this in the beginning of your series.
I believe it will help making the patches simpler.
---
 target-i386/cpu.c | 35 +----------------------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index f3f95cd..940aa22 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1967,23 +1967,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
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
@@ -1997,23 +1981,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
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
2.5.5
