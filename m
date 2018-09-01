Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538938wrd;
        Sat, 1 Sep 2018 05:48:00 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZbnQe4JbMdDNDylx7/l0SbmJNFFi2UKgWp4OqSSlX8bsoG8+O3n2SzXfbhKSeHv+sVlaDU
X-Received: by 2002:a37:35cb:: with SMTP id c194-v6mr18500988qka.352.1535806080743;
        Sat, 01 Sep 2018 05:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806080; cv=none;
        d=google.com; s=arc-20160816;
        b=bhfacIAMONcGIGOA050HDvISSkm3xejLs7IeshvtkZBJqvd35mEGLduW6X5dqvR/4I
         zN4/rJsSYAz8AOtTae6xjGoXNYhr+cZ2xIGR1h31fRGps/cklQkbGw966LUl9QvK94/y
         7XrAGRgaOn7woq5NvJmMJNl8xg/gLwZsw+bC7iGeCL0tacIldgjMWDM+ZbbHdawMHjZs
         Td3dQGS2Cd02fT5RH765NbpNW3Aww2arzVFWjyV0ZQHmfumKKpzIcs8DvZQtzGT1CN2O
         B3nn8P1JleNGPe2dYaKrY9pBzxDRs6vmWbxEoybDG9NLzr+VWf/s4seW8GnFqCD0h6fw
         WgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=65hyeG5+VEZbMCxmg+uqha8ez6fuCVtRMMgfbP/nEzA=;
        b=j2gS2pcezgGT+rk7Af+LAJdxPC63c/zFQn16MvgJq//ydSYlMXZT7A2MV43iMSXkRI
         hR+iRWvBgYVq0GfhftJxCW/O4vhGMSUjER2Orkq3iA+74Tcd2VYJBLjGbShPZJjRET7W
         XrhdHvBxkzPnUTcvQRPsamTvJBgqD6r+U7w5Xx6Q2sTt0OZHIPj3wSVvu+Q1ou3u3r3C
         mXlVBn9o6GeUxkSHR8ylnu3TWiEdrRU+JDP1SVxef1LEFXQglEiTCtf9GJr+Iai57b/Z
         VC/gCw+sLMLTJlGC6rR7pGgP6Crdc7XLhBa0687Q/beXzAfQ2EnoFemQKOhEsC8VyVtm
         oykg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=i+PtOHcm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=MhlVda1I;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BuumqQyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76-v6si1959004qki.146.2018.09.01.05.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=i+PtOHcm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=MhlVda1I;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BuumqQyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Jo-0005ud-8v
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:48:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004gD-G5
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J7-0007l4-3c
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J6-0007kH-OT; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1D5C3DFFE4;
	Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806031;
	bh=bmU4wXE3iudYwFRME/0Zuv4lzXHnqtQIFY1W31Fc69k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i+PtOHcmZTqBzegY1nuaG0x8pO3HrjBDi2mB46tsXYxOjjaDPfp9ImNH67VGMSYw1
	sx5j687Isp97rAT3GtKdYUvSvJUBPNLFt5Sd1RpJ+O54/mcPOZOp9NIS62+/Yj7ypj
	DDEEDbdnzot04fbnD+kQiTO8woQRjBD1j7v8RC4w=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=MhlVda1I;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=BuumqQyo
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGld-iZN1yMQ; Sat,  1 Sep 2018 14:47:10 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 64315521A9F; Sat,  1 Sep 2018 14:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806030;
	bh=bmU4wXE3iudYwFRME/0Zuv4lzXHnqtQIFY1W31Fc69k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MhlVda1I61UrtfDJTxZ6Qo+MwaSn7kdtt8nBy+cXmBO4lfR+h0FV7WlFji5jUcdFD
	/uX8epcEnxTrwa+jBVG0378OJUmu4EceN8hjmC842862dLyI31fOFovi7Ua5xCGo8J
	kO4CE+hsEOPlWff6tNYsfXllXlrI2cmtrH3jbhNY=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 22F4E521AB0;
	Sat,  1 Sep 2018 14:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806029;
	bh=bmU4wXE3iudYwFRME/0Zuv4lzXHnqtQIFY1W31Fc69k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BuumqQyokVo3TxLs1sS2fqIpJget3tIVY3lPPA5s5/bjQtpsBr+JAykClAMxaNEm5
	Wq4wUzV6c74sRG/YR60C629NoSqnB2+7LYcQHj6dDWEBeviHbec7Jfp7MTClO68nI7
	fHuBXqsWZyN/lVf+YxrLoG635F6Hpqrve/BjogZ0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:34 +0200
Message-Id: <20180901124639.19735-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 10/15] gdbstub: add support for extended mode
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4igYHJ6YdaVP

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index af8864e251..4bed0a85f3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1281,10 +1281,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     trace_gdbstub_io_command(line_buf);
 
     p = line_buf;
     ch = *p++;
     switch(ch) {
+    case '!':
+        put_packet(s, "OK");
+        break;
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
         snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
                  get_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
         put_packet(s, buf);
-- 
2.18.0

