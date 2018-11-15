Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6805709wrw;
        Thu, 15 Nov 2018 01:53:32 -0800 (PST)
X-Google-Smtp-Source: AJdET5dcwHMMqN4ep3SORtMUyAnncxuBYNERMXKmQ0Pc735CCPyDFxCqB2sPFLS46USFMHbRkH02
X-Received: by 2002:ac8:3879:: with SMTP id r54mr4996487qtb.69.1542275612155;
        Thu, 15 Nov 2018 01:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275612; cv=none;
        d=google.com; s=arc-20160816;
        b=g6DJNSL6l+HMPnP/3ow35Abo8L5DNDx96PwSjhCBnETWixzHOWcDB/FZ99zsilIr8s
         Ad+OlIYLTerHaFRu6hXj3vwAhPnsL2bZizeqsvaAVlgiL4qphf46SN8mwDBi6/MXw8tO
         mZJ4KK+pr3c2/T6KbExVYY5nkHQnFiT/IoLiM1MOYCKD3ezu5ByGzgA8ahlp98EsXBh2
         FM0j3QAoX9P84MbQqG2SEC4x8RvFpEmjMPBj/JEqVxQiwphQ4bp3g+aVaDXlyTssN0nq
         gAQ+ik8l1aY2dcBkCGo5xmTVa2Prkx66M4bTcsPjX3ygkJvhTmJH9kT9mSvOl1BVjBW4
         9iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=62v812DpKsxu0SpjbCupqqDTewM9+Qnivi32JYuK8PI=;
        b=n7IJ99oipb4m22LfE49Rbob1N9tuAFV+TJZg3dH4VTcprKDR9tIjuMysoAOv3aXkX3
         GXtEcwGNYdFfctmRXGCu9mjq6qqfN75x/7Ri+wnGfpOeqGH+awuwsmw+QLFyETsV/Euh
         PZeBynfBuFQk3kfznis4+JiGRQchJNo7pvxbSq/GJ7uptloi4W4ISOr0eBDsl0ngxk16
         V6vjQRP5WM83P3FpW4a1jMz3jYB7Na11A1kcBm5jR0ZE3PLVqMftDsdXjPo8KdPZt4JO
         pURTQJ384IGBRWlYcaCIR+kbmN3Y7ye/937mFA1qomgg7+WyMwxDjHi+d8NdITJaEjVz
         /+3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wHMSPPkr;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GehBHCuy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GehBHCuy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17si7472658qvh.10.2018.11.15.01.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wHMSPPkr;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GehBHCuy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GehBHCuy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEL5-00079M-Bt
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:53:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAl-0007Nr-IK
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAj-0004ig-46
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:51 -0500
Received: from greensocs.com ([193.104.36.180]:41897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAe-0004ND-HW; Thu, 15 Nov 2018 04:42:46 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 110C55BD1B8;
	Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274937;
	bh=WNqtR7Yf1+DcI0hNNh1yydIGO5CsVKnhZZDe/hRGBTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wHMSPPkr6VCUpuixT5vLfZHNHLN4CL1QFpuursB9rq0BQ4aqKDKOgBuiBLLy4AyN3
	jGAQ75fDOZdvZl61B0ivELpRNfINLch5ISWNZnjJka9CELiuif6eVHw0Al3zui4E1N
	gozvv3s6F51qeOwn1L7qU67T6y1Vr0SiR6T1yNqA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GehBHCuy;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GehBHCuy
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruOzKgoi-1oD; Thu, 15 Nov 2018 10:42:16 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id DAAF5400FE4; Thu, 15 Nov 2018 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274935;
	bh=WNqtR7Yf1+DcI0hNNh1yydIGO5CsVKnhZZDe/hRGBTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GehBHCuyoqyS5IGNCE7lsh6B3Fs/R7A84V4s596tL8lbbMB4iSq1gIWdEFVcWzj/p
	VotGKowFR9YA36kWkRtWoOHy0bpsqupz8ftr6WHrRB0tASHBn0itrs2OqvS9T4DC2X
	B2k8yHov+CsrIes2GOqZRg1FskSnrxHx5xyI3SrA=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 711975BD1AF;
	Thu, 15 Nov 2018 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274935;
	bh=WNqtR7Yf1+DcI0hNNh1yydIGO5CsVKnhZZDe/hRGBTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GehBHCuyoqyS5IGNCE7lsh6B3Fs/R7A84V4s596tL8lbbMB4iSq1gIWdEFVcWzj/p
	VotGKowFR9YA36kWkRtWoOHy0bpsqupz8ftr6WHrRB0tASHBn0itrs2OqvS9T4DC2X
	B2k8yHov+CsrIes2GOqZRg1FskSnrxHx5xyI3SrA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:59 +0100
Message-Id: <20181115094207.22846-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 08/16] gdbstub: add multiprocess support to
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
X-TUID: yfS6KeVU7p7c

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
index 292dee8914..4cbc81ae5b 100644
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
@@ -2323,10 +2329,11 @@ static int find_cpu_clusters(Object *child, void =
*opaque)
          * runtime, we enforce here that the machine does not use a clus=
ter ID
          * that would lead to PID 0. */
         assert(process->pid !=3D UINT32_MAX);
         process->pid =3D cluster->cluster_id + 1;
         process->attached =3D false;
+        process->target_xml[0] =3D '\0';
=20
         return 0;
     }
=20
     return object_child_foreach(child, find_cpu_clusters, opaque);
--=20
2.19.1

