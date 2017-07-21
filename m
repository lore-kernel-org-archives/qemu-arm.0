Received: by 10.25.44.15 with SMTP id s15csp560018lfs;
        Fri, 21 Jul 2017 04:47:31 -0700 (PDT)
X-Received: by 10.200.44.13 with SMTP id d13mr9985830qta.182.1500637651177;
        Fri, 21 Jul 2017 04:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500637651; cv=none;
        d=google.com; s=arc-20160816;
        b=iBW50X2GaRZ0BJGwBbzABBelSUE3KbM7g364Ok/iIiIrQKebKJjRIQWRr0TcEqgOgk
         /bM9iPfsS65Jz7NVOiG9MhwPhPJbkisSXJFx/cugKAFn9iwTHEa1dIxUOmsNmuAN8TI9
         HaktTODkt64Rl6M9hCesYI5FNem90sKW75dkJiwcVsSgtdVkr4x8enFWVkwW5+6cBXV6
         +z7EsqYR0rqYDt8qwrVkKMRlDiLKAKo6ErN1Cw2x53ivm2KpkThT/enlRuYtl1mME9oO
         kSGBc0pMM7zZvin+gTAQTbEZQ9bEkl/aNN+qycGpf3RDmJNhEdR9zQN2rYZgAcPJugHL
         +OxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :spamdiagnosticmetadata:spamdiagnosticoutput:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature:arc-authentication-results;
        bh=TcwAtz/pk09+gL41xvax6ZrZhWopxtCspR9oTQZ+h6A=;
        b=j+5distc+iLKfQl+JE2ws62cqtTP+s9yqFzoypcXxrgo92yNczBDSmE474XglzsuLU
         w9WblNNCbQinlCmfjWtsRCwVG/fYzFG2M4Ltas6y2OttthkpFPTIZD2O1fTWKO1Dfxaa
         R+2sJgpPkByTWAzHgn1CPNttNHNxkSAKY4s/CUhOCZHX0OuY4VKjKzZ9CpJ6dmbXhh/s
         p0GMTvlIcaZ5xeR4hOrsTFT3JUFsMdJvWkR0wnOjiK3IQ8pDEcRtkYvJej/5QJQcvr2H
         C1pVQ/FaN7nQ6bGAjkVmTgxUUfgBiKOi5roRhrT6L30JIewl27yy2Acj+VbsqJEljehu
         EV2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=lVuqRDdr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q127si3637912qkb.169.2017.07.21.04.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 04:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=lVuqRDdr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:42426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYWP2-0004nT-70
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 07:47:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1dYWOu-0004ku-4h
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mike.caraman@nxp.com>) id 1dYWOs-0006Ws-5W
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:47:20 -0400
Received: from mail-he1eur01on0043.outbound.protection.outlook.com
	([104.47.0.43]:44896
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mike.caraman@nxp.com>)
	id 1dYWOl-0006Tj-Tu; Fri, 21 Jul 2017 07:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TcwAtz/pk09+gL41xvax6ZrZhWopxtCspR9oTQZ+h6A=;
	b=lVuqRDdr7o60GWAiWrBYcdyk8f3OhkhXh6Tqieq9hs2p8oqHiios9fGCnG88L5JQmoQNyPCHeenFMpZCAByw/46mGUso++OqOGuCxCNEWmn2CtpZFLJeIji4MqEcPgeFOF9CQh/8m9b1ZpBLBqrR/bMD8hgtNndFgrv4jOcOq3o=
Received: from AM2PR04MB0804.eurprd04.prod.outlook.com (10.160.57.12) by
	AM2PR04MB0612.eurprd04.prod.outlook.com (10.160.32.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1282.10; Fri, 21 Jul 2017 11:47:07 +0000
Received: from AM2PR04MB0804.eurprd04.prod.outlook.com
	([fe80::89bf:3c38:1466:1bed]) by
	AM2PR04MB0804.eurprd04.prod.outlook.com
	([fe80::89bf:3c38:1466:1bed%13]) with mapi id 15.01.1261.024;
	Fri, 21 Jul 2017 11:47:06 +0000
From: Mike Caraman <mike.caraman@nxp.com>
To: Peter Maydell <peter.maydell@linaro.org>, Diana Madalina Craciun
	<diana.craciun@nxp.com>
Thread-Topic: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WH4Uc+xaBm/EG4eeHUmvMNhqJNl0+AgBDuRq8=
Date: Fri, 21 Jul 2017 11:47:06 +0000
Message-ID: <AM2PR04MB0804660DF51B39B3E88B0D3484A40@AM2PR04MB0804.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>,
	<CAFEAcA_Zd1kFdv11Pbh9=_Hu2uBvULxPHbk15ot-uKGpzw4s3A@mail.gmail.com>
In-Reply-To: <CAFEAcA_Zd1kFdv11Pbh9=_Hu2uBvULxPHbk15ot-uKGpzw4s3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mike.caraman@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM2PR04MB0612;
	7:m2aWdYAc2UOyI9JV4SXWen0P5Q6EIc14c+1zNLuEPaBjwp1LvBI0AXg7hKw4fJo2RXRpIVDdfp24wBj4oqoHnbVXMZ5/z+0ED06l5YhmxvrzF1tCiuiLh90gv6ja84ZSwaNa5TGXLKx4DX9oDKOCWgSlxBQYKCwmjND0nldkzPt+HturM2BOKW5bPUEyqqm0++VObcU1XGXNkUpafIc0US0YNHKeWVz9q2lAQWd/P+jJkPv2KgDovbck8EqwJ4ec4gSIsAv/s+vto3Ryl+ecPA+YkdNW3bD+XwMbIPFoCVn4IAfgWUdgxK4FPhggL0l2yo9K8FyEK+o0pKPvjt3wkLYuLalvTaCFuCeO0F3QXhvSGbOInFmWcqslppH+obkHQihaLIZ2l+ByCUp3lLDcTOqaOOMjfLL3n0U7FONYm2nGC/+ELHrNvvqkLh6dfKLFABRerLaW3HeHkhxq1hRXJz5l8gWzMV/yWCS1jAQaXHCZe5rAyPOv9qK/tBtSj2Mwm3D8XfY/JbbF4N+Bq1l8NPbHYB+U3eZqFsO4XO84QpENfo/lfIDgzYfdqlLFKZHaJlDN43peDJH6JuexqoWZygVJOmqXgM7n4iwqVR06dlsfHjGuog+Ru/+5hSXMPmIBsBblMUTs75pBF0CHYwwAQHqYlj8PKoXQcoD3Cxc31Qgc7z1M+XTnqsq+NVPQIAO2poiqM8yasAlsxV9fo81spFhvrZu76eERkex1vIREwBFy9SjoV7lmJ8zF9ybO4PRtLAyOVwKw6rjeH7Mj7jC9jLoavaL05/DRZE4l/4sz7lE=
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10009020)(39860400002)(39840400002)(39850400002)(39450400003)(39400400002)(39410400002)(377454003)(199003)(189002)(24454002)(6246003)(38730400002)(53936002)(7696004)(54906002)(7736002)(99286003)(6436002)(45080400002)(55016002)(2906002)(606006)(3846002)(66066001)(6636002)(5250100002)(6116002)(54896002)(86362001)(102836003)(97736004)(5660300001)(6306002)(2950100002)(236005)(74316002)(6606003)(8936002)(9686003)(14454004)(19627405001)(189998001)(6506006)(229853002)(3280700002)(68736007)(2900100001)(50986999)(54356999)(3660700001)(4326008)(76176999)(105586002)(8676002)(25786009)(81166006)(478600001)(106356001)(101416001)(81156014)(33656002)(561944003)(966005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM2PR04MB0612;
	H:AM2PR04MB0804.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 16daef0f-17de-4ad0-18cc-08d4d02e3641
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM2PR04MB0612; 
x-ms-traffictypediagnostic: AM2PR04MB0612:
x-exchange-antispam-report-test: UriScan:(189930954265078)(185117386973197)(58145275503218)(84791874153150)(45079756050767);
x-microsoft-antispam-prvs: <AM2PR04MB0612FCF20436740688332A7D84A40@AM2PR04MB0612.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(2017060910075)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123562025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM2PR04MB0612; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM2PR04MB0612; 
x-forefront-prvs: 0375972289
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_AM2PR04MB0804660DF51B39B3E88B0D3484A40AM2PR04MB0804eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2017 11:47:06.0891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR04MB0612
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.43
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/2] Add global device ID in
 virt machine
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0+nEcIi3vZ87

--_000_AM2PR04MB0804660DF51B39B3E88B0D3484A40AM2PR04MB0804eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Peter, thanks for feedback. Diana will return from vacation next week,
I am trying clarify some of the questions.

>From: Peter Maydell <peter.maydell@linaro.org>
>Sent: Monday, July 10, 2017 8:10 PM
>To: Diana Madalina Craciun
>Cc: QEMU Developers; Michael S. Tsirkin; Eric Auger; Mike Caraman; qemu-ar=
m; Marcel Apfelbaum; Bharat Bhushan; Christoffer Dall; Laurentiu Tudor
>Subject: Re: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt mach=
ine
>
>On 23 May 2017 at 12:12, Diana Craciun <diana.craciun@nxp.com> wrote:
>> The NXP DPAA2 is a hardware architecture designed for high-speeed networ=
k
>> packet processing. The DPAA2 hardware components are managed by a hardwa=
re
>> component called the Management Complex (or MC) which provides an
>> object-base abstraction for software drivers to use the DPAA2 hardware.
>> For more details you can see:
>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftre=
e%2Fdrivers%2Fstaging%2Ffsl-mc%2FREADME.txt%3Fh%3Dv4.10&data=3D01%7C01%7Cmi=
ke.caraman%40nxp.com%7Ccdb80ed25c4a4a71d86708d4c7b68cd8%7C686ea1d3bc2b4c6fa=
92cd99c5c301635%7C0&sdata=3DJfYha1w2rZ12URBU3LHgo7OwtEPEDqcGWjdAUiRCP4k%3D&=
reserved=3D0
>>
>> The interrupts generated by the DPAA2 hardware components are MSIs. We w=
ill add
>> support for direct assigning these DPAA2 components/objects to a virtual
>> machine. However, this will add the need to expand the MSI usage in QEMU=
.
>>
>> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
>> GIC ITS is using a device ID for interrupt translation. Currently, for
>> PCI, the requester ID is used as device ID. This will not work when
>> we add another entity that needs also a device ID which is supposed to
>> be unique across the system.
>>
>> My proposal is to add a static allocation in the virt machine. I conside=
red
>> that this allocation is specific to each machine/platform. Currently onl=
y
>> virt machine has it, but other implementations may use the same mechanis=
m
>> as well.
>> So, I used a static allocation with this formula:
>>
>> DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000 * Constant
>>
>> This formula was taken from SBSA spec (Appendix I: DeviceID generation a=
nd
>> ITS groups). In case of QEMU the constant will be different for each ent=
ity.
>> In this way a unique DeviceID will be generated and the device ID will b=
e
>> derived from a requesterID (in case of PCI) or other means in case of ot=
her
>> entities.
>>
>> The implementation is generic as there might be in the future other non-=
pci devices
>> that are using MSIs or IOMMU. Any architecture can use it, though curren=
tly
>> only the ARM architecture is using the function that retrieves the strea=
m ID. I
>> did not change all the replacements of the pci_requester_id (with pci_st=
ream_id)
>> in the code (although if the constant is 0, the stream_id is equal with =
requester_id).
>> The other architectures (e.g. intel iommu code) assume that the ID is th=
e
>> requester ID.
>>
>> Tested on NXP LS2080 platform.
>
>So I'm still a bit confused about what this is for and what the
>relationship is with how the equivalent task would be performed
>in real hardware. Can you explain how that works, please?
>Would there be a system MMU involved somewhere that would be
>allocating these IDs somehow?

This is the first step to accommodate device pass-though with MSI support,
required for non-PCI/heterogeneous buses on ARM64 platforms with GIC-ITS.
We reached the point where our mc-bus infrastructure got the ack and
it is ready to get out of staging:
https://lkml.org/lkml/2017/7/18/708

The problem we want to address is related to guest DeviceIDs allocation
for GIC-ITS emulation. On real hardware the boot loader, in our case u-boot=
,
allocates the DeviceIDs and populates the PCI msi-map device tree binding.
We have a similar binding mechanism for MC devices:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/pci/pci-msi.txt
http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Ddrivers/pci/pcie_layerscape=
_fixup.c;h=3D9e6c2f5dfcf62e8b06935aa9ae3c40a734f9571d;hb=3DHEAD#l118

Qemu does not populate yet the msi-map and the DeviceIDs for PCI devices
defaults to bdf at run-time:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/of/irq.c#n599
http://elixir.free-electrons.com/linux/latest/source/drivers/pci/msi.c#L148=
8

The proposal is to allocate the DeviceIDs as described in SBSA and to popul=
ate the
device tree, as oppose of generating them at runtime, in order to stick to =
device
binding definitions and to avoid clashes.

>The patchset also seems to be introducing a fair amount of
>mechanism without also implementing the actual use for it -- yes,
>if we had two PCI controllers in the virt board we would need to
>sort something out I guess, but we don't, we only have one.
>Evaluating whether the mechanism makes sense without its major
>user is always trickier.
>
>Essentially, I know very little about this use case, but my
>default position is that if in doubt we should aim to match
>how real hardware handles something. Virtualization-specific
>code, and especially something specific to a niche use case like
>this, is something I'd really prefer to avoid. The ideal is to
>have something like PCI device passthrough, where the guest can
>automatically probe for things and QEMU doesn't need to get
>involved.
>
>I was hoping Eric would review this, since he's more up to speed
>on direct hardware passthrough than I am, but I think he's just
>gone off on holiday...
>
>thanks
>-- PMM
>

Regards,
Mike

--_000_AM2PR04MB0804660DF51B39B3E88B0D3484A40AM2PR04MB0804eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-serif,&quot;EmojiFont&=
quot;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmo=
ji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols,&quot=
;EmojiFont&quot;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,N=
otoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSy=
mbols;">
<div>Peter, thanks for feedback. Diana will return from vacation next week,=
<br>
I am trying clarify some of the questions.<br>
<br>
&gt;From: Peter Maydell &lt;peter.maydell@linaro.org&gt;<br>
&gt;Sent: Monday, July 10, 2017 8:10 PM<br>
&gt;To: Diana Madalina Craciun<br>
&gt;Cc: QEMU Developers; Michael S. Tsirkin; Eric Auger; Mike Caraman; qemu=
-arm; Marcel Apfelbaum; Bharat Bhushan; Christoffer Dall; Laurentiu Tudor<b=
r>
&gt;Subject: Re: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt m=
achine<br>
&gt; <br>
&gt;On 23 May 2017 at 12:12, Diana Craciun &lt;diana.craciun@nxp.com&gt; wr=
ote:<br>
&gt;&gt; The NXP DPAA2 is a hardware architecture designed for high-speeed =
network<br>
&gt;&gt; packet processing. The DPAA2 hardware components are managed by a =
hardware<br>
&gt;&gt; component called the Management Complex (or MC) which provides an<=
br>
&gt;&gt; object-base abstraction for software drivers to use the DPAA2 hard=
ware.<br>
&gt;&gt; For more details you can see:<br>
&gt;&gt; https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git=
%2Ftree%2Fdrivers%2Fstaging%2Ffsl-mc%2FREADME.txt%3Fh%3Dv4.10&amp;data=3D01=
%7C01%7Cmike.caraman%40nxp.com%7Ccdb80ed25c4a4a71d86708d4c7b68cd8%7C686ea1d=
3bc2b4c6fa92cd99c5c301635%7C0&amp;sdata=3DJfYha1w2rZ12URBU3LHgo7OwtEPEDqcGW=
jdAUiRCP4k%3D&amp;reserved=3D0<br>
&gt;&gt;<br>
&gt;&gt; The interrupts generated by the DPAA2 hardware components are MSIs=
. We will add<br>
&gt;&gt; support for direct assigning these DPAA2 components/objects to a v=
irtual<br>
&gt;&gt; machine. However, this will add the need to expand the MSI usage i=
n QEMU.<br>
&gt;&gt;<br>
&gt;&gt; Currently the MSIs in QEMU are pretty much tied to PCI. For ARM th=
e<br>
&gt;&gt; GIC ITS is using a device ID for interrupt translation. Currently,=
 for<br>
&gt;&gt; PCI, the requester ID is used as device ID. This will not work whe=
n<br>
&gt;&gt; we add another entity that needs also a device ID which is suppose=
d to<br>
&gt;&gt; be unique across the system.<br>
&gt;&gt;<br>
&gt;&gt; My proposal is to add a static allocation in the virt machine. I c=
onsidered<br>
&gt;&gt; that this allocation is specific to each machine/platform. Current=
ly only<br>
&gt;&gt; virt machine has it, but other implementations may use the same me=
chanism<br>
&gt;&gt; as well.<br>
&gt;&gt; So, I used a static allocation with this formula:<br>
&gt;&gt;<br>
&gt;&gt; DeviceID =3D zero_extend( RequesterID[15:0] ) &#43; 0x10000 * Cons=
tant<br>
&gt;&gt;<br>
&gt;&gt; This formula was taken from SBSA spec (Appendix I: DeviceID genera=
tion and<br>
&gt;&gt; ITS groups). In case of QEMU the constant will be different for ea=
ch entity.<br>
&gt;&gt; In this way a unique DeviceID will be generated and the device ID =
will be<br>
&gt;&gt; derived from a requesterID (in case of PCI) or other means in case=
 of other<br>
&gt;&gt; entities.<br>
&gt;&gt;<br>
&gt;&gt; The implementation is generic as there might be in the future othe=
r non-pci devices<br>
&gt;&gt; that are using MSIs or IOMMU. Any architecture can use it, though =
currently<br>
&gt;&gt; only the ARM architecture is using the function that retrieves the=
 stream ID. I<br>
&gt;&gt; did not change all the replacements of the pci_requester_id (with =
pci_stream_id)<br>
&gt;&gt; in the code (although if the constant is 0, the stream_id is equal=
 with requester_id).<br>
&gt;&gt; The other architectures (e.g. intel iommu code) assume that the ID=
 is the<br>
&gt;&gt; requester ID.<br>
&gt;&gt;<br>
&gt;&gt; Tested on NXP LS2080 platform.<br>
&gt;<br>
&gt;So I'm still a bit confused about what this is for and what the<br>
&gt;relationship is with how the equivalent task would be performed<br>
&gt;in real hardware. Can you explain how that works, please?<br>
&gt;Would there be a system MMU involved somewhere that would be<br>
&gt;allocating these IDs somehow?<br>
<br>
<div>This is the first step to accommodate device pass-though with MSI supp=
ort,<br>
required for non-PCI/heterogeneous buses on ARM64 platforms with GIC-ITS.<b=
r>
</div>
We reached the point where our mc-bus infrastructure got the ack and<br>
it is ready to get out of staging:<br>
<a href=3D"https://lkml.org/lkml/2017/7/18/708" class=3D"OWAAutoLink" id=3D=
"LPlnk641336" previewremoved=3D"true">https://lkml.org/lkml/2017/7/18/708</=
a><br>
<br>
The problem we want to address is related to guest DeviceIDs allocation<br>
for<span> GIC-ITS</span> emulation. On real hardware the boot loader, in ou=
r case u-boot,<br>
allocates the DeviceIDs and populates the PCI msi-map device tree binding.<=
br>
We have a similar binding mechanism for MC devices:<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/devicetree/bindings/pci/pci-msi.txt" class=3D"OWAAuto=
Link" id=3D"LPlnk134546" previewremoved=3D"true">https://git.kernel.org/pub=
/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bind=
ings/pci/pci-msi.txt</a><br>
<a href=3D"http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Ddrivers/pci/pcie=
_layerscape_fixup.c;h=3D9e6c2f5dfcf62e8b06935aa9ae3c40a734f9571d;hb=3DHEAD#=
l118" class=3D"OWAAutoLink" id=3D"LPlnk306248" previewremoved=3D"true">http=
://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Ddrivers/pci/pcie_layerscape_fix=
up.c;h=3D9e6c2f5dfcf62e8b06935aa9ae3c40a734f9571d;hb=3DHEAD#l118</a><br>
<br>
Qemu does not populate yet the <span>msi-map</span> and the DeviceIDs for P=
CI devices<br>
defaults to bdf at run-time:<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/drivers/of/irq.c#n599" class=3D"OWAAutoLink" id=3D"LPlnk776378" pre=
viewremoved=3D"true">https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/tree/drivers/of/irq.c#n599</a><br>
<a href=3D"http://elixir.free-electrons.com/linux/latest/source/drivers/pci=
/msi.c#L1488" class=3D"OWAAutoLink" id=3D"LPlnk55148" previewremoved=3D"tru=
e">http://elixir.free-electrons.com/linux/latest/source/drivers/pci/msi.c#L=
1488</a><br>
<span></span><br>
The proposal is to allocate the <span>DeviceIDs as described in SBSA and to=
 populate the
<br>
device tree, as oppose of generating them at runtime, in order to stick to =
device<br>
binding definitions and <span>to avoid clashes</span>.<br>
<span></span></span><br>
&gt;The patchset also seems to be introducing a fair amount of<br>
&gt;mechanism without also implementing the actual use for it -- yes,<br>
&gt;if we had two PCI controllers in the virt board we would need to<br>
&gt;sort something out I guess, but we don't, we only have one.<br>
&gt;Evaluating whether the mechanism makes sense without its major<br>
&gt;user is always trickier.<br>
&gt;<br>
&gt;Essentially, I know very little about this use case, but my<br>
&gt;default position is that if in doubt we should aim to match<br>
&gt;how real hardware handles something. Virtualization-specific<br>
&gt;code, and especially something specific to a niche use case like<br>
&gt;this, is something I'd really prefer to avoid. The ideal is to<br>
&gt;have something like PCI device passthrough, where the guest can<br>
&gt;automatically probe for things and QEMU doesn't need to get<br>
&gt;involved.<br>
&gt;<br>
&gt;I was hoping Eric would review this, since he's more up to speed<br>
&gt;on direct hardware passthrough than I am, but I think he's just<br>
&gt;gone off on holiday...<br>
&gt;<br>
&gt;thanks<br>
&gt;-- PMM<br>
&gt;</div>
<br>
Regards,<br>
Mike<br>
</div>
</div>
</div>
</body>
</html>

--_000_AM2PR04MB0804660DF51B39B3E88B0D3484A40AM2PR04MB0804eurp_--
