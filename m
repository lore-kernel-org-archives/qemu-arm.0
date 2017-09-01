Received: by 10.223.188.70 with SMTP id a6csp1092861wrh;
        Fri, 1 Sep 2017 07:33:37 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb46qH4Imf7L2UocBgcuUfc/fsTTxW/GHhl1i0FeidYAyJjtqSHg5mXZsfmxfz+XT6s30dhL
X-Received: by 10.200.49.114 with SMTP id h47mr3106111qtb.148.1504276417548;
        Fri, 01 Sep 2017 07:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504276417; cv=none;
        d=google.com; s=arc-20160816;
        b=rBJYrlxujKBu6gvwuixztPPbtRseJoDrzkbuzyL4ub811/C5WIDnhRHvX9Hbx3PPI8
         VsPEr0ojB6ALIMo9rfomKzIZr6leEOa46iYTvqDjWJj7Qo7zGUtfLTip1OUcQwxBUbAt
         ix8S9Q6vRMgeD442qlA2gPe+F6d7GP8WLsYw3z5iTPoRVsPzCbiKyhIawQ+zyyWrlUT2
         140xly9A3zQ57kVTVMs0zfgq6eZd7nrP1KJJXNP1IluNZNoRm2mqlB1+agJk3gOspqtn
         v8ajwWdLHbh1wNq1CT3M+H5bWaZEfchOhDHoTBKOrU8JFItYAUz5PcGojTDTDb2alXnQ
         9Dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=oMbevnjXpxp3v+mTANmirziBAQibDduYPh8/Kx9u0rg=;
        b=VMSaf0m0XPVW7P7ClFjYlladUutmFRS7gh26a99wVGZrY8cA7qp0M05Z2HboWNzJF1
         nKeYHdpYi+cYIh6V9WMSSkb4xdZd9698EHCbecjWfoU0jYYg4fQlimbP7lGyXLHVRxS/
         yxy/9iZ0Ui9JPE0i1CWZg6L/91yCLacpBpaDMN3FD0HDAGHq4SAFvq5fiJaVkGSHl02S
         h64j/4hcwvfWQdKPSdZI/RNdpmxLDTA1SPpjFmbixan5JmHKDi3x83zOLRvGukENhQaS
         64XgLVLESRssyPeumQb0MRxVjdOq/sKKUdwX74UaRbbc7+1dJiOvWRgodQB+KeB8phNw
         //lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=Ifs934+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si10139519qki.315.2017.09.01.07.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 07:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=Ifs934+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:43856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnn0p-0004qT-0d
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 10:33:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dnn0f-0004n5-3V
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 10:33:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dnn0Y-0003zu-9O
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 10:33:25 -0400
Received: from mail-db5eur01on0042.outbound.protection.outlook.com
	([104.47.2.42]:12352
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dnn0K-0003ul-7e; Fri, 01 Sep 2017 10:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oMbevnjXpxp3v+mTANmirziBAQibDduYPh8/Kx9u0rg=;
	b=Ifs934+WOkmmWpIj15GzoKwV8nonNXzO1sxNTFikJt0UjWrasioVlanYmXANp/KtiXhD52KUHNGrygyoCw1bftjzjP1KYJJ1L0ONF5cCU3RCxGu9HoSTyB1IC8Sm0hU1XP1ufm3rdwCW1TvCI0eZAKSKo+fVn640T3H83rG3Bfk=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB305.eurprd04.prod.outlook.com (10.242.113.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 14:33:00 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::414d:bebc:b19d:3f35]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::414d:bebc:b19d:3f35%13]) with mapi id 15.20.0013.012;
	Fri, 1 Sep 2017 14:32:59 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the virt machine
	to be used as device ID
Thread-Index: AQHS07WQhQaf1stp7kus9qldhP1WKg==
Date: Fri, 1 Sep 2017 14:32:59 +0000
Message-ID: <AM3PR04MB0616A07BE3108B9568E93806FF920@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
	<b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
	<20170731151602.GU4859@toto>
	<AM3PR04MB0616508E7E868475F181AC18FF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170811155027.GO4859@toto>
	<AM3PR04MB0616C6B8D91F8C86BA086FF0FF840@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170822214318-mutt-send-email-mst@kernel.org>
	<20170823200927.GA9911@toto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB305;
	6:23forPP45d+azHF4AzDQFW/uDrmsCIpnACC5pcwRi5R+02rWLm4IupyOv6bFcEqi1Mr/CyE7BmZ/n74JUNq0g5E9+ILV7yvWVGdX0o9csr6Dvu1HZvO9cVDurn5YA6Rida9qKWot7rBS4UuGySe4l7CBlgOvvTY6As963YRGgls7VRWqpAkHCD1yi1b2TH/TconvvJl8lq/orCuiVXm8XrQNA9eg0occlyyXTE4A//uTLfG860Qx30q7NvNN1w1L+yJ2thgGPksNHhREyVzn1sN+MKnhzeSTrbLNsnZSSkE/NVrVW6FYSeBLsPKnbQmd9CBzbQ3uS6pFKBxrq+ofxA==;
	5:u+5KgRmlke8ZgnDEHoPWjgUl5GURkYQ2j2Hq8/YtqDO46kRe4Ws3x2McRBRomu0UHcgwM/SMMPEpkWi8XZ4yWFOXtmm55Asqq6IYx7U3AxUsEb+dzn1S57RlOhSA+v49OJRM94kbsFzywt/8Q7D4Yw==;
	24:+GnR5GFAk2fWbmhiJYLZGTkU0LRjA5PoF60lC/t6WXJgI7K4RLopNLeBBpFJ/vPn5rxyUf8EjcRV/6Zx744O2nPCBA7hXKO4UAa50pwo66E=;
	7:AZETkmglM/8gVX6Jot3MA4A/HRU0UGNWMdgTVoix6NNgit4+/lvsDI4O+IBOvQaEIKII4tcCZnloDp2E6UjH8B0wrFocsdNkJjohv/dVc9RNwvP8ioJ/VjbSFe359W1z5Bk8G+csh+PNqUHRRRvL06F8awRg2FTGiliBse+g6pLQiOoVh4xpOV+f+5K63jF0GhIou3DwPP8IW0n0BSDNgw6gkns+RPsBZQFmm9Lxv7s=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(199003)(189002)(24454002)(51444003)(377454003)(106356001)(8936002)(561944003)(551934003)(6436002)(6506006)(229853002)(101416001)(39060400002)(4326008)(55016002)(86362001)(6306002)(54906002)(9686003)(99286003)(105586002)(53946003)(7696004)(53936002)(575784001)(6246003)(5660300001)(76176999)(54356999)(50986999)(74316002)(2900100001)(189998001)(66066001)(33656002)(81166006)(8676002)(81156014)(966005)(68736007)(53546010)(14454004)(478600001)(102836003)(3846002)(6116002)(3280700002)(25786009)(93886005)(3660700001)(45080400002)(2906002)(305945005)(7736002)(5250100002)(97736004)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB305;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 13f10ba6-2612-4257-24f5-08d4f146586a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB305; 
x-ms-traffictypediagnostic: AM3PR04MB305:
x-exchange-antispam-report-test: UriScan:(189930954265078)(185117386973197)(45079756050767); 
x-microsoft-antispam-prvs: <AM3PR04MB30565042357048B1458E175FF920@AM3PR04MB305.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR04MB305; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR04MB305; 
x-forefront-prvs: 0417A3FFD2
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2017 14:32:59.8344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB305
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.42
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the
 virt machine to be used as device ID
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nG991cKHomBV

On 08/23/2017 11:29 PM, Edgar E. Iglesias wrote:=0A=
> On Tue, Aug 22, 2017 at 10:04:25PM +0300, Michael S. Tsirkin wrote:=0A=
>> On Tue, Aug 22, 2017 at 03:13:57PM +0000, Diana Madalina Craciun wrote:=
=0A=
>>> On 08/11/2017 06:50 PM, Edgar E. Iglesias wrote:=0A=
>>>> On Fri, Aug 11, 2017 at 02:35:28PM +0000, Diana Madalina Craciun wrote=
:=0A=
>>>>> Hi Edgar,=0A=
>>>>>=0A=
>>>>> On 07/31/2017 06:16 PM, Edgar E. Iglesias wrote:=0A=
>>>>>> On Wed, Jul 26, 2017 at 02:22:28PM +0200, Auger Eric wrote:=0A=
>>>>>>> Hi Diana,=0A=
>>>>>>> On 23/05/2017 13:12, Diana Craciun wrote:=0A=
>>>>>>>> Device IDs are required by the ARM GICv3 ITS for IRQ remapping.=0A=
>>>>>>>> Currently, for PCI devices, the requester ID was used as device=0A=
>>>>>>>> ID in the virt machine. If the system has multiple masters that=0A=
>>>>>>> if the system has multiple root complex?=0A=
>>>>>>>> use MSIs a unique ID accross the platform is needed.=0A=
>>>>>>> across=0A=
>>>>>>>> A static scheme is used and each master is allocated a range of ID=
s=0A=
>>>>>>>> with the formula:=0A=
>>>>>>>> DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000*Constant (=
as=0A=
>>>>>>>> recommended by SBSA).=0A=
>>>>>>>>=0A=
>>>>>>>> This ID will be configured in the machine creation and if not conf=
igured=0A=
>>>>>>>> the PCI requester ID will be used insteead.=0A=
>>>>>>> instead=0A=
>>>>>>>> Signed-off-by: Diana Craciun <diana.craciun@nxp.com>=0A=
>>>>>>>> ---=0A=
>>>>>>>>  hw/arm/virt.c              | 26 ++++++++++++++++++++++++++=0A=
>>>>>>>>  hw/pci-host/gpex.c         |  6 ++++++=0A=
>>>>>>>>  hw/pci/msi.c               |  2 +-=0A=
>>>>>>>>  hw/pci/pci.c               | 25 +++++++++++++++++++++++++=0A=
>>>>>>>>  include/hw/arm/virt.h      |  1 +=0A=
>>>>>>>>  include/hw/pci-host/gpex.h |  2 ++=0A=
>>>>>>>>  include/hw/pci/pci.h       |  8 ++++++++=0A=
>>>>>>>>  kvm-all.c                  |  4 ++--=0A=
>>>>>>>>  8 files changed, 71 insertions(+), 3 deletions(-)=0A=
>>>>>>>>=0A=
>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c=0A=
>>>>>>>> index 5f62a03..a969694 100644=0A=
>>>>>>>> --- a/hw/arm/virt.c=0A=
>>>>>>>> +++ b/hw/arm/virt.c=0A=
>>>>>>>> @@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus=
_params;=0A=
>>>>>>>>  #define RAMLIMIT_GB 255=0A=
>>>>>>>>  #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)=0A=
>>>>>>>>  =0A=
>>>>>>>> +#define STREAM_ID_RANGE_SIZE 0x10000=0A=
>>>>>>>> +=0A=
>>>>>>>>  /* Addresses and sizes of our components.=0A=
>>>>>>>>   * 0..128MB is space for a flash device so we can run bootrom cod=
e such as UEFI.=0A=
>>>>>>>>   * 128MB..256MB is used for miscellaneous device I/O.=0A=
>>>>>>>> @@ -162,6 +164,22 @@ static const int a15irqmap[] =3D {=0A=
>>>>>>>>      [VIRT_PLATFORM_BUS] =3D 112, /* ...to 112 + PLATFORM_BUS_NUM_=
IRQS -1 */=0A=
>>>>>>>>  };=0A=
>>>>>>>>  =0A=
>>>>>>>> +/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping=
. Currently=0A=
>>>>>>>> + * for PCI devices the requester ID was used as device ID. But if=
 the system has=0A=
>>>>>>>> + * multiple masters that use MSIs, the requester ID may cause dev=
iceID clashes.=0A=
>>>>>>>> + * So a unique number is  needed accross the system.=0A=
>>>>>>>> + * We are using the following formula:=0A=
>>>>>>>> + * DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000*Consta=
nt=0A=
>>>>>>>> + * (as recommanded by SBSA). Currently we do not have an SMMU emu=
lation, but the=0A=
>>>>>>>> + * same formula can be used for the generation of the streamID as=
 well.=0A=
>>>>>>>> + * For each master the device ID will be derrived from the reques=
ter ID using=0A=
>>>>>>>> + * the abovemntione formula.=0A=
>>>>>>>> + */=0A=
>>>>>>> I think most of this comment should only be in the commit message. =
typos=0A=
>>>>>>> in derived and above mentioned.=0A=
>>>>>>>=0A=
>>>>>>> stream id is the terminology for the id space at the input of the s=
mmu.=0A=
>>>>>>> device id is the terminology for the id space at the input of the m=
si=0A=
>>>>>>> controller I think.=0A=
>>>>>>>=0A=
>>>>>>> RID -> deviceID (no IOMMU)=0A=
>>>>>>> RID -> streamID -> deviceID (IOMMU)=0A=
>>>>>>>=0A=
>>>>>>> I would personally get rid of all streamid uses as the smmu is not =
yet=0A=
>>>>>>> supported and stick to the=0A=
>>>>>>> Documentation/devicetree/bindings/pci/pci-msi.txt terminology?=0A=
>>>>>>>=0A=
>>>>>>>> +=0A=
>>>>>>>> +static const uint32_t streamidmap[] =3D {=0A=
>>>>>>>> +    [VIRT_PCIE] =3D 0,         /* currently only one PCI controll=
er */=0A=
>>>>>>>> +};=0A=
>>>>>>>> +=0A=
>>>>>>>>  static const char *valid_cpus[] =3D {=0A=
>>>>>>>>      "cortex-a15",=0A=
>>>>>>>>      "cortex-a53",=0A=
>>>>>>>> @@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState=
 *vms, qemu_irq *pic)=0A=
>>>>>>>>      hwaddr base_ecam =3D vms->memmap[VIRT_PCIE_ECAM].base;=0A=
>>>>>>>>      hwaddr size_ecam =3D vms->memmap[VIRT_PCIE_ECAM].size;=0A=
>>>>>>>>      hwaddr base =3D base_mmio;=0A=
>>>>>>>> +    uint32_t stream_id =3D vms->streamidmap[VIRT_PCIE] * STREAM_I=
D_RANGE_SIZE;=0A=
>>>>>>> msi-base?=0A=
>>>>>>> STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?=0A=
>>>>>>>>      int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;=0A=
>>>>>>>>      int irq =3D vms->irqmap[VIRT_PCIE];=0A=
>>>>>>>>      MemoryRegion *mmio_alias;=0A=
>>>>>>>> @@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineStat=
e *vms, qemu_irq *pic)=0A=
>>>>>>>>      PCIHostState *pci;=0A=
>>>>>>>>  =0A=
>>>>>>>>      dev =3D qdev_create(NULL, TYPE_GPEX_HOST);=0A=
>>>>>>>> +    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);=0A=
>>>>>>>>      qdev_init_nofail(dev);=0A=
>>>>>>>>  =0A=
>>>>>>>>      /* Map only the first size_ecam bytes of ECAM space */=0A=
>>>>>>>> @@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineSt=
ate *vms, qemu_irq *pic)=0A=
>>>>>>>>      if (vms->msi_phandle) {=0A=
>>>>>>>>          qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",=
=0A=
>>>>>>>>                                 vms->msi_phandle);=0A=
>>>>>>>> +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map=
",=0A=
>>>>>>>> +                                     1, 0,=0A=
>>>>>>>> +                                     1, vms->msi_phandle,=0A=
>>>>>>>> +                                     1, stream_id,=0A=
>>>>>>>> +                                     1, STREAM_ID_RANGE_SIZE);=0A=
>>>>>>>>      }=0A=
>>>>>>>>  =0A=
>>>>>>>>      qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",=0A=
>>>>>>>> @@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *o=
bj)=0A=
>>>>>>>>  =0A=
>>>>>>>>      vms->memmap =3D a15memmap;=0A=
>>>>>>>>      vms->irqmap =3D a15irqmap;=0A=
>>>>>>>> +    vms->streamidmap =3D streamidmap;=0A=
>>>>>>>>  }=0A=
>>>>>>>>  =0A=
>>>>>>>>  static void virt_machine_2_9_options(MachineClass *mc)=0A=
>>>>>>>> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c=0A=
>>>>>>>> index 66055ee..de72408 100644=0A=
>>>>>>>> --- a/hw/pci-host/gpex.c=0A=
>>>>>>>> +++ b/hw/pci-host/gpex.c=0A=
>>>>>>>> @@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_=
num, int level)=0A=
>>>>>>>>      qemu_set_irq(s->irq[irq_num], level);=0A=
>>>>>>>>  }=0A=
>>>>>>>>  =0A=
>>>>>>>> +static Property gpex_props[] =3D {=0A=
>>>>>>>> +    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base=
, 0),=0A=
>>>>>>> msi_base_base=0A=
>>>>>>>> +    DEFINE_PROP_END_OF_LIST(),=0A=
>>>>>>>> +};=0A=
>>>>>>>> +=0A=
>>>>>>>>  static void gpex_host_realize(DeviceState *dev, Error **errp)=0A=
>>>>>>>>  {=0A=
>>>>>>>>      PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);=0A=
>>>>>>>> @@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *kl=
ass, void *data)=0A=
>>>>>>>>  =0A=
>>>>>>>>      hc->root_bus_path =3D gpex_host_root_bus_path;=0A=
>>>>>>>>      dc->realize =3D gpex_host_realize;=0A=
>>>>>>>> +    dc->props =3D gpex_props;=0A=
>>>>>>>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);=0A=
>>>>>>>>      dc->fw_name =3D "pci";=0A=
>>>>>>>>  }=0A=
>>>>>>>> diff --git a/hw/pci/msi.c b/hw/pci/msi.c=0A=
>>>>>>>> index 7925851..b60a410 100644=0A=
>>>>>>>> --- a/hw/pci/msi.c=0A=
>>>>>>>> +++ b/hw/pci/msi.c=0A=
>>>>>>>> @@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessa=
ge msg)=0A=
>>>>>>>>  {=0A=
>>>>>>>>      MemTxAttrs attrs =3D {};=0A=
>>>>>>>>  =0A=
>>>>>>>> -    attrs.stream_id =3D pci_requester_id(dev);=0A=
>>>>>>>> +    attrs.stream_id =3D pci_stream_id(dev);=0A=
>>>>>>>>      address_space_stl_le(&dev->bus_master_as, msg.address, msg.da=
ta,=0A=
>>>>>>>>                           attrs, NULL);=0A=
>>>>>>>>  }=0A=
>>>>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c=0A=
>>>>>>>> index 259483b..92e9a2b 100644=0A=
>>>>>>>> --- a/hw/pci/pci.c=0A=
>>>>>>>> +++ b/hw/pci/pci.c=0A=
>>>>>>>> @@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)=0A=
>>>>>>>>      return pci_req_id_cache_extract(&dev->requester_id_cache);=0A=
>>>>>>>>  }=0A=
>>>>>>>>  =0A=
>>>>>>>> +static uint32_t pci_get_stream_id_base(PCIDevice *dev)=0A=
>>>>>>>> +{=0A=
>>>>>>>> +    PCIBus *rootbus =3D pci_device_root_bus(dev);=0A=
>>>>>>>> +    PCIHostState *host_bridge =3D PCI_HOST_BRIDGE(rootbus->qbus.p=
arent);=0A=
>>>>>>>> +    Error *err =3D NULL;=0A=
>>>>>>>> +    int64_t stream_id;=0A=
>>>>>>>> +=0A=
>>>>>>>> +    stream_id =3D object_property_get_int(OBJECT(host_bridge), "s=
tream-id-base",=0A=
>>>>>>>> +                                        &err);=0A=
>>>>>>>> +    if (stream_id < 0) {=0A=
>>>>>>>> +        stream_id =3D 0;=0A=
>>>>>>>> +    }=0A=
>>>>>>>> +=0A=
>>>>>>>> +    return stream_id;=0A=
>>>>>>>> +}=0A=
>>>>>>>> +=0A=
>>>>>>>> +uint32_t pci_stream_id(PCIDevice *dev)=0A=
>>>>>>>> +{=0A=
>>>>>>>> +    /* Stream ID =3D RequesterID[15:0] + stream_id_base. stream_i=
d_base may=0A=
>>>>>>>> +     * be 0 for devices that are not using any translation betwee=
n requester_id=0A=
>>>>>>>> +     * and stream_id */=0A=
>>>>>>>> +    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base=
;=0A=
>>>>>>>> +}=0A=
>>>>>>> I think you should split the changes in virt from pci/gpex generic =
changes.=0A=
>>>>>>>=0A=
>>>>>>>> +=0A=
>>>>>>>>  /* -1 for devfn means auto assign */=0A=
>>>>>>>>  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIB=
us *bus,=0A=
>>>>>>>>                                           const char *name, int de=
vfn,=0A=
>>>>>>>> @@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCI=
Device *pci_dev, PCIBus *bus,=0A=
>>>>>>>>  =0A=
>>>>>>>>      pci_dev->devfn =3D devfn;=0A=
>>>>>>>>      pci_dev->requester_id_cache =3D pci_req_id_cache_get(pci_dev)=
;=0A=
>>>>>>>> +    pci_dev->stream_id_base =3D pci_get_stream_id_base(pci_dev);=
=0A=
>>>>>>> looks strange to me to store the rid base in the end point as this =
is=0A=
>>>>>>> rather a property of the PCI complex. I acknowledge this is much mo=
re=0A=
>>>>>> I agree.=0A=
>>>>> The reason I have changed was to avoid traversing the entire hierarch=
y=0A=
>>>>> each time the ID is needed (for example each time when a MSI is sent)=
.=0A=
>>>>>=0A=
>>>>>> I think that what we need is to add support for allowing PCI RCs=0A=
>>>>>> to transform requesterIDs in transactions attributes according to th=
e=0A=
>>>>>> implementation specifics.=0A=
>>>>> Do you mean that you need more than a linear offset between requester=
ID=0A=
>>>>> and whatever other ID?=0A=
>>>> Yes.=0A=
>>>>=0A=
>>>> This is my understanding for the ARM platforms I'm familiar with:=0A=
>>>>=0A=
>>>> Since AXI busses don't have a defined way to carry Master IDs, these=
=0A=
>>>> are typically carried on the AXI user signals. I'll just refer to=0A=
>>>> these signals as AXI Master IDs.=0A=
>>>>=0A=
>>>> 1. An endpoint issues an MSI (or any) transaction on the PCI bus.=0A=
>>>>    In QEMU, these trasactions carry the requester ID in their attribut=
es.=0A=
>>>>=0A=
>>>> 2. The transaction hits the PCI "host" bridge to the SoC internal=0A=
>>>>    interconnect (typically AXI). This bridge needs to forward the=0A=
>>>>    PCI transaction onto the AXI bus. Including mapping the PCI=0A=
>>>>    RequesterID into an AXI MasterID.=0A=
>>>>=0A=
>>>> 3. The AXI transaction hits the IOMMU and the MasterID is mapped=0A=
>>>>    into a streamID to identify the origin of the transaction=0A=
>>>>    and apply address translation accordingly. If the SMMU=0A=
>>>>    allows the transaction to pass, the stream ID is mapped back=0A=
>>>>    into the transactions MasterID.=0A=
>>>>=0A=
>>>> 4. The AXI transaction continues down the interconnect and hits=0A=
>>>>    the MSI doorbell and the MasterID is mapped into a DeviceID to=0A=
>>>>    identify the origin of the MSI and apply possible interrupt transla=
tion.=0A=
>>>>=0A=
>>>> Adding streamID fields to a PCI endpoint doesn't make any sense to me.=
=0A=
>>>> The requester ID is already there and is IMO enough.=0A=
>>>> StreamIDs are a concept of ARM System MMUs, not of PCI endpoints.=0A=
>>> What I have added into the endpoint is actually the Master ID (in QEMU=
=0A=
>>> it is actually equal with the streamID). I agree that this is a propert=
y=0A=
>>> of the root complex, the only reason I have put it into the endpoint wa=
s=0A=
>>> to avoid traversing the PCI hierarchy each time an MSI is sent.=0A=
>> Can all this be folded into the IOMMU? Then you might be able to get by=
=0A=
>> with defining an iommu function.  pci_device_iommu_address_space already=
=0A=
>> walks the hierarchy.=0A=
> Hmm, perhaps. I guess iommu_fn's would have to be able to return modified=
=0A=
> transaction attributes. That would work, I think,=0A=
>=0A=
> I was first thinking that if we change the IOMMU translate() method to al=
low=0A=
> IOMMUs to modify memory attributes, Diana could register an IOMMU memory-=
region=0A=
> with pci_setup_iommu() that modifies the attributes and returns a new att=
ribute=0A=
> with the AS that originally would have been set with pci_setup_iommu().=
=0A=
>=0A=
> Adding support for IOMMU translate() to modify attributes is something we=
=0A=
> need to do anyway IMO.=0A=
>=0A=
>=0A=
>>>> When modelling #2, hardcoding a specific linear mapping between=0A=
>>>> PCI requester IDs and AXI Master IDs may work for one platform=0A=
>>>> but it won't work for all platforms. There is no one mapping for all.=
=0A=
>>>> It can even be run-time programmable in the bridge.=0A=
>> OK but how does it work with the specific bridge that you emulate?=0A=
>> There is no need to model advanced bridges with super flexible=0A=
>> programmable mappings if guests do not need them to run.=0A=
>=0A=
> Diana can answer for the details of the bridge she wants to model.=0A=
> I was mostly trying to make a point that we should avoid hardcoding=0A=
> a specific mapping that cannot be overriden by other host bridge models.=
=0A=
=0A=
I am using the generic host bridge from the virt machine, so nothing=0A=
special. The problem I am trying to solve is having non-PCI devices=0A=
which are using MSIs as well. So they need also a translation from=0A=
whatever ID they are having to device ID. And the translated device ID=0A=
must not be in the same range with the PCI ones.=0A=
=0A=
=0A=
>=0A=
>>> One solution might be defining a function in the generic host bridge=0A=
>>> which by default returns the requesterIDs (assumes that requesterID is=
=0A=
>>> the same with the masterID). This function can be over overridden by=0A=
>>> each specific implementation.=0A=
>>>=0A=
>>>> IIRC, the SMMUv3 docs have a section that suggest how these ReqID to A=
XI Master ID mappings can be done.=0A=
>>> I did not find the specific section, just that the streamID should be=
=0A=
>>> derived from requesterID.=0A=
>=0A=
> In my version of the spec, it's section 4.2 Stream Numbering.=0A=
> At the end of that secion there are some recomendations on how to=0A=
> map PCI ReqIDs into Stream IDs.=0A=
=0A=
OK, I found that section. In that section ARM recommends the streamID to=0A=
be generated from PCI requester ID so that StreamID[15:0] =3D=3D=0A=
RequesterID[15:0]. It also mentions that in the case of more than one=0A=
root complex to extend the number of streamID bits to differentiate=0A=
between them (e.g. bits [N:16]).=0A=
=0A=
Almost the same idea (a linear mapping) is presented in the SBSA spec:=0A=
StreamID =3D RequesterID[15:0] + 0x10000 * Constant=0A=
=0A=
My proposal is an implementation of the SBSA version.=0A=
=0A=
In this email thread it has been suggested to use Constant=3D0 for PCI and=
=0A=
leave the PCI code unmodified. It can be done this way, but this will=0A=
not work in case of having multiple root complexes because we should=0A=
also reserve some bits [N:16] to differentiate between the root=0A=
complexes, but in the same time not to overlap with the platform devices=0A=
pool. We can agree upon a number of bits reserved for PCIe segment and=0A=
used the remaining ones for other platforms.=0A=
=0A=
=0A=
> Cheers,=0A=
> Edgar=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>>>=0A=
>>> Thanks,=0A=
>>>=0A=
>>> Diana=0A=
>>>>=0A=
>>>>>> The way we did it when modelling the ZynqMP is by adding support for=
=0A=
>>>>>> transaction attribute translation in QEMU's IOMMU interface.=0A=
>>>>>> In our PCI RC, we have an IOMMU covering the entire AS that PCI devs=
 DMA into.=0A=
>>>>>> This IOMMU doesn't do address-translation, only RequesterID -> Strea=
mID=0A=
>>>>>> transforms according to how the ZynqMP PCI RC derives StreamIDs from=
 RequesterIDs.=0A=
>>>>> Are there any patches for this support in order for me to better unde=
rstand?=0A=
>>>> It's currently on the Xilinx QEMU fork on GitHub.=0A=
>>>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2FXilinx%2Fqemu%2Fblob%2Fmaster%2Fhw%2Fpci-host%2Fxlnx-nwl-pcie-m=
ain.c&data=3D01%7C01%7Cdiana.craciun%40nxp.com%7C8db54b1ee05143ceefbf08d4ea=
65a585%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=3Dh%2F4ZlhJbYkL0dRbxv7M=
ykGuwlRTmV64GsK%2FhH7woBtE%3D&reserved=3D0=0A=
>>>>=0A=
>>>> In the current ZynqMP, all RequesterIDs map to a single MasterID (it's=
 a HW limitation).=0A=
>>>> In future versions of the HW, another mapping will be used.=0A=
>>>> I can't share code for the latter yet though....=0A=
>>>>=0A=
>>>> Best regards,=0A=
>>>> Edgar=0A=
>>>>=0A=
>>>>  =0A=
>>>>=0A=
>>>>> Thanks,=0A=
>>>>>=0A=
>>>>> Diana=0A=
>>>>>=0A=
>>>>>=0A=
>>>>>> This is useful not only to model PCI RequesterID to AXI Master ID ma=
ppings but=0A=
>>>>>> also for modelling things like the ARM TZC (or the Xilinx ZynqMP XMP=
U/XPPUs).=0A=
>>>>>>=0A=
>>>>>> Cheers,=0A=
>>>>>> Edgar=0A=
>>>>>>=0A=
>>>>>>=0A=
>>>>>>> simple than reworking pci_requester_id() though.=0A=
>>>>>>>>  =0A=
>>>>>>>>      memory_region_init(&pci_dev->bus_master_container_region, OBJ=
ECT(pci_dev),=0A=
>>>>>>>>                         "bus master container", UINT64_MAX);=0A=
>>>>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h=0A=
>>>>>>>> index 33b0ff3..94c007a 100644=0A=
>>>>>>>> --- a/include/hw/arm/virt.h=0A=
>>>>>>>> +++ b/include/hw/arm/virt.h=0A=
>>>>>>>> @@ -99,6 +99,7 @@ typedef struct {=0A=
>>>>>>>>      struct arm_boot_info bootinfo;=0A=
>>>>>>>>      const MemMapEntry *memmap;=0A=
>>>>>>>>      const int *irqmap;=0A=
>>>>>>>> +    const uint32_t *streamidmap;=0A=
>>>>>>>>      int smp_cpus;=0A=
>>>>>>>>      void *fdt;=0A=
>>>>>>>>      int fdt_size;=0A=
>>>>>>>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex=
.h=0A=
>>>>>>>> index 68c9348..47df01a 100644=0A=
>>>>>>>> --- a/include/hw/pci-host/gpex.h=0A=
>>>>>>>> +++ b/include/hw/pci-host/gpex.h=0A=
>>>>>>>> @@ -48,6 +48,8 @@ typedef struct GPEXHost {=0A=
>>>>>>>>  =0A=
>>>>>>>>      GPEXRootState gpex_root;=0A=
>>>>>>>>  =0A=
>>>>>>>> +    uint32_t stream_id_base;=0A=
>>>>>>>> +=0A=
>>>>>>>>      MemoryRegion io_ioport;=0A=
>>>>>>>>      MemoryRegion io_mmio;=0A=
>>>>>>>>      qemu_irq irq[GPEX_NUM_IRQS];=0A=
>>>>>>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h=0A=
>>>>>>>> index a37a2d5..e6e9334 100644=0A=
>>>>>>>> --- a/include/hw/pci/pci.h=0A=
>>>>>>>> +++ b/include/hw/pci/pci.h=0A=
>>>>>>>> @@ -283,6 +283,12 @@ struct PCIDevice {=0A=
>>>>>>>>       * MSI). For conventional PCI root complex, this field is=0A=
>>>>>>>>       * meaningless. */=0A=
>>>>>>>>      PCIReqIDCache requester_id_cache;=0A=
>>>>>>>> +    /* Some platforms need a unique ID for IOMMU source identific=
ation=0A=
>>>>>>>> +     * or MSI source identification. QEMU implements a simple sch=
eme:=0A=
>>>>>>>> +     * stream_id =3D  stream_id_base + requester_id. The stream_i=
d_base will=0A=
>>>>>>>> +     * ensure that all the devices in the system have different s=
tream ID=0A=
>>>>>>>> +     * domains */=0A=
>>>>>>>> +    uint32_t stream_id_base;=0A=
>>>>>>> get rid of IOMMU terminology?=0A=
>>>>>>>=0A=
>>>>>>> Note that when adding other sub-systems you will need to address th=
e=0A=
>>>>>>> ACPI side as the IORT table built by hw/arm/virt-acpi-build.c curre=
ntly=0A=
>>>>>>> defines an RID mapping for the single root complex.=0A=
>>>>>>>=0A=
>>>>>>> Thanks=0A=
>>>>>>>=0A=
>>>>>>> Eric=0A=
>>>>>>>>      char name[64];=0A=
>>>>>>>>      PCIIORegion io_regions[PCI_NUM_REGIONS];=0A=
>>>>>>>>      AddressSpace bus_master_as;=0A=
>>>>>>>> @@ -737,6 +743,8 @@ static inline uint16_t pci_get_bdf(PCIDevice *=
dev)=0A=
>>>>>>>>  =0A=
>>>>>>>>  uint16_t pci_requester_id(PCIDevice *dev);=0A=
>>>>>>>>  =0A=
>>>>>>>> +uint32_t pci_stream_id(PCIDevice *dev);=0A=
>>>>>>>> +=0A=
>>>>>>>>  /* DMA access functions */=0A=
>>>>>>>>  static inline AddressSpace *pci_get_address_space(PCIDevice *dev)=
=0A=
>>>>>>>>  {=0A=
>>>>>>>> diff --git a/kvm-all.c b/kvm-all.c=0A=
>>>>>>>> index 90b8573..5a508c3 100644=0A=
>>>>>>>> --- a/kvm-all.c=0A=
>>>>>>>> +++ b/kvm-all.c=0A=
>>>>>>>> @@ -1280,7 +1280,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, i=
nt vector, PCIDevice *dev)=0A=
>>>>>>>>      kroute.u.msi.data =3D le32_to_cpu(msg.data);=0A=
>>>>>>>>      if (kvm_msi_devid_required()) {=0A=
>>>>>>>>          kroute.flags =3D KVM_MSI_VALID_DEVID;=0A=
>>>>>>>> -        kroute.u.msi.devid =3D pci_requester_id(dev);=0A=
>>>>>>>> +        kroute.u.msi.devid =3D pci_stream_id(dev);=0A=
>>>>>>>>      }=0A=
>>>>>>>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, =
dev)) {=0A=
>>>>>>>>          kvm_irqchip_release_virq(s, virq);=0A=
>>>>>>>> @@ -1317,7 +1317,7 @@ int kvm_irqchip_update_msi_route(KVMState *s=
, int virq, MSIMessage msg,=0A=
>>>>>>>>      kroute.u.msi.data =3D le32_to_cpu(msg.data);=0A=
>>>>>>>>      if (kvm_msi_devid_required()) {=0A=
>>>>>>>>          kroute.flags =3D KVM_MSI_VALID_DEVID;=0A=
>>>>>>>> -        kroute.u.msi.devid =3D pci_requester_id(dev);=0A=
>>>>>>>> +        kroute.u.msi.devid =3D pci_stream_id(dev);=0A=
>>>>>>>>      }=0A=
>>>>>>>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, =
dev)) {=0A=
>>>>>>>>          return -EINVAL;=0A=
>>>>>>>>=0A=
=0A=
