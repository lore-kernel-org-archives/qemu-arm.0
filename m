Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp901874wrt;
        Mon, 26 Nov 2018 22:59:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VQxcZydhAXPBXitB8niwlmZKKGo0bjhdcclXe7zx7/DB6O/q2P4Zeo+RD2amP0W/pYQt5R
X-Received: by 2002:a25:7ac1:: with SMTP id v184-v6mr12258989ybc.115.1543301967490;
        Mon, 26 Nov 2018 22:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543301967; cv=none;
        d=google.com; s=arc-20160816;
        b=gZ9T8++RQxWKBL2gF1lOUAAHcpYkHAd0a261MjaB3CP2M5rBdxPieBEu/vV5bzCRBo
         R0r/cInQ4l30qi/CaK3WMT2KY7U0ywP3LeU0JZsSL3EPFup9758wBcpxtUlHfqnNUv9f
         OuYMuUa07p+28ObgDJVNaa6R/mc8+mdmqKlOpZgTGZ60y/4sckILSDewciq+N0EW9t9v
         XIkJl+tjoII0OaEUwqdiEVW+9zjEERKi/Gw81NU1oYGJG6AWZap2QGXWV6YoSTVW6+CU
         m0PAI0lCGZT/2ybesVklT2VQ8i1FZfmosquZvMHqYjIli4cStUG83/3astDJVrU200n2
         zERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=Z3cIZzqpYGBJhRRAT//4KF+mQdeT7fdAsByZcmDi/O8=;
        b=DF7DCM1PwN3GcOY0tAEBHBVq4BlaWbp9N2zydx5TupWNBby6G7R/ik1tSt8YRu0Tya
         dgsEUXKxmEp3V5h/Ptx2RoTFUX0wuWVHYDGZioe/BnsaSmI1UQCn63QQnAS+PuTSoPv9
         kyCihJVMd7jwj66T1C4f62MN4KiXerlrq6zMWfaDSZnzjP7tdyldh+F/cOWH31M/nXZD
         wSLVu/nfvye1mJsh2QJ6hhdqOGxqZMUACC64jOqzkrgEWme5BfXClXzqQERjO+f8Rcby
         zEFHk7ZSwFpwiSrvu8/3FjUI5X43gIt5E8g6RkgePoulFJyqvCQ7SRzVzdIB8j8DaaaJ
         L1iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=u+MtGN60;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j84-v6si2072585ybc.125.2018.11.26.22.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 22:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=u+MtGN60;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXLC-0002wQ-RL
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 01:59:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXF2-0004fu-If
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXF1-0003ik-Q7
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:53:04 -0500
Received: from mail-ve1eur03on061b.outbound.protection.outlook.com
	([2a01:111:f400:fe09::61b]:50844
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXF1-0003iY-K7; Tue, 27 Nov 2018 01:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Z3cIZzqpYGBJhRRAT//4KF+mQdeT7fdAsByZcmDi/O8=;
	b=u+MtGN60YF/oAoRhR5uVLW85NqPqa/McFWRb0NvjVYlgMfXzXNG6Gjwf4ox35W3B41+epi5OmZtztrhSg1rPmcanV8kx78Ffy2lHeoHb4qm7yn+M0rHjkCxgShjy66BaJC6L5Qt/YAOtrmKmMTRXforpY3HQgPSRmKONleUe4vw=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5821.eurprd04.prod.outlook.com (20.178.204.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 06:53:00 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 06:53:00 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
	<mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>, "drjones@redhat.com"
	<drjones@redhat.com>, "linu.cherian@cavium.com" <linu.cherian@cavium.com>, 
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [PATCH RFC v5 5/5] virtio-iommu: handle IOMMU Notifier flag
	changes
Thread-Index: AQHUhh3WMjRWq9sCtUmi/j9xQecc5w==
Date: Tue, 27 Nov 2018 06:53:00 +0000
Message-ID: <20181127064101.25887-6-Bharat.Bhushan@nxp.com>
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
	6:H5AiNYvrSc/5h3bUa4hx1qMtwbGOM7p+LD+2IBAUCirpW9SlePDrgHBxo6zGPNxovHyXebehA8De/f11wtsuEPrwVwqQdn4TjHooOV9w3lzVygFIjj4ZM7xLYsl7VGkcQu+QXME3rC5LuT3OKUayKfsgGonrTNL1bZb+cOlbxOf0DAzaCshHliGOIXzv9sge8f6xElk7UV/Cvycmd4mvTrr9V784i2Sh1hyp3j1i8MVSBccmnTAxMMnBtaVcCdraibQlOJ5KEpHBGrcuZpimT7RlvNxihPnkORTZEGH0MvOyRNSbVnLcH8wmuCBrfauv2D2Y7b0RGGwJFgC1OtpOmEEr7vjcrIhBw0fPAZk6Q6CcYN6hnvTM1jr7ZYqdcgmIJK0rLGEYCvJo66M/ksKKvr4z4aL6c6SwN8rXLN+z2FSOrvSqHyV5/85JA4r5YGpMHXFai5H3ApsP0ZbGqNpFTw==;
	5:V3E1e1nK4zqizKK+XTDU2b0ZrryLLWImDPGxmUPbmosHiYi3368hBBphWkOkst8wcpLkKwDl6Hpc0WjNG9ze62Zwha07CnJksCC8Izq5ILDWPs9swIVixPzuVGlKMjtTuQt464oXSjfE9YgYhqMsntXxzHwMLKN3z7n8cezu8ns=;
	7:1ggNNTiL+FEF6aDcN+em8QCOJqui+08oCShkgOTonTY5dV/Oyt3ZXPe58RME73eY3EaBVp2uNP7aM1x+Dxp4imOWD8Y20tmJ9LDwQrO/Zr34pkZSSHL/VgD0hkCO78kY5zRrXgtXViPVzy29MvVJ9g==
x-ms-office365-filtering-correlation-id: b58a29c0-25c3-4009-22aa-08d65434f89f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5821; 
x-ms-traffictypediagnostic: VI1PR04MB5821:
x-microsoft-antispam-prvs: <VI1PR04MB5821D5D12CF42E51394325209AD00@VI1PR04MB5821.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5821; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5821; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(2201001)(316002)(6512007)(446003)(36756003)(3846002)(6116002)(7736002)(1076002)(8676002)(14454004)(53936002)(110136005)(2906002)(54906003)(6486002)(39060400002)(4326008)(5660300001)(305945005)(66066001)(81166006)(86362001)(6436002)(575784001)(7416002)(81156014)(78486014)(14444005)(256004)(71200400001)(217873002)(478600001)(71190400001)(25786009)(50226002)(68736007)(8936002)(2501003)(11346002)(486006)(186003)(99286004)(386003)(52116002)(97736004)(76176011)(6506007)(476003)(2616005)(105586002)(106356001)(55236004)(26005)(102836004)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5821;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: J4A1G07SOkAHjz8A48Zt62YPFlCft/k5alUGvPykGHPU/MFqftFWB6f+Ivr0As0b/kdZmpE/mLZJxm0Uwal6VTVVNwVcgYr08MRvpsfyJps+f7PxWHtY9Pe/PDfDPITE+Fm/VQsq00apW/1ShGBlxXp094zk4Pnt3SB32eE3rNeEdtNeDyoDpL2rJEPlqXNdx+y2bVXTKLz2ODiVRZtwiDEwrGkGrhf0zZHnhCsDaUAPSMDJa6tK2HnTKcxWJXOdrjKJPgrYXSVVGF6IqoeQLNtHL41qrfc18RCxcIl6wI51jhZatqz3P4kdswqzNegb+xi+1s1BOcidjS7vk/5zs7+IvDTWoWEr/yJH0nmczko=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58a29c0-25c3-4009-22aa-08d65434f89f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 06:53:00.8371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5821
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe09::61b
Subject: [Qemu-devel] [PATCH RFC v5 5/5] virtio-iommu: handle IOMMU Notifier
 flag changes
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
X-TUID: m+7F0Zcc5eU4

Finally handle the IOMMU Notifier flag changes
for the iommu-memory region.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v4->v5:
 - Rebase to v9 version from Eric (no change)

 hw/virtio/trace-events   |  2 ++
 hw/virtio/virtio-iommu.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f29a027258..8c1d77b0c2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -75,3 +75,5 @@ virtio_iommu_report_fault(uint8_t reason, uint32_t flags,=
 uint32_t endpoint, uin
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, u=
int64_t map_size) "mr=3D%s iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"=
PRIx64""
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_si=
ze) "mr=3D%s iova=3D0x%"PRIx64" size=3D0x%"PRIx64""
 virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=3D0x%"=
PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier=
 node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier=
 node for memory region %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c9d8b3aa4c..adc37ddf1b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1052,6 +1052,36 @@ unlock:
     qemu_mutex_unlock(&s->mutex);
 }
=20
+static void virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                             IOMMUNotifierFlag old,
+                                             IOMMUNotifierFlag new)
+{
+    IOMMUDevice *sdev =3D container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s =3D sdev->viommu;
+    VirtioIOMMUNotifierNode *node =3D NULL;
+    VirtioIOMMUNotifierNode *next_node =3D NULL;
+
+    if (old =3D=3D IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        node =3D g_malloc0(sizeof(*node));
+        node->iommu_dev =3D sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->iommu_dev =3D=3D sdev) {
+            if (new =3D=3D IOMMU_NOTIFIER_NONE) {
+                trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.na=
me);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+            return;
+        }
+    }
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
@@ -1167,6 +1197,7 @@ static void virtio_iommu_memory_region_class_init(Obj=
ectClass *klass,
=20
     imrc->translate =3D virtio_iommu_translate;
     imrc->replay =3D virtio_iommu_replay;
+    imrc->notify_flag_changed =3D virtio_iommu_notify_flag_changed;
 }
=20
 static const TypeInfo virtio_iommu_info =3D {
--=20
2.19.1

