Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp447900wro;
        Fri, 26 Oct 2018 01:39:04 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dr9uzgRFyBP2iSvYIjRF4sScXSpUF7f9LxS0glfv6m46V/X8KUTYvSvGKJTXaLN4JBD1FI
X-Received: by 2002:a0c:87b7:: with SMTP id 52mr2368082qvj.8.1540543144573;
        Fri, 26 Oct 2018 01:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543144; cv=none;
        d=google.com; s=arc-20160816;
        b=IQ4VZ9kfIPKdWcxGcOtQU9kM4xy2pXJutmSYvyOTGFQSgOGQj6S4gNPwDMeNdDBJvF
         Re9ZDcT9noMcusZOGKlmhzsQjtAZgBc5i7GJjxqrmiVACVtgi6LPN7pQs4DbGtkj3y5E
         8lbH4WStevhwpExLpVhoxEd4x9iuLuUZP5Vzd819eYOgJu7eLYL7lKGSCVqxJ+v/T5cP
         5VTzzARilZmcZhVDdBgSkV74C/lQnUFFuxFEBLSFIm4cMuGhyebTk5iHv/Mhnc+vKUeW
         V6QUJH43WOHbH8ofkOc0EQCXiiyKYuyldxtbQw33ycoQvT9CNhFM65ovU43R3AN8MmyG
         JXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=MZII0jmmwTcXKVrBrMe5wuHFucmflB8JnnBX3HebgGA=;
        b=EoXUxYoBYkV50Xu5NYVE+rn9FsJHO9SOjqSTiSQsMxbPWY9dUWhZAtJFDkY0KzyWRq
         ISkE16HDG/795WhaVV4MXZQaVSfRhbe1eiAot58CDUGPiQz+2Qtv5TP3bd8Xi74JQPUu
         DqbLNz9rNcRb9KttSR9PtTrtJT/x6HeeLWsM3n9/crDqDyvBTxHq5NB+i+Hug8badYJE
         FZGYAhRrWdX+hX7MBHCVo6DdyRTE6Er4T837lmgENh7QOZIFAhKChtysj9TXso3g6E6e
         VSJ4lcu4QZnHP5HXOqUNw4YPg80+Feq6oovgiU1W9fR9PjK05IltB6d5MGryfbOxankS
         tJ7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="BG2/C5D0";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GC9sXizl;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GC9sXizl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m66-v6si8062647qkf.16.2018.10.26.01.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="BG2/C5D0";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GC9sXizl;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GC9sXizl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxe3-0003oE-QF
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:39:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUG-0000LS-2D
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJE-0004pl-Je
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:34 -0400
Received: from greensocs.com ([193.104.36.180]:45401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ9-0004lX-JY; Fri, 26 Oct 2018 04:17:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F17EF441B44;
	Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=LSwJYhzSHocGetfdRoWRaX8Ih1Bj93XsS34Ng7gxibw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BG2/C5D0Jtzwckl1pnX4q6GrMi6Vmxv3B9HEKLRpRw/POdE1njFUAqeFCH/PLMHcl
	+ElkIOm33UPb/P77gjp3h65WQWKgPrA5qgzwawL7NDW6cSQd9yzKhG5WxWkujz6uHp
	vfgSPiGYLB9gov8RGuZgm5AJbEc/SfJ0oyO0YA+Q=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GC9sXizl;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GC9sXizl
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uU7JU91vO0BO; Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A6E80441B42; Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541835;
	bh=LSwJYhzSHocGetfdRoWRaX8Ih1Bj93XsS34Ng7gxibw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GC9sXizlsbWTDLX0hQez2W9IUcSdj7W8tLsbq5yYLGXu/Dhw2StOLKh5mDu8cGjdV
	y5zQG6bIWuZbrjeHQSKlPCv2JtkwsllSm8z7w3xJVYxmLCFcSjlhekfa5mJUYB/3zB
	MVo0dtgR37KUQga9ntskuHN1PdCfq1eBlvbWKeGM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 451F3441B48;
	Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541835;
	bh=LSwJYhzSHocGetfdRoWRaX8Ih1Bj93XsS34Ng7gxibw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GC9sXizlsbWTDLX0hQez2W9IUcSdj7W8tLsbq5yYLGXu/Dhw2StOLKh5mDu8cGjdV
	y5zQG6bIWuZbrjeHQSKlPCv2JtkwsllSm8z7w3xJVYxmLCFcSjlhekfa5mJUYB/3zB
	MVo0dtgR37KUQga9ntskuHN1PdCfq1eBlvbWKeGM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:45 +0200
Message-Id: <20181026081653.24602-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 08/16] gdbstub: add multiprocess support to
 Xfer:features:read:
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: omTDgVz9i9uS

Change the Xfer:features:read: packet handling to support the
multiprocess extension. This packet is used to request the XML
description of the CPU. In multiprocess mode, different descriptions can
be sent for different processes.

This function now takes the process to send the description for as a
parameter, and use a buffer in the process structure to store the
generated description.

It takes the first CPU of the process to generate the description.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index b8aa4b34af..b7079eff4a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -298,10 +298,12 @@ typedef struct GDBRegisterState {
 } GDBRegisterState;
=20
 typedef struct GDBProcess {
     uint32_t pid;
     bool attached;
+
+    char target_xml[1024];
 } GDBProcess;
=20
 enum RSState {
     RS_INACTIVE,
     RS_IDLE,
@@ -801,55 +803,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
     }
=20
     return cpu;
 }
=20
-static const char *get_feature_xml(const char *p, const char **newp,
-                                   CPUClass *cc)
+static const char *get_feature_xml(const GDBState *s, const char *p,
+                                   const char **newp, GDBProcess *proces=
s)
 {
     size_t len;
     int i;
     const char *name;
-    static char target_xml[1024];
+    CPUState *cpu =3D get_first_cpu_in_process(s, process);
+    CPUClass *cc =3D CPU_GET_CLASS(cpu);
=20
     len =3D 0;
     while (p[len] && p[len] !=3D ':')
         len++;
     *newp =3D p + len;
=20
     name =3D NULL;
     if (strncmp(p, "target.xml", len) =3D=3D 0) {
+        char *buf =3D process->target_xml;
+        const size_t buf_sz =3D sizeof(process->target_xml);
+
         /* Generate the XML description for this CPU.  */
-        if (!target_xml[0]) {
+        if (!buf[0]) {
             GDBRegisterState *r;
-            CPUState *cpu =3D first_cpu;
=20
-            pstrcat(target_xml, sizeof(target_xml),
+            pstrcat(buf, buf_sz,
                     "<?xml version=3D\"1.0\"?>"
                     "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
                     "<target>");
             if (cc->gdb_arch_name) {
                 gchar *arch =3D cc->gdb_arch_name(cpu);
-                pstrcat(target_xml, sizeof(target_xml), "<architecture>"=
);
-                pstrcat(target_xml, sizeof(target_xml), arch);
-                pstrcat(target_xml, sizeof(target_xml), "</architecture>=
");
+                pstrcat(buf, buf_sz, "<architecture>");
+                pstrcat(buf, buf_sz, arch);
+                pstrcat(buf, buf_sz, "</architecture>");
                 g_free(arch);
             }
-            pstrcat(target_xml, sizeof(target_xml), "<xi:include href=3D=
\"");
-            pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_fil=
e);
-            pstrcat(target_xml, sizeof(target_xml), "\"/>");
+            pstrcat(buf, buf_sz, "<xi:include href=3D\"");
+            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
+            pstrcat(buf, buf_sz, "\"/>");
             for (r =3D cpu->gdb_regs; r; r =3D r->next) {
-                pstrcat(target_xml, sizeof(target_xml), "<xi:include hre=
f=3D\"");
-                pstrcat(target_xml, sizeof(target_xml), r->xml);
-                pstrcat(target_xml, sizeof(target_xml), "\"/>");
+                pstrcat(buf, buf_sz, "<xi:include href=3D\"");
+                pstrcat(buf, buf_sz, r->xml);
+                pstrcat(buf, buf_sz, "\"/>");
             }
-            pstrcat(target_xml, sizeof(target_xml), "</target>");
+            pstrcat(buf, buf_sz, "</target>");
         }
-        return target_xml;
+        return buf;
     }
     if (cc->gdb_get_dynamic_xml) {
-        CPUState *cpu =3D first_cpu;
         char *xmlname =3D g_strndup(p, len);
         const char *xml =3D cc->gdb_get_dynamic_xml(cpu, xmlname);
=20
         g_free(xmlname);
         if (xml) {
@@ -1255,10 +1259,11 @@ out:
 }
=20
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
+    GDBProcess *process;
     CPUClass *cc;
     const char *p;
     uint32_t pid, tid;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
@@ -1636,18 +1641,19 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
         }
         if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
             const char *xml;
             target_ulong total_len;
=20
-            cc =3D CPU_GET_CLASS(first_cpu);
+            process =3D gdb_get_cpu_process(s, s->g_cpu);
+            cc =3D CPU_GET_CLASS(s->g_cpu);
             if (cc->gdb_core_xml_file =3D=3D NULL) {
                 goto unknown_command;
             }
=20
             gdb_has_xml =3D true;
             p +=3D 19;
-            xml =3D get_feature_xml(p, &p, cc);
+            xml =3D get_feature_xml(s, p, &p, process);
             if (!xml) {
                 snprintf(buf, sizeof(buf), "E00");
                 put_packet(s, buf);
                 break;
             }
@@ -2315,10 +2321,11 @@ static int find_cpu_clusters(Object *child, void =
*opaque)
         GDBProcess *process =3D &s->processes[s->process_num - 1];
=20
         /* GDB process IDs -1 and 0 are reserved */
         process->pid =3D cluster->cluster_id + 1;
         process->attached =3D false;
+        process->target_xml[0] =3D '\0';
         return 0;
     }
=20
     return object_child_foreach(child, find_cpu_clusters, opaque);
 }
--=20
2.19.1

