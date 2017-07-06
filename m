Received: by 10.25.44.15 with SMTP id s15csp2538738lfs;
        Thu, 6 Jul 2017 14:17:04 -0700 (PDT)
X-Received: by 10.55.101.196 with SMTP id z187mr66441627qkb.164.1499375824756;
        Thu, 06 Jul 2017 14:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499375824; cv=none;
        d=google.com; s=arc-20160816;
        b=k8Ncp552kTwhhgkdTQ9qkZZwmG0y5prQ2f+G8pN4fSrvwvB4Xg5/VqXsMuS3R0lV48
         Hg3UkqAcAOiXFcMDrmoFzPRylD2bVqcKrMOXXriUXXk81Sb6HU394bRX7KCvcafeyq09
         G0iseiDxe01Zamq2h8EASBrgvo6T+kHEqLCsVb1Dg3EEmKhnUBJSPGNwVo2XovR5FqsV
         JAWM8mGKsZetiD+orIVLvR/I1le2YjSMQ0z7diYQTdG4CfKj2VcEqTCPHJA20szluL9U
         G26LfayLPhbhoq4RDk9nFkOhXswMAWj+dZkZ4xJFPXkWbRg9MGr6AFZJZ+fgYWFVAHcv
         THWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=B6bCnSq8BNg+zqONEHAar5EE5briGJskVGsQZNQCC8I=;
        b=PjAelnv+u1T8eBDbehXukSLmvexqgoHS4wOuQZelPhHLQYUwNbZgPisjAdGYW4PlM+
         odlkY0saA/J4dmd0yPFQnaHFDK6ghmt1sePBYD6h4ot0LmX2aEYvv/eoND1zoDHBNUAr
         2umWUgwggxKzhJ4ZxaehaQdSp5Ejxdzj7OuhXwmfAnOSSPsXtH6VoISN+7++1aW+9ffI
         q8qc5pEGNyVku7uHwEnRHHMBUQ89aLLA8U4bSxE6qiK40CLB1/g9kBlHKsZtjQf07ETT
         rZzUetBIHaPIWOaRzob93Oha6SzKrbaIk6oAP41C9YCfXH8twHmITSVaCU/NdB0PxZbA
         SU2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l57si1221720qta.111.2017.07.06.14.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 14:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTE90-0003uf-1T
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 17:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dTE8w-0003uM-DJ
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 17:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dTE8s-0005kY-Id
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 17:16:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dTE8s-0005jQ-8X; Thu, 06 Jul 2017 17:16:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAADB61E53;
	Thu,  6 Jul 2017 21:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EAADB61E53
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EAADB61E53
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF38A5C883;
	Thu,  6 Jul 2017 21:16:42 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
Date: Thu, 6 Jul 2017 23:16:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 06 Jul 2017 21:16:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ry039g+SbZZr

Hi Bharat,

On 06/07/2017 13:24, Bharat Bhushan wrote:
>=20
>=20
>> -----Original Message-----
>> From: Jean-Philippe Brucker [mailto:jean-philippe.brucker@arm.com]
>> Sent: Thursday, July 06, 2017 3:33 PM
>> To: Bharat Bhushan <bharat.bhushan@nxp.com>; Auger Eric
>> <eric.auger@redhat.com>; eric.auger.pro@gmail.com;
>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>> qemu-arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
>> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
>> robin.murphy@arm.com; christoffer.dall@linaro.org
>> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
>>
>> On 05/07/17 09:49, Bharat Bhushan wrote:>>> Also when setup msi-route
>> kvm_irqchip_add_msi_route() we needed to
>>>> provide the translated address.
>>>>> According to my understanding this is required because kernel does
>>>>> no go
>>>> through viommu translation when generating interrupt, no?
>>>>
>>>> yes this is needed when KVM MSI routes are set up, ie. along with GI=
CV3
>> ITS.
>>>> With GICv2M, qemu direct gsi mapping is used and this is not needed.
>>>>
>>>> So I do not understand your previous sentence saying "MSI interrupts
>>>> works without any change".
>>>
>>> I have almost completed vfio integration with virtio-iommu and now
>>> testing the changes by assigning e1000 device to VM. For this I have
>>> changed virtio-iommu driver to use IOMMU_RESV_MSI rather than sw-msi
>>> and this does not need changed in vfio_get_addr()  and
>>> kvm_irqchip_add_msi_route()
>>
>> I understand you're reserving region 0x08000000-0x08100000 as
>> IOMMU_RESV_MSI instead of IOMMU_RESV_SW_MSI? I think this only
>> works because Qemu places the vgic in that area as well (in hw/arm/vir=
t.c).
>> It's not a coincidence if the addresses are the same, because Eric cho=
se them
>> for the Linux SMMU drivers and I copied them.
>>
>> We can't rely on that behavior, though, it will break MSIs in emulated
>> devices. And if Qemu happens to move the MSI doorbell in future machin=
e
>> revisions, then it would also break VFIO.
>=20
> Yes, make sense to me
>=20
>>
>> Just for my own understanding -- what happens, I think, is that in Lin=
ux
>> iova_reserve_iommu_regions initially reserves the guest-physical doorb=
ell
>> 0x08000000-0x08100000. Then much later, when the device driver request=
s
>> an MSI, the irqchip driver calls iommu_dma_map_msi_msg with the guest-
>> physical gicv2m address 0x08020000. The function finds the right page =
in
>> msi_page_list, which was added by cookie_init_hw_msi_region, therefore
>> bypassing the viommu and the GPA gets written in the MSI-X table.
>=20
> This means in case tomorrow when qemu changes virt machine address map =
and vgic-its (its-translator register address) address range does not fal=
l in the msi_page_list then it will allocate a new iova, create mapping i=
n iommu. So this will no longer be identity mapped and fail to work with =
new qemu?
>=20
Yes that's correct.
>>
>> If an emulated device such as virtio-net-pci were to generate an MSI, =
then
>> Qemu would attempt to access the doorbell written by Linux into the MS=
I-X
>> table, 0x08020000, and fault because that address wasn't mapped in the
>> viommu.
>>
>> So for VFIO, you either need to translate the MSI-X entry using the vi=
ommu,
>> or just assume that the vaddr corresponds to the only MSI doorbell
>> accessible by this device (because how can we be certain that the gues=
t
>> already mapped the doorbell before writing the entry?)
>>
>> For ARM machines it's probably best to stick with IOMMU_RESV_SW_MSI.
>> However, a nice way to use IOMMU_RESV_MSI would be for the virtio-
>> iommu device to advertise identity-mapped/reserved regions, and bypass
>> translation on these regions. Then the driver could reserve those with
>> IOMMU_RESV_MSI.
>=20
> Correct me if I did not understood you correctly, today iommu-driver de=
cides msi-reserved region, what if we change this and virtio-iommu device=
 will provide the reserved msi region as per the emulated machine (virt/i=
ntel). So virtio-iommu driver will use the address advertised by virtio-i=
ommu device as IOMMU_RESV_MSI. In this case msi-page-list will always hav=
e the reserved region for MSI.
> On qemu side, for emulated devices we will let virtio-iommu return same=
 address as translated address as it falls in MSI-reserved page already k=
nown to it.

I think what you're proposing here corresponds to the 1st approach that
was followed for PCIe passthrough/MSI on ARM, ie. the userspace was
providing the reserved region base address & size. This was ruled out
and now this region is arbitrarily set by the smmu-driver. At the moment
this means this region cannot contain guest RAM.

>=20
>=20
>> For x86 we will need such a system, with an added IRQ
>> remapping feature.
>=20
> I do not understand x86 MSI interrupt generation, but If above understa=
nd is correct, then why we need IRQ remapping for x86?
To me x86 IR corresponds simply corresponds to the ITS MSI controller
modality on ARM. So as you still need vITS along with virtio-iommu on
ARM, you need vIRQ alongs with virtio-iommu on Intel. Does that make sens=
e?

So in any case we need to make sure the guest uses a vITS or vIR to make
sure MSIs are correctly isolated.


> Will the x86 machine emulated in QEMU provides a big address range for =
MSIs and when actually generating MSI it needed some extra processing (IR=
Q-remapping processing) before actually generating write transaction for =
MSI interrupt ?=20
My understanding is on x86, the MSI window is fixed and matches
[FEE0_0000h =E2=80=93 FEF0_000h]. MSIs are conveyed on a separate address=
 space
than usual DMA accesses. And yes they end up in IR if supported in the HW=
.

Thanks

Eric
>=20
> Thanks
> -Bharat
>=20
>>
>> Thanks,
>> Jean
