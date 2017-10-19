Received: by 10.223.197.9 with SMTP id q9csp6920587wrf;
        Thu, 19 Oct 2017 08:15:14 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S3RLWwnUnJ5fVFYGYmNYkg1z7t2zFtATrmg77bIDBrYudPgz2JPyt32JA+7PnX2ruRo/+L
X-Received: by 10.200.1.72 with SMTP id f8mr2392120qtg.146.1508426113927;
        Thu, 19 Oct 2017 08:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426113; cv=none;
        d=google.com; s=arc-20160816;
        b=Gfd4pa+VkX8d20U+oPAe2NrYiD0htXh66M3w2PnKm1Bo2tHDf9U/a67wWtZDtUwMxa
         uzLLOebK87v2j3ooxj5UQrHwcw0/vYkVymUly1Ak/WidUkBZ8an/Adg4ZdnitWYoYu4j
         cUkbadHS8BZRKetn/nAzoFWYYsEF+wIwUfV0JFXbjqHPxh/JYwtrjdGVe1tPRa2GOeia
         AhW9pkLyiA61zQwUakWAm49nQRqWwOEzishaZ/ZFzxGPPEy1ziRR/UKXalvgA/7HZaZt
         yv3doUcSQ26nB3+MpFvOtY9jUeusD1ub593pT4D9pCqFJZQXeyYlwSEeH7LgyS5CBvLk
         XfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Vs4MptuESGjJ6mBA0AO9h7mZ4T4eMjPr1Q/538/fZHc=;
        b=Mng18D0KePfPH59PmLrtp4TLiD1Om0mjB6ogkgbk7WZhP0WDDKGpLmXnm0F3cAXKI7
         QNMVzHjHFFNTa/Rd0tJ0rnH8imoCTx2lcLWQWR0K8p6xWOFbMAcpXIwS9q41X17Gdn42
         PoUHhNzUB4y5MdtpeG3WAJF8gwuh0FssWLSsVquDmH1vfEgJVTGV7JsrLY+sb5dqmbXp
         c/x+UTTPyCcL4OZyjsJ1MxSVmBzqV3PhadF7WoXEnPFd2AkbjO8mZ6Hg4ZKNNmJsaYP+
         CWvfPEjG4uu3qi9dgniZndFpXcDJ5ApAYsKX45zMVO+1M0CaEPsSKQdvM7hqEuoP51LZ
         e/dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si1477529qkf.390.2017.10.19.08.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CXP-0002FB-Ov
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:15:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVe-0001D2-57
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 11:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVY-0001Be-9N
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 11:13:22 -0400
Received: from 1.mo5.mail-out.ovh.net ([188.165.57.91]:54073)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CVY-0001BH-3b
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 11:13:16 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 2EACE146148
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 17:13:15 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id EF01D80095;
	Thu, 19 Oct 2017 17:13:07 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:43 +0200
Message-Id: <20171019151249.13663-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13910211875623242513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.57.91
Subject: [Qemu-devel] [PATCH v5 2/8] aspeed: remove
 ignore_memory_transaction_failures all boards
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
X-TUID: sn+GsVctn4WV

Now that we have a dummy ROM device catching the invalid writes, we
can remove this flag and work on fixing the current firwmares still
accessing unimplemented addresses.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d88a8b5120b6..91c23968f685 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -288,7 +288,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo palmetto_bmc_type =3D {
@@ -321,7 +320,6 @@ static void ast2500_evb_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    mc->ignore_memory_transaction_failures =3D true;
 }
=20
 static const TypeInfo ast2500_evb_type =3D {
@@ -346,7 +344,6 @@ static void romulus_bmc_class_init(ObjectClass *oc, v=
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

