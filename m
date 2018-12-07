Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp244248wrt;
        Fri, 7 Dec 2018 01:10:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X87Zde9EDTAjzagLrBxwKZK5E58xXf+lViT7fG+IvMjoxE9Fcjx3N6Klw/pDuJ1rYdjXvd
X-Received: by 2002:a37:358d:: with SMTP id c135mr1057058qka.232.1544173801288;
        Fri, 07 Dec 2018 01:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173801; cv=none;
        d=google.com; s=arc-20160816;
        b=hpyBYTmyE18jsNhOTZoxPOo5e6TfZzSILY3sRmaG8eap4wvel3oshDX8fm8Qf2rHcJ
         s2f8lzDtd7Feaor2imuUV6ZjPcIIPDhsihBhq99hHtJ1LwLpuQ5PDpRZh37LQ0q1WwRZ
         q+57TcpNgsdkDw5Oe5a23r4H3lAAAYR3AhdJrPrnLcVou84T8o9Q/JRUbiH2bV0CFwXx
         17QWcpH9VkJYV1svi8n65ebkJHWk+o9ii/IY/vqE2adctToH1f0KTrCjL3Z+cEYlhy+7
         avN+qI0Y67npqrn+xE0nsBlX77ljp9PDgEAVno7XdIsrTkjG4lArHLkBHVYJPLohd1XO
         tI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=iUNksPnULV8qy192CmdQsawzhDZJpvXoWePXbmlOux8=;
        b=gsSYeNhTc5QWE7+wuj0o/5WkQacAfcbHqMXwocOLJMDDp/U1SVU2corA0XkPeTpovE
         M4kr3ZnNMRaE/i0yNWbwatDEjZmXcaGszxTglfZpPc4tJ7MesDnyC5nL8i+WAUpC8V7E
         fUJDbEXPAh5cb9IKu+iZqGxEzn6wzQlqy4BvPUc20oQvdx4afzF7gfCbYXsVnE9jgSA4
         KQr8uYnXDFjsP8/IrML2HZnIvWhudX9Z36zP0Yh2WfmRkFnNm4HrnOQFSMOPqg47LAlS
         pa2C9iGIfCYIlm9nVQiHf8JH6t5G7M7PzkUrue+k0Myx687Q0t3srpQYpjQkz8NoWzEE
         AQYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ydwxVgvc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WVDci8yj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WVDci8yj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j65si1808483qte.309.2018.12.07.01.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:10:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ydwxVgvc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WVDci8yj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WVDci8yj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC92-0007Cu-O0
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:10:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1X-000889-Po
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1V-0005e7-Q2
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:14 -0500
Received: from greensocs.com ([193.104.36.180]:52249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1V-0005S1-DU; Fri, 07 Dec 2018 04:02:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C8BC9441B53;
	Fri,  7 Dec 2018 10:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173312;
	bh=5fEHqqrKfs547kfy2tsAp8GlZdfkwG8rdzXh46VRHEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ydwxVgvcYPKh/dfgme/Pzvwl3pKTHgRUrurRGzXse8pUnctp7pBw+lomAisg6TDSj
	wjAB5dRMAa7cX9lFuiEX5pmKjQSvZSLCTkjksxwgBotFfammJKAbOUe/9UQrz6Vary
	+q28g3Lla/djtm4hx8fl3upw9v3t6qS0QfJpW9xY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=WVDci8yj;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=WVDci8yj
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9nQ_L8uwgL8; Fri,  7 Dec 2018 10:01:51 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D00DA480011; Fri,  7 Dec 2018 10:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173305;
	bh=5fEHqqrKfs547kfy2tsAp8GlZdfkwG8rdzXh46VRHEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WVDci8yjvsQAqJ4HHuwQXzWAtx+wfL7EGh0dQI195pNE8qxmUF3AorHJ5F4KsU+ie
	rGdZyAxP6cLqgdhDbwIhGsvWjE4/SFJMbz8v2BIOQcjD0PRvSz/vflOrScN7oVFOeb
	RvaYjfpz9lLf+MChkRj7Cd1d1ZqiuHyTp3a6TCmI=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 697FA480037;
	Fri,  7 Dec 2018 10:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173305;
	bh=5fEHqqrKfs547kfy2tsAp8GlZdfkwG8rdzXh46VRHEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WVDci8yjvsQAqJ4HHuwQXzWAtx+wfL7EGh0dQI195pNE8qxmUF3AorHJ5F4KsU+ie
	rGdZyAxP6cLqgdhDbwIhGsvWjE4/SFJMbz8v2BIOQcjD0PRvSz/vflOrScN7oVFOeb
	RvaYjfpz9lLf+MChkRj7Cd1d1ZqiuHyTp3a6TCmI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:29 +0100
Message-Id: <20181207090135.7651-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 11/16] gdbstub: add support for extended mode
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
X-TUID: +tleBsHfGjgV

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 48c2571ebe..1cf1bea428 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1301,10 +1301,13 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.2

