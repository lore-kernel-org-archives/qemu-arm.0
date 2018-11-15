Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6806015wrw;
        Thu, 15 Nov 2018 01:53:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5eMcS0o2K5hxKxrYozgyteBa1c/gRKa6SNnXVoIvRBk9sVvE9aCMiz1N19BGHO0ftb46D2e
X-Received: by 2002:aed:36a9:: with SMTP id f38mr5402249qtb.367.1542275630568;
        Thu, 15 Nov 2018 01:53:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275630; cv=none;
        d=google.com; s=arc-20160816;
        b=w0mRgRF0QdzuNeHFyLWT0P6AsNuJxjOuZ0nanrKdM/DBBk761ANQKrBqBafXJC+BN7
         +n0eNzx4UbnQWnP15ZQhe8xT4z2FaAX3OdgwyqCYw6bYTI30DAfBRdxlMAfx/xh3srJC
         nrvt5GTyYNN40gXKA3HBq5DJxTOQOegEd2pt3cX1n+F0EjKegY5g6jI1aHKMFbZIbQ4j
         k6nV1zzvNQohYmFrtdSxVsW2BK1bZyQNYIMQEHUmvZrqdQXD0x768TpUE8mnJBeD3tnp
         pLieF20vReulRN9BgCfi7vpXR42BjHpks8Tc2RrX7fO6f99YHXVWT+UzkG7QBofwODp2
         purA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=zPcHDpP+guj8LX3XIm6/wG0saJ6++TWQp8jHW9ZPMJ4=;
        b=lD6/kfU3JgSq6jAE2ND7t3bGEvbbSLo1keP+wBWmLSWM5r2ZhzmLK67gT1+/UXVuge
         dLrQwIRBUMxNLTN1/Kg3aogNdcCFzOl4fUo+CD/YAGcrsmdbpxEjNSdop8V/FAxz2s8z
         dSh/RlolmDReJFCOM+huf0TPXK7qjMBMp0nfTG5ANz9UfkOAQ1QYe9ZoCXBV6uh2lwMl
         u9e1/NyPRdE5yhNxU1HRMFgolG/kE4xb/11jH1mMfgF06HQq+vCc68lFYMXoelpGwGl9
         mpzUvA6bUq5dDBNhBxVRAru/ZDPVPnYrc3+6MSR5sCEq/ehjYNSWVvzDuFvIiWYSVTwN
         m9qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2b+o51QY;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2b+o51QY;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=C5VGWyWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si3668843qkz.65.2018.11.15.01.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:53:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2b+o51QY;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2b+o51QY;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=C5VGWyWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNELN-0007ha-Tg
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:53:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAm-0007PL-N3
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAk-0004lj-C4
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:52 -0500
Received: from greensocs.com ([193.104.36.180]:41905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAk-0004NT-0v; Thu, 15 Nov 2018 04:42:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B2C07441B67;
	Thu, 15 Nov 2018 10:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=5y0tKMHMdk7YdAq4Id1MBSsyrMbMoeOzN/P9UoGb6YU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2b+o51QYRoStLw7FwLpKZ6bFw6mD/aGe3LYGffCPOE3uevzHEwn4vgwS7Qq/HG59d
	pGgNNB9a8O3HHZG4nAa14fesd6clJsBXQH2TZj5+GkL3GpQxamYuQAdG8yuEy0nkCn
	dgnNvMcxgmpnlfHrkwNVEmnOHV1++IA4C36z7StQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2b+o51QY;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=C5VGWyWN
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYHPFGZEkf8b; Thu, 15 Nov 2018 10:42:19 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 01935446865; Thu, 15 Nov 2018 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=5y0tKMHMdk7YdAq4Id1MBSsyrMbMoeOzN/P9UoGb6YU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2b+o51QYRoStLw7FwLpKZ6bFw6mD/aGe3LYGffCPOE3uevzHEwn4vgwS7Qq/HG59d
	pGgNNB9a8O3HHZG4nAa14fesd6clJsBXQH2TZj5+GkL3GpQxamYuQAdG8yuEy0nkCn
	dgnNvMcxgmpnlfHrkwNVEmnOHV1++IA4C36z7StQ=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 649A4441B57;
	Thu, 15 Nov 2018 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=5y0tKMHMdk7YdAq4Id1MBSsyrMbMoeOzN/P9UoGb6YU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C5VGWyWNyIMRs0MRiVZ5LRC9hcK3i7OwsytPU+Ht/zglKDs7OzEHDv/sl7j0fGvgZ
	nVEWj5gEgatipdfAoBd0YPTwE4b+v5QTx+S+9E7VSAp753LCRIc7hjRjynKdweF31n
	aq3k6+2dx3QolguN+LwUoQl+oSR9Mwx6iEJcfwM0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:05 +0100
Message-Id: <20181115094207.22846-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 14/16] gdbstub: gdb_set_stop_cpu: ignore
 request when process is not attached
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
X-TUID: 7bimhXP4OmNU

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB gets confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 59eed3b878..89819a6a72 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1787,10 +1787,19 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     return RS_IDLE;
 }
=20
 void gdb_set_stop_cpu(CPUState *cpu)
 {
+    GDBProcess *p =3D gdb_get_cpu_process(gdbserver_state, cpu);
+
+    if (!p->attached) {
+        /* Having a stop CPU corresponding to a process that is not atta=
ched
+         * confuses GDB. So we ignore the request.
+         */
+        return;
+    }
+
     gdbserver_state->c_cpu =3D cpu;
     gdbserver_state->g_cpu =3D cpu;
 }
=20
 #ifndef CONFIG_USER_ONLY
--=20
2.19.1

