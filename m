Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3739602wrt;
        Mon, 1 Oct 2018 05:06:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV601Cw+HuqoIL7Puu5lf4FaoSQcH3dmDE56yzJSc6qbA7LKGNKmCxqW5r+1rAR1N36VdVroz
X-Received: by 2002:a37:cbc9:: with SMTP id u70-v6mr7911368qkl.139.1538395597158;
        Mon, 01 Oct 2018 05:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395597; cv=none;
        d=google.com; s=arc-20160816;
        b=ntV65CFIe8mTvzYIJhChgI57fK3Iskj4xlP5rtHTPYtwwpdkrCMsV2d55oU8WAanjg
         2J0yRzdMY1Inv4eQ31JXyYkRyjMr9pFxdpEDslJhNK9j5Q43LfANcbyTXkkalEnfRMym
         oPieKSeMkK6qSeaXCfyi8fLwGYOFi5VIAxTUwpevdlv4QOHXxfhEgfmBoQddblhJZg2X
         LPAz1VqbNc3WaIn/Y9YycM+IDM0VcB5yuFebQ7YyWNPF519NmE5VTQuyqrPAUmN1T4GB
         qa0M2xuldJud/fKr0BBRe695CBzT7fl3+W19cYofwsk5L25aBmAn255NQmh9jcPRtc75
         ad0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=57PjwtR0MtdckqWyuqafDw6gIr04Z1c21KH/o+aTeZg=;
        b=HCtptcnaKYZlIwbmC+/lUjPckRe7+nsHtxtGj7bAk/FUgIaVbzmB5oR9j+7RtS6Rwo
         Xo6dQsEpw3WA19DJtAn3qKm4UW8GeKRakPjkJmeMa+g7oBjj1BRTFOM8bP4RqEi8mVHT
         EXQYiPQx389ru/EPXeZU3G3feeBRQpt8wmve3q1yzGsbAkOkGVW+cxB6KKupvifg9gnq
         MzpqM4XHSrO+g42HSax7Cef6XCiJztlB175X+W4hIU6ZrEuKO3FaWgf2kzeRsRxv1CTE
         x/phoqETotloHZXuaKeiEWbdzd9mWxjzxYteDUuqSMZK9IYxatTfw9Qx12/AJhXMRYRQ
         o6iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zimx3OPg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IuaE7kuN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IuaE7kuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y28-v6si2148826qty.161.2018.10.01.05.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 05:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zimx3OPg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IuaE7kuN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IuaE7kuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wyC-0003Dv-ED
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 08:06:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpl-0002iE-Kb
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wph-0005zF-Nl
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:53 -0400
Received: from greensocs.com ([193.104.36.180]:40140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wph-0005jS-Br; Mon, 01 Oct 2018 07:57:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 96BD2511C75;
	Mon,  1 Oct 2018 13:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395035;
	bh=11JYwxGBPnuaFsCIuYEBJZlUexokehWYmRnK8HTFNQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zimx3OPgd5eoBTf2RjQ2/wM65v757qYOtB4h4PhbP0wT3AGBzII6Kez1niqE6Dfgu
	zpA9eFEfOiSnoqVJgrjoQ84+4i2XstJoz3hdBNwWY3riIzTNzfTEZPu6NWR3/EiFm7
	6hK2OSyEgEGXZi+puxgAu5q3GE6EP9ohgmxvdiHU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IuaE7kuN;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IuaE7kuN
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMZ17Cc9RQtU; Mon,  1 Oct 2018 13:57:14 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 88852511C6F; Mon,  1 Oct 2018 13:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395032;
	bh=11JYwxGBPnuaFsCIuYEBJZlUexokehWYmRnK8HTFNQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IuaE7kuNWo5Q6HtBzpaiX8dBVgdySaJQ98nEWraYzCByKmiFsq+uea9wL8182oCQg
	MdFqLeNSWvXxprnSHOHmPpf7rAI2IsvRzrdijJTx0k1J2Jk+nY9ThogHNtbHKFOjd4
	9Xh19zQcqfsrmSnnh4Ru3u/LTUM8+/uJAq5X2q28=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id DFFD4511C6E;
	Mon,  1 Oct 2018 13:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395032;
	bh=11JYwxGBPnuaFsCIuYEBJZlUexokehWYmRnK8HTFNQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IuaE7kuNWo5Q6HtBzpaiX8dBVgdySaJQ98nEWraYzCByKmiFsq+uea9wL8182oCQg
	MdFqLeNSWvXxprnSHOHmPpf7rAI2IsvRzrdijJTx0k1J2Jk+nY9ThogHNtbHKFOjd4
	9Xh19zQcqfsrmSnnh4Ru3u/LTUM8+/uJAq5X2q28=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:57:02 +0200
Message-Id: <20181001115704.701-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 13/15] gdbstub: gdb_set_stop_cpu: ignore
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FhucW985EowF

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB get confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c27a3edf1d..51cc11981e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1763,10 +1763,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.0

