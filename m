Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4789186wrt;
        Tue, 5 Feb 2019 05:52:00 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZg2WOyw0L3N3RdsujogBR9xzaHW9w42BAJ0Iu1GE1mr365hrVN0g9odfk81QARm0TrSimZ
X-Received: by 2002:a25:dc49:: with SMTP id y70mr766369ybe.288.1549374720856;
        Tue, 05 Feb 2019 05:52:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549374720; cv=none;
        d=google.com; s=arc-20160816;
        b=d64/CCIAEqNWd8fXjRYYyEV+VnmFQiH87bGcFIR9vuovVCUegEVOjIY2WIHB8TWZhn
         76XL5Qf/Uqs0YKuiYE/89W3XHg7GQb9JTbUHoGFuNXvFgZcB3hDyNEob92KeJopCoWM9
         hXmv+KlzEJ6yUWJkg3O8hFD5OmleEMPYMXvCHL/quxyIamPBUI48uE5Q2l7yKlUqLS3o
         GJCWfRHWiIXHJtAJ5BcTALmT48ZDsZiImMxnqcjZh+0QzFqVXvjGqy/vm/8Sg5ysEg22
         MQuUCtl8D8sTU6U8Jf5KptdxglVb1ZNnRAc7vDpBMFPLMQ4IavgnVzYpkSe4pPXYSdcA
         +GuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature;
        bh=bfrVUfcsXJDaOUsKK/7fVEnAjMxnox6afTLn5mrsrPE=;
        b=Nn3Ex9qAxaAmoNaSI/vro6hjZSb8v/J4wMr4y6mLCb6DB8soWK2xbXkTZ2YjlexIkK
         9A/4FQyFUAEs12n8bafi+1m9v5dx5TDdjv0+wc0HRMCdp2QlaRM4x/rG2Ag7+Ix7rqhK
         DBqS9niK57u1ct27FhhduArKtqNiXpjEm0w3lJz+phEiqxkqgy1a/bVha85s6SQKnuVT
         5NPT+VD5sIbQIFY988/b+Yv3xUCZ15QLSsLf2Y7IpA6BNjr0HEVHGc84iuylps+Vnj0H
         nq0A/ErVEljOVyndYbdcrHuYneIDOsOfEGUCMjiCbY/mePeoLcFmgPP/xYVUpPC982Cy
         s1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=rXufLNk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q66si2012548ywe.95.2019.02.05.05.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:52:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=rXufLNk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:60643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr18q-0004lo-BN
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gr18e-0004jX-8S
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:51:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gr18d-0003HG-BJ
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:51:48 -0500
Received: from mail-eopbgr710134.outbound.protection.outlook.com
	([40.107.71.134]:34896
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gr18b-0003Fs-It; Tue, 05 Feb 2019 08:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bfrVUfcsXJDaOUsKK/7fVEnAjMxnox6afTLn5mrsrPE=;
	b=rXufLNk8i8bH8QDE2s8xHWG2M2QIiqBwmPX4xzSnUexBjqYOb3v/4jWaPOEvWswt2qZVzNN1KkZ9QgPel2KJ5npGOuA+JeHvWVkHmSQM+Snn0ldAWoXPIQBD0Mfdt+d33ZuXBftMDSTLPu0Q3Adre8H8SM96UzruagbcB24YmNw=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5516.prod.exchangelabs.com (20.179.68.155) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.17; Tue, 5 Feb 2019 13:51:40 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1580.019;
	Tue, 5 Feb 2019 13:51:40 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>, 
	Laurent Desnogues <laurent.desnogues@gmail.com>
Thread-Topic: [PATCH] target/arm: Fix CRn to be 14 for PMEVTYPER/PMEVCNTR
Thread-Index: AQHUvVnrIp98DI23VEO+wJk1zZLLpw==
Date: Tue, 5 Feb 2019 13:51:40 +0000
Message-ID: <20190205135129.19338-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR15CA0015.namprd15.prod.outlook.com
	(2603:10b6:910:14::25) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5516;
	6:OdENzsoQyl+Wbeu1Tb2RJRqO9vBdt9todZ0FK6CeitQaIc9BgL4VgSUYnUtw4BxuZu0X5FSyFiuLK24WKpR9MN7NY1Tc20iEmW4+ZL9BP4b8z5YEVGOuIRWSnxK7CJvd7ndri6TmOxdPcQ5/M7Omec/23+DikX4bSJvSiHCGmhiN5Vm34FkUDF2qJ0jjuwWjZyGlYZVYKPXt4b04o0R/J8FnEE+SaIoMaRmHohtnqXH3CFhJF/B5s3y1T8klXqWh0C9kVBnj/fMFH1r723Dl2WzQLTx+eh0yLHga0sOScKF3zig34WwUqDpJB79MzA4xwOnwioaw1M/MqstvXlDu237DRtX3/DYnObUG4koQJrRVwYbCgcDAoV4t9UPj8ZWhZQMRUNhyf7UpuIbGyCSzmS6b0QS981nSS+2IjYqdxhLIMLWOvCk3hI2i6jKJh3og/EhAO3cl55qMUo5tWrFERg==;
	5:KPUcTqWDJ4im82Nv6auWYso/dJX7ubDQx82nLo1qCxQSXEDOAOych/FJ0XmIJMO0EScM2n3hiakXhlqfpTDSsUBPPunL1TGqB4CB7JjtIlTYZaAVbLj8Lyiy/1wkl42B5c8mPFfspzpuRiVNb4OU4deBCjvpQixxTa0Id9VqO+ok7b3BlTb9m1nsHeDkrPcXcJqvD+0VEBFXmvZmfB292g==;
	7:hX++WlRv06SFVYQtp/hQ36ObO/p6ep4M6yd7vifccoEM2GbU2mAEq2hNES17RHRrvqtYDspvUvFRp+Gr/CVNaRD6432LDCMTr2IxX1CCy9JR4J8P/b72S2itEcnr6+0q3QSs8EqVFeLlUXmm09xHjQ==
x-ms-office365-filtering-correlation-id: 3a425313-9c7b-4e1e-5bf0-08d68b710e0a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5516; 
x-ms-traffictypediagnostic: DM6PR01MB5516:
x-microsoft-antispam-prvs: <DM6PR01MB5516AA633D716102C9966A328A6E0@DM6PR01MB5516.prod.exchangelabs.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(39840400004)(366004)(376002)(136003)(189003)(199004)(6512007)(186003)(99286004)(86362001)(8936002)(50226002)(1076003)(102836004)(6506007)(386003)(52116002)(3846002)(6116002)(53936002)(7736002)(305945005)(107886003)(54906003)(110136005)(316002)(2906002)(8676002)(81166006)(81156014)(66066001)(25786009)(4326008)(97736004)(14454004)(68736007)(478600001)(105586002)(486006)(106356001)(6486002)(71200400001)(71190400001)(476003)(2616005)(2501003)(256004)(26005)(14444005)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5516;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ja0801I01Qdrk+iLIFgvfrEyCHIHBMK+tWVWw57DTxs1axmBRrwJRPmk02hU1SrJo3n0EXMbO2jzXeq2HBThCDmtPpAwyYGOFwyzU9j5GCU0mGugIG6n+V8T2c8cjGu6bCvYiDAf/AcAqOFe2Hssg3lDa1sVB+zgRQVq3O0iN7sKC30a7I6antQHTxImuIzZRIomsXpXlBq1dVbwXjDH9KbGKOI8+cUl0Iy+nbizIC/rup/Q+4kwqwQZ25gbC12NYhnjXI2rSuh7stD2NZVGx+j4NAO1CxmT/sR80Lb4epjP+kKdE8Ht3w0VUq1iyZT68VMRu13KYwUNHveL9EDeDdaXWQySML7alk+hYq0V35xiuWa11/Va6UY7oCJrhd0N2n5s042SNW7tcHjSu8Oq88F6Swoh7sz/g84ZeWByaBc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a425313-9c7b-4e1e-5bf0-08d68b710e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 13:51:39.6534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5516
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.134
Subject: [Qemu-arm] [PATCH] target/arm: Fix CRn to be 14 for
 PMEVTYPER/PMEVCNTR
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
X-TUID: /M2PxEWEuBP7

This bug was introduced in:
    commit 5ecdd3e47cadae83a62dc92b472f1fe163b56f59
    target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d070879894..ec2d17093c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5855,25 +5855,25 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             char *pmevtyper_name =3D g_strdup_printf("PMEVTYPER%d", i);
             char *pmevtyper_el0_name =3D g_strdup_printf("PMEVTYPER%d_EL0"=
, i);
             ARMCPRegInfo pmev_regs[] =3D {
-                { .name =3D pmevcntr_name, .cp =3D 15, .crn =3D 15,
+                { .name =3D pmevcntr_name, .cp =3D 15, .crn =3D 14,
                   .crm =3D 8 | (3 & (i >> 3)), .opc1 =3D 0, .opc2 =3D i & =
7,
                   .access =3D PL0_RW, .type =3D ARM_CP_IO | ARM_CP_ALIAS,
                   .readfn =3D pmevcntr_readfn, .writefn =3D pmevcntr_write=
fn,
                   .accessfn =3D pmreg_access },
                 { .name =3D pmevcntr_el0_name, .state =3D ARM_CP_STATE_AA6=
4,
-                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 15, .crm =3D 8 | (3 &=
 (i >> 3)),
+                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 8 | (3 &=
 (i >> 3)),
                   .opc2 =3D i & 7, .access =3D PL0_RW, .accessfn =3D pmreg=
_access,
                   .type =3D ARM_CP_IO,
                   .readfn =3D pmevcntr_readfn, .writefn =3D pmevcntr_write=
fn,
                   .raw_readfn =3D pmevcntr_rawread,
                   .raw_writefn =3D pmevcntr_rawwrite },
-                { .name =3D pmevtyper_name, .cp =3D 15, .crn =3D 15,
+                { .name =3D pmevtyper_name, .cp =3D 15, .crn =3D 14,
                   .crm =3D 12 | (3 & (i >> 3)), .opc1 =3D 0, .opc2 =3D i &=
 7,
                   .access =3D PL0_RW, .type =3D ARM_CP_IO | ARM_CP_ALIAS,
                   .readfn =3D pmevtyper_readfn, .writefn =3D pmevtyper_wri=
tefn,
                   .accessfn =3D pmreg_access },
                 { .name =3D pmevtyper_el0_name, .state =3D ARM_CP_STATE_AA=
64,
-                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 15, .crm =3D 12 | (3 =
& (i >> 3)),
+                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 12 | (3 =
& (i >> 3)),
                   .opc2 =3D i & 7, .access =3D PL0_RW, .accessfn =3D pmreg=
_access,
                   .type =3D ARM_CP_IO,
                   .readfn =3D pmevtyper_readfn, .writefn =3D pmevtyper_wri=
tefn,
--=20
2.20.1

