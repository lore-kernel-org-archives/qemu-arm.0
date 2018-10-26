Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp452249wro;
        Fri, 26 Oct 2018 01:44:14 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d11W6e7+Pi4Gk4hmgDdrM6Cy/iAp/trnf3oJ7//a+mupmh4Xk6AClWkDZKh5JMqluylgTw
X-Received: by 2002:a37:4ece:: with SMTP id c197-v6mr2195418qkb.320.1540543454838;
        Fri, 26 Oct 2018 01:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543454; cv=none;
        d=google.com; s=arc-20160816;
        b=YJz0UD6cFUBCbHQzfj2Swnf9W393PlCzsFDpxiB6eK1QfhBvV5LpkOZWGl6Vm3CwS6
         oaLYAA6bB5oXMF0Olw3NZ1PT3jbLRe1g1Rw3IQLo8GxWHfTDIn6uHlBKIRz36w70lUZO
         7jtUKECRp3/KxKqBIFRPj2x8uQOdNsvPuJxmS6HtmyBaSX0jmJ13Sl6pCOuHiPQcE+mq
         ZxSaplpqzBAe0ekQKWnr+cyXQXbWLU+jT9yZCrbhAwXxR9ASrwrn05YtmsoXwHlKImGi
         8iwFEvVhAcmvsSyuqqyPYQnM3tz00dzSVE4c66MNZUKxq/qiDgU6AXPOMtC+leJSb7zG
         rsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=sN9J3JGas7pAJkwFFBSEyhV1PX1FzGgxej1UntaA8xM=;
        b=fakkTCrpr1g56bIQWO0NwSUjqhU0GyG3NFmgn42u/mKSzdSc9UpRzza46AZyC4P1at
         uzZXVz1fwPqlrv9WOgCyOjWsHpAkdO5PXscpq7am8GJmPj1RrPUyZwh2tu2kzTtJ2Ypg
         isLdLGPU1zcTMVVVX1e3oq4WxKhKs2nM5PMSRfMWmo71aQDV0dD+wtq2cghueU+Aze4T
         hNCDBXafZPEofToww088FLuAy8xDfS0hqLgh3TnCwLa7w4rOZkOtptD3y/W32JFPlzAA
         BftFtZHS4IFEDW9vc4cBla62ggdFm36cFOEnWPIy6olRjEyt27mtJuR+OUf8Wicdv8eD
         9j7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=KVFunOic;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RtSEkmRT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=auAzIix1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1-v6si1985109qkf.80.2018.10.26.01.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=KVFunOic;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RtSEkmRT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=auAzIix1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxj4-0001J8-7g
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:44:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUO-0000LS-7E
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJ8-0004kv-IK
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:17:30 -0400
Received: from greensocs.com ([193.104.36.180]:45299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ7-0004hd-Uq; Fri, 26 Oct 2018 04:17:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3F8D7441B4A;
	Fri, 26 Oct 2018 10:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541834;
	bh=H9ZOA3Y55LXnxzE0O/GI2JMr62WKwOXtlHrOSEZjWQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KVFunOicAaKMYU9DbNcu9IAVp7AKBXbOMVfNTKYVuyUDh4/4QUKv5mhUQ+G7395gu
	p4rr0R+ypA216I7iRtQoUt570VRPxYV3l6p7HyUuek1qTjV9XbxouF98SqmMLRPOYb
	4HgWGEE5w4DEu6g0v/XLYWf4WqivF3vdpHW9pSEI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RtSEkmRT;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=auAzIix1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gIv1EPlpdYl; Fri, 26 Oct 2018 10:17:13 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 033B4441B48; Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541833;
	bh=H9ZOA3Y55LXnxzE0O/GI2JMr62WKwOXtlHrOSEZjWQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RtSEkmRTZ4WcNt63lPjd6ESn8/Sat38vk37emxW7z2sQVxAB/zgw3U9PSHJcBOmWN
	lIvp2WNJSSEfivY0dm/HBChQkHx2HD10n/5mQlcE7XlLFos7QJaKSZNbIAl+h6Iw4q
	54xTyAtg33dFKrq3MxfogDcUkRDblyTA9WmLXKQA=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 75997441B41;
	Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541832;
	bh=H9ZOA3Y55LXnxzE0O/GI2JMr62WKwOXtlHrOSEZjWQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=auAzIix1+YJfQzGW45WHy+eptMQVI5QIcnOf0jJrOtumhjP0Hmvwjx3EOsGkWtt44
	NgpRJHWLrS634Hiof7ngx00uKz765SioMD/ndGTQlTfVf7ifpQ209tJstoZHQWlfom
	SqucS2QWb+Yj4ZtBR3WyxOoiGMOMcIqwt9mkiaQY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:40 +0200
Message-Id: <20181026081653.24602-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 03/16] gdbstub: add multiprocess support to
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
X-TUID: b0eh8xLUQm8P

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
---
 gdbstub.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 096ac8e99c..9ca743a4c6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -638,10 +638,49 @@ static int memtox(char *buf, const char *mem, int l=
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
@@ -907,10 +946,23 @@ static CPUState *find_cpu(uint32_t thread_id)
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
@@ -1018,22 +1070,23 @@ static int gdb_handle_packet(GDBState *s, const c=
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

