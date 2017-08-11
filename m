Received: by 10.25.221.202 with SMTP id w71csp969372lfi;
        Fri, 11 Aug 2017 07:37:40 -0700 (PDT)
X-Received: by 10.55.79.209 with SMTP id d200mr20791350qkb.336.1502462259903;
        Fri, 11 Aug 2017 07:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462259; cv=none;
        d=google.com; s=arc-20160816;
        b=psmTPd6sKhrnlqqAsl9gM7KytcIsq0GcamIqPXfNMDbc3UndO+K6BFm3QZGqqqxFHi
         xQ256WnyLwojNOafqhn2q5b0bciybw5+5EtAiIa3VYMe5jVZ+GUGCTPtXA68IlGvvdRy
         lT76FYVvy1b6Hhzdi9Asyravrc3GiEatAofgEsaXkg+VZjVbG2gUv3YXdvVyWqQP6jBe
         VdH4EUrKX0ne/mWzpzP1QLlAVQDUWhkOp4sqKU0yYQxNDuDalURzQ/SNFG+5Ni0TDXOy
         GmqrK6MvULNgVgYsrKq+ORlggcazsAv7dAXtWPQVkUx4Lt8UMm6A4yTjhs7WL2yi+6Mt
         r14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=QfJr2oegcqxKEg+E5CU2JHxQza1lWkf6JMa8Hx7RjJs=;
        b=oQv9r1wGYaAP4jaoEyQSzER+++otGgsKnuk2+i9rC1SNKI0oQmzoJiWWskH2eFEA1Z
         xsqxYauz4YZgHEUZbJRVU22+Efr+xzYMpZOePqhWHQ/pAz39BcV/4xO2TiEQWyJ3HWjc
         jspuBTYWqYNfJU0W+rgSpOCXYhQr/9mE4YS2ckTAsX3R5Wx/tTpDecywbnr1F9RvIlmY
         F1uqF9/tjOqv9sQpwtrTYWT1kjHbm/46T0mTxm1ORJnfWcAmDDB62nUYrHmtUUBdNBn/
         V7bWYgmCzpaRgznbTkjy80BfAunmlyJdvvHS/NEXh6OzWuvsf2NYkKje55pVHWP3btoO
         UaNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=Ho9I1L1+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w73si898480qka.350.2017.08.11.07.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=Ho9I1L1+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:44828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB4D-0003XU-2p
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dgAyp-00082Q-Cr
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dgAyk-0006I2-UA
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:32:03 -0400
Received: from mail-db5eur01on0076.outbound.protection.outlook.com
	([104.47.2.76]:23040
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dgAyk-0006HQ-Cy; Fri, 11 Aug 2017 10:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QfJr2oegcqxKEg+E5CU2JHxQza1lWkf6JMa8Hx7RjJs=;
	b=Ho9I1L1+NBVbljhPKipDOVosOs50RZIoiOuI5ElAsmKZmlaTIfepOggia8J9aYNVxvWsuCFNk4kvu2krdDSmv89t0AcTzuCcxPbDt39HgzSXo4pvdMx5jolpUnUZU4sktF/jwQPlfdAEE1wDBleNqMulWACl2/w0XJFpGkOTch0=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0806.eurprd04.prod.outlook.com (10.242.253.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.17; Fri, 11 Aug 2017 14:31:54 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb%14]) with mapi id 15.01.1341.019;
	Fri, 11 Aug 2017 14:31:52 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH v2 0/2] Add global device ID in virt machine
Thread-Index: AQHS07WHLIdRw36YjE2WVULSPv0RNA==
Date: Fri, 11 Aug 2017 14:31:52 +0000
Message-ID: <AM3PR04MB06161BD9424CFE152E88E3BDFF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170706023845-mutt-send-email-mst@kernel.org>
	<AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170731170217-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061656F255D688500AC8622BFFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170801045857-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0806;
	6:MjwzuTgQnp9o8xBnkhXjXkS6eG67puzO5SUK5rZR0AVf9yDjYo+HCEBzRljKpxUE5Xt0lNmAdsvtg/OiaXzn32XSxLTpeFnh0DDapZSvG08U7l9HG1qGKaW4HP83DHYWbgquiGfr4cPIXMOZv5N0ukSyhENv/kdnAbftlB19FP6sIrJ6aUbdccUW9f0E2x7qkgYpFaPU9HzWjIpR2XPhzqsOSsKwIWUWwUTP9yHuObzMokVGcO4ne0ZHAhquU4j7QVTGDvsnE3FSE8OYPzrjB0HSGPgSskpP78umVnJnlDsfHtSoF6hijD9wgIqYNgBnEfmpfsYm9RgX3WPEXO9wQg==;
	5:64HgJ2O2Ny6oTVTfhQ/OlnTopqMBK22HRIV7SP6fanNymLGmhtUtneDp27zYx46I0CzVqZa1mvfL+UN6n8imvHy4f1V0b52XTwVAPWf5rESgeTa/nU9KRyyjpAA8OYphZIZHb6FeMg+3ruYclRBIzw==;
	24:/LMWLphE97/oRmOqXj0/EslDQQZMcf0wNLuAENRnyYYjopM0TkfRKmVjXc77a3rrnLDpdMob7PZ5OdaSphQzOrY2BUYQCbm5HBfB+mePI2s=;
	7:wEa3rCTjXShg7muDwxlQDdV1+AJyGSCiwgAOF965gYd6miTzLYNeD9fZj2ZWAobE5qi8zO7HWxB7DBRLaxXaBCqyFv3f577r1le7JDFacjlvcSmmHvOSr4gxn4JfcS84pk4CgkxxEOd8U/6T9X4EBhp/G88+vI3C+WwRMXYG+v1m3NJhfr3xHoHUfYbN1vt5OkhxqyfskNP+Qb47DXHtdKx/TBUUjRVRSMTiYq4OIjI=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(199003)(189002)(377454003)(24454002)(2900100001)(54906002)(14454004)(99286003)(105586002)(55016002)(101416001)(106356001)(6436002)(50986999)(76176999)(54356999)(9686003)(2906002)(6306002)(5250100002)(93886004)(6506006)(7736002)(229853002)(189998001)(305945005)(66066001)(81156014)(8676002)(81166006)(8936002)(7696004)(3660700001)(33656002)(478600001)(102836003)(3846002)(5660300001)(6116002)(4326008)(6916009)(97736004)(53546010)(6246003)(110136004)(25786009)(3280700002)(45080400002)(53936002)(68736007)(74316002)(86362001)(575784001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0806;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 3205f3b1-f5bb-469d-9392-08d4e0c5b581
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0806; 
x-ms-traffictypediagnostic: AM3PR04MB0806:
x-exchange-antispam-report-test: UriScan:(189930954265078)(45079756050767);
x-microsoft-antispam-prvs: <AM3PR04MB080666E356A1545CADE5C6C1FF890@AM3PR04MB0806.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR04MB0806; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR04MB0806; 
x-forefront-prvs: 03965EFC76
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2017 14:31:52.3188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0806
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.76
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
X-TUID: DdeKS4NKqVYK

On 08/01/2017 05:05 AM, Michael S. Tsirkin wrote:=0A=
> On Mon, Jul 31, 2017 at 03:13:09PM +0000, Diana Madalina Craciun wrote:=
=0A=
>> On 07/31/2017 05:06 PM, Michael S. Tsirkin wrote:=0A=
>>> On Mon, Jul 31, 2017 at 01:22:45PM +0000, Diana Madalina Craciun wrote:=
=0A=
>>>>>> If we are to use a value of 0 for the constant in case of PCI device=
s,=0A=
>>>>>> what happens if we have multiple PCI controllers?=0A=
>>>>> I guess we'd use the PCI Segment number for that?=0A=
>>>>>=0A=
>>>>>=0A=
>>>> Yes, we can use the PCI segment for this scenario. But this would mean=
=0A=
>>>> different solutions for the same problem. The main problem is that we=
=0A=
>>>> can have multiple entities in the system that are using MSIs (for now=
=0A=
>>>> PCI and NXP non-PCI bus infrastructure=0A=
>>>> (https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lwn.net%2FArticles%2F635905%2F&data=3D01%7C01%7Cdiana.craciun%40nxp.com%7C6=
b0c6c879af64718a21908d4d81d534e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdat=
a=3DbpYMMqajWzgzdbdQgy%2FUYR7y%2BswyvwE%2BqFzs7wdIkkA%3D&reserved=3D0). I g=
uess that we may have other=0A=
>>>> platform devices that are using MSIs in the future.=0A=
>>>>=0A=
>>>> Thanks,=0A=
>>>> Diana=0A=
>>>>=0A=
>>>>=0A=
>>> Don't have the time to explore NXP in depth, sorry - there's=0A=
>>> a lot of complexity there.=0A=
>>> Could you maybe stick some bits to specify bus type in there?=0A=
>>> It just looks very wrong to push low level things like this=0A=
>>> that users have no interest in up the stack.=0A=
>>>=0A=
>> Let's generalize the problem a little bit, the NXP details just does not=
=0A=
>> matter much. The problem we have is the following:=0A=
>>=0A=
>> The GIC-ITS, the ARM MSI controller is using deviceIDs in order to remap=
=0A=
>> the interrupts. Each device which is expected to send MSIs has a=0A=
>> deviceID associated with it. These deviceIDs are configured into devices=
=0A=
>> by software/firmware. There is support in the device tree to specify the=
=0A=
>> correlation between requesterID and deviceID:=0A=
>>=0A=
>> "msi-map: Maps a Requester ID to an MSI controller and associated=0A=
>>   msi-specifier data. The property is an arbitrary number of tuples of=
=0A=
>>   (rid-base,msi-controller,msi-base,length)"=0A=
>> (https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftr=
ee%2FDocumentation%2Fdevicetree%2Fbindings%2Fpci%2Fpci-msi.txt&data=3D01%7C=
01%7Cdiana.craciun%40nxp.com%7C259982f3a83b4160083708d4d881d48a%7C686ea1d3b=
c2b4c6fa92cd99c5c301635%7C0&sdata=3DQSRwrYcsTk9%2FgekD0YBYKvpWv05%2BXKiH2ab=
Pp%2FtHpes%3D&reserved=3D0)=0A=
>>=0A=
>> Our problem is that we have to allocate these deviceIDs in QEMU as well=
=0A=
>> and we have to ensure that they are unique. Currently, for PCI, the=0A=
>> assumption requesterID=3DdeviceID is made which will no longer be true i=
n=0A=
>> case other devices are added. So we need a way (preferable a general=0A=
>> one) to allocate these IDs to different devices in the system in a=0A=
>> consistent way which will ensure that two devices do not share the same =
ID.=0A=
> My question would be, do other types of devices that are there=0A=
> right now have some kind of ID like the requester ID?=0A=
> If so I would say just use that, and set high bits in the device ID=0A=
> to specify the type (e.g. 00 for pci, etc).=0A=
=0A=
Would this mean extending the PCI requesterID usage as well? Or assume=0A=
that it's 00 for PCI and no changes are needed? I understand that with=0A=
this approach the allocation is  static: 00 for PCI, 01 for device type=0A=
X, etc., so the situation when we have multiple controllers (PCI or=0A=
whatever other devices) has to be solved differently. Wouldn't be this=0A=
more complex?=0A=
=0A=
>=0A=
>=0A=
> IMHO if possible that is preferable to pushing this up to users.=0A=
>=0A=
>=0A=
>> The reason I put this ID into the controller itself is because on real=
=0A=
>> hardware is actually programmed into the controller. It is needed (for=
=0A=
>> example) when the MSIs are sent.=0A=
>>=0A=
>> Thanks,=0A=
>>=0A=
>> Diana=0A=
>>=0A=
> IIUC what happens on real hardware is controller maps each requester ID=
=0A=
> (or presumably other source ID in the request) to the device ID,=0A=
> and the mapping is internal to controller.=0A=
> If you wanted a lot of flexibility then looks like you could pass this=0A=
> mapping to controllers, but is it really necessary?=0A=
> Why don't we build a mapping that's convenient for us?=0A=
>=0A=
>=0A=
Thanks,=0A=
=0A=
Diana=0A=
=0A=
