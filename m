Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp807902wrw;
        Sat, 10 Nov 2018 00:14:05 -0800 (PST)
X-Google-Smtp-Source: AJdET5cXue8Fwwnj6MCpHXvbWM6+zWI4fZCsvxapCO/dIaYM/P9sDAt8ars3z6qlD3VF2Gka1JOD
X-Received: by 2002:ac8:474e:: with SMTP id k14mr11909124qtp.117.1541837645041;
        Sat, 10 Nov 2018 00:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837645; cv=none;
        d=google.com; s=arc-20160816;
        b=KNEsVWsocYJqw1L0MzjoOW4R27qDoVoyLwg+qqh5wjyfRqtFfiVDJUkFP/Hg5K7h2R
         Zv0s0p5xYzgdYXbrDyNHjNEntkmFcf4mK2c+taLRXNJuv7BcmbKRlN/A0SWYFy43laCm
         sgl2gWOPIp31xfZk2XqAgQLwvAWVCOKnhd8W5kiKNZijyCEFSLVARpjnKJLOjMDWnYSw
         VMnnwg/WjrWyjDOHf7s1Gmm8heGaOHP4v3shJWc5Uv4ae8K6iNwQGixeeRUh6eZnbQEL
         +HtBW2mneFcX4fVZeWdVwI48bTb1xfYcvblY8ZyiyagkSKJ+IfOh5CqJYlu5UJw0sTHG
         vJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=yEEfEsi6+XAjBxk95n8NYwVQ8wvzJMCTZAdq9BxhknE=;
        b=iEOP0oeIkzuLsNxdcGvkMEPqtneD/Dd8+cjkmgljrL3JKdJHqwNcK/Vs7+IjcQX/oM
         s323vq21Uadf+GZk0f7zJZ/tY8E/JUln6xZHyUXHrZ4TTCnXKRlL1Lcpre3Pn3LxAn3K
         /m/dMZQsb1ek8AbATY7JiT4FMVQrf03kAJd+HPMd7Rh+roVRXX6aNf3GqL9avg9ui9e8
         cRVA1StEpunIhls9j9rsniXhT7iyM5XNXGY2R4OQNyYuw39xnXec75mnk+myKC/iYS76
         l/F/4NV5jrx0VFfRzX4cxjrF8olhUrRejJldW+/+Kzc7JGfdiVvn1FKplEIuEUaOo2ti
         UZkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OsB1Iq33;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=srQx4qy5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=srQx4qy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16si7049094qvf.16.2018.11.10.00.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OsB1Iq33;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=srQx4qy5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=srQx4qy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOP6-0003od-Ex
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lK-7c
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOb-0000VV-4N
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOZ-0000TH-3g; Sat, 10 Nov 2018 03:13:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 647B25D19A0;
	Sat, 10 Nov 2018 09:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837610;
	bh=o3KJuqJsYNukd/ec4ozLQhf6Dd7aHydQxO2sBiH7PrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OsB1Iq333zJrDHsNHuYugMHTB61Uku+UNd+hKl/9CJGOHi46E+JwP+34ghnhqpSPn
	WTNrSYQ94UHYB/p1kzbQ1xusfTQe1ACy8ry0+wigdh17PovSe67WRJsYWnz6fQbE09
	Q0HViG5xb4kFDoQ5ghBAUYjZd2Y/vaNrtMAcet8E=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=srQx4qy5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=srQx4qy5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuEp5LoA9k4I; Sat, 10 Nov 2018 09:13:29 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 880AF5D19A2; Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837606;
	bh=o3KJuqJsYNukd/ec4ozLQhf6Dd7aHydQxO2sBiH7PrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=srQx4qy583OeEKIFPe8ORl4v1mIgROhvRGhz+sH3+YI4CCmHQFG/cX+TmTbOPoB0W
	lKcna6b/SuPjaZEBw8SSTHZJH04gS+haaGUHrNhom/Y0Q4Y6T4IMU91iYwPTs1a6UA
	ZtAMGmsT3gVdwBI9k52rEYRW1378PbTJ1Q5ug7rI=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 14B156FD86;
	Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837606;
	bh=o3KJuqJsYNukd/ec4ozLQhf6Dd7aHydQxO2sBiH7PrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=srQx4qy583OeEKIFPe8ORl4v1mIgROhvRGhz+sH3+YI4CCmHQFG/cX+TmTbOPoB0W
	lKcna6b/SuPjaZEBw8SSTHZJH04gS+haaGUHrNhom/Y0Q4Y6T4IMU91iYwPTs1a6UA
	ZtAMGmsT3gVdwBI9k52rEYRW1378PbTJ1Q5ug7rI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:43 +0100
Message-Id: <20181110081147.4027-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 12/16] gdbstub: add support for vAttach packets
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
X-TUID: Ss6+sTrDuy5A

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 4132227092..ba365808db 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1340,10 +1340,45 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
                     break;
                 }
                 goto unknown_command;
             }
             break;
+        } else if (strncmp(p, "Attach;", 7) =3D=3D 0) {
+            unsigned long pid;
+
+            p +=3D 7;
+
+            if (qemu_strtoul(p, &p, 16, &pid)) {
+                put_packet(s, "E22");
+                break;
+            }
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
2.19.1

