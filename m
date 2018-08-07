Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4034560wru;
        Tue, 7 Aug 2018 03:28:47 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwtfBLoP8DQ9kihUHbWbRFsfZp9CArcb6Z2MiP0rdyUWNSaQ070E50aecuQefpdBZz2ByQ+
X-Received: by 2002:ac8:2485:: with SMTP id s5-v6mr5820241qts.107.1533637727122;
        Tue, 07 Aug 2018 03:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533637727; cv=none;
        d=google.com; s=arc-20160816;
        b=EKlFBZgTRH9OvRgtY99miFeNg+vmtrFu0qLr/z5BtOWbRmfi2rQheRq2IPlU0WL8P+
         JaA4gBUWl6vm9sqVNkAjcBhhgEz1j2Q/jAGgh74U5egZjA3EKyNmD29n8C6pw/6WKXwv
         tKYaq1f6a/Zq7tzdIgDSZDzyKk7NDZOHVY/cO8m1EcGHb6oMVvzIRIr+/Mgy6U57sSz4
         mX07AFAzNoL+0Js5qcP7EmfjA3wBz0u5q198tWvWsqpN0iY8+uKKq8wupyQ5gFKtZ6Hf
         H0m5qqavtxHbsTPQgmMBejYk5Wugld0eozdwNc8vtjK3mN746uc29dIdTe1u22bLNPEE
         UojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=9BPkXKs2JIStW5vvzr/NvZ1fYmIdjXhtBDxlh284pVE=;
        b=FAyDRGCYlqxzPUly1CoR/MGwUryW3yagCDLO+NzOhcBCejxqRvfkl+0Ei1WOwmBzpy
         9PjYeY1Vk7vzKddYAF+taRadtreuMyKOU0jCW13KdKSKMjqogfN2uf+Gh+3/JUiYDPkX
         hBh0v5UW4mS5cNkpzFGYXzdpMgGIbV/ofgXHkgnUdJHRHrabp/x8K8wc6gUbyfVqweMm
         MVvfEwc22jWJGwA+A7Wv9VbeLcx48pKXl1s1uMTlv+nnn3WjdPKGB8Zc72GI6Rk7oAgT
         44K2PLmPcFlak8x9qeCtKjLMWMeuYWiwED09J+rn9uJFpA5b+a4igy2SpeKsPl38485h
         xhkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o41-v6si876328qvc.181.2018.08.07.03.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 03:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmzEM-0008Mm-N5
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 06:28:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmzDL-00083j-62
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 06:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmzDG-0003zX-Ve
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 06:27:43 -0400
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:38279)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fmzDG-0003yN-OS
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 06:27:38 -0400
Received: from player695.ha.ovh.net (unknown [10.109.143.225])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id EAB69E18A6
	for <qemu-devel@nongnu.org>; Tue,  7 Aug 2018 12:27:36 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id AD6DC4600CC;
	Tue,  7 Aug 2018 12:27:26 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-5-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6fd6639f-9399-ffea-9924-9ccf85efd6ec@kaod.org>
Date: Tue, 7 Aug 2018 12:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807075757.7242-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 8364873359048149824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.43.140
Subject: Re: [Qemu-devel] [PATCH 4/7] aspeed_sdmc: Init status alwlays idle
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
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bgrf1uYsuVra

On 08/07/2018 09:57 AM, Joel Stanley wrote:
> The ast2500 SDRAM training routine busy waits on the 'init cycle busy
> state' bit in DDR PHY Control/Status register #1 (MCR60).
>=20
> This ensures the bit always reads zero, and allows training to
> complete with upstream u-boot on the ast2500-evb.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

One comment below, no need to resend for that.

> ---
>  hw/misc/aspeed_sdmc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 9ece545c4ffa..522e01ef8c0d 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -23,6 +23,10 @@
>  /* Configuration Register */
>  #define R_CONF            (0x04 / 4)
> =20
> +/* Control/Status Register #1 (ast2500) */
> +#define R_STATUS1         (0x60 / 4)
> +#define   PHY_BUSY_STATE      BIT(0)
> +
>  /*
>   * Configuration register Ox4 (for Aspeed AST2400 SOC)
>   *
> @@ -137,6 +141,17 @@ static void aspeed_sdmc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>              g_assert_not_reached();
>          }
>      }
> +    if (s->silicon_rev =3D=3D AST2500_A0_SILICON_REV ||
> +            s->silicon_rev =3D=3D AST2500_A1_SILICON_REV) {

Maybe use the ASPEED_IS_AST2500() ?=20

It would be nice to have a set of macros we could use in the different
models testing the SoC silicon revision. How about :

#define ASPEED_AST2400 0x2
#define ASPEED_AST2500 0x4
#define ASPEED_AST2600 0x6

#define ASPEED_REVISION_MAJOR(si_rev)     (((si_rev) >> 24) & 0xff)

#define ASPEED_IS_AST2400(si_rev)  (ASPEED_REVISION_MAJOR(si_rev) =3D=3D =
ASPEED_AST2400)
#define ASPEED_IS_AST2500(si_rev)  (ASPEED_REVISION_MAJOR(si_rev) =3D=3D =
ASPEED_AST2500)
#define ASPEED_IS_AST2600(si_rev)  (ASPEED_REVISION_MAJOR(si_rev) =3D=3D =
ASPEED_AST2600)


Thanks,

C.


> +        switch (addr) {
> +        case R_STATUS1:
> +            /* Will never return 'busy' */
> +            data &=3D ~PHY_BUSY_STATE;
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> =20
>      s->regs[addr] =3D data;
>  }
>=20

