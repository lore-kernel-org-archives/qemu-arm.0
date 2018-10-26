Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp442944wro;
        Fri, 26 Oct 2018 01:33:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eaz2XK4B3om2w07eQlaOvUJV5apCkvGbezmlxX1K2BIbd+DdNhHi+AAjtXlwaVZpnQeDmx
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr2368017qvc.228.1540542796235;
        Fri, 26 Oct 2018 01:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542796; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6Ndt+ZZA7clz2zU5VT+0RMPJlsVEJc/CiyMngtj7ujeCKJDzskoydhBphO08xVRkl
         2Efmsi2RvfSDp3vInh6vSdipwQgNvgsHbMDMEWpkwDJwWqqigz1gsmu359LcZLXS1vjO
         ksdv0JlPnbTBfzGcq2tEuNoma9Cl0ImrHLr0D28MEKQPGqaagF4VGo1jODTxoo5pO0Mf
         SnwsYnMiYHaCOHHESbrqE3PnVehOA3ROGL27skjMOs9IFlMCMhabjKh1cbeZKhxm9kr0
         Ohe/knfuzJdL1ks7eGciWeN36HNDDWpXlrrvEy7rfrzxeVBIIP6Hzp8VAu8haRRrGKHQ
         rOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=2CtVnGnhko4SD+79Bl6nDeagV10t2l3hqQXRTYif8U4=;
        b=hfIYuZJGEHDX+jQ6MhUvO8/WJQs0MiIfpQKN3t+g5hryuFuUUJ8ZMcxClkng5x0UiI
         lylWcCU/t/94ihJZNtja42Yyyq59/XGaKFfOdwVg5p7FovdpqIH+xzyP/ei7fiMZbFQQ
         10zl+3cy+oVA78tcqRklPyBDijELfdntXR84EOeyHk9QCttUAaxfbjUh/tOXvyHvxxnd
         l3hPFX0hz78jIO8zw1BP00i5O1PFCyjQSu7Ti5suJMi6cJJMeo5qQ42uIPTyNfbB1PyO
         yM4Gg3PEobRc8N4CR7W9jRlb3QPC0+VId65YbDHL78a2v/texzlvuq2FFt6FxXyS5NRg
         j9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Pjr9ZwzG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZoAZPuG2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=KM3huB0m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b25-v6si5671089qtq.259.2018.10.26.01.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Pjr9ZwzG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZoAZPuG2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=KM3huB0m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxYR-0005M4-4E
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:33:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUD-0000gX-Td
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJY-0004yU-IQ
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:53 -0400
Received: from greensocs.com ([193.104.36.180]:45405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJT-0004lY-Pc; Fri, 26 Oct 2018 04:17:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DB1E5441B55;
	Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=9dQbVgz96/nsR5DpXYpQlUDTF/nsJCFo9CdyXS2rSHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pjr9ZwzGkioo52c58otX4hwdYTAdVKwl0cu9yVTAxVwxiHAsf959waYRzu5Tnoc9B
	ruklDYVWAjO37TWEDe6zrTNKI8kZu2USqpa0tfWlkWpC76lccr8lhIkGBajKRgubFW
	6N/sdFg05byt0rMQzo3KtdWqKsNZxDJzIFJ6tOvk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ZoAZPuG2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KM3huB0m
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLYsbp3KA7LI; Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 92D5C441B50; Fri, 26 Oct 2018 10:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541837;
	bh=9dQbVgz96/nsR5DpXYpQlUDTF/nsJCFo9CdyXS2rSHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZoAZPuG2Y7W70aVBkJ67awPOtn7RBDeb1nWE5QS8Af+vdMXOvzPiDSZAMF9pDLYp3
	yxI7SYREKMX1Mt3sXDTAZeKoD5MbnOmxVqAy25Q6y0frr0Ss6jsakFMxp+lTW4skTN
	SQc0nd3NacoV5VI3cyqY5gUIgrpR0/Jl+fpvgEsQ=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A7952441B49;
	Fri, 26 Oct 2018 10:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541836;
	bh=9dQbVgz96/nsR5DpXYpQlUDTF/nsJCFo9CdyXS2rSHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KM3huB0mpRKA600VRtIt/UQaMHvX+g8ITM/q1rPHOfY+3hsj2gdRg4i3slL1yW+wt
	BpYgIV2biKfsFxdzL+LRv7yDfc8mkL++dOXnZlkIBdNvMuwY8x3IbMbFbOMewl6PUL
	lD1IVUzp9vMZarci94leUFw/24gOh29tNiHX7x8g=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:48 +0200
Message-Id: <20181026081653.24602-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 11/16] gdbstub: add support for extended
 mode packet
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
X-TUID: nr8hK+cLK3dd

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 4d8474204f..9c239c1760 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1291,10 +1291,13 @@ static int gdb_handle_packet(GDBState *s, const c=
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

