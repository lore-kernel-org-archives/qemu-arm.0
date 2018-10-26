Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp439507wro;
        Fri, 26 Oct 2018 01:29:32 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fVXIiAnyQanAe61RNYgR1oCy0rOhbdAoJOZlnz2pMlKYJ+rfVkFbfooBDu8RNUCq5Fj+Hx
X-Received: by 2002:ac8:72c1:: with SMTP id o1-v6mr2341719qtp.134.1540542572405;
        Fri, 26 Oct 2018 01:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542572; cv=none;
        d=google.com; s=arc-20160816;
        b=sdhTXWhUUwl+gfA9qTi1ZFh5aTzSMaD3hrRl618+g/ltEBTTsTA+wGo8XWnF0oEdyG
         Reom8ZmiEj4ddSYM0I8f2rULVEoIA20r00BB0AyzEidej90bHmLrhSRn+/T8TWxnS0a5
         L4aaArtAz9iUo+qwqWMp24OdfU2dmVSJPwy3vuOooXWAz0APcKyfZl+VyArbftQW2TVv
         uLvREisEXS+U1qAvojWf1LAjFUt487e0jmLx1CjQJCAXuRGwdIZ90+4w6WbEkzdUPkzI
         LTlp0IKw+zWCAKUbnNHuBhu6+mNsT9zckUCApEvveG2bMUPb/36OnVXM20OzGBrMVA4v
         0HBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=m8/hfzCglUuAvf1Qb4deXjVxSBQI2LWR/rGEX+7TYzM=;
        b=lr32BNf5KWn/EnBRk0Anx96A9egBQVYrwYt43nr6YsGyoAzF4rPCy2qjezCE92AcZZ
         REQjp+LxiTm/CAEc0AbfX6bn3jId4wKnH+XZHey2dVEwc8F6Jau5P9bwFpoZf+AYVmT5
         rs0F5GzgKVY06TMVq+xLubz0E797Ex13C/nNG1WxzFicy2jjlHZX++zpdaF+Bu9a1yyS
         5/SdibG+mGt2RhPY9R0G/AJ77eBxkgLAPG+eeKvmE6/ZCnMCZaY2o8OdQm5UkzFV88N0
         Y01/e0BuyrGDTv4zE7+tAMm0RBywa1bf90mg+jGbnaQqwjkKjTxqzLZ2o0aeTU/KiRoo
         IJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bNZUvPHc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7VV7M8cd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7VV7M8cd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si1412119qkx.42.2018.10.26.01.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bNZUvPHc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7VV7M8cd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7VV7M8cd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxUp-0002kd-PQ
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:29:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUD-0000gX-4J
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJY-0004yG-H6
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:53 -0400
Received: from greensocs.com ([193.104.36.180]:45415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJX-0004nb-1o; Fri, 26 Oct 2018 04:17:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AD07D441B50;
	Fri, 26 Oct 2018 10:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541841;
	bh=dfLZPGnN7TiC869jTmK6DB7RFN22ebNE4iK7hrEv7XY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bNZUvPHc1ah3zN06p9cAJ9591A0gyTfA5dltxL3aT7xNQzwWAJByyExjiCY9+J3fr
	y17U3SSZBWUHl8r1BOvWUUd0rpjfin6yalLDsEL/YdLOUuUl7Wsunl4/OB0WkKlU7I
	8BBtiHvAF5imDSaBld08nWO8N8HAxdRnHNBBYWrs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7VV7M8cd;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7VV7M8cd
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PabWieQPEDVJ; Fri, 26 Oct 2018 10:17:21 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 50633441B4E; Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=dfLZPGnN7TiC869jTmK6DB7RFN22ebNE4iK7hrEv7XY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7VV7M8cdbaU3iq4U42RfG6bQ1av8p5xoNWyZoYcVdjkiZUM4glP8R3fxcCApeODra
	odRPqiDxSr6o18udwULB/SDAzg8R/WSjD1u8w7c5+Hlb+7MA7C8rRvBfkdr7rCUhWr
	w9vC4G0HbiABERlcj75pIHPp8PpTKoHF0PQkeGZE=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CC187441B47;
	Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=dfLZPGnN7TiC869jTmK6DB7RFN22ebNE4iK7hrEv7XY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7VV7M8cdbaU3iq4U42RfG6bQ1av8p5xoNWyZoYcVdjkiZUM4glP8R3fxcCApeODra
	odRPqiDxSr6o18udwULB/SDAzg8R/WSjD1u8w7c5+Hlb+7MA7C8rRvBfkdr7rCUhWr
	w9vC4G0HbiABERlcj75pIHPp8PpTKoHF0PQkeGZE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:52 +0200
Message-Id: <20181026081653.24602-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 15/16] gdbstub: add multiprocess extension
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
X-TUID: vmC6P94aNa5z

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 09480df2bf..a1b63de34b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1718,10 +1718,16 @@ static int gdb_handle_packet(GDBState *s, const c=
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

