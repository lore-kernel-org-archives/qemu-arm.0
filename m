Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4333771lfi;
        Fri, 6 Mar 2020 07:27:43 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsijO4mNjVN+hNhNnVQB/3OhgrDyRcrYPpEdes1kumnWN90cgCWV5RvRihQXq61iXKUWdxQ
X-Received: by 2002:ac8:7c9b:: with SMTP id y27mr3524392qtv.300.1583508463692;
        Fri, 06 Mar 2020 07:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583508463; cv=none;
        d=google.com; s=arc-20160816;
        b=P1YcF8VU8TkQRvYeoJJxs66i0xQ9diMTQSnjxcEh2Ak/OvjC25Tg/VGHBA7tHDD4nu
         rc9GovtJ9swBjWDY9o3aLO8nRgdSEXQocTXwxufN6KTo/frlEdDGiQUtQ6ZaO+Mv5L+4
         hMe8okelylCAtTShiXJ6+It9YwWRUuXuYtri36RmJaEoi9S8gtUCn9DRXD3hfDtjUvvg
         wEz7caC3eYViHpSSzKqAWnq+U06FtLwZB6trqBJ0s+0ng0C49XM2H/5z9un3avXnGKD4
         sCMV+Cuv2JAJaJn2bdWKW8GS2HXXMJnO53WqjVQR11MPAmIcVDpou58m+Al1bMUrevqb
         1K0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ObPG4dnuCRi/Lfeq3Vk3fwHQMIoKsgefbG2wBv+pY/0=;
        b=wZ+ZdrFXPVXWo6Qwwl16ZatdsXPjHNKkHUeeUA0HMI9EH3woJx4QUyIUmZkB+OY8nG
         BH2pdz8zMxYO5GdMZrYp4No0BrHxg7rND3sqpJEqRIm2pVDgZbifWXu1u7VpzWrFTczg
         CA88VfwFL69ZPhvVg95dhThMHe52vqXodvao7pE5L1fr6hHkDIiTvRVvhR4p2fjmw6UT
         MwQnqUe/V4PkQtakSOoIemzMhOaTib/sQYwUbR0NRiRoMQIMRY+U+q8kTPNqOAZvTD6w
         pzGYFRSCzk7tWZ0wBJU4tFGHc2cXVt3vqc+S2IQsyMjuxThVToM/GWPn7jp9jn20whPb
         78cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si1385939qkh.95.2020.03.06.07.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 07:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAEt5-0000Y5-63
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 10:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jAEsW-00088g-6L
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:27:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jAEsV-0006KU-5u
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:27:08 -0500
Received: from 8.mo5.mail-out.ovh.net ([178.32.116.78]:57906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jAEsU-0006JK-VY
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:27:07 -0500
Received: from player787.ha.ovh.net (unknown [10.110.208.89])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 69FE726BF03
 for <qemu-arm@nongnu.org>; Fri,  6 Mar 2020 16:27:05 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 09F821052F4B3;
 Fri,  6 Mar 2020 15:26:47 +0000 (UTC)
Subject: Re: [PATCH 4/6] hw/net/rtl8139: Update coding style to make
 checkpatch.pl happy
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-5-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c8988327-3fdb-3568-2df6-1101b7ccf445@kaod.org>
Date: Fri, 6 Mar 2020 16:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7766739036414118867
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.116.78
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YTEH8I5XzrrX

On 3/5/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> We will modify this code in the next commit. Clean it up
> first to avoid checkpatch.pl errors.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/net/rtl8139.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index ef3211537f..be9a0af629 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -799,10 +799,12 @@ static int rtl8139_can_receive(NetClientState *nc=
)
>      int avail;
> =20
>      /* Receive (drop) packets if card is disabled.  */
> -    if (!s->clock_enabled)
> -      return 1;
> -    if (!rtl8139_receiver_enabled(s))
> -      return 1;
> +    if (!s->clock_enabled) {
> +        return 1;
> +    }
> +    if (!rtl8139_receiver_enabled(s)) {
> +        return 1;
> +    }
> =20
>      if (rtl8139_cp_receiver_enabled(s) && rtl8139_cp_rx_valid(s)) {
>          /* ??? Flow control not implemented in c+ mode.
>=20

