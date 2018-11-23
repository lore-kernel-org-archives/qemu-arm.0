Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749088wrt;
        Fri, 23 Nov 2018 01:18:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WjT2PsCjU7V2UbcWx9C9NG9vrCbnFAsbBJKe5sz/nhSKZbTjnZ7gBklm4/jkd/Gamcl0wE
X-Received: by 2002:a81:2548:: with SMTP id l69mr1021988ywl.397.1542964701095;
        Fri, 23 Nov 2018 01:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964701; cv=none;
        d=google.com; s=arc-20160816;
        b=hXwXUMVHAlgEzLkk1GzViv6S6+9SYg7qF63sQ+S3FUSHymX94tx3/ZqvYG5b8+pun1
         RWu4rn9QrXTy+banqGx44cOiQy9ULdYFTPPPGOIfWWqOG3YO0ler6yKHX7lpHMzP8V57
         NzAozWEzElXOS7rdEJVBS8iMn9NdwpHOnG+tIAFp61yGLQMqG5fffDdpHVoVD9Br3V42
         CGxdlW3fAcP5NxMQyKLlpu413+1kinyV73rvZcBFWKy/ZiMp2vVSwIg/L2+wfC/3UeTx
         3Amm8ORA7Q4CVmOwaqESRID0fNHRLUERHYCE2FU5DhPIBP0covUTnGDTRyXWKKRXV5Q1
         oLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Cy0JOaSn2Ig8E8PiIMri/tdTfdwrvlmDnDB2hxsaZu4=;
        b=Nqw6t3QIBJP2v1PeEGqyQHjbptgDDU3mFf0jQlF5ILcm/ONlaMVvApRYywKg3DrdTI
         7qnNPh5aCMSl/AWKt25jtEGtNOWGDI+J+7P5/Dtq+gRvWu3E02CXFY20/SFh0LHEp38u
         /dOERzEmMUTG/mgI3fLKm8sYZ6wnmTHZSJxJjsJcMPBrWcp8jm8zMoTFh2mKMGZ1L9yo
         1wF5rTMkC4p0FN6NIhksJffahf3rzi4OJWGBaydwpD5oyI3AZId5LtdV8H5wXSVjh8ff
         /9RmT5WC3d+3nuoh65cQUTv74Eee6PwCnG5YEgyfoR4y6SJ7OvhnjZpHSmdg9xG4BXhY
         tC3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3JdHeqUy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Hdx5UaMP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OWWHhx9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f129-v6si17421282ybb.213.2018.11.23.01.18.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3JdHeqUy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Hdx5UaMP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OWWHhx9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bQ-0007wx-Dv
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oi-N5
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7at-0000X9-IS
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7ar-0000Lj-2e; Fri, 23 Nov 2018 04:17:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 61A055C025C;
	Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964654;
	bh=KrQImGji4CDiFKtwmdt0cnVuILaxfZ+qg7f4LV2oAA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3JdHeqUybAsL0UWJ6XA/3g1BzzIym7R2cVbDABXh3ccIB2wPDRzd6flSr0FXsSrj9
	YETIDAdZghEG3A1CJzd2CfcrDTMcluYz7U4p8u4ibq/OMXQRvHComOiCjMg/usOPYm
	O7egYQPO+f9tOfEkYZjVRI7rHtULI5BBIcrOdSOc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Hdx5UaMP;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OWWHhx9U
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDMe3M1pUPpD; Fri, 23 Nov 2018 10:17:33 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 0B13E5BD1A0; Fri, 23 Nov 2018 10:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964653;
	bh=KrQImGji4CDiFKtwmdt0cnVuILaxfZ+qg7f4LV2oAA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hdx5UaMPBtPYC342v2voJNW82zeU5xEakY63fT7+eX1AYX4K3G0254MCDZKi7AFTk
	KW0E1uaLSpdqGEC8kMKJvCKUCSB2CDGRSvfx74eD3G8djfovodUor6OLckU2ft/oD+
	22VJRvEy6qA6YIVpfcuIxJvjNUs26m64lOTjO+zY=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 8E8105C0259;
	Fri, 23 Nov 2018 10:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964652;
	bh=KrQImGji4CDiFKtwmdt0cnVuILaxfZ+qg7f4LV2oAA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OWWHhx9URe7We9BVC5xSR8gIKxWdWqKymgQ7zlz16HVNfedJOaSuR2YIA7TU4t7b0
	6X/L3AoNc51SFRcHao5eX8oLG0L9gVejoDvLyufV8xAb3s1LIGmi9cvrVncUJEF9Yo
	XUo07hTLNmIMBp+Ltjgk1qTECWDPBx5jdt2D9GC0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:16 +0100
Message-Id: <20181123091729.29921-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 03/16] gdbstub: add multiprocess support to
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
X-TUID: tHS/b87rQdy8

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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 26f5a7449a..4fbc05dfe3 100644
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

