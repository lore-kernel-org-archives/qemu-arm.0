Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2593084wre;
        Mon, 28 May 2018 08:27:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJC+mHCpJ09s6hkgAoNnN2hRJbJM762wLxjXb3HMzoGbrbIuufMFp+g0PKi5KqZDapA2d03
X-Received: by 2002:aed:22f8:: with SMTP id q53-v6mr12345121qtc.99.1527521262056;
        Mon, 28 May 2018 08:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527521262; cv=none;
        d=google.com; s=arc-20160816;
        b=AEWHFxBao92vPfE5o0Q9cXeqM9EOi7gWda3muAGtKyjwFN1rIpWkKz+qcRWz7ChOJR
         hS9Vc/MqhNvYMnbGxP5W5rlNUHOBn985Sls9/D+HOeB4CFtmNyb6jAPI2b7/RVVNcQXj
         vETR8cDLFvxJVwG23hmR7QqIlYlPxgZWz0ygodjXvTVOAijdqd4kOzUBtNBRzjWr9iML
         gDRkLjw/q4Oy6+ugVZaxHpOw7h/hvgtFu8hsZIvaS9h00N/r9UCIqTj/Xev7yDnApOt9
         nbzwSVtNm0Z0cxbDD9P0GJjL+21XMXgzCHaThI/sMTMNcXJEK0iKfklqn1M+9d3xljf4
         eluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=bK1rtONtknj+klH4M/Qt7JVk1K8DmQRRsryshsnf1kI=;
        b=Lyyk5ix66q+yopoJiBdf3mbKaCtbsUGg6W+jZ5mUwG2/3XFp4ileX135c8mNyebfb7
         NzVFYD+9ra/EZgtpO9iRdUy4/YbyB7Ss7qpOCRzqbiEyx1cLlVAQqT0J3dUQA+if9Ja9
         dFvPdeKM5VV0YsXhGmpS4r86SsxOZxzWlMTIyPAaHOigYUNfz/hUIJUofeesp5XHkwVx
         SS5rVXMOtD1hCYxmRtwTfA22tg7P5A7dfqFItj9+4Ua7/ZGkYzft6KAUJMBMdYdm5oMg
         t8c2jpS+42O/fnyH+TGkBs/BdxnxBPM1SqNvUuOh96lkT48iUS9Qof2onTlWtCDtsjvl
         tpxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w72-v6si653798qkg.362.2018.05.28.08.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 08:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNK3h-0005LU-KJ
	for alex.bennee@linaro.org; Mon, 28 May 2018 11:27:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNK3L-0005KJ-Ss
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:27:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNK3J-0005cz-9h
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:27:19 -0400
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:33709)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNK3J-0005bL-3s
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:27:17 -0400
Received: from player787.ha.ovh.net (unknown [10.109.120.88])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6B894ACA74
	for <qemu-devel@nongnu.org>; Mon, 28 May 2018 17:27:15 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player787.ha.ovh.net (Postfix) with ESMTPSA id 7A9FF6000C9;
	Mon, 28 May 2018 17:27:10 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180528152225.7108-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <52cd00d2-866d-fb11-fabd-d5de2b375f06@kaod.org>
Date: Mon, 28 May 2018 17:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180528152225.7108-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2292895162295094187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheeigdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.49.208
Subject: Re: [Qemu-devel] [PATCH v2] aspeed_scu: Implement RNG register
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PBhV4LwmPH6i

On 05/28/2018 05:22 PM, Joel Stanley wrote:
> The ASPEED SoCs contain a single register that returns random data when
> read. This models that register so that guests can use it.
>=20
> The random number data register has a corresponding control register,
> data returns a different number regardless of the state of the enabled
> bit, so the model follows this behaviour.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v2:
>  - Remove call to qcrypto_random_init as this is done in main()
> ---
>  hw/misc/aspeed_scu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 5e6d5744eeca..29e58527793b 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,6 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> +#include "crypto/random.h"
>  #include "trace.h"
> =20
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU=
_NR_REGS] =3D {
>       [BMC_DEV_ID]      =3D 0x00002402U
>  };
> =20
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
> +
>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned =
size)
>  {
>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwadd=
r offset, unsigned size)
>      }
> =20
>      switch (reg) {
> +    case RNG_DATA:
> +        s->regs[RNG_DATA] =3D aspeed_scu_get_random();
> +        break;
>      case WAKEUP_EN:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Read of write-only offset 0x%" HWADDR_PRIx =
"\n",
>=20

