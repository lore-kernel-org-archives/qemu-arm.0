Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4399958wre;
        Tue, 29 May 2018 23:41:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ7rhaO0vu2eFkI1VlChxufbGpnw/tA+JdwnXQrL0uIbGrBAG0qoYeQM7MFr06hrTBk6+4X
X-Received: by 2002:a37:7e87:: with SMTP id z129-v6mr1195152qkc.298.1527662509957;
        Tue, 29 May 2018 23:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662509; cv=none;
        d=google.com; s=arc-20160816;
        b=h8Njys9xdX2VIxmtOObMunWfSfBe+f6anAmmmcI+0EhE8Gin+MbS/dZQ1zCZxAen0k
         6u/f7MED5Hi9kFC4HX+Qam4nMAecj6Hp3FDRui98wKftsSD3p1eEKJKjttN6crCNWvpd
         yylGQeABuiSuSGbFbEIbgnwIY7u3SQFQRLvoQnMCOv9+j6UKjrEEfU5egutSB5H9fhb/
         IjVh/k+BP0AJy1gTPjxW7R7O4DNdQdQBqKQCjC9c0/DtHZlrUHExFguVK/gmqiT7zX4p
         RP8Grq8d69Yi3yDzYPC6hohUDdAOF2Pp1mYGOx0DFtUEGJYBobljpjO4c58agrx+WCS6
         5FrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SulYmTddhPNhZbiSjCH+Obud2l7Hym3I6iBvf+WdHfU=;
        b=ppOH1CU7IyzZ9EEa3KMuKLZkjQGTzC80IgYH5WuzOyBe1s/IDTXq7y1yL7GRtpM2Vx
         SDegxNFC5njNgzVHq4y85yMATMAYkranY8nC5zNfp1fH2cyU6wz1R06H3DPKqhL/LUo1
         AhyorT63Ieb+iWkYcNOW5GrOAJDzxgI1hIRjpVA2zUO4kEh185NVJOBLDjvtsHHSsSug
         TtD1PvNMAk6Vd4llU2WT2sKdhKNbe/paROQisi7gehV5jsomBz1Ln5AXEIiUER0e6PwF
         0MWxtz97bxY2V3VmKNAhDaht9Fgs8Z+AB/gIg8Mi0+wsfnwQ6nUyagKENBLoobmLEZXV
         5e5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w33-v6si521010qtb.152.2018.05.29.23.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNunt-0002Lq-BK
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunY-0002Hv-QL
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunU-00017s-Te
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:28 -0400
Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82]:42602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNunU-00016Y-LB
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:24 -0400
Received: from player159.ha.ovh.net (unknown [10.109.108.82])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id E6C741AD844
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:41:15 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 14C88480096;
	Wed, 30 May 2018 08:41:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 08:40:43 +0200
Message-Id: <20180530064049.27976-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530064049.27976-1-clg@kaod.org>
References: <20180530064049.27976-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5155214201444797201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.51.82
Subject: [Qemu-arm] [PATCH v7 1/7] aspeed: remove
 ignore_memory_transaction_failures on all boards
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmusZdyjhr96

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index aecb3c1e7578..133614a4384d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -279,7 +279,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo palmetto_bmc_type =3D {
@@ -312,7 +311,6 @@ static void ast2500_evb_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo ast2500_evb_type =3D {
@@ -337,7 +335,6 @@ static void romulus_bmc_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo romulus_bmc_type =3D {
--=20
2.13.6

