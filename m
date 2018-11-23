Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1760629wrt;
        Fri, 23 Nov 2018 01:30:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5e0kO9twAwrOzf+GP70nC7HrX7cZjyY2qcSd8FPXSz+HyCVPKK9I3EgW//qHJq9m2J7K9Ry
X-Received: by 2002:a81:5113:: with SMTP id f19mr15405638ywb.122.1542965424673;
        Fri, 23 Nov 2018 01:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542965424; cv=none;
        d=google.com; s=arc-20160816;
        b=oL6Z5ZDovDgwwc+Zsz7dLSYQ/MfrL4xNArev/KFjLmrkvGv1kb0nuSC4/+XAQPMWqQ
         sIRpiA3Zdw04yBNjQCtRw41Md+WH93eWyGN0GuhZC4StHzBk6rAoVXlB6Q8AXo9xxl1i
         CC4ogojEs0sQuAriHiyveCRBiREVc+LcBm9PjdidYq18kWeHljSW47jE9rC0qDoEZQ1W
         AOwO3FJVPznWke9QN1g1fcICBN+r2R5R1vNU7g1nMjdw+t+sCqa7U+n+qk5vk2dTFEQY
         vb1ZjQzHdit5Nv7xT3OAK/5Ib122/MLv1nlhxuYqkUpa02njQjStYituiW0O45UQh0Gh
         Ktxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=8c/32DezDi4drOcsvziEDV6adh+arDIo5GjTaJyOyRM=;
        b=a97GYEYCtAmN7BeOmKCS6T0ZXO/tK9iTE7fX1jTJjiyMOpM2BFXvpwUuLEo8Dnolki
         xVplW2BH3klvL9u281hSHMTLCfPZPyrtV574kEF8sRjU8x7G9O84nKPmZhsaW2RAePN8
         zNg0E7sphxEXcA/1j6ypSdVEVtBs/9EZdXV2MR2PO4RbJpZDGuJs7G3dQhGKlpcrRRpq
         qOtNVM7QrNzBBf7zTzvbRWXqA0KhdANf6ZuJwbnYYgVJl+4HQJxv0tZZCezsdbn2BWjl
         CTpFPiGmfE89sUQ8f/N83wVuSra1xoC8ofRVohq0vIOCvvmlALtVIZwFwTjwpUZrohOJ
         atRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=v+gTaO4X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tyjvSgsc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tyjvSgsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si1997072ywf.48.2018.11.23.01.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=v+gTaO4X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tyjvSgsc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tyjvSgsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7n5-000386-Io
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:30:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007of-Mm
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7au-0000ZT-II
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7au-0000Xw-4C; Fri, 23 Nov 2018 04:17:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 15DFE5BD1BB;
	Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=N3SgyWObF08UCOAHR0WsOdofElUyflERkmzj4Rs5gYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=v+gTaO4XNYb+WvpOAJ3epK67yEKyHu5oe5Kfy3NNipt1FbM0mA0z3PeoloeDivh6E
	VjvraiwCqk96ChyLxTkw8JVYbf8QG8bzh15wrrBGI5kxhuOUyM5rw+2wGwfjkx92G5
	F5I4g/kxrnBG0eHxiSGnXQyjh5ZQUnoZEw98qjno=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tyjvSgsc;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tyjvSgsc
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7vvdE3Gzq6Y; Fri, 23 Nov 2018 10:17:36 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D96D25BD1A0; Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964654;
	bh=N3SgyWObF08UCOAHR0WsOdofElUyflERkmzj4Rs5gYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tyjvSgscMLb7qhEKU8oWeIII3GkcZec4TR78IKFZfcd5sW0RPEl2e/DS8WcGZ/Juw
	UGcuu6P2KqPvvPvL6mJ0QE0BmDxkbwcAa9lijHkQgRHpLxWGWhd4zr1IFStYSHg01k
	D/5FHUEmUS3R1udApWMPMD3xdnpnbmgN8YjtNLDk=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 778785BD1BB;
	Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964654;
	bh=N3SgyWObF08UCOAHR0WsOdofElUyflERkmzj4Rs5gYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tyjvSgscMLb7qhEKU8oWeIII3GkcZec4TR78IKFZfcd5sW0RPEl2e/DS8WcGZ/Juw
	UGcuu6P2KqPvvPvL6mJ0QE0BmDxkbwcAa9lijHkQgRHpLxWGWhd4zr1IFStYSHg01k
	D/5FHUEmUS3R1udApWMPMD3xdnpnbmgN8YjtNLDk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:20 +0100
Message-Id: <20181123091729.29921-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 07/16] gdbstub: add multiprocess support to
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
X-TUID: dRksPM90ZHXw

Change the thread info related packets handling to support multiprocess
extension.

Add the CPUs class name in the extra info to help differentiate
them in multiprocess mode.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 728efdabee..12d4e33c40 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1262,11 +1262,10 @@ out:
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
@@ -1558,30 +1557,48 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.1

