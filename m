Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9401303wrt;
        Wed, 5 Dec 2018 05:50:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WmFt4ucvhD9kHDV0yzFowbUUSyGxgW6r0MXCUR6oPwDc+vU0fnKrLetBZ2cKUo6l475oC6
X-Received: by 2002:a0c:88a8:: with SMTP id 37mr23142499qvn.63.1544017830598;
        Wed, 05 Dec 2018 05:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017830; cv=none;
        d=google.com; s=arc-20160816;
        b=F8wc3cNz0BSmt3rk15KSJysWGuS6xbiMZXLoU0kVLIepeJFVoJDoNAGrpA9y1MOrd0
         W2JbpEsAh01veMH3n2bGq0iUyOKrv8yHAINBSt+sAJYWgE0E0m6eIN9dcPvlnI1sYCzC
         0N1lfH924GeRe6ZMzh0O4191XeOTUBKe0AEk0reX5GEr3b038Ysa/1bPKTv7JkqO/Hux
         K0gww0Ls0ncutDWJijWnVxroFLJGv+W/snfb/qp57434Ou97KLVlkAkwC096KVVdrcen
         J8aG5oBgLO/GfgYV3LynzLgFRvvxIDpWvq4t8gvtHd5IBkJK6pV54LFPZsnwt8WzYRgR
         PdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=nGCW+T9IKiDYGN9obdaTUNQo790ht12KxPLcGwCe0PU=;
        b=iyPttB7nlfzEFZzugupfgBjO+yqCE9ZT4xEdk2vqwxRumQuKb3Jq7KgmlDets/qFyM
         lMeRSsbbL6vexZXhCpRDcm8B75ubQvU/0VUJMHNZND7wZIwMyu+bs+A1UsRgjJ1r1vq+
         qnhYq2q84SdH4MX7UTLztQdcUnXHbSK6SnlL2QX5p0OyGFv/G5fQbgq3DU0dD0i2C/jN
         BVFSy/SVDXjckDwkkHYbt1DhKdF46zWl03pqDGL6plLiH1wBfouKPYrX9MbBa35/g/ny
         zirJrr/yau9k5eZBDQVHKerv6nfHCnncLF/cI4oDxCvGou4LkbZZvhB/rkiUjNJitiHM
         IeBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Zx5yISbU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si10052081qtf.160.2018.12.05.05.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Zx5yISbU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXZO-0004bf-4l
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:50:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSw-0007uU-LK
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSs-00057x-3f
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:50 -0500
Received: from mail-eopbgr700113.outbound.protection.outlook.com
	([40.107.70.113]:43136
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSr-00054p-R7; Wed, 05 Dec 2018 08:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nGCW+T9IKiDYGN9obdaTUNQo790ht12KxPLcGwCe0PU=;
	b=Zx5yISbUQTnzQUiqANPA+if3VmpaSh3LuizGtgLp6qG6VieN5CsNf7JhFPRz2v47hP0tRLgrlfrruFt3aXUY93tnIutgNFCPIc1ybYKJgX9QjfT4zvLTNL8dC/ibRI/laM9ZelRnx3/5usnPFY618+h2MsBaMZCZR/UiXPSQ2J8=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:43 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:43 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 07/14] target/arm: Define FIELDs for ID_DFR0
Thread-Index: AQHUjKB84kEh3NJTAEyCkh2ojxIBUQ==
Date: Wed, 5 Dec 2018 13:43:21 +0000
Message-ID: <20181205134243.4791-8-aaron@os.amperecomputing.com>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR12CA0032.namprd12.prod.outlook.com
	(2603:10b6:405:70::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4700;
	6:me26Cun0/Vzax3zkBIDJZRKBtAGKy7FuYsY14L/iZ5mtdZ1+WSKEwfu5kOyCSVbJSxwi4qLbnNtE1Tcj4wHM2JwibcmzfI/H9aNVo6fe0NsK6epYxOWiNxMEtr2bzFHd3jBxCqg62NBkSLEyS1vs9KVR7tAFYPpb7AiWlw0LD3UMSoEoHYJzPxtRTJZ+od9h+DexmYWldGwAV8Sj0U6ck+mWow+V5uFu1qZYjaHhVx89re+3Xt9a3BDWizr5Rw7ebijNjAq8yOkn6qkKxhdCXshO5eHh8Bn04QEh9Z2WRihQlsYDDZf4ah7H9qXPAvjYIsCShuhKC/BlSBxc7JjUxk7R1xBNT+FqTh9eknd5LWqQtBRfRb6F6ML0gjtwgQX3PaAu2XJALm4H0WMBViezRqfdGVUmhH5X4j4m+4ZJdpiPfdGUBAM5obQGNiNkLSCtpDgK2wz0JW7J6k7Wk53uvQ==;
	5:hTLzTC6O2KchVfAb7PgwSQWqlsA1s3SkEefjv+hsWAN5FFJvIIC3V8kklwXFpI7U1YSzyNMA5v/QbCxr4eNjbmLPtYLGPNjab1D/v8G3YAE6F3RXDidSn2bco9PpfZYEzfL/F0R0KNq6WYzLpddfEIpoz3MZYOXvsftEnkpKrCU=;
	7:3IePbiUKmGiXFEA0eXGjs0NQoczghs45rknYeOBXvDgK63fGEz0lelUXBbD6GaPvDML4va0shxmXxA+SBSLIuAw64MNKGlzbllhHjO3A3mw6BCJElyBnTpsaIktLGQdYlcoBAUVmuY1BNw6FUHcXKQ==
x-ms-office365-filtering-correlation-id: fe329a51-575b-45d6-05ab-08d65ab79f1d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB470077858E12499D77624C078AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(110136005)(305945005)(2501003)(6666004)(71190400001)(71200400001)(4326008)(107886003)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: tWQkC2Se+/qOsVN1nX5N8zVWBpGnKE+hCyacoI4l2OGaaXHqIzWhKECkZ/7C5vGIz+Pyzg/XsrdU7YljnkemD3Kj5kX6PGfg5rbdYeKfW0tln+GPnO/OwoBA7iRP3kpABTkrIGpXy8f32o2IR0Y9A3cBN8UNoRojBNaMmkDBjpiwi13qZ9n8owibvgcKtW0hT4F83Rs7KDwIMMiyauyJUeHEfPquM0KtwzNgzaprJuPGgGKX54jKRJkAU8gyp0zDB3SnpL0xdILM7J3iU9Q9pFbxVBfF4QkZK25xeQpUWgicIPlreLmHKozp5ArD7MhMffT0Id6U3xT+WwY75wamNPTCbOOgYdGcUTmRCwOYKXE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe329a51-575b-45d6-05ab-08d65ab79f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:21.7154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.113
Subject: [Qemu-arm] [PATCH v9 07/14] target/arm: Define FIELDs for ID_DFR0
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FavObHLRFlKE

This is immediately necessary for the PMUv3 implementation to check
ID_DFR0.PerfMon to enable/disable specific features, but defines the
full complement of fields for possible future use elsewhere.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 627e5c1995..304e6e47b3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1586,6 +1586,14 @@ FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
=20
+FIELD(ID_DFR0, COPDBG, 0, 4)
+FIELD(ID_DFR0, COPSDBG, 4, 4)
+FIELD(ID_DFR0, MMAPDBG, 8, 4)
+FIELD(ID_DFR0, COPTRC, 12, 4)
+FIELD(ID_DFR0, MMAPTRC, 16, 4)
+FIELD(ID_DFR0, MPROFDBG, 20, 4)
+FIELD(ID_DFR0, PERFMON, 24, 4)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <=3D R_V7M_CSSELR_INDE=
X_MASK);
=20
 /* If adding a feature bit which corresponds to a Linux ELF
--=20
2.19.1

