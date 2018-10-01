Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730443wrt;
        Mon, 1 Oct 2018 04:58:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62mweqtN+o7q0mZ8J/EklOleZ60kN6/XNQt2UpFox3zeMjbEoABAWzr6ofRUw/trZx2ezZ8
X-Received: by 2002:aed:32a4:: with SMTP id z33-v6mr8108918qtd.299.1538395099540;
        Mon, 01 Oct 2018 04:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395099; cv=none;
        d=google.com; s=arc-20160816;
        b=vMxKQcs1GOCEG75LmDC6pS+Y4JmzOQbhdKRxANf6+LUTlpIx8f8LKDA4ACQdxt4g88
         fB55sNJk9M1Z7SblgHbM2Gay/wl6MwDfoVHPTJbU2bmQQVwOIzVXO3Vn5aMCOyW6UyGQ
         8olSrf6HXAizcEED/6FlXjmMQH7EP4myoQJisoj68wJcirTAMScyGhelp5V5wx604ONT
         Cn8w13ID3QWh6470eqyRGNSDdgz5XzcEASVtAq2fmZLOLVfVmpLeB/2DwR/t157i+xc5
         SSwoFwnxdGrXB8AuaPYYmEmy++Izm3KK3H1CtYf4mwR4+haoRsK0M4i7mjyW2uwjUkZR
         QzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=xPHjb2T8h5XdJ1mzxMIbe4L5vbhJ0EuMMmOJAtZrEW4=;
        b=zGq3NLI75OZAo1Yb14Ww7kQReY+p11vndoXaJW7C8ZrYt0yNXdFlDlbC7xQ+FFG2AD
         +1ju0sxlPm+2pfI8ifTb91dPCCWj1vzpgNv7B1xb+/7q+OMZezRkq0q8PkVqbmDwPe25
         WR0K9aEWSgP6sHJANdjQGWHgKc8R115fp/C2bVI9RaDgfIWvl/q8Fj+wcB0K/78Qyd2L
         zbeq+dxd0rVDqk4c9B7Pmr+lVElDAR80B5trnY7tkby4JT0kqR8dw6vdDxmY75AX5ZMF
         RH74DIyHV3+xPvAmdqwoUg7L4ar9slZKzhHP/hYCe69mhlXlivB1ROFEd3xP2zuBg/gt
         noeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=diNV62ky;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b3lED2LQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b3lED2LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2-v6si2326134qkf.293.2018.10.01.04.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=diNV62ky;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b3lED2LQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b3lED2LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wqB-0002uj-1O
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NZ-Mx
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpN-0005jr-7Y
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005gb-OX; Mon, 01 Oct 2018 07:57:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 37ACB511C7C;
	Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395033;
	bh=fORHhLW7x9Y7LTXpgI9o9P9dnprhSOMLu1KN81BZNF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=diNV62kyiPczjGY3px/Q0aSTgQAGVroN6qN3CDlSXY+/nitEHYk9KG84oDrWcppJ/
	ChbJBPBO40krBWmWnQqD/WaN5AFC3XGAOb8t8H6a7qifvqKejny2cRfp4bSWY8W+4o
	VAplp+X34w24C5+iCWDApqwz93DtUvJ8FKsUslNk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=b3lED2LQ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=b3lED2LQ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQduy6hdZ78v; Mon,  1 Oct 2018 13:57:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 59CEF511C65; Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395029;
	bh=fORHhLW7x9Y7LTXpgI9o9P9dnprhSOMLu1KN81BZNF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b3lED2LQhx9L7Dr3b1fThrEgBWb7WbVDj5w2ZVVEml8Ef7HubDTVDKTnBpPV2ZyZO
	Yeg56ZHJ3p2EZStgNzg+BR4J4l7nhFvR52J1oluumhDBDPC5eawQh3LBFmrvhvzeYZ
	B1zOTpPr3Wk+hy2X10t4kxwis8Fes3ckDnhhl5xE=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B8AA9511C71;
	Mon,  1 Oct 2018 13:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395029;
	bh=fORHhLW7x9Y7LTXpgI9o9P9dnprhSOMLu1KN81BZNF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b3lED2LQhx9L7Dr3b1fThrEgBWb7WbVDj5w2ZVVEml8Ef7HubDTVDKTnBpPV2ZyZO
	Yeg56ZHJ3p2EZStgNzg+BR4J4l7nhFvR52J1oluumhDBDPC5eawQh3LBFmrvhvzeYZ
	B1zOTpPr3Wk+hy2X10t4kxwis8Fes3ckDnhhl5xE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:56 +0200
Message-Id: <20181001115704.701-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 07/15] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AaucXoRvs/gC

Change the Xfer:features:read: packet handling to support the
multiprocess extension. This packet is used to request the XML
description of the CPU. In multiprocess mode, different descriptions can
be sent for different processes.

This function now takes the process to send the description for as a
parameter, and use a buffer in the process structure to store the
generated description.

It takes the first CPU of the process to generate the description.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 63d7913269..9065e8e140 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -792,55 +792,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
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
@@ -1246,10 +1248,11 @@ out:
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
@@ -1620,18 +1623,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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
--=20
2.19.0

