Received: by 10.25.85.209 with SMTP id j200csp108671lfb;
        Fri, 10 Jun 2016 11:02:23 -0700 (PDT)
X-Received: by 10.200.47.212 with SMTP id m20mr3139536qta.53.1465581743671;
        Fri, 10 Jun 2016 11:02:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s140si6935939qhb.21.2016.06.10.11.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 11:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQlD-0007ci-41
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 14:02:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQq-0006rP-2J
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQj-0000WN-V3
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQj-0000W5-PP; Fri, 10 Jun 2016 13:41:13 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50833218D;
	Fri, 10 Jun 2016 17:41:13 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPh032552; Fri, 10 Jun 2016 13:41:11 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:27 +0200
Message-Id: <1465580427-13596-17-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 10 Jun 2016 17:41:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 16/16] sysemu/cpus: bye, bye smp_cores,
 smp_threads
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
X-TUID: 7X53Z1zlYoPo

The smp_cores and smp_threads globals are no longer used.
Vanish them.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c     |  2 --
 include/sysemu/cpus.h | 10 ----------
 vl.c                  |  2 --
 3 files changed, 14 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5427924d4c911..fdd28e5786685 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -529,8 +529,6 @@ static void machine_pre_init(MachineState *ms)
     };
 
     machine_set_smp_parameters(ms);
-    smp_cores   = ms->cores;
-    smp_threads = ms->threads;
     max_cpus    = ms->maxcpus;
     smp_cpus    = ms->cpus;
 
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index fe992a8946ed5..d3e19ca214564 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -27,16 +27,6 @@ void cpu_synchronize_all_post_init(void);
 
 void qtest_clock_warp(int64_t dest);
 
-#ifndef CONFIG_USER_ONLY
-/* vl.c */
-extern int smp_cores;
-extern int smp_threads;
-#else
-/* *-user doesn't have configurable SMP topology */
-#define smp_cores   1
-#define smp_threads 1
-#endif
-
 void list_cpus(FILE *f, fprintf_function cpu_fprintf, const char *optarg);
 
 #endif
diff --git a/vl.c b/vl.c
index 843b7a9dff753..e73c66364932c 100644
--- a/vl.c
+++ b/vl.c
@@ -155,8 +155,6 @@ int win2k_install_hack = 0;
 int singlestep = 0;
 int smp_cpus = 1;
 int max_cpus = 1;
-int smp_cores = 1;
-int smp_threads = 1;
 int acpi_enabled = 1;
 int no_hpet = 0;
 int fd_bootchk = 1;
-- 
2.4.11

