Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3170980lfc;
        Mon, 25 Nov 2019 05:43:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfdHrCXmlwMdihJY64Z/djtAZNd+ONgRQCBnorm+gVOOwMuDUeMsgXAXGk2bmv7N3PdXNG
X-Received: by 2002:ac8:2f4e:: with SMTP id k14mr17812063qta.357.1574689438496;
        Mon, 25 Nov 2019 05:43:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574689438; cv=pass;
        d=google.com; s=arc-20160816;
        b=Abq438GX8FyKGL1KSvpC3JN1zLdchzrKcDdQuig5elARdNwCLXo3R95Knujn7oxFO0
         eW+FprrbqZSiZtE/YOh8bFtU7UWjquVcyv7pA6vtWmOPI2tiM3Xm7vp6+j7pPyoEQPVa
         F566qpMtrrZFyCikJ8z/qYGNuvntwizNgCW53hOfPo6CDhEo/V0eGopTh+evvA6yHtFc
         GgJYcF7jytdgX0k15SmW5/Ru0pea95wtDkEOfAoE1eAtqGmYRLlyTHmdNBTp2E2NJJxF
         I/xLR1Y6T1JWdivW45kd86wucV9uuqNNz92nEWT23269QU5eT9QdW/n1ujA/IACrU962
         y3kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature;
        bh=vlJzH3Ci31C5SPkJJp9StA5ANNvDy9cb5LlDl788HrQ=;
        b=fkb0vQzsJVI6S/f21Ecq8YINkx1vdPqkJNfrJ9V7xURsZj7v63UGZ3zUI1l+SHrxay
         pddSpvv7jPXSXUFb2aMqMinIwdtPjtxKaX/mLJ76nyMSdWbTXKvi5QpnqNJiVSWmwPcU
         JVAOnZKlaqC8FVind+wQBLhmZ12k8uNSZZ1ajVxC1CGa3clgQzPMdiOYinRHcZxuYVRH
         XQnI8rdzrI115bPb/Ii3Qi8WNBThrSD5usMzx2245fef4pny3h7lAtnBUpU27RgLC7ZY
         2siEa9WyIrn5RWPSAhLycWb2rcMLhwb3MBjd2Gq+cNFIOcnJOnQEHEgZ2yf8QbxCf0/y
         xWaw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@mjberubeossiaco.onmicrosoft.com header.s=selector2-mjberubeossiaco-onmicrosoft-com header.b=ewEA30d7;
       arc=pass (i=1 spf=pass spfdomain=ossiaco.com dkim=pass dkdomain=ossiaco.com dmarc=pass fromdomain=ossiaco.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u31si5143039qth.20.2019.11.25.05.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 05:43:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@mjberubeossiaco.onmicrosoft.com header.s=selector2-mjberubeossiaco-onmicrosoft-com header.b=ewEA30d7;
       arc=pass (i=1 spf=pass spfdomain=ossiaco.com dkim=pass dkdomain=ossiaco.com dmarc=pass fromdomain=ossiaco.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iZEej-0005OD-LH
	for alex.bennee@linaro.org; Mon, 25 Nov 2019 08:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jean-Hugues.Deschenes@ossiaco.com>)
 id 1iZDg1-00013S-Tj
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 07:41:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jean-Hugues.Deschenes@ossiaco.com>)
 id 1iZDg0-0001HB-Pz
 for qemu-arm@nongnu.org; Mon, 25 Nov 2019 07:41:13 -0500
Received: from mail-eopbgr670067.outbound.protection.outlook.com
 ([40.107.67.67]:47488 helo=CAN01-TO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Jean-Hugues.Deschenes@ossiaco.com>)
 id 1iZDg0-0001FS-ER; Mon, 25 Nov 2019 07:41:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cc4kuliiiryoCmqKGZ7H9OsQNZdbS9a8r55EOkoXIuIHCJJCU4QvUMhu4KUz8kud+uMwAtKkxU/rPNJZ3jMM2qczG4rfttQ26SlbB4bXnXvLYgBdiDw8zco5A206aszQ64MBDqyskrlNYBWXsfAbIt28aedZUf+IqdSszt2nOX787rUKgXg7zNXfhdEVxhaP4IqVMKo2D05s6kmsRO4/bdyxzePUcf7ou+8Z63lfKiIja3LGrJb2uoSlUMAI8vQbzxgCh4KlO2LTcr6YNNxD0pOfBUh0fHicgl0hGpZtz4SeZ6UZiv36RyHhnnRP5RGqgLxmoG+S2n8Mou1XT5OlWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJzH3Ci31C5SPkJJp9StA5ANNvDy9cb5LlDl788HrQ=;
 b=DrPi8yL0qbSaNy+1O1K/jsA7TDeWtZ63MwRtEkpBUStCskw6G9w8pPNwWGze0cJUTZKcolhE5av+TGpGBxxznVroJ5vDjOzb02j2hOpseqlx1qtoMMereE30TlPFiMCYYrVQOx/53YELTO/6QFHstWLITZqvUNO1gOBOyjGkvHfx6mIsw48wOfSmWqUvezuDYNEY04IiGwRi3/Fxnd8pNHLQ0A5g+NvWrPTFx6VfLS/AZeGusyBqcwo7nChQ/W3EEmBgJ58WNkq/kutpi/IzsYlAdI89kig3nM2gHn96f2dnas2iPmnJi6qX2o0gQ9Q02ZF//QAPFZs09IngHLopuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ossiaco.com; dmarc=pass action=none header.from=ossiaco.com;
 dkim=pass header.d=ossiaco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mjberubeossiaco.onmicrosoft.com;
 s=selector2-mjberubeossiaco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJzH3Ci31C5SPkJJp9StA5ANNvDy9cb5LlDl788HrQ=;
 b=ewEA30d7phy6fyBR6KpDqjiGvCm1tNINLr9nOkfz7ZqElL3SRdtZw9QIR59Exe/RrxmFQI2C3CnzITKU38etqBx8l2F/i0B9Z1W3Y36RqvfmvxZ9mCpuNIV6z4qJzQ3Wq+pg+c6n8DBLN/QLTCDyg95K4B1se5LqdtM5YKBbv50=
Received: from YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM (52.132.79.154) by
 YQXPR0101MB1079.CANPRD01.PROD.OUTLOOK.COM (52.132.82.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Mon, 25 Nov 2019 12:41:10 +0000
Received: from YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6d20:2d18:b0ed:3459]) by YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6d20:2d18:b0ed:3459%6]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 12:41:09 +0000
From: =?iso-8859-1?Q?Jean-Hugues_Desch=EAnes?=
 <Jean-Hugues.Deschenes@ossiaco.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: [PATCH] target/arm: Allow loading elf from aliased ROM regions
Thread-Topic: [PATCH] target/arm: Allow loading elf from aliased ROM regions
Thread-Index: AQHVo42dAgdlcFdTL0aHTFeU06w+BA==
Date: Mon, 25 Nov 2019 12:41:09 +0000
Message-ID: <20191125124055.19286-1-jean-hugues.deschenes@ossiaco.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::30) To YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1f::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jean-Hugues.Deschenes@ossiaco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [66.131.216.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad7e87be-5c24-4236-c638-08d771a4bf6a
x-ms-traffictypediagnostic: YQXPR0101MB1079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <YQXPR0101MB1079FF9C23A048A035AA9391A04A0@YQXPR0101MB1079.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39830400003)(396003)(136003)(199004)(189003)(66476007)(66946007)(6436002)(8936002)(2906002)(50226002)(25786009)(6486002)(8676002)(6512007)(107886003)(71200400001)(71190400001)(4326008)(66066001)(81156014)(81166006)(6116002)(3846002)(102836004)(6506007)(386003)(316002)(7736002)(26005)(2616005)(36756003)(5660300002)(54906003)(256004)(110136005)(2501003)(508600001)(305945005)(14454004)(86362001)(66446008)(99286004)(1076003)(66556008)(64756008)(186003)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:YQXPR0101MB1079;
 H:YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ossiaco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GBBmv2pE5m+pN9vJizEAv6mYzyT6xk3wcxAIMwXtWv0wRONSXWZZ/o0YxuRnbcDbo9pabiYbWNdslET7ejgx6KNUUrraOh6OLDpx2oBqlBCuPTyYUEn7cwFVeYh++NHmAb+CZRhXwQPrdNLBrsupCWv8rKFVNQoa7P7dUGfs3c+GZlWpT2xBwsdbB5Tagb6f5qSPdgu1Z71APObYlbz+5s8xtFjwEMoG+iYx43pqBxPDTC+dhwzl3NINuYGolF0Cl0HZwCIQrQgQucyYgMsaZ2J9blHD+O+jLc1hKiZfDMskWwmWugTmaCK8mymb6arja0ZzETfR/PAEYgngQ+IwVICJPBHQLtR1FOOay+62b1+nlZbr9Ro3TWtoz3iJK0M5WO9evZlogfInIhU41spwxJ/87QBJZadWvveN6SkgftUW4EsjS6HER5RR9poz2Nih
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ossiaco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7e87be-5c24-4236-c638-08d771a4bf6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 12:41:09.8194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7b948053-cc61-434b-af8e-9de586f466aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fb6plKJNkdpSE0T1A4iqdxa15Hqqh7AjbqKu4/iwxkap5w4EUhc6lssGZ0WCd6EjKKGF7VT3ER4aFCrkJNhLZUGkJoS/nhB9XoAqdEjPUnj1tzY++0qZuVd0E71AcXB2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR0101MB1079
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.67.67
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:43:14 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "martin.galvan@tallertechnologies.com" <martin.galvan@tallertechnologies.com>,
 =?iso-8859-1?Q?Jean-Hugues_Desch=EAnes?= <Jean-Hugues.Deschenes@ossiaco.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GKaRTOzLBzmT

With this patch, we allow loading a ROM image at an aliased address,
when it is located in a memory region for which an alias exists.

Signed-off-by: Jean-Hugues Deschenes <jean-hugues.deschenes@ossiaco.com>
---
 target/arm/cpu.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7a4ac9339b..00d89f8c38 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -313,13 +313,32 @@ static void arm_cpu_reset(CPUState *s)
             initial_msp =3D ldl_p(rom);
             initial_pc =3D ldl_p(rom + 4);
         } else {
-            /* Address zero not covered by a ROM blob, or the ROM blob
-             * is in non-modifiable memory and this is a second reset afte=
r
-             * it got copied into memory. In the latter case, rom_ptr
-             * will return a NULL pointer and we should use ldl_phys inste=
ad.
-             */
-            initial_msp =3D ldl_phys(s->as, vecbase);
-            initial_pc =3D ldl_phys(s->as, vecbase + 4);
+            /* See if the ROM blob is aliased somewhere */
+            hwaddr len =3D 0, xlat =3D 0;
+            MemoryRegion *mr =3D address_space_translate(s->as, vecbase, &=
xlat,
+                    &len, false, MEMTXATTRS_UNSPECIFIED);
+
+            if (mr) {
+                rom =3D rom_ptr(mr->addr + xlat, 8);
+            } else {
+                rom =3D NULL;
+            }
+
+            if (rom) {
+                initial_msp =3D ldl_p(rom);
+                initial_pc =3D ldl_p(rom + 4);
+            } else {
+
+                /*
+                 * Address zero not covered by a ROM blob, or the ROM blob
+                 * is in non-modifiable memory and this is a second reset =
after
+                 * it got copied into memory. In the latter case, rom_ptr
+                 * will return a NULL pointer and we should use ldl_phys
+                 * instead.
+                 */
+                initial_msp =3D ldl_phys(s->as, vecbase);
+                initial_pc =3D ldl_phys(s->as, vecbase + 4);
+            }
         }
=20
         env->regs[13] =3D initial_msp & 0xFFFFFFFC;
--=20
2.17.1

