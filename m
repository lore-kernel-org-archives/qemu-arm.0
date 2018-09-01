Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp539349wrd;
        Sat, 1 Sep 2018 05:48:31 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdalIm/PkgnvnIOoJ+wshUxBNT3ZI7ciQREPPwHDKoMgO/b6qkNBnfvd2lR+VF3V6UCVB/35
X-Received: by 2002:a37:2705:: with SMTP id n5-v6mr5943110qkn.141.1535806110997;
        Sat, 01 Sep 2018 05:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806110; cv=none;
        d=google.com; s=arc-20160816;
        b=uALEw7xBx3UPKQlxVn4t6dtlGGeKpXSkxIOA30eZXc0t2c0RDdSzb8JeYldwlOHaiV
         uLyHO5zDQZOZDAeumXUmPBPJdmEu0fMgPfRmzoC/KsNwRxurUl8F6keKojamWBbB9PKD
         b71PXzUS/L115IT3BMpJY/jp9XcvVrreXdFUVyP3ZASPPSsdzvMS742BDSCcwFGoMDZ1
         NnrOjW8/Scn7C2OAoS3QfjNeYuhJzTGTcSnFaz1XQTLj2K0enliRCVSDKmLGK2aXs9Dj
         TllBs8yXlqyWsL7KoIqIUwaAUBtieX+osup+15iAkc2eGxn3YbVfOnItG+uKEnPAvC55
         f4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=ALXb4efyABfkPOh+TyazR9XvxpTXdmWQAPUe+cYOfWo=;
        b=iisjdOrflJhRBfdiqePnuNlvWUVaTUxRBa1O0gjz9CjhEiAKshNxgjMmimrR6B7yYq
         1HGMaG/yMKOZD2r1f70YNVFmJhdnD77xmB/acOhTMqvJNBb5h3ac/eZBsE/v8fP1itGH
         /D4GvW0NJyX/zB9tvkPPplINlTr/HkYNsM0OpUiflxY/7rnMqwZ2+4UUiACyHYozWb2r
         J+gwzj7WxZ82yVS1tMGjC9W8wQjWwtGVHRZ3NDcT2VbWtOsaBTgJWlWpRzL+CdMcaEBE
         4Z/Xy9cg8BRb3khUgBpU1apVabOzYAj8NnI8sPssuZusKuT+/sm8l5QcXjyIjZI0/t5S
         XFvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ukfkQy+3;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=soEe7dTI;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=soEe7dTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si656511qtb.260.2018.09.01.05.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ukfkQy+3;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=soEe7dTI;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=soEe7dTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5KI-0006qa-F1
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004g5-Er
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J6-0007jx-60
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J5-0007hT-Lt; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6B322521AB2;
	Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806025;
	bh=S3RvbnEJeKZevYe1NCxR6EjkHmlP1FmDR8Tccz1ttr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ukfkQy+3OY9W+98/J3MDhWIbrGD0AvUyjQuFRsX9pqNsjfnv07MKckSpU5RVyTJMp
	+p3hWOZR3FFC4+BVyRCh5Tw3r2cmiUsq8qC8Qy38TOP/LLgZ19YtS7qrjTG5/PG1u/
	yMQ9VtFxnvcQNlvn61of3iyke2ePns252i3x3USs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=soEe7dTI;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=soEe7dTI
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRceOI6kuAXx; Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 93C21521A9F; Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806024;
	bh=S3RvbnEJeKZevYe1NCxR6EjkHmlP1FmDR8Tccz1ttr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=soEe7dTIRuJcyVxDujFEPjZrnGxPM9LXGherWa0qrUHd2+k3fz7UAzL4UsS6betCc
	VZTa4kJUnapclrffWIAQ3hvXl9mrwB/MxR05V5cG4hwCrf9yWiNxfRidADUvHCsXJK
	uCbKPiboVsfSAAuxdBx4u+VIVk3mZOjWE2VqA4/k=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 424AF521AAA;
	Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806024;
	bh=S3RvbnEJeKZevYe1NCxR6EjkHmlP1FmDR8Tccz1ttr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=soEe7dTIRuJcyVxDujFEPjZrnGxPM9LXGherWa0qrUHd2+k3fz7UAzL4UsS6betCc
	VZTa4kJUnapclrffWIAQ3hvXl9mrwB/MxR05V5cG4hwCrf9yWiNxfRidADUvHCsXJK
	uCbKPiboVsfSAAuxdBx4u+VIVk3mZOjWE2VqA4/k=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:25 +0200
Message-Id: <20180901124639.19735-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 01/15] gdbstub: introduce GDB processes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4TajwC/l7Iw

Add a structure GDBProcess that represent processes from the GDB
semantic point of view.

CPUs can be split into different processes, by grouping them under a QOM
container named after the GDB_CPU_GROUP_NAME macro (`gdb-group[*]').
Each occurrence of such a container implies the existence of the
corresponding process in the GDB stub. The gdb_cpu_group_container_get()
function can be used to create a new container.

When no such container are found, all the CPUs are put in a unique GDB
process (create_unique_process()). This is also the case when compiled
in user mode, where multi-processes do not make much sense for now.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 include/exec/gdbstub.h |  8 +++++
 gdbstub.c              | 67 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 08363969c1..a3e4159bf4 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -1,8 +1,10 @@
 #ifndef GDBSTUB_H
 #define GDBSTUB_H
 
+#include "qom/object.h"
+
 #define DEFAULT_GDBSTUB_PORT "1234"
 
 /* GDB breakpoint/watchpoint types */
 #define GDB_BREAKPOINT_SW        0
 #define GDB_BREAKPOINT_HW        1
@@ -129,6 +131,12 @@ void gdbserver_cleanup(void);
 extern bool gdb_has_xml;
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
 extern const char *const xml_builtin[][2];
 
+#define GDB_CPU_GROUP_NAME  "gdb-group"
+
+static inline Object *gdb_cpu_group_container_get(Object *parent)
+{
+    return container_get(parent, "/" GDB_CPU_GROUP_NAME "[*]");
+}
 #endif
diff --git a/gdbstub.c b/gdbstub.c
index d6ab95006c..5c86218f49 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -295,10 +295,17 @@ typedef struct GDBRegisterState {
     gdb_reg_cb set_reg;
     const char *xml;
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
+typedef struct GDBProcess {
+    uint32_t pid;
+    bool attached;
+
+    char target_xml[1024];
+} GDBProcess;
+
 enum RSState {
     RS_INACTIVE,
     RS_IDLE,
     RS_GETLINE,
     RS_GETLINE_ESC,
@@ -323,10 +330,13 @@ typedef struct GDBState {
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
 
 /* By default use no IRQs and no timers while single stepping so as to
@@ -1750,10 +1760,24 @@ void gdb_exit(CPUArchState *env, int code)
 #ifndef CONFIG_USER_ONLY
   qemu_chr_fe_deinit(&s->chr, true);
 #endif
 }
 
+/*
+ * Create a unique process containing all the CPUs.
+ */
+static void create_unique_process(GDBState *s)
+{
+    GDBProcess *process;
+
+    s->processes = g_malloc0(sizeof(GDBProcess));
+    s->process_num = 1;
+    process = &s->processes[0];
+
+    process->pid = 1;
+}
+
 #ifdef CONFIG_USER_ONLY
 int
 gdb_handlesig(CPUState *cpu, int sig)
 {
     GDBState *s;
@@ -1847,10 +1871,11 @@ static bool gdb_accept(void)
     }
 
     s = g_malloc0(sizeof(GDBState));
     s->c_cpu = first_cpu;
     s->g_cpu = first_cpu;
+    create_unique_process(s);
     s->fd = fd;
     gdb_has_xml = false;
 
     gdbserver_state = s;
     return true;
@@ -2003,10 +2028,48 @@ static const TypeInfo char_gdb_type_info = {
     .name = TYPE_CHARDEV_GDB,
     .parent = TYPE_CHARDEV,
     .class_init = char_gdb_class_init,
 };
 
+static void create_processes(GDBState *s)
+{
+    Object *container;
+    int i = 0;
+    char process_str[16];
+
+    container = object_resolve_path(GDB_CPU_GROUP_NAME "[0]", NULL);
+
+    while (container) {
+        s->processes = g_renew(GDBProcess, s->processes, i + 1);
+
+        GDBProcess *process = &s->processes[i];
+
+        /* GDB process IDs -1 and 0 are reserved */
+        process->pid = i + 1;
+        process->attached = false;
+        process->target_xml[0] = '\0';
+
+        i++;
+        snprintf(process_str, sizeof(process_str), GDB_CPU_GROUP_NAME "[%d]", i);
+        container = object_resolve_path(process_str, NULL);
+    }
+
+    if (!s->processes) {
+        /* No CPU group specified by the machine */
+        create_unique_process(s);
+    } else {
+        s->process_num = i;
+    }
+}
+
+static void cleanup_processes(GDBState *s)
+{
+    g_free(s->processes);
+    s->process_num = 0;
+    s->processes = NULL;
+}
+
 int gdbserver_start(const char *device)
 {
     trace_gdbstub_op_start(device);
 
     GDBState *s;
@@ -2055,15 +2118,19 @@ int gdbserver_start(const char *device)
                                    NULL, &error_abort);
         monitor_init(mon_chr, 0);
     } else {
         qemu_chr_fe_deinit(&s->chr, true);
         mon_chr = s->mon_chr;
+        cleanup_processes(s);
         memset(s, 0, sizeof(GDBState));
         s->mon_chr = mon_chr;
     }
     s->c_cpu = first_cpu;
     s->g_cpu = first_cpu;
+
+    create_processes(s);
+
     if (chr) {
         qemu_chr_fe_init(&s->chr, chr, &error_abort);
         qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
                                  gdb_chr_event, NULL, NULL, NULL, true);
     }
-- 
2.18.0

