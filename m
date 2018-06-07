Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2106128wrq;
        Thu, 7 Jun 2018 06:31:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJMBO7BMGhlhVNoVqTR5yYa0OPO99M99mXwPKs3+myGpd4EY0yDnFEN6HAOXFtk2A8R469U
X-Received: by 2002:a37:2999:: with SMTP id p25-v6mr1478328qkp.61.1528378260483;
        Thu, 07 Jun 2018 06:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528378260; cv=none;
        d=google.com; s=arc-20160816;
        b=n+mEHgFsMu/GQQiuy46Jc7Q7tNk4ZwXXS4WWHUbgS6htOwSridTnj8Bs+pZcrhwfbq
         lgoIIbN1jYb43empVjWtqg7mf9o6bz8C5vi64hVRPfETo303PMc/aE21WdmRlLyHwD5A
         U0ebqMVSC4GC4LGPq9WkVRP8fybe+vJIJVhLQrc0/zl+9GW6Ga+C3CLuTcKVI6maz5Rj
         I84ny386Ueymqka+aigv4j7Pwm0OGUTpS6s6Tjdtaet94OfmHoPvKRxxmaXNCYITqIeR
         xhMB67MH/WFDAudcLeDy8yfl/DZ2hHG8pZMDDWgOgaX8VUu4vDWpkTTv2+wQUBzI2sLA
         EbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=cIa8hH1oGHApZCVEDRwRig+WdGVzq7/KjgNiCRjJSVw=;
        b=aiFXwdNN4+y129VbnHM4JkS3Bf0SylT2tV94HbbqtY0wjnPqRnk8ZJJ6EXCv5xrNRn
         ZPp5CXj+M97CdrhI9PauQeMwGcnDpbREVu7j4LusvHNuTQyl4C4B3f/AwfU+ZP0r6Bgb
         GZqADhPS/QjJGbSzeo//oelXdBAyKrWVBYPH5WL7M4AyqRgiDnP2aF1pghAsuORnUCjB
         NWb7WEYnUypSOIavrxVdSzHG9IcQNnwWU+YGtMG6j4DQO25wrM38TuGC/VU9rmm4Aip3
         /aNsC57RxcDOan1IStmoIRQdbAaWWk6EO2D/qfFxVSKCIZqEkaWjNP8FE7uWPn7XR+tw
         FuNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m63-v6si2605714qte.200.2018.06.07.06.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 06:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQv0F-0004m9-W5
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 09:31:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fQuzy-0004jn-EL
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fQuzu-0001CP-B6
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:30:42 -0400
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:45994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fQuzu-00011r-43
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:30:38 -0400
Received: from player796.ha.ovh.net (unknown [10.109.105.52])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 43A8C13BDF6
	for <qemu-arm@nongnu.org>; Thu,  7 Jun 2018 15:30:28 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 025115C00B9;
	Thu,  7 Jun 2018 15:30:22 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180530061711.23673-1-clg@kaod.org>
	<20180530061711.23673-3-clg@kaod.org>
	<CAFEAcA-=ViCUNBj3H6q0h-=k5ROG=RKy50TRFVd_9aNPiu7Fdw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e9021749-fcb8-a9d3-1cdd-396bc7d68fc2@kaod.org>
Date: Thu, 7 Jun 2018 15:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-=ViCUNBj3H6q0h-=k5ROG=RKy50TRFVd_9aNPiu7Fdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3707306920590478276
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrjeejgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.52.147
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/4] ftgmac100: add IEEE
 802.1Q VLAN support
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzfBIv8EOT97

On 06/07/2018 02:41 PM, Peter Maydell wrote:
> On 30 May 2018 at 07:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
>> has a control to remove VLAN tags from received packets.
>>
>> The VLAN control bits and VLAN tag information are contained in the
>> second word of the transmit and receive descriptors. The Insert VLAN
>> bit and the VLAN Tag available bit are only valid in the first segment
>> of the packet.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
>> +        /* Check for VLAN */
>> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
>> +            bd.des1 & FTGMAC100_TXDES1_INS_VLANTAG &&
>> +            be16_to_cpu(PKT_GET_ETH_HDR(ptr)->h_proto) !=3D ETH_P_VLA=
N) {
>=20
> This is kind of bogus because there's no guarantee that h_proto here
> is sufficiently aligned to do a halfword load. However this is
> a problem common to all the PKT_GET_* macros so we should probably
> attack it separately to this series.
>=20
> Getting the ethernet h_proto field seems common enough that
> something like
>=20
> static inline uint16_t eth_get_proto(uint8_t *pkt)
> {
>     return lduw_be_p(&PKT_GET_ETH_HDR(pkt)->h_proto);
> }
>=20
> would be handy in eth.h.

yes. There are a few candidates :

hw/net/virtio-net.c:        int vid =3D lduw_be_p(ptr + 14) & 0xfff;
hw/net/e1000e_core.c:        uint16_t vid =3D lduw_be_p(buf + 14);
hw/net/rtl8139.c:            lduw_be_p(&buf[ETH_ALEN * 2]) =3D=3D ETH_P_V=
LAN) {
hw/net/e1000x_common.c:    uint16_t eth_proto =3D lduw_be_p(buf + 12);
hw/net/e1000.c:        uint16_t vid =3D lduw_be_p(buf + 14);
hw/net/e1000.c:        vlan_special =3D cpu_to_le16(lduw_be_p(filter_buf =
+ 14));

Thanks,

C.=20

> Anyway, I've applied this series to target-arm.next.
>=20
> thanks
> -- PMM
>=20

