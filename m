Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp740334wrw;
        Tue, 6 Nov 2018 03:08:20 -0800 (PST)
X-Google-Smtp-Source: AJdET5dOGK/pppJwMarflOMLq1s9Uk3+jIrkvBXpKV1lZ+o3iqguBSo8cPxMgXCugAJ9gaQeIQko
X-Received: by 2002:a0c:c16b:: with SMTP id i40mr25436272qvh.28.1541502500545;
        Tue, 06 Nov 2018 03:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502500; cv=none;
        d=google.com; s=arc-20160816;
        b=sP4YFclUhfWZr1JI9RRfvT+AnEw63MIG8c+wDlzmtL/jxu9XfBQFBFOjzcEFkJ3gem
         vkOYgUNZUpBGiDVq9YAaJdB34mdsv7hWA8F91fFR4Mmayx4qpedQfeNdsyhpl+v69iyC
         ZaEToRKpOgEYGEGyXMBXts0blrAJFsVG5O6mw3ucNudCGF/Fox9ip57YGaFhTT/8g+ji
         d0Jh15RlC0jXuG6j7UquYt9QYfTNKalpm6UAcNwmDvw7j0FzesxCgksKMIGX1rxOhZhN
         U84y8HswviPr2inFbWx0J1QWj5tw58HWxInsx6ZAxb8GMjP/M4rtoObJOOXY+Fqj1ISp
         xaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=4OCpPrUdaQ1kxCCSAtLDR5GGZkpBErTuv0HDzeQq8jU=;
        b=xMQ+du8Z1GJYqBqkovAMzC47O9k59W17ICHTHFUtB6i8RCsRIN5jeYWblKiHBPbqCi
         q7/LiaVVPymjPhRBKUB2NVMvXDrYLrl1/o53/vUbL3hq+ERnoV8hshyc8oO0R9PN+Y3+
         TdNGTfNfp+kveahajxi0Lstwb+DrJaJKe5qu1B6J+atvikA9RYmRTK/4qTFoO/TnzCXq
         mVaKFnHS9PkjCuJhYekWJ5W1coxQz4RyqbI3OIdE71VZ487hIQnLNb/K++iu22dZ4iPS
         hMNBRSOZHQUt+KqRtJEQq0tkjV15u/lAR4O4hOdVstdd02hY8U8ZM0j388tKibgZ8G21
         LAgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Eoo3yatL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eyOg3aU1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eyOg3aU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si2697307qvq.169.2018.11.06.03.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:08:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Eoo3yatL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eyOg3aU1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eyOg3aU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzDX-0008Be-VU
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:08:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBf-0006KM-7R
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBV-0000pW-Es
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:21 -0500
Received: from greensocs.com ([193.104.36.180]:46713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBV-0000or-4U; Tue, 06 Nov 2018 06:06:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CD4945C024B;
	Tue,  6 Nov 2018 12:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502372;
	bh=cS+N1h1HgsnfQx9Toc/vlaz3Ue7kByeXlQSkWFD48/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Eoo3yatLh0d6SbZ911xKq0Olvm7mjO6K8toIKQuwZXR7aRt33h0Rhvex26hFgKvfA
	ogB0Tyk+tc9mqIHeT9Glv9I1O+HWUtNWrMcFIv3nuaJa3CesydcKTBsowwu3bw8S50
	S5m1clUhkRbuLggqZzqNIukoOVg6T/qw+mtHtVzo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=eyOg3aU1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=eyOg3aU1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFAGpCYg7eYr; Tue,  6 Nov 2018 12:06:12 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 548005C0271; Tue,  6 Nov 2018 12:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502368;
	bh=cS+N1h1HgsnfQx9Toc/vlaz3Ue7kByeXlQSkWFD48/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eyOg3aU14iokApeBXv2zt8CqqDgdLK8hZthTl4ua/nmIpOEXZ7tloquD/jIINDVc2
	iyV05XNSs4bD8Wg2aUSvoYYT9EzCDX3dBYO7qG+m3gYrH2FhOQsQiHWZaxwV4HmY9U
	JaIVBEBkgRH3op8XNJ7hwRIOR+k28hNmELjVBKCY=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E1F2A5C024F;
	Tue,  6 Nov 2018 12:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502368;
	bh=cS+N1h1HgsnfQx9Toc/vlaz3Ue7kByeXlQSkWFD48/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eyOg3aU14iokApeBXv2zt8CqqDgdLK8hZthTl4ua/nmIpOEXZ7tloquD/jIINDVc2
	iyV05XNSs4bD8Wg2aUSvoYYT9EzCDX3dBYO7qG+m3gYrH2FhOQsQiHWZaxwV4HmY9U
	JaIVBEBkgRH3op8XNJ7hwRIOR+k28hNmELjVBKCY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:40 +0100
Message-Id: <20181106110548.4209-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 08/16] gdbstub: add multiprocess support to
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
X-TUID: zYLdHKhCHEFJ

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

