Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6351907lff;
        Tue, 17 Dec 2019 09:55:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyf3b8jemqbgeviX8UUkkjaVGEY6vVic4pCvSNw8U5kzhaqvtSmBGJsDEKmVft9n2KqNBpo
X-Received: by 2002:a9d:2965:: with SMTP id d92mr6750339otb.175.1576605304852;
        Tue, 17 Dec 2019 09:55:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576605304; cv=none;
        d=google.com; s=arc-20160816;
        b=FvM73403ZWCxejAVnHlnAWo5R9pcFd5dMkw2vXrKMcSXAG7lF/FkMgNm4BKH3Cx1B2
         lG0PqmIPjLS/FfZoOC08rp3vGRYOEwaY6yqBLZoToKXZP+7A3QCm5yYDnb5180vvfOPS
         Sei8BYwjdiPWM9fUjSQMqyzHdVIod3tUOwcMECN6s2RYOWqq5oHluZSRHTDUiOeUk5da
         OQITzddxi/GEXSRYTBjSdY1zcZa5h0Ki1l/anaEW3oGB5BCuDHem0X5FgMe6oElh/xxw
         KG302xUeEnDjBAS5Sy2Os7RDaOJI27Wsdkdy+WN1JiKKiMHTTuW5Jv7E9/17Fb52zZYf
         Kbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=gFPQqILLuP+RBoyPsD5cNuO3RD5ecViHeuvcgKCBVgA=;
        b=xFweiClHE3fnshG2LjhCI6OyoBcZyTgih+OKXPM5Vu1GipqZf8kzZlA7CyB6NTQ2P3
         BJ+g0NG8zJV27TC2isW2b1IN4SSQh43VL7rwlWyBSB3A65SutVhuEH+5K7yWzYi+uK6Z
         tvkyBsmLUE03GEu75eyOFEOK8TBYFP5fsCAMFWM5sDewlWxb27K2VqOG35semsdFPZBh
         C858BWEWmrufbL1YLdw/68V3KTzppZxNJxD0VjZs/fl9dKUp9AAm85m8UwtxXMPW2H0j
         HhhkgAqObKf7KysRKtyu0fd3EEoVpGq4ZG0Qtjrr7vcKW0PhIneQcR0LYEHdD65rLlxT
         4y/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21si12813485oti.246.2019.12.17.09.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 09:55:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihH3n-0006wc-Uq
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 12:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ihH3e-0006vg-Om
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:54:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ihH3d-0008UN-LN
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:54:54 -0500
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:45792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ihH3d-0008HJ-Fr
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:54:53 -0500
Received: from player711.ha.ovh.net (unknown [10.109.146.131])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 23AF314E6D1
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 18:54:41 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 5CE0FD4A870A;
 Tue, 17 Dec 2019 17:54:34 +0000 (UTC)
Subject: Re: [PATCH 4/6] hw/timer/aspeed_timer: Add a fall through comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-5-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9bbdf21b-a330-b8d2-5fa6-8649adeb9143@kaod.org>
Date: Tue, 17 Dec 2019 18:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1612570142561831856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddtjedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.75.26
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 105x97WTNhvZ

On 17/12/2019 18:34, Philippe Mathieu-Daud=C3=A9 wrote:
> Reported by GCC9 when building with CFLAG -Wimplicit-fallthrough=3D2:
>=20
>   hw/timer/aspeed_timer.c: In function =E2=80=98aspeed_timer_set_value=E2=
=80=99:
>   hw/timer/aspeed_timer.c:283:24: error: this statement may fall throug=
h [-Werror=3Dimplicit-fallthrough=3D]
>     283 |         if (old_reload || !t->reload) {
>         |             ~~~~~~~~~~~^~~~~~~~~~~~~
>   hw/timer/aspeed_timer.c:287:5: note: here
>     287 |     case TIMER_REG_STATUS:
>         |     ^~~~
>   cc1: all warnings being treated as errors
>=20
> Add the missing fall through comment.
>=20
> Fixes: 1403f364472
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/timer/aspeed_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index a8c38cc118..c91f18415c 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -283,7 +283,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlS=
tate *s, int timer, int reg,
>          if (old_reload || !t->reload) {
>              break;
>          }
> -
> +        /* fall through to re-enable */
>      case TIMER_REG_STATUS:
>          if (timer_enabled(t)) {
>              uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>=20

