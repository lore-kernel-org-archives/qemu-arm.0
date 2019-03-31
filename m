Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3848054wrx;
        Sun, 31 Mar 2019 04:17:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwjf9ftcePq6rOYwRHwkWJ532RM72MOsS1lfUI1tVbwGySyO7euX5OcaCNNarVkFc1/D+q
X-Received: by 2002:a81:4fd4:: with SMTP id d203mr47597612ywb.379.1554031061931;
        Sun, 31 Mar 2019 04:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554031061; cv=none;
        d=google.com; s=arc-20160816;
        b=Qk8vcaMe4Zw6kLi5OBW4qhKMeP3SW5jx2jya4r+L6SoBpQP7rfiSxIIgunZuTaXGFW
         RWptYRzbaTdlbDEcxlD7DHD2TuqjnssKxVP3+Y3uMnrmZPw4ItwzMa4DtRXf65fwRZYU
         cI+NZRGGjbDvjUMBhQcx0itwCSqtWouwqyevtsc2OnHC1qu+0cIA9UM+jlKralSQMQqt
         c4NOqTHz7RKkcieBIoPOltSynnT1dAPweRnn2sr1Rf5XyHU3wWKwbsTU+9HmhHtfeF7L
         YlAfvpGrGvUnWa5HQe4oeHOgjVMQsPEExdEiP2CjzGEBbXI1QKlkFXD3mZO2FtVbvKcZ
         PHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=UnAJCewdHY41xHjMb2AVW4Rg09jwMnPvDujGzfG+Rgk=;
        b=N0j+25EBQS/60CsEdbDJkwb285CyJQMfy2vo0rk4uj83XQhA+nzsRoY2Ey39AHJ9NR
         8DL5obsJoy2jMaoHedHvLpvL9VY4UAiMcs+pynYGrqTZ7jfDlIMxrdsfvu3pmBgZi1Lk
         uuGj6b65mhuDBa/7dqR0ksrfqXaKB49hXKaX5R6X9xZkJdIqlkh0s+5xr+Jgtx5Qy60d
         0NCetuVHuVajQjiRRVfZnU7//i8yDfZ4NWd0OZ4TULA4bdbPkQiuN6G04ObKLNgcPW8G
         SSNrXla3dzEha6DXgbw4COvDTZgdke+1KCHNII6hLhndsYNQsFVGFK4Td7BfQR4PNkLz
         nSvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@deepvisionio.onmicrosoft.com header.s=selector1-deepvision-io header.b=LR2NfG3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si4641192ybm.97.2019.03.31.04.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Mar 2019 04:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@deepvisionio.onmicrosoft.com header.s=selector1-deepvision-io header.b=LR2NfG3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:56681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAYT7-0008Vm-En
	for alex.bennee@linaro.org; Sun, 31 Mar 2019 07:17:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ratna@deepvision.io>) id 1hAYSv-0008V3-R2
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ratna@deepvision.io>) id 1hAYSl-00060a-E1
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:17:21 -0400
Received: from mail-eopbgr730045.outbound.protection.outlook.com
	([40.107.73.45]:19789
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ratna@deepvision.io>) id 1hAYSk-0005f9-W6
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deepvisionio.onmicrosoft.com; s=selector1-deepvision-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UnAJCewdHY41xHjMb2AVW4Rg09jwMnPvDujGzfG+Rgk=;
	b=LR2NfG3hcqb6mEhaKckxaIxQKzB0NGTvpvABaetZKHib9ckdE7fVjpmXCM0s6nWVNblLrPlAJwZtIUEvHzwkB5gPb2lqHnbT9VZFwLkFAHGzUKWk610DYNMxaQrmE8PPO6z4CMZcUsIW/GTzs2z2hRuqOUONX+DSQfGXIBD+nv8=
Received: from BYAPR04MB5000.namprd04.prod.outlook.com (52.135.233.17) by
	BYAPR04MB5094.namprd04.prod.outlook.com (52.135.235.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.15; Sun, 31 Mar 2019 11:16:07 +0000
Received: from BYAPR04MB5000.namprd04.prod.outlook.com
	([fe80::d80a:60fd:9a49:106f]) by
	BYAPR04MB5000.namprd04.prod.outlook.com
	([fe80::d80a:60fd:9a49:106f%3]) with mapi id 15.20.1750.017;
	Sun, 31 Mar 2019 11:16:07 +0000
From: ratna manoj <ratna@deepvision.io>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: '-M virt -cpu cortex-a7'
Thread-Index: AQHU57Mj8/kRAR71i029IHbCjuBdiQ==
Date: Sun, 31 Mar 2019 11:16:07 +0000
Message-ID: <17F853C4-CF36-4325-AF2F-1B6330EBEAB4@deepvision.io>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ratna@deepvision.io; 
x-originating-ip: [103.41.96.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb1784b3-2abb-42c4-fc4a-08d6b5ca45b8
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600127)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5094; 
x-ms-traffictypediagnostic: BYAPR04MB5094:
x-microsoft-antispam-prvs: <BYAPR04MB509431C69CD336EF3E17FEFBAA540@BYAPR04MB5094.namprd04.prod.outlook.com>
x-forefront-prvs: 0993689CD1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(396003)(366004)(39830400003)(346002)(376002)(189003)(199004)(6506007)(83716004)(36756003)(71190400001)(2351001)(26005)(508600001)(2906002)(71200400001)(81156014)(81166006)(106356001)(316002)(8676002)(305945005)(33656002)(86362001)(7736002)(8936002)(3846002)(5640700003)(4744005)(86152003)(68736007)(6512007)(2501003)(14454004)(6116002)(105586002)(53936002)(6436002)(74482002)(82746002)(102836004)(256004)(6486002)(476003)(99286004)(2616005)(486006)(97736004)(66066001)(25786009)(5660300002)(6916009)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR04MB5094;
	H:BYAPR04MB5000.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: deepvision.io does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lnW+sOxV2YAMF3L7jrZxdMA8TUL+cdGRNk+uMkNzcyNjf3H+OmWf7dWlhOntQf7yZQ69Y/gggkl18PQ1CPChJxwpgpnt+f3PZowmZYyx/vcw75mGCfudRqQftKAROCprgk8+WLH5npsanIL/tin6K9Kbrc0hdxJxv+S6Oq+fgdBarjy7HxHhWrF7KTTRw/iZWD4bTFDlHHIsWY0v/zyOd16tFalA5w3tpm1txMiZPH4xMOscySPBI+cQuA6pPF4z5wOAWb/QV7Anyu+lKAcraCo7qrOQ2aQbmjDgeQ1yioqJSvapuukNsy+RdfbYHwMG7MX+LjK6l0vU0wynWVTClMnebLg9Ikb3E+jmuOKZ7pLFuamFSv3C1o0pfoKMDe7T7MxjR5CK8iTX9dll1UOI4I64pbmnlLo6tp51vCez5CU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <557F99EBEBF35144B119A45F9FA2E397@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: deepvision.io
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1784b3-2abb-42c4-fc4a-08d6b5ca45b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2019 11:16:07.6956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1acf142f-18b1-451f-9734-4db9cf7f227e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5094
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.45
Subject: [Qemu-arm] '-M virt -cpu cortex-a7'
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AqbzyN+YoQ4W

DQpIaSwNCg0KJD4gcWVtdS0zLjEuMC9idWlsZC9hcm0tc29mdG1tdS9xZW11LXN5c3RlbS1hcm0g
LU0gdmlydCAtY3B1IGhlbHB8Z3JlcCBjb3J0ZXgtYTcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgY29ydGV4LWE3IA0KJD4NCg0KQXMgc2hv
d24gYWJvdmUgJ3ZpcnQnIG1hY2hpbmUgdHlwZSBsaXN0cyAnY29ydGV4LWE3JyBhcyBzdXBwb3J0
ZWQgcHJvY2Vzc29yLCBidXQgd2hlbiBJIHRyeSB0byBsb2FkIGEgIGtlcm5lbCB3aXRoIC1jcHUg
Y29ydGV4dC1hNyBvcHRpb24gaXQgc2F5czoNCg0KcWVtdS1zeXN0ZW0tYXJtOiBtYWNoLXZpcnQ6
IENQVSB0eXBlIGNvcnRleC1hNy1hcm0tY3B1IG5vdCBzdXBwb3J0ZWQNCg0KVGhpcyBpcyBiZWNh
dXNlIG9mIHRoZSBjaGVjayBmb3IgdmFsaWRfY3B1cyBpbiBody9hcm0vdmlydC5jLCB3aGVyZSBj
b3J0ZXgtYTcgaXMgbm90IGxpc3RlZC4NCg0KRnJvbSBody9hcm0vdmlydC5jOg0Kc3RhdGljIGNv
bnN0IGNoYXIgKnZhbGlkX2NwdXNbXSA9IHsNCiAgICBBUk1fQ1BVX1RZUEVfTkFNRSgiY29ydGV4
LWExNSIpLA0KICAgIEFSTV9DUFVfVFlQRV9OQU1FKCJjb3J0ZXgtYTUzIiksDQogICAgQVJNX0NQ
VV9UWVBFX05BTUUoImNvcnRleC1hNTciKSwNCiAgICBBUk1fQ1BVX1RZUEVfTkFNRSgiY29ydGV4
LWE3MiIpLA0KICAgIEFSTV9DUFVfVFlQRV9OQU1FKCJob3N0IiksDQogICAgQVJNX0NQVV9UWVBF
X05BTUUoIm1heCIpLA0KfTsNCg0KSWYgSSBhZGQgICAiQVJNX0NQVV9UWVBFX05BTUUoImNvcnRl
eC1hNyIpLCIgdG8gdGhlIGFib3ZlIGFycmF5LCBpdCB3b3JrcyBhbmQgSSBnZXQgY29ycmVjdCBD
UFUgdHlwZSBhcyBJIHNlZSBpdCBpbiAvcHJvYy9jcHVpbmZvLg0KDQpJcyBteSBjaGFuZ2UgbWFr
ZSBzZW5zZSA/ICBUaGFua3MuDQoNCg0K
