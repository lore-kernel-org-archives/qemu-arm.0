Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749086wrt;
        Fri, 23 Nov 2018 01:18:20 -0800 (PST)
X-Google-Smtp-Source: AJdET5cLBMZ14VpXT8+qobdmTPwaeETBG/bE+l9OZqAm4tiqC2qSSPVcOXimao9869FQJZyhSGux
X-Received: by 2002:a81:5113:: with SMTP id f19mr15367787ywb.122.1542964700900;
        Fri, 23 Nov 2018 01:18:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964700; cv=none;
        d=google.com; s=arc-20160816;
        b=Qn7y6X9j+fXgruKwdb7bjxmB/WwAMKOvbEDSufGCKxdKXKl/FA7Jkf6glcwOS7UKqU
         Q4LDo9paZgFDBH6ETHPKn6DEROYfFnlimQytdxTlNGGs3AJi6/nIo+V7TosmYn+DJkSk
         fEMdYEf+cgz0Lo/Ffuv2PFZ7D3qezEhfHsX4kaLvJWHf/EmF2lSpeoqWoEi0IWVAnZQl
         kFta1gJyU9g6t0goEpYpNgnOD65ZzEDILLCwGaqOhfUT0wMwGnliSPEkeMr9oVZWEUcq
         O2Np3DghDptNagANRnmIusmiEVTw4CKVXPR96Uv9fhV36kGbz5phaigDd99GaQAH3ZrG
         8P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Xc0E1JHtKkAKmMGJA5E8jmq/apZ8ZpxR1yiCBdKOufY=;
        b=mnb1fQ++D+Esd+/bQYOJ66VcxodOHIrI9SwNE/NuZeRow276HiufnfwoxqJI8GNRmO
         J71z5Jq2X82YIGUwW2gkLiZch1itlTevv/0LuOZv7yN8PIT4jtYrP+uf2JL5LNaWscZ6
         dy130y3j5R6nX8A9jMM3UoRASxKXnVmbIwR+96If3lb7CEos6tUV3GRSaD47zR5m8GEs
         ePvqV91K+4v4KLSk4MTOd2sXnp21zjgbJCRx4UhSx+P5zpDBZgpmKoBLoSk8KYsu/NvH
         u1cVxmErg6jOZCfFBHuh6eaujMobFg4vnboslmiXpx1IjDutYEjRbzP9Jeb70EggVkmG
         biMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dXK+jRQW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=uoevaf3p;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=uoevaf3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si6224005ywf.16.2018.11.23.01.18.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dXK+jRQW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=uoevaf3p;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=uoevaf3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bQ-0007vO-9U
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007og-MZ
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7au-0000Zn-Mc
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7au-0000Y0-69; Fri, 23 Nov 2018 04:17:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6F8C45E7082;
	Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=Mny1rR1h2i788cnp1HVll+7xT6ZFRKzOPMBjlq+RxN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dXK+jRQWmFnnXKdPlAVBNkI5hd/pAhhZ0y8oVQLzUKaA2gHOhvkor146UCu6/dsmQ
	0F4xtz005OufAVQVfNpiUZ7/7NCcPvy0F4CUOFeXqmGCEykriRDwrtKdGkqUOV70iN
	w13uwuwM0abBRMTO3uHVka+rfXDVoDSMyM8eDq4U=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=uoevaf3p;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=uoevaf3p
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlaAP7zIEGqf; Fri, 23 Nov 2018 10:17:36 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 4D2A15C0264; Fri, 23 Nov 2018 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964655;
	bh=Mny1rR1h2i788cnp1HVll+7xT6ZFRKzOPMBjlq+RxN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uoevaf3pV+f1YF12yls1rMfV0nnVsOpWIA+p8t5Lt6oSA7hgFFmiEeQU9XEa/3G7D
	+MRb0q5IgAUsX8RSRSVBvmKAvGvsi0rUZ9x/FRsEMhJNlc4UFyLs/ED7vnj2/8aaZ5
	sk8QueCTGZajPa/uxLYL3xYCkyHDUUmAkO9Am4bU=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id DEB165BD1BB;
	Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964655;
	bh=Mny1rR1h2i788cnp1HVll+7xT6ZFRKzOPMBjlq+RxN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uoevaf3pV+f1YF12yls1rMfV0nnVsOpWIA+p8t5Lt6oSA7hgFFmiEeQU9XEa/3G7D
	+MRb0q5IgAUsX8RSRSVBvmKAvGvsi0rUZ9x/FRsEMhJNlc4UFyLs/ED7vnj2/8aaZ5
	sk8QueCTGZajPa/uxLYL3xYCkyHDUUmAkO9Am4bU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:21 +0100
Message-Id: <20181123091729.29921-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 08/16] gdbstub: add multiprocess support to
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
X-TUID: Cmy+dqduu0Um

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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 12d4e33c40..2be333bbd1 100644
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
@@ -806,55 +808,57 @@ static CPUState *gdb_first_attached_cpu(const GDBSt=
ate *s)
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
@@ -1260,10 +1264,11 @@ out:
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
@@ -1643,18 +1648,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -2327,10 +2333,11 @@ static int find_cpu_clusters(Object *child, void =
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

