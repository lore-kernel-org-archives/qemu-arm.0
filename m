Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3486893wrx;
        Tue, 19 Feb 2019 06:47:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaRyQM2lNVyOfAqwZIghrzsQGlR4Wnt2c/XUEWZ0gtXI//UHL/UeTP07SWntso56O9v6aLj
X-Received: by 2002:a81:388a:: with SMTP id f132mr22367375ywa.98.1550587636403;
        Tue, 19 Feb 2019 06:47:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550587636; cv=none;
        d=google.com; s=arc-20160816;
        b=GJ+YXj3Plj70Tb7CnRWW6XhIyXc9em6c30lNS0Tx5U6pc0xedvZIE6JBbHCGrgzNpv
         jsScLj7sibsceZUrDVe4XfUILEzgHu1B/A9rsYL2BnJ6nLqaYhV6zoxm5zOLeN3r3snp
         qVhKVegtdG61MHRgykHSe8ZG0GMrUVqeUTeKKiItYeA7ZN3DMaozKFnPexc7WoDut4wh
         bi9+wlJzSgxILVGp1bIRj7UIXHevRi0ni3Rv30d8Bam5fmd9FPwqSfQN+oQUvdDq4mP4
         vVS+tKkJEff37UHZOhrWgrfhnJ143ewj0qpj2qQY/1DCy3siFxt1yjoedcBRnJMwTG4Y
         yMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature;
        bh=dqMxihVBNNKuzkyq2dCFBjG6L/7iBPuH94KHJMxoi98=;
        b=zdz6EbQyA8zh1Al1//hipvHwmDvNHQLDMxVMmwq7jKe/rz7CK3c7GMtCnTIyOwM0w4
         pcrK5R04s8OICiWLFBIgnLyEMafiTpupyWW7Gcp0IESEwIFKejFQUY5IgGNfLmR/NhbP
         3exLAYJCiWCccZw0OSR1KaBygRzs3O2gTgs2kRqYZKOWtCadV4aOhdenda54cOkCHLOC
         ddfsBU61FShGCOX+3AjZs6FHbFFhnxymESYC/3EiCjjlcNj5pQ74jojulnzQVARvcqXZ
         7DAtmbEtBgiaD9+C2neNW6rvM2iBOy51bnfsKnCdzdqAsDtUiVo4HT7jK44PBoO5Zesf
         sl1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=IcLMmhCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si9512258ybg.425.2019.02.19.06.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 06:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=IcLMmhCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:49910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw6fz-0007gs-So
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 09:47:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gw6fm-0007gm-Gb
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 09:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gw6fl-0001aD-M2
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 09:47:02 -0500
Received: from mail-eopbgr770109.outbound.protection.outlook.com
	([40.107.77.109]:15184
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gw6fl-0001Tv-Fk; Tue, 19 Feb 2019 09:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dqMxihVBNNKuzkyq2dCFBjG6L/7iBPuH94KHJMxoi98=;
	b=IcLMmhCEH6PZqHL9K9kBeZjuMRD2ug+sGhI1uC+EltJmvKlvKdMmVEC5fDqpbqbpM0ng8HNkGlyrmGc4YSgRQyXLCi1HnqgUb8MWZZUS1dkV5YwZ0jHE+Waf+pNyQFnkqPI/J8EKfCvcccfDECuH/QlIHUZuNoJxhO6JfeImJsg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3979.prod.exchangelabs.com (20.176.73.12) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.14; Tue, 19 Feb 2019 14:46:43 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1622.018;
	Tue, 19 Feb 2019 14:46:43 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [PATCH] target/arm: Stop unintentional sign extension in pmu_init
Thread-Index: AQHUyGHuAxrLE/mSg0ShUL6vzJCq9A==
Date: Tue, 19 Feb 2019 14:46:43 +0000
Message-ID: <20190219144621.450-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR05CA0024.namprd05.prod.outlook.com
	(2603:10b6:405:39::37) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abf2ed7e-c735-4f0f-7530-08d696791097
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3979; 
x-ms-traffictypediagnostic: DM6PR01MB3979:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR01MB3979;
	23:8e9Ia+PL88uXCdSrTq/ib3VIZ1YTemJewa+LkZg?=
	=?iso-8859-1?Q?WxvQOGi3Xw71PrZlzYyqDhQsZSMMuPSlEQ1weC81fg9K6uOuDg78ylcTeP?=
	=?iso-8859-1?Q?ACkxPSTZu5ci1RKy/Z5ohlfeQBH9wIwY+JqYsFFn+EQlGHWBhNdZ8kIjuU?=
	=?iso-8859-1?Q?2mSr/YYkxTfrJJ6TuDWYMabioVIXLAqRPGj8B5+kPujtlyQYCh6PHS2Qd4?=
	=?iso-8859-1?Q?Aoi/hxanWC0qwNUM/VoYLMQ7n6vqtRXFNX1NE/fpivMuKvpC+OAdjGUOPg?=
	=?iso-8859-1?Q?Bn/jFnem/UUhHW+5I3tW8kYSP7uRCB3GLocNLu+ZsMuqiyujtVtC+JgC4k?=
	=?iso-8859-1?Q?hNQ7MsV5iV2VrVb9pPjVMGwKvRZ4D9+uOdVztexdfXcRcK52jDw5HGH2q1?=
	=?iso-8859-1?Q?vlOBrPHFYkI53B2LH8GAIft7S7n2a0qSkDHHZR3UZbOcNSYbzOHAbf+101?=
	=?iso-8859-1?Q?k43HVwT0G8yQ/lOw7gW7JSHpYjpBuzUTb4EdYVm0pOUf8v16FTTAAcANIl?=
	=?iso-8859-1?Q?+uBrc2UCpv0oAmTrp5tyFOo/ONNYNyxGqWeIyU5Un+p2PeG92VHcIuFjWY?=
	=?iso-8859-1?Q?JV2/HiaBndO8n4qUdhkbw2dnx1JowAyT86mSvlESD2QYOV3emofNhqXn2e?=
	=?iso-8859-1?Q?NEsKWjdW0v2US2Llemmp1FVRrapNC3shx2UNFUohEt7RMBmLAyLgvq1yMa?=
	=?iso-8859-1?Q?a4zMFeN4CsPooMz53jkE7x1xs1IlYQXhhiK3rIcxbVWPNPKVzztkjA3Arg?=
	=?iso-8859-1?Q?vYV5y98BkOTvTupdUruHIS5tOjPV7F6IkFlhj8eISky0CUEGEcDBoffpnO?=
	=?iso-8859-1?Q?dhavZQwaH+hagFC1RhAGs5yYJ45xNRv3ocnCcZYBhL9KrdzetlYoKhfizV?=
	=?iso-8859-1?Q?QD/Tne1j0IS+7OXpkUVAFMfE82XwYFL6dy+CwEgrM0/IBSeXwci4hykbHt?=
	=?iso-8859-1?Q?pQ3h+o7QCaX1l6C0pCzQ4xZR1+k2D6ht2eoCMea1+WgS+QKwuWYstG6IZj?=
	=?iso-8859-1?Q?nkOxe1kGY+JMU6fJhb0js0v4R1FWxYN2wa6/xx/HZW6bKZn4h2RMNawjjA?=
	=?iso-8859-1?Q?jChw4Rp580CcL0ZpDnQCM0wlqG6daNBNhPHTiXzQlqH7Tf1hVP183gDHAn?=
	=?iso-8859-1?Q?DinGmYyfFdFPi1dgDybTGMu8BeJWziI5qW88qxPyp3fRkbqoDDjIcrXwi0?=
	=?iso-8859-1?Q?qUJIVqNKxYPNyNf0VfsAUAVTfaj9+aFHzTTtWcGV95rZVY3JSziweqZe/u?=
	=?iso-8859-1?Q?e/z7QLYoP9xsxwuwQ?=
x-microsoft-antispam-prvs: <DM6PR01MB3979E06DE56A4A93F75915608A7C0@DM6PR01MB3979.prod.exchangelabs.com>
x-forefront-prvs: 09538D3531
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39840400004)(366004)(346002)(376002)(189003)(199004)(2616005)(476003)(6486002)(486006)(26005)(6506007)(97736004)(386003)(186003)(6436002)(3846002)(102836004)(6116002)(6512007)(2906002)(106356001)(2501003)(25786009)(66066001)(105586002)(50226002)(81166006)(7736002)(305945005)(8936002)(81156014)(8676002)(107886003)(4326008)(53936002)(14454004)(478600001)(256004)(14444005)(52116002)(110136005)(54906003)(99286004)(68736007)(316002)(4744005)(1076003)(86362001)(71200400001)(71190400001)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3979;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5sFtDtF1Ttz7FbH/eZxIUI9NJxIN6dc1vwZPx/5GKZOvRGxlgVHMBfdF623PNHIfP8/ss6T+tYdQXlnKE2WYaDBhIgrP4V6AqnDB+7InNZXlPG1aWobVwwCVptc+KaarCRAFxwm+AKqseyF8cdBPYfFUCyye64Ehtcuq+evgcIQm8rmB2d+mPQwMdnklyLfYQcpxrVB5nYLs6+9rk2vc+LUkmW1DGlGzXB7k5WTlQugh7yuriKkXRF2DKQaMUirOEm99HRGBf/W82WbU0Gad79pjK0qBAgGqoh3E+NsJLBFnIIEsHF68pu9E3aq3CTjEKB5PTD51j181cJAAn0AYjQ+eDDzUQ6LUg73uLPJspBEXkHik5Ge53QNefRGashLFMtZNNPzqxcXepkaGYid3fKr3MlFlVqdJAFRdKDlP2dM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf2ed7e-c735-4f0f-7530-08d696791097
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2019 14:46:42.9261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3979
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.77.109
Subject: [Qemu-arm] [PATCH] target/arm: Stop unintentional sign extension in
 pmu_init
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mFBCwE6e41v3

This was introduced by
    commit bf8d09694ccc07487cd73d7562081fdaec3370c8
    target/arm: Don't clear supported PMU events when initializing PMCEID1
and identified by Coverity (CID 1398645).

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a018eb23fe..5a29bc9799 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1167,7 +1167,7 @@ void pmu_init(ARMCPU *cpu)
=20
         if (cnt->supported(&cpu->env)) {
             supported_event_map[cnt->number] =3D i;
-            uint64_t event_mask =3D 1 << (cnt->number & 0x1f);
+            uint64_t event_mask =3D 1ULL << (cnt->number & 0x1f);
             if (cnt->number & 0x20) {
                 cpu->pmceid1 |=3D event_mask;
             } else {
--=20
2.20.1

