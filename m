Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp738507wrw;
        Tue, 6 Nov 2018 03:06:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5dxyRujzJXoQupYo53tzUiBiK6L+0L2+8kgw32McVd3fE71/tbGcc33X3OKCTe1D3VITUwZ
X-Received: by 2002:ac8:3fc9:: with SMTP id v9mr24691370qtk.108.1541502393672;
        Tue, 06 Nov 2018 03:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502393; cv=none;
        d=google.com; s=arc-20160816;
        b=yDSHnNOCdplOiEsbwewfgI4spqTCK1roqSe7ujkhybkHHJgLsF6cYkvca61LKOp02s
         mMsPyimGtKL0QXIpR4Mz0Js2rfnEOXvHR7MaxF83CpnrbU9j+Uxlovj+m10XwOiINvj+
         on9sTmhZsdpvf/Z6MPnwqCK4ILocOX0KNlYFOJchZyQuSqF9z56Td4Q+4AeZ+BYfWHil
         ojNK9jxlGfhFha+PXyYJVC75DEEzC4dVB5geGZQGu6QdTDvqPShae1F0/8tvlwosDv+D
         iEYrjAE1PGcTqXCYPDyTMkvcFXXJeNV0Y695MCEvQpUlWFOT99EmyHOCZpZ5y7ISt8HR
         EULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=JWatFOKT19X20MQyPVrMYlG3I08+NQ4YHHRAJXg/2q0=;
        b=glEvpsRXhKXPp5omubsfUP0A+kILCChDPcCX7NwxNHv5Sz/Y5UE2QnnWY/EZRyNMnk
         vaBGSxCYh0HvfbsE29U/RTqFT2VzdaNn92ZDAkShKUshmBBD0lmHbh6BV3YGt9zkeaEh
         IjyfmNIbYBQ52PaHQQr3ITZR25Z6iTxfnkCdzuDhDBieXLzxzU/5/dh8ft3dCRPwIGK3
         VqKt176nSDGCPxsfgtA2NxdJ7NSbV/c9/sdh8W/PIqXYwtOfdaTFir/YEhaaLOaACFH0
         DZ9K7a869luCoSohfJnXyArJgbIqOsoZ/OglN1bpWOCZzD29H5FuWu2wMYOX8SLDBUzq
         0xAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qSj146B+;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=adklGltB;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=adklGltB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f66si6018414qkd.71.2018.11.06.03.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:06:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qSj146B+;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=adklGltB;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=adklGltB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzBp-0006Jr-4E
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:06:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006Ep-EG
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBU-0000on-4i
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBT-0000nO-HR; Tue, 06 Nov 2018 06:06:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9951E5C026C;
	Tue,  6 Nov 2018 12:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502366;
	bh=r3G67lVVAUL9k1D9HU6njTCRV6L0gyLUDtK2xzj7t6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qSj146B+P44Yd5S3TuRPE/fgOUmUs/q4rjE3yBWlYVf1NHdFS0D1zEfjnmTZfu6cx
	DboWyHB1vwhlQ6Vg+4WuJzBUckOH2ZdErzmu8hjmHGZarawfeM9HGxmGZj0D/UOG1c
	e0rrCEoqHWo9P1dGO3DT81iaiHJr2ChMcNnrP2dI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=adklGltB;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=adklGltB
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKDzH7RUsh-k; Tue,  6 Nov 2018 12:06:05 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 732A65C024F; Tue,  6 Nov 2018 12:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502365;
	bh=r3G67lVVAUL9k1D9HU6njTCRV6L0gyLUDtK2xzj7t6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=adklGltBUSKkjLalOKKqHyaeAhRLFAGKJu7wLWfjRpobaTS2OKyIkvI600f7DrjHu
	oNPVS28mQXbxlHYqwXfCOghR5i57xnHs0Sc2OYH64L13SW1eVnztrOYFnstMSDF1zU
	Ur3hsiNJSN3nHq4wVnMau9C0LnX35TAoKhSLcMF8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 114B64F7670;
	Tue,  6 Nov 2018 12:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502365;
	bh=r3G67lVVAUL9k1D9HU6njTCRV6L0gyLUDtK2xzj7t6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=adklGltBUSKkjLalOKKqHyaeAhRLFAGKJu7wLWfjRpobaTS2OKyIkvI600f7DrjHu
	oNPVS28mQXbxlHYqwXfCOghR5i57xnHs0Sc2OYH64L13SW1eVnztrOYFnstMSDF1zU
	Ur3hsiNJSN3nHq4wVnMau9C0LnX35TAoKhSLcMF8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:34 +0100
Message-Id: <20181106110548.4209-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 02/16] gdbstub: introduce GDB processes
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
X-TUID: gISUt7jv7tW5

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
---
 gdbstub.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c4e4f9f082..0d70b89598 100644
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
@@ -2002,10 +2026,58 @@ static const TypeInfo char_gdb_type_info =3D {
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
@@ -2058,15 +2130,19 @@ int gdbserver_start(const char *device)
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

