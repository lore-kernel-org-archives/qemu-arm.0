Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp898706wrt;
        Mon, 26 Nov 2018 22:55:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VG55Lgi+ih+YD9ZIyde3uBFpRWWViH46D2pffWpaPu4dJR7IdY87cYL61oeDY2In8EOWNt
X-Received: by 2002:a5b:f4a:: with SMTP id y10-v6mr32484443ybr.292.1543301714178;
        Mon, 26 Nov 2018 22:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543301714; cv=none;
        d=google.com; s=arc-20160816;
        b=mL3tFj/cXlyL3zPG5rAvpATTxR8xaPw049yBcfLUZun4RAt00FOOVwFZmLrMBp9Eei
         KS1LeNCFFstEFBYuhsJZphw5R70cNT8Lc696SfckkGxJ35OD+KddBxy8CzvBo7uOgQE7
         CV/4D2Vr6WCBZaUq8tEJNKQ6Cf4Ned6x5D6vpLmXmsvxhP/6UUE448svWeW5noBOEr+w
         OKQR+WllewO35VlTPq1tQfjqAEz9cghvqoFtplxV3n6bsKJ7Q9LjvMNGR3uAS/rFC4JO
         WGe8lR5GHloZjni84npktEEcxvv+PkEFRO1N7lYIR6E3p1n7gZQqdYhnS503dqj5W2H0
         wE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=S9V44H/bGcAUI6S2WQjMb3TNYkWgEfFF/2EsoHboebY=;
        b=TKHn6FJtdvzv4xQstDQy3jsSUAvxWMpICreD50CLKr0HIOLg4hlkDKMcZ02Lg8+xpk
         V6+YdeFuepWoOtsNd6LFeOMZMVYZ3OY5SUKjUCCEvrXLQvA8U0rgA/0wuxyrHp+Wwhl3
         mv3ga4fKBaRoLIyrFMzRuS7ZSMvWzZL5bJ4NnxuTRVD33qSyUD06a8TBHGb1tBE6KlK1
         hTUG0Yef1JwWvygFkMdB8LYW5A7mCwqFWxjJnHVw98BeNoOq25hLqbRNS0OgdUdj0QnB
         bnIGkKjUqazlRcLsj2eF/X0V31Ka/ZXvZ9Gxxzt+rffgtMLVl+HDo41erMgHH+mujqFc
         1iyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b="gje/jAXr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g133si2117334ywc.350.2018.11.26.22.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 22:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b="gje/jAXr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXH6-0006aL-Qe
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 01:55:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEw-0004b2-Ty
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXEt-0003gx-Op
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 01:52:58 -0500
Received: from mail-eopbgr50084.outbound.protection.outlook.com
	([40.107.5.84]:40767
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXEt-0003gU-FJ; Tue, 27 Nov 2018 01:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S9V44H/bGcAUI6S2WQjMb3TNYkWgEfFF/2EsoHboebY=;
	b=gje/jAXrWdsEZCuFMitbxW1vYiXW0XV+oha2p8jNRtWZqHnG+mgchwtfntOkCY7gD4ITo2AgIEFZN+I4BdVCPUuY7tPHciM+Q8uYa/94+IojwMRNDnRM+MtpGMF6g5KDLn41uFeHIFHGm5O9BZDv1KQ+Ur94IsM/dW8qOhZnVlc=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5821.eurprd04.prod.outlook.com (20.178.204.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 06:52:51 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 06:52:51 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
	<mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>, "drjones@redhat.com"
	<drjones@redhat.com>, "linu.cherian@cavium.com" <linu.cherian@cavium.com>, 
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [PATCH RFC v5 2/5] virtio-iommu: Add iommu notifier for
	iommu-map/unmap
Thread-Index: AQHUhh3QkoiHxZLGnEaVH2ClspzqDA==
Date: Tue, 27 Nov 2018 06:52:50 +0000
Message-ID: <20181127064101.25887-3-Bharat.Bhushan@nxp.com>
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
	6:mSan7mfbc3S6QMzNXjAPf7wqWB0ZjIDSfzLVbtXzaKxOL/a/V6pbaIlkD9ibx4OLk4a7cim0tpIpSTMcviuuoTtiSNBjWU9iChRHxmgESp5K+/yISDSY+1qiEt6IAtJfw0IHwsGD87Aiu134F06bpaxNrZpKy2q9kLAw6Hd3Q8SKEZ1K9YouGwXLfVgKs7VbdM0/KAAeQ2ce14vNc57rTmgl7FRAyqtxzdSPQuIgqRjaxAyqjkJ8JQqMKWsXMYplmzQOpka2Pd+U50B3m03sZXVeGG/LDUH1WOBzeM0LTTXb7/bTCeXEfV1V/p1lxU/vz9cMLhPN5BNjm3R97Xvh9oHFDo58stk9rz+94ugRD/aFuVmmTkB4wGkrs8JnNm6tMT1aY13PTh0mDu9hB/dawV2sLyqFSQqP83TN2FY3YCIiFquufVFnOe8tHQj3G4Be4UsZogZImjqa3vCvI3lBTg==;
	5:717QGP+Sj+lSqgvSYfr4/ujdqHlr38DTncMB1VqaHK/Xfls9AbYg+3q9j3/060+yY6z5uAyNZwhfivS78mCMdfLXiMwKuX0z61rXlTJJ72Ru5ehVmoBcxyupgxEoveCZYu/7PXGhIESNiOkZngIVGsGi1LyCl52k1cnCuIhyNdY=;
	7:sjeb5wleOxmL5J7isW21iJEgT3cD4+d59bPbsTUyUc1pnP54H4sLeQhR+qM73rVXUbcyNNxj5Ty6aIa3GGFlW4xwkAu7k018EmQcPxn+tzVaoFfLKf8IilAJbdMPE/KQMsyEQoFO9939mwN79/vm1A==
x-ms-office365-filtering-correlation-id: 20d7639b-6345-4c02-df91-08d65434f2c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5821; 
x-ms-traffictypediagnostic: VI1PR04MB5821:
x-microsoft-antispam-prvs: <VI1PR04MB582148E8AA0B539A35974A709AD00@VI1PR04MB5821.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5821; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5821; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(2201001)(316002)(6512007)(446003)(36756003)(3846002)(6116002)(7736002)(1076002)(8676002)(14454004)(53936002)(110136005)(2906002)(54906003)(6486002)(39060400002)(4326008)(5660300001)(305945005)(66066001)(81166006)(86362001)(6436002)(7416002)(81156014)(78486014)(14444005)(256004)(71200400001)(217873002)(478600001)(71190400001)(25786009)(50226002)(68736007)(8936002)(2501003)(11346002)(486006)(186003)(99286004)(386003)(52116002)(97736004)(76176011)(6506007)(476003)(2616005)(105586002)(106356001)(55236004)(26005)(102836004)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5821;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: LqyoXs72H/+HSXVf3Ekj6tP21wpb/uR0raYAS59Xr+UORRwZNFaHl0Nb7HTGI13FVJhO4ZPULiOd+gu6zGbz+pNyY16a8nDKhW14VtAT+oYzqMu5PNjk/yPNob9r9hv8vvsz0WBQmYIuhPr9ozwso70U3X7DI5+oSJWZ+EfQJu5KOUNebh7pItdIFTCW0cTB2xxWk+SOXOQbQ3a5IGZ0zzsN+OKLwx3OSQYlf60+sDUZT4DigFWfdaMlEmZrt/2uo7cQFKuSXU+y5VHILAgE/BWYHgOhFeXuvrmcPioRhgLChU1A/CPUOGeyKILh6JS112XdY7npO1nnj9JdUwOBaYZfn1Evw/8/nYqqs563kz4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d7639b-6345-4c02-df91-08d65434f2c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 06:52:51.0246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5821
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.84
Subject: [Qemu-devel] [PATCH RFC v5 2/5] virtio-iommu: Add iommu notifier
 for iommu-map/unmap
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
X-TUID: LBejTLvFhrcQ

This patch extends VIRTIO_IOMMU_T_MAP/UNMAP request
handling to notify registered iommu-notifier. These
iommu-notifier maps the requested region in IOMMU using vfio.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v4->v5:
 - Rebase to v9 version from Eric
 - PCIe device hotplug fix

 hw/virtio/trace-events           |  2 +
 hw/virtio/virtio-iommu.c         | 74 ++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-iommu.h |  6 +++
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 053a07b3fc..420b1e471b 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -72,3 +72,5 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t p=
hys_addr, uint32_t sid)
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t =
start, uint64_t end, uint32_t flags, size_t filled) "dev=3D %d, subtype=3D%=
d start=3D0x%"PRIx64" end=3D0x%"PRIx64" flags=3D%d filled=3D0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=3D%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoin=
t, uint64_t addr) "FAULT reason=3D%d flags=3D%d endpoint=3D%d address =3D0x=
%"PRIx64
+virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, u=
int64_t map_size) "mr=3D%s iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"=
PRIx64""
+virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_si=
ze) "mr=3D%s iova=3D0x%"PRIx64" size=3D0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2ec01f3b9e..613a77521d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -99,6 +99,38 @@ static gint interval_cmp(gconstpointer a, gconstpointer =
b, gpointer user_data)
     }
 }
=20
+static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr iova,
+                                    hwaddr paddr, hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    trace_virtio_iommu_notify_map(mr->parent_obj.name, iova, paddr, size);
+
+    entry.target_as =3D &address_space_memory;
+    entry.addr_mask =3D size - 1;
+    entry.iova =3D iova;
+    entry.perm =3D IOMMU_RW;
+    entry.translated_addr =3D paddr;
+
+    memory_region_notify_iommu(mr, 0, entry);
+}
+
+static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
+                                      hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    trace_virtio_iommu_notify_unmap(mr->parent_obj.name, iova, size);
+
+    entry.target_as =3D &address_space_memory;
+    entry.addr_mask =3D size - 1;
+    entry.iova =3D iova;
+    entry.perm =3D IOMMU_NONE;
+    entry.translated_addr =3D 0;
+
+    memory_region_notify_iommu(mr, 0, entry);
+}
+
 static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
 {
     QLIST_REMOVE(ep, next);
@@ -301,9 +333,12 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_start =3D le64_to_cpu(req->virt_start);
     uint64_t virt_end =3D le64_to_cpu(req->virt_end);
     uint32_t flags =3D le32_to_cpu(req->flags);
+    VirtioIOMMUNotifierNode *node;
+    viommu_endpoint *ep;
     viommu_domain *domain;
     viommu_interval *interval;
     viommu_mapping *mapping;
+    uint32_t sid;
=20
     interval =3D g_malloc0(sizeof(*interval));
=20
@@ -331,9 +366,40 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
=20
     g_tree_insert(domain->mappings, interval, mapping);
=20
+    /* All devices in an address-space share mapping */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
+            sid =3D virtio_iommu_get_sid(node->iommu_dev);
+            if (ep->id =3D=3D sid) {
+                virtio_iommu_notify_map(&node->iommu_dev->iommu_mr,
+                                        virt_start, phys_start, mapping->s=
ize);
+            }
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
=20
+static void virtio_iommu_remove_mapping(VirtIOIOMMU *s, viommu_domain *dom=
ain,
+                                        viommu_interval *interval)
+{
+    VirtioIOMMUNotifierNode *node;
+    viommu_endpoint *ep;
+    uint32_t sid;
+
+    g_tree_remove(domain->mappings, (gpointer)(interval));
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
+            sid =3D virtio_iommu_get_sid(node->iommu_dev);
+            if (ep->id =3D=3D sid) {
+                virtio_iommu_notify_unmap(&node->iommu_dev->iommu_mr,
+                                          interval->low,
+                                          interval->high - interval->low +=
 1);
+            }
+        }
+    }
+}
+
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
                               struct virtio_iommu_req_unmap *req)
 {
@@ -366,18 +432,18 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         current.high =3D high;
=20
         if (low =3D=3D interval.low && size >=3D mapping->size) {
-            g_tree_remove(domain->mappings, (gpointer)(&current));
+            virtio_iommu_remove_mapping(s, domain, &current);
             interval.low =3D high + 1;
             trace_virtio_iommu_unmap_left_interval(current.low, current.hi=
gh,
                 interval.low, interval.high);
         } else if (high =3D=3D interval.high && size >=3D mapping->size) {
             trace_virtio_iommu_unmap_right_interval(current.low, current.h=
igh,
                 interval.low, interval.high);
-            g_tree_remove(domain->mappings, (gpointer)(&current));
+            virtio_iommu_remove_mapping(s, domain, &current);
             interval.high =3D low - 1;
         } else if (low > interval.low && high < interval.high) {
             trace_virtio_iommu_unmap_inc_interval(current.low, current.hig=
h);
-            g_tree_remove(domain->mappings, (gpointer)(&current));
+            virtio_iommu_remove_mapping(s, domain, &current);
         } else {
             break;
         }
@@ -907,6 +973,8 @@ static void virtio_iommu_device_realize(DeviceState *de=
v, Error **errp)
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
=20
+    QLIST_INIT(&s->notifiers_list);
+
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
=20
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-io=
mmu.h
index 56c8b4e57f..65bda6d6fe 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -46,6 +46,11 @@ typedef struct IOMMUPciBus {
     IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically allo=
c */
 } IOMMUPciBus;
=20
+typedef struct VirtioIOMMUNotifierNode {
+    IOMMUDevice *iommu_dev;
+    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
+} VirtioIOMMUNotifierNode;
+
 typedef struct VirtIOIOMMU {
     VirtIODevice parent_obj;
     VirtQueue *req_vq;
@@ -60,6 +65,7 @@ typedef struct VirtIOIOMMU {
     QemuMutex mutex;
     GTree *endpoints;
     bool msi_bypass;
+    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
 } VirtIOIOMMU;
=20
 #endif
--=20
2.19.1

