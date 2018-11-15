Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6797740wrw;
        Thu, 15 Nov 2018 01:42:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5e19QHz1mcOSUJzoGDrNcubP4jAIyJv0gaOHqIxFsX4eZnzMSJxYyO5Kk83Xvbpea1UoWaJ
X-Received: by 2002:ac8:fb4:: with SMTP id b49mr5246898qtk.2.1542274972676;
        Thu, 15 Nov 2018 01:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542274972; cv=none;
        d=google.com; s=arc-20160816;
        b=M0rU4/cCB/EiqpyvKci0N/p0dXLWVzggPN/sLXIKnAYAkdfkgjCbhMtVG+OtZqBXgL
         zCV0Uaw9iesJJDnFdljURnYrY/d5uq2Fz8/SPQx1c8jPr8XfiyrzOTEzQ792e3HrNgB2
         jihCLvPr+qz5aze4zNwSIIMBHSLuR6gDy1MYK6SyoIddRFWMRA2MmvMuWpr9xzHpgFa+
         XBr0iJm4jgK1z7XEtr3FAbO2IYTueGYa4e6t38/3uS7PrliRj9VefPQIr0e87/nQvviS
         7lEpOdRgQ4Zwf+bCHNcVIYw2F0HyY8MgRyTzvBaIC1XT776iCZfCoqaEu+e6YxUTNwXE
         T06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=oPQwFsjYogZZNPXXXDjnpaWHhAObpGpz3apNYTwjty8=;
        b=U3xVg9LQx8SZQqn2CuXk8k/tKNLzmHKkrM/AWDeX88TLo9WqQLpQ6RGl3olGpbLHI8
         L2/VRzXLSQb3WOXJS82tVz0WrzxZXK8Jk2bdyvWfJ/Ik2zNRj42Qz+sMz4nTOqw9nfhk
         z3lNVbAruxdUngGUxOOf4EqYPsuBci5123F36vpl6vO4XPm1KBncOaa32TM4TjdV4uHo
         3pqK75EhWF+7ex5Tp80jySOXQH7NwsC552n9FtDHqzpS56VIcMf5igd2f+p44lSA0yeD
         CFtcTwhvnnsj1aOquKO0JUZpxj+LkhRtdU6FFc4EdjXZQXHtd+bCY9eGhUTxtSOVaaxV
         sFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bPsZgDPZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QsHJtxD2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FF9wnlnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p77-v6si1557456qka.203.2018.11.15.01.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bPsZgDPZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QsHJtxD2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FF9wnlnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEAl-0006vP-U8
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:42:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAU-0006mu-Q5
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAH-0004N3-NM
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:28 -0500
Received: from greensocs.com ([193.104.36.180]:41851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAH-0004Ll-0r; Thu, 15 Nov 2018 04:42:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 224EC6FD95;
	Thu, 15 Nov 2018 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274934;
	bh=M0CprRAj6jUlUEKlFc5dMkzT5RJPghUHMDARv5+btVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bPsZgDPZTaUYedt8DGxPk402AAkWZ7XpuOtItj06mnAFdMJbGF7lkFMpX5mVOAYQw
	4aNmV+/gH9dh9sIvrsSerSnLzC/nnk/fEx03NUMwuRFy/bETjws4sgKzjAB1xEa6Ad
	jb54mBXywDNJCu35QRVVMZS84o9SsqhVrvsiUTHQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QsHJtxD2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FF9wnlnR
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqEXn_JyLHXi; Thu, 15 Nov 2018 10:42:13 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 032835BD196; Thu, 15 Nov 2018 10:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274933;
	bh=M0CprRAj6jUlUEKlFc5dMkzT5RJPghUHMDARv5+btVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QsHJtxD2R0n2JQMjdwqj0tp2VVZvkFOidwGjpIkMKtyg2eUq4rLhdDRDyKDOc3rxn
	aES49itKYdTznfJWAyJTDaOqJm/7Y6pyoT+FkOcKw6qikS6GP8f/8TGdvml7Botuq8
	1O8JyqQLcloKT7T/EgREF04knSG+vPsUYCBmN2N4=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 933595BD1AF;
	Thu, 15 Nov 2018 10:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274932;
	bh=M0CprRAj6jUlUEKlFc5dMkzT5RJPghUHMDARv5+btVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FF9wnlnRjRDBLEMp+CuytThIPzgsg4a8eF8ENXT3G4Q+Fq9rTMy/HiLffJHPW/5xZ
	oW03cYgg3+ZGl2VyQeqCrNAwKt5P5fva3YI537mnxomr678i3H3H34zqeULmlO8xgm
	k09Wbt/HBrRUVsLKX/jQPYmAf/0a7ZI5E7wDenhU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:53 +0100
Message-Id: <20181115094207.22846-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 02/16] gdbstub: introduce GDB processes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJ7GMKcvOQi8

Add a structure GDBProcess that represent processes from the GDB
semantic point of view.

CPUs can be split into different processes, by grouping them under
different cpu-cluster objects.  Each occurrence of a cpu-cluster object
implies the existence of the corresponding process in the GDB stub. The
GDB process ID is derived from the corresponding cluster ID as follows:

  GDB PID =3D cluster ID + 1

This is because PIDs -1 and 0 are reserved in GDB and cannot be used by
processes.

When no such container are found, all the CPUs are put in a unique GDB
process (create_unique_process()). This is also the case when compiled
in user mode, where multi-processes do not make much sense for now.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c4e4f9f082..26f5a7449a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -27,10 +27,11 @@
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "sysemu/sysemu.h"
 #include "exec/gdbstub.h"
+#include "hw/cpu/cluster.h"
 #endif
=20
 #define MAX_PACKET_LENGTH 4096
=20
 #include "qemu/sockets.h"
@@ -294,10 +295,15 @@ typedef struct GDBRegisterState {
     gdb_reg_cb set_reg;
     const char *xml;
     struct GDBRegisterState *next;
 } GDBRegisterState;
=20
+typedef struct GDBProcess {
+    uint32_t pid;
+    bool attached;
+} GDBProcess;
+
 enum RSState {
     RS_INACTIVE,
     RS_IDLE,
     RS_GETLINE,
     RS_GETLINE_ESC,
@@ -322,10 +328,13 @@ typedef struct GDBState {
     int running_state;
 #else
     CharBackend chr;
     Chardev *mon_chr;
 #endif
+    bool multiprocess;
+    GDBProcess *processes;
+    int process_num;
     char syscall_buf[256];
     gdb_syscall_complete_cb current_syscall_cb;
 } GDBState;
=20
 /* By default use no IRQs and no timers while single stepping so as to
@@ -1749,10 +1758,24 @@ void gdb_exit(CPUArchState *env, int code)
 #ifndef CONFIG_USER_ONLY
   qemu_chr_fe_deinit(&s->chr, true);
 #endif
 }
=20
+/*
+ * Create a unique process containing all the CPUs.
+ */
+static void create_unique_process(GDBState *s)
+{
+    GDBProcess *process;
+
+    s->processes =3D g_malloc0(sizeof(GDBProcess));
+    s->process_num =3D 1;
+    process =3D &s->processes[0];
+
+    process->pid =3D 1;
+}
+
 #ifdef CONFIG_USER_ONLY
 int
 gdb_handlesig(CPUState *cpu, int sig)
 {
     GDBState *s;
@@ -1846,10 +1869,11 @@ static bool gdb_accept(void)
     }
=20
     s =3D g_malloc0(sizeof(GDBState));
     s->c_cpu =3D first_cpu;
     s->g_cpu =3D first_cpu;
+    create_unique_process(s);
     s->fd =3D fd;
     gdb_has_xml =3D false;
=20
     gdbserver_state =3D s;
     return true;
@@ -2002,10 +2026,69 @@ static const TypeInfo char_gdb_type_info =3D {
     .name =3D TYPE_CHARDEV_GDB,
     .parent =3D TYPE_CHARDEV,
     .class_init =3D char_gdb_class_init,
 };
=20
+static int find_cpu_clusters(Object *child, void *opaque)
+{
+    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
+        GDBState *s =3D (GDBState *) opaque;
+        CPUClusterState *cluster =3D CPU_CLUSTER(child);
+        GDBProcess *process;
+
+        s->processes =3D g_renew(GDBProcess, s->processes, ++s->process_=
num);
+
+        process =3D &s->processes[s->process_num - 1];
+
+        /*
+         * GDB process IDs -1 and 0 are reserved. To avoid subtle errors=
 at
+         * runtime, we enforce here that the machine does not use a clus=
ter ID
+         * that would lead to PID 0. */
+        assert(process->pid !=3D UINT32_MAX);
+        process->pid =3D cluster->cluster_id + 1;
+        process->attached =3D false;
+
+        return 0;
+    }
+
+    return object_child_foreach(child, find_cpu_clusters, opaque);
+}
+
+static int pid_order(const void *a, const void *b)
+{
+    GDBProcess *pa =3D (GDBProcess *) a;
+    GDBProcess *pb =3D (GDBProcess *) b;
+
+    if (pa->pid < pb->pid) {
+        return -1;
+    } else if (pa->pid > pb->pid) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+static void create_processes(GDBState *s)
+{
+    object_child_foreach(object_get_root(), find_cpu_clusters, s);
+
+    if (!s->processes) {
+        /* No CPU cluster specified by the machine */
+        create_unique_process(s);
+    } else {
+        /* Sort by PID */
+        qsort(s->processes, s->process_num, sizeof(s->processes[0]), pid=
_order);
+    }
+}
+
+static void cleanup_processes(GDBState *s)
+{
+    g_free(s->processes);
+    s->process_num =3D 0;
+    s->processes =3D NULL;
+}
+
 int gdbserver_start(const char *device)
 {
     trace_gdbstub_op_start(device);
=20
     GDBState *s;
@@ -2058,15 +2141,19 @@ int gdbserver_start(const char *device)
                                    NULL, &error_abort);
         monitor_init(mon_chr, 0);
     } else {
         qemu_chr_fe_deinit(&s->chr, true);
         mon_chr =3D s->mon_chr;
+        cleanup_processes(s);
         memset(s, 0, sizeof(GDBState));
         s->mon_chr =3D mon_chr;
     }
     s->c_cpu =3D first_cpu;
     s->g_cpu =3D first_cpu;
+
+    create_processes(s);
+
     if (chr) {
         qemu_chr_fe_init(&s->chr, chr, &error_abort);
         qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_r=
eceive,
                                  gdb_chr_event, NULL, NULL, NULL, true);
     }
--=20
2.19.1

