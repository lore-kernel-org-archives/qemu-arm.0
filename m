Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp447912wro;
        Fri, 26 Oct 2018 01:39:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fq5s6/M8d63vnGu/NSpfyaxRYcjm6M8bqSJlfWwqGeFUwtUPUxL91rYwpDHZG/eCdIjnmg
X-Received: by 2002:a0c:d78f:: with SMTP id z15mr2353138qvi.127.1540543145690;
        Fri, 26 Oct 2018 01:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543145; cv=none;
        d=google.com; s=arc-20160816;
        b=QNd7pxcawrwP8zkOfIgTiM+hej7PeU4qpz2CtMS4+3fzDsWiXzeE353x6FywAmVWYN
         Sphc/6QtA38ygB+B1mqlq5D1yQ3hd8xRW5VA3qcucPmihvrxjdXyPjjnIDm5dF32MSVM
         E2tnn9/3DkBW2N251An3CO4PSPrYB1iuiNT0WJKwS0heWkb0jc0alyVjJ5QiKA4T8gg+
         e7I2Yj3PJfp5gel9M/qOARyhIrbVGnCwwB1bpWfbQzGUt78OsAw6GXJWdQZ5KKPXsLFj
         guvZ6n/y8cDcVO8YqMOz3t5xkXsLAEhdxCzAebg9nat9fGesD8FFIy7XoaCdnzVAIhOB
         BQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=afRC9j5QON75axQZbxs4QNbppV9PYDf+Hwovxdw5BNY=;
        b=JdBwgGx6XgIeLy+6HrQ53P5Sx3nfJKx6nCtIF6e5HM+aqPEQ332Xa2kkWPYB0DY42Q
         YOaW2ugzClAm9SyBi9Lw0CZ3qDlzuwTZwKorHbrZiTYHfuIShuHnVn2SasKa2Cih0tPM
         gbK0GjBPS7KK/aFjlhJfO310PuduqLy4BMukwCDmsleLV9LLrvwhjc2cDHZpm2KdMKRW
         iwgMTwR5dDQVkr+nmjD+SBKE+ODNqjo4f4WR8QXTdBWNrpqFkpa4SjMcBbHM+ZJO74vm
         QZqnycaNEnbrYrWSBfjt9vg8yP5mVuWFDanYICHXFUh3oqSQlsbV8p+O6hrABLZBnffa
         aP2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ovUCefj6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pLZu8LMw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pLZu8LMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32-v6si4510483qtj.56.2018.10.26.01.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ovUCefj6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pLZu8LMw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pLZu8LMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxe5-0003y0-1Y
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:39:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUI-0000gX-De
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJD-0004oZ-Js
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:33 -0400
Received: from greensocs.com ([193.104.36.180]:45300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ7-0004hc-Uu; Fri, 26 Oct 2018 04:17:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 43BDA441B41;
	Fri, 26 Oct 2018 10:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541833;
	bh=scAeeVUfiTBPeUG7BQf+uaQpfj0tR1sNl+CRKI8s5z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ovUCefj6d9PIItgvl4j6FmxhFy8yfP56++oLV+fTswumOybax39M0qXmboIHXzWqm
	I0PI7h6G6CK/THiqHg13mXSWXEAXz8g0Q88p8REvnNPg0gq/XhIaCFU3V8qC0wIk/C
	tF2UGKAtu80DpwRqFIyxOPyCG+nUKMO+ppfq0Ug4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pLZu8LMw;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pLZu8LMw
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id le96QaU4gNHj; Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 6F16B441B47; Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541832;
	bh=scAeeVUfiTBPeUG7BQf+uaQpfj0tR1sNl+CRKI8s5z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pLZu8LMwLViZG4fWBeenF7n2WA9d6gWAPtMPAzQ06nZrhlN0I+v69uX2riH9rssjJ
	KLQnBu0mcZImHesptI0aG7wmN3Pf+AUg7UYBmgRJPA/Ul5LesFhabmQ6a1hme9IAqI
	AzOQGF9LYpm2KLxLcNwUm0paWjKgaJilbpV63BcM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0ABC8441B41;
	Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541832;
	bh=scAeeVUfiTBPeUG7BQf+uaQpfj0tR1sNl+CRKI8s5z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pLZu8LMwLViZG4fWBeenF7n2WA9d6gWAPtMPAzQ06nZrhlN0I+v69uX2riH9rssjJ
	KLQnBu0mcZImHesptI0aG7wmN3Pf+AUg7UYBmgRJPA/Ul5LesFhabmQ6a1hme9IAqI
	AzOQGF9LYpm2KLxLcNwUm0paWjKgaJilbpV63BcM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:39 +0200
Message-Id: <20181026081653.24602-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 02/16] gdbstub: introduce GDB processes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xd0VZOqbBlJi

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
---
 gdbstub.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c4e4f9f082..096ac8e99c 100644
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
@@ -2002,10 +2026,57 @@ static const TypeInfo char_gdb_type_info =3D {
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
+
+        s->processes =3D g_renew(GDBProcess, s->processes, ++s->process_=
num);
+
+        GDBProcess *process =3D &s->processes[s->process_num - 1];
+
+        /* GDB process IDs -1 and 0 are reserved */
+        process->pid =3D cluster->cluster_id + 1;
+        process->attached =3D false;
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
+    return pa->pid - pb->pid;
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
@@ -2058,15 +2129,19 @@ int gdbserver_start(const char *device)
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

