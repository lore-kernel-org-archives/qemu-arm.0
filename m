Received: by 10.25.0.6 with SMTP id 6csp285525lfa;
        Wed, 31 May 2017 05:03:33 -0700 (PDT)
X-Received: by 10.55.82.7 with SMTP id g7mr16321067qkb.253.1496232213454;
        Wed, 31 May 2017 05:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496232213; cv=none;
        d=google.com; s=arc-20160816;
        b=nmEi77oxOJeuf+m5zeBl3ZD1IKJeF5wRgD8hO5vWkbft395LqEGLQc3JbJtP8FK+i3
         oVBs0R/4QAbxV2EYSXzpGEZIfAqK4JJFaFhiycusesPcN4oYGfjxUczpQrzWHn2Av/Bp
         PgTKVXfN5QQK0fNzU/BGX/9L04l1x42tBcv7TwmdhovwujMFGgtF/2YeBZuBapeEo3OO
         Uaaov/19il6o/lp+ULDhUBFSjUeFjuEJNcH3GruRsPQ5akxTIMgte8cjOD7tiYAdCU+q
         olHRMUO2TvtM6JrwYDTKIjwNEYAOgFKZ0rc0UyhuqIP5mD0Rr9AX9A/jZxjAWB46kWsP
         fR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=dT4UgEhXLd7LMRBB0C5gy2ZewHVfBiRPjT4ByJXqVPI=;
        b=j/QIM4AnW6SIXkhwM/c2ZiXK3YpHI6yPsMKqnzsdPreFgsjrWPcxVbaX8WqHn2c0Qu
         tVi4GcvkiXmn8wYUV3JxEVBBMKAbtsI8NJOv6KrTU34cdxnWHeS0epbyV+vjtdUR1urZ
         aD0ud/WzX7Otsgq+4hS4VsPOwDI/MeFbZG7bebHOodRcLoNxJQyGTIH/doYhtOqmIHqQ
         ETFoqCA85yoQzRdsQA5PbKXZk3pEb9hhZsMRgqxySOoSvAHDqtiOJtz0JYsKfDZ68swV
         NTBjOSKo+PefaQtY+G3LLy8jbzPI4UCvamNuQC+GmsIVROv1lsinNDm5XnVcXT2+Azi5
         T3sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h47si15981171qta.167.2017.05.31.05.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 05:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:58993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dG2La-00082o-Nt
	for alex.bennee@linaro.org; Wed, 31 May 2017 08:03:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dG2LN-000804-B8
	for qemu-arm@nongnu.org; Wed, 31 May 2017 08:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dG2LK-0007Dx-5R
	for qemu-arm@nongnu.org; Wed, 31 May 2017 08:03:17 -0400
Received: from mail-eopbgr10070.outbound.protection.outlook.com
	([40.107.1.70]:62645
	helo=EUR02-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dG2L8-000795-CQ; Wed, 31 May 2017 08:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dT4UgEhXLd7LMRBB0C5gy2ZewHVfBiRPjT4ByJXqVPI=;
	b=KBCdTIeSloYugasXDejUr2eGMzobvIoJssCLfWNIzEAV1HfXj7bD/XmeyonCAv4ZU6r1BzJ+GttV2Z0SdtNGn2cbS/rfeqn8sLg34CbFCoJrpuLZOzFN6hYPPEE5FR4SmkIDxoB8HxlyrYTGdcIku4keocFFcY63uZ+GVQyM338=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0806.eurprd04.prod.outlook.com (10.242.253.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Wed, 31 May 2017 12:02:58 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::80a1:19b0:696c:f32a]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::80a1:19b0:696c:f32a%18]) with mapi id 15.01.1124.020;
	Wed, 31 May 2017 12:02:56 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WHLIdRw36YjE2WVULSPv0RNA==
Date: Wed, 31 May 2017 12:02:56 +0000
Message-ID: <AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0806;
	7:K880mzqp63IXAJasuSpxj9nVxq4IXj4FbutgpDTKQHowUUzOPO6UkKx2Dl8GSgMlI4clf3xcXtvAjkA2Hpu/094txStXl7QvY5Y45xalMU6bnepRZdK0tRKqcxqYMER9cRlMX0j+/sIH+Z7e30YDZdvEg8L+uU5YMlv16/XzdDCLYnLPNKkasXmTO2VA865trTIX7GMWZpCHXq/oQLA1NlSHuVpChT3KNG0TvX64PNLZYNORiQEqmSuKC3T5MkafCjq880j00TNpRMyylBmYcTRpPYPk1lkAxdMMO/cOdhk00FUTkzLo29bCXx/MOo4Y2UKESRTrqi0n3dwfpMxq4A==
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39400400002)(39850400002)(39840400002)(39860400002)(39450400003)(377454003)(24454002)(86362001)(5250100002)(110136004)(4326008)(6506006)(45080400002)(2906002)(38730400002)(7736002)(478600001)(189998001)(575784001)(561944003)(33656002)(6436002)(3846002)(102836003)(14454004)(76176999)(54356999)(50986999)(6116002)(53936002)(25786009)(9686003)(55016002)(99286003)(74316002)(8676002)(229853002)(6306002)(7696004)(54906002)(53546009)(5660300001)(81166006)(66066001)(8936002)(3660700001)(6916009)(3280700002)(966005)(305945005)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0806;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-ms-traffictypediagnostic: AM3PR04MB0806:
x-ms-office365-filtering-correlation-id: fda61dd6-4739-44df-bc3d-08d4a81cf981
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:AM3PR04MB0806; 
x-microsoft-antispam-prvs: <AM3PR04MB0806890DF791508CDE94A43DFFF10@AM3PR04MB0806.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(189930954265078)(45079756050767);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(6072148);
	SRVR:AM3PR04MB0806; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB0806; 
x-forefront-prvs: 0324C2C0E2
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2017 12:02:56.3412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0806
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.1.70
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
X-TUID: tr2SN9Y4lRSV

On 05/25/2017 01:12 AM, Michael S. Tsirkin wrote:=0A=
> On Tue, May 23, 2017 at 02:12:43PM +0300, Diana Craciun wrote:=0A=
>> The NXP DPAA2 is a hardware architecture designed for high-speeed networ=
k=0A=
>> packet processing. The DPAA2 hardware components are managed by a hardwa=
re=0A=
>> component called the Management Complex (or MC) which provides an=0A=
>> object-base abstraction for software drivers to use the DPAA2 hardware.=
=0A=
>> For more details you can see: =0A=
>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftre=
e%2Fdrivers%2Fstaging%2Ffsl-mc%2FREADME.txt%3Fh%3Dv4.10&data=3D01%7C01%7Cdi=
ana.craciun%40nxp.com%7Cce2cc4d066944ce2759308d4a2f1f3f8%7C686ea1d3bc2b4c6f=
a92cd99c5c301635%7C0&sdata=3DCJAiTF6Qnq4gklSqon7xcRby0O1HQvytTUSdPwaHuSE%3D=
&reserved=3D0=0A=
>>=0A=
>> The interrupts generated by the DPAA2 hardware components are MSIs. We w=
ill add=0A=
>> support for direct assigning these DPAA2 components/objects to a virtual=
 =0A=
>> machine. However, this will add the need to expand the MSI usage in QEMU=
.=0A=
>>=0A=
>> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the=0A=
>> GIC ITS is using a device ID for interrupt translation. Currently, for=
=0A=
>> PCI, the requester ID is used as device ID. This will not work when=0A=
>> we add another entity that needs also a device ID which is supposed to=
=0A=
>> be unique across the system.=0A=
>>=0A=
>> My proposal is to add a static allocation in the virt machine. I conside=
red=0A=
>> that this allocation is specific to each machine/platform. Currently onl=
y=0A=
>> virt machine has it, but other implementations may use the same mechanis=
m=0A=
>> as well.=0A=
>> So, I used a static allocation with this formula:=0A=
>>=0A=
>> DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000 * Constant=0A=
>>=0A=
>> This formula was taken from SBSA spec (Appendix I: DeviceID generation a=
nd=0A=
>> ITS groups). In case of QEMU the constant will be different for each ent=
ity.=0A=
>> In this way a unique DeviceID will be generated and the device ID will b=
e=0A=
>> derived from a requesterID (in case of PCI) or other means in case of ot=
her=0A=
>> entities.=0A=
>>=0A=
>> The implementation is generic as there might be in the future other non-=
pci devices=0A=
>> that are using MSIs or IOMMU. Any architecture can use it, though curren=
tly=0A=
>> only the ARM architecture is using the function that retrieves the strea=
m ID. I=0A=
>> did not change all the replacements of the pci_requester_id (with pci_st=
ream_id)=0A=
>> in the code (although if the constant is 0, the stream_id is equal with =
requester_id).=0A=
>> The other architectures (e.g. intel iommu code) assume that the ID is th=
e=0A=
>> requester ID.=0A=
>>=0A=
>> Tested on NXP LS2080 platform.=0A=
>>=0A=
>> History:=0A=
> I am confused. I get it that non-PCI things want something else=0A=
> in their requester ID, but why require it for PCI devices?=0A=
> How about using Constant =3D=3D 0 for PCI? This way you do=0A=
> not need to touch PCI at all as DeviceID =3D=3D RequesterID ...=0A=
=0A=
It is not that other devices need something else in the requester ID,=0A=
but more about finding a way to provide an unique ID across the system=0A=
(more precisely it should be unique for all devices connected to the=0A=
same IOMMU/ITS). The DT already offers support to describe the=0A=
translation between stream IDs/device IDs to requester ID for PCI=0A=
devices (iommu-map for IOMMU ([1]) and msi-map for MSIs ([2]). It will=0A=
not change the way the requester ID is used in PCI in general, but only=0A=
the places that need a unique ID (which are the MSIs and IOMMU).=0A=
=0A=
If we are to use a value of 0 for the constant in case of PCI devices,=0A=
what happens if we have multiple PCI controllers?=0A=
=0A=
[1]=0A=
https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.=
txt=0A=
[2]=0A=
https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-msi.tx=
t=0A=
=0A=
Thanks,=0A=
=0A=
Diana=0A=
=0A=
