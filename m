Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp738419wrw;
        Tue, 6 Nov 2018 03:06:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5emr9pXNH8bdkzQ1GOvqDq4cp9XmAS+oUkrTCOOj7MnE4d1ywyRIxbwSYGWt5r+dPFbDJxn
X-Received: by 2002:a0c:9359:: with SMTP id e25mr25258264qve.203.1541502390195;
        Tue, 06 Nov 2018 03:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502390; cv=none;
        d=google.com; s=arc-20160816;
        b=r/PGzxctkg7Yg/y6NHvxBkdm2sCcQ6RxCof81KKGWkD42HoqAilbtpksjxYcBmJ/KA
         YbrMap66TEZwhqTbBVRYTnX/CguMsMfLjOD9Rg1tlEY5aDi29t1QyUihaK2Z81zyaDZ6
         y/7pDZSlfxk8PBvIV+Td63V0cKsKrNBACmoRhyVZW63EHyIRonYCOGeJ9G196Vcj6MSU
         sPbdL/cnKPv66sf4DDSf9BQ/cjsMqT1Ld1wd6mE+nZfTMC0AcFQ2UQLqw8Op9Vtg/yqj
         pasiVoFo31XQ9MEts4O2im3Wi43kQ7dMaBR5dAWgD830AkJgi1iywp2njjG5uTbMwOJL
         YDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=2qKz7YiYLDKmcxbEj9RAM95yfhVKEF5BYbsJ2HbQtfA=;
        b=WQRzlxp8eTYxSEwFeyR+B4Phzgc5L00tdu4D5piARiCAX5GRq+DkbRpgNb59BNje3x
         2W1JEY+bJgXndm0jaQxte2vzPZ+JWUmK477X04lydouSxJM8H4Vw3gSPHenzESwqkuEu
         cE/GdzlPlGvY3WCmXZKD97RdC2/SWJeJgsPecDiqnx52X0E6u1+rf2WaaT5Dwn6EamsA
         kSTOvgkluy98TAt0Ev5nlzATthQvNHOBzdk8p+OP4xg5NY0ssi64tc/4yG8xCld6wPsu
         az4hIvwEGM2/RcZLc73XBwz9tCTVMwgg1ezkTIvQtGIrCecW8QSzJ/WNFE/WrAfQzaIu
         MdEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zx1abv78;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=y83m76xy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=y83m76xy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si6606323qtj.167.2018.11.06.03.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zx1abv78;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=y83m76xy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=y83m76xy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzBl-0006Gz-JN
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:06:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006El-Bn
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBU-0000p7-TD
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBU-0000or-IZ; Tue, 06 Nov 2018 06:06:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DEBF75C9D9C;
	Tue,  6 Nov 2018 12:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502371;
	bh=8S5wpPVVq90/1QKwmLRWhYH1Jn4czok6NwCnRlvPVDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zx1abv78+b4zrtIGWEBNaAkCgCFpRg4zAh0LIcXXQi/0lwtGvObXGzM5KG92VR8Lt
	VFjOUjmU6/SttIVow23OyX2pwurrx2gm6wpZ0eS4sVH5H5Y0oK1u0plhYVHnyJpJ8x
	vISVBfy+UThfo+c/DGyZpCGVDAP52sPYHvIpAyas=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=y83m76xy;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=y83m76xy
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czowl89wQmz9; Tue,  6 Nov 2018 12:06:11 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id E10995C0265; Tue,  6 Nov 2018 12:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502367;
	bh=8S5wpPVVq90/1QKwmLRWhYH1Jn4czok6NwCnRlvPVDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y83m76xyHnyJF/abMtvfRPGmadfyfdcgWX2O7WUABArAl+PRdYn9cWpfxMXxH8RAS
	DftDH4YnEZOH5+n5Kapf+QJKDBAqVZF53fgyBJEtvO4v45RojuT0c+xdp21hodVnLh
	8gQ9e7wqiyRY13cAoMEU8Kphw/EHDPEXVWyY9mds=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 73FEA5C024F;
	Tue,  6 Nov 2018 12:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502367;
	bh=8S5wpPVVq90/1QKwmLRWhYH1Jn4czok6NwCnRlvPVDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y83m76xyHnyJF/abMtvfRPGmadfyfdcgWX2O7WUABArAl+PRdYn9cWpfxMXxH8RAS
	DftDH4YnEZOH5+n5Kapf+QJKDBAqVZF53fgyBJEtvO4v45RojuT0c+xdp21hodVnLh
	8gQ9e7wqiyRY13cAoMEU8Kphw/EHDPEXVWyY9mds=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:39 +0100
Message-Id: <20181106110548.4209-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 07/16] gdbstub: add multiprocess support to
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
X-TUID: oc5xBsI0Wyjl

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

