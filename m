Received: by 10.80.166.35 with SMTP id d32csp513123edc;
        Fri, 14 Oct 2016 15:55:42 -0700 (PDT)
X-Received: by 10.55.182.4 with SMTP id g4mr13111797qkf.120.1476485742220;
        Fri, 14 Oct 2016 15:55:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m23si11053646qtc.142.2016.10.14.15.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 15:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bvBO9-0008Fw-Ji
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 18:55:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bvBO3-0008Fm-92
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 18:55:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bvBNy-0000bP-74
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 18:55:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bvBNx-0000H8-PD; Fri, 14 Oct 2016 18:55:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3047B3D945;
	Fri, 14 Oct 2016 22:53:08 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EMqotm012280; Fri, 14 Oct 2016 18:53:00 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Oct 2016 00:52:47 +0200
Message-Id: <1476485569-6744-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 14 Oct 2016 22:53:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/3] exec: split cpu_exec_init()
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
Cc: Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>, Jia Liu <proljc@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Anthony Green <green@moxielogic.com>, Alexander Graf <agraf@suse.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Greg Ungerer <gerg@uclinux.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VfEg5AKPKlup

Put in cpu_exec_initfn() what initializes the CPU,
and let in cpu_exec_init() what adds it to the environment.

As cpu_exec_initfn() is called by all XX_cpu_initfn() call it
directly in cpu_common_initfn().
cpu_exec_init() is now a realize function, it will be renamed
to cpu_exec_realizefn() and moved to the XX_cpu_realizefn()
function in a following patch.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 exec.c            | 10 ++++++----
 include/qom/cpu.h |  1 +
 qom/cpu.c         |  2 ++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 374c364..d1e57c4 100644
--- a/exec.c
+++ b/exec.c
@@ -610,11 +610,8 @@ void cpu_exec_exit(CPUState *cpu)
     }
 }
 
-void cpu_exec_init(CPUState *cpu, Error **errp)
+void cpu_exec_initfn(CPUState *cpu)
 {
-    CPUClass *cc ATTRIBUTE_UNUSED = CPU_GET_CLASS(cpu);
-    Error *local_err ATTRIBUTE_UNUSED = NULL;
-
     cpu->as = NULL;
     cpu->num_ases = 0;
 
@@ -635,6 +632,11 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
     cpu->memory = system_memory;
     object_ref(OBJECT(cpu->memory));
 #endif
+}
+
+void cpu_exec_init(CPUState *cpu, Error **errp)
+{
+    CPUClass *cc ATTRIBUTE_UNUSED = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
 
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 6d481a1..d7648a9 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -946,6 +946,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
+void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_exit(CPUState *cpu);
 
 #ifdef CONFIG_SOFTMMU
diff --git a/qom/cpu.c b/qom/cpu.c
index c40f774..85f1132 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -362,6 +362,8 @@ static void cpu_common_initfn(Object *obj)
     QTAILQ_INIT(&cpu->watchpoints);
 
     cpu->trace_dstate = bitmap_new(trace_get_vcpu_event_count());
+
+    cpu_exec_initfn(cpu);
 }
 
 static void cpu_common_finalize(Object *obj)
-- 
2.7.4

