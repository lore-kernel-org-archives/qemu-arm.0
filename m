Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1690929wro;
        Thu, 14 Mar 2019 23:49:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+LcdaqLaAWCYcXupJrk1Jcd1/xh+za/BjyLZuY56o5U6DGHsUixUDN2D/sClEWtN8OebZ
X-Received: by 2002:a5d:510b:: with SMTP id s11mr1206906wrt.131.1552632542264;
        Thu, 14 Mar 2019 23:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552632542; cv=none;
        d=google.com; s=arc-20160816;
        b=YpRnj5+LYXAbVwj8KZo2sJ2tL1tN+YjFxql+Hv+CuxArxSCMh0BxV2pgFJiMgFawFM
         YXEua+GtCCj9wa6HXGmOKDRN3zyTZHNP+Njq543BDyrRbatKAXUrMSCaRbH7CIDsvzDf
         c4rvBUzJ9D8+YCzqm9pZA3y89o/40PfKHfjFKLoHF6VMyizhPclHV86NVBusjuIomzQN
         GhaIFz45K41LTMZTS9GHcSeq50MfE7eMCskdDiBp63CBB4c/aHLQgsw0AoLbDqYg49sJ
         fz33mWTyNGBDH1R6uaH0dc0fVLySLWkqN7IKSwE7A0VtFx4MuwsnvyGHdMTjs+81+PBg
         dOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=lF6l2L36n0IUirTmqinjvaBBq0ng7l2J/+OUfFhF9Mc=;
        b=Wec3x6Q+AMVF0RTTHP0yxu/aJiT7D+DZp5hCzWQJFYZMUPh6Ybg5mMJNuhVNmStYht
         /earh/Hp0lyJRYRh610ZFVIel8HSNIbYWY0Em7Mb+6+I0UjA37fULzlVvlvYsPSAQ/IB
         QmaqwewobZ07/ChfhcL0NwqqrC582PD7/PpDupw9fsCk28d+QNbSHCvtBqJaK8Xr6Bzj
         yHNsfvlJ95JsA8+VGtdUJ/S4ANkbn5KBbkq3XcprC3nYOd6SHU9No0kPxxFsDaMC2r29
         zIolXEnjgYzFh9zK7hrDeBuDcggqvaH1d9RLowttY/PIOsVc1WaUBHKlYteeBWhCEtbn
         mlSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si869378wrx.207.2019.03.14.23.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 23:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4geL-0002Kv-Au
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 02:49:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4gdo-0001Uj-0l
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 02:48:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4gRw-0004dG-TT
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 02:36:13 -0400
Received: from 5.mo69.mail-out.ovh.net ([46.105.43.105]:50841)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4gRw-0004aW-M0
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 02:36:12 -0400
Received: from player792.ha.ovh.net (unknown [10.109.146.53])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id ADDD44B08E
	for <qemu-devel@nongnu.org>; Fri, 15 Mar 2019 07:36:09 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id A20683C85278;
	Fri, 15 Mar 2019 06:36:01 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190315032629.21234-1-richard.henderson@linaro.org>
	<20190315032629.21234-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <da3fb39f-c0d7-3363-5c81-8fdecc516711@kaod.org>
Date: Fri, 15 Mar 2019 07:36:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190315032629.21234-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 5177169249357106131
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrheeggdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.105
Subject: Re: [Qemu-devel] [PATCH v3 16/23] aspeed/scu: Use
 qemu_guest_getrandom_nofail
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7So2a+mr8HC

On 3/15/19 4:26 AM, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of rolling our own error handling locally.
>=20
> Cc: qemu-arm@nongnu.org
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Thanks

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/misc/aspeed_scu.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index c8217740ef..ab1e18ed4b 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,7 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> -#include "crypto/random.h"
> +#include "qemu/guest-random.h"
>  #include "trace.h"
> =20
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -157,14 +157,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU=
_NR_REGS] =3D {
> =20
>  static uint32_t aspeed_scu_get_random(void)
>  {
> -    Error *err =3D NULL;
>      uint32_t num;
> -
> -    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
> -        error_report_err(err);
> -        exit(1);
> -    }
> -
> +    qemu_guest_getrandom_nofail(&num, sizeof(num));
>      return num;
>  }
> =20
>=20

