Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp807894wrw;
        Sat, 10 Nov 2018 00:14:04 -0800 (PST)
X-Google-Smtp-Source: AJdET5eyEqdI2tvJVD6OwUbzJeR1yc1sLQMvjz5C2rs1XMYBegrRDPuIBiHd8sV8pWPcBjsgNsw2
X-Received: by 2002:a37:7fc6:: with SMTP id a189mr11284405qkd.12.1541837644588;
        Sat, 10 Nov 2018 00:14:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837644; cv=none;
        d=google.com; s=arc-20160816;
        b=jpy7ZDuo1QRetTAJj3oEvc/QXc6MUZKlV+YgXu5i94A+0NuRMYZYtdHdQiP2ByYBgN
         DjdmmNdRtgm8BQXErhuGyqriEzRXp1t/cWo7YgaNIeTrS7hB4oIJSDp7xOh/vwaLSc7z
         Qy4hVAuUDlsJvQQ5PkPLBjgJq4BAM/bnWd83YPgtSGul0Uuo8TQYCD8js/lDvKCbxqOs
         9XJ6NhzdPsS+mCOGqBvgLIi096siortqfRsPtAQIEHnF7p82zM7bjWXizStbr2ftV0qh
         PQKrPYZTJvIuMFenXSiqHAArfcj58y5+FD4xColZV8fSg25AxhVf+NOY4y1Hj2NxUPSn
         /l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=KCK+v2OmYvpDY+tLuuVSl7zdKAAf1f71la/xEqyqhCI=;
        b=GG9iJ218SkPk226Uzna4KGWsKvmWu1FJaIgZBV6B+o34pCD3DR0z5eRPGRqNWBL/SO
         fzG/9Iby8bJY1noweMvh1A3mutG8lU9RhTD++zIzuOwabmdl0yrA9YaX0pbc0B2kz4QX
         cgM55UfHQkfc831d5n8fvlOz2cPCnwhlgipSV1erf0IflyNyWYYoQWRd76ieMubrk8+w
         xTGdE/UwHIgYJvFu1Q7WPHO/oCGhPtOceN0Too17GRR6dOwPhJJWC5lWBkROZDaKAgGL
         qxmm3LomunJhRDyTlMq5goUMqFg7Z7U3mlMY3UMad0GhlhbrmZHgReJLAr1Ioi3lmEkT
         oo3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cdvsjN8z;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q+zXzKTx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q+zXzKTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127si956454qkl.122.2018.11.10.00.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cdvsjN8z;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q+zXzKTx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q+zXzKTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOP6-0003oS-14
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lI-7O
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOY-0000T0-K0
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOX-0000QE-Uz; Sat, 10 Nov 2018 03:13:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AB330443259;
	Sat, 10 Nov 2018 09:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837603;
	bh=fPhNMVOgnILrdu8vEVGAW8FkOUJiKmx8HxmopOK4UcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cdvsjN8zSxF8dRTvJMXjCDpxi9htagfrccCUzGSLDJp/84BU3Sr5Eq2zKBilrtGMC
	kD4nWGItT5rDzyidm7/LKRCopRZKDMg+Ujic1RjSEU632gQsVe8xDCAOQoh7K1HDgp
	WfkreXA/a9xu1a2hmSjGci4Eu2xFKX01Evn5Boac=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Q+zXzKTx;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Q+zXzKTx
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKOD5PWb-YKF; Sat, 10 Nov 2018 09:13:22 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 5DDAB6FD81; Sat, 10 Nov 2018 09:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837602;
	bh=fPhNMVOgnILrdu8vEVGAW8FkOUJiKmx8HxmopOK4UcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q+zXzKTxf+iXlD+RqbWG6CzpBVh2323to5MV434rD6fwXNTpi5ZxCzvGWj/jUNJcG
	T6S9LnsPKULfrqLBff5XaAUIyVgFKGOgidhxx1BABT4yfffNA20RC892Ra5DEhlUf4
	YipkrL59SJ7ERRojS+/614PIPj5WNZ1Ep/wkse+g=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id BCFB26FD86;
	Sat, 10 Nov 2018 09:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837602;
	bh=fPhNMVOgnILrdu8vEVGAW8FkOUJiKmx8HxmopOK4UcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q+zXzKTxf+iXlD+RqbWG6CzpBVh2323to5MV434rD6fwXNTpi5ZxCzvGWj/jUNJcG
	T6S9LnsPKULfrqLBff5XaAUIyVgFKGOgidhxx1BABT4yfffNA20RC892Ra5DEhlUf4
	YipkrL59SJ7ERRojS+/614PIPj5WNZ1Ep/wkse+g=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:34 +0100
Message-Id: <20181110081147.4027-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 03/16] gdbstub: add multiprocess support to
 '?' packets
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
X-TUID: sPtIXbDnCSuF

The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
checks if the CPU is a direct child of a CPU cluster. If it is, the
returned PID is the cluster ID plus one (cluster IDs start at 0, GDB
PIDs at 1). When the CPU is not a child of such a container, the PID of
the first process is returned.

The gdb_fmt_thread_id() function generates the string to be used to ident=
ify
a given thread, in a response packet for the peer. This function
supports generating thread IDs when multiprocess mode is enabled (in the
form `p<pid>.<tid>').

Use them in the reply to a '?' request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 0d70b89598..d26bad4b67 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -638,10 +638,52 @@ static int memtox(char *buf, const char *mem, int l=
en)
         }
     }
     return p - buf;
 }
=20
+static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
+{
+#ifndef CONFIG_USER_ONLY
+    gchar *path, *name;
+    Object *obj;
+    CPUClusterState *cluster;
+    uint32_t ret;
+
+    path =3D object_get_canonical_path(OBJECT(cpu));
+    name =3D object_get_canonical_path_component(OBJECT(cpu));
+
+    if (path =3D=3D NULL) {
+        ret =3D s->processes[0].pid;
+        goto out;
+    }
+
+    /*
+     * Retrieve the CPU parent path by removing the last '/' and the CPU=
 name
+     * from the CPU canonical path. */
+    path[strlen(path) - strlen(name) - 1] =3D '\0';
+
+    obj =3D object_resolve_path_type(path, TYPE_CPU_CLUSTER, NULL);
+
+    if (obj =3D=3D NULL) {
+        ret =3D s->processes[0].pid;
+        goto out;
+    }
+
+    cluster =3D CPU_CLUSTER(obj);
+    ret =3D cluster->cluster_id + 1;
+
+out:
+    g_free(name);
+    g_free(path);
+
+    return ret;
+
+#else
+    return s->processes[0].pid;
+#endif
+}
+
 static const char *get_feature_xml(const char *p, const char **newp,
                                    CPUClass *cc)
 {
     size_t len;
     int i;
@@ -907,10 +949,23 @@ static CPUState *find_cpu(uint32_t thread_id)
     }
=20
     return NULL;
 }
=20
+static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
+                           char *buf, size_t buf_size)
+{
+    if (s->multiprocess) {
+        snprintf(buf, buf_size, "p%02x.%02x",
+                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
+    } else {
+        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
+    }
+
+    return buf;
+}
+
 static int is_query_packet(const char *p, const char *query, char separa=
tor)
 {
     unsigned int query_len =3D strlen(query);
=20
     return strncmp(p, query, query_len) =3D=3D 0 &&
@@ -1018,22 +1073,23 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     const char *p;
     uint32_t thread;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
+    char thread_id[16];
     uint8_t *registers;
     target_ulong addr, len;
=20
     trace_gdbstub_io_command(line_buf);
=20
     p =3D line_buf;
     ch =3D *p++;
     switch(ch) {
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
-        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
-                 cpu_gdb_index(s->c_cpu));
+        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
+                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread=
_id)));
         put_packet(s, buf);
         /* Remove all the breakpoints when this query is issued,
          * because gdb is doing and initial connect and the state
          * should be cleaned up.
          */
--=20
2.19.1

