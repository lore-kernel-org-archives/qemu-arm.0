Received: by 10.223.188.70 with SMTP id a6csp5101490wrh;
        Tue, 22 Aug 2017 08:42:40 -0700 (PDT)
X-Received: by 10.55.93.67 with SMTP id r64mr1546856qkb.194.1503416560141;
        Tue, 22 Aug 2017 08:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416560; cv=none;
        d=google.com; s=arc-20160816;
        b=Shwd9v38/qET6ZXXw2UC7VYCMy0Rwe/vfneKlFxz1O103k5n6J+FZ+LDFvJp6FUN/t
         eXzlUSJVzYsp0eR+dEhHG6PLuAS7Oi/iR6dC6WMXI3l2eueZPa7ndkl5AbsruYI5nrzW
         lhHo0Kg9PVGFBu1mTNpF5fcWNiyCDZUDe3eMEN4s8cVJ3FeAON6IljxNXKvc4usDZzyh
         FEY/vj7YpJLUWZSnj/V7K1LHZf2nLf5wUIIh3up7HzVWRlAsg8ii8gKx7FAdaNdI/EXl
         nfRaqZ58GDVlQiV18nJX0rQmYBtTz2mSLz+7/EBucuhM73wFeiNpdve3/r/sPMn6xQts
         gydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=Cv7+ceP0hVICxIKgWZXjbYu1zFvBwMeajt0vbkEW2uA=;
        b=mRMPEFZ6CTI/kbfv+j5Roq3YmzmBtY5vchvqXZpyNZcPGe67Y1FJKGmiFJfvQ2HiFa
         xxqUNqf/KUHAyqBC/tubvyT3ngfFHrAcgRB7/Zw7ijSXjlvY+vrfcZuL2QJlcqqRFIEo
         Rvhb+/WQB1x6FFsrFhY4SrjNYzTYM5e4knM7uDtmCDRWEQYUWFP8EWCooDJJVTky8N1m
         TYeztqNBCZ15B3rP67RMpnMay6BQiH124lwBxCe5yt2B0CpiFcfTKbEj6pTdq9EN2kGm
         Uaq6RYlEwfELgg0EZfm9oo2EJ5c4W617pA5tPyV0hhUOC3r//tDcz7/+W779ZYLhY/nV
         uZcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector1 header.b=VbTPHz5v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si5740106qte.153.2017.08.22.08.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector1 header.b=VbTPHz5v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:55553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBK9-00038W-Gd
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:42:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dkAsb-0002kq-7m
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:14:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dkAsW-0000JP-7Q
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:14:09 -0400
Received: from mail-he1eur01on0059.outbound.protection.outlook.com
	([104.47.0.59]:58592
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dkAsV-0000GN-Gr; Tue, 22 Aug 2017 11:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Cv7+ceP0hVICxIKgWZXjbYu1zFvBwMeajt0vbkEW2uA=;
	b=VbTPHz5vA9CyfClAc5bbpEH+nCaI94W8zCKTgO5IHOR7OkZR55lBmpJpnl53Fw6QF6jy34mfVpJZIPMA012Wjh3Xr2+uNB0FGorHidzvhMpHoYYGkXONgJ5G1Dj4j3qSVqJMZ1l/AN5xdW/B/MsO1Rksk+B6C/+8yspKmNiSAjc=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB1412.eurprd04.prod.outlook.com (10.163.185.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1362.18; Tue, 22 Aug 2017 15:13:58 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::414d:bebc:b19d:3f35]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::414d:bebc:b19d:3f35%13]) with mapi id 15.01.1362.019;
	Tue, 22 Aug 2017 15:13:57 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the virt machine
	to be used as device ID
Thread-Index: AQHS07WQhQaf1stp7kus9qldhP1WKg==
Date: Tue, 22 Aug 2017 15:13:57 +0000
Message-ID: <AM3PR04MB0616C6B8D91F8C86BA086FF0FF840@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
	<b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
	<20170731151602.GU4859@toto>
	<AM3PR04MB0616508E7E868475F181AC18FF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170811155027.GO4859@toto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB1412;
	6:Y/+QIemQDERexlI5rePS7s8lIDNEXnhfan/RebBiyNkAIUopPZHdRrwL84eM9viLX4q8YJgpAGKub+tKHpazOkRvh8jnizxXCjGL+hTfQuMQ7HyNIlNr40le68suoJV1kcjpl3PbRY5HBKAKcprmE0OvrQImUNhgQVGYJEho8m+wvq7f4VryhQ3CGXYfI1NRusXx1pPZ7JpYFz/jPyC1bVRj2bMq57MXWtEQ0vp4JK9Buboc747hDR/D6OYOv5YL3P5Jh+xDSIibj03dbn/JcEyUmvuCWj/ROEpBy4APCMNkqySrOMV5znmWj7DbXJmwKYESs7bBEpYNVkE28FmiOA==;
	5:RxEDY4GAiJZ5NzZd7VrmVpbZFPON6O1GbzTJHO95RNRz1vMUDQhXTRSOoQxfmoI4ZgTVh61OcT8pEXGnJTxAwZVOz3ru24U8V3vb6NjzpzXKzm8MEID/RXIuXiEsxn4hcbftjkx8oRmNUdrNeQ9NtQ==;
	24:tnZQ0XYXmlrXYoJ5G5uBOC8ClKb++O7cgqp7vodVsma6/s4fV8jZ1z3g4n0C1lxY2d7s/eXPcUCjqNv0xpidHkRg4gX6EbGB2D1Vxc1ZIjY=;
	7:C8kr49jDuHtQui32969rGxOUvi/7oLOQjMIgbSu6kQ687LoAxgc79z8iptoa47JqWXjK9xorjS0rFWOeHXSuxLXCM0206JdBwfyz93M0qa02pwVNbDfiq9gSLNZKJB0/fbJaTVM/cij2nJApxgUA89IhyUUGD7u0rnUtVwSU1VPn1c2Pr+DaqEp3sYLtnqYAPQry3QIqRVR8yg8vFfyK2b73YRJuWu8talXaVCZ525o=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(189002)(51444003)(199003)(377454003)(24454002)(3846002)(105586002)(106356001)(68736007)(102836003)(53546010)(66066001)(25786009)(14454004)(97736004)(86362001)(966005)(4326008)(6246003)(93886005)(33656002)(3660700001)(478600001)(6116002)(6306002)(9686003)(575784001)(99286003)(53936002)(53946003)(110136004)(39060400002)(54906002)(55016002)(189998001)(229853002)(8676002)(8936002)(81156014)(6916009)(81166006)(305945005)(50986999)(74316002)(76176999)(54356999)(7696004)(5660300001)(3280700002)(101416001)(2906002)(6436002)(5250100002)(2900100001)(551934003)(6506006)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB1412;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 647c038d-a319-46e4-eaf5-08d4e9706965
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603170)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB1412; 
x-ms-traffictypediagnostic: AM3PR04MB1412:
x-exchange-antispam-report-test: UriScan:(166708455590820)(185117386973197);
x-microsoft-antispam-prvs: <AM3PR04MB14121FC7B7CC088445732183FF840@AM3PR04MB1412.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123555025)(20161123558100)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR04MB1412; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR04MB1412; 
x-forefront-prvs: 04073E895A
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2017 15:13:57.8103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB1412
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.59
Subject: Re: [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the virt machine
 to be used as device ID
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
Cc: "mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPB9BJGhHLI0

On 08/11/2017 06:50 PM, Edgar E. Iglesias wrote:=0A=
> On Fri, Aug 11, 2017 at 02:35:28PM +0000, Diana Madalina Craciun wrote:=
=0A=
>> Hi Edgar,=0A=
>>=0A=
>> On 07/31/2017 06:16 PM, Edgar E. Iglesias wrote:=0A=
>>> On Wed, Jul 26, 2017 at 02:22:28PM +0200, Auger Eric wrote:=0A=
>>>> Hi Diana,=0A=
>>>> On 23/05/2017 13:12, Diana Craciun wrote:=0A=
>>>>> Device IDs are required by the ARM GICv3 ITS for IRQ remapping.=0A=
>>>>> Currently, for PCI devices, the requester ID was used as device=0A=
>>>>> ID in the virt machine. If the system has multiple masters that=0A=
>>>> if the system has multiple root complex?=0A=
>>>>> use MSIs a unique ID accross the platform is needed.=0A=
>>>> across=0A=
>>>>> A static scheme is used and each master is allocated a range of IDs=
=0A=
>>>>> with the formula:=0A=
>>>>> DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as=
=0A=
>>>>> recommended by SBSA).=0A=
>>>>>=0A=
>>>>> This ID will be configured in the machine creation and if not configu=
red=0A=
>>>>> the PCI requester ID will be used insteead.=0A=
>>>> instead=0A=
>>>>> Signed-off-by: Diana Craciun <diana.craciun@nxp.com>=0A=
>>>>> ---=0A=
>>>>>  hw/arm/virt.c              | 26 ++++++++++++++++++++++++++=0A=
>>>>>  hw/pci-host/gpex.c         |  6 ++++++=0A=
>>>>>  hw/pci/msi.c               |  2 +-=0A=
>>>>>  hw/pci/pci.c               | 25 +++++++++++++++++++++++++=0A=
>>>>>  include/hw/arm/virt.h      |  1 +=0A=
>>>>>  include/hw/pci-host/gpex.h |  2 ++=0A=
>>>>>  include/hw/pci/pci.h       |  8 ++++++++=0A=
>>>>>  kvm-all.c                  |  4 ++--=0A=
>>>>>  8 files changed, 71 insertions(+), 3 deletions(-)=0A=
>>>>>=0A=
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c=0A=
>>>>> index 5f62a03..a969694 100644=0A=
>>>>> --- a/hw/arm/virt.c=0A=
>>>>> +++ b/hw/arm/virt.c=0A=
>>>>> @@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_pa=
rams;=0A=
>>>>>  #define RAMLIMIT_GB 255=0A=
>>>>>  #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)=0A=
>>>>>  =0A=
>>>>> +#define STREAM_ID_RANGE_SIZE 0x10000=0A=
>>>>> +=0A=
>>>>>  /* Addresses and sizes of our components.=0A=
>>>>>   * 0..128MB is space for a flash device so we can run bootrom code s=
uch as UEFI.=0A=
>>>>>   * 128MB..256MB is used for miscellaneous device I/O.=0A=
>>>>> @@ -162,6 +164,22 @@ static const int a15irqmap[] =3D {=0A=
>>>>>      [VIRT_PLATFORM_BUS] =3D 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQ=
S -1 */=0A=
>>>>>  };=0A=
>>>>>  =0A=
>>>>> +/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. C=
urrently=0A=
>>>>> + * for PCI devices the requester ID was used as device ID. But if th=
e system has=0A=
>>>>> + * multiple masters that use MSIs, the requester ID may cause device=
ID clashes.=0A=
>>>>> + * So a unique number is  needed accross the system.=0A=
>>>>> + * We are using the following formula:=0A=
>>>>> + * DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000*Constant=
=0A=
>>>>> + * (as recommanded by SBSA). Currently we do not have an SMMU emulat=
ion, but the=0A=
>>>>> + * same formula can be used for the generation of the streamID as we=
ll.=0A=
>>>>> + * For each master the device ID will be derrived from the requester=
 ID using=0A=
>>>>> + * the abovemntione formula.=0A=
>>>>> + */=0A=
>>>> I think most of this comment should only be in the commit message. typ=
os=0A=
>>>> in derived and above mentioned.=0A=
>>>>=0A=
>>>> stream id is the terminology for the id space at the input of the smmu=
.=0A=
>>>> device id is the terminology for the id space at the input of the msi=
=0A=
>>>> controller I think.=0A=
>>>>=0A=
>>>> RID -> deviceID (no IOMMU)=0A=
>>>> RID -> streamID -> deviceID (IOMMU)=0A=
>>>>=0A=
>>>> I would personally get rid of all streamid uses as the smmu is not yet=
=0A=
>>>> supported and stick to the=0A=
>>>> Documentation/devicetree/bindings/pci/pci-msi.txt terminology?=0A=
>>>>=0A=
>>>>> +=0A=
>>>>> +static const uint32_t streamidmap[] =3D {=0A=
>>>>> +    [VIRT_PCIE] =3D 0,         /* currently only one PCI controller =
*/=0A=
>>>>> +};=0A=
>>>>> +=0A=
>>>>>  static const char *valid_cpus[] =3D {=0A=
>>>>>      "cortex-a15",=0A=
>>>>>      "cortex-a53",=0A=
>>>>> @@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *v=
ms, qemu_irq *pic)=0A=
>>>>>      hwaddr base_ecam =3D vms->memmap[VIRT_PCIE_ECAM].base;=0A=
>>>>>      hwaddr size_ecam =3D vms->memmap[VIRT_PCIE_ECAM].size;=0A=
>>>>>      hwaddr base =3D base_mmio;=0A=
>>>>> +    uint32_t stream_id =3D vms->streamidmap[VIRT_PCIE] * STREAM_ID_R=
ANGE_SIZE;=0A=
>>>> msi-base?=0A=
>>>> STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?=0A=
>>>>>      int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;=0A=
>>>>>      int irq =3D vms->irqmap[VIRT_PCIE];=0A=
>>>>>      MemoryRegion *mmio_alias;=0A=
>>>>> @@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *=
vms, qemu_irq *pic)=0A=
>>>>>      PCIHostState *pci;=0A=
>>>>>  =0A=
>>>>>      dev =3D qdev_create(NULL, TYPE_GPEX_HOST);=0A=
>>>>> +    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);=0A=
>>>>>      qdev_init_nofail(dev);=0A=
>>>>>  =0A=
>>>>>      /* Map only the first size_ecam bytes of ECAM space */=0A=
>>>>> @@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState=
 *vms, qemu_irq *pic)=0A=
>>>>>      if (vms->msi_phandle) {=0A=
>>>>>          qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",=0A=
>>>>>                                 vms->msi_phandle);=0A=
>>>>> +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",=
=0A=
>>>>> +                                     1, 0,=0A=
>>>>> +                                     1, vms->msi_phandle,=0A=
>>>>> +                                     1, stream_id,=0A=
>>>>> +                                     1, STREAM_ID_RANGE_SIZE);=0A=
>>>>>      }=0A=
>>>>>  =0A=
>>>>>      qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",=0A=
>>>>> @@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)=
=0A=
>>>>>  =0A=
>>>>>      vms->memmap =3D a15memmap;=0A=
>>>>>      vms->irqmap =3D a15irqmap;=0A=
>>>>> +    vms->streamidmap =3D streamidmap;=0A=
>>>>>  }=0A=
>>>>>  =0A=
>>>>>  static void virt_machine_2_9_options(MachineClass *mc)=0A=
>>>>> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c=0A=
>>>>> index 66055ee..de72408 100644=0A=
>>>>> --- a/hw/pci-host/gpex.c=0A=
>>>>> +++ b/hw/pci-host/gpex.c=0A=
>>>>> @@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num=
, int level)=0A=
>>>>>      qemu_set_irq(s->irq[irq_num], level);=0A=
>>>>>  }=0A=
>>>>>  =0A=
>>>>> +static Property gpex_props[] =3D {=0A=
>>>>> +    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0=
),=0A=
>>>> msi_base_base=0A=
>>>>> +    DEFINE_PROP_END_OF_LIST(),=0A=
>>>>> +};=0A=
>>>>> +=0A=
>>>>>  static void gpex_host_realize(DeviceState *dev, Error **errp)=0A=
>>>>>  {=0A=
>>>>>      PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);=0A=
>>>>> @@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass=
, void *data)=0A=
>>>>>  =0A=
>>>>>      hc->root_bus_path =3D gpex_host_root_bus_path;=0A=
>>>>>      dc->realize =3D gpex_host_realize;=0A=
>>>>> +    dc->props =3D gpex_props;=0A=
>>>>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);=0A=
>>>>>      dc->fw_name =3D "pci";=0A=
>>>>>  }=0A=
>>>>> diff --git a/hw/pci/msi.c b/hw/pci/msi.c=0A=
>>>>> index 7925851..b60a410 100644=0A=
>>>>> --- a/hw/pci/msi.c=0A=
>>>>> +++ b/hw/pci/msi.c=0A=
>>>>> @@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage =
msg)=0A=
>>>>>  {=0A=
>>>>>      MemTxAttrs attrs =3D {};=0A=
>>>>>  =0A=
>>>>> -    attrs.stream_id =3D pci_requester_id(dev);=0A=
>>>>> +    attrs.stream_id =3D pci_stream_id(dev);=0A=
>>>>>      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,=
=0A=
>>>>>                           attrs, NULL);=0A=
>>>>>  }=0A=
>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c=0A=
>>>>> index 259483b..92e9a2b 100644=0A=
>>>>> --- a/hw/pci/pci.c=0A=
>>>>> +++ b/hw/pci/pci.c=0A=
>>>>> @@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)=0A=
>>>>>      return pci_req_id_cache_extract(&dev->requester_id_cache);=0A=
>>>>>  }=0A=
>>>>>  =0A=
>>>>> +static uint32_t pci_get_stream_id_base(PCIDevice *dev)=0A=
>>>>> +{=0A=
>>>>> +    PCIBus *rootbus =3D pci_device_root_bus(dev);=0A=
>>>>> +    PCIHostState *host_bridge =3D PCI_HOST_BRIDGE(rootbus->qbus.pare=
nt);=0A=
>>>>> +    Error *err =3D NULL;=0A=
>>>>> +    int64_t stream_id;=0A=
>>>>> +=0A=
>>>>> +    stream_id =3D object_property_get_int(OBJECT(host_bridge), "stre=
am-id-base",=0A=
>>>>> +                                        &err);=0A=
>>>>> +    if (stream_id < 0) {=0A=
>>>>> +        stream_id =3D 0;=0A=
>>>>> +    }=0A=
>>>>> +=0A=
>>>>> +    return stream_id;=0A=
>>>>> +}=0A=
>>>>> +=0A=
>>>>> +uint32_t pci_stream_id(PCIDevice *dev)=0A=
>>>>> +{=0A=
>>>>> +    /* Stream ID =3D RequesterID[15:0] + stream_id_base. stream_id_b=
ase may=0A=
>>>>> +     * be 0 for devices that are not using any translation between r=
equester_id=0A=
>>>>> +     * and stream_id */=0A=
>>>>> +    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base;=
=0A=
>>>>> +}=0A=
>>>> I think you should split the changes in virt from pci/gpex generic cha=
nges.=0A=
>>>>=0A=
>>>>> +=0A=
>>>>>  /* -1 for devfn means auto assign */=0A=
>>>>>  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus =
*bus,=0A=
>>>>>                                           const char *name, int devfn=
,=0A=
>>>>> @@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCIDev=
ice *pci_dev, PCIBus *bus,=0A=
>>>>>  =0A=
>>>>>      pci_dev->devfn =3D devfn;=0A=
>>>>>      pci_dev->requester_id_cache =3D pci_req_id_cache_get(pci_dev);=
=0A=
>>>>> +    pci_dev->stream_id_base =3D pci_get_stream_id_base(pci_dev);=0A=
>>>> looks strange to me to store the rid base in the end point as this is=
=0A=
>>>> rather a property of the PCI complex. I acknowledge this is much more=
=0A=
>>> I agree.=0A=
>> The reason I have changed was to avoid traversing the entire hierarchy=
=0A=
>> each time the ID is needed (for example each time when a MSI is sent).=
=0A=
>>=0A=
>>> I think that what we need is to add support for allowing PCI RCs=0A=
>>> to transform requesterIDs in transactions attributes according to the=
=0A=
>>> implementation specifics.=0A=
>> Do you mean that you need more than a linear offset between requesterID=
=0A=
>> and whatever other ID?=0A=
>=0A=
> Yes.=0A=
>=0A=
> This is my understanding for the ARM platforms I'm familiar with:=0A=
>=0A=
> Since AXI busses don't have a defined way to carry Master IDs, these=0A=
> are typically carried on the AXI user signals. I'll just refer to=0A=
> these signals as AXI Master IDs.=0A=
>=0A=
> 1. An endpoint issues an MSI (or any) transaction on the PCI bus.=0A=
>    In QEMU, these trasactions carry the requester ID in their attributes.=
=0A=
>=0A=
> 2. The transaction hits the PCI "host" bridge to the SoC internal=0A=
>    interconnect (typically AXI). This bridge needs to forward the=0A=
>    PCI transaction onto the AXI bus. Including mapping the PCI=0A=
>    RequesterID into an AXI MasterID.=0A=
>=0A=
> 3. The AXI transaction hits the IOMMU and the MasterID is mapped=0A=
>    into a streamID to identify the origin of the transaction=0A=
>    and apply address translation accordingly. If the SMMU=0A=
>    allows the transaction to pass, the stream ID is mapped back=0A=
>    into the transactions MasterID.=0A=
>=0A=
> 4. The AXI transaction continues down the interconnect and hits=0A=
>    the MSI doorbell and the MasterID is mapped into a DeviceID to=0A=
>    identify the origin of the MSI and apply possible interrupt translatio=
n.=0A=
>=0A=
> Adding streamID fields to a PCI endpoint doesn't make any sense to me.=0A=
> The requester ID is already there and is IMO enough.=0A=
> StreamIDs are a concept of ARM System MMUs, not of PCI endpoints.=0A=
=0A=
What I have added into the endpoint is actually the Master ID (in QEMU=0A=
it is actually equal with the streamID). I agree that this is a property=0A=
of the root complex, the only reason I have put it into the endpoint was=0A=
to avoid traversing the PCI hierarchy each time an MSI is sent.=0A=
=0A=
>=0A=
> When modelling #2, hardcoding a specific linear mapping between=0A=
> PCI requester IDs and AXI Master IDs may work for one platform=0A=
> but it won't work for all platforms. There is no one mapping for all.=0A=
> It can even be run-time programmable in the bridge.=0A=
=0A=
One solution might be defining a function in the generic host bridge=0A=
which by default returns the requesterIDs (assumes that requesterID is=0A=
the same with the masterID). This function can be over overridden by=0A=
each specific implementation.=0A=
=0A=
>=0A=
> IIRC, the SMMUv3 docs have a section that suggest how these ReqID to AXI =
Master ID mappings can be done.=0A=
=0A=
I did not find the specific section, just that the streamID should be=0A=
derived from requesterID.=0A=
=0A=
=0A=
Thanks,=0A=
=0A=
Diana=0A=
=0A=
=0A=
>=0A=
>=0A=
>>> The way we did it when modelling the ZynqMP is by adding support for=0A=
>>> transaction attribute translation in QEMU's IOMMU interface.=0A=
>>> In our PCI RC, we have an IOMMU covering the entire AS that PCI devs DM=
A into.=0A=
>>> This IOMMU doesn't do address-translation, only RequesterID -> StreamID=
=0A=
>>> transforms according to how the ZynqMP PCI RC derives StreamIDs from Re=
questerIDs.=0A=
>> Are there any patches for this support in order for me to better underst=
and?=0A=
> It's currently on the Xilinx QEMU fork on GitHub.=0A=
> https://github.com/Xilinx/qemu/blob/master/hw/pci-host/xlnx-nwl-pcie-main=
.c=0A=
>=0A=
> In the current ZynqMP, all RequesterIDs map to a single MasterID (it's a =
HW limitation).=0A=
> In future versions of the HW, another mapping will be used.=0A=
> I can't share code for the latter yet though....=0A=
>=0A=
> Best regards,=0A=
> Edgar=0A=
>=0A=
>  =0A=
>=0A=
>> Thanks,=0A=
>>=0A=
>> Diana=0A=
>>=0A=
>>=0A=
>>> This is useful not only to model PCI RequesterID to AXI Master ID mappi=
ngs but=0A=
>>> also for modelling things like the ARM TZC (or the Xilinx ZynqMP XMPU/X=
PPUs).=0A=
>>>=0A=
>>> Cheers,=0A=
>>> Edgar=0A=
>>>=0A=
>>>=0A=
>>>> simple than reworking pci_requester_id() though.=0A=
>>>>>  =0A=
>>>>>      memory_region_init(&pci_dev->bus_master_container_region, OBJECT=
(pci_dev),=0A=
>>>>>                         "bus master container", UINT64_MAX);=0A=
>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h=0A=
>>>>> index 33b0ff3..94c007a 100644=0A=
>>>>> --- a/include/hw/arm/virt.h=0A=
>>>>> +++ b/include/hw/arm/virt.h=0A=
>>>>> @@ -99,6 +99,7 @@ typedef struct {=0A=
>>>>>      struct arm_boot_info bootinfo;=0A=
>>>>>      const MemMapEntry *memmap;=0A=
>>>>>      const int *irqmap;=0A=
>>>>> +    const uint32_t *streamidmap;=0A=
>>>>>      int smp_cpus;=0A=
>>>>>      void *fdt;=0A=
>>>>>      int fdt_size;=0A=
>>>>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h=
=0A=
>>>>> index 68c9348..47df01a 100644=0A=
>>>>> --- a/include/hw/pci-host/gpex.h=0A=
>>>>> +++ b/include/hw/pci-host/gpex.h=0A=
>>>>> @@ -48,6 +48,8 @@ typedef struct GPEXHost {=0A=
>>>>>  =0A=
>>>>>      GPEXRootState gpex_root;=0A=
>>>>>  =0A=
>>>>> +    uint32_t stream_id_base;=0A=
>>>>> +=0A=
>>>>>      MemoryRegion io_ioport;=0A=
>>>>>      MemoryRegion io_mmio;=0A=
>>>>>      qemu_irq irq[GPEX_NUM_IRQS];=0A=
>>>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h=0A=
>>>>> index a37a2d5..e6e9334 100644=0A=
>>>>> --- a/include/hw/pci/pci.h=0A=
>>>>> +++ b/include/hw/pci/pci.h=0A=
>>>>> @@ -283,6 +283,12 @@ struct PCIDevice {=0A=
>>>>>       * MSI). For conventional PCI root complex, this field is=0A=
>>>>>       * meaningless. */=0A=
>>>>>      PCIReqIDCache requester_id_cache;=0A=
>>>>> +    /* Some platforms need a unique ID for IOMMU source identificati=
on=0A=
>>>>> +     * or MSI source identification. QEMU implements a simple scheme=
:=0A=
>>>>> +     * stream_id =3D  stream_id_base + requester_id. The stream_id_b=
ase will=0A=
>>>>> +     * ensure that all the devices in the system have different stre=
am ID=0A=
>>>>> +     * domains */=0A=
>>>>> +    uint32_t stream_id_base;=0A=
>>>> get rid of IOMMU terminology?=0A=
>>>>=0A=
>>>> Note that when adding other sub-systems you will need to address the=
=0A=
>>>> ACPI side as the IORT table built by hw/arm/virt-acpi-build.c currentl=
y=0A=
>>>> defines an RID mapping for the single root complex.=0A=
>>>>=0A=
>>>> Thanks=0A=
>>>>=0A=
>>>> Eric=0A=
>>>>>      char name[64];=0A=
>>>>>      PCIIORegion io_regions[PCI_NUM_REGIONS];=0A=
>>>>>      AddressSpace bus_master_as;=0A=
>>>>> @@ -737,6 +743,8 @@ static inline uint16_t pci_get_bdf(PCIDevice *dev=
)=0A=
>>>>>  =0A=
>>>>>  uint16_t pci_requester_id(PCIDevice *dev);=0A=
>>>>>  =0A=
>>>>> +uint32_t pci_stream_id(PCIDevice *dev);=0A=
>>>>> +=0A=
>>>>>  /* DMA access functions */=0A=
>>>>>  static inline AddressSpace *pci_get_address_space(PCIDevice *dev)=0A=
>>>>>  {=0A=
>>>>> diff --git a/kvm-all.c b/kvm-all.c=0A=
>>>>> index 90b8573..5a508c3 100644=0A=
>>>>> --- a/kvm-all.c=0A=
>>>>> +++ b/kvm-all.c=0A=
>>>>> @@ -1280,7 +1280,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int =
vector, PCIDevice *dev)=0A=
>>>>>      kroute.u.msi.data =3D le32_to_cpu(msg.data);=0A=
>>>>>      if (kvm_msi_devid_required()) {=0A=
>>>>>          kroute.flags =3D KVM_MSI_VALID_DEVID;=0A=
>>>>> -        kroute.u.msi.devid =3D pci_requester_id(dev);=0A=
>>>>> +        kroute.u.msi.devid =3D pci_stream_id(dev);=0A=
>>>>>      }=0A=
>>>>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev=
)) {=0A=
>>>>>          kvm_irqchip_release_virq(s, virq);=0A=
>>>>> @@ -1317,7 +1317,7 @@ int kvm_irqchip_update_msi_route(KVMState *s, i=
nt virq, MSIMessage msg,=0A=
>>>>>      kroute.u.msi.data =3D le32_to_cpu(msg.data);=0A=
>>>>>      if (kvm_msi_devid_required()) {=0A=
>>>>>          kroute.flags =3D KVM_MSI_VALID_DEVID;=0A=
>>>>> -        kroute.u.msi.devid =3D pci_requester_id(dev);=0A=
>>>>> +        kroute.u.msi.devid =3D pci_stream_id(dev);=0A=
>>>>>      }=0A=
>>>>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev=
)) {=0A=
>>>>>          return -EINVAL;=0A=
>>>>>=0A=
=0A=
