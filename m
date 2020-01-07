Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24384197lff;
        Tue, 7 Jan 2020 00:59:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzD5jL++P5gPTKkgD29zJaLmxt7jo3VLHQbgCNuXh/b3tGHKgAbc/iu6CLoEgSonMl38zAD
X-Received: by 2002:a05:6402:298:: with SMTP id l24mr111565121edv.70.1578387588599;
        Tue, 07 Jan 2020 00:59:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578387588; cv=none;
        d=google.com; s=arc-20160816;
        b=yXB+5OvbvxRuRzaHBUVKpY0tg5HaBVyom7Ulw9BjL4rywEyCytF7O8U1JNCD4iv+Z4
         hFQtUhvqEDKFfyc39YFO9ciOKyrNqf3KlfOuTiCOJIbUqh9s9WnljCFoP+3inUynAoKI
         j0vLhHS44LLjtTJXK+fXOEBuQqYtWKEg6zQVt7MEW7qeMSXCECRSEikkVlcPFzO/azGV
         b098FBYCmJbuD4Bx/X9RPwUMoqbf+ew64eP4U+2JuBsYUzGVKPYRmW19LQhECfrgd7q4
         wN2919PPM6sLHiJW+r7qNQ81XvlLARm36FQ5UzSSfTtfgw/1o+euTipgIAuUxUoownov
         TDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TrdOMNTqRZZAVnYnD9QyyWMGw0xX7Lxvosb6ZnPXKf8=;
        b=pByQv/mS4uMWZWshvtw2f5+fzjqJvg0JWb+sdsJrnFix7AzBEr6unIkTbYFKbOFUsi
         xgHJft+2EkunKIXjVGhOwkGQmHfCiB8oc1l60LiOeu3bW0iofF/69C6fOJffNEcfRJPK
         MjuSnWRN+A9GpPqkXZrGBWLDPCbzB39lkRJxgYXf9Ebv+saUDQue3q57K0Cxjyqputni
         6ON0WLZM3mNcooHDp7yww2/whsb7VEysZSp+xiN4qBxc736oJA+j83PX1mksEKmpltjc
         hbaP+lxkstesLVS++eeUwyMtsHh011mLa74CEGoMH1VC2jMvhAWTtPn+4LXIqYKpd9vw
         8Zqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o26si45702942edt.349.2020.01.07.00.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 00:59:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iokiH-000129-9I
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 03:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iokLr-0008J3-9f
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 03:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iokLp-00011S-TK
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 03:36:34 -0500
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:60691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iokLp-00010L-NM
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 03:36:33 -0500
Received: from player759.ha.ovh.net (unknown [10.108.1.170])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 8B9007B0BB
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 09:36:31 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 66698DF0BEBE;
 Tue,  7 Jan 2020 08:36:25 +0000 (UTC)
Subject: Re: [PATCH 3/5] ftgmac100: check RX and TX buffer alignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-4-clg@kaod.org>
 <1587acec-3d08-9dfa-0bcc-37140fd5e2ad@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ce0722d4-48ed-e7cd-2436-84d1ee24038f@kaod.org>
Date: Tue, 7 Jan 2020 09:36:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1587acec-3d08-9dfa-0bcc-37140fd5e2ad@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4832080926734519104
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.42.102
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0vUhKHI88bj1

On 1/7/20 9:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/7/20 8:34 AM, C=C3=A9dric Le Goater wrote:
>> These buffers should be aligned on 16 bytes.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>> =C2=A0 hw/net/ftgmac100.c | 13 +++++++++++++
>> =C2=A0 1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>> index 86ac25894a89..051f7b7af2d6 100644
>> --- a/hw/net/ftgmac100.c
>> +++ b/hw/net/ftgmac100.c
>> @@ -198,6 +198,8 @@ typedef struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 des3;
>> =C2=A0 } FTGMAC100Desc;
>> =C2=A0 +#define FTGMAC100_DESC_ALIGNMENT 16
>> +
>> =C2=A0 /*
>> =C2=A0=C2=A0 * Specific RTL8211E MII Registers
>> =C2=A0=C2=A0 */
>> @@ -722,6 +724,12 @@ static void ftgmac100_write(void *opaque, hwaddr =
addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->itc =3D valu=
e;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case FTGMAC100_RXR_BADR: /* Ring buffer=
 address */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!QEMU_IS_ALIGNED(value=
, FTGMAC100_DESC_ALIGNMENT)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qe=
mu_log_mask(LOG_GUEST_ERROR, "%s: Bad RX buffer alignment 0x%"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 HWADDR_PRIx "\n", __func__, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn;
>=20
> What is the hardware behavior?

This is not documented :/

C.

>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rx_ring =3D =
value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->rx_descripto=
r =3D s->rx_ring;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> @@ -731,6 +739,11 @@ static void ftgmac100_write(void *opaque, hwaddr =
addr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case FTGMAC100_NPTXR_BADR: /* Tr=
ansmit buffer address */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!QEMU_IS_ALIGNED(value=
, FTGMAC100_DESC_ALIGNMENT)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qe=
mu_log_mask(LOG_GUEST_ERROR, "%s: Bad TX buffer alignment 0x%"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 HWADDR_PRIx "\n", __func__, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->tx_ring =3D =
value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->tx_descripto=
r =3D s->tx_ring;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>
>=20

