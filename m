Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1356131wrg;
        Wed, 19 Jun 2019 19:13:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziSaDqJTaqLvXHGZ0W2LxklPSNjeraFwBoP/pF5feobNMwVyk80QXutTWpHbgRMPsfba8l
X-Received: by 2002:a50:89a6:: with SMTP id g35mr83193368edg.145.1560996812927;
        Wed, 19 Jun 2019 19:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560996812; cv=none;
        d=google.com; s=arc-20160816;
        b=kvCgmY+Or7vOpaHrlSX3z+3ZhW0o2RiwRLHXU7Z2Qk4hyQPdef+2E50hlFyrF7bqZs
         UMRSX5M+dqM0nNwVCjfPwPZo1bcItwwommVN+rZcXlk1fXW/8ZjbF5k2A33ILbKyYjnQ
         H+ivXcqaem19OXBLh3eZxoI/hDJyiE9IRBTghbB2RHQjNgujbmK4K85eda2VZ35vtDY1
         GLVuvfKWz4WviNJeCjqsACb+DlfidmAfTeoR+GaLwUfTtYXNUEw4ItPzHWopyuPQRxSG
         WUlhpp5KFtcUmwo2EQyRCuQY/jCgUIgWKkdjCtK9iBHlfV8XmrYNkAI2S8W6NeonEfCa
         MIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:from:date:references:in-reply-to
         :message-id:mime-version:user-agent:dkim-signature:dkim-signature;
        bh=dmXgsLKzLmN5l4CutmavbHQ/3yEEP1xxqzMR0WF1HMg=;
        b=mAqMyvxRjzvICXzP1xVlVqaZnGL0ESwwlQgo7K4rDVVn25I27ShwGguHKscHFfqyOW
         AttUS9n61z7gh5gI3Y3tTpLJUbJSak8wZxbDEgq7GwQmW4nrqyyxNLgd1f0n5vWIxGYh
         hVQqiBBnBPm3vcq1llWG9Ou64CJXblohYJ2XckjYWIVgnWvQxwgQdRSsQwh3GFRy6gAk
         zP9+SUyscOpOvTzdW/aUROFNVfQ8IrxppfKwM74inV9CT9ijZQ4BLD9FY/StucxX0Cm1
         mNQiHApq+ze2OV4aRNZ39gv4YAwDwRoSdn3X2oJ9OvfvvqJ2Urr7mGYJPI+vdO9VkMdi
         0+2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=LcQnOJqC;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ds1+IoOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w29si14711340edw.112.2019.06.19.19.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 19:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=LcQnOJqC;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ds1+IoOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdmZv-0000Ea-Ve
	for alex.bennee@linaro.org; Wed, 19 Jun 2019 22:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrew@aj.id.au>) id 1hdmZ5-0000Cx-24
 for qemu-arm@nongnu.org; Wed, 19 Jun 2019 22:12:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1hdmSn-0008Iw-2n
 for qemu-arm@nongnu.org; Wed, 19 Jun 2019 22:06:11 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57171)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1hdmSh-00085V-Jr; Wed, 19 Jun 2019 22:06:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 359A22249A;
 Wed, 19 Jun 2019 22:05:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 Jun 2019 22:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=dmXgs
 LKzLmN5l4CutmavbHQ/3yEEP1xxqzMR0WF1HMg=; b=LcQnOJqCyn1m+W7KY4y2K
 UjdU6QGkIGp+BZ+fxLLdn+Zhfr7XTvQ2UXs5aaAiuYsjjaaYkiY8++zqpf6WDRRY
 PLg8CSG4ITuP6dn6PZrEgOhw958dRCx5Jv6yckqPEwWj8YTzi+4wUoRA2epOGnsC
 n1usSQx5BKDe8YNQtnnehSRoHefbpZ10/e9oSJNy4MqCAdUUbbLYTWPkH68IY/zq
 pvavqMoMfc7Pw1mQM8/3pX0stBbcFeNCSS8sPWAiJXKx1Eq5biLhgWb/slY1exFJ
 sAFEKhEoMq5rLDwYlwmXoNgzUoLjZtj4fEJyFAC2IOuFnWZVoV0cqYsMyrsP5NqW
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=dmXgsLKzLmN5l4CutmavbHQ/3yEEP1xxqzMR0WF1H
 Mg=; b=ds1+IoOVkEgM8nmYi9O6fG8kJI828ZFC6FzLa3x3tysYevqeWJVnD07LS
 J4Ergv72kS+mKz2Exy9W4sL6CZgOs47Pps+e2Lg7KiRwXBYpFEnA6xoVxGaCn7dI
 YyUNW8/1A8bKPHGrak4poA3juKYZiy97hhhRk4kNz9HXuxRJwGGLc8DAnAezFYO7
 5g6unonY+kB0aYfau6fCIinSL9GzNpuxrbCALCQ0gw6n1hAY75ulN/TgKGPlh3HM
 ayOuIZfhhzefGPG3crrGU+YgCKipAdH60a51Acs2h1esQwfNizbDK0zHBINQF4pA
 Hy+cAzvrqmBLyydGK9T6Cy0OdhaEQ==
X-ME-Sender: <xms:_ekKXQlFT9BiZqPSA5IOvElFCI3B-IHJjsSv_cCpfIVT13ayrZa5CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:_ekKXRLUWvieLKf1Zw7Mtra4meypfS5RxOjWwlnmqnnqDOtucXn17Q>
 <xmx:_ekKXRG_9kO4JHhORrXdVPDCUHeooTc6K1znqeuSrhC0b5JYgwze4Q>
 <xmx:_ekKXSPgIcqDsIM9iVFyXzDe2qoAEttz3ZGzLCbWZjEBKKQX6DKVOw>
 <xmx:_ukKXeGr7a6v2cR9nNhfQQMryZyoyLzcnIU77-EIbLFDm78k20F9Nw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8C09DE00A1; Wed, 19 Jun 2019 22:05:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-666-gb2312fa-fmstable-20190614v4
Mime-Version: 1.0
Message-Id: <d119d46f-e932-4b1c-a7f3-72417181448a@www.fastmail.com>
In-Reply-To: <20190618165311.27066-12-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-12-clg@kaod.org>
Date: Thu, 20 Jun 2019 11:35:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH v2 11/21] aspeed/timer: Ensure positive
 muldiv delta
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Christian Svensson <bluecmd@google.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: noHPE+Ovy9de



On Wed, 19 Jun 2019, at 02:24, C=C3=A9dric Le Goater wrote:
> From: Christian Svensson <bluecmd@google.com>
>=20
> If the host decrements the counter register that results in a negative=

> delta. This is then passed to muldiv64 which only handles unsigned
> numbers resulting in bogus results.
>=20
> This fix ensures the delta being operated on is positive.
>=20
> Test case: kexec a kernel using aspeed_timer and it will freeze on the=

> second bootup when the kernel initializes the timer. With this patch
> that no longer happens and the timer appears to run OK.
>=20
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/timer/aspeed_timer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 6501fa0768e7..1f0f1886fb2a 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -275,7 +275,11 @@ static void=20
> aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
>              int64_t delta =3D (int64_t) value - (int64_t)=20
> calculate_ticks(t, now);
>              uint32_t rate =3D calculate_rate(t);
> =20
> -            t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rat=
e);
> +            if (delta >=3D 0) {
> +                t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND,=
 rate);
> +            } else {
> +                t->start -=3D muldiv64(-delta, NANOSECONDS_PER_SECOND=
, rate);
> +            }
>              aspeed_timer_mod(t);
>          }
>          break;
> --=20
> 2.21.0
>=20
>
