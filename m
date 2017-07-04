Received: by 10.25.44.15 with SMTP id s15csp609196lfs;
        Tue, 4 Jul 2017 00:15:55 -0700 (PDT)
X-Received: by 10.55.144.130 with SMTP id s124mr33633237qkd.136.1499152555217;
        Tue, 04 Jul 2017 00:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499152555; cv=none;
        d=google.com; s=arc-20160816;
        b=qL1viHBHpCgWiYam8QOlCIIBkCXvi6zid12/pkuBucOcLI77iLRjL/xTxWm7j8ZQFd
         PzYPE3d8I77HIa6yP3qEmDurF11eZ9XDTQ5WS4fJ33wd7CSJW8sdw+lo8/qZdprhr+Hl
         IlbHPzLxAENbaxBInG0GEFp0MVr4LhjHxJlKvGaZFvaebli3H75qN0YJYZDeXhAUeEqI
         o26an7mjYbsWsewVIyVJm7qkFkP40fLF6brh+RXHSYXY2s0P085HJTsgjuGOhCOgNuWL
         vpovYlp1VH98onyn8aFSbF9eP8ARcqaAp3dRdcV/FrXqSrEKF1ZjqeGCsUqa3uNstRB7
         XwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=ZHJJviVIPlOmyvw/5OdgN3SK9j9gyCYpm7qLkPYaRFA=;
        b=SkIp1jxbZR7fysLphgHLqevZojoMEfgFHZYS93OEqZLkwZvJlnBG3E8WQwInQDPlsj
         ED2ijy0Fc1Rf8KsVS9RXzL/cOh0NBC9+8/AwIeEqpgFNSMCffpxj/o8xgFKeM7i1rPhQ
         KKS4OsH6lmhfQ4LtvYiJsSycTmqu+RT0UZUpEFaWXlS6YPmKFJNkYh62yGMZQjiC11d0
         72NM3aixG9g55zw9hWUbyUgC3stzZBfr9d7yxsovDOL0xF++WZCMeDwAVxS1DSXF/m5F
         pxmkUuMRy9uPgd5mHw7zhvb0GW9uRJb/mwe13UVaan1GecGiGkc4p3565EHtpMeRCWPl
         DwWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=oSvYUQdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si7331685qtc.321.2017.07.04.00.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jul 2017 00:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=oSvYUQdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:39030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSI3s-0005Xv-OL
	for alex.bennee@linaro.org; Tue, 04 Jul 2017 03:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dSI3n-0005WY-T3
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 03:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dSI3m-0000UA-Iq
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 03:15:47 -0400
Received: from mail-eopbgr00059.outbound.protection.outlook.com
	([40.107.0.59]:47648
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dSI3f-0000Jc-7j; Tue, 04 Jul 2017 03:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZHJJviVIPlOmyvw/5OdgN3SK9j9gyCYpm7qLkPYaRFA=;
	b=oSvYUQdDRBeBOu8CZ2XOV3LgQdcWmgirlrJlXMgO1SQ6PIhKOOVaE9MmBv0iX8lcMvfZhTddljWl8oph2gePS+gNBZQF0V/og0f+Q61BtQzNCHm+t9vz5bk2J9G6QEZgIiXJeDJd8DszYqcYTgyNeWldRIeHQeYuwuoIVLL/zqY=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0807.eurprd04.prod.outlook.com (10.242.253.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Tue, 4 Jul 2017 07:15:35 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::7886:24e3:919:66e3]) by AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::7886:24e3:919:66e3%14]) with mapi id 15.01.1220.018;
	Tue, 4 Jul 2017 07:15:34 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WHLIdRw36YjE2WVULSPv0RNA==
Date: Tue, 4 Jul 2017 07:15:34 +0000
Message-ID: <AM3PR04MB06169AC125BCBA8B1320FE74FFD70@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0807;
	7:N8Z552QTCzs7X9r4DvUwuD+p/HvUYLt94eQhoDzkKpMsxHdJp3onmNlKJChb0y983Pswuk8VCwToOAkl9+F4W8nmG2Buig0AIFQfUbAIMvz+RjQkH4Vd4hH9hP1JF4DZrs0RGYjhF3dkvMpQ0CaspplOrNFcBp86x+/297FJnYEr42xmQlLHv9Xn3I/+HVLxM+L6E29a6ozldce5zivpx5H0UymSfHG77ZxjpGrRdOxtc7hnTffEZ/K2CpswR5hDv4K9a8Mqt59Jgcn1A0Dn4oda6nwjmZPk5G5jkSqz3gx9Kk1efflNCtWs0gU4GtoBjjaR4aL6FBXZpNCqQywzPP/vIZkAEazGrZaQIrpv9ie1W38pnmx8zDlcCX4YLwObJjOE9e21ssFQxCTPYyrLizPOYn4M2zIC1y3a6IJeu4Ttd+cncyo2ArTyB7ANvQyALCoJ9lcUqrMO+BXgvep8bHLEw4kcbsBux+BP87/0ZDQ2WusFv1lrN3PWqkWNjs294i/3RPYNvmfvXh1B3DA1GXl3n40aVysUzbYOtO8FylYqX+NHM91QReHJ0MP9sOt7/G+KOZ9pnGCZc7SMbeyChVsdzGyzMos92uU6pSrWOuzp/Uzp/mGyk3GinlGCXNrarl9z9z827xB8QBZfJClVBAuR50i3WGCe6f+taHcL3Z4QboSbuKTgLPmuoqD5AURbokXFScjF+BcmRAIgzhL74DHOO3pShi33/70nk5VIxwMmca+doJi6bQkn3VHEbbhd+l2+6h5oXrQUcQDC6I+64P4YVrxYyNVC27ph+1PiT1Q=
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10009020)(6009001)(39840400002)(39410400002)(39850400002)(39860400002)(39400400002)(39450400003)(24454002)(377454003)(38730400002)(2351001)(3660700001)(7696004)(3846002)(25786009)(5640700003)(305945005)(8936002)(2501003)(966005)(2900100001)(6436002)(8676002)(81166006)(561944003)(6916009)(54356999)(50986999)(76176999)(5250100002)(53936002)(4326008)(478600001)(14454004)(6506006)(33656002)(3280700002)(7736002)(66066001)(53546010)(2906002)(110136004)(102836003)(54906002)(5660300001)(86362001)(229853002)(74316002)(6306002)(99286003)(55016002)(189998001)(6116002)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0807;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-ms-office365-filtering-correlation-id: e465be6c-b5ca-4749-1be3-08d4c2ac76ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0807; 
x-ms-traffictypediagnostic: AM3PR04MB0807:
x-microsoft-antispam-prvs: <AM3PR04MB080797A171B08FAFDFBBB36CFFD70@AM3PR04MB0807.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(84791874153150); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(2017060910031)(8121501046)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123558100)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR04MB0807; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR04MB0807; 
x-forefront-prvs: 0358535363
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2017 07:15:34.5305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0807
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.0.59
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
Cc: "mst@redhat.com" <mst@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, Mike
	Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aS1aZHpbQmqX

ping=0A=
=0A=
On 5/23/2017 2:12 PM, Diana Craciun wrote:=0A=
> The NXP DPAA2 is a hardware architecture designed for high-speeed network=
=0A=
> packet processing. The DPAA2 hardware components are managed by a hardwar=
e=0A=
> component called the Management Complex (or MC) which provides an=0A=
> object-base abstraction for software drivers to use the DPAA2 hardware.=
=0A=
> For more details you can see: =0A=
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/staging/fsl-mc/README.txt?h=3Dv4.10=0A=
>=0A=
> The interrupts generated by the DPAA2 hardware components are MSIs. We wi=
ll add=0A=
> support for direct assigning these DPAA2 components/objects to a virtual =
=0A=
> machine. However, this will add the need to expand the MSI usage in QEMU.=
=0A=
>=0A=
> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the=0A=
> GIC ITS is using a device ID for interrupt translation. Currently, for=0A=
> PCI, the requester ID is used as device ID. This will not work when=0A=
> we add another entity that needs also a device ID which is supposed to=0A=
> be unique across the system.=0A=
>=0A=
> My proposal is to add a static allocation in the virt machine. I consider=
ed=0A=
> that this allocation is specific to each machine/platform. Currently only=
=0A=
> virt machine has it, but other implementations may use the same mechanism=
=0A=
> as well.=0A=
> So, I used a static allocation with this formula:=0A=
>=0A=
> DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000 * Constant=0A=
>=0A=
> This formula was taken from SBSA spec (Appendix I: DeviceID generation an=
d=0A=
> ITS groups). In case of QEMU the constant will be different for each enti=
ty.=0A=
> In this way a unique DeviceID will be generated and the device ID will be=
=0A=
> derived from a requesterID (in case of PCI) or other means in case of oth=
er=0A=
> entities.=0A=
>=0A=
> The implementation is generic as there might be in the future other non-p=
ci devices=0A=
> that are using MSIs or IOMMU. Any architecture can use it, though current=
ly=0A=
> only the ARM architecture is using the function that retrieves the stream=
 ID. I=0A=
> did not change all the replacements of the pci_requester_id (with pci_str=
eam_id)=0A=
> in the code (although if the constant is 0, the stream_id is equal with r=
equester_id).=0A=
> The other architectures (e.g. intel iommu code) assume that the ID is the=
=0A=
> requester ID.=0A=
>=0A=
> Tested on NXP LS2080 platform.=0A=
>=0A=
> History:=0A=
>=0A=
> v1->v2=0A=
> ------=0A=
> - the stream ID was added as a field in the pci device structure in order=
=0A=
> not to traverse the PCI hierarchy each time a MSI is sent.=0A=
>=0A=
>=0A=
> Diana Craciun (2):=0A=
>   Increased the size of requester_id field from MemTxAttrs=0A=
>   Add a unique ID in the virt machine to be used as device ID=0A=
>=0A=
>  hw/arm/virt.c                          | 26 ++++++++++++++++++++++++++=
=0A=
>  hw/i386/amd_iommu.c                    |  2 +-=0A=
>  hw/i386/intel_iommu.c                  |  2 +-=0A=
>  hw/intc/arm_gicv3_its_common.c         |  2 +-=0A=
>  hw/intc/arm_gicv3_its_kvm.c            |  2 +-=0A=
>  hw/pci-host/gpex.c                     |  6 ++++++=0A=
>  hw/pci/msi.c                           |  2 +-=0A=
>  hw/pci/pci.c                           | 25 +++++++++++++++++++++++++=0A=
>  include/exec/memattrs.h                |  4 ++--=0A=
>  include/hw/arm/virt.h                  |  1 +=0A=
>  include/hw/intc/arm_gicv3_its_common.h |  2 +-=0A=
>  include/hw/pci-host/gpex.h             |  2 ++=0A=
>  include/hw/pci/pci.h                   |  8 ++++++++=0A=
>  kvm-all.c                              |  4 ++--=0A=
>  14 files changed, 78 insertions(+), 10 deletions(-)=0A=
>=0A=
=0A=
