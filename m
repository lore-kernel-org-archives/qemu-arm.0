Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6800928wrw;
        Thu, 15 Nov 2018 01:46:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5eqipCvTqDhiLpyhgzfGpLymWp1jqZgP9PvxJ2WTDdbVTocpwcLDUgNjReGhHHciq//LMCW
X-Received: by 2002:a0c:af73:: with SMTP id j48mr5452865qvc.172.1542275219736;
        Thu, 15 Nov 2018 01:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275219; cv=none;
        d=google.com; s=arc-20160816;
        b=z01ht/SGk91j4fGY7SMQc8WcpmCcFp4Zhmj2oJx5WuC+ac6Om7Gik5AgqxmJKmkP8v
         ABnYI9EZ1zlhRYjVrbwUAJJQk1+giHTeZukEfbChACF5nKjPZMIkCPYrr1PX2cONcMP7
         HmVaYW91ilewkSit+zIpWqb0o67W/UqxbwA6/0BKLqUmYIvdDcapXvkxBgn/XHv4OcSd
         4JgKQokcK9LjgkQCGme8kNoEiP9ZL9LmWtchhNiGL4VbN+v5crYnp0QHTtnpAZR+MB1o
         XQ9SXq0c6GXLJ5NpRm1/8Bz/MbEqGFMGtug0aqZq8Wr/+BDTD0Veu+8RNX4OtUyo59yy
         vKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=T4yAGVtr/mq5T46PjtVJafkJ5uz/TToz7g3WqE7xJkg=;
        b=PujdB8PMzsCa1gPCrlRCaFtQR0W49SV9O0ga7fdK0lubISd68PP7I7jOwxyTF1PzUd
         9139Ac+syht2uq6PwAp1rozdLcGHXMSP73DROOc+DUkbRCVZOkCr/xKsuGNfGm81homn
         1opY5qR+gSM4CMGrIeYKRs1td2Ogbro5DESVitEmZ0JaKzFxkzG1XOxXup9FTLjeOaid
         j/rnJ2fqNEVsjGEkdVnIvUPBMVoNnhGv2GRdGXiPPq9tUNLzMn43ba/L35H9XAe+SLDJ
         tH6Q2K632nME6UxQ2XR5z8Bm1u3M4itDLgY1aJ4UmLMJgzL31xb0mf9PJBl6VdapLwbA
         TcOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=n1DtfkK3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OkXHKONa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OkXHKONa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16si6150460qtr.3.2018.11.15.01.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:46:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=n1DtfkK3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OkXHKONa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OkXHKONa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEEl-0001Vb-7T
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:46:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAo-0007Rc-Fk
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 04:42:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAn-0004oO-Ly
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 04:42:54 -0500
Received: from greensocs.com ([193.104.36.180]:41929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAk-0004bT-2v; Thu, 15 Nov 2018 04:42:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 36CD2441B57;
	Thu, 15 Nov 2018 10:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274940;
	bh=eTAQ3gyUIFB+pZwXAVSZtIdNbFbdyQOd/43CxMn9TWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n1DtfkK3QIznDJ0azW0j04kyyXhvpJ6RqT3Kbla4INX8Ug+YmoDk2uWN4oduhPvsQ
	xGDGJaeOSfRltVEpwBYJbXY/Ty7YrNUtbZ4eHqWjPaNdOmnt7b/z/Sb3ZRaPBYgxta
	nUIbBz6V9P52zldTamS3jnyKBROelIS8UloPF0Wk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OkXHKONa;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OkXHKONa
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EyvazNl1m3le; Thu, 15 Nov 2018 10:42:19 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6573D44325D; Thu, 15 Nov 2018 10:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=eTAQ3gyUIFB+pZwXAVSZtIdNbFbdyQOd/43CxMn9TWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OkXHKONa42m+5+VrFoAVETRMV4C8TsIOYjIZi7uz7dPKsuULccU1g5R7yNr63C4ps
	mDy1obj47vqIJ2m33TctwaViRyTLPpPD28nDs9Yundyu+qb2RUUkmYkPkklEWfEWOc
	zrJamrxQUvmtFB/hoShf9CctAMFis1NFTMNajv0s=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E651144325E;
	Thu, 15 Nov 2018 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=eTAQ3gyUIFB+pZwXAVSZtIdNbFbdyQOd/43CxMn9TWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OkXHKONa42m+5+VrFoAVETRMV4C8TsIOYjIZi7uz7dPKsuULccU1g5R7yNr63C4ps
	mDy1obj47vqIJ2m33TctwaViRyTLPpPD28nDs9Yundyu+qb2RUUkmYkPkklEWfEWOc
	zrJamrxQUvmtFB/hoShf9CctAMFis1NFTMNajv0s=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:06 +0100
Message-Id: <20181115094207.22846-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v6 15/16] gdbstub: add multiprocess extension
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
X-TUID: rR2QU0J274TE

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
index 89819a6a72..e0b844c040 100644
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

