Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6798001wrw;
        Thu, 15 Nov 2018 01:43:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5d3ym3Rf5jgQnA51DOZim0kPwpiABXs+FQNs/+OBZPplQd5ExAW/ir12dRSMoyBZznOTLEf
X-Received: by 2002:ac8:41:: with SMTP id i1mr5324730qtg.126.1542274994105;
        Thu, 15 Nov 2018 01:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542274994; cv=none;
        d=google.com; s=arc-20160816;
        b=x158C+mz2QGdeGz2xupC/l8cbUrnXbDxxvRfyHwgxqxvdGFGnI0u5wMbCGmAwJ9o0P
         X/jnfPKmexE+tDlcf8dtXp9Z7wK2675Uick6RPVLAEDyDFZcqejhHIG+sMixhdI87sIE
         CHUU5NlO6fvkQ4UoSL059vjGbu7fOOntHOYwtlhYJ3fjbQmbQLjHnb6oQ8DmhaxmPycM
         7V1QZraMTY47IntLGNbfTPlfOAycwAuCGBJHA3NgGSjkC9BELuOnNhlF53vFhbSU9/Sg
         XyiznKld8jg+R5/MILOHpnnVBnr/n2h5I5pprimELRIA1BPSdxBRCjSz1QzArr7NUBsT
         +TFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Te8DUItEfi5FGl9pCgp1QX988NWljFJrEwahu9BGtH8=;
        b=RMRBBedUxxMwBf6mfq43KVoY6Otiv9hvpmVDdPEGe4Dq9flKwwY/5mdEEna82LBEdi
         ry+ywhl1bd9xlMEJzWNApCbJZDu/nfCT0kVelNmXywcd17pt730YVeToUrRXh57SLjpc
         I0OLimyQiFGaLNmEhZ+9vaOtTT7uq7b09hVIsrwQXD1uunwfL//8VjrRca3KKy4BxecR
         GhP4TLS0M1abn9jkl5xmMcpduMud3pszYxkP7Ay2dQNLg0V1t5a2RKE6RJTIb4GGfEpL
         e8h6UG4luwOzNwqMy49xyWEMbZ0XAbdfjITTy20zAZygI80TmHJWC5oud0pC00f+4Miw
         tp5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aoa52CNh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aoa52CNh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pDd0cKIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si2843202qtn.132.2018.11.15.01.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:43:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aoa52CNh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aoa52CNh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pDd0cKIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEB7-0007YJ-D5
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:43:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAc-0006zX-L9
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAY-0004bH-Te
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:40 -0500
Received: from greensocs.com ([193.104.36.180]:41904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAU-0004NP-RJ; Thu, 15 Nov 2018 04:42:36 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E4B27400FE4;
	Thu, 15 Nov 2018 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=9Lroo8lp/NrsN5CPeEin+WNWgbyuC7KOEH8dyRxdbv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aoa52CNhhi5eV5iI+pBG38VFZM//Mm4GVbxZpXPq1kK4EWbwcuPOoQX4Qwf3xmCJi
	51Ey0too37A6H21z0/ptCo73OFcLiIxRycI2/78mlVYYAvEQnti4BxEnGl7zfAsNeI
	MkZJvx/kX6DW9Cg2gxQ3dp/0Vhr/sgY458I6CecA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=aoa52CNh;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pDd0cKIw
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIPpuE792Sck; Thu, 15 Nov 2018 10:42:18 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 08A6144325D; Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=9Lroo8lp/NrsN5CPeEin+WNWgbyuC7KOEH8dyRxdbv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aoa52CNhhi5eV5iI+pBG38VFZM//Mm4GVbxZpXPq1kK4EWbwcuPOoQX4Qwf3xmCJi
	51Ey0too37A6H21z0/ptCo73OFcLiIxRycI2/78mlVYYAvEQnti4BxEnGl7zfAsNeI
	MkZJvx/kX6DW9Cg2gxQ3dp/0Vhr/sgY458I6CecA=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 343CB441B67;
	Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274937;
	bh=9Lroo8lp/NrsN5CPeEin+WNWgbyuC7KOEH8dyRxdbv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pDd0cKIwnSxhkx+rhz4E9vc5vzZdwb6VHlt4kCi6UYCf9z3s53XkQ3EcDmu5uN+f/
	90kbqU+85K2EhnALZc6YeaQpvvXBKENFd1X0d9wUBPNIKLQJxSHGhAJIr+Ax6P7uwV
	/nLe7jRlnaVSMYv8+ql65gIkg35gIuP64T3oMsH8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:03 +0100
Message-Id: <20181115094207.22846-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 12/16] gdbstub: add support for vAttach packets
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
X-TUID: U6B8aAeIFu96

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index ada53ac559..0427d1c4f0 100644
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

