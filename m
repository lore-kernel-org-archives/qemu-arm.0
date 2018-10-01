Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730032wrt;
        Mon, 1 Oct 2018 04:57:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63pvXn3ntTxlAInI/54YIGMnkmy+alXRUr93oclQQOOd7CuP+8t+asDGSdoF6Nf35JPLAts
X-Received: by 2002:ac8:16ab:: with SMTP id r40-v6mr8309277qtj.23.1538395069771;
        Mon, 01 Oct 2018 04:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395069; cv=none;
        d=google.com; s=arc-20160816;
        b=BMeeWmN3OdvaOhQgf5smHa2hKCnYkde69BGg3e0ptfnmGgpKGtKS6zeTj92EdXSzp5
         F7oKvB6ENv77YxC84dCzVRL8fmfWdBJDx2qw50DYD8+teq+fVMDeQ5kQXMWYvc1BF5bT
         h9V2XulgSwfhEmOuJbKv78eb15kUNSlmfsI8JmdH60Ljj/ctxbDW6WwojzHhZVLWnw8d
         yYOMQ55yHLw3MHCF5DdmhOzEbnq0sIi02/rPOoeVXBpPoOy5aje/s0PwXT9q/EvaK/vP
         57VD9IBRx0udesWrsYBUDJLHY7cXur57AUQ//5iWejuDUZEdHHaAswPbDh3UCVJTiaw8
         6x9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=kLZOfpKp3tUhFFVRUxFeTSW2oXXLdlDYMHun3bC55e8=;
        b=fek2zKyAkOjemO6LT2OqgH6V+qSwvMcrrdcmyBLl7PBQ0BviAieLoKkTfmb4YoQq4/
         4WCpQMH9Ug8Uqf7Q1NNlZg2w22XgxepSTUehjyKCgU5yWdWascux7JkcKKT3APjg954a
         0PHSOU9VLWLzpcrbBjvLmiLB/QR92wUl7w29V4JKaqkOTYcCz3spMHRzzdCNKPbyTtGd
         uzUcq1SugqixVSnA9gPuYk2FfT9W5kfDa1P+WXPhjShZAbBzJIXaAzATkpTif13Ts9K+
         sTJfG+0E6/JDKjE2132Ug5faFTPK+PlXGQxjtfKbx1ffgRbxehlsvFy4SHPZOYvcBj1d
         +nJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=01QMJ5a1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cVUEd9a9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cVUEd9a9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64-v6si2535251qka.351.2018.10.01.04.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=01QMJ5a1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cVUEd9a9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cVUEd9a9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wph-0002OK-5c
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:57:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NS-JP
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpN-0005jG-0G
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005gU-HV; Mon, 01 Oct 2018 07:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 789C9511C7B;
	Mon,  1 Oct 2018 13:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395032;
	bh=u9mBA29Uy7CeTohlrONoiEzan2f3Z3lvgNj7vWz+qbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=01QMJ5a16bbM8B6jaJcW0dzKjijcXTRC+Vie2Ovq6yE/vlT799c2nWi3e5haUKKAo
	bGMEzW+lvV8hOZXjcTFC2ABa9pv8TtZuwquBlzKfyl7HdmWLyxWKYYKkUlsidu4sqS
	glI9A6tZGMzCNtn7Iq0OkEcQBbQL9sqB7Mh1GlNA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=cVUEd9a9;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=cVUEd9a9
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-Jp0GMdIrCi; Mon,  1 Oct 2018 13:57:11 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B2305511C70; Mon,  1 Oct 2018 13:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395028;
	bh=u9mBA29Uy7CeTohlrONoiEzan2f3Z3lvgNj7vWz+qbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cVUEd9a9sjwACAjH6LWJA0zP37TVqbNf/5tx0V/KU96Z0zRC9UzNFYzEBxLXyEOw5
	mVr/6ZqVne675/90EzSMYggLHM6tj/ao9kOb2TKSt63iYKAFtraGCYWIiv1k/t+iIy
	saCObSh1QI03nkGt3bPl1TbO6g3JZShRuWTtKCuY=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 582A7511C59;
	Mon,  1 Oct 2018 13:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395028;
	bh=u9mBA29Uy7CeTohlrONoiEzan2f3Z3lvgNj7vWz+qbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cVUEd9a9sjwACAjH6LWJA0zP37TVqbNf/5tx0V/KU96Z0zRC9UzNFYzEBxLXyEOw5
	mVr/6ZqVne675/90EzSMYggLHM6tj/ao9kOb2TKSt63iYKAFtraGCYWIiv1k/t+iIy
	saCObSh1QI03nkGt3bPl1TbO6g3JZShRuWTtKCuY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:55 +0200
Message-Id: <20181001115704.701-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 06/15] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E3I1WT4v809/

Change the thread info related packets handling to support multiprocess
extension.

Add the CPUs class name in the extra info to help differentiate
them in multiprocess mode.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3242f0d261..63d7913269 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1248,11 +1248,10 @@ out:
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
@@ -1540,30 +1539,43 @@ static int gdb_handle_packet(GDBState *s, const c=
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
+            read_thread_id(p + 16, &p, &pid, &tid);
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
2.19.0

