Received: by 10.25.44.15 with SMTP id s15csp3605402lfs;
        Mon, 31 Jul 2017 06:18:42 -0700 (PDT)
X-Received: by 10.200.38.243 with SMTP id 48mr20792139qtp.130.1501507122404;
        Mon, 31 Jul 2017 06:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501507122; cv=none;
        d=google.com; s=arc-20160816;
        b=cg8kcz1EwciHj2Hs+WYAbjizrelCKfpvQHiR8PG56M3xiUPLMSm8lEgRvfStHA/zvr
         crws7ZwzFjosabhYABz2aDDSbvxwqBeLDLmGQipmkogm59rTS5cBbMwIDi85UGRvBRLc
         G9b9b6ZXq6Wfu7igurVQd8KN2hRND/CuxvXq2RCglHDsAnAAdgL86L6ZESNM857DZ2fm
         E/MBJYTE0K1Df0tGJrFIlYJMWMPeJdSP9/FVhom5TmMDJNPEJNdOSmV5KtvIb4r0PHKu
         Y2SiXnwL4S9LB1Ai+/lkxJPOqJNXAPn2uNWq/EGLIIrGpph/VB6+Vm6wLrOvX+Rj0qCM
         apOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=aC2fwaq9ugsxFEjbUtOivAX9ApfZCnjNqNznzL8N0qk=;
        b=LNrUuw9lPqJZnE7tnKshxSnhWr4dbGtfzd7WAlVr/rMBzIz7kZ9H/kH+IwHCPjUwOE
         RxYPSq/Vz9I53ledlfPH3ni/nyBrcg2C2lw1hWM8Lnu9UkxNwE2+z1E6KR/c1mHwskec
         +hXNDjkoHclYfDlmzVhXqyt84cAxU6Z7q5GdBo58NutbaL3A4FfYse6f/6/t0kkuy2KT
         SRPAwIDVVmCO3roDowZaQARxHolfFbeK8XMbF51Ibj8WiLHohWGSx4clNjnZLqxrP546
         KzYXIsM6ctQF+mn76wuyt1w6fN2yc3AgkCryFxvIn+ksZ0UUXGeuWmeCIM5toKhetBIm
         oYrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@nxp.com header.b=RmrfqNRR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u39si24265988qtb.313.2017.07.31.06.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 06:18:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@nxp.com header.b=RmrfqNRR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:59542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcAal-0001XZ-Gb
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 09:18:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dcAZ6-0000aa-5I
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 09:16:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dcAZ0-0008Nd-OZ
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 09:16:56 -0400
Received: from mail-db5eur01on0080.outbound.protection.outlook.com
	([104.47.2.80]:2560
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dcAZ0-0008LH-4r; Mon, 31 Jul 2017 09:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=KFWVsBQ5jz7PGQJpO4QY0Ts8uNtGDMdVl2OFwVv65xs=;
	b=RmrfqNRR4nghZOvg1/ogeeHwxIvPyN77O2Sv9VBrJN7SS6OAk8Xnshw5LemxUzL2giH4wHgMp6T7Qi2ohNRG6nifurbKQNrFH0PeMJxiz4XCT+qU6238x74/AisrS2cjD+CprDgGXgMEPuvIb/VPy0gc3CgH8MwnerKRmejl3bs=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0808.eurprd04.prod.outlook.com (10.242.253.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Mon, 31 Jul 2017 13:16:45 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb%14]) with mapi id 15.01.1304.023;
	Mon, 31 Jul 2017 13:16:44 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WHLIdRw36YjE2WVULSPv0RNA==
Date: Mon, 31 Jul 2017 13:16:43 +0000
Message-ID: <AM3PR04MB06168786DF6A6BA0FB70DD88FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<CAFEAcA_Zd1kFdv11Pbh9=_Hu2uBvULxPHbk15ot-uKGpzw4s3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0808;
	7:FF3Mb9G+VEztJwhrQdAClWlQ7lUL2+YvAh6P+TyFPqR1AWVaqiNQ3qS+0jAgZWfeT+MizH24hHq9mifiFR224iSIAnbeDLdI6aDprQ7BSkOfvWeqECt6NOWp6gzAdUWhExwTgeFyMBxm+2RZehbK9NBUTjvWIQQPlsaPKQDbM5nDHuVWbb39DwFvvfgTKRDJQZmU1bk61Ltgk0XmNzyNQXZmcQ7cLtolcry2jrvGLuVq//oWlSKpcfL2uMBhPtbY3qwDlasYAcWtaaBNTeOPStFC/aF2sDsztiZeN0yrTP9deJlVFmRUYPRhY5g9V5lLyQ8YXCT0GUPZHxU8njVH6TPuNYygddDuTPVGrwmMcZc+0FGeShA1vyESoVDADkxGzoTTfGqB0FgPB+qiAmbWEoAc1vMX8GJuz7E4qgpyWxBJ+bqyfwyVvbshOxEm/lYiNT7z/tfNjH239YIlLFJxlybE/Z2awhqtWicrotWfXQESxRajXOftdt4dxUUOHwSIQa/h0BsGrf3++7Gn1nQG9LQfPW2Kqodh29YQYhT4zSIcc0SMg3eyEDW/UBWbRSqVSveXLYNblgXJuGTftyu/uHzmdg+PFWXsMfkYZ1LDMkhZxCS77K4zxreUtAKxqWyGYemoxVmyGh9vQ9FpuuNrXZgYgL+2p/g43vBXn5WBf3Y7n/DwxIP5SCLcMbl62yvPfpJHlZ6PXps61rdwfETGhg0SoWIMBdjZdNJRswjqWn9tL9bSbuY68bdB3lj5vHekzLTVZWIVLCkfPHMcdoXBSurprbZjuKzjnLYiLCabBCQ=
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39860400002)(39840400002)(39850400002)(39400400002)(39450400003)(39410400002)(189002)(377454003)(24454002)(199003)(54906002)(3846002)(102836003)(105586002)(6306002)(106356001)(54896002)(55016002)(68736007)(478600001)(9686003)(229853002)(45080400002)(6916009)(81156014)(66066001)(8936002)(2900100001)(236005)(6246003)(53936002)(99286003)(6436002)(6506006)(6116002)(8676002)(81166006)(25786009)(5250100002)(561944003)(110136004)(7736002)(38730400002)(86362001)(74316002)(189998001)(3660700001)(4326008)(7696004)(101416001)(3280700002)(97736004)(14454004)(33656002)(606006)(50986999)(966005)(53546010)(5660300001)(54356999)(76176999)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0808;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 38484444-71e0-45d4-23e1-08d4d81663e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0808; 
x-ms-traffictypediagnostic: AM3PR04MB0808:
x-exchange-antispam-report-test: UriScan:(189930954265078)(185117386973197)(84791874153150)(45079756050767);
x-microsoft-antispam-prvs: <AM3PR04MB0808E0E6496A4DE5E05D47E6FFB20@AM3PR04MB0808.eurprd04.prod.outlook.com>
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
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2017 13:16:44.0081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0808
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.80
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt machine
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>, Christoffer
	Dall <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hzoR+lea0slg

Hi Peter,

On 07/10/2017 08:10 PM, Peter Maydell wrote:

On 23 May 2017 at 12:12, Diana Craciun <diana.craciun@nxp.com><mailto:diana=
.craciun@nxp.com> wrote:


The NXP DPAA2 is a hardware architecture designed for high-speeed network
packet processing. The DPAA2 hardware components are managed by a hardware
component called the Management Complex (or MC) which provides an
object-base abstraction for software drivers to use the DPAA2 hardware.
For more details you can see:
https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ke=
rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2=
Fdrivers%2Fstaging%2Ffsl-mc%2FREADME.txt%3Fh%3Dv4.10&data=3D01%7C01%7Cdiana=
.craciun%40nxp.com%7C87a43122f7374dd4483008d4c7b68d10%7C686ea1d3bc2b4c6fa92=
cd99c5c301635%7C0&sdata=3DRf9Uae7gxCeBSbLbRyAs24J9R6HUT1p4%2B4K46BgxqvM%3D&=
reserved=3D0

The interrupts generated by the DPAA2 hardware components are MSIs. We will=
 add
support for direct assigning these DPAA2 components/objects to a virtual
machine. However, this will add the need to expand the MSI usage in QEMU.

Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
GIC ITS is using a device ID for interrupt translation. Currently, for
PCI, the requester ID is used as device ID. This will not work when
we add another entity that needs also a device ID which is supposed to
be unique across the system.

My proposal is to add a static allocation in the virt machine. I considered
that this allocation is specific to each machine/platform. Currently only
virt machine has it, but other implementations may use the same mechanism
as well.
So, I used a static allocation with this formula:

DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000 * Constant

This formula was taken from SBSA spec (Appendix I: DeviceID generation and
ITS groups). In case of QEMU the constant will be different for each entity=
.
In this way a unique DeviceID will be generated and the device ID will be
derived from a requesterID (in case of PCI) or other means in case of other
entities.

The implementation is generic as there might be in the future other non-pci=
 devices
that are using MSIs or IOMMU. Any architecture can use it, though currently
only the ARM architecture is using the function that retrieves the stream I=
D. I
did not change all the replacements of the pci_requester_id (with pci_strea=
m_id)
in the code (although if the constant is 0, the stream_id is equal with req=
uester_id).
The other architectures (e.g. intel iommu code) assume that the ID is the
requester ID.

Tested on NXP LS2080 platform.



So I'm still a bit confused about what this is for and what the
relationship is with how the equivalent task would be performed
in real hardware. Can you explain how that works, please?
Would there be a system MMU involved somewhere that would be
allocating these IDs somehow?

Let's keep the discussion to MSIs for now (assuming that there is no SMMU a=
s QEMU does not have currently an SMMU emulation integrated).
Every device that sends MSIs has a deviceID associated with it. The deviceI=
D is used by the GIC-ITS hardware for interrupt translation. The deviceID i=
s assigned by the "system designer", so there is not an hardware entity tha=
t generates/allocates the deviceIDs (the device ID can be programmed into t=
he device by software).

For PCI these IDs are specified in the device tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/pci/pci-msi.txt

(msi-map property).



The patchset also seems to be introducing a fair amount of
mechanism without also implementing the actual use for it -- yes,
if we had two PCI controllers in the virt board we would need to
sort something out I guess, but we don't, we only have one.
Evaluating whether the mechanism makes sense without its major
user is always trickier.

Right, we have only one PCI controller in the QEMU for now. We are in the p=
rocess of implementing device pass-through for our non-PCI bus infrastructu=
re which is using MSIs as well. As Mike pointed out, the mc-bus infrastruct=
ure is on the point of getting out of staging:

"
The fsl-mc is a hardware resource manager that manages specialized hardware=
 objects used in network-oriented packet processing applications. After the=
 fsl-mc block is enabled, pools of hardware resources are available, such a=
s queues, buffer pools, I/O interfaces. These resources are building blocks=
 that can be used to create functional hardware objects such as network int=
erfaces, crypto accelerator instances, or L2 switches.

All the fsl-mc managed hardware resources/objects are represented in a phys=
ical grouping mechanism called a 'container' or DPRC (data path resource co=
ntainer).

From the point of view of an OS, a DPRC functions similar to a plug and pla=
y bus. Using fsl-mc commands software can enumerate the contents of the DPR=
C discovering the hardware objects present and binding them to drivers. Har=
dware objects can be created and removed dynamically, providing hot pluggab=
ility of the hardware objects.
"

After adding pass-through support, we will have two entities that are using=
 MSIs and thus that are needing unique deviceIDs.
PCI is making the assumption that the deviceID=3DrequesterID, so, theoretic=
ally, we could allocate numbers bigger than the requesterID for our bus inf=
rastructure. But I thought that this is more like an temporary workaround w=
hich will not work in the future when: another PCI controller is added or a=
nother platform device that is using MSIs is added.




Essentially, I know very little about this use case, but my
default position is that if in doubt we should aim to match
how real hardware handles something. Virtualization-specific
code, and especially something specific to a niche use case like
this, is something I'd really prefer to avoid. The ideal is to
have something like PCI device passthrough, where the guest can
automatically probe for things and QEMU doesn't need to get
involved.


It is not automatically probed for PCI, either. In the current implementati=
on an assumption is made:

if the msi-map is missing from the device tree (property which specifies th=
e translation between requesterID and deviceID) it is asummed that the devi=
ceID is the same with the requesterID.



I was hoping Eric would review this, since he's more up to speed
on direct hardware passthrough than I am, but I think he's just
gone off on holiday...

thanks
-- PMM



Thanks,

Diana
