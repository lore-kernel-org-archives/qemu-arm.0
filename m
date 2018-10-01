Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3739945wrt;
        Mon, 1 Oct 2018 05:06:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60ZHhXZElyuhTi8rJzOA4CMru/Y2dnJpqiOjII0OFOMRmvpvQWoESx/L2x1OVDRd8ihBO3I
X-Received: by 2002:a37:a38b:: with SMTP id m133-v6mr7873962qke.356.1538395615921;
        Mon, 01 Oct 2018 05:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395615; cv=none;
        d=google.com; s=arc-20160816;
        b=Ty3ZkqVzcbwHDXV3RDb2hxYcj4e48Pv4OTfgq6Vrkc7wFsMyXcoMO9O7jiN0zZORNf
         yfodzMyBnYNvIocaWczs6SSoOFupiapndtDwCxdhoBWbiA8WxxlIxv8ftUJrUrxbs5wd
         AXYjC3aTHRrV2DOEQniD0IzrYQaKQpjz2M0viOoyrz5lvjg9zXy2r+JhASuFy4qtL+/S
         7w5F8SBQJJmIr82kv6xUxJR7Rq7udm6whfCAXYzZMAbS/87atmGZ/OdTRygDyW9tTZeh
         gSuBoalAxyEwp7EIa4eibKBBth0ietLZAtsmfUzBqig4p7r7nFDdaVLwcctVwIB9hY5n
         ozdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=n/t+w6m9tOeo1o1NbTJTcaajn88wNcliKvXunrXR0MI=;
        b=Xt28wBYm3X3AE0hjuf8RO+/Y6RKKeCjhGVqV96uTgcBe6Llh6v4Myx7TQ1QG4OrAOb
         z17mdQHlll31PlH9Yxmvfaf0RTz2K4nCLubp+ANIvSj+1pzRcU+qihN+gXx9nZsorXH1
         bbFGsOhi9sX5vOnAdOYEHsv2Kzdkqjwiwmx8kmLadvPLBwEN7lrZK/ECHMBM8d884sE/
         5or03eZYcpkkxvPNGPqG9l5QggEVTO2InYGpX7DY0Pl/LbLD7b0BZz4IFPhk4X96yvXe
         2qlmwlI5KnbOZ8xeDvT1Na0GxtBygBxGIjo22/gifFDc1L3z7RGc3+O/gJCovCVpEki5
         W/nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Vpnme4Hc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=nD+spMeP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="tuO/KFn9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n37-v6si2043144qte.352.2018.10.01.05.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 05:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Vpnme4Hc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=nD+spMeP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="tuO/KFn9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wyV-0003S1-DP
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 08:06:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpl-0002iF-KY
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wph-0005z9-N4
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:53 -0400
Received: from greensocs.com ([193.104.36.180]:40141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wph-0005jR-AE; Mon, 01 Oct 2018 07:57:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E72B1511C6F;
	Mon,  1 Oct 2018 13:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395035;
	bh=KdNu9QGOUCYSzJWzlap/9zyYoowEZ7QOtkLhorspP1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vpnme4Hcwp6+JXnt6V/2++4iIw1OlipkiM8ty678X8b9pqUSrQZzzOEc49Q3yuG5/
	ulzU9dReuMiLhHXwzlDCler0evfQt7W28H5ITaXg9tOe6FBdm8uIoZlwtXaic4Gkap
	e3PMKEmm6bJKWIob/U0bTXuo86Qqpf6joSFsoFfU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nD+spMeP;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tuO/KFn9
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MNwaX5qi0Fh; Mon,  1 Oct 2018 13:57:15 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2820D511C51; Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395033;
	bh=KdNu9QGOUCYSzJWzlap/9zyYoowEZ7QOtkLhorspP1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nD+spMePMBQqIfGHevLYYAXfsZKbFSINbD8Itpu54ZE+kg+ku5zh0fAM9ZLlbfObR
	I4O55rQQnIUiGxS0Y+DQwKNSpGLpGbHPudZu0gVbv4I/8hyftm1JIHSCie7bl0CVxA
	6hNoCQd6cj6m8bZFE/ehEjXTGo/oktUe2feH24xg=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 8A7C7511C78;
	Mon,  1 Oct 2018 13:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395032;
	bh=KdNu9QGOUCYSzJWzlap/9zyYoowEZ7QOtkLhorspP1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tuO/KFn9GagAZrQ4kFQ/J5vtpcyzaeFJC4HSG4u7qo3UVVQcTlwqgLHCIrvjdwT7u
	3r5q1kMWf+Emyx4KbhbX23zt5ARSETjpqF66+0XYBt3p6X+eEuXroISod0XKSy5HbF
	CkX2srPKuzPDEt9EILPRr4OvSuj2k3vigca2lUd0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:57:03 +0200
Message-Id: <20181001115704.701-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 14/15] gdbstub: add multiprocess extension
 support
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
X-TUID: 2qJEa3SpMlYV

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 51cc11981e..89f6803533 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1692,15 +1692,19 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             put_packet(s, "OK");
             break;
         }
 #endif /* !CONFIG_USER_ONLY */
         if (is_query_packet(p, "Supported", ':')) {
+            if (strstr(p, "multiprocess+")) {
+                s->multiprocess =3D true;
+            }
             snprintf(buf, sizeof(buf), "PacketSize=3D%x", MAX_PACKET_LEN=
GTH);
             cc =3D CPU_GET_CLASS(first_cpu);
             if (cc->gdb_core_xml_file !=3D NULL) {
                 pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
             }
+            pstrcat(buf, sizeof(buf), ";multiprocess+");
             put_packet(s, buf);
             break;
         }
         if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
             const char *xml;
--=20
2.19.0

