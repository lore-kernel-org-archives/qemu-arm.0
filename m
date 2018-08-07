Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4023579wru;
        Tue, 7 Aug 2018 03:14:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpccPoAmztI8qSikE94kwYtMp0Vhwnoy5rn1/F8+8ZlDHgrLrqvR7u5NtoeZhU12ac66oQa0
X-Received: by 2002:a37:2ac7:: with SMTP id q68-v6mr16816556qkq.374.1533636863212;
        Tue, 07 Aug 2018 03:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533636863; cv=none;
        d=google.com; s=arc-20160816;
        b=e5Lx+5xaiZST0bY54MqO6aTCRvQcORYEexIuHiVht6Ego0A+f/1K3eoZ5g2+WUYDyt
         jP9nMKYh0E3DIc1wBmB1ek2FQvF9BvUgU4TlVHm83BOwvEcr77kiUQ1Zd6v1FaADPdzl
         mD/1NZr/3yAwpdFyxT27DzsJAsy0ZEIVbxUPvMfkytKKaGr5H8Hpoqz3MX5ND5tZNBFb
         S+ekRLHavv35uzDB4tFVbzNCZ3W8+5WiTl/N1h95+Kl/srlcGEr4Mx0eSnbC5pLMX22E
         QsQyFycgOWQAXYf1hb/G6sAfpbXkJ4CJQnZ1MkcDy0Rioe2NC8Y2FtdgL/FqXycXg4Io
         sfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=JHb+ReIRQwYWphRHcVb93DWB/EPExL6p5CMjjxYCOxs=;
        b=iLvqk/kg7QEwWimgf+uHh0JRHWFvUiqoabhGVBeiVS6dh6UNKVsX6pPrl9uV/AGReK
         KjRU22k1hnvvCG6U9IMo2BjS+d1RGymeYXVoCMgWXSXiefpVSKFwPMmjtn9Jjc03GKd7
         6PMeRuWaajdyViU2MTqcryceMqFN53sgdeAdNb5VVFOXrizIygINz1YhALLuilqEXdVp
         9ObEpIKvpDfcennzYrpwYEi25hxxM4Bc2tF3J1VEtnVsL4OGYbLohYzS1dCGlt0ljqNf
         Lg3y85gtfPpeJlgK+dK53bBKtGb7aBGD9skpHN+OFZcN9fAWyn1531vNeI/6rGjROD4/
         qy/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3-v6si933625qtk.374.2018.08.07.03.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 03:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmz0Q-0002el-ND
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 06:14:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmz0G-0002e8-L3
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 06:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmz0D-00069K-Tz
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 06:14:12 -0400
Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]:44353)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fmz0D-00067H-NN
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 06:14:09 -0400
Received: from player773.ha.ovh.net (unknown [10.109.143.18])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id D46E014820E
	for <qemu-arm@nongnu.org>; Tue,  7 Aug 2018 12:14:07 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id A4C2A600089;
	Tue,  7 Aug 2018 12:14:00 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <20662f46-f6ca-1c05-e2c5-b7c80692b77d@kaod.org>
Date: Tue, 7 Aug 2018 12:13:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807075757.7242-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 8137723053961087808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.165.38
Subject: Re: [Qemu-arm] [PATCH 3/7] aspeed_sdmc: Set 'cache initial
 sequence' always true
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jxA4pSKkmSqI

On 08/07/2018 09:57 AM, Joel Stanley wrote:
> The SDRAM training routine sets the 'Enable cache initial' bit, and the=
n
> waits for the 'cache initial sequence' to be done.
>=20
> Have it always return done, as there is no other side effects that the
> model needs to implement. This allows the upstream u-boot training to
> proceed on the ast2500-evb board.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/misc/aspeed_sdmc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 24fd4aee2d82..9ece545c4ffa 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -226,6 +226,7 @@ static void aspeed_sdmc_realize(DeviceState *dev, E=
rror **errp)
>          s->ram_bits =3D ast2500_rambits(s);
>          s->fixed_conf =3D ASPEED_SDMC_HW_VERSION(1) |
>              ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
> +            ASPEED_SDMC_CACHE_INITIAL_DONE |
>              ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
>          break;
>      default:
>=20

