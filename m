Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp815140wrw;
        Sat, 10 Nov 2018 00:24:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5e3s9w8NKyTXTYbpUFugieHS8RI4K0xz0PAOPXtbVPtea/nHi8rtr8lmwqy96U+MamGJbXO
X-Received: by 2002:a37:7e45:: with SMTP id z66mr11131688qkc.23.1541838258690;
        Sat, 10 Nov 2018 00:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541838258; cv=none;
        d=google.com; s=arc-20160816;
        b=NG2Gl1AUKHjPNeAxh6H48qwDq72WJh2OkZr+ylZ1i+SkBadmgbvvwHKWnRoygqyQaw
         ykRJEStvpeWlUAhOrz5nWbdozRfpv373wVxpK2HOEGYVz+jxsndA4CnIawwVwbADFp9w
         xpglG/kRJvM1O1edxzJxsywCreaN6E7Bqaj1iPaDIYqL6/5/j82bSX2lavzxu7OWk1J4
         eB8q5yarJZS8Kb/miHHtL6DnH5m9NssroAYg2DhY1CmlLLgFtFGj+KCf2vmDoZq6gXtf
         dnOwfzMvd6tcTzoTjvd4I8kf0RN3nbFisxwlDd+Q4/sFM3RY1Ka2Fc6Tdxm/hIM5AUu5
         OhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=Kh4aHP5sMQLPax3FqmUNxUEPI1erG3Nd6v4bXvufkUw=;
        b=sFKKntQOxno+LjxiKOQ4kbn1smfUYVf6mBdcLTivjch0zUy+mdgy16f60PqhQTTomp
         IuHftqxBymiiQf0vwR5ZLUIb2c0q1Cg+PG0KDOc7IO7t2u5i0bOMPR9AbNOCMSmcG1mC
         NjRdH/ys27tmtuw/Icf1dWsbft/N8ALaKaCnB+H1t3gsPUYzfC7vhiV/3izo82IIuXuY
         4bDd0PNyiKUsr8vZH2HJlHW54Dq52BYyTx1QC024nwWu8UbMVll5uQZufO+k6sRF/6Rk
         D/PYMLi9Za8aVNUs6wz05skgP2jO+ir+eTRG4wixUxAegVeb/Zn8qbhUIVjSkXbRUtB9
         /VYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dcSxQscI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Gip3+pR4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Gip3+pR4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v30si3652499qtd.97.2018.11.10.00.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dcSxQscI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Gip3+pR4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Gip3+pR4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOZ0-0005ir-4s
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:24:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP8-00046D-KQ
	for qemu-devel@nongnu.org; Sat, 10 Nov 2018 03:14:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP7-00012E-OI
	for qemu-devel@nongnu.org; Sat, 10 Nov 2018 03:14:06 -0500
Received: from greensocs.com ([193.104.36.180]:43678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOP0-0000TA-Gy; Sat, 10 Nov 2018 03:14:01 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 96A615D19A3;
	Sat, 10 Nov 2018 09:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837611;
	bh=Th2MJHUdNYEyzy14m2vDNx88f11TUXsyKWgcqpJpXlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dcSxQscIiM1DnKhHJKVX6yEJlmqFSXy4BvEb/dY+iXHGHmvdyWxDx7q8VkYofZA3d
	f0SRmvYMGoCJ3NAA2qQ+c9X7nzDO6jqKxTZfeiMI7ZOHzr4d4/gGyzaUJI6smalOZ9
	H5DpeGbZmJxyH4vg8HGBliDFPgjcXH2dr8JysfgQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Gip3+pR4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Gip3+pR4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAKFfCEjxpDd; Sat, 10 Nov 2018 09:13:30 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D88E85D19A9; Sat, 10 Nov 2018 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837607;
	bh=Th2MJHUdNYEyzy14m2vDNx88f11TUXsyKWgcqpJpXlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gip3+pR4Iz+hKvxvlIHB+W5sHWKJSkHP0T1y/PZ4srs6t/w6Hv7a28jgZ0ZEdCJx6
	JiW7kna41+hPTv/2ErE2gOVvoSkAGgQjJLDO2dYMf5eQagwizPDTdTV6v5i/V5+G4g
	ja1+nZfCmTTYRApafe74L7jQB7WMVORsHCa5aveM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 720845D19A6;
	Sat, 10 Nov 2018 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837607;
	bh=Th2MJHUdNYEyzy14m2vDNx88f11TUXsyKWgcqpJpXlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gip3+pR4Iz+hKvxvlIHB+W5sHWKJSkHP0T1y/PZ4srs6t/w6Hv7a28jgZ0ZEdCJx6
	JiW7kna41+hPTv/2ErE2gOVvoSkAGgQjJLDO2dYMf5eQagwizPDTdTV6v5i/V5+G4g
	ja1+nZfCmTTYRApafe74L7jQB7WMVORsHCa5aveM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:46 +0100
Message-Id: <20181110081147.4027-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 15/16] gdbstub: add multiprocess extension
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
X-TUID: hEG1MyNqRYL+

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index c662ada6ff..93a7c956c2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1721,10 +1721,16 @@ static int gdb_handle_packet(GDBState *s, const c=
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

