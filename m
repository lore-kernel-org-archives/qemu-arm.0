Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4332602lfi;
        Fri, 6 Mar 2020 07:26:34 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt3iD2lkfhBDGYth+50wC3wK3GqN8rAsYtE2ndSNGpkUFBhngryxsRLcbGJV1u0H6VWmLBY
X-Received: by 2002:ac8:7b8e:: with SMTP id p14mr3404266qtu.352.1583508394770;
        Fri, 06 Mar 2020 07:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583508394; cv=none;
        d=google.com; s=arc-20160816;
        b=u4nj8ETXgwmIiRoq+pMaxSANupVPNpivJ1zRXBlUKwWx/Dim4yOqZLt2i3ugHylsOD
         /15x6W1DCP9J7qy+cDx5c7lNS/zsp0Vup1cY4ysgnToMQcOO8Ho+vhjw/oEFbHp/uPOh
         RlUX3qv6y63D006Fm0E/ebbOo8sk8KuZ+zoY4wzs/XIZq2iWW4w+LDhynZvMnC/gLPZw
         5NymvgsiDAYly4m8FwDz/O9lAl0bZy9VzTdD6Tx5E0Plq5PgOtLa7VXzTeOQudqVeXBg
         eIcw9NfnBLFhRvVDPfuPM7Wo5Pb303qFde1667fGPWpDLWKkfO44ylEbLkgCab/x7O8k
         LBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Rp9yDqAb2iorAI1GAS3skXh0TJVQ7A9r2goGSflYQkg=;
        b=1FjhklECYIyqL/UenQ5hSXp8c3cW4ABH+dS/9QkOlY5RuMCcaI+YJQ/CXluSD+w65P
         k54CqGr3wGAzJPa0xB/x7B18AJROLrP6F/JRaQcWtdCengtnrmgSEXuU7ypxXym7JZzy
         AQqE/mjaufoBz+iBa0jV4Y59Ji2cz8Fj8YvFFF3oP0LqVZoVzH4TPf/ckv+3fIY7+uuR
         SSFlxNu4aLX32Eb9FzfWM+ze/nR/f4qoSGWrayH24ieonsPp/A3UYWvw2GuWAWQvsaZm
         aXpChqCiTrdxKkZznA47UJwkCcziM2+lec55HaWoruKL+wYTkY5MV8xgAQK63D/gIZed
         aGhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si1435625qki.198.2020.03.06.07.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 07:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAEry-00077y-7e
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 10:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jAErp-00076t-TS
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:26:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jAErp-0005GS-1h
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:26:25 -0500
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]:55557)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jAEro-0005EU-SO
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:26:24 -0500
Received: from player168.ha.ovh.net (unknown [10.110.171.215])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 4968C1CDA93
 for <qemu-arm@nongnu.org>; Fri,  6 Mar 2020 16:26:23 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id 1E75B101E137E;
 Fri,  6 Mar 2020 15:26:05 +0000 (UTC)
Subject: Re: [PATCH 2/6] hw/net/smc91c111: Let smc91c111_can_receive() return
 a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-3-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <838916bc-7fb4-37ee-d6db-ea119fc3b864@kaod.org>
Date: Fri, 6 Mar 2020 16:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7754917084798159827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduieekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.226
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
X-TUID: GRCFzliqCb6j

On 3/5/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The smc91c111_can_receive() function simply returns a boolean value.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/net/smc91c111.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index e9eb6f6c05..02be60c955 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -130,16 +130,16 @@ static void smc91c111_update(smc91c111_state *s)
>      qemu_set_irq(s->irq, level);
>  }
> =20
> -static int smc91c111_can_receive(smc91c111_state *s)
> +static bool smc91c111_can_receive(smc91c111_state *s)
>  {
>      if ((s->rcr & RCR_RXEN) =3D=3D 0 || (s->rcr & RCR_SOFT_RST)) {
> -        return 1;
> +        return true;
>      }
>      if (s->allocated =3D=3D (1 << NUM_PACKETS) - 1 ||
>          s->rx_fifo_len =3D=3D NUM_PACKETS) {
> -        return 0;
> +        return false;
>      }
> -    return 1;
> +    return true;
>  }
> =20
>  static inline void smc91c111_flush_queued_packets(smc91c111_state *s)
>=20

