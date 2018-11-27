Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp897356wrt;
        Mon, 26 Nov 2018 22:53:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UpmuPmcltNG+u8czZZJnG2EBo1qx5ELWgK9yILIe5H/f4FgMJVF/QCiUoIoRtRFdY9haVb
X-Received: by 2002:a25:6f86:: with SMTP id k128-v6mr31417476ybc.235.1543301603575;
        Mon, 26 Nov 2018 22:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543301603; cv=none;
        d=google.com; s=arc-20160816;
        b=qh4J8VrwBcpOnqWmnYcMFqD7F3ksV1/9DbnnzSaSpT0rENz5/PuJKVyRfo2W7rgP7r
         nEax0pDq0LN785belSyR36ExxaZQd/zLksYYeg04w+1uh0tQ/HGQKqxsmvkdvK1bdI3d
         l5nRDl0kApfejXz4OQyVnOTqLOst1Lt6mxs3YcqHWHsgRnh7Z5ryXnr/6S7Qw39qCY6D
         iDsUWHzwDONhUwmnLBgeL9B67WqcbocffVUrEi2PV0MC7xSj6QM5l+PHKs49Y+T24jnr
         oJZXOa2c3vvnsYiRmwwtEav2JSU698a/zc8tHG5fhpTw0seb0lhpNBDJQSSZXDErxKtC
         +9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=Hx/MBVXxLTvKGcFZscz4wo9xxd0hA+vKrbGl8izRwuE=;
        b=yShgU7VDnUDqrabpAfmoFPYk2WXFHPufCpqfFKnSGQ9+cfPWOCAXE6yCzED6VIgSL1
         l6S4N1i2BNNacja0RczXEAwojj8+TR+YuOow8f0a4WMS0abdy8X+nZpggKzX+edPbdw9
         aCj/8RgLNuu7TCJdOQxA4oZXsuT20mrBnItcr+OYeZuLHwhBSiDkw4SKJMSmPYRF0GIf
         NKk23xobCSzM8WalAGVYfXrdrMRNgcF/vST9TrJbArIrHC5SwyLuMFpigrRhXaJ1e0qx
         cP744sRcU/dX7FxKUp9ZvUI5h7kVvU3lxcoskUvgersxDiSrIy4MUk/zXM95rS1UUvPM
         0SGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=qNuoyIsO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d59-v6si2165202ybi.377.2018.11.26.22.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 22:53:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=qNuoyIsO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXFK-0004Qv-U9
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 01:53:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEp-0004Pb-VF
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:52:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEo-0003fs-U8
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:52:51 -0500
Received: from mail-ve1eur03on0615.outbound.protection.outlook.com
	([2a01:111:f400:fe09::615]:65426
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXEo-0003fl-Mo; Tue, 27 Nov 2018 01:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Hx/MBVXxLTvKGcFZscz4wo9xxd0hA+vKrbGl8izRwuE=;
	b=qNuoyIsOwF4Q3ZmJeZ5bfhnb16VEY+r9t3ordjiVmjUmtJigC4xVCmkB1Y2//b7Qa2J5N5NFMY5BXgfXI93GTZU1GwEevYRGVoOo6+fvQMuM8eutCxcsJvAXl55m0rpBcxzix8k80zx4Ch7peSwsgXL1eEAEK5kFW8jkHAbrMrE=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5821.eurprd04.prod.outlook.com (20.178.204.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 06:52:48 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 06:52:48 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
	<mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>, "drjones@redhat.com"
	<drjones@redhat.com>, "linu.cherian@cavium.com" <linu.cherian@cavium.com>, 
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [PATCH RFC v5 1/5] hw/vfio/common: Do not print error when
	viommu translates into an mmio region
Thread-Index: AQHUhh3OoGAotL30PEyDi+3umU/G2Q==
Date: Tue, 27 Nov 2018 06:52:47 +0000
Message-ID: <20181127064101.25887-2-Bharat.Bhushan@nxp.com>
References: <20181127064101.25887-1-Bharat.Bhushan@nxp.com>
In-Reply-To: <20181127064101.25887-1-Bharat.Bhushan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BM1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:18::34) To VI1PR04MB4845.eurprd04.prod.outlook.com
	(2603:10a6:803:54::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [14.142.187.166]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR04MB5821;
	6:t7oMlL84D+VJnPKt2EUOSBOM4hWScZwpTDKOyvNJUagATUsyAeKR224qh3CVAmuTMT/yTmhLSqHcJ69TNA4Kb7t1GIxOfe2+yIqfnjMS7ytSEslwNLz5FceVm43Q8fQHUeTIytNbHrwS0N1xXyyOncTEe7e34rNa9Ns7H4Evrbe2xAVDyxfgU3W8atAkscTl323ZYdfihWFyiopZOz3+5aFGBbh4xAIUCddfaFULVg0UsLcGjqCSzR2v28XciWEL3VBOgyIvfbnQQ03vJdWGhyeToFO5E+XaGFKVSRWvP/yDesK7DIomJR5uGzKMcbCN91M5peU2am9JDEH3RQDstTo35st/KIx0DufmvXrw9dARNPP9JTWXMr7zJ8oCFhu12NDEX+Fnrw+Wp2mbYHCT1l49t0VZoag3/d1T3lleXVxY4YHbw9adb4cMVK033Tx4qKHVCoygC3RdCWJe0wddDg==;
	5:PDEvjcAsWFKopMHE8A5bnzA6A4GGwJMJ88VhPZq9USZbzL2FZebqDNbrJR0Rypszu+m2Ib8nQa1YnurPtudYmmR718reTL/b+r9HbKgbynhEzi2gLaR7DR0wGr+awMXzatppZQ2ZDZFILRLQ2VNRYb3kTrMuoIAl6tLKDRaaPbA=;
	7:stHUen08Wy2IAQ3TV7N4rjNc1W9gg+hZ5lWl90saZfRSyi/zFPV2c7pUZQcZI4BaZfBn5IaLmDLqGa+83GC4ZCt7vmowbv9AsCI/uGckeHvpz5j84zeRl9xFuaUbEW9k+J1DQwF9lCGqyqg8e44V6g==
x-ms-office365-filtering-correlation-id: 528dd0e4-c328-43b5-a8f2-08d65434f0c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5821; 
x-ms-traffictypediagnostic: VI1PR04MB5821:
x-microsoft-antispam-prvs: <VI1PR04MB582197F5E82DE4C84EB8830A9AD00@VI1PR04MB5821.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5821; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5821; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(2201001)(316002)(6512007)(446003)(36756003)(3846002)(6116002)(7736002)(1076002)(8676002)(14454004)(53936002)(110136005)(2906002)(54906003)(6486002)(39060400002)(4326008)(5660300001)(305945005)(66066001)(81166006)(86362001)(6436002)(7416002)(81156014)(78486014)(256004)(71200400001)(217873002)(478600001)(71190400001)(25786009)(50226002)(68736007)(8936002)(2501003)(11346002)(486006)(186003)(99286004)(386003)(52116002)(97736004)(76176011)(6506007)(476003)(2616005)(105586002)(106356001)(55236004)(26005)(102836004)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5821;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: dTRRt4nGatpb4ay9ix9zQl8h+VzZ//rAOmmk+0IK97BAZAUdry3KoCvRYdzorcUZwQ3vyBt72yVN+1herM2t4ccUmPTYlsgGWX4rvxmls139ltYUzZfytz1BEb5nxDlHbpioJvzAjEemEO0bYf5eetLiD5SpvJkvOJdIjuL2SHnGNxGOYPWRgQxKxeWM9mjTSTTV4ZZGV5wYABwvoEhuyt0u4SqoYwehoC85MmzxQXqNKuXM2y/DJXzlj+0Bdtz+ElLgzwWh03g1n/tm10VJM8mEwBlkliXvVkkX4Y8CaP8acaHESUxmCN5seV/MZeuU6I5A+f6mS1IGoD7AC2/DHZqwSh991APfoQJbNZGXQO8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528dd0e4-c328-43b5-a8f2-08d65434f0c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 06:52:47.8684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5821
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe09::615
Subject: [Qemu-devel] [PATCH RFC v5 1/5] hw/vfio/common: Do not print error
 when viommu translates into an mmio region
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
Cc: Eric Auger <eric.auger@redhat.com>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TYZiS+0m98sa

From: Eric Auger <eric.auger@redhat.com>

On ARM, the MSI doorbell is translated by the virtual IOMMU.
As such address_space_translate() returns the MSI controller
MMIO region and we get an "iommu map to non memory area"
message. Let's remove this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v5:
 - Added thi patch from Eric previous series (Eric somehow dropped in
   last version and this is needed for VFIO.

 hw/vfio/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7c185e5a2e..fc40543121 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -328,8 +328,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void *=
*vaddr,
                                  &xlat, &len, writable,
                                  MEMTXATTRS_UNSPECIFIED);
     if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"",
-                     xlat);
         return false;
     }
=20
--=20
2.19.1

