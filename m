Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6797798wrw;
        Thu, 15 Nov 2018 01:42:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5f1/9Hd0oeVJGzuoDMl9bXa3XXtXw2JTBfPlbgetmO4TUioKB9VWVcLAH2LDCswLUlbi/Ts
X-Received: by 2002:ac8:3d8a:: with SMTP id v10mr5230908qtf.74.1542274977711;
        Thu, 15 Nov 2018 01:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542274977; cv=none;
        d=google.com; s=arc-20160816;
        b=kk3sfcJvRbaEPmSiEfcATjstRlvNFPLOeBfEUiO5AxUUzBvzanwtx0pcZPPeKfX1US
         0D4ibdCEe5g3dCFK3S0Hf9EvlC6YZBMsXfy9aAjdqTWw4dK7Mvd0eNGLr5PZpGDCTCyB
         MXIUq1n3bD6pu4pi/5kYLJ5E+j+0f9ps1cp4F5F7PtNQW/JpZfVMjfm6fT+zWxFotI2F
         fKFKoBI45hjV7+aGi7uLxL9HcNEQNTIraZeXdU+t3L6CouOLOFBn0Y+EKWvO4jdKaDr0
         2H5QGNbVl7YqfT4BkcahgnNxI/6t8WCcRHB8c8gMPKfHg9ClR8St02dpiy1SJJtGxTF7
         ylBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Cy0JOaSn2Ig8E8PiIMri/tdTfdwrvlmDnDB2hxsaZu4=;
        b=mw27rn/od8g/e5pM5S5N6IGmqy3bzgBpzpGVKnDof4Z2z9DsRJnRL/UZ4oW3iu9wm3
         scLYEdGqG2NncP5xIs+upmuMRtkFGe9hs2L8p0Fa7sm7GhM+KiE97aeOWPQADsvBIwQQ
         EPavhjeX2sekx0DOpTaOHJJx++Loz5blCTMTUiW0g1k9PJ6hZO8Rwn7wYx+/vmiGo5+q
         +HPmFlh+aZiqK/QzIIp2STix16sVLikpDYcnml5tjNartzTS6frM4LfjTydxBm6T36Mp
         RT7DLjUYWs/TLtSkToP8WEw2Nu+7l4d17datkrLxx+8ewn02giiFMkdp1u1Pgdk98eBZ
         QOvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tp5ya3EF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=voys2wYt;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=voys2wYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n48si843304qvn.14.2018.11.15.01.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:42:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tp5ya3EF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=voys2wYt;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=voys2wYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEAq-00073s-St
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:42:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAU-0006mv-Q7
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAH-0004N9-PK
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:28 -0500
Received: from greensocs.com ([193.104.36.180]:41854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAH-0004Lk-4S; Thu, 15 Nov 2018 04:42:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E81BB5BD180;
	Thu, 15 Nov 2018 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274934;
	bh=KrQImGji4CDiFKtwmdt0cnVuILaxfZ+qg7f4LV2oAA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tp5ya3EFc5nH6hNLGpTjbDW5ruKZOffFulDbBj+aFB3cuGavercUwZQ6tn+0ot9ET
	DZDxy8Amm+mVKWOAz3kRVcYP0TSfgv5lH2FmEOjkpCUfhDPqLd9oUjZGKRmldhhNut
	r2XDG0kYoe6yZ7C0CF2jfYCfMjTP8nBpEHrjtHFc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=voys2wYt;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=voys2wYt
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPtZvQ1ChHQb; Thu, 15 Nov 2018 10:42:14 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 9E0376FD8A; Thu, 15 Nov 2018 10:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274933;
	bh=KrQImGji4CDiFKtwmdt0cnVuILaxfZ+qg7f4LV2oAA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=voys2wYtw4qMjMoFP/9xknylAHdcPhTu/VmygEh+tmdpQOGPtXw8Mn84mcU1eB3Az
	+vzv5J2bGHQQSjyDw+PBEodWOSf96GGJbTwLuab+uuOI7OlxDjWW72xR2iKXihdAxv
	jyRPfYBvPopP9cRZpU5Q0FaSRvzQYmfbYhF6SonU=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 084CB5BD1AF;
	Thu, 15 Nov 2018 10:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274933;
	bh=KrQImGji4CDiFKtwmdt0cnVuILaxfZ+qg7f4LV2oAA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=voys2wYtw4qMjMoFP/9xknylAHdcPhTu/VmygEh+tmdpQOGPtXw8Mn84mcU1eB3Az
	+vzv5J2bGHQQSjyDw+PBEodWOSf96GGJbTwLuab+uuOI7OlxDjWW72xR2iKXihdAxv
	jyRPfYBvPopP9cRZpU5Q0FaSRvzQYmfbYhF6SonU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:54 +0100
Message-Id: <20181115094207.22846-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 03/16] gdbstub: add multiprocess support to
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
X-TUID: DJMFxXhOgYxL

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

