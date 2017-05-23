Received: by 10.103.124.15 with SMTP id x15csp1771586vsc;
        Tue, 23 May 2017 03:47:02 -0700 (PDT)
X-Received: by 10.159.33.166 with SMTP id 35mr14674391uac.129.1495536422732;
        Tue, 23 May 2017 03:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495536422; cv=none;
        d=google.com; s=arc-20160816;
        b=GrLp8KN6IQJ2wEuwoKx5Hfx3pBAj01+UI59HzNeDwtlH26H/TCo/uWluesFRuM4n6o
         0YCLAfjh14dfXoDJ/gdSjwvsw0QEYEiO0oRQczC7RyjRl8T8KjRk1OOEfDSqoGkbdbeB
         LQelD0i875C8QgqiXSRFuDPiz9NyyCFM2QCkJGd43u3jVVoJ4J9gLDulx2jjW4z61IvF
         /vIxNWCBD3W6gaxcj7KCHG9NueQ+N7KJypZN3WiXwdVbRGHPhfaZVN2Dx/JdaxAvT94E
         iUwqlPDELgYm2r+qg96gxbYCXsUhYKfqstikqAPF+ZsnZAQLRZH1gFgGXLvHaJerTBje
         /E8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=zJVCocZYm2jb8Lxtg3Rsa7kdfeL0hnnVueRYRP0SDJo=;
        b=F4UvlEBmucVQQrvsTmQCqLTILtshMXC9ogQSZAvnzQsvcWu8jrp5CHVLEd9LIK3pxd
         Tvn2XNtKr2mfv1bf5Mi1XY4PIS04O/EA2brUVqjfZWIZnNljWCJPt9SKuKgZ24PMkgkf
         Nr5YURtCT1NdK0T3/ESxvEUJ4jWYG4z7fcZhq/pd2KAVsAv2ngmP9iqHLVwesnItKNAB
         /TIa70uiI1zBpHXS2SYqy1Z2cm8mtRqXSbRAdWyA/sTTyJBw7Imm02QQKK8uyevVQoMf
         /Y2AY8kf2metIKqUpCRM0SMB/uJ/02n8yEYbb2FwyXbWRF5SPfMSNgQzMHVbjbvQSeSA
         jrKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j66si8521274uad.63.2017.05.23.03.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 03:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:47569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dD7LC-00012v-75
	for alex.bennee@linaro.org; Tue, 23 May 2017 06:47:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7JR-00006K-FM
	for qemu-devel@nongnu.org; Tue, 23 May 2017 06:45:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7JM-0006Uz-Kz
	for qemu-devel@nongnu.org; Tue, 23 May 2017 06:45:13 -0400
Received: from mail-db5eur01on0070.outbound.protection.outlook.com
	([104.47.2.70]:64576
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dD7JM-0006Qz-7b; Tue, 23 May 2017 06:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zJVCocZYm2jb8Lxtg3Rsa7kdfeL0hnnVueRYRP0SDJo=;
	b=O6rGzyy5xBRj3cgH60CaM2yh1fHofSnIqetgzaNv7VvpciTZoQSiCD8B9FPj0rfk2P25NkSFyWzfm57yJwTGN6XR+zu2zSDOZWuIwmo3ibXBFBKna0kEvMplCzvkggSRNXNK8dHkjb6iZhmX5avf0YNlW0+Y/E43qT+qjAcqcLI=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0807.eurprd04.prod.outlook.com (10.242.253.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 10:45:05 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::38b7:32a7:91:7a23]) by AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::38b7:32a7:91:7a23%17]) with mapi id 15.01.1101.021;
	Tue, 23 May 2017 10:45:03 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH RFC 1/2] Increased the size of requester_id
	field from MemTxAttrs
Thread-Index: AQHSo9qgMKkvftGLU0K0TmwoLXSn7g==
Date: Tue, 23 May 2017 10:45:03 +0000
Message-ID: <AM3PR04MB0616065849157F3DC9EA8E19FFF90@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
	<1490276212-32008-2-git-send-email-diana.craciun@nxp.com>
	<CAFEAcA8s9aR4rbJzd=9-oRashOGvUtSL4xxqbu2M1Cv2YFND7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0807;
	7:QZJucRiW/Sf3IdBBOSzDvJZXCK1gfmtxuCSIaGzjnwpzSwmzRZDCRLtE1zQS9ezflskYInyl2iAx7tOaYELuWWGE8Mw4n7FgBjqfqS5YVXjrWBLaXOrcITuXDQ2Tt4jBJ82SvPQs19tX8THx5BUAkLZnWHnvS/zbPfUP8NqcLvkSlyUOfkN0ktTxXguF7wdkQxY9K/nvXrhuvs3pTNwN7MRijqaA6x+nYlZntUCnLGYv1Cp4HvVhEPfmMC63+1LWsFijAD8SnU33zalsHKZd8S529snC+s1lgW8SSpy3qYZbCq55/WKzaz7q9E4/8ntYO2iMeZZtq7ShFdfRH4cWUA==
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10009020)(6029001)(6009001)(39400400002)(39850400002)(39860400002)(39840400002)(377454003)(24454002)(54906002)(99286003)(9686003)(3660700001)(33656002)(6436002)(53936002)(3280700002)(5660300001)(6506006)(2900100001)(229853002)(76176999)(50986999)(54356999)(6916009)(110136004)(38730400002)(7696004)(189998001)(2906002)(5250100002)(81166006)(8676002)(66066001)(7736002)(74316002)(8936002)(25786009)(478600001)(4326008)(86362001)(305945005)(53546009)(6116002)(3846002)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0807;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-ms-traffictypediagnostic: AM3PR04MB0807:
x-ms-office365-filtering-correlation-id: bc0e03dd-fb8c-4124-354c-08d4a1c8c4d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM3PR04MB0807; 
x-microsoft-antispam-prvs: <AM3PR04MB0807175246624C4CD798AC2AFFF90@AM3PR04MB0807.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:AM3PR04MB0807; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB0807; 
x-forefront-prvs: 0316567485
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2017 10:45:03.2164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0807
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.70
Subject: Re: [Qemu-devel] [PATCH RFC 1/2] Increased the size of requester_id
 field from MemTxAttrs
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
	Mike Caraman <mike.caraman@nxp.com>, qemu-arm <qemu-arm@nongnu.org>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /21qV0t74ANm

On 04/04/2017 03:27 PM, Peter Maydell wrote:=0A=
> On 23 March 2017 at 13:36, Diana Craciun <diana.craciun@nxp.com> wrote:=
=0A=
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
> This name change would be reverting the name change in=0A=
> commit a05f686ff3, which says:=0A=
>     MemTxAttrs.stream_id also renamed to requester_id in order to better=
=0A=
>     reflect semantics of the field.=0A=
>=0A=
> I don't have a strong opinion about the name myself, but flipping=0A=
> backwards and forwards doesn't seem like a great plan :-)=0A=
=0A=
The reason I have changed the name is that the requester_id is a PCI=0A=
related terminology and this patch is extending the usage of that field=0A=
to other devices also. Naming it requester_id might be confusing.=0A=
=0A=
I will shortly send a v2 for the patches, I didn't change the name in=0A=
the v2, but if there are strong opinions regarding this naming, I will=0A=
change it.=0A=
=0A=
Thanks,=0A=
=0A=
Diana=0A=
