Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3739317wrt;
        Mon, 1 Oct 2018 05:06:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Gt6VNeoGC9LFWS0UioP+R6OVPWp4GZwK6bJ2bMFVJrrpwk7DQlT3F9ClYx6H5fWDe4Phq
X-Received: by 2002:a0c:983d:: with SMTP id c58-v6mr8048917qvd.221.1538395583950;
        Mon, 01 Oct 2018 05:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395583; cv=none;
        d=google.com; s=arc-20160816;
        b=dXuWFYWtFZvw0uPvY30XwTAyBoh8gqWa6x0VAFF361b/rc9gSB6xpaEaTuJf28ElTr
         QHc0q+Ik5PGpBHMZxVu7B+gNRhqyRh2FuVPZIi2w9bGXweYA2NElwZvTsWTFuqWmvVwD
         y5orQpq6tnwvI3Hq7LF2fqASPW/cRjKv/6rvIarhn8Hwkt2e18yAQWeW0TqNxVULuPOy
         spr3bJsKCYXp9bHPxnl1YnPgK7fwzuroX6hYNnZJ8kxWpvSFWYhl71szSGqUhNQTXIcy
         CSxslwv03fsT7uyXiO165uEYEEv/9jOTBiYrnDJOcVwP5bbuNkqcWw5BzyhYBDvww5xX
         spfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=rjtwCx9ZJklT1QSWd32dljHmhqyfzmhKLEcqyXBCahA=;
        b=XeABgyIVu3z85rtj9/sdnckzlzvRzj+j+yIpsvjmXKrrv+EqpdQGmcmCo/6H7gT6OH
         wbtdbnEbq7fZ09dc8SIp0X9u/5gk60w7dwtGC5BDsUnMPVXRquJ2Sc9twwu+Ve8GyfPg
         kauKwE55zoHZ/k66IMS9t2Tt4lH4M//GcYaBRk0haHgOT0jCg7f/VSrqSt/6TIq20r4K
         T2dZ79koRhasobf5uiv4iZlskFPoa/7e3Zjts48EFaOiHxZqj1IXlhkn97C1wgThCJm7
         m1PM9KgzpKwPon2ersRYSkSGGDIsQ6OumR1dLJgnBfJAt42kR8nhQd4Av2egP4UFfgYY
         sxEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=SZaFWYki;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=W7Yx0Td2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=W7Yx0Td2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z124-v6si2337212qkd.17.2018.10.01.05.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 05:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=SZaFWYki;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=W7Yx0Td2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=W7Yx0Td2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wxz-0002zZ-Eb
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 08:06:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpl-0002i9-KY
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wph-0005yl-Bo
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:53 -0400
Received: from greensocs.com ([193.104.36.180]:40136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpg-0005iY-St; Mon, 01 Oct 2018 07:57:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C91C8511C71;
	Mon,  1 Oct 2018 13:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395034;
	bh=9C/gIEA3NZLS7VnTV3RQTiDgLuN+c06HAC6nEZRMMAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SZaFWYkiOsu4oPrvC2yB8M2R6Ass2w2aWnQC4b4DqjE11Mi+L1scaeMfy55CgFJ0a
	VXDFj6gXRbNRWpkVKqkNUHyrUvlIRgR+aNw7yne3zBd4O4Vf3Uqm8nyFav/JSVofXJ
	gu+SWaausqmnN/p3mLcViOT+TQYx4h34TRNsL7KE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=W7Yx0Td2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=W7Yx0Td2
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwQY7GnSPX3z; Mon,  1 Oct 2018 13:57:14 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5501E511C59; Mon,  1 Oct 2018 13:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395031;
	bh=9C/gIEA3NZLS7VnTV3RQTiDgLuN+c06HAC6nEZRMMAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W7Yx0Td2RjuHMYcaYWI7RdT9g+qcHZ4n6JYYDOeQB8vUvAsGtsTCkClj+l05/8VyA
	X8JXwSx9MWMdcqq1NzFyt8OVi5ze4jBeY6sNgE9LY9Mq2Mwp54BG+ct4Gy11INZjm/
	6cWV9C5JQIlGyfJDE1u0Mk9HP/+5QCRXeO2nNIBg=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E7EDB511C6F;
	Mon,  1 Oct 2018 13:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395031;
	bh=9C/gIEA3NZLS7VnTV3RQTiDgLuN+c06HAC6nEZRMMAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W7Yx0Td2RjuHMYcaYWI7RdT9g+qcHZ4n6JYYDOeQB8vUvAsGtsTCkClj+l05/8VyA
	X8JXwSx9MWMdcqq1NzFyt8OVi5ze4jBeY6sNgE9LY9Mq2Mwp54BG+ct4Gy11INZjm/
	6cWV9C5JQIlGyfJDE1u0Mk9HP/+5QCRXeO2nNIBg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:57:00 +0200
Message-Id: <20181001115704.701-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 11/15] gdbstub: add support for vAttach packets
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
X-TUID: RFMfYJC8PCMn

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index d372972dd3..b6de821025 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1326,10 +1326,42 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
                     break;
                 }
                 goto unknown_command;
             }
             break;
+        } else if (strncmp(p, "Attach", 6) =3D=3D 0) {
+            unsigned long pid;
+
+            p +=3D 7;
+
+            qemu_strtoul(p, &p, 16, &pid);
+
+            process =3D gdb_get_process(s, pid);
+
+            if (process =3D=3D NULL) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            cpu =3D get_first_cpu_in_process(s, process);
+
+            if (cpu =3D=3D NULL) {
+                /* Refuse to attach an empty process */
+                put_packet(s, "E22");
+                break;
+            }
+
+            process->attached =3D true;
+
+            s->g_cpu =3D cpu;
+            s->c_cpu =3D cpu;
+
+            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRA=
P,
+                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
+
+            put_packet(s, buf);
+            break;
         } else {
             goto unknown_command;
         }
     case 'k':
         /* Kill the target */
--=20
2.19.0

