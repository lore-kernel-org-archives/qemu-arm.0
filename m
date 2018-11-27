Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp913804wrt;
        Mon, 26 Nov 2018 23:12:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XZA8keMx+K7ZI2pqBq8xlto7XyPLgekosHHBHagF/CUBEnYF0Bm1LFGG/bqHdhOLgqnlat
X-Received: by 2002:a25:a1c9:: with SMTP id a67-v6mr28105009ybi.64.1543302737303;
        Mon, 26 Nov 2018 23:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543302737; cv=none;
        d=google.com; s=arc-20160816;
        b=IVkJuQL47T8NIhaglwYb3cqOQb1dqWf80xOcVSkuAoO9udKD3ZoRmWGk8lp/jSRSLV
         WtIjkRpSiI4p5yaS8UR1tU73l2BeY939RW7NgRbSJDi1IkZqOJp9YZgwfJdO2QAFNQ/7
         S0zXCfUXKz5u/e9hB3qcFIlz9SSjg6EpmeQYrrOlKjOfqVwf8fBeOry1Tp48VSWWdWY8
         920vG8yI+xQ2ayNVqlEHK7jxoYx1QV2kK28UFiTL+qvfZTCsrA79UxE88mLLvXyOzcHy
         moKAK/4yeScb0aBdlllU3Ut+3n9chj524MpNjGcwYOmhHbnKIp/4Ro+5A8JG9OB2s0cG
         YstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=o/vYH+0ojXG3+BokUrhefcSSZ2Uy2GvAIguqioc44JY=;
        b=mvQeCk8bBeXaKFEBfJmbARzlEQEcWrl0gNcFBckA7rz8UL4+BcxA28PauSNmZDs+hC
         CZYx+l1QJ5L3rnQbKkdbFDHrG2su+3IC3emuTvPaEhG6EEBjyN/b92PubOLqqnSBxvHr
         19rJ/BuqWQ/Ce9ir1yg17JpElm7BDcGvO4u6a6w6E+OZqPf9wYoWBV5a19Yf3xDKHcMU
         zuz0FFdkzci2nkxAD41spjkct0k3v2Stw2DQ4xIz+x058uWx32dGyQHU5lbOI/bF0hHi
         8mD2DzeSdwNADRxTEMlBYS5XOlb1AEUjc24md5MBVDA6S5iFMDqn6QwpaqVqupDHDjpX
         nJtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=InV0OxHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u12-v6si2263451ybd.437.2018.11.26.23.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 23:12:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=InV0OxHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:40408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRXXb-0000yq-Oi
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 02:12:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXXR-0000wu-27
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 02:12:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gRXXP-0003XU-6E
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 02:12:05 -0500
Received: from mail-am5eur02on0608.outbound.protection.outlook.com
	([2a01:111:f400:fe07::608]:43904
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gRXXE-0003V0-Vy; Tue, 27 Nov 2018 02:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o/vYH+0ojXG3+BokUrhefcSSZ2Uy2GvAIguqioc44JY=;
	b=InV0OxHMViTAQFadF5w+PxdtVWiaDR7XtuMrm4JmgFloIixsgACIpQdnv+4eMiaCUZejn9AoUZDpmJ8EBIqIvWqyZ9cpryjLel64MIZX4iKSpA9GQjTnLi0NgW72IhS/6l8AIo+wtJQ9Km5J2AJEIIZt1BoIyEDb4y1IrYWZTM4=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB5214.eurprd04.prod.outlook.com (20.177.51.203) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.16; Tue, 27 Nov 2018 07:11:46 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.032;
	Tue, 27 Nov 2018 07:11:46 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v9 00/17] VIRTIO-IOMMU device
Thread-Index: AQHUgocHAOUMqyNa4EW3/MSwR1kHz6VjO3NA
Date: Tue, 27 Nov 2018 07:11:46 +0000
Message-ID: <VI1PR04MB48456BBF709F364C8E9B08269AD00@VI1PR04MB4845.eurprd04.prod.outlook.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [14.142.187.166]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR04MB5214;
	6:SJfSHUBO/YWdeZIqr8VX1oDhKIIUQXPapcD4l5mH6zAdic2xz3GW8XNHH3TAPjXXlmV3Q2EuKQtu8jAVBmXuQu7Fc8eh3emlNHNBsVJj31kH3308GLe0wzVirZyfjqznes7Mqy+Lucsj8Kc6QOhxYCQ1K5npywDC8sFAxFFRzs0YrOrk3TCRAV+LPmp9fmu1vSAuGrHlwpihVFLumpGIA/PQ83p/KQMfVWKboZExB2c2ICFbH5DODAB4ziDBuBnqavH9WSO/GCc3ZdkN50uGKlj0/B5WPeIKGsr179MSyp31BBJDAVFIm55qj7LQI2DYQ3ia3q22ni4AlkXbZvcHDn5miWBUfqOGRqDpnghyQP8PIbY264rDqZ4eHOOwoSNgopIdEoM85CG57V9YyowbTJG8Egw3t+MZWitbnuXG5MWqGC3/joDWIgPptV3hvIWgFbKzCJdO4RMnkUPLvMBiqQ==;
	5:J1eioEJMtnUVtbnUl1qyzA4YNGU85/z7A50SNkDiNHKQ7DJV23ta6tkOLNskPr2gvxR4hYklhZC7sSOsRwhRiw/6Qs9nUaJ/+74iUhC2/+XE23GtlMZE4bQl/Xr3N2Vo9q3PZVAZQ3N942ymzmBJWTB5nj0vbDF3QwWSznwYNiA=;
	7:ncH2YWCectsDQB723ma3tuSgEJ8WxrNkpUlNNOoDaTPuJFa84BS3zgz0hc2qwWnccCnQR1VULuhiV+LhQuddRttDUJ1+jM07I0ZUNFyoeSB2rIRQftoUTZW8lJ354C5nQI+I2HZwBjKl0cjuE3bW+w==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 403f4cbb-87c1-4d57-c76c-08d6543797d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB5214; 
x-ms-traffictypediagnostic: VI1PR04MB5214:
x-microsoft-antispam-prvs: <VI1PR04MB5214C2A3140865A32BA256AC9AD00@VI1PR04MB5214.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB5214; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB5214; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(366004)(376002)(346002)(136003)(199004)(189003)(13464003)(486006)(44832011)(54906003)(2501003)(8676002)(99286004)(81156014)(8936002)(7416002)(78486014)(97736004)(110136005)(478600001)(5660300001)(186003)(86362001)(2906002)(81166006)(76176011)(55016002)(9686003)(26005)(14454004)(6306002)(966005)(14444005)(5024004)(2201001)(256004)(66066001)(102836004)(45080400002)(575784001)(53936002)(6116002)(3846002)(53546011)(68736007)(316002)(4326008)(55236004)(6436002)(229853002)(476003)(11346002)(74316002)(446003)(106356001)(33656002)(7736002)(7696005)(305945005)(71200400001)(71190400001)(25786009)(6506007)(39060400002)(6246003)(105586002)(561944003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5214;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Xhx84bq/2tjpGMQ2x/VyCqpvaHCtdaTZs3cburUOAty4PlGFErTLf8v/ZpFmw6uJXapaf9ZtoAJiprPqxkuY6pJLo3ox/7zRkjfFII9zgssFgs3r9bGWDjyGvga6py/0KqSgpN4lPWVjWV71uDpO7KSxMbV5Obx2O3/PfF5mZUHQ95DeoRI6iNqwi6r7xjOe4vFCBOGWTxqMSNiLWW9tsNdbjyvNU1nNq/qI1sIgykYTwisMbDNJKWXYWRxuyvMOL+56RBNUA2g+D/WZZr7QpmYwtc+RSXZmbnGYduxjN3R3tT74eFX4Wyibc9MhgCbb7QSM4mt4SIk3n0yJGj4xMbmebWsH9O5SthoqXUXsi2c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403f4cbb-87c1-4d57-c76c-08d6543797d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 07:11:46.5205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5214
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe07::608
Subject: Re: [Qemu-arm] [RFC v9 00/17] VIRTIO-IOMMU device
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EbHpCIXsixHx

Hi Eric,

> -----Original Message-----
> From: Eric Auger <eric.auger@redhat.com>
> Sent: Thursday, November 22, 2018 10:45 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
> mst@redhat.com; jean-philippe.brucker@arm.com
> Cc: kevin.tian@intel.com; tn@semihalf.com; Bharat Bhushan
> <bharat.bhushan@nxp.com>; peterx@redhat.com
> Subject: [RFC v9 00/17] VIRTIO-IOMMU device
>=20
> This series rebases the virtio-iommu device on qemu 3.1.0-rc2 and
> implements the v0.8(.1) virtio-iommu spec [1]. The pci proxy for the virt=
io-
> iommu device is now available and needs to be instantiated from the
> command line using "-device virtio-iommu-pci".
> The iommu machvirt option is not used anymore to instantiate the virtio-
> iommu.
>=20
> At the moment the virtio-iommu-device only is functional in the ARM virt
> machine. Indeed, besides its instantiation, links between the PCIe end po=
ints
> and the IOMMU must be described. This is achieved by DT or ACPI
> description (IORT). This description currently only is done in ARM virt.
>=20
> Best Regards
>=20
> Eric
>=20
> This series can be found at:
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit
> hub.com%2Feauger%2Fqemu%2Ftree%2Fv3.1.0-rc2-virtio-iommu-
> v0.9&amp;data=3D02%7C01%7Cbharat.bhushan%40nxp.com%7C031e61e2a2f3
> 4e3b945a08d6509e2918%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C636785037552135579&amp;sdata=3Dv99FRL1dQC%2BPTofwwqqoKGNiiqJ%2F
> lGBX3KJB0IUKbQU%3D&amp;reserved=3D0
>=20
> References:
> [1] [PATCH v3 0/7] Add virtio-iommu driver
>=20
> [2] guest branch featuring the virtio-iommu driver v0.8.1 + ACPI
>     integration not yet officially released by Jean.
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit
> hub.com%2Feauger%2Flinux%2Ftree%2Fvirtio-iommu-
> v0.8.1&amp;data=3D02%7C01%7Cbharat.bhushan%40nxp.com%7C031e61e2a2f
> 34e3b945a08d6509e2918%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C636785037552135579&amp;sdata=3DEjHA9BZ6rNX36YFKkNocBQtoz3uf3bdn
> 5T9NSJ6SaRg%3D&amp;reserved=3D0
>=20
> Testing:
> - tested with guest using virtio-net-pci
>   (,vhost=3Doff,iommu_platform,disable-modern=3Doff,disable-legacy=3Don)
>   and virtio-blk-pci
> - VFIO/VHOST integration is not part of this series
> - When using the virtio-blk-pci, some EDK2 FW versions feature
>   unmapped transactions and in that case the guest fails to boot.

I have tested this series with virtio and VFIO both
Tested-by: Bharat Bhushan <bharat.bhushan@nxp.com>

Thanks
-Bharat
>=20
> History:
>=20
> v8 -> v9:
> - virtio-iommu-pci device needs to be instantiated from the command
>   line (RID is not imposed anymore).
> - tail structure properly initialized
>=20
> v7 -> v8:
> - virtio-iommu-pci added
> - virt instantiation modified
> - DT and ACPI modified to exclude the iommu RID from the mapping
> - VIRTIO_IOMMU_F_BYPASS, VIRTIO_F_VERSION_1 features exposed
>=20
> v6 -> v7:
> - rebase on qemu 3.0.0-rc3
> - minor update against v0.7
> - fix issue with EP not on pci.0 and ACPI probing
> - change the instantiation method
>=20
> v5 -> v6:
> - minor update against v0.6 spec
> - fix g_hash_table_lookup in virtio_iommu_find_add_as
> - replace some error_reports by qemu_log_mask(LOG_GUEST_ERROR, ...)
>=20
> v4 -> v5:
> - event queue and fault reporting
> - we now return the IOAPIC MSI region if the virtio-iommu is instantiated
>   in a PC machine.
> - we bypass transactions on MSI HW region and fault on reserved ones.
> - We support ACPI boot with mach-virt (based on IORT proposal)
> - We moved to the new driver naming conventions
> - simplified mach-virt instantiation
> - worked around the disappearing of pci_find_primary_bus
> - in virtio_iommu_translate, check the dev->as is not NULL
> - initialize as->device_list in virtio_iommu_get_as
> - initialize bufstate.error to false in virtio_iommu_probe
>=20
> v3 -> v4:
> - probe request support although no reserved region is returned at
>   the moment
> - unmap semantics less strict, as specified in v0.4
> - device registration, attach/detach revisited
> - split into smaller patches to ease review
> - propose a way to inform the IOMMU mr about the page_size_mask
>   of underlying HW IOMMU, if any
> - remove warning associated with the translation of the MSI doorbell
>=20
> v2 -> v3:
> - rebase on top of 2.10-rc0 and especially
>   [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
> - add mutex init
> - fix as->mappings deletion using g_tree_ref/unref
> - when a dev is attached whereas it is already attached to
>   another address space, first detach it
> - fix some error values
> - page_sizes =3D TARGET_PAGE_MASK;
> - I haven't changed the unmap() semantics yet, waiting for the
>   next virtio-iommu spec revision.
>=20
> v1 -> v2:
> - fix redifinition of viommu_as typedef
>=20
> Eric Auger (17):
>   update-linux-headers: Import virtio_iommu.h
>   linux-headers: Partial update for virtio-iommu v0.8
>   virtio-iommu: Add skeleton
>   virtio-iommu: Decode the command payload
>   virtio-iommu: Add the iommu regions
>   virtio-iommu: Endpoint and domains structs and helpers
>   virtio-iommu: Implement attach/detach command
>   virtio-iommu: Implement map/unmap
>   virtio-iommu: Implement translate
>   virtio-iommu: Implement probe request
>   virtio-iommu: Expose the IOAPIC MSI reserved region when relevant
>   virtio-iommu: Implement fault reporting
>   virtio_iommu: Handle reserved regions in translation process
>   virtio-iommu-pci: Add virtio iommu pci support
>   hw/arm/virt: Add the virtio-iommu device tree mappings
>   hw/arm/virt-acpi-build: Introduce fill_iort_idmap helper
>   hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table
>=20
>  hw/arm/virt-acpi-build.c                      |   91 +-
>  hw/arm/virt.c                                 |   57 +-
>  hw/virtio/Makefile.objs                       |    1 +
>  hw/virtio/trace-events                        |   26 +
>  hw/virtio/virtio-iommu.c                      | 1040 +++++++++++++++++
>  hw/virtio/virtio-pci.c                        |   51 +
>  hw/virtio/virtio-pci.h                        |   14 +
>  include/hw/acpi/acpi-defs.h                   |   21 +-
>  include/hw/arm/virt.h                         |    2 +
>  include/hw/pci/pci.h                          |    1 +
>  include/hw/virtio/virtio-iommu.h              |   65 ++
>  include/standard-headers/linux/virtio_ids.h   |    1 +
>  include/standard-headers/linux/virtio_iommu.h |  159 +++
>  linux-headers/linux/virtio_iommu.h            |    1 +
>  qdev-monitor.c                                |    1 +
>  scripts/update-linux-headers.sh               |    3 +
>  16 files changed, 1501 insertions(+), 33 deletions(-)  create mode 10064=
4
> hw/virtio/virtio-iommu.c  create mode 100644 include/hw/virtio/virtio-
> iommu.h  create mode 100644 include/standard-
> headers/linux/virtio_iommu.h
>  create mode 100644 linux-headers/linux/virtio_iommu.h
>=20
> --
> 2.17.2

