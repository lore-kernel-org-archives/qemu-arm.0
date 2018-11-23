Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1760307wrt;
        Fri, 23 Nov 2018 01:30:05 -0800 (PST)
X-Google-Smtp-Source: AJdET5fKedhfiwX21dZlf+FbCpi8J3T3490WtwWKN5e7Sv3qyxGJAplfL/Y4onqNjO3IRfWRir5M
X-Received: by 2002:a25:d4:: with SMTP id 203-v6mr15504304yba.433.1542965405739;
        Fri, 23 Nov 2018 01:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542965405; cv=none;
        d=google.com; s=arc-20160816;
        b=NnR/ZyT/nP4fIe2vtW8P75F9Zy/wVSSMUEAbtUHQc3UohZx2WmZJ7MDqj8qAUx4RSK
         Fj5Zcusfsbs6OBC/11kq66gBqnAuGypjQO9T/OiCpPAtqnuj/Dp5eiqPNXmX+bNufJGK
         Gy9oyK6Io9tt112Mpg6aaF6H9l2HKcLIRnhx2EmnpyVTopiY9SeW0Wh1KXIEIoS/R2Jw
         LYJAyDL/AW9+8ciDdf8EIMWErf9Kpp177Y/ShkT8v9jjzMFO6DlGtkhgp93kneLww2a4
         ywEoqRKwZ7HRNCHmUM3nQ5bH1eli4kIZIGHrCXbkJ0bCkj/20HoYZElDxYflbEyfGP8Y
         rQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=9eQPkwztBSzWwXuHkFcsBGsY9oIcuBD5nlA4GhPmVK4=;
        b=HNn8xvqYlU8hTNCCnAndkT5/7Ey9d4BoMFA3H8WQXcsjdRPCPY3cZZTsJfJ4jA1u8W
         YcIqWiE+5rwxUubPZgLk+9fefRcQIk1FUDItgdlAvIRQZIpaNuAAPyRT24E/W0LsMJxC
         lx/oGSYmSOxc3H48c29HBoD30Y5gvhnwE1JT8tk0dHEkXXhtoiMdN+mVye9XhVH1s/6U
         qSmNIjm7dR6KkOZZA6msJR/aKpOtHcDtMmlsdoJ75ky+7mPam8giue0Z5sGm2t/w6Y0x
         w4zNKxNxFGGvXUSz6gntuWB8iHPymmi4hBmUgEVhb41Ht2DC8IQ6Gi2X7Pk28PLdgrm2
         lMpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pP5gM435;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fzEsQaHJ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fzEsQaHJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d197-v6si31927386ybh.303.2018.11.23.01.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pP5gM435;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fzEsQaHJ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fzEsQaHJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7mn-0002gS-4b
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:30:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bP-0008Lp-UK
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:18:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bP-0001r9-5e
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:18:19 -0500
Received: from greensocs.com ([193.104.36.180]:47089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7bE-0000YG-9Z; Fri, 23 Nov 2018 04:18:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 75DF05E7084;
	Fri, 23 Nov 2018 10:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964660;
	bh=IgQb7uPwBqaw+sefZDHkTRXz9UaRsDHBj9LQQwwKdBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pP5gM435JyUddCcSH6VS0VAPkFVCgg6gf600XTmbxU4Y1dqOJFt7IxAO8bXWypzHc
	dipIVAOHryMI/JWVfzcisBf7HFKuOwOPudALdaYIB9wp34KZJdjnWpmBzJW/TtOI6w
	Br1tsRwQkjo4ILL7vyUTxCqLERoLS2G2nXtQlIRQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fzEsQaHJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fzEsQaHJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrYXoYJeHcTA; Fri, 23 Nov 2018 10:17:39 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 7B4945E7088; Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=IgQb7uPwBqaw+sefZDHkTRXz9UaRsDHBj9LQQwwKdBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fzEsQaHJxrpaUV3fc8SOWcpzPiOVA/Na1bFXh26ufroEzgrUeTyTuD6zAUEm/J3IS
	xH04Ln+nhhxEMyxr8ihDnNixchJr0DrAEijPFd5EQMqm8yQ64VhZz+D/dxInjaaI2I
	+BqSisOPvCCX74t14wT4JG7nsme3rfCUaxXAvauI=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0E6E55E7085;
	Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=IgQb7uPwBqaw+sefZDHkTRXz9UaRsDHBj9LQQwwKdBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fzEsQaHJxrpaUV3fc8SOWcpzPiOVA/Na1bFXh26ufroEzgrUeTyTuD6zAUEm/J3IS
	xH04Ln+nhhxEMyxr8ihDnNixchJr0DrAEijPFd5EQMqm8yQ64VhZz+D/dxInjaaI2I
	+BqSisOPvCCX74t14wT4JG7nsme3rfCUaxXAvauI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:28 +0100
Message-Id: <20181123091729.29921-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v7 15/16] gdbstub: add multiprocess extension
 support
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
X-TUID: W3ieF1DgxEoP

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 6fc1630643..dc71e3f732 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1725,10 +1725,16 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             snprintf(buf, sizeof(buf), "PacketSize=3D%x", MAX_PACKET_LEN=
GTH);
             cc =3D CPU_GET_CLASS(first_cpu);
             if (cc->gdb_core_xml_file !=3D NULL) {
                 pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
             }
+
+            if (strstr(p, "multiprocess+")) {
+                s->multiprocess =3D true;
+            }
+            pstrcat(buf, sizeof(buf), ";multiprocess+");
+
             put_packet(s, buf);
             break;
         }
         if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
             const char *xml;
--=20
2.19.1

