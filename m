Received: by 10.25.44.15 with SMTP id s15csp3725845lfs;
        Mon, 31 Jul 2017 08:15:56 -0700 (PDT)
X-Received: by 10.55.181.196 with SMTP id e187mr4677182qkf.314.1501514156578;
        Mon, 31 Jul 2017 08:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501514156; cv=none;
        d=google.com; s=arc-20160816;
        b=UFc13PZ+Jjtd9Io69WfSxn+lkrKje1KvP2kC6WGGBIY5HWNl19SQtymS6hDHHG/x7R
         gicTRuz2s4CHl1qe68MEB5MyC+OpB3dx27UHfBiNx+daDoQ4GN2YqEFIfRd96trNN6KU
         NtviZpqHnsjutISfoSKOQ1GaXLQn2luoQKEdwctb3ovlvyZg4K2xq+D/Fe4E8YRPBRNW
         MSHEbD0aXidTUisLnikXnWioPP1lMjSQltz75fElYD4qtISSewVeRIvhQzmISPnAK1EV
         NHwlEyiYpa60ABZCK+bKQfcJDm8raFhWvXOG8Hbytac/oBZqThY6GsaUVeOZfmjn5Hk5
         56sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=t2A/8iFnFGWxoSVTuwE2ujRp+ehq3U1PFaFGq9YwkdI=;
        b=zydlCpIQZIvXgNP8troxVddRg3FOlqEVWAC3oBSdhzyJfn6/Rxp6j8cDtTJUAJU78T
         vsoal44CYmFGABRT2X9FaA0vkwPfcjpIWYqt6UYgaIDZTJrkcjwUpt7P1EeMsOcFazRm
         lfhyr8ButFvVBk/aCLXza3cLiWhc4V1LK4ssJilVYYLC6dZAE3/cux22vuPOO05Au9QV
         oND+EdkdN7nmuZOXFwoCfkdcgbO+wN+Fi6fn8hp8v/YZpoalv2V5KaP5nafnDDE/XBYY
         UJlJzpFTZF8xvTq3X0if2TdYLCa09cqD4Q4iuiSQYJJojzsa2RRyzASWxZxtVZpavJhM
         4glg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=lNR5XYKS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x36si15338432qtd.435.2017.07.31.08.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 08:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=lNR5XYKS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:60056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcCQD-00007K-Rm
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 11:15:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dcCNk-0006i1-1S
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 11:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dcCNd-0001Ce-RE
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 11:13:20 -0400
Received: from mail-he1eur01on0050.outbound.protection.outlook.com
	([104.47.0.50]:57264
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dcCNd-0001Bg-8j; Mon, 31 Jul 2017 11:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=t2A/8iFnFGWxoSVTuwE2ujRp+ehq3U1PFaFGq9YwkdI=;
	b=lNR5XYKS7ToK6uIv6FzNS8EaDp3Bl2l2+f3b339LsapMP3b/1EsnVFpyiRStV0pE9k+CIl5PBlRU447PJpf0NkfHasuzvOkDX++utOd3DSuWKTAW3t0FMv0szPB5MgnfHWWJPT+qzucy20+FeHC3i43KTWxm8hg9PV8oNU9bZJs=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0808.eurprd04.prod.outlook.com (10.242.253.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Mon, 31 Jul 2017 15:13:10 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb%14]) with mapi id 15.01.1304.023;
	Mon, 31 Jul 2017 15:13:09 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WHLIdRw36YjE2WVULSPv0RNA==
Date: Mon, 31 Jul 2017 15:13:09 +0000
Message-ID: <AM3PR04MB061656F255D688500AC8622BFFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170706023845-mutt-send-email-mst@kernel.org>
	<AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170731170217-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0808;
	7:Wu2Lg/KOcpEKdEGZKKYUJUoTrIOvRcvkAjBbhwd13VG/gCzQYblTgTEi8llbnfZ6zP1Z3LfbfRWKlzSNgEMjCmqIjv7EBEBr/n4r6Ru5pOpTy3uYkPjPsaxiO+7n0khbxpPmTYd3mD6/jQu9wFWThDujRjsa5b6O35G7IXxiWGZW8BF6yK4tZO1PbfIQ4lAOkUNpr6xXu+bYUODR1k7OB96KYloCe1y0llNxnJUUtr95IxpGjR7Fa1unrpQ2zNYpqiZrdLQ+eHxtu1NchvTkYIyb2Hk1i5o+HHNZ31DQRaIXwYr8dIacaA3bvKWJi6Boa1pArURHplJ9b8fMRLFc3XWp3Nvc0O4AyvFyb7ry+W9MLtBvHl9GaChnpt9SXLn013TMw/LFARYhx62aKk7EM0UFqYe46XdZfFT4LRACJB4Fhb5zlUr3CO7mePFG1oHqWKwoDjhZlU8Y4moQr38Uv44BXLqFO27PYpKHZQmmEAitLP1t+bSYenm7YaCV+d3x+tX3NlfLtqOX71Y5cjRidjeFym2KPM43rlUyZoGplWxLW9w0iXGFL+RudtIUTglaLvWB5Dyb5oxQmp2WiYRDCefHODeTh66i8ODfn49a21iVIUpe4Y+2kg5Th6fgtwzABmBaIHNjMbqE3J2765lPG9CzyngY6tqbNUwz31802shTgdLi7iOJrXpY1WMX5PCC5xdXyHmYW5tjvkuVukKkyqpg4ItcymVkCEJvzLWNzZDT2Vb/4BtHB+BlIoM1EsuK07zdSm9/tK3qKD2m0t8YYNHC/jFbJO+Fs2U/IuOIhHE=
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(39400400002)(39410400002)(39850400002)(39840400002)(39450400003)(39860400002)(24454002)(377454003)(189002)(199003)(7736002)(93886004)(38730400002)(110136004)(305945005)(86362001)(3660700001)(189998001)(74316002)(4326008)(50986999)(14454004)(33656002)(2906002)(53546010)(5660300001)(54356999)(76176999)(3280700002)(575784001)(101416001)(7696004)(97736004)(9686003)(45080400002)(229853002)(478600001)(3846002)(102836003)(105586002)(54906002)(55016002)(68736007)(6306002)(106356001)(6506006)(6116002)(6246003)(53936002)(99286003)(6436002)(25786009)(81166006)(8676002)(8936002)(66066001)(2900100001)(6916009)(81156014)(5250100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0808;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 98feede9-2aa8-41a2-ffff-08d4d826a76c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0808; 
x-ms-traffictypediagnostic: AM3PR04MB0808:
x-exchange-antispam-report-test: UriScan:(189930954265078)(84791874153150)(45079756050767); 
x-microsoft-antispam-prvs: <AM3PR04MB0808A7CCD3749021A9DDEC8FFFB20@AM3PR04MB0808.eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2017 15:13:09.3946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0808
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.50
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>, Laurentiu
	Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wIYN1wnRHm2r

On 07/31/2017 05:06 PM, Michael S. Tsirkin wrote:=0A=
> On Mon, Jul 31, 2017 at 01:22:45PM +0000, Diana Madalina Craciun wrote:=
=0A=
>>>> If we are to use a value of 0 for the constant in case of PCI devices,=
=0A=
>>>> what happens if we have multiple PCI controllers?=0A=
>>> I guess we'd use the PCI Segment number for that?=0A=
>>>=0A=
>>>=0A=
>> Yes, we can use the PCI segment for this scenario. But this would mean=
=0A=
>> different solutions for the same problem. The main problem is that we=0A=
>> can have multiple entities in the system that are using MSIs (for now=0A=
>> PCI and NXP non-PCI bus infrastructure=0A=
>> (https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flw=
n.net%2FArticles%2F635905%2F&data=3D01%7C01%7Cdiana.craciun%40nxp.com%7C6b0=
c6c879af64718a21908d4d81d534e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=
=3DbpYMMqajWzgzdbdQgy%2FUYR7y%2BswyvwE%2BqFzs7wdIkkA%3D&reserved=3D0). I gu=
ess that we may have other=0A=
>> platform devices that are using MSIs in the future.=0A=
>>=0A=
>> Thanks,=0A=
>> Diana=0A=
>>=0A=
>>=0A=
> Don't have the time to explore NXP in depth, sorry - there's=0A=
> a lot of complexity there.=0A=
> Could you maybe stick some bits to specify bus type in there?=0A=
> It just looks very wrong to push low level things like this=0A=
> that users have no interest in up the stack.=0A=
>=0A=
Let's generalize the problem a little bit, the NXP details just does not=0A=
matter much. The problem we have is the following:=0A=
=0A=
The GIC-ITS, the ARM MSI controller is using deviceIDs in order to remap=0A=
the interrupts. Each device which is expected to send MSIs has a=0A=
deviceID associated with it. These deviceIDs are configured into devices=0A=
by software/firmware. There is support in the device tree to specify the=0A=
correlation between requesterID and deviceID:=0A=
=0A=
"msi-map: Maps a Requester ID to an MSI controller and associated=0A=
  msi-specifier data. The property is an arbitrary number of tuples of=0A=
  (rid-base,msi-controller,msi-base,length)"=0A=
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/devicetree/bindings/pci/pci-msi.txt)=0A=
=0A=
Our problem is that we have to allocate these deviceIDs in QEMU as well=0A=
and we have to ensure that they are unique. Currently, for PCI, the=0A=
assumption requesterID=3DdeviceID is made which will no longer be true in=
=0A=
case other devices are added. So we need a way (preferable a general=0A=
one) to allocate these IDs to different devices in the system in a=0A=
consistent way which will ensure that two devices do not share the same ID.=
=0A=
=0A=
The reason I put this ID into the controller itself is because on real=0A=
hardware is actually programmed into the controller. It is needed (for=0A=
example) when the MSIs are sent.=0A=
=0A=
Thanks,=0A=
=0A=
Diana=0A=
=0A=
=0A=
