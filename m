Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp900138wrt;
        Mon, 26 Nov 2018 22:57:04 -0800 (PST)
X-Google-Smtp-Source: AJdET5d+ogg27OaEC/T5xj2SRdvupzvA1w4hAv4gWoNuYfmHklX3dOS0KVv7DL17FO2yFzSXkOYm
X-Received: by 2002:a81:5583:: with SMTP id j125mr33920859ywb.105.1543301823922;
        Mon, 26 Nov 2018 22:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543301823; cv=none;
        d=google.com; s=arc-20160816;
        b=oL0Nwk4S0K7EjUqUhFOblLYoXVA4Oxlwg1XB7mjxRiKTsLGMqnWU2RF/AcRlIRBYy6
         sW3rGUtzkjE1i60tKOh8FwqvNceX7rvRrsaA9qI3scOX8WFSBDjK7D+ctManTeXAN+Yq
         IxodAPkKoSWjeaiFcYGfF00x1Vw7Qpyg5FcBky0t1eY/qk/GyIai4mIt8N6Oa6gAYspk
         9K1bPDlHEY12g6LfxxMGb4lt6EVCt1TyT11kCon3ZPlG0LBB8WedjW15GQ+WR2ESNGZH
         yFcIXFSpCIHlUbAziF5mOZJ0iRHAuiZWRHR9+/Lf3yNN2ejW3EUBAKqUt5TrxobGS1Nc
         k1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=0EmiJf0Y/QvEFHvx8aDv1CzEspXS9ugy00InGkvOHHw=;
        b=waoL2lwZd3P8Zi93SKv4XnY/pU4EUeJcMFVgsNdZTsGrjGIGh1gRJy5vxQU/gypm+r
         MbKPDGRdM8N2eYF+5jgmN2/Ooidh8T7ifXunADYaFBkFL8nMY8PYg/2TEWUMzCwFhG0o
         QllFRUvxzSTsPwLmETlYtmQMVy2tUy/y70khH99pytlcWIMxQDb7v08ChiCfKnCi+QAX
         cJITMrgCCZ2qRXRWuWrazzlpss62KyZ9Bgv099+C3OTN2ZB7/1c5DcEN3br9ugskffM3
         WsfAn5mvnwInGftPHdVVtU4VHqWJHuRZr5G3EHlrPun6u42sYZdAgFG0960LdGlJSz7y
         ij/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=F3cyFWR6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b201si2012677ywa.162.2018.11.26.22.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 22:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=F3cyFWR6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXIt-0008Ld-Bh
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 01:57:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEp-0004Pa-V5
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:52:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEm-0003fa-Pn
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:52:51 -0500
Received: from mail-ve1eur03on0609.outbound.protection.outlook.com
	([2a01:111:f400:fe09::609]:25120
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXEm-0003fP-Fx; Tue, 27 Nov 2018 01:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0EmiJf0Y/QvEFHvx8aDv1CzEspXS9ugy00InGkvOHHw=;
	b=F3cyFWR6EXNxSAKsjc8roUKr+hcf4+x33yc5EQ3+Iw3DQQ657IEoGGBM9OqJF14auDaabP+HktgbaW7iQqikTP33qlGY07rpXUA+K7BxYuGRa97Kh4H9F8UST9EZqmEVQ6LD8gnvgareGZCL1PQGdTrMJsLaDxD9WcrhcuoA5F0=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5821.eurprd04.prod.outlook.com (20.178.204.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 06:52:44 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 06:52:44 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
	<mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>, "drjones@redhat.com"
	<drjones@redhat.com>, "linu.cherian@cavium.com" <linu.cherian@cavium.com>, 
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [PATCH RFC v5 0/5] virtio-iommu: VFIO integration
Thread-Index: AQHUhh3MCEP5JbdkPE+3+p9yVJlnwg==
Date: Tue, 27 Nov 2018 06:52:44 +0000
Message-ID: <20181127064101.25887-1-Bharat.Bhushan@nxp.com>
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
	6:5Z4RiN/sRW5by5TxtmPnVinpGmUyPz77mGEyfNC8gv4ECBkmOqaCX8XK0fm07cj9gJX38Zpklq7WGJDYPbBzh1M2WPwEJtH9cg36fqI56PBUWaOfLcly28ABauI80HSX9JEweoHGHUTTpnefOLCJdi+zNv9ZpAbHyzjsZOW6U9KAUqB29D8f7ZXjUz4ThMsloYm1cjPc6nNngP5/atlntBMeWFJ6thO+CSuJXuoUoHxYsEfvMPxjrR/l26FU5SgR8wnniX9LLd1ggE0+U0s5A+AWHF3Pk8813Cno4mZy3h3vkiY04fD8hRMxRn2yLeocsrReSkTzXvH4s6NjswFPvYKBnjT2fzjUq/QxqPosF7xQ5lBbO40FlX5pyRZ6pJx+ewNmHPN+O2Vb+cg/evL8f6wjZ9fNJeCTwqRzJJLSd1hCS7qrAaIxHIXB3xKtjNVK0eqZrrQkrHpa4LNCVtK93g==;
	5:LL6ZPbCderXxlO1LugItcPeG0qlXkTgHQM8EPf6lU9x/e4zGC37uZCAt8eZqV18P+jQtR9T3lFQonJSkCsOnJhh4WTSTPRhX5nNUhYehqoDGG5sogen2vBKNVT3s0YJRtz/cF4IP+YMPvnJ4alEJDcIyMiPEw+FVrMvuDKX3UM4=;
	7:HDcvKMtZxLUTm2VkEdh3+OHVh6ED03mJMweHj7vQIs1xpnU5cSW3QoA35dCkMFkQQvAlrCMM1/RSyn1f8m7kxnXiflNq6+/RbDe9bZuLrBuqbxtH3ai5izfBfInNWLNf5jlV1YAyUtz6nJxK3cpQQQ==
x-ms-office365-filtering-correlation-id: a49753b4-1a33-4522-2436-08d65434eebb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5821; 
x-ms-traffictypediagnostic: VI1PR04MB5821:
x-microsoft-antispam-prvs: <VI1PR04MB58212169BE38ECB17B833A669AD00@VI1PR04MB5821.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5821; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5821; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(2201001)(6306002)(316002)(6512007)(36756003)(3846002)(6116002)(7736002)(1076002)(8676002)(14454004)(53936002)(110136005)(2906002)(54906003)(6486002)(39060400002)(4326008)(5660300001)(305945005)(66066001)(81166006)(86362001)(6436002)(7416002)(81156014)(78486014)(256004)(5024004)(71200400001)(217873002)(478600001)(71190400001)(25786009)(50226002)(68736007)(8936002)(966005)(2501003)(486006)(186003)(99286004)(386003)(52116002)(97736004)(6506007)(476003)(2616005)(105586002)(106356001)(55236004)(26005)(102836004)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5821;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: NCrf+hAbFoj5JOC3LMvkGLESXeLtEqrmdpnDk+HKhBOzU+gEoddRC4/6EpFPbvlIcqyBT9OuphKqrSSLBH+amwI4+BfqTEHnrVo0yQvJjWIefeZoWzb1akCQlb5mtEa+4wIwpttWwXwVwbK8OKfydeHx5LxAdyb2GwUo31Jz/5GMWJvgpuFm6anYpeHasWxvhIMXjhUQMpdTwWu7/eMbgAcIvpJlXPFGim06zSVtCO9+PVzC+TFvwMNO5+X5GmMyroK1pvQ9PKoB7htOQxLjerWlCw/t0GOxPbybbC+2ivaAy78ZkcusNSndLtaIMPuaBcoO2xYzDk8vYKd8qCRmoqqVFkCk16DJOdo2NnL4rTg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49753b4-1a33-4522-2436-08d65434eebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 06:52:44.3215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5821
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe09::609
Subject: [Qemu-devel] [PATCH RFC v5 0/5] virtio-iommu: VFIO integration
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
Cc: "bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 831Tmw7oI7DG

This patch series integrates VFIO with virtio-iommu. This is
tested with assigning 2 pci devices to Virtual Machine.

This version is mainly about rebasing on v9 version on
virtio-iommu device framework from Eric Augur.

This patch series allows PCI pass-through using virtio-iommu.

This series is based on:
 - virtio-iommu kernel driver by Jean-Philippe Brucker
    [PATCH v5 0/7] Add virtio-iommu driver
    git://linux-arm.org/kvmtool-jpb.git virtio-iommu/v0.9

 - virtio-iommu device emulation by Eric Augur.
   [RFC,v9,00/17] VIRTIO-IOMMU device
   https://github.com/eauger/qemu/tree/v3.1.0-rc2-virtio-iommu-v0.9

v4->v5:
 - Rebase to v9 version from Eric
 - PCIe device hotplug fix
 - Added Patch 1/5 from Eric previous series (Eric somehow dropped in
   last version.
 - Patch "Translate the MSI doorbell in kvm_arch_fixup_msi_route"
   already integrated with vsmmu3

v3->v4:
 - Rebase to v4 version from Eric
 - Fixes from Eric with DPDK in VM
 - Logical division in multiple patches

v2->v3:
 - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
   Which is based on top of v2.10-rc0 that
 - Fixed issue with two PCI devices
 - Addressed review comments

v1->v2:
  - Added trace events
  - removed vSMMU3 link in patch description

Bharat Bhushan (4):
  virtio-iommu: Add iommu notifier for iommu-map/unmap
  virtio-iommu: Call iommu notifier on attach/detach
  virtio-iommu: add virtio-iommu replay
  virtio-iommu: handle IOMMU Notifier flag changes

Eric Auger (1):
  hw/vfio/common: Do not print error when viommu translates into an mmio
    region

 hw/vfio/common.c                 |   2 -
 hw/virtio/trace-events           |   5 +
 hw/virtio/virtio-iommu.c         | 190 ++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-iommu.h |   6 +
 4 files changed, 198 insertions(+), 5 deletions(-)

--=20
2.19.1

