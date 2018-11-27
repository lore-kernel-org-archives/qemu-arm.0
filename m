Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp911118wrt;
        Mon, 26 Nov 2018 23:09:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XjjvuJU7RXASfTab3cNEf3Mlrf5TbL18/bVhlE3G5Qh1tSIsPuf7Hre9EHkJpVp4VWLIsz
X-Received: by 2002:a81:af51:: with SMTP id x17mr31518424ywj.479.1543302559555;
        Mon, 26 Nov 2018 23:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543302559; cv=none;
        d=google.com; s=arc-20160816;
        b=N2Gt9qyvaOFNqqK2YBMIHRFjcrAOcV0dE1FEwdyiyEF5Jh8VjBvGp2hgjnbtXh3w9F
         zDAL/8jh01VWJVRkXXgp3G645V4gBt1NX4KUajvCujBct/9OHR21DJKm/rrElu+Idzms
         TDu7TPrJ9VrFiq20Hu8ssrK7TvOSv0XB2DkkONJkKqFGyjliH8GS9rZ5oJaP82Un0U6H
         XnQvyvu/r5WLzpJtZknLf8STjeL6E/HGvOVR1BFeyHsIl89tpqyHvJVhO2DhvFO+3Fv2
         JOxDrv5mdvmCevTmhqaQZajEhvwlEH+MvBhTCONw/T+8Yg2fKPlyA5hrAEDOUkYTzhZa
         YnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=mI9z/cJjuqfBPDaI1eYN8B5GV88rTFcJc/5x1KUmeuk=;
        b=W0Pn1icNEfVZwXtvpGsdiqcMbDDGB8Jm3ndK87nxA/l523nBiJcQHNWRKfs7MCHRo8
         Dk6M0CPX/YlFzlXClEpw0vwj0zq6KQucxbOWFUaeb+0t+84VbAWyInyqo+TrmzG7E+L3
         hvjkTGrvVo29iVq6PpFCeZF3TjYnWz7qTko3lnJzB5MqGvTE8D3DZtDkk9szyoqwpUiw
         goSkruAhA4bmGO1SRTN9jZHGxONutJsbNLjlK8dz+2IAezO2a44EXuC1P5SISKixCswq
         d0waHE4d1hKlaVw6MX/F/V7x1bUvDe0S3/vtl4P27sVioPBO/D9upqPqxupHR66k+wkw
         zXoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=rv8tHt2U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e78-v6si2114614ybh.261.2018.11.26.23.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 23:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=rv8tHt2U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXUk-00080u-Da
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 02:09:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXTa-0007Rm-7M
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 02:08:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXTX-0001mQ-2l
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 02:08:06 -0500
Received: from mail-eopbgr70051.outbound.protection.outlook.com
	([40.107.7.51]:26432
	helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXTW-0001iD-M5; Tue, 27 Nov 2018 02:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mI9z/cJjuqfBPDaI1eYN8B5GV88rTFcJc/5x1KUmeuk=;
	b=rv8tHt2UNISCVEh7NgObiDDvxbRu0QGTpEoBsvtRjiDR0jsVrWdywDyhRwfTS7nIQb7tXaIg1RhAVo547+IM+Cygcegg1jalw0iFgRQ5MEFEUHy9t1skt8JN38oaQY5AhGUek5YY61jpxjBSKfWOgOPQADC6DPrMsUcJIolY2CA=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5215.eurprd04.prod.outlook.com (20.177.51.204) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.16; Tue, 27 Nov 2018 07:07:56 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 07:07:56 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v9 15/17] hw/arm/virt: Add the virtio-iommu device tree
	mappings
Thread-Index: AQHUgocwpdZXzQrdSk+TxURNQluEfaVjOlcQ
Date: Tue, 27 Nov 2018 07:07:56 +0000
Message-ID: <VI1PR04MB4845C9E1E371E73CEB446C5D9AD00@VI1PR04MB4845.eurprd04.prod.outlook.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
	<20181122171538.12359-16-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-16-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [14.142.187.166]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR04MB5215;
	6:80V8RfaRcYDkXRwdimEB49bqxqYI8y/fXzDk670l2i0EbhWjEE4B1NS00TSZ1FbmD/pSTKVziU3yoGJc+cAYQmbFQnog44vwqA8Dwh+7aE0jalPxOvbs3H+vpl/bwgA6yWPJKQ2evUhRfeHAFn00ir+V5Jtw+DctJV2vMnr15qV0tVVPJWGuxcIgjSWxUjM6sz5NQtJGcSynpEyjlrb1lBQEYLJ+nRmGl6/m1yrSRtzwWfGNuUuPpCgW/j4qtDHOB6f5iuMy8rPJhpMtbDqo+QSEcxZnp4WnNtTRjvOE5ti0A9ObPS2z2nRywFZGJ+NGSriWyl43AyMzpRNXmgAIBB7NYkdsSUhnd2bP7j6CmhQ/6W3/86qulUV4QW86tLSOwA19g8hvN4B8s3m8lgDrZ4lIkJ6CrtLuVrBpGvn7iWcdqLvV1p+8Nl7wD4jsrI1IJGkiQeiSq5AOPa+G3e7kzw==;
	5:DgsitLrG8mulRkMhcymCdzGh8m4V2sP3VsSBi2JRsgrCYYVCB4Jcm3WO4laUfqEsJD1DEpmdedyaDQ0U812gfXDHX5ZtdX2tm1mcSn36BMktZpz324L7l9/3IYF7XG+Iqy5v8S49fd+YnjRHo+H4LqlyLtTnf/iK2wXUpPEu+rw=;
	7:c9hYbQ6/LJSrLbDYko++1k5zOypBY4W3yo0EN6Rzqq2Wocnc5411QHWLEXgnrpOWbbRnZ4rdW7IBDZu0A6oYWKfrfmYLfOo/GaenEej4gLBZydztK5bbjlVTk/HRzOeGk3ipWV1kptq68E8kyS4bZQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: c72ddaf3-acee-4a05-8238-08d654370ee6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5215; 
x-ms-traffictypediagnostic: VI1PR04MB5215:
x-microsoft-antispam-prvs: <VI1PR04MB5215D170F4C29389C4EF66E99AD00@VI1PR04MB5215.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231443)(944501410)(52105112)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5215; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5215; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(396003)(366004)(376002)(13464003)(199004)(189003)(81166006)(81156014)(97736004)(2906002)(39060400002)(55016002)(6506007)(8936002)(55236004)(53936002)(7416002)(102836004)(53546011)(5660300001)(76176011)(7696005)(105586002)(33656002)(106356001)(68736007)(8676002)(54906003)(110136005)(99286004)(9686003)(316002)(186003)(26005)(6246003)(6116002)(66066001)(3846002)(71190400001)(478600001)(14454004)(71200400001)(44832011)(476003)(7736002)(25786009)(6436002)(486006)(446003)(305945005)(11346002)(74316002)(78486014)(86362001)(229853002)(575784001)(2501003)(256004)(4326008)(2201001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5215;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: O90knsanVaJRm+dJX78SGgHaEwhHIk7cMmzCNi0alf4W+CzN2K0rEkhfKvcoTSBwyS7mmv4/YqVZW6A4MOT7SWg9E8DhRTUftfJaygs1FW3Y0qbpOw4bHntfp6slVHSdkRK6OtXfRX2bTQWghiHhtAWvYb1vtsRjm/gSnNON4xHPTVubgTE5R1duvs5vaolW5G+nM6XIOQPC6UpmlqQ9FstHzZ+RTiNfRN5eC/pNjt6JEsqj0s3p6VIQEZGrCsGpfSYvyOVqMK2l44iO44jRe/FDuDd4KWGnUG8ietn0RTdWfx8mls5OBBeXCzYYPzXJYlVblZDH1B4dNCb9Nse7HlxwXcfrY79PvtKGXzfMopM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72ddaf3-acee-4a05-8238-08d654370ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 07:07:56.7863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5215
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.7.51
Subject: Re: [Qemu-devel] [RFC v9 15/17] hw/arm/virt: Add the virtio-iommu
 device tree mappings
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OxbogwNvukJA



> -----Original Message-----
> From: Eric Auger <eric.auger@redhat.com>
> Sent: Thursday, November 22, 2018 10:46 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
> mst@redhat.com; jean-philippe.brucker@arm.com
> Cc: kevin.tian@intel.com; tn@semihalf.com; Bharat Bhushan
> <bharat.bhushan@nxp.com>; peterx@redhat.com
> Subject: [RFC v9 15/17] hw/arm/virt: Add the virtio-iommu device tree
> mappings
>=20
> Adds the "virtio,pci-iommu" node in the host bridge node and the RID
> mapping, excluding the IOMMU RID.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Bharat Bhushan <bharat.bhushan@nxp.com>

>=20
> ---
>=20
> v8 -> v9:
> - disable msi-bypass property
> - addition of the subnode is handled is the hotplug handler
>   and IOMMU RID is notimposed anymore
>=20
> v6 -> v7:
> - align to the smmu instantiation code
>=20
> v4 -> v5:
> - VirtMachineClass no_iommu added in this patch
> - Use object_resolve_path_type
> ---
>  hw/arm/virt.c         | 57 +++++++++++++++++++++++++++++++++++++------
>  include/hw/arm/virt.h |  2 ++
>  2 files changed, 52 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c index a2b8d8f7c2..b2bbb0ef49
> 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -29,6 +29,7 @@
>   */
>=20
>  #include "qemu/osdep.h"
> +#include "monitor/qdev.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
> @@ -49,6 +50,7 @@
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "hw/pci-host/gpex.h"
> +#include "hw/virtio/virtio-pci.h"
>  #include "hw/arm/sysbus-fdt.h"
>  #include "hw/platform-bus.h"
>  #include "hw/arm/fdt.h"
> @@ -59,6 +61,7 @@
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> +#include "hw/virtio/virtio-iommu.h"
>=20
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \ @=
@ -
> 1085,6 +1088,33 @@ static void create_smmu(const VirtMachineState *vms,
> qemu_irq *pic,
>      g_free(node);
>  }
>=20
> +static void create_virtio_iommu(VirtMachineState *vms, Error **errp) {
> +    const char compat[] =3D "virtio,pci-iommu";
> +    uint16_t bdf =3D vms->virtio_iommu_bdf;
> +    char *node;
> +
> +    vms->iommu_phandle =3D qemu_fdt_alloc_phandle(vms->fdt);
> +
> +    node =3D g_strdup_printf("%s/virtio_iommu@%d", vms-
> >pciehb_nodename, bdf);
> +    qemu_fdt_add_subnode(vms->fdt, node);
> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat,
> sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
> +                                 1, bdf << 8 /* phys.hi */,
> +                                 1, 0        /* phys.mid */,
> +                                 1, 0        /* phys.lo  */,
> +                                 1, 0        /* size.hi  */,
> +                                 1, 0        /* size.low */);
> +
> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms-
> >iommu_phandle);
> +    g_free(node);
> +
> +    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-
> map",
> +                           0x0, vms->iommu_phandle, 0x0, bdf,
> +                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff
> +- bdf); }
> +
>  static void create_pcie(VirtMachineState *vms, qemu_irq *pic)  {
>      hwaddr base_mmio =3D vms->memmap[VIRT_PCIE_MMIO].base; @@ -
> 1162,7 +1192,7 @@ static void create_pcie(VirtMachineState *vms,
> qemu_irq *pic)
>          }
>      }
>=20
> -    nodename =3D g_strdup_printf("/pcie@%" PRIx64, base);
> +    nodename =3D vms->pciehb_nodename =3D g_strdup_printf("/pcie@%"
> PRIx64,
> + base);
>      qemu_fdt_add_subnode(vms->fdt, nodename);
>      qemu_fdt_setprop_string(vms->fdt, nodename,
>                              "compatible", "pci-host-ecam-generic"); @@ -=
1205,13
> +1235,17 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>      if (vms->iommu) {
>          vms->iommu_phandle =3D qemu_fdt_alloc_phandle(vms->fdt);
>=20
> -        create_smmu(vms, pic, pci->bus);
> +        switch (vms->iommu) {
> +        case VIRT_IOMMU_SMMUV3:
> +            create_smmu(vms, pic, pci->bus);
> +            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
> +                                   0x0, vms->iommu_phandle, 0x0, 0x10000=
);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
>=20
> -        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
> -                               0x0, vms->iommu_phandle, 0x0, 0x10000);
>      }
> -
> -    g_free(nodename);
>  }
>=20
>  static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
> @@ -1736,12 +1770,21 @@ static void
> virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>                                       SYS_BUS_DEVICE(dev));
>          }
>      }
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        PCIDevice *pdev =3D PCI_DEVICE(dev);
> +
> +        vms->iommu =3D VIRT_IOMMU_VIRTIO;
> +        vms->virtio_iommu_bdf =3D pci_get_bdf(pdev);
> +        object_property_set_bool(OBJECT(dev), false, "msi-bypass", errp)=
;
> +        create_virtio_iommu(vms, errp);
> +    }
>  }
>=20
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState
> *machine,
>                                                          DeviceState *dev=
)  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>=20
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h index
> 4cc57a7ef6..c330f6f4b7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -115,7 +115,9 @@ typedef struct {
>      bool virt;
>      int32_t gic_version;
>      VirtIOMMUType iommu;
> +    uint16_t virtio_iommu_bdf;
>      struct arm_boot_info bootinfo;
> +    char *pciehb_nodename;
>      const MemMapEntry *memmap;
>      const int *irqmap;
>      int smp_cpus;
> --
> 2.17.2

