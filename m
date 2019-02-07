Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp685606wrt;
        Thu, 7 Feb 2019 07:20:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia7DvossFBRtiXyAodmjO3BgZth5QklsvDft/OzmkonD5RVwXeKJKvutWG7UscXLV595uMh
X-Received: by 2002:a81:3d08:: with SMTP id k8mr13605328ywa.239.1549552807535;
        Thu, 07 Feb 2019 07:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549552807; cv=none;
        d=google.com; s=arc-20160816;
        b=gEjJNcGu+s7xWWgQPHrDMO0iBO1s1y6hvTWOoG04qQuNevzyn5tG4OafxrFxhg7NjX
         n/zXPT2DK4weJ/psB0mccAzcpsbWLYJkjnxhosirydQgFsN05bHMiFoEB8hcR85RPJss
         GzXZ97qhbTzK7d17MEmN/8lfElwIVfHYr6K8OagPG0VWCgYt9N3A5ZkTHJsfzW8uCVcW
         72j/IVsXMiW/i4xPMVQvTxSPrHbtS/ufredx2wdAz+JiukRaVyJjZJTDDkkkJcM7qbEO
         8Fdb4OrvDpl1lJbLwXeFj8GgyD8MGfih02iAm3NNnRxPR7WwebXl1IKMhtPU6Zvffe9t
         jrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=B1kqJA8qEks8AL0uS9qWbz9cyK4ezIfUAR58H1dvxTw=;
        b=CGNx4soRcrZN6Z+1xRF670BEtvxkoV2ewX/ibYSVRh/UyTe39f0Sne2ejZ7mNH7ftK
         YsWhmQzNAKM6VTrL3PJaqYdVDetn4cWdZ61fs4gC5/vJWGxKfDDfZEVB5w1ssC1iwAny
         b7PmLHMXP/OI8yobYz/GCa2wCFs3CO+STRVY2Oy0pscSvzz2u+GglET8C8zxbwt+oxN3
         Ccy/Ey7mWEdkLzeWrWhqr30e/sgC9Vk2XGoxgqaZRj6KapfhRr2dwrflBSY1am0rHSjE
         pDxBI3QDBBH+Lo9XtIcteJNGer2oNSH+7yyNb6yyWTYZIQ5HOPduEIMU4LpxPZo9babA
         NYjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l63si5739854ywf.24.2019.02.07.07.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 07:20:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grlTC-0001P0-V5
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 10:20:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1grlSj-0001E0-KW
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:19:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1grlSh-0008B6-Tr
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:19:37 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45341 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1grlSh-00084x-0J; Thu, 07 Feb 2019 10:19:35 -0500
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 3100B5F02409490532F9;
	Thu,  7 Feb 2019 15:19:23 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.78]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Thu, 7 Feb 2019 15:19:22 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"david@redhat.com" <david@redhat.com>
Thread-Topic: [PATCH v6 10/18] hw/arm/virt: Bump the 255GB initial RAM limit
Thread-Index: AQHUvXkPQHCJIE5V1E6tNAGmFUarxKXUdR/g
Date: Thu, 7 Feb 2019 15:19:22 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392B2D8D@lhreml524-mbs.china.huawei.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-11-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-11-eric.auger@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v6 10/18] hw/arm/virt: Bump the 255GB initial
 RAM limit
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
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q7XsAJAapc/Y

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: 05 February 2019 17:33
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> imammedo@redhat.com; david@redhat.com
> Cc: dgilbert@redhat.com; david@gibson.dropbear.id.au; drjones@redhat.com
> Subject: [PATCH v6 10/18] hw/arm/virt: Bump the 255GB initial RAM limit
>=20
> Now we have the extended memory map (high IO regions beyond the
> scalable RAM) and dynamic IPA range support at KVM/ARM level
> we can bump the legacy 255GB initial RAM limit. The actual maximum
> RAM size now depends on the physical CPU and host kernel.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b90ffc2e5d..f01886da22 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -93,22 +93,9 @@
>=20
>  #define PLATFORM_BUS_NUM_IRQS 64
>=20
> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
> - * address space unallocated and free for future use between 256G and 51=
2G.
> - * If we need to provide more RAM to VMs in the future then we need to:
> - *  * allocate a second bank of RAM starting at 2TB and working up
> - *  * fix the DT and ACPI table generation code in QEMU to correctly
> - *    report two split lumps of RAM to the guest
> - *  * fix KVM in the host kernel to allow guests with >40 bit address sp=
aces
> - * (We don't want to fill all the way up to 512GB with RAM because
> - * we might want it for non-RAM purposes later. Conversely it seems
> - * reasonable to assume that anybody configuring a VM with a quarter
> - * of a terabyte of RAM will be doing it on a host with more than a
> - * terabyte of physical address space.)
> - */
> -#define RAMLIMIT_GB 255
> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> +/* Legacy RAM limit in GB (< version 4.0) */
> +#define LEGACY_RAMLIMIT_GB 255
> +#define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
>=20
>  /* Addresses and sizes of our components.
>   * 0..128MB is space for a flash device so we can run bootrom code such =
as
> UEFI.
> @@ -149,7 +136,7 @@ static const MemMapEntry a15memmap[] =3D {
>      [VIRT_PCIE_MMIO] =3D          { 0x10000000, 0x2eff0000 },
>      [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
> -    [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
> +    [VIRT_MEM] =3D                { 0x40000000,
> LEGACY_RAMLIMIT_BYTES },
>  };
>=20
>  /*
> @@ -1483,8 +1470,9 @@ static void machvirt_init(MachineState *machine)
>=20
>      vms->smp_cpus =3D smp_cpus;
>=20
> -    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
> -        error_report("mach-virt: cannot model more than %dGB RAM",
> RAMLIMIT_GB);
> +    if (!vms->extended_memmap && machine->ram_size >
> LEGACY_RAMLIMIT_GB) {

Just hit this while testing, should this check be against LEGACY_RAMLIMIT_B=
YTES?

Thanks,
Shameer

> +        error_report("mach-virt: cannot model more than %dGB RAM",
> +                     LEGACY_RAMLIMIT_GB);
>          exit(1);
>      }
>=20
> --
> 2.20.1

