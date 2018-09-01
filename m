Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp539090wrd;
        Sat, 1 Sep 2018 05:48:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdabTZ1dVXVnz3f/h6XvxNOOZlqwP7La+F56Dd5mGXscCYDK6qRo5QIh+GnxW3Skqdd/68C4
X-Received: by 2002:a0c:d4ad:: with SMTP id u42-v6mr19275182qvh.247.1535806092216;
        Sat, 01 Sep 2018 05:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806092; cv=none;
        d=google.com; s=arc-20160816;
        b=Jj0OfjiDMQ1ImmtTknSLu2dAOH0QdQ07zkhuRspyjXhUYnYendGxOOgs6lMIoVAGOy
         ivlZcfKcM1BE1qPol5TZFsoZuaPFf9fs06cN35YU3jlsUuSd9S7ngpyq/Q8xxp6LdFV+
         5tQjFqpg4nhjnZqJrEbHB5gzvJ352/CEeE3Lb7OvyKuZSx4/Cojl0+fts3xTqUd3wP7b
         TmOeEbVImJj/AThEFgWBDS+AJLD9w9ewMVLTHpJL7zPMx976kFb+aawBucs30+R9csO4
         ksGdQRYk97KL2QKTaWFrZgaxyrshksj2r6ra0sVPSJ5g33QmkB+IN3tJykEWlgG5ftan
         31sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=sd+602boymTsRV327zVVLs0mAM7yR+6SUsjcizyQ5eQ=;
        b=Kma4VzimDQ/L+oh6TOMVNYyRl49fpzdXrVDgE9qvxfCRtpKGRv6QTL3UA5Gk1D7Glr
         HDqyVes68VSumyLJTeGGv4OgK7b96CzJl/q5lvNQqYECXiORCIecVOiKZNzTTvJ1JDib
         5LZpmJ9WuLSDpSYM+RCcNEMtUhyXOENBeQUMN4QGxny5HLfn5BwiGeDfW3mMTq1bnLcX
         wVy+X4l+B4xuQsFDzD2sVmKOwlmVht07e7q+q9tYAqCG+z9B+6f0xpiKrQVjAe/scGLz
         2e+HNLzLqO84cEKOvJmDzZgLcnzOF5502Vil6OqI8BfRmOc+xzRbkRA6ZxCAS6pvroFj
         6kCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=A4MAELlU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="R/I/GS9n";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=GTF9pr7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19-v6si1663344qtp.63.2018.09.01.05.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=A4MAELlU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="R/I/GS9n";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=GTF9pr7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Jz-0006cP-MN
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:48:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004g6-Ey
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J7-0007kv-2I
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J6-0007kF-L0; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id EAD14DFFE0;
	Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806029;
	bh=NjQ3rZmHdKpW6ybJVivC+BqNnipQ91j4rFLMZTWMRpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A4MAELlUi82zMmuRpmk9TI8YY/i9lM3BCLb2dOY4wPG8ndFUzz8l7cjy9p8dhsOiF
	L0sHqcCx/43h4GX0yzR+7xR5+w4R1O3LbRbJ5UCEfytPmSvs/+3gJxnaBM54R07Zn9
	Xwut7Rea5bpnxDxl67HJk8WlAx1KDfwIU9hCPza4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=R/I/GS9n;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GTF9pr7M
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iq_ycgfIiixv; Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 028EC521AAF; Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806028;
	bh=NjQ3rZmHdKpW6ybJVivC+BqNnipQ91j4rFLMZTWMRpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R/I/GS9n2qz/NhMwvMb8k55TZCoNDq7IwtMnezCZrahzQgC4vEMFwy8kuGDJg92WI
	iOF6FRjgfTn2q8N2pMXCix83p/vB6OuPGV1VsVGyHV9X7rJHgJ7nIkaeGtKWxPdb0S
	sFFEt9U42bTC+orhQvQDcslWQ01kTWgQesvw03h4=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 43F3D521A9F;
	Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806027;
	bh=NjQ3rZmHdKpW6ybJVivC+BqNnipQ91j4rFLMZTWMRpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GTF9pr7Mcnj7WUoRE2pZ26keWA/xzMN1Fm5Pc96X6iAaHAti7ekJqLH4DZZLmKH5O
	I2X4yiqX18J4MGE0JgW9Gyr4pmT5dwdyCEjSp1PrfBS0BL6oyyzd9Z0+Z4a0ecY58p
	ywdADreSauykDdPFhJ6fDKf34QphgiyVk82NwdyA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:31 +0200
Message-Id: <20180901124639.19735-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 07/15] gdbstub: add multiprocess support to
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
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NZa28u+Idbym

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
index 43015f7792..761cb051c8 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -792,55 +792,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
     }
 
     return cpu;
 }
 
-static const char *get_feature_xml(const char *p, const char **newp,
-                                   CPUClass *cc)
+static const char *get_feature_xml(const GDBState *s, const char *p,
+                                   const char **newp, GDBProcess *process)
 {
     size_t len;
     int i;
     const char *name;
-    static char target_xml[1024];
+    CPUState *cpu = get_first_cpu_in_process(s, process);
+    CPUClass *cc = CPU_GET_CLASS(cpu);
 
     len = 0;
     while (p[len] && p[len] != ':')
         len++;
     *newp = p + len;
 
     name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
+        char *buf = process->target_xml;
+        const size_t buf_sz = sizeof(process->target_xml);
+
         /* Generate the XML description for this CPU.  */
-        if (!target_xml[0]) {
+        if (!buf[0]) {
             GDBRegisterState *r;
-            CPUState *cpu = first_cpu;
 
-            pstrcat(target_xml, sizeof(target_xml),
+            pstrcat(buf, buf_sz,
                     "<?xml version=\"1.0\"?>"
                     "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
                     "<target>");
             if (cc->gdb_arch_name) {
                 gchar *arch = cc->gdb_arch_name(cpu);
-                pstrcat(target_xml, sizeof(target_xml), "<architecture>");
-                pstrcat(target_xml, sizeof(target_xml), arch);
-                pstrcat(target_xml, sizeof(target_xml), "</architecture>");
+                pstrcat(buf, buf_sz, "<architecture>");
+                pstrcat(buf, buf_sz, arch);
+                pstrcat(buf, buf_sz, "</architecture>");
                 g_free(arch);
             }
-            pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
-            pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
-            pstrcat(target_xml, sizeof(target_xml), "\"/>");
+            pstrcat(buf, buf_sz, "<xi:include href=\"");
+            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
+            pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
-                pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
-                pstrcat(target_xml, sizeof(target_xml), r->xml);
-                pstrcat(target_xml, sizeof(target_xml), "\"/>");
+                pstrcat(buf, buf_sz, "<xi:include href=\"");
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
-        CPUState *cpu = first_cpu;
         char *xmlname = g_strndup(p, len);
         const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
 
         g_free(xmlname);
         if (xml) {
@@ -1247,10 +1249,11 @@ out:
 }
 
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
+    GDBProcess *process;
     CPUClass *cc;
     const char *p;
     uint32_t pid, tid;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
@@ -1621,18 +1624,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         if (strncmp(p, "Xfer:features:read:", 19) == 0) {
             const char *xml;
             target_ulong total_len;
 
-            cc = CPU_GET_CLASS(first_cpu);
+            process = gdb_get_cpu_process(s, s->g_cpu);
+            cc = CPU_GET_CLASS(s->g_cpu);
             if (cc->gdb_core_xml_file == NULL) {
                 goto unknown_command;
             }
 
             gdb_has_xml = true;
             p += 19;
-            xml = get_feature_xml(p, &p, cc);
+            xml = get_feature_xml(s, p, &p, process);
             if (!xml) {
                 snprintf(buf, sizeof(buf), "E00");
                 put_packet(s, buf);
                 break;
             }
-- 
2.18.0

