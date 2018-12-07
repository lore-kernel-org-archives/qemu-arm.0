Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp237212wrt;
        Fri, 7 Dec 2018 01:02:38 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UTbihYXSMKM88EmFnVZaqX+zOcspmi671Jpj9x9tBLBdm0QAMAx1cQm2Dvlrv7YOGWUozX
X-Received: by 2002:a37:c946:: with SMTP id q67mr1090975qki.145.1544173357987;
        Fri, 07 Dec 2018 01:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173357; cv=none;
        d=google.com; s=arc-20160816;
        b=tyDLEGnluZ1S+JZsQ/eZPNjN8rERQbXQ3/La8N1pGQuDYcnGgFnBL8ttMGECPV+WeZ
         tqpiuVnfIn2NWecnHoejYUJMlsYvShkhGyRHj1iLSo3UOQHdftwHAUMo95GyeAG937W8
         OthFJyLaQg7C1hmxC0ziawWg4VupWOMnXkhWD7PgQ6RTXGoEKX0uV3OoTwJl6EN0eH/E
         2JAWs0mAr6Zmw83WcM9KKQBMqXAOMcPiJSq4H9MOezGx5XY/Er9Jj5qVcTYcjbSFDPpS
         zRQ+BjOUUy1OvGV2vK346AQ0zPQQ0FIFI79WwHETKVV1o8TfmDKMPRKsaX5I+dYFG9Q2
         XdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Y0vBJ5McamQXRqMdS/R1JGzoUjfTwvxkWzowzyue8wc=;
        b=0zc8BgiHH5RP2V4G1cpntBqa9/GkmUnhhm5RRtnz4dkfCO7REPVZKwcdTDiNRw5Y3p
         kK53Oh21uZfv6hMYjFFqer7xAMfpfzDVCsp6rv6GbzYrFsSO5wSNZhjMx6xNUqUtyjea
         /E0SyQnRIJxUyCwfkk3JA9afKWul3f/fsBB4AFM9Wlub5zUNonBF68PiExzExRHsylur
         3SwX997TsoEDJSko2qB2jDyKivCdePw16Vw6pgvzmr03weOJAJu9jAYhvfBYSsVX9oTV
         KH2ruwjsXnrUfrV5TfjB7/+k2DrYaGnxtGR6OJKjITsOtTT2N3Ynoe+j7qSbJ9vZM+Ul
         lu7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZfIkn23C;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hYiWYwh8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hYiWYwh8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si1691934qvd.172.2018.12.07.01.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZfIkn23C;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hYiWYwh8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hYiWYwh8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC1t-0008DP-Dr
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:02:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1F-0007t5-H7
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1B-0005SN-O0
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:57 -0500
Received: from greensocs.com ([193.104.36.180]:52241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1B-0005Rk-86; Fri, 07 Dec 2018 04:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 99C7E48002B;
	Fri,  7 Dec 2018 10:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173308;
	bh=9VpM4fQSLmCFWhF4lXiU5yzJeMmL84qECiIHELh1Dvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZfIkn23CoITZ7z4C7ozY6oRH7agnksuA+mBdxScy76aJJV19EgKJQ2xDg9zKaIupU
	alRiqyJPr1lo2e2sex5cTcY/cp2wrpLzWzCkMtsZ7a0GfBOYkXpuQawxWpg7YpIkyX
	4p6T/YVp6+FZH4ZsUqTqrTVJT4HToo4WIyOlGWCc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hYiWYwh8;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hYiWYwh8
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJt4PgcpJFfG; Fri,  7 Dec 2018 10:01:43 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 70953480024; Fri,  7 Dec 2018 10:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173302;
	bh=9VpM4fQSLmCFWhF4lXiU5yzJeMmL84qECiIHELh1Dvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hYiWYwh8HzrjOVZjrOWBgvaezKo9jEVbGzuDz7a6iWzfSRxwQBzTvosu08Rc7vwPm
	tDWsh2Bb2JwW+zbGHwXTMUPcotiD99DIOPd8hhC7ptZDm9zfl5xILgUoSxvprzoRCI
	syu+zCBKmlz5tofO5R7GDSHs3qS9Jycm8caTtpEw=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id F312A441B53;
	Fri,  7 Dec 2018 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173302;
	bh=9VpM4fQSLmCFWhF4lXiU5yzJeMmL84qECiIHELh1Dvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hYiWYwh8HzrjOVZjrOWBgvaezKo9jEVbGzuDz7a6iWzfSRxwQBzTvosu08Rc7vwPm
	tDWsh2Bb2JwW+zbGHwXTMUPcotiD99DIOPd8hhC7ptZDm9zfl5xILgUoSxvprzoRCI
	syu+zCBKmlz5tofO5R7GDSHs3qS9Jycm8caTtpEw=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:21 +0100
Message-Id: <20181207090135.7651-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 03/16] gdbstub: add multiprocess support to
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
X-TUID: HlJSaWMbIXoq

The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
checks if the CPU is a direct child of a CPU cluster. If it is, the
returned PID is the cluster ID plus one (cluster IDs start at 0, GDB
PIDs at 1). When the CPU is not a child of such a container, the PID of
the default process is returned.

The gdb_fmt_thread_id() function generates the string to be used to ident=
ify
a given thread, in a response packet for the peer. This function
supports generating thread IDs when multiprocess mode is enabled (in the
form `p<pid>.<tid>').

Use them in the reply to a '?' request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 2a3aa0f07e..07508c2e6b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -638,10 +638,57 @@ static int memtox(char *buf, const char *mem, int l=
en)
         }
     }
     return p - buf;
 }
=20
+static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
+{
+#ifndef CONFIG_USER_ONLY
+    gchar *path, *name =3D NULL;
+    Object *obj;
+    CPUClusterState *cluster;
+    uint32_t ret;
+
+    path =3D object_get_canonical_path(OBJECT(cpu));
+
+    if (path =3D=3D NULL) {
+        /* Return the default process' PID */
+        ret =3D s->processes[s->process_num - 1].pid;
+        goto out;
+    }
+
+    name =3D object_get_canonical_path_component(OBJECT(cpu));
+    assert(name !=3D NULL);
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
+        /* Return the default process' PID */
+        ret =3D s->processes[s->process_num - 1].pid;
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
+    /* TODO: In user mode, we should use the task state PID */
+    return s->processes[s->process_num - 1].pid;
+#endif
+}
+
 static const char *get_feature_xml(const char *p, const char **newp,
                                    CPUClass *cc)
 {
     size_t len;
     int i;
@@ -907,10 +954,23 @@ static CPUState *find_cpu(uint32_t thread_id)
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
@@ -1018,22 +1078,23 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.2

