Received: by 10.25.44.15 with SMTP id s15csp3609419lfs;
        Mon, 31 Jul 2017 06:23:05 -0700 (PDT)
X-Received: by 10.200.54.200 with SMTP id b8mr20884213qtc.307.1501507385242;
        Mon, 31 Jul 2017 06:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501507385; cv=none;
        d=google.com; s=arc-20160816;
        b=juMfOxHWrBtddsIuZP4PM+xu8ZMXZR6V8X5upGI6DWAVQ4Uyu1LodLgAmblCvxrisM
         QRlvY0DMA2akXIQ9Do/OQwbkN6U38J+IvyJdKFlCCBBahVkfffG2X83b7LI5cC61Ym1Z
         2o9q93t0BRJzvyQd/kUC43lV9opaKfGzCZUn5v92MOag7N3fTVi5k5/mKc42ul3u+R8e
         LzGklEgKOnL9mvbcBjokhIMycDIrVp9snlWjT89fqtEC/QUlN+C1sUjUNc+u+euCGmHZ
         cxIWdLcLqrETr+Evb6FJplyl+N2WJBcOfnOmWGagioknAHkiV0clpuiXmjs65D82Rlsz
         I49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=/ans4/liOO3k5UUgJYrSCt/NGJqnhkBN6m3Azz80KDo=;
        b=hrrAhuQlmRWVQZXEtl5mYJsupvoUM/SFn6gbSWlgwBfF5ItX1aUZx1N5r8ro11O9c+
         CGg48LCd/BsLjghQREfKES95IUG3LX+o0M9WHPokY8KV3+0LBxiPmni0jJSdNNPhBO0R
         8nYyDF+Hba6Sf6v0NyfKhjHUS6QFaeGTpKxjNLdzmsoyuSijaDgJPG5WS0cNgRn10SO1
         PjPESUuyQtGH9+rt6p/ENIJ2Bk+k/o6iOEjy/jyGNFlnaJ2y6ePdViR+fmEk3c9XWbVb
         vlsNcZ/4CJLXC44n3/J5O2kXsGz1c6pvEBsbiFtJjDMyes8pGys58A+I6r4zeRpDiurb
         X5wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=qxCjxRnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i124si23499064qkd.315.2017.07.31.06.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 06:23:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=qxCjxRnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:59568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcAf0-0003Fs-Hc
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 09:23:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dcAev-0003E6-JU
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 09:22:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dcAeu-0004Ka-80
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 09:22:57 -0400
Received: from mail-eopbgr00077.outbound.protection.outlook.com
	([40.107.0.77]:17568
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dcAeo-0004Hl-HP; Mon, 31 Jul 2017 09:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/ans4/liOO3k5UUgJYrSCt/NGJqnhkBN6m3Azz80KDo=;
	b=qxCjxRnUzCu+ojCq2C/SdfyIuyMcZynPI2geXQ3wec3AGShU4zJOcnSRP1iN/8q/wPBR/44pPJq6wzaFNjVZF0O6/S4gYaI9sYxl1EDfPAsF04XXHEU1nJzjSsl7AdG5WU5ssMG6Qer7XxMmaq+HJ47SHcpfDhKhM1hSLcIPOU4=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0808.eurprd04.prod.outlook.com (10.242.253.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Mon, 31 Jul 2017 13:22:46 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb%14]) with mapi id 15.01.1304.023;
	Mon, 31 Jul 2017 13:22:45 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WHLIdRw36YjE2WVULSPv0RNA==
Date: Mon, 31 Jul 2017 13:22:45 +0000
Message-ID: <AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170706023845-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0808;
	7:Zx5F64h5kfH1wQTxmP77XUp1OsKCP+ahssJIQnEhTbk5dGEQhzNEZQOhaO22s3ILppBUq3+7/p9K3xnyKstJYRhxI2TRK5cO7bbQQqRYhCUu0+82Gf/y2U0kjdyrXdtFgo4/+GAkqtu9k8ylwfF+vXiMs/jePm7JqhfbiRj2peI9/iOSdEoa1F8d/5tC17/MSdax6w6k2F4DVhWsaxEshOPd+K/XcqhitLD4Xl+xrZzCGgo171Ima590RnZzN0qjhLh67vLUHTULS9VYniYPTiKMQCi8kbdrO9bYuaOnEQ8uzGYVoDZg2H7F9iFuv82+E9um+xr+smiYLl/Jk8r4dKfKp1+FGv/3tvzZPQHpdpetC5jwAQ5Q3YVeKNxtUhGfCTumHrsB7zUcf8xNxta8hIuo/1tRWYfLMkYD8LgY+lo2SUYlJreBIbPGIVaYJqmP9TplEDeztRSeIotF4kKy2GBKh6amdYLyhyt1z6PlSiaj4MJyX33Faf4M0R7TFsKmaEZ9ZfTikp39oOqMyFNJoyy5CevZ6+YUJVG2Nt+0d/aukhQNsvRozgJz08SJNJhrSJrBsHJCh61vsn6OE+WYkGbR5aT3HpihXCSRRVeasNBLPGFFtcmI8UcPlusSKmNE8LbAzZrlo2ZfmFKDwRoxs8uFsk9uuFSR5P0ezQ4Tlj450cL3iibo/pSPpRPSr4ss9siU0j9Mh2ZdXifLULIMKcKRcl6WOV6fjJGgbQVwEI+7D4vr5fi6MeGtIZLv/ruF2dwXogUpGYKGgRZIg2leZronWXYjRy5Qg58/It1yWic=
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(39840400002)(39850400002)(39400400002)(39450400003)(39410400002)(189002)(377454003)(24454002)(199003)(11905935001)(54906002)(3846002)(102836003)(105586002)(6306002)(106356001)(55016002)(68736007)(478600001)(9686003)(229853002)(45080400002)(6916009)(81156014)(66066001)(8936002)(2900100001)(6246003)(53936002)(99286003)(6436002)(6506006)(6116002)(8676002)(81166006)(25786009)(5250100002)(561944003)(305945005)(110136004)(7736002)(93886004)(38730400002)(86362001)(74316002)(189998001)(3660700001)(4326008)(7696004)(575784001)(101416001)(3280700002)(97736004)(14454004)(33656002)(50986999)(966005)(53546010)(5660300001)(54356999)(76176999)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0808;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 8e631f0f-ba74-44aa-4bdd-08d4d8173b6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0808; 
x-ms-traffictypediagnostic: AM3PR04MB0808:
x-exchange-antispam-report-test: UriScan:(189930954265078)(45079756050767);
x-microsoft-antispam-prvs: <AM3PR04MB0808E2409A31A6EA6DBBCAC2FFB20@AM3PR04MB0808.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR04MB0808; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR04MB0808; 
x-forefront-prvs: 03853D523D
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2017 13:22:45.7387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0808
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.0.77
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Add global device ID in virt machine
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
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>, Laurentiu
	Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +er8IG4jURS3

On 07/06/2017 02:44 AM, Michael S. Tsirkin wrote:=0A=
> On Wed, May 31, 2017 at 12:02:56PM +0000, Diana Madalina Craciun wrote:=
=0A=
>> On 05/25/2017 01:12 AM, Michael S. Tsirkin wrote:=0A=
>>> On Tue, May 23, 2017 at 02:12:43PM +0300, Diana Craciun wrote:=0A=
>>>> The NXP DPAA2 is a hardware architecture designed for high-speeed netw=
ork=0A=
>>>> packet processing. The DPAA2 hardware components are managed by a hard=
ware=0A=
>>>> component called the Management Complex (or MC) which provides an=0A=
>>>> object-base abstraction for software drivers to use the DPAA2 hardware=
.=0A=
>>>> For more details you can see: =0A=
>>>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ft=
ree%2Fdrivers%2Fstaging%2Ffsl-mc%2FREADME.txt%3Fh%3Dv4.10&data=3D01%7C01%7C=
diana.craciun%40nxp.com%7Cce2cc4d066944ce2759308d4a2f1f3f8%7C686ea1d3bc2b4c=
6fa92cd99c5c301635%7C0&sdata=3DCJAiTF6Qnq4gklSqon7xcRby0O1HQvytTUSdPwaHuSE%=
3D&reserved=3D0=0A=
>>>>=0A=
>>>> The interrupts generated by the DPAA2 hardware components are MSIs. We=
 will add=0A=
>>>> support for direct assigning these DPAA2 components/objects to a virtu=
al =0A=
>>>> machine. However, this will add the need to expand the MSI usage in QE=
MU.=0A=
>>>>=0A=
>>>> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the=0A=
>>>> GIC ITS is using a device ID for interrupt translation. Currently, for=
=0A=
>>>> PCI, the requester ID is used as device ID. This will not work when=0A=
>>>> we add another entity that needs also a device ID which is supposed to=
=0A=
>>>> be unique across the system.=0A=
>>>>=0A=
>>>> My proposal is to add a static allocation in the virt machine. I consi=
dered=0A=
>>>> that this allocation is specific to each machine/platform. Currently o=
nly=0A=
>>>> virt machine has it, but other implementations may use the same mechan=
ism=0A=
>>>> as well.=0A=
>>>> So, I used a static allocation with this formula:=0A=
>>>>=0A=
>>>> DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000 * Constant=0A=
>>>>=0A=
>>>> This formula was taken from SBSA spec (Appendix I: DeviceID generation=
 and=0A=
>>>> ITS groups). In case of QEMU the constant will be different for each e=
ntity.=0A=
>>>> In this way a unique DeviceID will be generated and the device ID will=
 be=0A=
>>>> derived from a requesterID (in case of PCI) or other means in case of =
other=0A=
>>>> entities.=0A=
>>>>=0A=
>>>> The implementation is generic as there might be in the future other no=
n-pci devices=0A=
>>>> that are using MSIs or IOMMU. Any architecture can use it, though curr=
ently=0A=
>>>> only the ARM architecture is using the function that retrieves the str=
eam ID. I=0A=
>>>> did not change all the replacements of the pci_requester_id (with pci_=
stream_id)=0A=
>>>> in the code (although if the constant is 0, the stream_id is equal wit=
h requester_id).=0A=
>>>> The other architectures (e.g. intel iommu code) assume that the ID is =
the=0A=
>>>> requester ID.=0A=
>>>>=0A=
>>>> Tested on NXP LS2080 platform.=0A=
>>>>=0A=
>>>> History:=0A=
>>> I am confused. I get it that non-PCI things want something else=0A=
>>> in their requester ID, but why require it for PCI devices?=0A=
>>> How about using Constant =3D=3D 0 for PCI? This way you do=0A=
>>> not need to touch PCI at all as DeviceID =3D=3D RequesterID ...=0A=
>> It is not that other devices need something else in the requester ID,=0A=
>> but more about finding a way to provide an unique ID across the system=
=0A=
>> (more precisely it should be unique for all devices connected to the=0A=
>> same IOMMU/ITS). The DT already offers support to describe the=0A=
>> translation between stream IDs/device IDs to requester ID for PCI=0A=
>> devices (iommu-map for IOMMU ([1]) and msi-map for MSIs ([2]). It will=
=0A=
>> not change the way the requester ID is used in PCI in general, but only=
=0A=
>> the places that need a unique ID (which are the MSIs and IOMMU).=0A=
>>=0A=
>> If we are to use a value of 0 for the constant in case of PCI devices,=
=0A=
>> what happens if we have multiple PCI controllers?=0A=
> I guess we'd use the PCI Segment number for that?=0A=
>=0A=
>=0A=
=0A=
Yes, we can use the PCI segment for this scenario. But this would mean=0A=
different solutions for the same problem. The main problem is that we=0A=
can have multiple entities in the system that are using MSIs (for now=0A=
PCI and NXP non-PCI bus infrastructure=0A=
(https://lwn.net/Articles/635905/). I guess that we may have other=0A=
platform devices that are using MSIs in the future.=0A=
=0A=
Thanks,=0A=
Diana=0A=
=0A=
=0A=
