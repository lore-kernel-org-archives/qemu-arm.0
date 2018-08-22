Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2823373wrd;
        Wed, 22 Aug 2018 01:22:54 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbGvKuC3Pm7eW5UvXkcfNxtk4Y70Zg/eUM43b6TZT+ajE8zJ5C3ySifPGMHo/YJu+GIeYeI
X-Received: by 2002:ac8:2c27:: with SMTP id d36-v6mr20129257qta.205.1534926174012;
        Wed, 22 Aug 2018 01:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926174; cv=none;
        d=google.com; s=arc-20160816;
        b=V4CiTDuHoYzVsvEJUg8Zc3Y7lVVEWNIg4qIF0J7f1ozA35xlbcbihNHF4Rllz9UotM
         ldC7ICbbskkT/Hje8fUVGCmDJU8bVwHIb1M7cwVE5OIzDNNbL7gdI4OtVMk1fekiR/HJ
         /FiWNHUG6N7hiO9dBdy8VtYg/UFQXza3jPB8iCV/GAuONyxjGf+aKr6nU78E25zHUvbj
         q249jgef5LH6vNV3X0/6XJ9nIfhgJ2SJRk61PPLjX+m6ew6QxNp3PGhaHZN/+J7Kg98s
         XqY6NtK8z0XDXkG//wzYAa7MMIANZPzmG8hJS5P6NMHD7P1yr/q3emqxBPTIX8TzGO6N
         KwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=MDbzPWeuxymfEcEW0knKnTDNuRjq+UbsVDvXdnAKY3o=;
        b=IWQ1MKaD0LPpXVY0PqlVCsNDXW9IHHp70cVAqYbaCXtTB1ivjzFKXwyQBMVgsFqL8i
         oC1LVwsk3z4zToHyGFTgWfPnsiDsVphASLTPIQ9QLprxl3A/IxjkIgQ4UdWEd/fBgfOF
         KOUCzWTBfWoT4feyDC9gXqwCOqSeWfmiECPVCeKSeJP2GjxUaIS0kmBCvB0LhS0puLNh
         ekWel6nxgN5NnvrHKmxxQTnyIW74UYAGPkxX+pXct6RUwVC8rVfBl4SMSl0/bC+ZPvM5
         c3IbJxJ3WHpRARYl/3JE1WkZy0AEbiY5lTVg/u/LNWlZkeKxgwNZ9JXxFJPbIZz57l4J
         4/oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RGxOMzVd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0jSU7Pv0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0jSU7Pv0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p28-v6si1117351qtf.16.2018.08.22.01.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RGxOMzVd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0jSU7Pv0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0jSU7Pv0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOPl-0002KR-DA
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:22:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOJP-0004zV-2S
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 04:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOJN-0004e2-6B
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 04:16:19 -0400
Received: from greensocs.com ([193.104.36.180]:36890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOJE-0004aD-UI; Wed, 22 Aug 2018 04:16:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B1703DFFF5;
	Wed, 22 Aug 2018 10:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534925761;
	bh=FEv0+5I7HR9msIcwr/iQY/9NSJiHPPMUCnMAMhDipNw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=RGxOMzVdNFM/6ojBg83UN+4Rd0EMKBuI+Xpkev0IcNfKOvaGk+zgb2nLg4xmI3Nho
	+jDvBqGNUxOBTDWhlTLOUb1TAEYlwg4SEHJbuBJtTxML2+7ST1xfIHHWcGHboituS/
	/5byihDL1gVWkvKAntQYXURmwK8oorX0j+P3nAuM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=0jSU7Pv0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=0jSU7Pv0
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svYjxUxKuSKW; Wed, 22 Aug 2018 10:16:00 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9489A23874E; Wed, 22 Aug 2018 10:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534925760;
	bh=FEv0+5I7HR9msIcwr/iQY/9NSJiHPPMUCnMAMhDipNw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=0jSU7Pv0qGOL/ob5xi2U3F+F7Vf0EYc8uiFT+G9fKOoMhHJ7b5UooILH6jOvBEIS9
	9KgnlZE7RierlJF75VIQcbHoRvIWQ80CmvgQbTZiG9dcWZKo2IrgMX/b/fxro0Pw5q
	92HbLUS6xJea6VUBkY9dAsNLziOt9+I6/rSthdlw=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 59934DFFF5;
	Wed, 22 Aug 2018 10:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534925760;
	bh=FEv0+5I7HR9msIcwr/iQY/9NSJiHPPMUCnMAMhDipNw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=0jSU7Pv0qGOL/ob5xi2U3F+F7Vf0EYc8uiFT+G9fKOoMhHJ7b5UooILH6jOvBEIS9
	9KgnlZE7RierlJF75VIQcbHoRvIWQ80CmvgQbTZiG9dcWZKo2IrgMX/b/fxro0Pw5q
	92HbLUS6xJea6VUBkY9dAsNLziOt9+I6/rSthdlw=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-2-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <7421acd0-4c9d-95ca-dbd2-a903ef0ee2b8@greensocs.com>
Date: Wed, 22 Aug 2018 10:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-2-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="E9r24IIsJoWN0pfovn6XKiYHCmb2EPysw"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 1/9] hw/intc/arm_gic: Document QEMU
 interface
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKnttaWiufhT

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E9r24IIsJoWN0pfovn6XKiYHCmb2EPysw
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <7421acd0-4c9d-95ca-dbd2-a903ef0ee2b8@greensocs.com>
Subject: Re: [PATCH 1/9] hw/intc/arm_gic: Document QEMU interface
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-2-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/21/18 3:28 PM, Peter Maydell wrote:
> The GICv2's QEMU interface (sysbus MMIO regions, IRQs,
> etc) is now quite complicated with the addition of the
> virtualization extensions. Add a comment in the header
> file which documents it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I needed to write this out to figure out what I was
> connecting to what in the a15mpcore object :-)
> ---
>  include/hw/intc/arm_gic.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
> index 42bb535fd45..989bc837606 100644
> --- a/include/hw/intc/arm_gic.h
> +++ b/include/hw/intc/arm_gic.h
> @@ -18,6 +18,41 @@
>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +/*
> + * QEMU interface:
> + *  + QOM property "num-cpu": number of CPUs to support
> + *  + QOM property "num-irq": number of IRQs (including both SPIs and =
PPIs)
> + *  + QOM property "revision": GIC version (1 or 2), or 0 for the 11MP=
Core GIC
> + *  + QOM property "has-security-extensions": set true if the GIC shou=
ld
> + *    implement the security extensions
> + *  + QOM property "has-virtualization-extensions": set true if the GI=
C should
> + *    implement the virtualization extensions
> + *  + unnamed GPIO inputs: (where P is number of PPIs, i.e. num-irq - =
32)
"where P is the number of SPIs"
> + *    [0..P-1]  SPIs
> + *    [P..P+31] PPIs for CPU 0
> + *    [P+32..P+63] PPIs for CPU 1
> + *    ...
> + *  + sysbus IRQ 0 : IRQ
> + *  + sysbus IRQ 1 : FIQ
> + *  + sysbus IRQ 2 : VIRQ (exists even if virt extensions not present)=

> + *  + sysbus IRQ 3 : VFIQ (exists even if virt extensions not present)=

> + *  + sysbus IRQ 4 : maintenance IRQ for CPU i/f 0 (only if virt extns=
 present)
> + *  + sysbus IRQ 5 : maintenance IRQ for CPU i/f 1 (only if virt extns=
 present)
I think it's more like

For a GIC supporting N CPUs:
  + sysbus IRQ 0: IRQ for CPU 0
  + ...
  + sysbus IRQ N-1: IRQ for CPU N-1

  + sysbus IRQ N: FIQ for CPU 0
  + ...
  + sysbus IRQ 2*N-1: FIQ for CPU N-1

  + sysbus IRQ 2*N: VIRQ for CPU 0
  + ...
  + sysbus IRQ 3*N-1: VIRQ for CPU N-1

  + sysbus IRQ 3*N: VFIQ for CPU 0
  + ...
  + sysbus IRQ 4*N-1: VFIQ for CPU N-1

  + sysbus IRQ 4*N: maintenance IRQ for CPU i/f 0 (only if virt extns
present)
  + ...
  + sysbus IRQ 5*N-1: maintenance IRQ for CPU i/f N-1 (only if virt
extns present)

> + *    ...
> + *  + sysbus MMIO regions: (in order; numbers will vary depending on
> + *    whether virtualization extensions are present and on number of c=
ores)
> + *    - distributor registers (GICD*)
> + *    - CPU interface for the accessing core (GICC*)
> + *    - virtual interface control registers (GICH*) (only if virt extn=
s present)
> + *    - virtual CPU interface for the accessing core (GICV*) (only if =
virt)
> + *    - CPU 0 CPU interface registers
> + *    - CPU 1 CPU interface registers
> + *      ...
> + *    - CPU 0 VCPU interface registers (only if virt extns present)
CPU 0 virtual interface (GICH*)
> + *    - CPU 1 VCPU interface registers (only if virt extns present)
CPU 1 virtual interface (GICH*)
> + *      ...> + */
> +
>  #ifndef HW_ARM_GIC_H
>  #define HW_ARM_GIC_H
> =20
>=20


--E9r24IIsJoWN0pfovn6XKiYHCmb2EPysw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9G78ACgkQd8knW3Qn
Tr777w/8D6tHmil9ayMGzOUe+nn+qMsboQKeEzs7WRrWYyp3gbsGC1LvHNGRghMI
9jRJ3UZd7Ps3aGRpqjq2kyfkVrIGr0SiUW8QyHxFNwde+9UMCrZBRCzbh4p7gxhC
+s1PPvhNGmwG+vI1h0UEhK7jSIOeFF6VSb6cy/tjEaGe2vpPUWYa2ujYSIYEzSTP
vDJSoVtpxbJKKWGrXjA+k1m7McVksb8DnL+FcYPyGz0h/WRek21Z0tx9XJa4k7wK
68EBkusKfatvaXCaxOGycI5mcTVaf0i5RUFNIaczB840RTTFAwFRJJx6QxAA7oZa
yLvrIJIHyjly84LngOwm1VBItuCMqnNwzDxsfa4B26+zFOSIOcjoEmADtV9C4dFk
+hwd7ZBpme2dynp+SAsiFxgUibBc+QV6fsFlNU1mVHaXat7maGgiVCfde3GF7pQx
h0m6rUETAF3k0FqdzZUNS3pCLcvVafeO/yyHUig32j6yOkyBSC8W7zf7ui48T5lX
LbHnoNyhDciwUY1MedSkxT5y41TYYOduSebc/m8edb7efFrXT4iz66R/XJ0cJ/BK
WHUiQT6S0oD2vT9PEYyA/pZ6HoSqbFHKtNVPLJYt5tqVUR1ula1C/2cc02zvc11q
TThCRbY4V7M0G/bSvqyc0CJkx99oo9Wp0CqL3PVe5K21WAifecs=
=ahCz
-----END PGP SIGNATURE-----

--E9r24IIsJoWN0pfovn6XKiYHCmb2EPysw--
