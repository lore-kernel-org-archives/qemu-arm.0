Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp447345wro;
        Fri, 26 Oct 2018 01:38:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dfuUEn3VyN7MDu0i1vuvthkmmkVaaR4k+4hoiPU1fzXWfFjplhkAB1de064JNXWmCqZw9T
X-Received: by 2002:ac8:320c:: with SMTP id x12-v6mr2250494qta.275.1540543102235;
        Fri, 26 Oct 2018 01:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543102; cv=none;
        d=google.com; s=arc-20160816;
        b=zrPRXMqySU2DIXaqolnmt4iqriaEbU/z5BHiPJZA26TvenkZdRNSoPwXJICYbL94em
         X7I7Xctvmu7HV0Xt6If1LSiOxHG4f4g9UsBIxdwtytL9ADbGAZBZotCVoFHvpMgrRd5k
         +sPWFsMzINcQVF9aHo66xG7MJEjG1own2Xy1ehHV7c5Ntgyom3d2H0Rh1U4S1+5zayGe
         ph57jE9iJuqK4/juyH64FrHCZDoHGcFoHMmOKDbFLiiITbSLqmWPyoC0jxpvOQMMYyka
         C5W4AjJJtEpSi4wvuYS944sqoOs3CQth3qaY9eYJ6VjgFibCqtXiXL4q1ElnOd6BrlKf
         wkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=uJL0p1SdfldZ8T58gksQMlYhAfGvBH6hTb/dHttEMxQ=;
        b=Hjcr5/xylMUjacwHf30auDojcHGe5/stcGF2cRUnTIQhLw6Q2irg4sSnQ12rGxD3fA
         hRyQ1adKxl2MCe4i19Z/RjqZPvu95/6nDIpL4hha81HjUuNdwDCvEaiWsW9S9CypX+wh
         XeBoL9u3Hl2E4Vn/ucsQnPCptu14ccDLdP5NjUqXgsQKNITiFXyXwipAKTta6VeGQYFB
         krOxgpZlyhZCNKlaUxwgrgMvDpw2t362IeBcsOnQwT1c2bI76jpog40F/tNt8WPB8mk3
         xcch7BuK4Ov80CDFC0mF5YRUe5iNRO3NuXz/j9TEr+OgPVZx8T2krwhz/ozVhg8WoQex
         rDrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q8KUJf5R;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1Vir/1de";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1Vir/1de";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si8429575qvo.98.2018.10.26.01.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q8KUJf5R;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1Vir/1de";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1Vir/1de";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxdN-0003D2-NE
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:38:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUM-0002m7-CB
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJC-0004nE-Jx
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:17:31 -0400
Received: from greensocs.com ([193.104.36.180]:45402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ9-0004lW-Id; Fri, 26 Oct 2018 04:17:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 32F5B441B52;
	Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541838;
	bh=+bywekg1op7l1Y73+cSyV1i54Evh+KgmouT9yYwL0DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q8KUJf5Rs8JX+2aenEIOIGHa1p4iMdCBQxaq3kaNcQV+2B+EFEsu0O5KbCQvIIafB
	QOBZR2nzCCRm+IRLzGYoPoU7rwDl6wS8/olAmscKcL5ff8SDWSQ9SAPh5WTQalEb/c
	167MEFXGd6UfHjustLOil630fh4nAUpBbAahKEmY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1Vir/1de;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1Vir/1de
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQ72E5I5hsOF; Fri, 26 Oct 2018 10:17:17 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 45027441B45; Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541835;
	bh=+bywekg1op7l1Y73+cSyV1i54Evh+KgmouT9yYwL0DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1Vir/1dei0+bicrl/JcEIDsqgYpXUJT0qqJ8g8f6plDscZQtvV5Y1qhmOVh5qBOKm
	lN2IYupvoWYktAhPEoo61MpQfpRLBbRQ0NRo0e54md/UI6eoXcqxPsbBkpujuaUCnf
	+wqLcsj8ZLID1PEkCKu+zs0aL4no7h9MViXHF+Mk=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CC7C5441B42;
	Fri, 26 Oct 2018 10:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541835;
	bh=+bywekg1op7l1Y73+cSyV1i54Evh+KgmouT9yYwL0DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1Vir/1dei0+bicrl/JcEIDsqgYpXUJT0qqJ8g8f6plDscZQtvV5Y1qhmOVh5qBOKm
	lN2IYupvoWYktAhPEoo61MpQfpRLBbRQ0NRo0e54md/UI6eoXcqxPsbBkpujuaUCnf
	+wqLcsj8ZLID1PEkCKu+zs0aL4no7h9MViXHF+Mk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:44 +0200
Message-Id: <20181026081653.24602-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 07/16] gdbstub: add multiprocess support to
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
X-TUID: jRoKrpMcyZfx

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
index 17fec8a41c..b8aa4b34af 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1257,11 +1257,10 @@ out:
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
@@ -1553,30 +1552,46 @@ static int gdb_handle_packet(GDBState *s, const c=
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

