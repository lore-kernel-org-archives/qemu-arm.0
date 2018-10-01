Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730264wrt;
        Mon, 1 Oct 2018 04:58:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV616WLdBe/aWWzO2zihfwyNGV31kHWg3lJKemXs6sufsV7/0riQMFHrBy+DEvxP5duLCrZgj
X-Received: by 2002:ac8:3a64:: with SMTP id w91-v6mr8077183qte.144.1538395085358;
        Mon, 01 Oct 2018 04:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395085; cv=none;
        d=google.com; s=arc-20160816;
        b=Bj5YqSsvXppsG/RdUf4s5nTSTySqyqBg+BTMGChJXoJVoiG4NroWgFlVEshZ56Cwwq
         kEn/YIzJhE8OPW6Lh2QB255I7oM3u0DtLYyhdsr0WfSqJJ7hnT8GAYCUYBzCNPSFVqj1
         eSKDrH3yTfHjr25DdWuEJrE6qDczffg3gXjeCytMrIXgM9tq0DI8hx/uxSstn3H2+iIB
         wV4uL539fdObBMoXV4xatguB892PK7zr4FZDUNJglVT8pBv5BvyNWBpbY8BvF3HYA54J
         XbEhh57JnLTKNJOu2eeB3LHrzmNG0GDIuQJHZpnTuEoDFMWn7lqbxCjyrXcYhHVo/8Xx
         UOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=1tMqfQyyRcom9H9wqOxE5CcRRLRDdoHgI3bW9LihcsY=;
        b=Ooh/XlzLeALWs3Z6/3yrdpyUJVmbFh1JW5gZyXOXfuqwK1SH9zPNFcanxtmMhKQnA8
         jA8NE6JsHf6VY5KYY+cSKoP00PXnmzjyUeOumeqDUWbWecfGTmS2Cooav1Az/JdDUVgR
         atqS081ssZ54ZtRmFATif+Rh5rBOmkmLaj64psW8z/DrjVlVPJ5hYXETX/VnC7hxAEQf
         riKqr6CV8Vuasb5E4GEdLiQBSTct717Uavx0fh7Z6VfsGSH2//pticuDhQGzZraxDQa8
         yLIwOtBHYpmLcfy9/2Z3ZwaS33bbyYEKP2FGxeaiWvnWT6AjPdcbu8FknQxFSY25k0ug
         +WDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HFtilpIg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=msNoUMsc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=msNoUMsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26-v6si3929771qtl.339.2018.10.01.04.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HFtilpIg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=msNoUMsc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=msNoUMsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wpw-0002gW-R1
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002Na-Sy
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpN-0005k3-94
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005gV-PN; Mon, 01 Oct 2018 07:57:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2BBF2511C7A;
	Mon,  1 Oct 2018 13:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395032;
	bh=hzryMaDN826qZv17hcBHWGh1oUXnmV+3gYFiqx3y/A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HFtilpIgZ34nUP+6TxGNLA1gKT0iR2/LY8PFx1M3uMAVLJx0YN6VQRKyPhRp9npYE
	1gf6tDM3sZlToEL9B3eDcdfx1SmLlBbYa5vPofgWotLINauukBfMQfBLHX4Ki4Y5IA
	ISqO3sa+yl+6MMnUzmL4iqSs/8xGkp+6K3MXCV80=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=msNoUMsc;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=msNoUMsc
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAD6mHau484w; Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 807EC511C51; Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395026;
	bh=hzryMaDN826qZv17hcBHWGh1oUXnmV+3gYFiqx3y/A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=msNoUMscEPj/dVyefRvWE89dCVIfYRDDOiivPs1M0z3fnwbo3i5fjSkuJ3BVy92lp
	gRi1ETQQ2aFQlbQAJgRL2eexaxqYIGZhQr1uezlwUwRnKLsIhuRU+/IYGGHQi9NmxH
	ncTX5VUNQ6Pozhto0s3x9NGFc7DPIPiwhHCtbHhA=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1FA14511C65;
	Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395026;
	bh=hzryMaDN826qZv17hcBHWGh1oUXnmV+3gYFiqx3y/A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=msNoUMscEPj/dVyefRvWE89dCVIfYRDDOiivPs1M0z3fnwbo3i5fjSkuJ3BVy92lp
	gRi1ETQQ2aFQlbQAJgRL2eexaxqYIGZhQr1uezlwUwRnKLsIhuRU+/IYGGHQi9NmxH
	ncTX5VUNQ6Pozhto0s3x9NGFc7DPIPiwhHCtbHhA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:50 +0200
Message-Id: <20181001115704.701-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 01/15] gdbstub: introduce GDB processes
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
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sRKRLbYAAnef

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
=20
+#include "qom/object.h"
+
 #define DEFAULT_GDBSTUB_PORT "1234"
=20
 /* GDB breakpoint/watchpoint types */
 #define GDB_BREAKPOINT_SW        0
 #define GDB_BREAKPOINT_HW        1
@@ -129,6 +131,12 @@ void gdbserver_cleanup(void);
 extern bool gdb_has_xml;
=20
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
 extern const char *const xml_builtin[][2];
=20
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
=20
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
=20
 /* By default use no IRQs and no timers while single stepping so as to
@@ -1750,10 +1760,24 @@ void gdb_exit(CPUArchState *env, int code)
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
@@ -1847,10 +1871,11 @@ static bool gdb_accept(void)
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
@@ -2003,10 +2028,48 @@ static const TypeInfo char_gdb_type_info =3D {
     .name =3D TYPE_CHARDEV_GDB,
     .parent =3D TYPE_CHARDEV,
     .class_init =3D char_gdb_class_init,
 };
=20
+static void create_processes(GDBState *s)
+{
+    Object *container;
+    int i =3D 0;
+    char process_str[16];
+
+    container =3D object_resolve_path(GDB_CPU_GROUP_NAME "[0]", NULL);
+
+    while (container) {
+        s->processes =3D g_renew(GDBProcess, s->processes, i + 1);
+
+        GDBProcess *process =3D &s->processes[i];
+
+        /* GDB process IDs -1 and 0 are reserved */
+        process->pid =3D i + 1;
+        process->attached =3D false;
+        process->target_xml[0] =3D '\0';
+
+        i++;
+        snprintf(process_str, sizeof(process_str), GDB_CPU_GROUP_NAME "[=
%d]", i);
+        container =3D object_resolve_path(process_str, NULL);
+    }
+
+    if (!s->processes) {
+        /* No CPU group specified by the machine */
+        create_unique_process(s);
+    } else {
+        s->process_num =3D i;
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
@@ -2055,15 +2118,19 @@ int gdbserver_start(const char *device)
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
2.19.0

