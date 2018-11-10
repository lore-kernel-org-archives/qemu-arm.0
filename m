Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp808338wrw;
        Sat, 10 Nov 2018 00:14:42 -0800 (PST)
X-Google-Smtp-Source: AJdET5fGlTpDDWxybrEVUSGk7azU5agLD4uTP7PDlEEJ7XX7fmW3VdLaq2oQcCUZusOOzjB6VbQ6
X-Received: by 2002:ac8:7691:: with SMTP id g17mr11640003qtr.388.1541837682500;
        Sat, 10 Nov 2018 00:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837682; cv=none;
        d=google.com; s=arc-20160816;
        b=HfB4e5HDpqiw4R1Gmvp9Iv0wTkt9jS0SHRDoX/ZDbCXJwhT/NMjVr0HODwyjrdpRol
         eVNLMnvYcJLqRiyRNFJe/iN9EaTf+49OM3+0HiC85Cz8lw2GXhM33Pojg3QAncDNAVba
         LIJGW+/pG5C5aHEH0Fw2NJaVrey9PRGftfFaXF/sKLbds1JcWpupwJlnuzp4xqs8Wdft
         NzcPvFbLf23Q1UBSmGYmCbyW4rd96d7je2NhsQSGqCzmnDfjt/b0QcdfcYtGNcKcgJiy
         ikhzr7V0Mm5r4Tx6k93jIYbPu6mUsRV4tCMHo5uvPl4DOjCAbEOXTlKuNrK+OgJbV4wc
         jlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=K+mw18cvI1/hg8pA1YK2tECF6E6Yb6mryjYehLVujzw=;
        b=i8dnW5TDlVFfz+Z/Idtl60eqOei5Q+CnleHUjCnBTXDGl7uyXHJpf7bS7FEAN3Um+K
         j3iKWpzxcTH9DrHHg+I8AojbRkptHRBdMkGLm0IfNnn7JKdW2inQBrAEgOixKImORJyT
         pDGFsDfr/BJ9wv11UO9J0Dkxzwx7JyaWeJ94ntSgRg8BscCnd7X5m+VMzX7Wfynkv+4F
         U/90VDdVfVJnsaQdkxCYe7HgRUXHQsvEwShi0/5RNBJHuwDCEAy/LTQX8R5DFQtMQjgp
         WAEsckViTBiQd0tCKHtyuDAgzQxPwcT9mUPQHFm4KoScKBT5ydG+vji9GIbZVneL+BTm
         RfhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kMBycxR9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PxK9GhHT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rVhtYt42;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d127si3874731qkc.211.2018.11.10.00.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kMBycxR9;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PxK9GhHT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rVhtYt42;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOPh-0004Ld-Uh
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lF-7M
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOb-0000Vm-A4
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOZ-0000TJ-4c; Sat, 10 Nov 2018 03:13:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AFC5D5D19AE;
	Sat, 10 Nov 2018 09:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837609;
	bh=rBCCagqSrFOEU0nfuOIRvEJu5ZG6NSRyLpjqwKGgpUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kMBycxR9kXQJI1jZiAiiT0hn6szJXz5lksnaO3FnXRS5cmakz6yHiwlmrIW2FgHtX
	hgi152CmSpAXiywMehxGOzqOZ9Oz7utn+g7gjBGTa1In3+e4GvL6yFDpZACXaAgbkK
	pHbVHbG6sFOeAdhKZk6jcc5kQ0GeIFxgILp29fR0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PxK9GhHT;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=rVhtYt42
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bdH1TijEq9z; Sat, 10 Nov 2018 09:13:29 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 2D0B55D19A0; Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837606;
	bh=rBCCagqSrFOEU0nfuOIRvEJu5ZG6NSRyLpjqwKGgpUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PxK9GhHTDLQBcvUoxCoi7BPLJgeOUxFVHxHbFt55FVWoOS/dqx4gIlcc+rrARRct0
	t9XNJK8PTADGH+h0vzOHfPelm6gT28uyWRgpxttwJFdDHRVLpvFujnKe/rrMQseCeD
	ZFcnVojRxDZEPEhaSuKoAJT4GVOEfPhkdZEFP0qI=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9A2AE5C024C;
	Sat, 10 Nov 2018 09:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837605;
	bh=rBCCagqSrFOEU0nfuOIRvEJu5ZG6NSRyLpjqwKGgpUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rVhtYt4289vPTW5i0Ay/KvNWsvFrKw0WFmulMaYBdBGSEbDWxaIkGkSwNUHDb8ELi
	H1itqpOfWEeGKFU4cbUrZ0c+zxo+5BlHImVDPpLJbQnJM2iPCX2FrYUhcFHI3y3hjs
	Kp/kz9luajXukCGRdbQ3/vTKfcaRDPpbwX9IyNL4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:42 +0100
Message-Id: <20181110081147.4027-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 11/16] gdbstub: add support for extended mode
 packet
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
X-TUID: jc8F/lRQyx3F

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index bd4895ac0a..4132227092 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1294,10 +1294,13 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     trace_gdbstub_io_command(line_buf);
=20
     p =3D line_buf;
     ch =3D *p++;
     switch(ch) {
+    case '!':
+        put_packet(s, "OK");
+        break;
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
         snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
                  gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread=
_id)));
         put_packet(s, buf);
--=20
2.19.1

