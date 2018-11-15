Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6804800wrw;
        Thu, 15 Nov 2018 01:52:16 -0800 (PST)
X-Google-Smtp-Source: AJdET5ddDqt6Z944AXUF3kaTxg3zMbaGTbEgXQeZVTO3aBUQiME2B7poyqiB/EG1Y7TMQaHgLXEj
X-Received: by 2002:a0c:be18:: with SMTP id k24mr5474245qvg.192.1542275536666;
        Thu, 15 Nov 2018 01:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275536; cv=none;
        d=google.com; s=arc-20160816;
        b=QyW1t1QJ/5+OUQYHylD/Gs+aoXSHVlV7HEikRWM4QOuOC82mFdtRhk86u8HnMIZUkI
         Qvj5c4Cc8JMbQD8Ws13byCvVSLR1oCBVnBlxYsGuzv5iGlWVgfYx+w1OgcAZWXaP/XUf
         rk0oOr+1pSYCX+JAQDzfSUEXqAoO+N1mpvAqyQhahr6TnBeMXlH42VGawryOomZXlqS7
         hL+XH4rGmNAxmx5AUgWbfysm+Dr38PuSnBYWotGCUPSMuSKCoxwcf9iEgcPFRpmr7+L8
         Xwb/uLi/Rns6ZEB5VmuNV+n41qbRWBQWua12Js+se3QOyTs4mxwHmlQQJX6FPqJ+Sd4G
         P9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=xve/2jRI7oj542AuT1xPN21tTOkBAOc4KyhC3mGJafw=;
        b=ghokFl1vETyHrcdOuhF88YEhB+Qke440vlWKAuTqP/hns5qmWp/uTTFlxTugucJN3N
         yoUtjJG/AcPn8V2QTBzNRO57eKUyANGhVY06igEitebaBMpWB09AsjIjiccWMxfZdGMn
         ANBXooow96Twd2uYNurPf4WTrnkZt665gYzF1EmIT3j/J4TTYotT3H5REYzriSZyJeza
         9F4M8MdeHN7SM6igYhrXQmmBxSVHL/JOiJ094SgthNf2nRymYev9mDGIa2UfFK50+JAC
         PH2L11SwrYDVjWTAMrGQDtbU6oo5j2DXd4CamYvYvnReWzkuCdHmz9wXUTlLXslHDaPq
         yNRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=d6QPbcz7;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sRqDACG8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sRqDACG8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10si303338qtg.335.2018.11.15.01.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=d6QPbcz7;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sRqDACG8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sRqDACG8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEJr-0005iQ-W9
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:52:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEBG-0007r7-J9
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 04:43:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEBE-00053Q-8i
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 04:43:22 -0500
Received: from greensocs.com ([193.104.36.180]:41899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEB3-0004NF-TM; Thu, 15 Nov 2018 04:43:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AA21E6FD9D;
	Thu, 15 Nov 2018 10:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274936;
	bh=Vz03jEkEoeWXKtww+utaeJgxU7B2mcpLpZOzsXl5hzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d6QPbcz7le5zdoEhmifFn5ON0sm1N8p/QDjy2OhCzjmc2s06H1PiyJ/5GaXuW1ZjH
	gkle4CIc9WvWeImYl/WoNhcMBNwdJ19f2bbc3UfteaKJLoEPBapr+BCCDxB6MJPggY
	IVvtpN6TPb7fGJpfQvHNHpDCcG7W5bbRLHyNopEg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sRqDACG8;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sRqDACG8
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOJHX7Kbahed; Thu, 15 Nov 2018 10:42:16 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 78BE56FD8A; Thu, 15 Nov 2018 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274935;
	bh=Vz03jEkEoeWXKtww+utaeJgxU7B2mcpLpZOzsXl5hzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sRqDACG8Kiim6s18FoKa9q28+vxBat5VPUw6vWOteOobE6viUYW3OeRrZRymQKPm7
	STJVqSR0ekKlyqPO6FhGpHiymaahjJRXGFD+SsW1vQZ2YFTwk+0UdNWXFeCY74eIzH
	eCM/Y9BOJew6gFHVL9CSbHnzB8HI0TS965pMR7Is=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E98666FD97;
	Thu, 15 Nov 2018 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274935;
	bh=Vz03jEkEoeWXKtww+utaeJgxU7B2mcpLpZOzsXl5hzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sRqDACG8Kiim6s18FoKa9q28+vxBat5VPUw6vWOteOobE6viUYW3OeRrZRymQKPm7
	STJVqSR0ekKlyqPO6FhGpHiymaahjJRXGFD+SsW1vQZ2YFTwk+0UdNWXFeCY74eIzH
	eCM/Y9BOJew6gFHVL9CSbHnzB8HI0TS965pMR7Is=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:58 +0100
Message-Id: <20181115094207.22846-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v6 07/16] gdbstub: add multiprocess support to
 (f|s)ThreadInfo and ThreadExtraInfo
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
X-TUID: bSZAp6gr1TGo

Change the thread info related packets handling to support multiprocess
extension.

Add the CPUs class name in the extra info to help differentiate
them in multiprocess mode.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index d19b0137e8..292dee8914 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1260,11 +1260,10 @@ out:
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
     CPUClass *cc;
     const char *p;
-    uint32_t thread;
     uint32_t pid, tid;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     char thread_id[16];
@@ -1556,30 +1555,46 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             snprintf(buf, sizeof(buf), "QC%s",
                      gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
             put_packet(s, buf);
             break;
         } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
-            s->query_cpu =3D first_cpu;
+            s->query_cpu =3D gdb_first_cpu(s);
             goto report_cpuinfo;
         } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
         report_cpuinfo:
             if (s->query_cpu) {
-                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->query=
_cpu));
+                snprintf(buf, sizeof(buf), "m%s",
+                         gdb_fmt_thread_id(s, s->query_cpu,
+                                       thread_id, sizeof(thread_id)));
                 put_packet(s, buf);
-                s->query_cpu =3D CPU_NEXT(s->query_cpu);
+                s->query_cpu =3D gdb_next_cpu(s, s->query_cpu);
             } else
                 put_packet(s, "l");
             break;
         } else if (strncmp(p,"ThreadExtraInfo,", 16) =3D=3D 0) {
-            thread =3D strtoull(p+16, (char **)&p, 16);
-            cpu =3D find_cpu(thread);
+            if (read_thread_id(p + 16, &p, &pid, &tid) =3D=3D GDB_READ_T=
HREAD_ERR) {
+                put_packet(s, "E22");
+                break;
+            }
+            cpu =3D gdb_get_cpu(s, pid, tid);
             if (cpu !=3D NULL) {
                 cpu_synchronize_state(cpu);
-                /* memtohex() doubles the required space */
-                len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
-                               "CPU#%d [%s]", cpu->cpu_index,
-                               cpu->halted ? "halted " : "running");
+
+                if (s->multiprocess && (s->process_num > 1)) {
+                    /* Print the CPU model in multiprocess mode */
+                    ObjectClass *oc =3D object_get_class(OBJECT(cpu));
+                    const char *cpu_model =3D object_class_get_name(oc);
+                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
+                                   "CPU#%d %s [%s]", cpu->cpu_index,
+                                   cpu_model,
+                                   cpu->halted ? "halted " : "running");
+                } else {
+                    /* memtohex() doubles the required space */
+                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
+                                   "CPU#%d [%s]", cpu->cpu_index,
+                                   cpu->halted ? "halted " : "running");
+                }
                 trace_gdbstub_op_extra_info((char *)mem_buf);
                 memtohex(buf, mem_buf, len);
                 put_packet(s, buf);
             }
             break;
--=20
2.19.1

