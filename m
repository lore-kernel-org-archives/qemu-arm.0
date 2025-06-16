Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1786759njc;
        Mon, 16 Jun 2025 04:27:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTkvmU5AR0wQWeEgO5HNaP+7fARoqvTUirTXSv87dWyI1fsU/J6A9vVsaOMUI0LH03AEVAMGc3L8PnUw==@linaro.org
X-Google-Smtp-Source: AGHT+IHNtiY5H6yR3gIC6YJ99MbMrYIWq2Ql9ANXWVEnSKmqtxxjY8D6rr+gcoshSwMGok6Va32e
X-Received: by 2002:a05:620a:bd5:b0:7d0:ab76:8e2d with SMTP id af79cd13be357-7d3c6d02ce7mr1422500785a.51.1750073228935;
        Mon, 16 Jun 2025 04:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750073228; cv=none;
        d=google.com; s=arc-20240605;
        b=I6ik7doK9TPd7YDdMPD6Mpl8gvfv58jUts2dggz93nR3L1poD6gRv8PrOH5fajnkTH
         7TgSGLvCpB7RDgzELIhAMwo/RQIYHkyYWTBdwbyuKtMKjzQ2pniQWDVmRPPrC7CNDVyY
         tWc773cmsDgrhHNT7C2SrApX/1Bq2SoMUe7eQSPd51v090t5fpRPp/LANP5uF4uPkEbq
         ek1xdFDJzIQe7HSFDsNEopdzgTi03Eh4ZM+f2RNdGac7FmPJICkOxcBJKcDa7GZ0UUh6
         X1nS8cZ4dqen0bx8DBWTy86outj0snXXgXuyW33Bk2ngqy5TfhIAAzWra9khDBR8eHkz
         MgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=5Zk/wwuLcRzKJPbyV+030KVrblntggf9bUPrKhLgl9c=;
        fh=M+FVb7brxN1+lXD0/JCk6BEPvLdfCowl9TrFyc8YJkQ=;
        b=YGh2E2avrzl0KuAn6DCWqLon/icMVJwYboT20x6vDJexSQEdw8FtrHgJ9jQPoPFOvp
         v/KyQDY4VDvliD4rOVCJr+dzEzPjXI5XV+S61PYwIJFc7F2lWaCpgBnxQOO+hnEhSXXY
         fdVRLDHJ0/me0lkc6GVhjbAXVCQupP5KrU8u6h5/FirAcM+8XObR3JqN+TnbS+HwiXv1
         +yZbsYrp5PNVIVSGC+bbcnwGAg5ofwicXlFor79MjSynNI0xof2kJwHYFldbickfqfRU
         jigrask1U43hs45RJkaa6OAL5j0pOKRWWVSZSLlcDONwKJ6hU+ZmG1DDl1SKI3TERAqq
         W0qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ee3e62si959548585a.390.2025.06.16.04.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 04:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR7zG-0008DV-3r; Mon, 16 Jun 2025 07:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR7zE-0008D3-Vg; Mon, 16 Jun 2025 07:26:48 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR7zC-0005rd-Vj; Mon, 16 Jun 2025 07:26:48 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLSMS2sz7z6L5Nt;
 Mon, 16 Jun 2025 19:24:36 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id 79232140157;
 Mon, 16 Jun 2025 19:26:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 13:26:42 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 16 Jun 2025 13:26:42 +0200
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Linuxarm
 <linuxarm@huawei.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, "Wangzhou
 (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v4 5/7] hw/arm/virt: Add an SMMU_IO_LEN macro
Thread-Topic: [PATCH v4 5/7] hw/arm/virt: Add an SMMU_IO_LEN macro
Thread-Index: AQHb3HJKBKJjlZ2qAUSTWYf2oX1kIrQFgcmAgAAn6KA=
Date: Mon, 16 Jun 2025 11:26:42 +0000
Message-ID: <b126700ed2374bdb8c436ce3671425d0@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-6-shameerali.kolothum.thodi@huawei.com>
 <20250616120209.00004015@huawei.com>
In-Reply-To: <20250616120209.00004015@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YNXS6tgwWpWk



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, June 16, 2025 12:02 PM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v4 5/7] hw/arm/virt: Add an SMMU_IO_LEN macro
>=20
> On Fri, 13 Jun 2025 15:44:47 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > From: Nicolin Chen <nicolinc@nvidia.com>
> >
> > This is useful as the subsequent support for new SMMUv3 dev will also
> > use the same.
> >
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > Reviewed-by: Donald Dutile <ddutile@redhat.com>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Tested-by: Nathan Chen <nathanc@nvidia.com>
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/virt.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 71b923f786..eeace4754d 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -146,6 +146,9 @@ static void arm_virt_compat_set(MachineClass
> *mc)
> >  #define LEGACY_RAMLIMIT_GB 255
> >  #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
> >
> > +/* MMIO region size for SMMUv3 */
> > +#define SMMU_IO_LEN 0x20000
> > +
> >  /* Addresses and sizes of our components.
> >   * 0..128MB is space for a flash device so we can run bootrom code suc=
h
> as UEFI.
> >   * 128MB..256MB is used for miscellaneous device I/O.
> > @@ -177,7 +180,7 @@ static const MemMapEntry base_memmap[] =3D {
> >      [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
> >      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
> >      [VIRT_UART1] =3D              { 0x09040000, 0x00001000 },
> > -    [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
> > +    [VIRT_SMMU] =3D               { 0x09050000, SMMU_IO_LEN },
>=20
> This bit is fine.
>=20
> >      [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, MEMORY_HOTPLUG_IO_LEN
> },
> >      [VIRT_ACPI_GED] =3D           { 0x09080000, ACPI_GED_EVT_SEL_LEN }=
,
> >      [VIRT_NVDIMM_ACPI] =3D        { 0x09090000, NVDIMM_ACPI_IO_LEN},
> > @@ -1447,7 +1450,6 @@ static void create_smmu(const
> VirtMachineState *vms,
> >      int irq =3D  vms->irqmap[VIRT_SMMU];
> >      int i;
> >      hwaddr base =3D vms->memmap[VIRT_SMMU].base;
> > -    hwaddr size =3D vms->memmap[VIRT_SMMU].size;
> >      DeviceState *dev;
> >
> >      if (vms->iommu !=3D VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
> > @@ -1467,7 +1469,7 @@ static void create_smmu(const
> VirtMachineState *vms,
> >          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> >                             qdev_get_gpio_in(vms->gic, irq + i));
> >      }
> > -    create_smmuv3_dt_bindings(vms, base, size, irq);
> > +    create_smmuv3_dt_bindings(vms, base, SMMU_IO_LEN, irq);
>=20
> This seems a little odd.  I guess it may make sense later, but for all ot=
her
> cases we only use the macros to define the base_memmap.
>=20
> Perhaps delay this change until it is more obvious why?

Right, looking at this patch now, I think it is not necessary at the moment
to introduce this macro now. I will take another look and discard this
if it doesn't make sense.

Thanks,
Shameer
