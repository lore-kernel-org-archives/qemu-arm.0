Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4335045lfi;
        Fri, 6 Mar 2020 07:28:51 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsvCocoPm6krptKZ7kkrGMj0d+LLTz8NWYtUo9kmpQLmOxV6xZiM0g1ymG31Yaq2p0y3vLL
X-Received: by 2002:a37:6258:: with SMTP id w85mr3595289qkb.206.1583508531484;
        Fri, 06 Mar 2020 07:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583508531; cv=none;
        d=google.com; s=arc-20160816;
        b=phyzo42BC/jU3etNa7xxyreLb7PbB3+VA6NNeYlHrYsi65CoD7ZRpqUN6XWRreYYVW
         jdy736EQOvwUCvmyVoyBWrBctjWeYlhI8+y/Lnzpcbx38O/kyqY8WwfAJQOSifZDFgah
         co6P2XLN5hjYhXXPYhbTWY03xxeTsLNe9i1vHACr+7/pWwBpiFQAM8wLi39y9Fcy1rOc
         7O005pT/9tIRxo/Ol3Rjr+Q7gYEtcnan7R2z+9pvbjBaMg/YjHHxWSVK/klDNX980Zy9
         kLeXaFno9SynUPU6rfSHjWryzv7eYzrYR45oclo/lXZcWcsrogRbSeMlw43cx0U53qZz
         Nr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=lnktpTvCcrsb0bRgBjCyL/vhWg/DKP7/dYgRDJ9lk34=;
        b=G9J0CRamM8LLjPlRX9PV9+4xlN3NKn8Ce0GJD4qSGKu4ldK3xB1KFGGQA3sNbQV9I3
         6FR7e4Mn06phzIuzjv1spJU+HtUwDbHh2jI5pfQN1YiV71lWjtQOjHBuz1KOfXJWYTXx
         CX0DDqfMVUcrVfh+2SeO6ZQZ+wJYSQnqR1U26i4eapROn19l5RbTb5XBoY060xv5/LXn
         DVQAHK9+E8ORndY6PbduliJjzIO1pT1i8A7Flb99TXn7V3L48ZiHBVxYIaaLpoUtz2jH
         linghp+unWyXWOfRgFKsoQFi4hgoZ8rOoFyj23Q99caCV4HTXxwqG9EPoj/WyB0Z3wTQ
         QqgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si1157288qtq.104.2020.03.06.07.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 07:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAEuA-0001t2-UA
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 10:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jAEsu-0000WD-4s
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:27:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jAEst-0006lZ-0f
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:27:32 -0500
Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21]:55849)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jAEss-0006jz-Qt
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:27:30 -0500
Received: from player762.ha.ovh.net (unknown [10.108.54.67])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1C33A14D385
 for <qemu-devel@nongnu.org>; Fri,  6 Mar 2020 16:27:28 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 8928010240994;
 Fri,  6 Mar 2020 15:27:10 +0000 (UTC)
Subject: Re: [PATCH 6/6] hw/net/can: Make CanBusClientInfo::can_receive()
 return a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-7-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1c54e106-bcf6-b899-a236-8044604a1cfd@kaod.org>
Date: Fri, 6 Mar 2020 16:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7773212959322049491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.180.21
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k35eSw46cXLX

On 3/5/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The CanBusClientInfo::can_receive handler return whether the
> device can or can not receive new frames. Make it obvious by
> returning a boolean type.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
>  hw/net/can/can_sja1000.h | 2 +-
>  include/net/can_emu.h    | 2 +-
>  hw/net/can/can_sja1000.c | 8 ++++----
>  net/can/can_socketcan.c  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/net/can/can_sja1000.h b/hw/net/can/can_sja1000.h
> index 220a622087..7ca9cd681e 100644
> --- a/hw/net/can/can_sja1000.h
> +++ b/hw/net/can/can_sja1000.h
> @@ -137,7 +137,7 @@ void can_sja_disconnect(CanSJA1000State *s);
> =20
>  int can_sja_init(CanSJA1000State *s, qemu_irq irq);
> =20
> -int can_sja_can_receive(CanBusClientState *client);
> +bool can_sja_can_receive(CanBusClientState *client);
> =20
>  ssize_t can_sja_receive(CanBusClientState *client,
>                          const qemu_can_frame *frames, size_t frames_cn=
t);
> diff --git a/include/net/can_emu.h b/include/net/can_emu.h
> index d4fc51b57d..fce9770928 100644
> --- a/include/net/can_emu.h
> +++ b/include/net/can_emu.h
> @@ -83,7 +83,7 @@ typedef struct CanBusClientState CanBusClientState;
>  typedef struct CanBusState CanBusState;
> =20
>  typedef struct CanBusClientInfo {
> -    int (*can_receive)(CanBusClientState *);
> +    bool (*can_receive)(CanBusClientState *);
>      ssize_t (*receive)(CanBusClientState *,
>          const struct qemu_can_frame *frames, size_t frames_cnt);
>  } CanBusClientInfo;
> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index 39c78faf9b..ea915a023a 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -733,21 +733,21 @@ uint64_t can_sja_mem_read(CanSJA1000State *s, hwa=
ddr addr, unsigned size)
>      return temp;
>  }
> =20
> -int can_sja_can_receive(CanBusClientState *client)
> +bool can_sja_can_receive(CanBusClientState *client)
>  {
>      CanSJA1000State *s =3D container_of(client, CanSJA1000State, bus_c=
lient);
> =20
>      if (s->clock & 0x80) { /* PeliCAN Mode */
>          if (s->mode & 0x01) { /* reset mode. */
> -            return 0;
> +            return false;
>          }
>      } else { /* BasicCAN mode */
>          if (s->control & 0x01) {
> -            return 0;
> +            return false;
>          }
>      }
> =20
> -    return 1; /* always return 1, when operation mode */
> +    return true; /* always return true, when operation mode */
>  }
> =20
>  ssize_t can_sja_receive(CanBusClientState *client, const qemu_can_fram=
e *frames,
> diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
> index 29bfacd4f8..807f31fcde 100644
> --- a/net/can/can_socketcan.c
> +++ b/net/can/can_socketcan.c
> @@ -110,9 +110,9 @@ static void can_host_socketcan_read(void *opaque)
>      }
>  }
> =20
> -static int can_host_socketcan_can_receive(CanBusClientState *client)
> +static bool can_host_socketcan_can_receive(CanBusClientState *client)
>  {
> -    return 1;
> +    return true;
>  }
> =20
>  static ssize_t can_host_socketcan_receive(CanBusClientState *client,
>=20

