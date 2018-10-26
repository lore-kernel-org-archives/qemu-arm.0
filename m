Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp446185wro;
        Fri, 26 Oct 2018 01:36:58 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fd4wDGlH9nQsr+4UoJAzuqq7md9qLK3dv6o9PmSsiQRz6GWIPFlLNR3FqFMBnrdWvowlBX
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr2121548qkg.184.1540543018759;
        Fri, 26 Oct 2018 01:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543018; cv=none;
        d=google.com; s=arc-20160816;
        b=Wk1Ok+a6akev/lD7zxWR2Y6RjBuyaOsBwsP4TUPhdPgvhikugedJdG01HlI7XHmiJF
         3a62dbGR2DE0KoGntgay6LhKcqjY3gw2qgXvZfmfB82+tI/wAbHO3sWUCpSeVBUPG/73
         TDEUBZvmnw3nqDI01xZvwHuCNyVQoJOlC5aoVB3LdmiFysgIpojDdQZasnX8g7CEAm3j
         CDkr2IvIAseWThrWqAjQFDhg9TKsARMx/QI3fgpIr1RTQvNDFSKD/buw7JLzeYAG5ntn
         U5tcbFaXUlqTdbRPKkW44K+3VtytpHdLt0ewLIvQ7jMxJrI5Q9rWlEqTexiRpDjyyBAI
         x9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=hRKOL5mskUICHkeUqxmE5lulaekrixb1mz0eihB4DYU=;
        b=olVpy/Mj3bBdUoUZy2NNWVY6P9pgoeaUdVS+0kJeh0e1TUl00MUAMVL2fQrPq7LKM2
         FO3LEesf/YmGjk+KcAJ5gknk9OXfong6hsh7EA598szk9tff18HJHc2aLBSP8pBeVLWU
         P/8EGYgHP6zzKj44EEI7cFoROT010mum810g2ui05oTy1214Jsakj0LtujnZ/+T5UOb0
         OdOdNWYOjKjnAIjA43fSs80yJQzvXSVPgvU2k9DbnelYgtPHEPzRnsgMrl+Q/NxyuNRa
         rT1utqmwteVPm935m2icyvTeo6TAic0dUaHMIYvDW7syvWupBezNKncJB3AbEPq95M8U
         9+TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iKZRF2jS;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fSNzYhn8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fSNzYhn8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j54-v6si3830876qta.341.2018.10.26.01.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iKZRF2jS;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fSNzYhn8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fSNzYhn8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxc2-0000zB-79
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:36:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUD-0000LS-5R
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJY-0004yZ-K0
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:53 -0400
Received: from greensocs.com ([193.104.36.180]:45408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJT-0004ll-QZ; Fri, 26 Oct 2018 04:17:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 74585441B45;
	Fri, 26 Oct 2018 10:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541841;
	bh=rD9a4K7ZyB7rSOPQ+3dwrMRt9gvBTShbRNlnFXihPlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKZRF2jSa8Dvgxj1HmbX0oro1Egggd2a+3KqU2pgP9qmZpcbr4ZqwqblK8/MgC9Nn
	DhyM81urJ+acT5Kd12uuEgYrAVdpzp83teFemZoH1rqya7uWqeqTDiZPEWQDE98lkt
	dzggl1vlgjroXkCuvlqy/yNAfenP6xKXMWyLfJ0U=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fSNzYhn8;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fSNzYhn8
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXxh8FMbAaEE; Fri, 26 Oct 2018 10:17:20 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id D2A99441B53; Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541838;
	bh=rD9a4K7ZyB7rSOPQ+3dwrMRt9gvBTShbRNlnFXihPlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fSNzYhn8i4NeRzAk1dRhJMCAMbpVdVUOgxqdxVEp4pxkK+eJjulSV6erlgN8g/C4A
	sthT7Myv315hH12Znv2FLq6FHKMQc+2ZNetkpFE3B6wrYJ22TuPcgaR2Ydd5xz3hdJ
	ighLMjOSdFXf/c1jshD/qh11iJxNy9Z5Z5S/6ikQ=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 621B2441B44;
	Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541838;
	bh=rD9a4K7ZyB7rSOPQ+3dwrMRt9gvBTShbRNlnFXihPlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fSNzYhn8i4NeRzAk1dRhJMCAMbpVdVUOgxqdxVEp4pxkK+eJjulSV6erlgN8g/C4A
	sthT7Myv315hH12Znv2FLq6FHKMQc+2ZNetkpFE3B6wrYJ22TuPcgaR2Ydd5xz3hdJ
	ighLMjOSdFXf/c1jshD/qh11iJxNy9Z5Z5S/6ikQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:51 +0200
Message-Id: <20181026081653.24602-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 14/16] gdbstub: gdb_set_stop_cpu: ignore
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
X-TUID: 34xJe1dzj54G

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB get confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index b3461eff9e..09480df2bf 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1784,10 +1784,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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

