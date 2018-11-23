Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749403wrt;
        Fri, 23 Nov 2018 01:18:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5fS99DPrD+w7WeyPljXRlRE7r10gA8MOHcsbhXZTfyehMyMLTZpphZ8YUYrkU4E9xO/hK76
X-Received: by 2002:a81:e204:: with SMTP id p4-v6mr15087308ywl.37.1542964719780;
        Fri, 23 Nov 2018 01:18:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964719; cv=none;
        d=google.com; s=arc-20160816;
        b=hLKq05cC2DE36RP/bCFQXBA0DA84Wa1Yub+NS2F4dP7l4XTLlQhQujcFO6SkB1A6KV
         JgKjAkEMMVQ0xiTeRf58HaaGAaLFyezyWpW2O5IgEKNV6lk83EZwF0bs7jInTbWEQek4
         pS2u+Ce6dtH/LT5wGC6Yrai2JYiHeIij0w1+RrchZh5Khsj9gX1oZejcUZaJLGV1bEjI
         YAac8/DxxL/DG01q4m5zJ4fYUyP9SvXfbl1owCOwOi+g1WgkndAUDvYfpgRNQW5531sz
         chGen4CN9TADoT5nEQ4cdRP1rvigTrJhx4KtEJWK8hnhsVihMxMalk30Fxr+5+Iy38tQ
         je1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=oPQwFsjYogZZNPXXXDjnpaWHhAObpGpz3apNYTwjty8=;
        b=H7UjPZ9BKPxXlEzZ6Jecmavo83KWxxB6a7WrQU/ar8WZO/ilSWXMyzzn10DaUcd+ke
         DmFKwdWURryQQNxBVDHcpeWBAU6vBmdXLjBiOa9kfLJhY7nCcmZUTxADlkTEiKUKjfQj
         0tI3u7+75DSJZtX9jzz28f/lTZI3x/YUlFfKpvBHMOGCyUJ0g6XZr+k+pi+p0GPwZy8E
         0GjaZrahjnqltcj969JoOTAMFhTLCPVabdQCJdxQz25gs0Dy92Yz8l3VrSWHnd9rzreX
         Fvh8EOzznjFKNEr/6G7IVuaREGXocupS/lFB66f9omBLVXCtWsakM2kpxWfObNkpO3+D
         b7vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ssHEWozy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4f9bo3Js;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4f9bo3Js;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h127-v6si27477085ywf.181.2018.11.23.01.18.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ssHEWozy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4f9bo3Js;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4f9bo3Js;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bi-0008R1-I7
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oY-Jn
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7at-0000WY-FF
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7ar-0000Ll-2k; Fri, 23 Nov 2018 04:17:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 83F8D5C024E;
	Fri, 23 Nov 2018 10:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964653;
	bh=M0CprRAj6jUlUEKlFc5dMkzT5RJPghUHMDARv5+btVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ssHEWozywZIxDuiYJVNG4acxmpt/s2b9LyqJiPVf6SFgId+S5UdmJ4rOodmLEIL5X
	nyeDqMeBrDXDY+C9nroBaO/W7aEjz6rdYMkupWrKOCOR948/5XqVP0w/lpD5xb9BYX
	nIENqRq+5C5jINv1N9aS8yhk2VArvy2Ptn2hOZF0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4f9bo3Js;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4f9bo3Js
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPNzAxaOEqYM; Fri, 23 Nov 2018 10:17:32 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 8B9F05BD1BB; Fri, 23 Nov 2018 10:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964652;
	bh=M0CprRAj6jUlUEKlFc5dMkzT5RJPghUHMDARv5+btVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4f9bo3JsYMN5k0BN7ssSpk0aCSNtkoMM2NvigFxAwAKGYnLW+TEWLQ2NMjeGklhf8
	OaSxCac3ZluZtOye2pHkgB6JlkhxdVXLlJUPqUl2/ibYiRW9efW8TVrPZ6hXIR7nLh
	nYGAAt7FF/6+CWCnXfTEnZk6hdFsOkwdugyyjjK8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 269C644688F;
	Fri, 23 Nov 2018 10:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964652;
	bh=M0CprRAj6jUlUEKlFc5dMkzT5RJPghUHMDARv5+btVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4f9bo3JsYMN5k0BN7ssSpk0aCSNtkoMM2NvigFxAwAKGYnLW+TEWLQ2NMjeGklhf8
	OaSxCac3ZluZtOye2pHkgB6JlkhxdVXLlJUPqUl2/ibYiRW9efW8TVrPZ6hXIR7nLh
	nYGAAt7FF/6+CWCnXfTEnZk6hdFsOkwdugyyjjK8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:15 +0100
Message-Id: <20181123091729.29921-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 02/16] gdbstub: introduce GDB processes
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
X-TUID: LNEazVaFQzwc

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

