Received: by 10.25.85.209 with SMTP id j200csp100779lfb;
        Fri, 10 Jun 2016 10:40:56 -0700 (PDT)
X-Received: by 10.140.103.241 with SMTP id y104mr3017917qge.54.1465580456507;
        Fri, 10 Jun 2016 10:40:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n74si6852995qka.255.2016.06.10.10.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQQR-0006Of-TC
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:40:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQG-0006Ih-Av
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQ9-0000L1-1X
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQ8-0000Kx-R8; Fri, 10 Jun 2016 13:40:36 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C4F983F45;
	Fri, 10 Jun 2016 17:40:36 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPS032552; Fri, 10 Jun 2016 13:40:34 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:12 +0200
Message-Id: <1465580427-13596-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 10 Jun 2016 17:40:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 01/16] vl: smp_parse: cleanups
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: osUFUI7GmEF+

No functional changes; only some code movement and removal of
dead code (impossible conditions). Also, max_cpus can be
initialized to 1, like smp_cpus, because it's either set by the
user or set to smp_cpus, when smp_cpus is set by the user, or
set to 1, when nothing is set.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 vl.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/vl.c b/vl.c
index b0bcc255ee9a5..7b96e787922f9 100644
--- a/vl.c
+++ b/vl.c
@@ -154,7 +154,7 @@ CharDriverState *sclp_hds[MAX_SCLP_CONSOLES];
 int win2k_install_hack = 0;
 int singlestep = 0;
 int smp_cpus = 1;
-int max_cpus = 0;
+int max_cpus = 1;
 int smp_cores = 1;
 int smp_threads = 1;
 int acpi_enabled = 1;
@@ -1223,7 +1223,6 @@ static QemuOptsList qemu_smp_opts = {
 static void smp_parse(QemuOpts *opts)
 {
     if (opts) {
-
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
@@ -1251,6 +1250,17 @@ static void smp_parse(QemuOpts *opts)
         }
 
         max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+
+        if (max_cpus > MAX_CPUMASK_BITS) {
+            error_report("unsupported number of maxcpus");
+            exit(1);
+        }
+
+        if (max_cpus < cpus) {
+            error_report("maxcpus must be equal to or greater than smp");
+            exit(1);
+        }
+
         if (sockets * cores * threads > max_cpus) {
             error_report("cpu topology: "
                          "sockets (%u) * cores (%u) * threads (%u) > "
@@ -1260,25 +1270,11 @@ static void smp_parse(QemuOpts *opts)
         }
 
         smp_cpus = cpus;
-        smp_cores = cores > 0 ? cores : 1;
-        smp_threads = threads > 0 ? threads : 1;
-
-    }
-
-    if (max_cpus == 0) {
-        max_cpus = smp_cpus;
-    }
-
-    if (max_cpus > MAX_CPUMASK_BITS) {
-        error_report("unsupported number of maxcpus");
-        exit(1);
-    }
-    if (max_cpus < smp_cpus) {
-        error_report("maxcpus must be equal to or greater than smp");
-        exit(1);
+        smp_cores = cores;
+        smp_threads = threads;
     }
 
-    if (smp_cpus > 1 || smp_cores > 1 || smp_threads > 1) {
+    if (smp_cpus > 1) {
         Error *blocker = NULL;
         error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
         replay_add_blocker(blocker);
-- 
2.4.11

