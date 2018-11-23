Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1753641wrt;
        Fri, 23 Nov 2018 01:22:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V+Co9M4ydzMkA+C74CTNA/MnSQKHPTleESn1kowUrjYsYEEJ1qR84IEo3xti38uNZnbd3Z
X-Received: by 2002:a25:d304:: with SMTP id e4-v6mr11037940ybf.392.1542964975313;
        Fri, 23 Nov 2018 01:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964975; cv=none;
        d=google.com; s=arc-20160816;
        b=sI2BCfBMDByrKtpz3NBqGHI+osR7HkpY+NzU5YJZfQHSVCc6VKvh3LI/P8A/BUBiTB
         F6U05BO5foUXn0qrJ7SXsCdQXJev3saHMf/1dS5v03KMEasES+UBJAXnLjYHY6XE6A+C
         qHh6ADR/auV3Hfj6aW0pkHmk+/yK/JnBGheZv0EmTZC2Pja3Ta+96xTDPpZb5IqLETFJ
         Lw1B8vwW0Ao8a+aqGumJQLocaL7GawCaruH86GrX9ADFCrSj9QA4O2L5zQB2TtYPSUeD
         KErg2fy0s0vJCCRjZrjOTl3ppELNDI76BE9mZ7rLuzTmr88xP+qTegf/bkBzL8Go9sNE
         ziGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ZHm6ZcsAFu56XvgejJ3CaT8mbwFZ/fIi2N0O0MCfKiU=;
        b=o/b13XvCOYLorr3Lm7A4av6dUtTtDWOIF9600lYE0IVL/6Da6F/o11b6WOJjxx7+XF
         vOpkmwLu76triK+F9bQ2UwV/waLDMvjFsFzwfFn28sKCQsv4I58+sN7AZ1YIvbp9PfXJ
         glVwxo+cO13a0GpvnY+nKfn5NDG2fqfBwRL+UGrVsCKyDxgNpepOMvqXYkuJ+h6w8bLE
         mPfGMm5k0A+lcQyVpiBuzry93QoTaWqy/0vBY/YFl8y2J3wbHmhC6MCCuHc/ax202GOG
         q9gna6mk4KPXH3FImkuDVCdqUeZ8+mQN87WODWJDKTBBVZm0irQ4ga1J59oPA6mVIPny
         6xjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bqJ5X+yb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=jS1M5Ym3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ob85STlQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v70-v6si33097412ybg.412.2018.11.23.01.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bqJ5X+yb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=jS1M5Ym3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ob85STlQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7fq-0003SQ-Ag
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:22:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bQ-0008Ng-T4
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:18:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bP-0001rQ-7P
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:18:20 -0500
Received: from greensocs.com ([193.104.36.180]:47080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7bE-0000Xv-RM; Fri, 23 Nov 2018 04:18:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0C4C25E7088;
	Fri, 23 Nov 2018 10:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964661;
	bh=ZLuPgX6ec2FObaTIqeyzjk4B3ZvcrU3B9tfb5cjhetg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bqJ5X+ybZB2Kq2oLvBW4v5X7utOc+YlA+IZdbpj6LCTMLixGX6oAjy9SIhKlv19k5
	CZbMIjnkkzY+88vewec03IrGh1l1onr2FcgXXoK4S4GV4c0OxLEacqb2GSf5kHAmqA
	PG7d8gRlCnWSM/WAWoe1hlAcCpT9P1wMco7yTgOY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=jS1M5Ym3;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ob85STlQ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hk5S3Q6FsPI; Fri, 23 Nov 2018 10:17:39 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 0F3EF5E7086; Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=ZLuPgX6ec2FObaTIqeyzjk4B3ZvcrU3B9tfb5cjhetg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jS1M5Ym3Phu13bvNX7xJvaeh9vANJdMxcJzR70s5Jju3GMbHZbtoPXfZHN9aDC+IG
	ic4RzdxDi4L6W2AY0Oy4a88olQqtwwuidH8B1JgbmKAraJkeqE7AOwMgPZ6Yw5SM4k
	qyGLevDD7iEGRAUTX1wefhtbV5eDN/h7bsC/0kFE=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9CBCD5E7083;
	Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=ZLuPgX6ec2FObaTIqeyzjk4B3ZvcrU3B9tfb5cjhetg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ob85STlQL5AgV8p7RG3b4sVaUoQReC2MvvvTUUaLmjLYPAvlZB/mNUEerr94pFMtM
	sx2mUfgkBxFEykuXxwBH2A4qUxpwM9AzRtOsHS12wK7RzX62W170YCdGuZ7v5Rlx3c
	tVlzKwHzLt1m0fsawClwjeJeweYY/n+6OzjPfp3E=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:27 +0100
Message-Id: <20181123091729.29921-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v7 14/16] gdbstub: gdb_set_stop_cpu: ignore
 request when process is not attached
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOnHA/4/O9lr

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB gets confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 6518324d46..6fc1630643 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1791,10 +1791,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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

