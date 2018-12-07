Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp239383wrt;
        Fri, 7 Dec 2018 01:05:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X0PB0iZXL7qZNfKUtXfeWZSJb5lxdgEJ5o/GQ6YkctXzzKZTIwBTVXRn1pRas8aUjqrCA8
X-Received: by 2002:a37:3c06:: with SMTP id j6mr1074574qka.298.1544173499994;
        Fri, 07 Dec 2018 01:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173499; cv=none;
        d=google.com; s=arc-20160816;
        b=LEUNjIVMWlrLmCUp7Pxorl+IMUs1dtQB9vPKr7fRrLrgmvGA/b1cOwhoqKunDHGdA4
         Co94DzEUntAwDd7tOn08SPyqc5RvKN1OckxFyo0miZVd1ftyjUKluITqzTuzHhvu9VXt
         BBbaGMMUWQPD0RpnBQKt0jjt0wa8Nd46Itj+vJ4v7q1V6EliK8GdbcT1B7ETWlqHkobQ
         zpaA7tpmtEHPYG2K9gVXZMiSHxLJxy8SjeSf4IORP2m+3Jb0nkLIJ0otWSMDrA/zlKZF
         nNdSwdE6NL+4k8Q4PsmoLIgU6UzFbcm7Jmho8pc2BNZbIl5Tzcg4qP9mA2Sp72CLUt5Z
         Ne4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=WP7PcRAg1ybVoGxS4kNJashfQxW1VFRsj37imzoIlL8=;
        b=yu3X7IAfPmrYQ5JBX1XjpCuo1SwC1qPiOfG4iP0wYHj90KQwWdp/xYiBGZ9GsJNKAQ
         sIj+eXHLmiN97rrJ/OfJcGX9zwybfmaAUH+2y8qDTtF+Jn2QWmOqD20VQngi5zL18WjR
         wHGVp84/KnZE6k5C44SZCeZGDWvGvQGEETsaEW822ZIMXzNgkupQ1hvA5cRfor/7H6Yf
         kuuaTRG40JhDV+YbBmX5v2ps1qWmiZ7s2csOrWkn1mgzA7u7hNW2Lka3MIAOg+B+5XGL
         l40s/Vr9e/7/OHhXW3Rb3wKJ9fQXjqoJgSmsLAeBJvzkuywPna+aCWF69GYPqAbgnLsQ
         EjuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Pi5DYeNa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="nZyw/Xah";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="nZyw/Xah";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s16si304057qtk.382.2018.12.07.01.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Pi5DYeNa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="nZyw/Xah";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="nZyw/Xah";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC4B-0003Hr-9w
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:04:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1F-0007sq-Ag
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1B-0005Sa-Ou
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:57 -0500
Received: from greensocs.com ([193.104.36.180]:52247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1B-0005Rt-Ax; Fri, 07 Dec 2018 04:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 10E7B511C5F;
	Fri,  7 Dec 2018 10:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173312;
	bh=1YfOa6KOFz7+7vzadhdXswLweJ5s+84SUWufA2FeAHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pi5DYeNaSgvXp87NaMdAhQ2JpNkSboV6FiIEOXJ5JAfEDuRSMcVYathp/HIIU23ur
	LLES74ZBZDKmh0p+1jSsxjdCGZTz2N/jj4Knto7YXWUarNY9jEoySHsqQY/tceL3Oh
	HGs5IJQq4eZRN5XShyFhpzONVyNfzbo6cgOQ/LSo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nZyw/Xah;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nZyw/Xah
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOZfpkmDVJnh; Fri,  7 Dec 2018 10:01:51 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 4DD4A48003A; Fri,  7 Dec 2018 10:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173306;
	bh=1YfOa6KOFz7+7vzadhdXswLweJ5s+84SUWufA2FeAHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nZyw/XahwVzHrG7ZGAbNtnnd7P1onfGeibw1RiutgNeRpff4WRvFiwRp/I28HUobo
	gEo8/BVCTqL5Q4liXjfuPr7qinzMm9TFr4r4AP2WSnCb+ffvYqEyjl6sYj7CwOUEQ8
	ZUXlT/kmBIuqIrLAzKh0yx8bVEjrkby29iRL5kmQ=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D31C4480037;
	Fri,  7 Dec 2018 10:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173306;
	bh=1YfOa6KOFz7+7vzadhdXswLweJ5s+84SUWufA2FeAHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nZyw/XahwVzHrG7ZGAbNtnnd7P1onfGeibw1RiutgNeRpff4WRvFiwRp/I28HUobo
	gEo8/BVCTqL5Q4liXjfuPr7qinzMm9TFr4r4AP2WSnCb+ffvYqEyjl6sYj7CwOUEQ8
	ZUXlT/kmBIuqIrLAzKh0yx8bVEjrkby29iRL5kmQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:30 +0100
Message-Id: <20181207090135.7651-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 12/16] gdbstub: add support for vAttach packets
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
X-TUID: BTBJmfgXK+yg

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 1cf1bea428..8601be533b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1347,10 +1347,45 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.2

