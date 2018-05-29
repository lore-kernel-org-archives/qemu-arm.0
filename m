Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3692227wre;
        Tue, 29 May 2018 08:23:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL0rG/x563oygNp3oOeJQVSpcVA7OaWDxblXVTAg6ymu7SHVfiWmHezR8ms6VP7Ctt1qyTS
X-Received: by 2002:a0c:af99:: with SMTP id s25-v6mr13938804qvc.175.1527607410291;
        Tue, 29 May 2018 08:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527607409; cv=none;
        d=google.com; s=arc-20160816;
        b=PXlZfRV4jwcos2v+hJAS0D2d9kSeDaNZ1uVskMbxtPSgEyGzoe1RULcdtaSfxYuV1e
         8zATIM4KaahgqX+2HWWoRzAKAHRpRpKxStyuCa76RFUuAPkwg4nBMshJVbhNBRy9KZRl
         K/2+QJ2CubBoqiRGHC9o07hTFOPJ9fV00ePSAEkwLAJxf9eXKEPq909Kt/PmZN/kk8Tb
         uyGNpPT2u86vGRQWNdRBDm7S+NzhvRRLc1UhdkeVCwK50Z3gBV4lRtPEvKIyTU+86oXT
         pgynWVZHrxHcu3+9yEhwB8PP+eXbtDzbTgbZy8TArdbZQ+Ncjon5HM2ZBpaUQhKeSPQE
         Dl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=RnqGMSVlI5gUQFpu8blK8dOStqy/9sEf4GOYdhD81tk=;
        b=bL3T3I5uDmfULDO+db9sYXMGOai3EZPArmK13Ix75cPSi5MEy/BcXFIfh+7jTBvbtV
         s/TLolx/qhg9emIjgKHkzacVq1ObjRkbHDkqJGxnhnMnpIBs4oE2yoxHTsaVL/NZJuTx
         ojLp6le7NQLYZvSGF53Crdw3AB1eu/i47/mmtY48D4ARn9OHl2s1Ppio7GEo5oSDS+AQ
         tIySIlk1dAWD7G4LGlEoX1v2UbZM6tFhi5Ha7QSr/IFMVRJaNt3IRDWD6DFLDLd//IfQ
         RSP9wRfa00X/HTk+wD5hGBJJoQhB63mVyj8vhzR10zobKHflyXIKpJh5iBFiFWO1TLhQ
         482A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jn9dxKEH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n184-v6si1293748qkb.113.2018.05.29.08.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 08:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jn9dxKEH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNgTB-0000bo-1u
	for alex.bennee@linaro.org; Tue, 29 May 2018 11:23:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNgSl-0000a1-Ib
	for qemu-devel@nongnu.org; Tue, 29 May 2018 11:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNgSk-00069J-Gu
	for qemu-devel@nongnu.org; Tue, 29 May 2018 11:23:03 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42326)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNgSk-000695-Av
	for qemu-devel@nongnu.org; Tue, 29 May 2018 11:23:02 -0400
Received: by mail-ot0-x241.google.com with SMTP id l13-v6so17394657otk.9
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RnqGMSVlI5gUQFpu8blK8dOStqy/9sEf4GOYdhD81tk=;
	b=Jn9dxKEHBylLoF04B0CoSO9GGlDLp0yyffShL+KB7CG1nhZSkK/RLuc3ods7xwmBdp
	twKNSr2lOWbK1qdR/9cWPwOpQmvbyqnARfeVQ1vaQooIYQ/vaO7iNC6+5btE3nD0/RIs
	kmkwZSnGOgiA+wAu80gmUKPxE6WxnMBcjrAvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RnqGMSVlI5gUQFpu8blK8dOStqy/9sEf4GOYdhD81tk=;
	b=gxIK41UTQoRf0VMbj5h0s4n7iPEZeByfLzhXPeCywDN86bknHOVVsG6TndM8wkcMGR
	D9e6idiQ22CMKkhhlSuk7xwzH2XTahGgMiWOILDd5SwklTkmMODtM021M7F9vJALB49G
	+7IGUvfw61U0RO0yrS67yEgujSxRztmDLL1U3NVD0HoyR4CGP815fUstUro68PzunpU4
	FEA7PW88Y9PH2BoL3NleEpA96BhM0JdSC4ouAVZHhMBdKPvKdZdSib+O5AbdzhJ6niSv
	ExTuDAn0Y4b1dh0f67upcuvmZ0jAr7xDfQLgOyUnJEI32cke+aRV03Rgrl5et8X3uSOE
	crUg==
X-Gm-Message-State: ALKqPwfPV8kLVMxSNpL33+ThwdOurCOY26+Kgvj2hddFiy/PgZSiH3/G
	1M5n8wxZRwNKaOCclEeYJpf2Qhw6GQFsf1quDH/bs30x
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr12301179otd.210.1527607381604; 
	Tue, 29 May 2018 08:23:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 08:22:41
	-0700 (PDT)
In-Reply-To: <20180529041946.9481-1-joel@jms.id.au>
References: <20180529041946.9481-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 16:22:41 +0100
Message-ID: <CAFEAcA8H66jcoi2FXWPRpyoQ4OT955awzLEj+gMKTMctoYxqEQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3] aspeed_scu: Implement RNG
 register
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TfRktWpgtpHJ

On 29 May 2018 at 05:19, Joel Stanley <joel@jms.id.au> wrote:
> The ASPEED SoCs contain a single register that returns random data when
> read. This models that register so that guests can use it.
>
> The random number data register has a corresponding control register,
> however it returns data regardless of the state of the enabled bit, so
> the model follows this behaviour.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Remove call to qcrypto_random_init as this is done in main()
> v3:
>  - Add C=C3=A9dric's reviewed-by
>  - Add a comment about why we don't check for the rng enable bit
> ---
>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 5e6d5744eeca..96db052389cc 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,6 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> +#include "crypto/random.h"
>  #include "trace.h"
>
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_N=
R_REGS] =3D {
>       [BMC_DEV_ID]      =3D 0x00002402U
>  };
>
> +static uint32_t aspeed_scu_get_random(void)
> +{
> +    Error *err =3D NULL;
> +    uint32_t num;
> +
> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
> +        error_report_err(err);
> +    }
> +
> +    return num;
> +}

This will return an uninitialized value if qcrypto_random_bytes()
fails.

Does the guest use this value for cryptographic purposes?
In hw/misc/bcm2835_rng.c we opted to make qcrypto_random_bytes()
failing be fatal (for reasons noted in the comment there),
though that is a bit rough. exynos4210_rng() is more conveniently
able to just never report to the guest that the PRNG is ready.

thanks
-- PMM
