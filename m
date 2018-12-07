Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp237506wrt;
        Fri, 7 Dec 2018 01:02:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XRV2B9FD2P5KsmzSiuve6ltTzfSuTyhAcYuB8Jg9jhGKLr9CrZvc1uSPHlG+AhhsY3gvAP
X-Received: by 2002:a0c:b5c8:: with SMTP id o8mr1172216qvf.213.1544173376615;
        Fri, 07 Dec 2018 01:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173376; cv=none;
        d=google.com; s=arc-20160816;
        b=pl5D9/tFeYDeSgabAlIc2B2P2z9u8eQhMQ/CJrFhA1acgT2yySS2kvmINUX1hgda8b
         K9Zb6iLmOXXrFBVhjWleJIiSXe2XJ7I4Kl8/48KaMRpskqr8LcWO10oXTIfnoc4N4ylc
         cFnwIfC3Cd7taWPj97RzZS5BTrnpsNy2G8GBj7IKzSeVlwGneTSxIYRZRaUJ+c89maUm
         160H3H2KUq64HFcgPDq2nEIBMWd9MyS/ViQQBZdvyq7Grn6hZmZFes7JG149u2fEWA4e
         rhGeEjMD6UDgJHHOHR9PUPJzbB6ZeC352haWDJLmsdKGKcqgo26uV4iZnsofbOzp9Hve
         vb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=PRMKNqeY2SSfV4L+v6yl6EaItZVqX6nmqqvtj7SA8K0=;
        b=R53qxAmnR1kkApsDBkMDgHKIns1PvPNiVI1x2N61ebA8y8kNnTamAJkHDajKrkGUrj
         Lb0xjTrv6pwyuGTuQj8MYTAjWC2vCx7/nZCBMIwRmwm9Y6w/xS43AdD7l5bKF8L9tyX5
         HXuX9gXH01EtUdeqH6s1gHDuDw/NU5kXlpwBwxVO4O3k7WjebUeu5OaQL9Tg7Mbb5l0q
         osOC0MpszmnyYd+zordIimZDBqDV6RhyHU+BsQYhRaklSPNxuHqPrN1oS3inmDDW1cbs
         pCnUdaClu0kKegzwW1Nvnnb0/RkwT9JNEw2R3myX+O8IQ5GEP+aOdXqhXz/sJp/8I+9q
         74mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0o2dgiSE;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ktxf9n1u;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ktxf9n1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si1004105qtn.52.2018.12.07.01.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:02:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0o2dgiSE;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ktxf9n1u;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ktxf9n1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC2C-0008TP-1W
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:02:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1E-0007s2-BP
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1A-0005RB-Nb
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:56 -0500
Received: from greensocs.com ([193.104.36.180]:52154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1A-0005OI-4h; Fri, 07 Dec 2018 04:01:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D2AF9441B53;
	Fri,  7 Dec 2018 10:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173302;
	bh=Td0U/Tjezcs9QOROPPNJsCNzbHguapS0+D1uVLV94LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0o2dgiSEScVeVn9SVM3+MDYIcXvA8nB0tAtxcnb64Ono4co719PyAmeXeg/l8pZH6
	YzYKsEXec5LUWqo9I2DhPCdrJONwPzCdi8Jmg0ge6Wsbee3d4iyF1ETiNJacrp9Ngc
	WgP/X8Um1ZZO9iENmBCtiR4ZPBOS4YWERdCZDmjc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ktxf9n1u;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ktxf9n1u
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sicZ77RD0FE3; Fri,  7 Dec 2018 10:01:42 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id F08EC48001C; Fri,  7 Dec 2018 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173301;
	bh=Td0U/Tjezcs9QOROPPNJsCNzbHguapS0+D1uVLV94LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ktxf9n1uJIxxy9ayZqkfQuKZAB6W0QMnuUfk5f9T2cbhilqtaagorU5XJdmSSxST3
	0m4P+fHwf78istdzQOR0pPp9bfbZ51YzG8U8i9fAEjDBqsh/MCRvQtl4Qme8c1fPb8
	r8KBuwnMnOhkujODj9+G9GKyDBocjrQ/18gNG7Yg=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7AFD0441B53;
	Fri,  7 Dec 2018 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173301;
	bh=Td0U/Tjezcs9QOROPPNJsCNzbHguapS0+D1uVLV94LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ktxf9n1uJIxxy9ayZqkfQuKZAB6W0QMnuUfk5f9T2cbhilqtaagorU5XJdmSSxST3
	0m4P+fHwf78istdzQOR0pPp9bfbZ51YzG8U8i9fAEjDBqsh/MCRvQtl4Qme8c1fPb8
	r8KBuwnMnOhkujODj9+G9GKyDBocjrQ/18gNG7Yg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:20 +0100
Message-Id: <20181207090135.7651-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 02/16] gdbstub: introduce GDB processes
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
X-TUID: eEnFAaldkNd2

Add a structure GDBProcess that represents processes from the GDB
semantic point of view.

CPUs can be split into different processes, by grouping them under
different cpu-cluster objects.  Each occurrence of a cpu-cluster object
implies the existence of the corresponding process in the GDB stub. The
GDB process ID is derived from the corresponding cluster ID as follows:

  GDB PID =3D cluster ID + 1

This is because PIDs -1 and 0 are reserved in GDB and cannot be used by
processes.

A default process is created to handle CPUs that are not in a cluster.
This process gets the PID of the last process PID + 1.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c4e4f9f082..2a3aa0f07e 100644
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
@@ -1749,10 +1758,34 @@ void gdb_exit(CPUArchState *env, int code)
 #ifndef CONFIG_USER_ONLY
   qemu_chr_fe_deinit(&s->chr, true);
 #endif
 }
=20
+/*
+ * Create the process that will contain all the "orphan" CPUs (that are =
not
+ * part of a CPU cluster). Note that if this process contains no CPUs, i=
t won't
+ * be attachable and thus will be invisible to the user.
+ */
+static void create_default_process(GDBState *s)
+{
+    GDBProcess *process;
+    int max_pid =3D 0;
+
+    if (s->process_num) {
+        max_pid =3D s->processes[s->process_num - 1].pid;
+    }
+
+    s->processes =3D g_renew(GDBProcess, s->processes, ++s->process_num)=
;
+    process =3D &s->processes[s->process_num - 1];
+
+    /* We need an available PID slot for this process */
+    assert(max_pid < UINT32_MAX);
+
+    process->pid =3D max_pid + 1;
+    process->attached =3D false;
+}
+
 #ifdef CONFIG_USER_ONLY
 int
 gdb_handlesig(CPUState *cpu, int sig)
 {
     GDBState *s;
@@ -1846,10 +1879,11 @@ static bool gdb_accept(void)
     }
=20
     s =3D g_malloc0(sizeof(GDBState));
     s->c_cpu =3D first_cpu;
     s->g_cpu =3D first_cpu;
+    create_default_process(s);
     s->fd =3D fd;
     gdb_has_xml =3D false;
=20
     gdbserver_state =3D s;
     return true;
@@ -2002,10 +2036,68 @@ static const TypeInfo char_gdb_type_info =3D {
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
+        assert(cluster->cluster_id !=3D UINT32_MAX);
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
+    if (s->processes) {
+        /* Sort by PID */
+        qsort(s->processes, s->process_num, sizeof(s->processes[0]), pid=
_order);
+    }
+
+    create_default_process(s);
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
@@ -2058,15 +2150,19 @@ int gdbserver_start(const char *device)
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
2.19.2

