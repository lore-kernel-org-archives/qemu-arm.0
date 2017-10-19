Received: by 10.223.197.9 with SMTP id q9csp7026154wrf;
        Thu, 19 Oct 2017 10:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S1u/WFtnHARI7801grW7FPTqrcApqTI7OjyVSNe9WotBivQZCSDZucr3DTdiK2OjjT043p
X-Received: by 10.237.36.125 with SMTP id s58mr3063192qtc.24.1508432606741;
        Thu, 19 Oct 2017 10:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508432606; cv=none;
        d=google.com; s=arc-20160816;
        b=NLdVNUZ3VTFKSGHLR/mCdFnXW+QcGU3eI2vVRgIlMhHYGzbwrtcAhsDRBRSYKO3Imo
         Kp1gXNmPbcWv0NVSj37jA2yIBe9aAi4iFDwELELzigmrx60mFmsh5mZmtcM0161LdyLH
         Y9HAs82H9GNYbPtPGSwwY61JBx5q2Hv4QOOH1TmfhcPP8vEOLRR7VgO0Vh+adZibKafC
         w4zlv1aNEA15g9BP+jBMIRWHctlqCsx5WKjX0VNkkCCPQA1HESVpAWKKjzXwT27BYQOb
         YlYwThMOE44+gyeYlUWXNF4bnANpqOr8A9+/fH7DSD1vuN+iPuUrhotv/1Gar2p4QMb9
         Z1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tjqf56XncUsOb+5v/rPqG12jSw47tS5MjS3xv+qO2BY=;
        b=mSrXHyqHH/V/YEMalqnsvrkSms3Z/QSazcmPJwt9f3eePtdcuWx49Vgmo69/evTK7M
         aFD1tqbrXbk4O8hfuoykjGPqSmOd+yL8/SnuWzYla3QjN8T16nGDc4ET/ADGmtcK61If
         B1bPw5YxB9gInzN9caKs27gXdZwRFJ0GH6xE6MzRutFsudsaornviEYkyRoVsV9/EhpK
         qfytTlQIEqyddg6J8gVkgMcDhH9WCfHFGSG6fO+K9KvYJFwW9T/CT8ZOYNpFUeFFrONH
         yk2vFGMBj81P5MitpE72YZDtFIuZoXMweXKD+D+va+oECuXJYRldvsSvb5vYgE37/fQg
         /Y0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si3266251qtf.169.2017.10.19.10.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 10:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5EE8-0007iI-Bj
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 13:03:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dns-0001Az-Ak
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dno-0003Tw-8B
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:16 -0400
Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]:48380)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5Dno-0003So-2J
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:12 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 75D0D1461FE
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 18:36:10 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 4289580083;
	Thu, 19 Oct 2017 18:36:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:40 +0200
Message-Id: <20171019163546.2039-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019163546.2039-1-clg@kaod.org>
References: <20171019163546.2039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15310549884493400849
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.109.111
Subject: [Qemu-arm] [PATCH v6 2/8] aspeed: remove
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
X-TUID: KO6ZBSrveluB

Now that we have a ROM memory region catching the invalid writes, we
can remove this flag and work on fixing the current firwmares still
accessing unimplemented addresses.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e6a890659a97..ff486b172104 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -291,7 +291,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo palmetto_bmc_type =3D {
@@ -324,7 +323,6 @@ static void ast2500_evb_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo ast2500_evb_type =3D {
@@ -349,7 +347,6 @@ static void romulus_bmc_class_init(ObjectClass *oc, v=
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

