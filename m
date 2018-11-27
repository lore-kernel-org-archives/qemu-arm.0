Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp900974wrt;
        Mon, 26 Nov 2018 22:58:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VSU6vx2citIZwbuaBjtD3dz4aufbYBkZNP8nkM3JQMDERkUKCnsgLmN155Xf5ZATCPtWgt
X-Received: by 2002:a25:c614:: with SMTP id k20-v6mr31498058ybf.215.1543301891462;
        Mon, 26 Nov 2018 22:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543301891; cv=none;
        d=google.com; s=arc-20160816;
        b=uLRpXPgsRcJGWVIhZjw0TlvQOqvcZZflqThQNFMr3oxMgHBZb5jrybSs12YR9txekU
         sIC4BzUVWkcHW5atO+H2kfs/NxsU0umOvq1W6BDcxYzMnXQN/cmm/znVYoFtDk8wWQ00
         IANYIUyCf67OZQQjyTqg/SdIFMSmoACplIH4+/Ej6iAW5+xaF9hGsEFf50R0PxaYTunx
         ds5ciKGAyOg8i0TWUovUxC/8xIro3tXiHizdVMKKApzLwFgyEG12GYVCBdbQTej1v6zS
         HdIEX8E1o6bQ4j+SbCvnZ/BvuQZ5VWtTnlLRs3QdhC0+uEkoYHmx9mxEVDVQUsZJqdL8
         VHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=TMnlirXBK+1JZblFaHxwZti9oASZx5A3ihRyYbk5XFo=;
        b=rHTY5ArspJU2wdMNcuE2IjakfaYUGW8nEtgXUpymvuKs84MICSYbioayp0ivrfQN2I
         h/YA82UeM2hULqSEpqsvfERGtJIXn0vge3hSRTLOkaGlKiSw0+ITPawYE75VbwhXUdhk
         +0isF8x3z2j2/K1cQL74IuZo4m9vzXAzE2EUzLS5eyeWexjUI44eENsWR7uZROvvn0HC
         40kkFt2h0njKTnx+qFmPnd1Edn7Rsark72KHzwIL4uyh1g/tidB4qVPRCTcycVS+somM
         mPzwskgm6W8TO3mXBn8RVRF7OX0SVMtUHQzC7luPzUO4YqTahIoAN62jyL3nXAm/hhij
         5aoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=LjFOWBbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64-v6si2045458ybc.225.2018.11.26.22.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 22:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=LjFOWBbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXJy-00023y-RA
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 01:58:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXF1-0004f7-C0
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 01:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXF0-0003iQ-Ir
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 01:53:03 -0500
Received: from mail-ve1eur03on061e.outbound.protection.outlook.com
	([2a01:111:f400:fe09::61e]:3008
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXEy-0003hT-Gi; Tue, 27 Nov 2018 01:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TMnlirXBK+1JZblFaHxwZti9oASZx5A3ihRyYbk5XFo=;
	b=LjFOWBbKRb87s2Q0qJq1Z6qmBPtEsrBfs58/wRY/CLeg+NIIcLqbZ7Lnc8j0YcKK9bTC3Tp1+PKdWxHYF7GJridIsRb2FA1uELoCEPqtrx7af5pr5Obc6LSMshwlQKRl6EBLYadU2YiVh6qXWAswhQU7ZOBJp+AeRA8q4LGq8VA=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5821.eurprd04.prod.outlook.com (20.178.204.87) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 06:52:57 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 06:52:57 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
	<mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>, "drjones@redhat.com"
	<drjones@redhat.com>, "linu.cherian@cavium.com" <linu.cherian@cavium.com>, 
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [PATCH RFC v5 4/5] virtio-iommu: add virtio-iommu replay
Thread-Index: AQHUhh3UUx6fk/xsSkScsznMQxljJg==
Date: Tue, 27 Nov 2018 06:52:57 +0000
Message-ID: <20181127064101.25887-5-Bharat.Bhushan@nxp.com>
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
	6:MT+Mb49eDirkHG33sU9DUjRCtWgiiiHdAq/4k7Ob9qO8HemWxwBmvUetOpTZQgvODeK0tEv8GLglJD8PIvo8WPPejn6yow5pIHbAnlyB2Yin+/LaSQ6ql4EL3fZyZBYZzGs1sz+b6IpgV6DU49KuN1y5ZQteax7mMS+IQmMyd++DC2JDViCl/byiMMqDEnJ7EAuwmf4ReHXVHRTaxWuAUb/5EvAEIHExB/gxxJEqbMsa4bNk7zbEGzHvITI0p1IFuuTz546kqMgC36FDLqObyACDye97Pfm7NlDTnwCDZrmX/NRAxanXFXxqRne/eeNK5Iz+iUYKeGkBdAwXIQaDgb60xQQ7yeJI4H5fnffDq76bQRe5XZyWGUO7r+72MDAgDZr1Aggc0xdq6Kf0UQvH2zNqaRp4Xuw3Xsgv1ZFEOm03S8rsJhtVHJXatY9EclViodZ/xalmEF9R5K5wd3J3hA==;
	5:e5wS3HDhTx0bGFqYCIONTnxFFS5NByWpm+/xO8Xk6GGmO0rCSYgp0GXO/+xRnVyyV4G8ld3miaFp4VHdVJZwAv2r5LLZaGVuk3dhWSzF54S2ySwKXj8lMX1KeRBYU/0Y+tiZgxzVhboHL84lulTSthJvQDNQ3kq9EDxvp5MEAzk=;
	7:jBQA4usDjS8XIx9ueOXGO7zd+br+HG51ZjySiC1XErShEiMe54aCb2QccYjrC+0j6OmPMmfv40YBU5wnGBgqw/77i9RA/PEs2I1S2mZYDyAbvsK3LfKFIlxyyX0U4SAV8a4n+TlGsMSvaPLl2JrFPQ==
x-ms-office365-filtering-correlation-id: 0537b8c4-a897-44a3-7572-08d65434f6aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5821; 
x-ms-traffictypediagnostic: VI1PR04MB5821:
x-microsoft-antispam-prvs: <VI1PR04MB582144301A4A1058DD37D68D9AD00@VI1PR04MB5821.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5821; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5821; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(2201001)(316002)(6512007)(446003)(36756003)(3846002)(6116002)(7736002)(1076002)(8676002)(14454004)(53936002)(110136005)(2906002)(54906003)(6486002)(39060400002)(4326008)(5660300001)(305945005)(66066001)(81166006)(86362001)(6436002)(7416002)(81156014)(78486014)(14444005)(256004)(5024004)(71200400001)(217873002)(478600001)(71190400001)(25786009)(50226002)(68736007)(8936002)(2501003)(11346002)(486006)(186003)(99286004)(386003)(52116002)(97736004)(76176011)(6506007)(476003)(2616005)(105586002)(106356001)(55236004)(26005)(102836004)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5821;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: uX5BVLPSyfrTDKG4SYaahys5aHIbYJeKUM7r3yxb2Bs2leunP+Hkp3l1GRT7vgkfDCXIZRsmRjQB5mEC5OonhutHKhseACaOWF6YP8Qsoxcgo7jpd2HftbL5xEb6UGuhPWKx0IfwI312ujuzSeXMZ2lgRGJXv2qdpvjtYGjZVIZkVpBomEH5fW2s/3cIa1hrGZWM94ZqGB/RxMPdHJtpEX34IfAN0sh8TxKIqRZzAq9y/KNBohrVonvUh2Y/CYq5P4tbuw/QwjCh+hgWabhKuz1VwC+8BZfmZsvrmY2nudUc4Bu1CrqHRsf8bn6N60ZZFmYH/Yi5MzZ3TE8CqZD7zwg2LNVGrY0IR9wHjt+Vwhc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0537b8c4-a897-44a3-7572-08d65434f6aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 06:52:57.7121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5821
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe09::61e
Subject: [Qemu-arm] [PATCH RFC v5 4/5] virtio-iommu: add virtio-iommu replay
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
Cc: "bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Y8gnAgAAhci

For virtio-iommu, on replay first unmap any previous
iommu-mapping and then map in iommu as per guest iommu
mappings.

Also if virtual iommu do have it own replay then
memory_region_iommu_replay() calls "imrc->translate()",
While virtio-iommu translate() expects device to be
registered before it is called. So having replay of
virtio-iommu helps to take no action if device not yet
probed/attached.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v4->v5:
 - Rebase to v9 version from Eric (no change)

 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 420b1e471b..f29a027258 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -74,3 +74,4 @@ virtio_iommu_fill_none_property(uint32_t devid) "devid=3D=
%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoin=
t, uint64_t addr) "FAULT reason=3D%d flags=3D%d endpoint=3D%d address =3D0x=
%"PRIx64
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, u=
int64_t map_size) "mr=3D%s iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"=
PRIx64""
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_si=
ze) "mr=3D%s iova=3D0x%"PRIx64" size=3D0x%"PRIx64""
+virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=3D0x%"=
PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7e8149e719..c9d8b3aa4c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1015,6 +1015,43 @@ static gint int_cmp(gconstpointer a, gconstpointer b=
, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
=20
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer =
data)
+{
+    viommu_mapping *mapping =3D (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr =3D (IOMMUMemoryRegion *) data;
+
+    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
+                             mapping->size);
+    /* unmap previous entry and map again */
+    virtio_iommu_notify_unmap(mr, mapping->virt_addr, mapping->size);
+
+    virtio_iommu_notify_map(mr, mapping->virt_addr, mapping->phys_addr,
+                            mapping->size);
+    return false;
+}
+
+static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s =3D sdev->viommu;
+    uint32_t sid;
+    viommu_endpoint *ep;
+
+    sid =3D virtio_iommu_get_sid(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+
+    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep || !ep->domain) {
+        goto unlock;
+    }
+
+    g_tree_foreach(ep->domain->mappings, virtio_iommu_remap, mr);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
@@ -1129,6 +1166,7 @@ static void virtio_iommu_memory_region_class_init(Obj=
ectClass *klass,
     IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_CLASS(klass);
=20
     imrc->translate =3D virtio_iommu_translate;
+    imrc->replay =3D virtio_iommu_replay;
 }
=20
 static const TypeInfo virtio_iommu_info =3D {
--=20
2.19.1

