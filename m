Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp808574wrw;
        Sat, 10 Nov 2018 00:15:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5dEAcSkhsFIUriNXM1GXK9Qh6P8gBwoM+utIDtiIh6tqNhDdE/u7+5FEZx5Joz66nGrCa7A
X-Received: by 2002:ae9:dd42:: with SMTP id r63mr10902000qkf.264.1541837701585;
        Sat, 10 Nov 2018 00:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837701; cv=none;
        d=google.com; s=arc-20160816;
        b=0VTFUZd2j6XOVTmnUN4vZtvhtAioYyRhnIYLwYpkxebOtY6msYkx76zXHIiCZbGk7r
         C2DSLIoY7upe/9uyjUA8lJtiP2xT0EEQas4zxU5JB2mPEsX6OiYm53jlZaqY2wJaFzUi
         vB9qMszdo4sMtHU7KD+UwiuqXDWHfMsAnBNtOX0+QtBUzEuSvXWr9n2CgvlRySV4vi0M
         W5TzOYA1a/5Dj64T2Cux4KN6lwCU0CwdkWt/Ft8FarLQaAm3EtFtvtzMBwHXm18Yj6EH
         dHPkUPeYp4zRrvA10UWJeprT+4Yikz93m9L+aSkqkW4hifEA4ytEza6Nn7dayyyQQ28x
         3dvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=2qKz7YiYLDKmcxbEj9RAM95yfhVKEF5BYbsJ2HbQtfA=;
        b=lNjic2zYItDuIVh3S1M2yI/aLKbY1ZstvTI7BjaEGMcLcZmLtx8E/ABzLqJCJhc8wx
         BduVzL9CbnQhXhAfjFPkgdno3QBiTPWVTgmX5YfcKT22QfyvdpLfYLmy7N+HdGIetI2T
         1LuvC1IZBlFsZ/lbhWtFkUHFWo7/Gk+rZEd+puerj4XXgjXZV7FCpNqRj34oOS49Y8cR
         n4tfEI0DGc+iZZK9Pwlmg+ndz9NZSPxAos+kQJiJn3PcWTVL90PjO3xqXs7ZC5FGN+AX
         GN0pJ9stSmVugDp7FpleRBHlpqM+ZzWL4hM54mOeCoeqrvm3zPZzIFS3RVM0ouBqhDDG
         1dag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1Ft+QeNL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sLqptJPz;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sLqptJPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e91si224084qtd.343.2018.11.10.00.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1Ft+QeNL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sLqptJPz;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sLqptJPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOQ1-0004Zd-11
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:15:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lL-82
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOb-0000Vb-4W
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOZ-0000TD-3R; Sat, 10 Nov 2018 03:13:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5F7FD5D19A5;
	Sat, 10 Nov 2018 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837607;
	bh=8S5wpPVVq90/1QKwmLRWhYH1Jn4czok6NwCnRlvPVDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1Ft+QeNLo30J4J5putTecNnlfQ74BD/arylVH73OyQkBoNopjW1w//BHvY75DV+ZZ
	N+YOyaQ3459uoIFSZgeXVuWFatLZDCYl9E58XuyIMpW2VYeSRL3XxMjWLDIC55XWrL
	td+GI1ycIx//A70qVfMIr7xfS4pT220faGf+Ccoo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sLqptJPz;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sLqptJPz
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdVdhH2TWFnW; Sat, 10 Nov 2018 09:13:26 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 4808844325B; Sat, 10 Nov 2018 09:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837604;
	bh=8S5wpPVVq90/1QKwmLRWhYH1Jn4czok6NwCnRlvPVDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sLqptJPzs1IEcBlbBHrXqQIbHrgrz7G9CkTpLzKqIbzdhnC03CS3OO8mM0NEyWdmf
	2YZ13QTK6GkVkbtp63U5GwD8qiXTe7dPmylrAX6chSamz1EtPM/W0l/cPtAuuyBXLv
	Qi7nXoT4o0DfdZ7yfYjY9ailTb7BS4mm6IazSgg4=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D22D16FD81;
	Sat, 10 Nov 2018 09:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837604;
	bh=8S5wpPVVq90/1QKwmLRWhYH1Jn4czok6NwCnRlvPVDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sLqptJPzs1IEcBlbBHrXqQIbHrgrz7G9CkTpLzKqIbzdhnC03CS3OO8mM0NEyWdmf
	2YZ13QTK6GkVkbtp63U5GwD8qiXTe7dPmylrAX6chSamz1EtPM/W0l/cPtAuuyBXLv
	Qi7nXoT4o0DfdZ7yfYjY9ailTb7BS4mm6IazSgg4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:38 +0100
Message-Id: <20181110081147.4027-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 07/16] gdbstub: add multiprocess support to
 (f|s)ThreadInfo and ThreadExtraInfo
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
X-TUID: cX0iIKxTyO+L

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
index 9be83486f5..43c9211bfa 100644
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

