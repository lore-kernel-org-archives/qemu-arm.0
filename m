Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3784853wre;
        Tue, 29 May 2018 09:56:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJdJgltKr+0C31SvdE8jzEqGVyzmI+VbWwfQ3YjZ+vEXSj215i1Yj6NuXebatNUAnwzrBl8
X-Received: by 2002:ac8:6612:: with SMTP id c18-v6mr17469752qtp.343.1527612994886;
        Tue, 29 May 2018 09:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527612994; cv=none;
        d=google.com; s=arc-20160816;
        b=uW83HrPVwnHJVUHoBeZU7elnNiCvWX5TjrXVSb4D5O0En9K0HvRT1JO7xrz5CwGkKY
         4Oeu37m/x1Rc++h/ofj9WYJb7pzJdp3vIg2stY4au8PIbKs+OHD1pg0wa79nuEJzSU/p
         xMDTIq1xr7/e/G9YsLSQ2wjVvr14su1aOerrtgHBe4xNrRGaZp8mG/XDs43k4gQziYO5
         VT2+0vcjgFWKUzBYoN/XdqtJXsO1dBvhWrwmg9D8JyGBLs4cwK9x9nUdkcScWgaYguZ+
         g0XN/yk+IkMyN2h3r06oq1eN3ayQXMr3eaENkeoZdTwJpLDQr9NN8KvuGUYaB2nIvo0D
         rOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=M1NczByVIF+DIQWRO5gGcloBf33+elcCsGnh/VTzXDA=;
        b=U5iaxwJn8M0xMS4TzUbEHwN1J4MlG04jqy/Sa9F3Z0L05AotA9bNDOiisWls8oWLfs
         LtXfZ+cb+Efwsu92eKowMwJp49hvDcPLbBBJQ82hdGBEaEo1h3bNY39a7SeELqnZtz3X
         S1lXfvjypD42MWVhf3JVP8deyO+kqxZNG/jlsitsoD/E9d9LWjnYebqebqKlbBwsqkjd
         u1ZGCsrwc5/0HqM6B4nZY0N5d8gBs/YNP8DOAJcqebickRuPYHp4IBC3Uel2pJk0WQqL
         ba62VS/yYZrmqtiqZ2BQyBm2x+bgFEaar7KVbdHpXKtXloorJ3+Ftb3eWQsz8qRiC0UP
         C9qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si14337186qts.53.2018.05.29.09.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 09:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNhvG-0007le-Ev
	for alex.bennee@linaro.org; Tue, 29 May 2018 12:56:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNhv7-0007jS-6R
	for qemu-arm@nongnu.org; Tue, 29 May 2018 12:56:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNhv3-0004ng-AV
	for qemu-arm@nongnu.org; Tue, 29 May 2018 12:56:25 -0400
Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238]:36204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNhv3-0004n4-3P
	for qemu-arm@nongnu.org; Tue, 29 May 2018 12:56:21 -0400
Received: from player695.ha.ovh.net (unknown [10.109.105.30])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 309AEB32EE
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 18:56:19 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id 2230946009D;
	Tue, 29 May 2018 18:56:13 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-3-clg@kaod.org>
	<b0cb42ea-16f7-7806-814c-f472867e1a6a@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e21c77e5-c1de-eaf9-5357-1147f5d14ca0@kaod.org>
Date: Tue, 29 May 2018 18:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <b0cb42ea-16f7-7806-814c-f472867e1a6a@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9669791353862392640
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheekgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.238
Subject: Re: [Qemu-arm] [PATCH 2/6] ftgmac100: add IEEE 802.1Q VLAN support
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
X-TUID: r8tuikcIMOS+

On 05/29/2018 03:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi C=C3=A9dric,
>=20
> On 05/29/2018 03:28 AM, C=C3=A9dric Le Goater wrote:
>> The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
>> has a control to remove VLAN tags from received packets.
>>
>> The VLAN control bits and VLAN tag information are contained in the
>> second word of the transmit and receive descriptors. The Insert VLAN
>> bit and the VLAN Tag available bit are only valid in the first segment
>> of the packet.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/net/ftgmac100.c | 32 +++++++++++++++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>> index 7598d08c9cb9..50af1222464a 100644
>> --- a/hw/net/ftgmac100.c
>> +++ b/hw/net/ftgmac100.c
>> @@ -443,6 +443,24 @@ static void ftgmac100_do_tx(FTGMAC100State *s, ui=
nt32_t tx_ring,
>>              break;
>>          }
>> =20
>> +        /* Check for VLAN */
>> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
>> +            bd.des1 & FTGMAC100_TXDES1_INS_VLANTAG &&
>> +            be16_to_cpu(PKT_GET_ETH_HDR(ptr)->h_proto) !=3D ETH_P_VLA=
N) {
>> +            if (frame_size + len + 4 > sizeof(s->frame)) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %=
d bytes\n",
>> +                              __func__, len);
>> +                s->isr |=3D FTGMAC100_INT_XPKT_LOST;
>> +                len =3D  sizeof(s->frame) - frame_size - 4;
>> +            }
>> +            memmove(ptr + 16, ptr + 12, len - 12);
>> +            ptr[12] =3D 0x81;
>> +            ptr[13] =3D 0x00;
>=20
>                stw_be_p(ptr + 12, ETH_P_VLAN);
>=20
>> +            ptr[14] =3D (uint8_t) bd.des1 >> 8;
>> +            ptr[15] =3D (uint8_t) bd.des1;
>=20
>                stw_be_p(ptr + 12, bd.des1);

ptr + 14

>> +            len +=3D 4;
>> +        }
>> +
>>          ptr +=3D len;
>>          frame_size +=3D len;
>>          if (bd.des0 & FTGMAC100_TXDES0_LTS) {
>> @@ -858,7 +876,19 @@ static ssize_t ftgmac100_receive(NetClientState *=
nc, const uint8_t *buf,
>>              buf_len +=3D size - 4;
>>          }
>>          buf_addr =3D bd.des3;
>> -        dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n);
>> +        if (first && proto =3D=3D ETH_P_VLAN && buf_len >=3D 18) {
>> +            bd.des1 =3D (buf[14] << 8) | buf[15] | FTGMAC100_RXDES1_V=
LANTAG_AVAIL;
>=20
>                bd.des1 =3D lduw_be_p(buf + 14) |
> FTGMAC100_RXDES1_VLANTAG_AVAIL;
>=20
>> +            if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
>> +                dma_memory_write(&address_space_memory, buf_addr, buf=
, 12);
>> +                dma_memory_write(&address_space_memory, buf_addr + 12=
, buf + 16,
>> +                                 buf_len - 16);
>> +            } else {
>> +                dma_memory_write(&address_space_memory, buf_addr, buf=
, buf_len);
>> +            }
>> +        } else {
>> +            bd.des1 =3D 0;
>> +            dma_memory_write(&address_space_memory, buf_addr, buf, bu=
f_len);
>> +        }
>>          buf +=3D buf_len;
>>          if (size < 4) {
>>              dma_memory_write(&address_space_memory, buf_addr + buf_le=
n,
>>
>=20
> With ldst API uses:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20

Sure, I will fix these.

Thanks,

C.=20


