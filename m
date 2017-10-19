Received: by 10.223.197.9 with SMTP id q9csp6634727wrf;
        Thu, 19 Oct 2017 03:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Q/da0bOQcH6CseE8YwKB/IJDFkVmePQI7MFF2F93HGF8VULTpmhCLE6v0hg2I8YEix6hl5
X-Received: by 10.55.156.141 with SMTP id f135mr1189718qke.309.1508407752691;
        Thu, 19 Oct 2017 03:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407752; cv=none;
        d=google.com; s=arc-20160816;
        b=tkC16l5mYq4Rwa/EwwzxlXpDu0koYzR86NlJRDYZ6sTgGq5vSXoJy0pQUbBgpFryph
         WlrFI9rCFMBrEwoG7atFS5WCDdEcQLndz6qB7/OhGMr277VxNaizHpfWC0MbDqbDb6xP
         2QoGmAdp5XS9LlmII3QBelWO1kyiUN+1qq8SGns3rBmgZGJXIpGQcLJFLl+TYUGlJeXq
         GCGI+Zg/JQZYeWg+xJQhx/CloY45e3i30OkWZVMFwArTXGJH/HpejICAIYqJb2beripM
         ivtdE6VCGkWH2z0e1cb2wLVzsyQ/MIvruQWOBPVIagxlP6FBdtnRjtYKODvAdJY2jM5+
         8T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ugvh4iVhb/qZhRXKH79Dw8kpu3bEr4kJkYf52G5Iuuw=;
        b=oV3GSabQH7g519Viy9lTTeJmy4mIf6QjcniNgqDBn4Y7YLVxODPqkzxjuFlnnYfQFb
         xGFx57OtRgn6vn3D+2ly0GLH+VRq+GO8OMIR1mjssMxt81+ugDfIOMxtt01690z5RShX
         EdoO2DMKa79Oj7gepNTcirqYAHhjXHOD7bNoWRgrcXX+ejNqlXe2LuA0ja8DdiCZYWgw
         BBGa3gjfiOQJx0svNMfuTvpwgADeZcul46RraCn9ob8JD9ZZVMqWqWv298Lj4I6c3+yv
         CnCIHrOQh+9yNT+qP1eLd+r+/bR8wzmvMvfyN3C2JD5O4XGvYh/gyM+zCeci/g2inVER
         Vexg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c20si1095903qke.375.2017.10.19.03.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57lG-0006Fr-Cm
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:09:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57gu-0002q0-0X
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57gr-00081Z-Dn
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:40 -0400
Received: from 8.mo5.mail-out.ovh.net ([178.32.116.78]:56150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57gr-00080g-6m
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:37 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id B7D5514173A
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 12:04:35 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 7C63580079;
	Thu, 19 Oct 2017 12:04:28 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:04 +0200
Message-Id: <20171019100410.26239-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8697295307900881681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.116.78
Subject: [Qemu-devel] [PATCH v4 2/8] aspeed: remove
 ignore_memory_transaction_failures on all boards
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JaHwH27ISu7x

Now that we have a dummy ROM device catching the invalid writes, we
can remove this flag and work on fixing the current firwmares still
accessing unimplemented addresses.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e44733153819..dbb02f568462 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -294,7 +294,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo palmetto_bmc_type =3D {
@@ -327,7 +326,6 @@ static void ast2500_evb_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo ast2500_evb_type =3D {
@@ -352,7 +350,6 @@ static void romulus_bmc_class_init(ObjectClass *oc, v=
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

