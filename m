Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp813600wrw;
        Sat, 10 Nov 2018 00:21:53 -0800 (PST)
X-Google-Smtp-Source: AJdET5c2BdFXjQV7Rp0aGD/hYH2HDqT0VLOFwmI8BY/iUQYJ4EvidSurUWiaw4K+Ia5NHEdn3Ia9
X-Received: by 2002:ac8:3715:: with SMTP id o21mr8177795qtb.224.1541838113659;
        Sat, 10 Nov 2018 00:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541838113; cv=none;
        d=google.com; s=arc-20160816;
        b=HmgsVNEy5UdqE+OaqsSn6123swHJiEHVyz25Ojxe23uOyanns+6jhzVu6PS63gzVCm
         5k+eQA1ABfpKpk6X1HiuGkzv9IktHrNqjiKqaQYQb+0vMfiO3ABjiyhbn3DZAhTq2a2g
         wfAZw5u7GEj1kEgGE7sNhgyN0Hpq4UamzwObErmAt2UJxYKo0vdEJeYXNVYa23kO9hRx
         gdEszctVq24ynPT1XpzFp9HpqHqH/zZ3ULbaGmcQ7pIPti0UPhP9pwlT8asUmff3gmcM
         NPZXN5dRaw1CBw+tox7nxyd09a83UGKNpuLVg/Blvsm/O8wxY2qDKdsaz+21ZzDAU2C9
         +PCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=4OCpPrUdaQ1kxCCSAtLDR5GGZkpBErTuv0HDzeQq8jU=;
        b=mMTq5HfIsJk59SIylg26ORCYBjdrxj8v2i5L6EpNV63sUefpER2Rbu95U2I6b/mEpG
         2EJfKSaEY41wE4TRXApWkVhkShFXmu8ifMarMBxTOMuQ9rutGDYF2XUHl5QeBlAYE/Ey
         1CmVn5ZxleyV0tCWyon+83hEjXOyHHKJA1MQZfV6wk26xkr4nPNzEMoRcUrwmiIgiP1x
         1/Er8O4yv+FqxggUyX1qGistUBGhYuePK9YppBzT0Fb6KRf251lhWZTTyOo2zpPGz2/8
         nU88Csmpm/zTb4h14+PIKzGfeGQXvyNjNBf3qDH7SGLZqWhOyRC2B/uv1ikxjTsXvFvO
         lKzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=D4uIrLpI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=MVyM8q+5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=MVyM8q+5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si2487691qtj.211.2018.11.10.00.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=D4uIrLpI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=MVyM8q+5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=MVyM8q+5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOWf-0003B7-3P
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:21:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP4-00040v-1j
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP2-0000wN-Br
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:01 -0500
Received: from greensocs.com ([193.104.36.180]:43681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOy-0000TG-Op; Sat, 10 Nov 2018 03:13:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A80A25D19AA;
	Sat, 10 Nov 2018 09:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837608;
	bh=cS+N1h1HgsnfQx9Toc/vlaz3Ue7kByeXlQSkWFD48/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D4uIrLpIYxwpMcvcrjaAmH0P6q8W9ABznU9/LVahLbJqlw0y35nwyvuzj0oJ71YO0
	NWLRm5l+q6UhCrxncQxV8egrBIHVtju8SfXrEX0+WXch//95ohfj0dtCsvpZA4S0WQ
	flLQ0oH//uk37uKn0kVmPEof+051eOEwktzsHhGM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=MVyM8q+5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=MVyM8q+5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j7DR4EoFtpf; Sat, 10 Nov 2018 09:13:27 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id B2A8D443258; Sat, 10 Nov 2018 09:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837604;
	bh=cS+N1h1HgsnfQx9Toc/vlaz3Ue7kByeXlQSkWFD48/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MVyM8q+56qXRnwbrGeRsAxTIst7djQ+xODaXpOGleg4K9pxe2hjcdZ41SQYmIOM4A
	IxH1Lrb1EcAxrv8HTew6NChmuuQjSunWQ3Bj/LGk+vSk77jvT85wzJGolAXpSmhUz/
	Vhc1OcGUDSth/EvVHoavHueMjCl3d178aYkyJga8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 45B78443258;
	Sat, 10 Nov 2018 09:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837604;
	bh=cS+N1h1HgsnfQx9Toc/vlaz3Ue7kByeXlQSkWFD48/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MVyM8q+56qXRnwbrGeRsAxTIst7djQ+xODaXpOGleg4K9pxe2hjcdZ41SQYmIOM4A
	IxH1Lrb1EcAxrv8HTew6NChmuuQjSunWQ3Bj/LGk+vSk77jvT85wzJGolAXpSmhUz/
	Vhc1OcGUDSth/EvVHoavHueMjCl3d178aYkyJga8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:39 +0100
Message-Id: <20181110081147.4027-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 08/16] gdbstub: add multiprocess support to
 Xfer:features:read:
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
X-TUID: 0u9cKWCG35kd

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
index 43c9211bfa..aae3cce01a 100644
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
@@ -804,55 +806,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
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
@@ -1258,10 +1262,11 @@ out:
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
@@ -1639,18 +1644,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -2319,10 +2325,11 @@ static int find_cpu_clusters(Object *child, void =
*opaque)
         process =3D &s->processes[s->process_num - 1];
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

