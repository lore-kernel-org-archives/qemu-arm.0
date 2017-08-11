Received: by 10.25.221.202 with SMTP id w71csp970291lfi;
        Fri, 11 Aug 2017 07:38:31 -0700 (PDT)
X-Received: by 10.200.53.17 with SMTP id y17mr21741171qtb.207.1502462310967;
        Fri, 11 Aug 2017 07:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462310; cv=none;
        d=google.com; s=arc-20160816;
        b=GXfcFYqNf60FyqLoDclMc6WIuouui3tKt1fzvUcex+QzpKD93MTlou2rU9hBbqelkR
         lOzBrxUBN54gptPj7sYBAGFVwBIrN6bIxCIIxaS8YBBax5D7Daqwz39Xl7bXlw2sEGpA
         +3uuvtIH8Y2+zup3vhNBAHpVp+UkNlKjVbEMjsSyTovwUSuhJXuBgA5U4u7pXIaE6+fv
         Db770XSQoVByNw73V9bzQQYqab2oWgz04psFQfQcZ/HvsT9wOYU2oNRhtsFEqvM3zgql
         bwKkKlFETlzAiLy/Y5ohnS1NIhAz1xs7MXMDT9kHHiILP7QrsRMBBasyYgk4iZmtwexa
         ENCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=9k8gUOJ4PWncFopyMkIh1e2SfUnh7lIBUEtHWHeQvuM=;
        b=QJoCOiB1NaRSyCQQ5SV/nXMQbJvw7O8981tTRA3S6XuWDAILoqznuAn24fwTioDZLt
         iZzMXeyuHuOwx7yyzy95zqDQOH4SZCVLhAek/7NKU+5QwTKYnZyco1Gu2trKQMOHiTG7
         dL4V0j3k1hBdH63LiBE+mrBwBE/5Hd9ciTekjksOUeT53uYMSD+4CpEXKI0M8LkO1+gT
         GFy7UwTO7k7U4K0UPDj6ZZ6pV3GPadBOlFzjHsEPG8D4AUgpUPJ2U06JD6RuRsCJWs/u
         3trzOudSThmgKrDYQQJ3bBeotYPkOm8XqM09uuZchYLV3XU4aBEfYMkn0UIiesBR7TTl
         89GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=v94TeFFt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si898915qtg.455.2017.08.11.07.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=v94TeFFt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:44842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB52-0004hm-5f
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dgAzH-0008LY-Jm
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dgAzG-0006OI-GB
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:32:31 -0400
Received: from mail-ve1eur01on0043.outbound.protection.outlook.com
	([104.47.1.43]:11168
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dgAzA-0006Mw-M7; Fri, 11 Aug 2017 10:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9k8gUOJ4PWncFopyMkIh1e2SfUnh7lIBUEtHWHeQvuM=;
	b=v94TeFFtvBxWemt4IQRG8n5Whi5930AzdkKf+GIrzg6Q/9P3LHF8uR/Cj0qJXQs0BNZNrzdB+hZTeSGMnV6DsiA5Ld9HWtJAzetSHoEe13W2glbWkTvhKfCXmpcn7CUSJFKttW8JtpMz3sy91rSHrpX+/S7ePkQyWFbvjQ9zgRI=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0806.eurprd04.prod.outlook.com (10.242.253.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.17; Fri, 11 Aug 2017 14:32:22 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb%14]) with mapi id 15.01.1341.019;
	Fri, 11 Aug 2017 14:32:21 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 1/2] Increased the size of requester_id
	field from MemTxAttrs
Thread-Index: AQHS07WNuEqtEroxdEC9jZ/8jBjQOQ==
Date: Fri, 11 Aug 2017 14:32:21 +0000
Message-ID: <AM3PR04MB0616F921434F49926CA6213DFF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-2-git-send-email-diana.craciun@nxp.com>
	<17ae81be-a86e-d0ab-de93-046846e0b7d2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0806;
	6:yYoV4+DYCyAz6h6OJXKjUTZhR2BSu+SpC6Q5XYqa9p8xjH0NYX3+079F6JI2KNeT4lqyFUUEvjEJo+KfJ/O1D5PmCtvt8ILYQhYsUcbHEV9r9Gz0vcklO0QOnzw1ZGtvp/8Tp1xKOPlIrKUFasxB7PaC6YCF7qqGYqZqG4RBOjT8FPnm31hlE1QKotKvxRL2YZ42+TuKQej0s13mcXrNtGIOg5uRElQ4/tWCwdq5Y49QADH/lDDcofaVwRmY/CJE+MsKTsBTSTz4kDxKgxePwKJzhSOvQ/UdaXmqDH9XG9xVPCv63IDRa5dq5GySXRXfugc+ktaszxugnGTRyYwiAA==;
	5:w+fIjpMcbHxggzAcFY/11rd2QxkG9P++V5GGjQ3hHPSZuHwA91esnZt6YEQ6KuFBAyzo/I+NsvGv+0A0yjPPeR20EU27LfhRIwDhrd9eg91/X7PP5cPbjnVatTAV0IPCQjEfTDlbf8/EPYoljEYqZg==;
	24:12o4gX0nmd8xn2o3TZjoUYf5Hz2y/rk+JhdjqdcUtpaTFPw2yc0B2Z34pKzOPueYG8pFIw//X4TnZSQ97xr4qGQkvo3Ey5FWKYT3fccPqzw=;
	7:k+vqgn1isb4a/6AWhipJYJ8Al0+TVH83P48fh9gaI09KXIr4TA9KKYVp7W44h1cSKmvMuwdzW036m2DppFvrFAwanLyU78PBIGr/BakxkamRmGUFBFHKqwqhsJQDjg6Cp6foH+f2rVXrmVjVyo8LCo3xkT9X4e7QMBnXf8NIjAWqXQK9/lijYkAUIFaHPtBvgJQdOjEeICfzppDRnSlebvhsbiFoMEc8E2N5fIx+tIA=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6029001)(6009001)(39860400002)(199003)(189002)(377454003)(24454002)(2900100001)(54906002)(14454004)(99286003)(105586002)(55016002)(101416001)(106356001)(6436002)(50986999)(76176999)(54356999)(9686003)(2906002)(5250100002)(6506006)(2501003)(7736002)(229853002)(189998001)(305945005)(66066001)(81156014)(8676002)(81166006)(8936002)(7696004)(3660700001)(33656002)(478600001)(102836003)(3846002)(5660300001)(6116002)(4326008)(97736004)(53546010)(6246003)(25786009)(3280700002)(53936002)(68736007)(74316002)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0806;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 813d7555-a7eb-4b8d-e133-08d4e0c5c6dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0806; 
x-ms-traffictypediagnostic: AM3PR04MB0806:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <AM3PR04MB080642256CA4353F52DCBA06FF890@AM3PR04MB0806.eurprd04.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2017 14:32:21.4245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0806
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.43
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] Increased the size of
 requester_id field from MemTxAttrs
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
Cc: "mst@redhat.com" <mst@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +E0GrA624xgw

Hi Eric,=0A=
=0A=
On 07/26/2017 03:23 PM, Auger Eric wrote:=0A=
> Hi Diana,=0A=
> On 23/05/2017 13:12, Diana Craciun wrote:=0A=
>> The PCI requester ID field is 16 bits. The requester_id field=0A=
>> from MemTxAttrs is used for MSIs to specify the device ID for=0A=
>> the platforms where this device ID is needed (e.g virt machine + GICv3=
=0A=
>> ITS). However, if more entities that uses MSIs in the system are used,=
=0A=
>> 16 bit is no longer enough to represent the device ID. Increased the siz=
e=0A=
>> of this field to 24 bits in order to accomodate 256 entities.=0A=
>> Also the name requester_id does no longer reflect the content, so=0A=
>> the name was changed to stream_id.=0A=
> I think both deviceid and streamid can be up to 32 bits in theory.=0A=
=0A=
Yes, both of them can be up to 32 bit. I can extend the field to 32 bit.=0A=
=0A=
>=0A=
> With respect to the renaming, stream_id really is ARM specific and=0A=
> corresponds to the ID space before the SMMU while you mostly address=0A=
> device id problematics here (ie. space id input to the interrupt=0A=
> controller). Maybe a more generic terminology such as originator id=0A=
> could be used or source id (I think this is Intel terminology though).=0A=
=0A=
I agree, originator id sounds good and so far it doesn't seem to overlap=0A=
to other specific terminology.=0A=
=0A=
>=0A=
> Maybe the changes in semantics of the field should be=0A=
> associated/combined with its new computation found in next patch? see=0A=
> comments in subsequent patch.=0A=
=0A=
I agree.=0A=
=0A=
Thanks,=0A=
=0A=
Diana=0A=
=0A=
=0A=
