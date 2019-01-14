Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2760474wrt;
        Sun, 13 Jan 2019 23:33:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5lRxtXvNhxt+umZnSTqNPSUcT3CbLOzowxnaBz9tuC6ngEC50ha7jVXrMtxKwryYD6xofF
X-Received: by 2002:a5d:6710:: with SMTP id o16mr23655757wru.152.1547451198373;
        Sun, 13 Jan 2019 23:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547451198; cv=none;
        d=google.com; s=arc-20160816;
        b=tqJSFJRevBB6MNv1jGtH0UvLneCUVJaz6Vpa5heQLf9LzdhN7cqAGFuWRoEkVU3GLX
         0QSBQyutSIgo7TCUR7Wr800wsodnnzSVO2b0MJ03pa26Z0vfGCzOsRrOVD7J/NkZEs8W
         pn00ajlT6UEFOzCu4CLu4hAx5mSlVQRdYQf8lImP7o21KjI5TJq/UsOLQb6gZzCzj0eE
         W7PA4gRHOo0x5+pAiXCCIxWRgzo1DGML11TVpHVGrX8GCeP9x7vlcWlEinlOLgAXNQKf
         Zu2etQd5WRYbLjrl/HOafI/v4ZmIYAZL6iWKnso7aT6mC6zdNClPx+zzV0+7WQB/eRpE
         R/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=KY4nBMBP6qWTBXlV6szVcVnhK7i5XPmO7SXm5l4L1nU=;
        b=AFh1yepSqqqUWfHe7EkZfWQ5XfIu/QH0Y/hukSc8WSmw2FCJyrL/R7cpy0f3+qiEhy
         BHKrWVsob7XFPaXwcvLO1vYiFYbR3X8qGm2qNzEuHaFqLfmY1QLuJXy5el9MEM40kjDj
         MHryR4YgY6iTP267khMHt3YWtXtmIZFbKsM+KDmxXKNbt8qfILYltgi8xD8K03CEbxki
         YPDoGcgHwUknkoADQXBKwn09Bih77hgBGTDMt4oqnC0+0jkTsRZ4k9OBrc+gbbVTIe7m
         e6CoAyNw8YO1qC1hXS6fE/BTKlzhsgVuhVJh5nDbeaTXbqhO6PpWrYIeXVzISjG4ou3R
         S0Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s82si17843305wmf.82.2019.01.13.23.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 23:33:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giwkH-0003i9-4d
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 02:33:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1giwk3-0003hw-FJ
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 02:33:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1giwk2-0007PI-LK
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 02:33:03 -0500
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:46863)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1giwk2-0007J6-FW
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 02:33:02 -0500
Received: from player732.ha.ovh.net (unknown [10.109.146.76])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id B3C1C10FAA1
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 08:32:52 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
	(Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id B754817CF156;
	Mon, 14 Jan 2019 07:32:42 +0000 (UTC)
To: Joel Stanley <joel@jms.id.au>
References: <20190111125759.31577-1-clg@kaod.org>
	<CACPK8Xdp8hCYCqWrVQeRuK819-EmNCuWJwF1jGSJfy5RzMUsXg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8aafff96-e02c-a5a3-dc20-a15f21387479@kaod.org>
Date: Mon, 14 Jan 2019 08:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdp8hCYCqWrVQeRuK819-EmNCuWJwF1jGSJfy5RzMUsXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4261531148454235135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.148
Subject: Re: [Qemu-arm] [PATCH] ftgmac100: implement the new MDIO interface
 on Aspeed SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hI0FmLHF29p

On 1/14/19 4:29 AM, Joel Stanley wrote:
> On Fri, 11 Jan 2019 at 23:58, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> The PHY behind the MAC of an Aspeed SoC can be controlled using two
>> different MDC/MDIO interfaces. The same registers PHYCR (MAC60) and
>> PHYDATA (MAC64) are involved but they have a different layout.
>>
>> BIT31 of the Feature Register (MAC40) controls which MDC/MDIO
>> interface is active.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/net/ftgmac100.c | 80 +++++++++++++++++++++++++++++++++++++++------=
-
>>  1 file changed, 68 insertions(+), 12 deletions(-)
>=20
>> @@ -269,9 +281,9 @@ static void phy_reset(FTGMAC100State *s)
>>      s->phy_int =3D 0;
>>  }
>>
>> -static uint32_t do_phy_read(FTGMAC100State *s, int reg)
>> +static uint16_t do_phy_read(FTGMAC100State *s, uint8_t reg)
>>  {
>> -    uint32_t val;
>> +    uint16_t val;
>=20
> Unrelated?

It is. Check do_phy_new_ctl() passing a 'uint8_t reg'.=20

There is not much point of adding these small changes without the bigger=20
one adding the new MDC/MDIO interfaces. That's why I merged them all in=20
one single patch.

>> @@ -336,7 +348,7 @@ static uint32_t do_phy_read(FTGMAC100State *s, int=
 reg)
>>                         MII_BMCR_FD | MII_BMCR_CTST)
>>  #define MII_ANAR_MASK 0x2d7f
>>
>> -static void do_phy_write(FTGMAC100State *s, int reg, uint32_t val)
>> +static void do_phy_write(FTGMAC100State *s, uint8_t reg, uint16_t val=
)
>=20
> Also unrelated?
>>> @@ -711,14 +771,11 @@ static void ftgmac100_write(void *opaque, hwadd=
r addr,
>>          break;
>>
>>      case FTGMAC100_PHYCR:  /* PHY Device control */
>> -        reg =3D FTGMAC100_PHYCR_REG(value);
>>          s->phycr =3D value;
>> -        if (value & FTGMAC100_PHYCR_MIIWR) {
>> -            do_phy_write(s, reg, s->phydata & 0xffff);
>> -            s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
>> +        if (s->revr & FTGMAC100_REVR_NEW_MDIO_INTERFACE) {
>> +            do_phy_new_ctl(s);
>>          } else {
>> -            s->phydata =3D do_phy_read(s, reg) << 16;
>> -            s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
>> +            do_phy_ctl(s);
>=20
> I assume the guest code programs the correct phy mode so this will
> work fine. This change appears to keep the existing default of the old
> mode.

Yes. 0 is the default setting of 'Feature Register'

> Did you give this a go with both -kernel and a u-boot mtd image?

Yes.
=20
> Looks good to me. If you feel like splitting out the unrelated changes
> do that, but I'm not fussed either way.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>


Thanks,

C.


> Cheers,
>=20
> Joel
>=20

