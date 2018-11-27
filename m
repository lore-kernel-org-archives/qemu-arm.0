Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp899446wrt;
        Mon, 26 Nov 2018 22:56:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U8EPHFEUgUSYFN0IXL1dpxOijro1xUP408vlJPBfYHPqVWMCWVTf4sNThlpbTVxorfsCjg
X-Received: by 2002:a5b:4c3:: with SMTP id u3-v6mr31665901ybp.181.1543301772303;
        Mon, 26 Nov 2018 22:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543301772; cv=none;
        d=google.com; s=arc-20160816;
        b=Zn3Wal41KeTnTO4MIclj9gcPslepzZR+H9JnFTaVmcr1gThq/bDOTnaLfw0e1Dxkou
         LAZ60tCOV1JfKzF88oF1rRN70EJFcyWHnPLkDt27Vqpof8ETq93xLmxEYDyv0j8qpKs1
         +wscP3C7DhX5WOixRJLlqLSa8IasTZAM9gAZ4d/p+bxffoqGbz4rck739yfi57wEM8Gw
         /92ZpEaL6rXihOEql3u6Mpg2uTUxbK5UtsR3X/k5/Rbdw/AcJv15ZCIbhUTpsSrNpPPB
         ALsNLOQRp3+MqXPtzrbbTRedKSBfTCjpCMETVg2QFdHVDkEbkcHIlO7Kl8qdqEG7adjt
         VK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=nw2wupyVr7c9Hm433pWuxV0Wlba22Bv8H4lGVMlZxGc=;
        b=VoWAzoxA14ZIRLyFpj8//wNfHinOYVuX8IwAm3UAK//nfHV1UC8pnh8ka51eZh7S/B
         2hhc7JMdNyQAGdK/HxgtIxp3f3rIoekz0Yw1Ji9YzyFOefXHGMLXUZBtUdDJgiBsbg+N
         RfUextfXhGJRPv3LumlROVTTgXLQ3a80QIUjmfETzJNgk9ppZD7YEoXRnK64LOcu+iaR
         4TEsvRT+gxOLJtr8mF1px8RJHi4GBCFZKMZmCaj3R6N+2tBSAXbB0W7QnsTlYSDdbKvp
         Obecf++BXyxJ0RqkEFvcLvk4Ur02qnv43iHFpqECy60bUjXVMym21y6hTI1acLoKekZB
         AZUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=YJzRQmVe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d37-v6si2294560ybe.384.2018.11.26.22.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 22:56:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=YJzRQmVe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXI3-0007l4-M7
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 01:56:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEy-0004cR-Ir
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEv-0003hE-E9
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:53:00 -0500
Received: from mail-eopbgr50076.outbound.protection.outlook.com
	([40.107.5.76]:2112
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXEv-0003h3-7Q; Tue, 27 Nov 2018 01:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nw2wupyVr7c9Hm433pWuxV0Wlba22Bv8H4lGVMlZxGc=;
	b=YJzRQmVeXHEbUh9bYprEDaRqlBSHsBM+fMNJxmdcbrNOcMyJg+0xpfhHdGoKYjNRQqj0XUrlUGTx1Qhv9vppirtFP5Tgj6D9gcxB6UpFBllYwU9F7tkdLp6YeXOTWHC3zBh5Dv1rRZ9v/WtUv07xpTNItResquA5RSn5KbdMdCc=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5821.eurprd04.prod.outlook.com (20.178.204.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 06:52:54 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 06:52:54 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
	<mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>, "drjones@redhat.com"
	<drjones@redhat.com>, "linu.cherian@cavium.com" <linu.cherian@cavium.com>, 
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [PATCH RFC v5 3/5] virtio-iommu: Call iommu notifier on
	attach/detach
Thread-Index: AQHUhh3SEy3AAQlL+UmUyGIwomsEGQ==
Date: Tue, 27 Nov 2018 06:52:54 +0000
Message-ID: <20181127064101.25887-4-Bharat.Bhushan@nxp.com>
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
	6:bou7cLq9y1nX6xPUl2bl2nHlREbWBm4/dAFeMVqaugmLXlPumyurZttnbhatd8CpHsiycBs3mJBfyF8gdeGHII3Xa8Jx/UyHB6Y55d35aK8TVGk90i75qnBgxv9m6qiDsteDGVhWnzMIlYKUNsAnkDFhbtQNDm9burrbYA1Wie3YSWlNzCyTWSWDZ+Em3t0NVKYhGGPfjv99eHHY39fSOZZ/N9ZCUrst77R/LyV9ARiiV946ZbtJp4ZKpqvbHUSXxLOXjE4gv/GL1xpMu8eZLoZlJv+rIqevi3/sqEejzLCFkoyWZ+0ud1RwVDoxATcnyAazz9j3cfwJDn+ev7k+LkEbHQFomk2knVDarilnM0eN4de1RggEY+KKXKIaRFdQaL/UZt2uvjFqJBgyjoUqm0dUGgeZNPjiUwGzcNv5QS3yz9tpCweViYqFBdNxpBD73k4mugGsls93m7mzGs3wpw==;
	5:pNeBJuFRpfk34ZN4xLPu8H7JIEHGUoVsif2PhhwynZhoa/BTPXR+xRPr4z0vy+jOYKi6Vu1tJgwUdL4I42oNB0OW4HgtMrDNLv4gl+mi+rw3qzfJujL7w4fNorlHBwJmTI4sXCxpcMMQ4w91WdGl0gW2ACFWY4ZRKJqitG+hc/A=;
	7:Vi4dq9j9Tkifl/+6U8G2rz0IJVl9NXxi47CICGl+C6bOjH1l8N99rLnWZwJjlcONsn6pA3c78Gfw6CkId4rYewtD9FRIHUsmogByVUBr+PH20wXdy+r6HSu5+ZbidUFkQgsPm2z+uUy3f/WEQQQPCQ==
x-ms-office365-filtering-correlation-id: eae2d644-fabc-4b9c-7898-08d65434f4c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5821; 
x-ms-traffictypediagnostic: VI1PR04MB5821:
x-microsoft-antispam-prvs: <VI1PR04MB58217C17C887D9F97591D3699AD00@VI1PR04MB5821.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5821; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5821; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(2201001)(316002)(6512007)(446003)(36756003)(3846002)(6116002)(7736002)(1076002)(8676002)(14454004)(53936002)(110136005)(2906002)(54906003)(6486002)(39060400002)(4326008)(5660300001)(305945005)(66066001)(81166006)(86362001)(6436002)(7416002)(81156014)(78486014)(256004)(5024004)(71200400001)(217873002)(478600001)(71190400001)(25786009)(50226002)(68736007)(8936002)(2501003)(11346002)(486006)(186003)(99286004)(386003)(52116002)(97736004)(76176011)(6506007)(476003)(2616005)(105586002)(106356001)(55236004)(26005)(102836004)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5821;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /BB7rHW3EHkXFbvOe9fqkhqh8huyTxNMXrjujlGqYjei/whQ4C4+xYXI0CnTZtPJC0CoL0BDLJXtSC4fYGGBFdV4WiccS1lW2mSjKrelyKq4J35P/bJwolgEvm+/qX7/Z91DHpvYivSK4UQsCsZuGj5uWoAvMdfNYbBu8Y8CxpOVAfRl6Mp1TP7ccvUVzuL+OqfDQW4eTFIn6iIP5auwKwxxvxayNB96Tekn2DG8pSPcmHH5w0u8zynOXzn5cRthPJe3p3hRi92gl2rZLcpChwJE9bef3bZwMmk9K+XTdthDE0GIrtK8mIVXkVc0pHC2IOWoI43M+W/P1ScUQqkkR1FXPiILr4NxFr/EfLJS6aA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae2d644-fabc-4b9c-7898-08d65434f4c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 06:52:54.4309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5821
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.76
Subject: [Qemu-devel] [PATCH RFC v5 3/5] virtio-iommu: Call iommu notifier
 on attach/detach
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
X-TUID: aRSmmy7uWp8O

This patch extend the ATTACH/DETACH command handling to
call iommu-notifier to map/unmap the memory region in IOMMU
using vfio. This replay existing address space mappings on
attach command and remove existing address space mappings
on detach command.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
v4->v5:
 - Rebase to v9 version from Eric
 - PCIe device hotplug fix

 hw/virtio/virtio-iommu.c | 47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 613a77521d..7e8149e719 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -131,8 +131,44 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegio=
n *mr, hwaddr iova,
     memory_region_notify_iommu(mr, 0, entry);
 }
=20
+static gboolean virtio_iommu_mapping_unmap(gpointer key, gpointer value,
+                                           gpointer data)
+{
+    viommu_mapping *mapping =3D (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr =3D (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_unmap(mr, mapping->virt_addr, mapping->size);
+
+    return false;
+}
+
+static gboolean virtio_iommu_mapping_map(gpointer key, gpointer value,
+                                         gpointer data)
+{
+    viommu_mapping *mapping =3D (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr =3D (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_map(mr, mapping->virt_addr, mapping->phys_addr,
+                            mapping->size);
+
+    return false;
+}
+
 static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
 {
+    VirtioIOMMUNotifierNode *node;
+    VirtIOIOMMU *s =3D ep->viommu;
+    viommu_domain *domain =3D ep->domain;
+    uint32_t sid;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        sid =3D virtio_iommu_get_sid(node->iommu_dev);
+        if (ep->id =3D=3D sid) {
+            g_tree_foreach(domain->mappings, virtio_iommu_mapping_unmap,
+                           &node->iommu_dev->iommu_mr);
+        }
+    }
+
     QLIST_REMOVE(ep, next);
     ep->domain =3D NULL;
 }
@@ -280,8 +316,10 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 {
     uint32_t domain_id =3D le32_to_cpu(req->domain);
     uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+    VirtioIOMMUNotifierNode *node;
     viommu_domain *domain;
     viommu_endpoint *ep;
+    uint32_t sid;
=20
     trace_virtio_iommu_attach(domain_id, ep_id);
=20
@@ -300,6 +338,15 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     ep->domain =3D domain;
     g_tree_ref(domain->mappings);
=20
+    /* replay existing address space mappings on the associated mr */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        sid =3D virtio_iommu_get_sid(node->iommu_dev);
+        if (ep->id =3D=3D sid) {
+            g_tree_foreach(domain->mappings, virtio_iommu_mapping_map,
+                           &node->iommu_dev->iommu_mr);
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
=20
--=20
2.19.1

