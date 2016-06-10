Received: by 10.25.85.209 with SMTP id j200csp100725lfb;
        Fri, 10 Jun 2016 10:40:48 -0700 (PDT)
X-Received: by 10.200.47.6 with SMTP id j6mr3050973qta.85.1465580448505;
        Fri, 10 Jun 2016 10:40:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a76si6586066qge.48.2016.06.10.10.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQQJ-0006JZ-U3
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:40:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQD-0006HQ-Ps
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQB-0000LX-HT
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQB-0000LK-4u; Fri, 10 Jun 2016 13:40:39 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA1833F745;
	Fri, 10 Jun 2016 17:40:38 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPT032552; Fri, 10 Jun 2016 13:40:36 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:13 +0200
Message-Id: <1465580427-13596-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 10 Jun 2016 17:40:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 02/16] vl: smp: add checks for maxcpus based
 topologies
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
X-TUID: yo817e6aQywp

smp_parse computes missing smp options. Unfortunately cores and
threads are computed by dividing smp_cpus, instead of max_cpus.
This is incorrect because the topology doesn't leave room for
hotplug. More unfortunately, we can't change it easily, as doing
so would impact existing command lines. This patch adds a warning
when the topology doesn't add up, and then checks that the topology
at least computes when sockets are recalculated. If not, then it
does fail.

Adding the new failure is justified by the fact that we don't
store the number of input sockets, and thus all consumers of
cpu topology information recalculate it. If they choose to
(correctly) calculate it based on maxcpus, then we need to
guard them against building topologies which provide more cpu
slots than are the maximum allowed cpus.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 vl.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/vl.c b/vl.c
index 7b96e787922f9..8d482cb1bf020 100644
--- a/vl.c
+++ b/vl.c
@@ -1227,6 +1227,7 @@ static void smp_parse(QemuOpts *opts)
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        bool sockets_input = sockets > 0;
 
         /* compute missing values, prefer sockets over cores over threads */
         if (cpus == 0 || sockets == 0) {
@@ -1269,6 +1270,24 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
+        if (sockets_input && sockets * cores * threads != max_cpus) {
+            unsigned sockets_rounded = DIV_ROUND_UP(max_cpus, cores * threads);
+
+            error_report("warning: cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) != "
+                         "maxcpus (%u). Trying sockets=%u.",
+                         sockets, cores, threads, max_cpus, sockets_rounded);
+            sockets = sockets_rounded;
+
+            if (sockets * cores * threads > max_cpus) {
+                error_report("cpu topology: "
+                             "sockets (%u) * cores (%u) * threads (%u) > "
+                             "maxcpus (%u)",
+                             sockets, cores, threads, max_cpus);
+                exit(1);
+            }
+        }
+
         smp_cpus = cpus;
         smp_cores = cores;
         smp_threads = threads;
-- 
2.4.11

