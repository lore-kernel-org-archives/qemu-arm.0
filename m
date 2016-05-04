Received: by 10.25.208.137 with SMTP id h131csp97253lfg;
        Wed, 4 May 2016 04:22:41 -0700 (PDT)
X-Received: by 10.28.161.198 with SMTP id k189mr30644510wme.23.1462360961521;
        Wed, 04 May 2016 04:22:41 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n125si4532925wmn.11.2016.05.04.04.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 04:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axusq-0007Gg-3v
	for alex.bennee@linaro.org; Wed, 04 May 2016 07:22:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yehuday@marvell.com>) id 1axusH-0006WK-AA
	for qemu-devel@nongnu.org; Wed, 04 May 2016 07:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yehuday@marvell.com>) id 1axus5-00088g-4E
	for qemu-devel@nongnu.org; Wed, 04 May 2016 07:21:43 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:33238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yehuday@marvell.com>)
	id 1axus4-000830-Sc; Wed, 04 May 2016 07:21:37 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u44BIwJh022897; Wed, 4 May 2016 04:21:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com with ESMTP id 22q4h9a575-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 04 May 2016 04:21:10 -0700
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.16/8.16.0.16) with SMTP id u44BL7QQ024196;
	Wed, 4 May 2016 04:21:10 -0700
Received: from il-exch02.marvell.com ([199.203.130.102])
	by mx0a-0016f401.pphosted.com with ESMTP id 22q4h9a54g-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 04 May 2016 04:21:10 -0700
Received: from IL-EXCH02.marvell.com (10.4.102.221) by IL-EXCH02.marvell.com
	(10.4.102.221) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Wed, 4 May 2016 14:18:42 +0300
Received: from IL-EXCH02.marvell.com ([fe80::7dee:c960:1ac6:8c1f]) by
	IL-EXCH02.marvell.com ([fe80::7dee:c960:1ac6:8c1f%20]) with mapi id
	15.00.1104.000; Wed, 4 May 2016 14:18:42 +0300
From: Yehuda Yitschak <yehuday@marvell.com>
To: Eric Auger <eric.auger@linaro.org>, "eric.auger@st.com"
	<eric.auger@st.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "pranav.sawargaonkar@gmail.com"
	<pranav.sawargaonkar@gmail.com>,
	"p.fedin@samsung.com" <p.fedin@samsung.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"agraf@suse.de" <agraf@suse.de>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] KVM PCI/MSI passthrough with mach-virt
Thread-Index: AQHRWrW6YV+ov3MARUqg3pYSJkKp/J+pN/LQ
Date: Wed, 4 May 2016 11:18:42 +0000
Message-ID: <a5c6ff64efee40dfb6b31ffd0b0a4238@IL-EXCH02.marvell.com>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.4.102.210]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-04_05:, , signatures=0
X-Proofpoint-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1603290000
	definitions=main-1605040171
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
Subject: Re: [Qemu-devel] [RFC v2 0/8] KVM PCI/MSI passthrough with mach-virt
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
Cc: "Bharat.Bhushan@freescale.com" <Bharat.Bhushan@freescale.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9fhlbWU2D0c


Tested-by: Yehuda Yitschak <yehuday@marvell.com>

Tested on Armada-7040 using an intel IXGBE (82599ES).=20


> -----Original Message-----
> From: qemu-devel-bounces+yehuday=3Dmarvell.com@nongnu.org
> [mailto:qemu-devel-bounces+yehuday=3Dmarvell.com@nongnu.org] On
> Behalf Of Eric Auger
> Sent: Friday, January 29, 2016 18:54
> To: eric.auger@st.com; eric.auger@linaro.org; qemu-devel@nongnu.org;
> qemu-arm@nongnu.org; peter.maydell@linaro.org;
> alex.williamson@redhat.com; pranav.sawargaonkar@gmail.com;
> p.fedin@samsung.com; pbonzini@redhat.com; agraf@suse.de
> Cc: Bharat.Bhushan@freescale.com; suravee.suthikulpanit@amd.com;
> christoffer.dall@linaro.org
> Subject: [Qemu-devel] [RFC v2 0/8] KVM PCI/MSI passthrough with mach-
> virt
>=20
> This series enables KVM PCI/MSI passthrough with mach-virt.
>=20
> A new memory region type is introduced (reserved iova). On
> vfio_listener_region_add this IOVA region is registered to the kernel wit=
h
> VFIO_IOMMU_MAP_DMA (using the new
> VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA flag).
>=20
> The host VFIO PCI driver then can use this IOVA window to map some host
> physical addresses, accessed by passthrough'ed PCI devices, through the
> IOMMU.
> The first goal is to map host MSI controller frames (GICv2M,
> GITS_TRANSLATER).
>=20
> mach-virt currently instantiates a 16x64kB reserved IOVA window. This
> provisions for future usage. Most probably this exceeds MSI binding needs=
.
> To avoid wasting guest PA, we now map the reserved region onto the
> platform bus MMIO.
>=20
> The series includes Pranav/Tushar' series:
> QEMU, [v2 0/2] Generic PCIe host bridge INTx determination for INTx routi=
ng
> ((https://lists.nongnu.org/archive/html/qemu-devel/2015-
> 04/msg04361.html))
>=20
> Those patches are not mandated for PCI/MSI passthrough to work but
> without those, the following warning is observed and can puzzle the end-
> user:
> "qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-
> pcihost)"
>=20
> Best Regards
>=20
> Eric
>=20
> Dependencies:
> The series depends on kernel series: "[PATCH 00/10] KVM PCIe/MSI
> passthrough on ARM/ARM64", (https://lkml.org/lkml/2016/1/26/371)
>=20
> Git:
> QEMU:
> https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.=
5.
> 0-pci-passthrough-rfc-v2
>=20
> Kernel:
> https://git.linaro.org/people/eric.auger/linux.git/shortlog/refs/heads/v4=
.5-
> rc1-pcie-passthrough-v1
>=20
> Testing:
> - on ARM64 AMD Overdrive HW with one e1000e PCIe card.
>=20
> History:
> RFC v1 -> RFC v2:
> - now uses platform bus MMIO for mapping reserved IOVA region; hence
> the
>   new patch file:
>   "hw: platform-bus: enable to map any memory region onto the platform-
> bus"
>=20
> Eric Auger (8):
>   linux-headers: partial update for VFIO reserved IOVA registration
>   Add a function to determine interrupt number for INTx routing
>   Generic PCIe host bridge INTx determination for INTx routing
>   hw: vfio: common: introduce vfio_register_reserved_iova
>   memory: add reserved_iova region type
>   hw: platform-bus: enable to map any memory region onto the
>     platform-bus
>   hw: arm: virt: register reserved IOVA region
>   hw: vfio: common: adapt vfio_listeners for reserved_iova region
>=20
>  hw/arm/virt.c              | 23 ++++++++++++----
>  hw/core/platform-bus.c     | 26 +++++++++++-------
>  hw/pci-host/gpex.c         | 12 ++++++++
>  hw/vfio/common.c           | 68
> ++++++++++++++++++++++++++++++++++++----------
>  include/exec/memory.h      | 29 ++++++++++++++++++++
>  include/hw/pci-host/gpex.h |  1 +
>  include/hw/platform-bus.h  |  7 +++++
>  linux-headers/linux/vfio.h | 15 ++++++++--
>  memory.c                   | 11 ++++++++
>  9 files changed, 160 insertions(+), 32 deletions(-)
>=20
> --
> 1.9.1
>=20

