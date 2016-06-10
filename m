Received: by 10.25.85.209 with SMTP id j200csp103743lfb;
        Fri, 10 Jun 2016 10:48:40 -0700 (PDT)
X-Received: by 10.140.177.1 with SMTP id x1mr3176400qhx.39.1465580920192;
        Fri, 10 Jun 2016 10:48:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l16si6891555qhc.76.2016.06.10.10.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQXv-0004VS-I4
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQX-0006XT-3f
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQV-0000Rk-RI
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQN-0000PJ-CJ; Fri, 10 Jun 2016 13:40:51 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E730D3F723;
	Fri, 10 Jun 2016 17:40:50 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPY032552; Fri, 10 Jun 2016 13:40:48 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:18 +0200
Message-Id: <1465580427-13596-8-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 10 Jun 2016 17:40:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RFC 07/16] qom/cpu: make nr-cores,
 nr-threads real properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RNlJNoMsLDXI

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 qom/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qom/cpu.c b/qom/cpu.c
index 751e992de8823..024cda3eb98c8 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -28,6 +28,7 @@
 #include "exec/log.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
 
 bool cpu_exists(int64_t id)
 {
@@ -342,6 +343,12 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
+static Property cpu_common_properties[] = {
+    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
+    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -367,6 +374,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->cpu_exec_exit = cpu_common_noop;
     k->cpu_exec_interrupt = cpu_common_exec_interrupt;
     dc->realize = cpu_common_realizefn;
+    dc->props = cpu_common_properties;
     /*
      * Reason: CPUs still need special care by board code: wiring up
      * IRQs, adding reset handlers, halting non-first CPUs, ...
-- 
2.4.11

