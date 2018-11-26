Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp16988wrt;
        Mon, 26 Nov 2018 09:06:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WkduQr6xvlOBn5PseLxukADG5+HqHs9gRCn6KMhN7vgDEXf+ExxUYC4j/OVpcVYh83FG23
X-Received: by 2002:a81:3d12:: with SMTP id k18mr16161276ywa.38.1543251987164;
        Mon, 26 Nov 2018 09:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543251987; cv=none;
        d=google.com; s=arc-20160816;
        b=lkjbWWRQySnYYihBuEa9MEccpEbOGNOac7OUIdC34XsiFtsiYRYRyjXKIt2eCjgL2s
         mWBpdOtIasEVL/syI/jHC0adNowDwqvwONV10UGUKuHK/gMBO5sI4qtrVlkdJPBy3epE
         HXfVNlu2PA7hYkqSE5gZChOAplLSoy6NngIBMgy+NggSoON1cUKMD+J+3FPB157tuWlu
         KwvMkgGP6bQNSlmCogS2pvUT8Jv1r4QCxCFy83gvNoMQVyJ/SvL0oqkJKZBxe/D6ksxK
         49GlR2SSivRkToKu37jNY5c0QU1oL5oZzaOMDY8UKSlbUhU5UOK/wLPmLYllKvLaHGQ8
         JwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=fugYg6wAHTOrC+DnjAa03Xm5O2vNJDnL/f2GzWlu97g=;
        b=Y1gocxIQnCHcEzIjiXXINwfsiYgW3KqAF6g3exJY4qvPYSPom1sC6HezFYaHjKWUsO
         gqSzROVHMWwyYOZg4VUdlLLdyVzXegyrKzc3MISy934J8vVNfTa9cProu0kql0DKEtfr
         NyLB2EmfthcMbI5ZK605vEqAMYeN1kFWemx+0n7yKJyTCD3wqi68BrA1HOjagfGX/jLr
         ZO6qlCjTgJ2KfaBxjtQK4DEkdZSZUgPawbbHf6vGx/HQr6pQwZ5wOIienc8MF+rMc/p7
         liNcjODfZyAwetYePDn3M6kSQG2SukrtmvBzz8tb1dekrLGJIjFSrM3tx73Z9qTlDXJa
         uCSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o144-v6si643714ybg.74.2018.11.26.09.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 09:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRKL4-0007AW-Ia
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 12:06:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gRKK3-00077k-Rq
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 12:05:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gRKK0-0002JX-JF
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 12:05:23 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:28191 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gRKJr-0002Dz-Ab; Mon, 26 Nov 2018 12:05:11 -0500
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 5774FCD69D936;
	Mon, 26 Nov 2018 17:05:04 +0000 (GMT)
Received: from lhreml702-chm.china.huawei.com (10.201.108.51) by
	lhreml708-cah.china.huawei.com (10.201.108.49) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 26 Nov 2018 17:05:06 +0000
Received: from lhreml702-chm.china.huawei.com (10.201.108.51) by
	lhreml702-chm.china.huawei.com (10.201.108.51) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 26 Nov 2018 17:05:05 +0000
Received: from FRAEMA706-CHM.china.huawei.com (10.206.14.55) by
	lhreml702-chm.china.huawei.com (10.201.108.51) with Microsoft SMTP
	Server
	(version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 26 Nov 2018 17:05:05 +0000
Received: from FRAEML521-MBB.china.huawei.com ([169.254.3.116]) by
	FRAEMA706-CHM.china.huawei.com ([169.254.6.31]) with mapi id
	14.03.0415.000; Mon, 26 Nov 2018 18:04:57 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>
Thread-Topic: [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3 ACPI
	integration
Thread-Index: AQHUhZ9EaCZGGLr6n0KGJnkkp2VL5aViRk2w
Date: Mon, 26 Nov 2018 17:04:56 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83885CFB0@FRAEML521-MBB.china.huawei.com>
References: <20181126154616.18173-1-eric.auger@redhat.com>
In-Reply-To: <20181126154616.18173-1-eric.auger@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-devel] [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3
 ACPI integration
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
Cc: "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7SKhEWQsgPhG

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: 26 November 2018 15:46
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com
> Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Subject: [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3 ACPI integrat=
ion
>=20
> The AcpiIortSmmu3 misses 2 32b fields corresponding to the
> proximity domain and the device id mapping index.
>=20
> Also let's report IO-coherent access is supported for
> translation table walks, descriptor fetches and queues by
> setting the COHACC override flag. Without that, we observe
> wrong command opcodes. The DT description also advertises
> the dma coherency.

Ah..that explains the "IDR0.COHACC overridden" and "CMD_SYNC timeout "
entries in the boot log.  Thanks for the fix and I can confirm this fixes t=
he issue
reported earlier[1].=20

FWIW:
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10609261/

> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT
> table")
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c    | 1 +
>  include/hw/acpi/acpi-defs.h | 8 ++++++++
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb697c..aa177ba64d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
>          smmu->mapping_count =3D cpu_to_le32(1);
>          smmu->mapping_offset =3D cpu_to_le32(sizeof(*smmu));
>          smmu->base_address =3D cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> +        smmu->flags =3D ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
>          smmu->event_gsiv =3D cpu_to_le32(irq);
>          smmu->pri_gsiv =3D cpu_to_le32(irq + 1);
>          smmu->gerr_gsiv =3D cpu_to_le32(irq + 2);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af8e023968..c3ee1f517b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -628,6 +628,12 @@ struct AcpiIortItsGroup {
>  } QEMU_PACKED;
>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>=20
> +enum {
> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE =3D 1 << 0,
> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   =3D 3 << 1,
> +    ACPI_IORT_SMMU_V3_PXM_VALID       =3D 1 << 3
> +};
> +
>  struct AcpiIortSmmu3 {
>      ACPI_IORT_NODE_HEADER_DEF
>      uint64_t base_address;
> @@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
>      uint32_t pri_gsiv;
>      uint32_t gerr_gsiv;
>      uint32_t sync_gsiv;
> +    uint32_t pxm;
> +    uint32_t id_mapping_index;
>      AcpiIortIdMapping id_mapping_array[0];
>  } QEMU_PACKED;
>  typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> --
> 2.17.2

