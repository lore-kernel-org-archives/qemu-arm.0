Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp236890wrt;
        Fri, 7 Dec 2018 01:02:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VozFSLq5CbmOcP3Xf3VpiUtpRdnCz7gMDDE9mJG/9QwllETe4gYoGl71oLOVTG/bmoKem5
X-Received: by 2002:a37:4892:: with SMTP id v140mr1062605qka.71.1544173338375;
        Fri, 07 Dec 2018 01:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173338; cv=none;
        d=google.com; s=arc-20160816;
        b=RSoSF/5+qzfbONIStDor7jtfm2fMkN3Wt2XSwS6rCX1wG6RuX2c8Tk3KvipBtn9vpg
         eHp9vjz/pTOBMalXqIhOefkQELBQUNriuTIlQTWaHIY4He+AUPFSyIBluvgk5V3VUDwP
         s46SUxu7iP7oBh0Op6jLf/2rJM/wh8qGh/J1cOe6M8Pv0+zrcjQNMv8nPg5qA3eNj72E
         gneqsNJl6EweWuon3Mfo/uQgYdrQL2JNplLERi0qbPAjwEKPBfTFRwh+v0wd5K0iNwP7
         MN6KCs1Sx5I0DHjEN//UX9/LBlCVRqUbU9jBLp3yu7sZRmS/Fw8NRz7qVpy+ilwj8rlM
         /xxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=7DRxqu5apMSzSvCrj8p5ZH3cS7q1dyq8rgiFMVEYw3I=;
        b=UiDkSWZ7qkYNJkkRN6/0AjM/ilAI7YJ7aBNaUsbaO6Ft2NCYaxroZkl7qq4bgGiZrC
         uL1kVDF5Km6Jcn7/JHV0FlkK3xIW0XgK56m9CcXIEU7nEai7Bq9YB8+kk3zgfNQeRFZt
         fQyQP47IffRgY8cEs2fiVAWLGCGk8qdc/eaaFucKw8E+xpr8iV+1wcXdHPzRmGE2zWcF
         cl9WL8135JQFaZxl5mzpcxAiFkm9W4cp4y/RoGplsM0C+kd7IrpYT6o5QTfdhYJZsrH1
         cfNZCb7D8t042Hy8emWlJ3q/3W4tCgJtj3axXD6vDDRM4z8dt6dPtTmsR/dPHnWie2Ur
         MG/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="l5Hk/Qit";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=XerEnLX9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=XerEnLX9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m41si1824272qvh.168.2018.12.07.01.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:02:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="l5Hk/Qit";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=XerEnLX9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=XerEnLX9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC1Z-0007uv-R5
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:02:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1E-0007sA-FP
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1B-0005SC-IO
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:56 -0500
Received: from greensocs.com ([193.104.36.180]:52242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1B-0005Ri-5W; Fri, 07 Dec 2018 04:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6F966480024;
	Fri,  7 Dec 2018 10:01:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173309;
	bh=mzcICz8Hy5oCiIfDs9UxgEljkNS5zKRwZKUGqfLZU4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l5Hk/Qit4GRxQCrPDtxP81t/RCNAsue9jfCDe+DUTMKPvIhkH03KVlMn5FwTVBh19
	lfTJphROJsojUZVdgDVbh2DTDT0qeeUlj6mN7sS0Ab3hmdj4a+Z4r4WKQBh31cc62Z
	/nYDKIEBxctmiJ0qq/lROTGNJSUZWHv3MCwOFIi8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=XerEnLX9;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=XerEnLX9
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPwl7OEk6fcp; Fri,  7 Dec 2018 10:01:48 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 23FA6480031; Fri,  7 Dec 2018 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173304;
	bh=mzcICz8Hy5oCiIfDs9UxgEljkNS5zKRwZKUGqfLZU4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XerEnLX9y1un8Z3/GokSGJl7A9Ot4m0rUaxmDM8A46miHubzOPTNGyvPr+ehP8Wzs
	3pBEyG6obVNh2cZ8ViE3mTO/ggsTQhEnccT9Nsuvha4sl+bgcO8S3sePvL/PUlfIVc
	fvPp7kfXpJ4fgFZD99apVFHBifZjriHZThU42F3E=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B5632480011;
	Fri,  7 Dec 2018 10:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173304;
	bh=mzcICz8Hy5oCiIfDs9UxgEljkNS5zKRwZKUGqfLZU4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XerEnLX9y1un8Z3/GokSGJl7A9Ot4m0rUaxmDM8A46miHubzOPTNGyvPr+ehP8Wzs
	3pBEyG6obVNh2cZ8ViE3mTO/ggsTQhEnccT9Nsuvha4sl+bgcO8S3sePvL/PUlfIVc
	fvPp7kfXpJ4fgFZD99apVFHBifZjriHZThU42F3E=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:25 +0100
Message-Id: <20181207090135.7651-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 07/16] gdbstub: add multiprocess support to
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
X-TUID: 9JZb2+liLagk

Change the thread info related packets handling to support multiprocess
extension.

Add the CPUs class name in the extra info to help differentiate
them in multiprocess mode.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index bea0215f30..770915446a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1267,11 +1267,10 @@ out:
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
@@ -1563,30 +1562,48 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             snprintf(buf, sizeof(buf), "QC%s",
                      gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
             put_packet(s, buf);
             break;
         } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
-            s->query_cpu =3D first_cpu;
+            s->query_cpu =3D gdb_first_attached_cpu(s);
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
+                s->query_cpu =3D gdb_next_attached_cpu(s, s->query_cpu);
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
+                    /* Print the CPU model and name in multiprocess mode=
 */
+                    ObjectClass *oc =3D object_get_class(OBJECT(cpu));
+                    const char *cpu_model =3D object_class_get_name(oc);
+                    char *cpu_name =3D
+                        object_get_canonical_path_component(OBJECT(cpu))=
;
+                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
+                                   "%s %s [%s]", cpu_model, cpu_name,
+                                   cpu->halted ? "halted " : "running");
+                    g_free(cpu_name);
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
2.19.2

