Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749781wrt;
        Fri, 23 Nov 2018 01:19:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U1Z/LK+U6azhugsDV0UbEpFGu3Tltn9jAlPOWUi8f04lYeVgoqtVBPdJBuHIeehvPXKeRr
X-Received: by 2002:a25:a524:: with SMTP id h33-v6mr14778262ybi.16.1542964748095;
        Fri, 23 Nov 2018 01:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964748; cv=none;
        d=google.com; s=arc-20160816;
        b=hK/9e5TUSw5E0rjzNp9TXNvD99wnyzI6eu6R3Ku56xeptSZ15PXc+DhZACu6B8KanZ
         iu9hkY9fzS1LdCqammAfPgDMYmkyBDchGQ9jCcJuiNEV2jxQA+c1718hAQFT7JAN1wRk
         ddrr8wzc1LW8T11l+zD+QSmjx7wDP7CrXbImnckOiTYCizIpdKS4Lj8+oJ9hil4cqpKG
         GfqFSRnHldapE9FUv8Xr1vy5vjL1pvZem67zr6JCXY3/vmGkybjy2McHg12ox2tJs67u
         +VnZ6dd6dh3d4fErUp0WV+HW2yVyu4x1l4IxLf6Dk7oCwDVVANqSDu8JxUr00/IDtQdP
         rtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Snkj6usBcQ9H6ykIJfnWmtMF/sv6sXJ50d2nXVYK0GM=;
        b=DaWr7psAh6n59Ca4hcnh4GGLCvhGHRju1Zbu6x1wPopymnGEQkISpX8qaibB2+tnin
         Kfp9iwmAHn1Vbj9pJAkOn8bPXOsQGXW7pL95NyZdWrnq1KMCYG0HVPnfNHNEiBBncqfl
         5qrcyJO5/nUjKT2UzZ/jWt+AbYdA46C6reJqn9oOotTVW9zmiaL1WzZ0Ux4yuB6GTzpn
         4kLa7Ik5QGKjrHlA3XWJxKju0OTYlI9v/wqXMv/EwdNQ5riWe5M90DvHnuyjCa6/p+eB
         AnHsLDeftbAx8HnWpMwVzcjJON9MumTRm7jrmZLXqRQoSot608AWe617aS9xo6jcNjl/
         IvZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=a77zgQOV;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RjSG8tT3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RjSG8tT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66-v6si15653830ybg.189.2018.11.23.01.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=a77zgQOV;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RjSG8tT3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RjSG8tT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7cA-0000qb-WE
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:19:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007ob-Me
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7au-0000Zt-N5
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7au-0000Y4-8D; Fri, 23 Nov 2018 04:17:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1D2985E7087;
	Fri, 23 Nov 2018 10:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964659;
	bh=KWnv+BCREvO88TR1E8yg4ZwgSZXxBwfZvq3AB6fsnN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a77zgQOVvuSMTXz29wRETKvr0bUbYiSb6TX4UEuq+2XGtjl9s+bC8xMCFpNv8iomG
	xJRgniIzvnWfMC4+qiZglAqyWxT2P146RVUU4k9qBRAZ8eHEoK1ljDDa2pM7HOH+TA
	Acw3B6w6wDU7+o/tgxgYyxIOlLUsAyKb1ns0Oq8M=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RjSG8tT3;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RjSG8tT3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hH-vmpONDoa; Fri, 23 Nov 2018 10:17:38 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 320EF5E7080; Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=KWnv+BCREvO88TR1E8yg4ZwgSZXxBwfZvq3AB6fsnN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RjSG8tT3QXf102vF8Xkt7kuxKOYYb4ctTVNwSx3frfyruRch8pjlxBvnFG7DqVl5s
	SMlwUOD0f8LyzC7wufHAAWNscG2yMgmM5KxiebSl6ZfdFt3drlv0Yxv9Yr+nnJf6tX
	yDSzANs6cew8FqjZo6Ujqxyza0U6FvHJqBR/qY9o=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C6B025C025E;
	Fri, 23 Nov 2018 10:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=KWnv+BCREvO88TR1E8yg4ZwgSZXxBwfZvq3AB6fsnN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RjSG8tT3QXf102vF8Xkt7kuxKOYYb4ctTVNwSx3frfyruRch8pjlxBvnFG7DqVl5s
	SMlwUOD0f8LyzC7wufHAAWNscG2yMgmM5KxiebSl6ZfdFt3drlv0Yxv9Yr+nnJf6tX
	yDSzANs6cew8FqjZo6Ujqxyza0U6FvHJqBR/qY9o=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:25 +0100
Message-Id: <20181123091729.29921-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 12/16] gdbstub: add support for vAttach packets
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
X-TUID: PtrrC3DNhj32

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 5cc643b9e0..69471ea914 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1342,10 +1342,45 @@ static int gdb_handle_packet(GDBState *s, const c=
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

