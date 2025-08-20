Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51831CA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 14:30:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uojpK-0008Lj-Qr; Wed, 20 Aug 2025 10:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=320342eca=Moritz.Haase@bmw.de>)
 id 1uojpJ-0008LE-FR
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 10:30:09 -0400
Received: from esa7.hc324-48.eu.iphmx.com ([207.54.71.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=320342eca=Moritz.Haase@bmw.de>)
 id 1uojpG-0008FV-7X
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 10:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
 t=1755700205; x=1787236205; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=mhgaWx+W6BL2PNOuMjl6LbvqthlRhXYFjmVSXSZVukI=;
 b=k9bsq6RyD7pLvD8CNDvQOZhDgWMx5xE+IL1bp29Q1RKxUvUMQnW9Uz/S
 r2sGcJsHJcL6yEgR0S39p9TMars8d9NfOp5vbjjYHUrpnNVKHclibiClr
 FMujagh9oxqiwjkblXsMQW288dpl7+/N341WYIxOIlnMYuxLMRAIkbpDO o=;
X-CSE-ConnectionGUID: QEN0IkAJTXOpKtrtlM1aDw==
X-CSE-MsgGUID: GIYNs6ItTk28miW1ItXrKg==
Received: from 160.46.252.39.spf.bmwgroup.com (HELO esagw4.muc)
 ([160.46.252.39]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Aug 2025 16:29:58 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw4.muc with
 ESMTP/TLS; 20 Aug 2025 16:29:58 +0200
Received: from smucmp11a.bmwgroup.net (HELO smucmp11a.europe.bmw.corp)
 ([10.30.13.91])
 by esabb2.muc with ESMTP/TLS; 20 Aug 2025 16:29:58 +0200
Received: from smucmp17d.europe.bmw.corp (10.30.13.154) by
 smucmp11a.europe.bmw.corp
 (10.30.13.91) with Microsoft SMTP Server (version=TLS;
 Wed, 20 Aug 2025 16:29:57 +0200
Received: from smucdzmp11.europe.bmw.corp (192.109.190.46) by
 smucmp17d.europe.bmw.corp (10.30.13.154) with Microsoft SMTP Server
 (version=TLS; Wed, 20 Aug 2025 16:29:57 +0200
Received: from MRWPR03CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.46) with Microsoft SMTP Server
 (version=TLS; Wed, 20 Aug 2025 16:29:57 +0200
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com (2603:10a6:10:d7::16) by
 AS5PR09MB6841.eurprd09.prod.outlook.com (2603:10a6:20b:67e::9) with
 Microsoft SMTP Server (version=TLS; Wed, 20 Aug 2025 14:29:51 +0000
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459]) by DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:29:51 +0000
X-CSE-ConnectionGUID: FKuP9pTPRL2wNeTyAXaNTA==
X-CSE-MsgGUID: tvzTErDYS/eubCCDk826ag==
X-CSE-ConnectionGUID: +JfIpUe2RwOfNULLWrrMFQ==
X-CSE-MsgGUID: +A2jTfoBRYWi/mJBhWO9tA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU2qUL220upTBSuVtOWDz95mJi7vnUhO18IDzNaTLWdoxibAfWbOj7yrXPZaoLHFnpNwmnF/hv5cgVSnKObVM5urhhnf09NrBzqg4oB/0aP/2RQB2951m76wawhC0ttZArrpQEve9xy5m3IX3rig8ULbkgQuedK0TwL1tlOyWaxYKAazWt5Uf4JKQjcdWnvarUum5G98SMr4CZ1QqZcvZxzY6OdMebW7Z4ZZW/U2PTVI6+XTP8P9DKaG1QCSt0+ERzJ9n8xMlKVeEzdqjhGzTW+FrAQOAzhAIK/kBlEab6v4hLyyu7dacQWguT3bnHX23FX2Rv/h04Z1cJDRP0lPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhgaWx+W6BL2PNOuMjl6LbvqthlRhXYFjmVSXSZVukI=;
 b=q0kOYNf+8ZQ8qMxEx7c7hl1fqoLobU+euzBGAob92odim5AAIohQuYPNWvN4xsgOLmWNyPRCnOQD8fWJsax0cU9O8LxGR6rHcbQHTw4CFz/HupUutxZszPLZEoYBqp4atxSsGt81S2CNKc8EFizZEfr18MzkBR+PiwJ93oBb7IF8kSg7LgeYpfQws54KgQMAKrsPC0yuvP9Q3rV/eg+5N3/NSMa1Nw/Sx8c150l9aALuzhyF8bxpAfoncrkO62kR/IM9xwVzy0luSmSZV1fj5I3y/jz6I0kFnusShJ+iowodCQC9Eadj5T+NB9JASUiYIqzmOdk62PGUHSj3jfukNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhgaWx+W6BL2PNOuMjl6LbvqthlRhXYFjmVSXSZVukI=;
 b=myyYRn+RbPtQbvGeFOP0l1bIsu5NvyQfzNE4D45iM29iRcYpy8JvpYUYvBe3vcFa3SX9RF3w6GTznm2CHrmXuj3z2AmBHxnqWvWY36pr8MjPvekcElPS0BA5m8xkyGMwffHGvXhawICW4abErB7+PWV1h1jeNseLPlAg3+1ekfsA/6Pmk5d/jSs8zM2xpxr9pThwg9HU6VpblN1GbdpHnHD1RLet7D7pHWxXR2CtXCVhJwZ8hGi4RLWH6IAcxrDP2WDa1tMdDiOymMoTOLF+jcf3d6zuZULotHyvwXtAKJZi+9OjW5lhKlGd0WKiLxMa0nRm/+aZ6hbnYdwDT+8qnw==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: [TSAN] Fatal "unsupported VMA range" when running aarch64 binaries
 via qemu
Thread-Topic: [TSAN] Fatal "unsupported VMA range" when running aarch64
 binaries via qemu
Thread-Index: AQHcEd2zgu4RlNWkj0aYWJpp0uyScA==
Date: Wed, 20 Aug 2025 14:29:51 +0000
Message-ID: <DBBPR09MB314311E9D531529DB410AF51EA33A@DBBPR09MB3143.eurprd09.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR09MB3143:EE_|AS5PR09MB6841:EE_
x-ms-office365-filtering-correlation-id: 4eb6828f-fa38-4fe5-a977-08dddff60628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|19092799006|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Wh3cD5E6xOZsYn81Wvl2v6jXGMg0iqS3xHG8sVOqdooxr3YD8Rm2S1418X?=
 =?iso-8859-1?Q?bXZy8j4ye8hWELGjIBouyWQ9MD9eEChpSffQu6LP5MQSRnrnHexy4MsqIc?=
 =?iso-8859-1?Q?1uFMdMNzP2CdT8sLdbLC87ivdwy9L7NsPa4J0+M3h+QD+Ohxq3Fu1VD/FG?=
 =?iso-8859-1?Q?fsa/16IPgf9eLr1inh4R0Mr5MqOKs9cmTR21xgzaTxeZORu2Yp3oIW9SJL?=
 =?iso-8859-1?Q?/DSYn0DaeQO0RIB+zlJv5ToTHXpQEwS/27Q8HoJ2sK7r3KCSacKiNiBD92?=
 =?iso-8859-1?Q?Q1MzNQxIsKhjWrU7DcFIn4CYM+FLRIBkrwNAZJs8vOr8hfia+c7Fnf8vB9?=
 =?iso-8859-1?Q?X2BuhxPVfZH3TQ+HZlCzEqUYWSOJHPovOk6mcBbhJGApyWfhdbAL5u6iVs?=
 =?iso-8859-1?Q?6dr8aUR16qsB5N6deUi9Nu93etNd+YxppaGerDMn6TW/wo62FoInbporyU?=
 =?iso-8859-1?Q?Q26F9HwOhsZu5yvtc7v412SdDo2iheEZUhoHjyYQ/Cjvfd7/kW07laRT14?=
 =?iso-8859-1?Q?mngyLaMA8R3SaLJE7Od1msb+OJC0+9+dg+tEfnY7bwagee2C33bDGZ0LPP?=
 =?iso-8859-1?Q?YauxqOApDvDyjVOdCGYITFakJqC/D7IFAJYIL0oxfya6fdRM2sn5Iu/BHh?=
 =?iso-8859-1?Q?0i9VQhP5snqF6mfPy3oETsqf57u6tc7ddk7PjFRNBI+KWVxxlyDYa5rZBJ?=
 =?iso-8859-1?Q?ug7XkafMkJKznYPl24wtoQe9cbdJGiNo/w0m/gwYOPvfxsYtlvZbR0H18n?=
 =?iso-8859-1?Q?LXkJdkOVzhM1XHzW6IB6Oum2sjPPcaDV336ISmagyzvTOQ3QbHxFar23H9?=
 =?iso-8859-1?Q?al65T6OSDoVVSL/izJtD6RMrMTurleprcNT+cy36RhiNFE7GL57DgcTvus?=
 =?iso-8859-1?Q?kmqiK2maRTikb40HJe4ZmLoX9PBKwBrJ70tPtmN0UfJIDSqzMmykvj2qym?=
 =?iso-8859-1?Q?S/r0EsOkvXGI7vpz/j6p6TaMpF96vwoeBrpBduRanxTcIR58ChK4oZdpHZ?=
 =?iso-8859-1?Q?WY+9j5YhBAj3dkVbc/1KB4BdutEXXnnVcodh76HVdRHoA4X2+mmmF0fcIz?=
 =?iso-8859-1?Q?6PQlIxqhQX794X0YJjJg+gDZ9OopRcLFjkUqUdXEMm9ZwRr3qrFSH/ECeg?=
 =?iso-8859-1?Q?5le+KjJf+lE2E/2wH1Dv6sg+m36B78eCkT5BlupwLO4BopDOYn+hNYSVtu?=
 =?iso-8859-1?Q?jBKV12kWNaM2lUthFmZUGfsWKMIylZNyPurlPGrFb2/8Nwqqfc/8S3afAk?=
 =?iso-8859-1?Q?TGh4C5TKMiWSFBWTuGKx/3AhIJu2RKQPFpEUsGcs4J8TFOGq2zuJLbs2Er?=
 =?iso-8859-1?Q?7IeWI1HLdw0Z8Ji9TGpLktF0mTMszRQni+rjMyhtIXhOkBIg5VY2X8Hosk?=
 =?iso-8859-1?Q?0t5hch/t8ov92jjcluMJ/NhsRFT9upFRGzPXt0tjtnw+78dhaY4Bmuszvu?=
 =?iso-8859-1?Q?cvvN1LuHeSmXIQphTDIRTW1JJlrusZa2jS4pEq0dUUxOQ7UTZ8kIIu6fGD?=
 =?iso-8859-1?Q?kQU68+OVBA/rVcRM55fxxXcYxhjo2ZqTSNmz8M3SlM2KnMjK4VgkF9PrOH?=
 =?iso-8859-1?Q?0HJZ434=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR09MB3143.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TabRcAy6ykEGKrEzYq30DS2YDXV957LokfYz34GaUJZm/EEqzgc0Reotpf?=
 =?iso-8859-1?Q?a/OHA1ZqNgi1U1qG10RTih/zxiAJc7xYivTWe19ntANS37u7KGdi1Rz3bx?=
 =?iso-8859-1?Q?hqS1aOxznXIPOY3wwN4jMtbPi7Hz2lQtwuGXEqLksy5WY/boHO8KTZ3bco?=
 =?iso-8859-1?Q?wIHEpOmz/A7PQWHU+ptq1e/aNb12zO6/khJv4l39FmhrvfbaxPiiOlQXB2?=
 =?iso-8859-1?Q?1hHPYjhL/Aaw3vuyDVJ9rAbBWYVZ1L7soTMtt5c89C2lJ9lTh6aQmBAoG9?=
 =?iso-8859-1?Q?GzNTzy50b8Sray4BfOWjvMMi7skoatv//G5Qk1XBTmFHzvUVwERZKFPPP7?=
 =?iso-8859-1?Q?XTVz/z1hCevDATSex6jcWorO0E2XqrhnOhQA3Y4So9z64WZ66mGsM2rAE7?=
 =?iso-8859-1?Q?LTnLj0MqkKJ7bwyZiI0J8/WeX+lcmEYXQ/2RZJHZGDWtDknCDoabJKI4N+?=
 =?iso-8859-1?Q?fj8tA+gcmT2AiMdUD3Tn++5xVygbc5ixz9aaAmGhDWD+f8yjZIblRr2wdT?=
 =?iso-8859-1?Q?2yK4Mcn4OzQo0P7sX5cvy54OsB4ZF/+1iK1OS37hwMQ0bfwCzhE0LW4WNe?=
 =?iso-8859-1?Q?xK41e8jcw+Ta3cY3nTgcCPz3zXKeC3g2aNT4KSS5DS90tsLA55wDMAaUk/?=
 =?iso-8859-1?Q?4re0h3C4rBoqYZtmCHT3PjNUaDXxh8xeTBayMtEaeVYHGHhNSs0VHfqtGY?=
 =?iso-8859-1?Q?V9WgDb+in6OcGstnumEL95e9P4g2jBvKxRNC+BZPEMYn0JpOiYSyUhPoqO?=
 =?iso-8859-1?Q?PESWL/a9YpF4eP/WE5S7H0wHe/N3DNIbJ/tQu2ojbVVhMSTqRuxQZyNmBv?=
 =?iso-8859-1?Q?O3/j0WV0JEW6ZUSxgEoUbw8jIvHxeCEGOaY+WIVyWia4s82pyANlNPaVaZ?=
 =?iso-8859-1?Q?VNtoZ/DvgIlNv6TINZNL9rFCIxMn1cj5fKTikD9Kz3YP6v8s8I88+GmzmV?=
 =?iso-8859-1?Q?GfLLx9ydlCGnoicgSnKL8yBnD/i06LnKx/WHmise+0SahMH/a0XWugqD/Q?=
 =?iso-8859-1?Q?GRKO0gnCCSzFBZty241ZZqjUp93cAzs9BSWog38/4uZYS+YyXAn9rx1f+e?=
 =?iso-8859-1?Q?ciz1bXVtMYp0whbNQnRejxaiRjqlsBn30oP7uo6apnDT2kqc/ir2CnNpto?=
 =?iso-8859-1?Q?LWlEB3gzydOPr8CARdZrxL+NmIjc2ZFxJOCgyPw666tzMvi3eZbJSnszNN?=
 =?iso-8859-1?Q?lzhlGRulcz1oVXucEpqEMPeb0ZIO6ZLMSLyaYLPfVoiqyUVQmv0yv1vff6?=
 =?iso-8859-1?Q?ENRc1wlSrLzQ7d0ngSzdXSNBrnvXtTqDQG/KX6rtvBuplx2Bz85tYeonp/?=
 =?iso-8859-1?Q?o1A1y0NB78wvmf18iMRMoxEAQLea76Y1oWInfmboMzRTfb8L9f/3D4TB4H?=
 =?iso-8859-1?Q?NiZ6qsB0czHSiH0HnPPwFRj/sIPeoxdA3YKO0+ujmDvevH/luHdec27uJS?=
 =?iso-8859-1?Q?ZZ6dpunggKJh9qQmnHjAfETSMfX8sya6uyvkY6tKLWocD6vjqZnmgRg7nj?=
 =?iso-8859-1?Q?76oyFYYYllGa0a3QmN0RSwQjF3c1sTR90Y5khXSctR22KpBdQVzWYFho1a?=
 =?iso-8859-1?Q?kUZxheQKjM28G/fwC5UpmjJrmXueH2fcmmdQyHqLMH955lAEGBi5bJINur?=
 =?iso-8859-1?Q?5gkGFOrZYmnv5cHMAEnYTv03wGxr8mfxSK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR09MB3143.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb6828f-fa38-4fe5-a977-08dddff60628
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 14:29:51.4616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dicWIf/AQd+xTLBZGtTpWn5oeR31k9bkaW5Jv+hrsGwd25OoByU/MjdB85CNft1OnwaDmWtqJjXiu4IRXRDxww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR09MB6841
X-OriginatorOrg: bmw.de
Received-SPF: pass client-ip=207.54.71.126;
 envelope-from=prvs=320342eca=Moritz.Haase@bmw.de;
 helo=esa7.hc324-48.eu.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,=0A=
=0A=
We are trying to execute binaries compiled with TSAN for aarch64 on an x86_=
64=0A=
host via 'qemu-aarch64' and encounter=0A=
=0A=
FATAL: ThreadSanitizer: unsupported VMA range=0A=
FATAL: Found 47 - Supported 39, 42 and 48=0A=
=0A=
errors.=0A=
=0A=
Environment is an Alpine Linux based (privileged) Docker container running =
on a=0A=
Manjaro Linux host with Kernel 6.12, but the issue is seen on other systems=
 as=0A=
well. Behaviour is the same with qemu 8.2.7, 9.1.2 and 10.0.0.=0A=
=0A=
My understanding of the VMA issue is limited, but it seems to be related to=
 the=0A=
'-R size' (QEMU_RESERVED_V`) option for qemu, so I played around with that.=
=0A=
When setting it to a value that matches 39 or 42 bits, TSAN does indeed=0A=
initalize, but still fails with a segfault.=0A=
=0A=
I filed an issue with LLVM upstream at [0] two weeks ago, which has some mo=
re=0A=
details, but sadly no replies yet - so I'm cross-posting here to ask whethe=
r=0A=
there is anything else we can try? Pointers would be highly appreciated, th=
anks!=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://github.com/llvm/llvm-project/issues/151931=0A=

