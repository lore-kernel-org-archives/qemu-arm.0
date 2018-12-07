Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp243316wrt;
        Fri, 7 Dec 2018 01:08:59 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VpDgsbHHfN5fRTt13ng8V1pS/FZ3XS4G0VObLzNgYL05BgK7CsbpKTX2mo2n4UYBS+atYx
X-Received: by 2002:ac8:320a:: with SMTP id x10mr1175810qta.275.1544173739851;
        Fri, 07 Dec 2018 01:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173739; cv=none;
        d=google.com; s=arc-20160816;
        b=n2kt8Whrf1lJWLKR3oNrmOLLL1YPEIPIIQi+p8MWys9KcdjQ0xfe791Y9Dw1kNOjn5
         +fA8Sv9k+qNVMPUjhjlcqBADsMuYqlocGV69e8hgQ0QiGzDslhgMhCvbDD/dLf5Eo7DO
         LztR+ZNACzcJxt3ylHj1mxRfgRbUnK3Hx+tantvUDqdWQlnsa5suspiu9vdQIYpViSY+
         yBzB+ZfqlUqQYYgq93g1VEs3bj3hy6GSBowixcZVl7kAAqwk+M6bsCwCZpprCD7UfvR/
         8XO9B402KgyfwmInsb7BfDifDuQ6ZqRkqGplx+zUDr8ZQcQMHNwXoPOFWWZp8p4QqY63
         3GBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=BIkOABdIDN9ktJr8Ligv0WJwtC/MUKGBBpKTEE2gLik=;
        b=Tr4C0ho0Q6g5Q/OogWKxi/rYm9XDKD+laiBv0l3wvPaul4qLsBKpxfVAPS2MhHZwMA
         xMFdfDI59rjqSyaPIb/kFASN3HrUA2+O0a7zackkFjWhbbMnx8fYbHTjn3ooAiqxCdUK
         dtjuV9bTX+ZB16cH5qm843bYIXsWMSc1EwEQxcDqSEWb1At40uabdniJk4oTPIiHPDKd
         Wn6jQT6qm98c61pFU8AeXQXq4lnb8NVwZanJD1AOocVPwXquxawqSBfSdV74fomMJ5UH
         wOXeECAV0ifwO8GddHIwJD3lnjWiqgDX22Bmi2V9hBoT10m0lcWdJgDGYCW+f57L8o5S
         IFHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="GOJk/f81";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FJqTQLrZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FJqTQLrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si282307qti.48.2018.12.07.01.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="GOJk/f81";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FJqTQLrZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FJqTQLrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC83-0006RY-6J
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:08:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1E-0007sG-Jo
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1B-0005Sk-Ow
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:56 -0500
Received: from greensocs.com ([193.104.36.180]:52243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1B-0005Rp-98; Fri, 07 Dec 2018 04:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4EF5C48002D;
	Fri,  7 Dec 2018 10:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173310;
	bh=j//0svrnt9OC0lkTyoNN3pWM3w5Yc5T8PcFl79uKj+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GOJk/f81vkt2gbsX2SGtC7tvs0Iha0y4FfY/YwpY5yuTz+NM/ZVdYCx58zbjqPC6I
	vuaqSm3EC64tC/fkYZkAhj0DuqARN2edvLVE9aIiKs6j6yAvigTSswqF8hC651sQoO
	2lL2aarQ2N6MDXzlHiYPYSGqLLGdmTPcZx1iiW/Q=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FJqTQLrZ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FJqTQLrZ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbCxAoZy5CYN; Fri,  7 Dec 2018 10:01:49 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 8DD72480032; Fri,  7 Dec 2018 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173304;
	bh=j//0svrnt9OC0lkTyoNN3pWM3w5Yc5T8PcFl79uKj+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJqTQLrZtgRxI5iPAzWHoCKvimJjiHD/fsp/TvZkirdP1xuAG1URZ+UHKsXTsuMzE
	G3Ev9T9V9PFwxBybN9Kvo1G6f+AhEPCy1ZgIGLi740qQrPGw44b7l8wbQ0rzRc1s4v
	9iZF17oYu4OajdH8S37c/SX1oVFS/lHcNjndeCHY=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2A167480011;
	Fri,  7 Dec 2018 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173304;
	bh=j//0svrnt9OC0lkTyoNN3pWM3w5Yc5T8PcFl79uKj+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJqTQLrZtgRxI5iPAzWHoCKvimJjiHD/fsp/TvZkirdP1xuAG1URZ+UHKsXTsuMzE
	G3Ev9T9V9PFwxBybN9Kvo1G6f+AhEPCy1ZgIGLi740qQrPGw44b7l8wbQ0rzRc1s4v
	9iZF17oYu4OajdH8S37c/SX1oVFS/lHcNjndeCHY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:26 +0100
Message-Id: <20181207090135.7651-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 08/16] gdbstub: add multiprocess support to
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
X-TUID: TLdtxe4IQqW1

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
 gdbstub.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 770915446a..c66bf37b49 100644
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
@@ -811,55 +813,57 @@ static CPUState *gdb_first_attached_cpu(const GDBSt=
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
@@ -1265,10 +1269,11 @@ out:
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
@@ -1648,18 +1653,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -2068,10 +2074,11 @@ static void create_default_process(GDBState *s)
     /* We need an available PID slot for this process */
     assert(max_pid < UINT32_MAX);
=20
     process->pid =3D max_pid + 1;
     process->attached =3D false;
+    process->target_xml[0] =3D '\0';
 }
=20
 #ifdef CONFIG_USER_ONLY
 int
 gdb_handlesig(CPUState *cpu, int sig)
@@ -2342,10 +2349,11 @@ static int find_cpu_clusters(Object *child, void =
*opaque)
          * runtime, we enforce here that the machine does not use a clus=
ter ID
          * that would lead to PID 0. */
         assert(cluster->cluster_id !=3D UINT32_MAX);
         process->pid =3D cluster->cluster_id + 1;
         process->attached =3D false;
+        process->target_xml[0] =3D '\0';
=20
         return 0;
     }
=20
     return object_child_foreach(child, find_cpu_clusters, opaque);
--=20
2.19.2

