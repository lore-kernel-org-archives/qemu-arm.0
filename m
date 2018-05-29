Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3801440wre;
        Tue, 29 May 2018 10:12:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJPkKlCy6t9whUiUSj29SvfgwYtziq0rE+Np9HiyNu9trCu/n23u1OopbRsOWUrkdlFQoA+
X-Received: by 2002:a37:88c1:: with SMTP id k184-v6mr16666427qkd.365.1527613958323;
        Tue, 29 May 2018 10:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527613958; cv=none;
        d=google.com; s=arc-20160816;
        b=Fyj61BKTfIhWDZqXJGHjJrZd8rBAvFESovowYimNltUg7hMg34uxS40wLFMo59LE/R
         sw5XAmdmGkBD69IZHUP0pkw5whLAEkAnElsyCB+6DI2snGT/+oJOeeQQpHgiWJUE0Xu6
         PCZggqOhcGDCj7EfYygqDe13SSOSXCUh6bRoVWqb1yZBuKW9KHrV/QNeJK0JMv5JrLsi
         HnYMrc0IUAN3yzkBpnvI/rBQ7k4eHpkkGvlMeI2zzKBihHHvXiGitZn/xn3YMQr28HUm
         12gu/mtHfzIqCpi6PhbcP0XS/Ttqo+xxcLhnIH0q/7tBiBBRKHoOKPvGnu77IIJccuHD
         wSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=4PBDXEGTvfCiF6nMYcu7aJ+htHShZRxB1qbNLelIvvk=;
        b=ChfDF1aa9tDir584f6daGd7VWjPIwoJS2sCXKpx2x+pU5/tpoWxg3Bh+Cc5/PkYig3
         Sm74DlNH/MetZ/yAIWdGFwh8+bHWLEC8fVzzSL8MxBa5sEQFWtNt9M8P7xYFR23T0+zV
         sx98PjdPMZQ57i3ixLyzNlE+EjSSriGrUgGjYCdbU7fQdDptVd/DoNr6yUFN+lNu7PR4
         2/Qf6LpGEPI/LrLdL0Zaj1opLTVjAiTYj4Ev5z8iXW9xXtTclPNbQb1nVoK0/NbmZXI5
         UCzjh1OayexK46EvUZJZGvdUjHGJi6SuaNq1oTo29bByuQRdwfXVwtTxnW2UA0ePhHzy
         o76g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j32-v6si6671320qtj.47.2018.05.29.10.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 10:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNiAn-0002GY-QF
	for alex.bennee@linaro.org; Tue, 29 May 2018 13:12:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNiAb-0002G9-Lo
	for qemu-arm@nongnu.org; Tue, 29 May 2018 13:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNiAY-000766-FY
	for qemu-arm@nongnu.org; Tue, 29 May 2018 13:12:25 -0400
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:51997)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNiAY-00070L-8i
	for qemu-arm@nongnu.org; Tue, 29 May 2018 13:12:22 -0400
Received: from player693.ha.ovh.net (unknown [10.109.122.81])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 59CF6C32E7
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 19:12:20 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id DDD9C44008E;
	Tue, 29 May 2018 19:12:14 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-6-clg@kaod.org>
	<48fac48c-168d-70b6-5020-1faac584804e@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9849ec14-a8c6-99a6-ac64-5561dd7334fb@kaod.org>
Date: Tue, 29 May 2018 19:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <48fac48c-168d-70b6-5020-1faac584804e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9940570279085640512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheekgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.44
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] slirp/ncsi: add a "Get
 Parameter" response
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3eWOhAcHk9Sy

On 05/29/2018 03:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi C=C3=A9dric,
>=20
> In title: "Get Parameters" (plural)
>=20
> On 05/29/2018 03:28 AM, C=C3=A9dric Le Goater wrote:
>> This is a minimum response to exercise the kernel.
>=20
> This type is mandatory in DMTF Standard v1.0.1 indeed (DSP0222).
>=20
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  slirp/ncsi.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/slirp/ncsi.c b/slirp/ncsi.c
>> index 02d0e9def3e8..f00253641ea4 100644
>> --- a/slirp/ncsi.c
>> +++ b/slirp/ncsi.c
>> @@ -35,6 +35,27 @@ static int ncsi_rsp_handler_gls(struct ncsi_rsp_pkt=
_hdr *rnh)
>>      return 0;
>>  }
>> =20
>> +/* Get Parameter */
>=20
> "Parameters"
>=20
>> +static int ncsi_rsp_handler_gp(struct ncsi_rsp_pkt_hdr *rnh)
>> +{
>> +    struct ncsi_rsp_gp_pkt *rsp =3D (struct ncsi_rsp_gp_pkt *) rnh;
>> +
>> +    rsp->mac_cnt =3D 0x0;
>=20
> "MAC Address Count: The number of MAC addresses supported by the channe=
l"
>=20
> 0 means "no [MAC Address] filter [in use]"
>=20
>> +    rsp->mac_enable =3D 0x0;
>=20
> "MAC Address Flags: all [MAC Address filters] disabled" ...
>=20
>> +
>> +    /* TODO: provide the guest configured MAC */
>> +    rsp->mac[0] =3D 0xaa;
>> +    rsp->mac[1] =3D 0xbb;
>> +    rsp->mac[2] =3D 0xcc;
>> +    rsp->mac[3] =3D 0xdd;
>> +    rsp->mac[4] =3D 0xee;
>> +    rsp->mac[5] =3D 0xff;
>=20
> So there is no need to set this filter,
> or you have to set:
>=20
>     rsp->mac_cnt =3D 1;
>     rsp->mac_enable =3D 1 << 0;
>=20
> Also, you forgot to set:
>=20
>     rsp->vlan_cnt =3D 0;
>     rsp->vlan_enable =3D 0;


yes. I will clean up the handler.

Thanks,

C.

>> +
>> +    /* more data follows */
>> +
>> +    return 0;
>> +}
>> +
>>  static const struct ncsi_rsp_handler {
>>          unsigned char   type;
>>          int             payload;
>> @@ -62,7 +83,7 @@ static const struct ncsi_rsp_handler {
>>          { NCSI_PKT_RSP_SNFC,    4, NULL },
>>          { NCSI_PKT_RSP_GVI,    40, NULL },
>>          { NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc },
>> -        { NCSI_PKT_RSP_GP,     -1, NULL },
>> +        { NCSI_PKT_RSP_GP,     40, ncsi_rsp_handler_gp },
>>          { NCSI_PKT_RSP_GCPS,  172, NULL },
>>          { NCSI_PKT_RSP_GNS,   172, NULL },
>>          { NCSI_PKT_RSP_GNPTS, 172, NULL },
>>

