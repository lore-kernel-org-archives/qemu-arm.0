Received: by 10.25.0.6 with SMTP id 6csp166577lfa;
        Fri, 12 May 2017 03:27:37 -0700 (PDT)
X-Received: by 10.200.49.1 with SMTP id g1mr2777731qtb.118.1494584857383;
        Fri, 12 May 2017 03:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494584857; cv=none;
        d=google.com; s=arc-20160816;
        b=FmGSrcuFC7BzdBHgrvrAhFX/QF6+FpLcxX5kRnAchGn507xgj1InouQw9INbWdDFVW
         p5L1crwLQrn4qModSpo3cua6kUuPav04k19FgXQkCeWySSJWFxS2kH/wh1Of9JcschYs
         doAj1MP8x2hgKQpdlPgOooAUtHSHeheN88ynRF2nElBES7dqtXmvPBOkCFIYm2au7o6N
         dOvIDhcBzcqfu1Ec1k9Gpj7h/mtW9JG2dF4wej8Womzh76eRi+DEOxqaHPczMgVCGYEd
         FLrtX9eTmO6e2BKXfiAn0e2oTSFkuVj7kY8Dve3N1KE7CtTyT4ZDC5l6py2pYfRZmMEn
         xcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from
         :arc-authentication-results;
        bh=IDOFa4XIfHjLSUNiaJtBD0t1Gf5c3NWI/FUkMEysN5E=;
        b=ROzRtZSvu6mtosuBih5kkMO8V6YnsPeJm/ZY3g8oFEDnVBjKmaAb5eic8ipNTl5tWA
         0EaCcuWgag1CyKy85QJ2A0zbzn9EgRBfKeeKMOFXNQZz2JvlNOZsWePV6UL/OLCcIa5M
         LVV6TMr/zQA1G4ZU0gvyV95yk7c7gY2gyjOlgmIYLiSQwpUM7OkoHiIhv7efZFUgVdHN
         xu6mI52fHzzPQU6+ul0cFngWR450f50GRMhmz6nd/anSiZMUUJtPRfS5hHbVLkVWkQGl
         y97KKsPlLZViOc1v8IyubsopvMdn3dMnQD6rqp6mV9UxbMhHL2teSyAm1iwQ/iR+xFoP
         C6Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q34si2989909qtd.267.2017.05.12.03.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 03:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:52639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d97nM-0001ma-Pw
	for alex.bennee@linaro.org; Fri, 12 May 2017 06:27:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@antfield.fr>) id 1d97nH-0001gW-Cf
	for qemu-arm@nongnu.org; Fri, 12 May 2017 06:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@antfield.fr>) id 1d97nE-0001iQ-9V
	for qemu-arm@nongnu.org; Fri, 12 May 2017 06:27:31 -0400
Received: from bee.antfield.fr ([188.165.75.195]:57018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <luc.michel@antfield.fr>)
	id 1d97nE-0001hk-1M; Fri, 12 May 2017 06:27:28 -0400
From: Luc MICHEL <luc.michel@git.antfield.fr>
To: Luc MICHEL <luc.michel@git.antfield.fr>
References: <20170428125632.5704-1-luc.michel@git.antfield.fr>
Message-ID: <39e542f5-59e1-7598-f751-ee905ce264e3@antfield.fr>
Date: Fri, 12 May 2017 12:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170428125632.5704-1-luc.michel@git.antfield.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XL2bfSxRpjAumrC7wVtqMgD5SQMflOQqk"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/1] target/arm: add data cache
 invalidation cp15 instruction to cortex-r5
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1/DONl7kwymg

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XL2bfSxRpjAumrC7wVtqMgD5SQMflOQqk
Content-Type: multipart/mixed; boundary="4t7KEjRedpSFPXaRpTDXBurvQck9oLKmm";
 protected-headers="v1"
From: Luc MICHEL <luc.michel@git.antfield.fr>
To: Luc MICHEL <luc.michel@git.antfield.fr>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Message-ID: <39e542f5-59e1-7598-f751-ee905ce264e3@antfield.fr>
Subject: Re: [Qemu-devel] [PATCH 0/1] target/arm: add data cache invalidation
 cp15 instruction to cortex-r5
References: <20170428125632.5704-1-luc.michel@git.antfield.fr>
In-Reply-To: <20170428125632.5704-1-luc.michel@git.antfield.fr>

--4t7KEjRedpSFPXaRpTDXBurvQck9oLKmm
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

ping

The patchwork link: https://patchwork.ozlabs.org/patch/756408/

Thanks,

--=20
Luc

On 04/28/2017 02:56 PM, Luc MICHEL wrote:
> This patch adds the cp15, CRn=3D15, opc1=3D0, CRm=3D5, opc2=3D0 coproce=
ssor
> instruction
> to the cortex-r5. As stated in the TRM, this instruction invalidates
> all the
> data cache. This trivial patch implements it as NOP as cache
> operations are not
> implemented in QEMU.
>
> The documentation is here:
> http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi0460d/=
Bgbdbdjc.html
>
> Tested using this minimal program:
>  .global _start
> =20
>  .section .text
>  _start:
>    mcr p15, 0, r1, c15, c5, 0
> =20
>  idle:
>    wfi
>    b idle
>
> Before implementation:
>  IN:
>  0x00008000:  ee0f1f15      mcr 15, 0, r1, cr15, cr5, {0}
>
>  Taking exception 1 [Undefined Instruction]
>  ...from EL1 to EL1
>  ...with ESR 0x0/0x2000000
>
> After implementation:
>  IN:
>  0x00008000:  ee0f1f15      mcr 15, 0, r1, cr15, cr5, {0}
>  0x00008004:  e320f003      wfi
>
> Luc MICHEL (1):
>   target/arm: add data cache invalidation cp15 instruction to cortex-r5=

>
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>



--4t7KEjRedpSFPXaRpTDXBurvQck9oLKmm--

--XL2bfSxRpjAumrC7wVtqMgD5SQMflOQqk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlkVjjIACgkQd8knW3Qn
Tr6QNBAArgtXMQNdpYO3U5+eJJzhBhc9XYOgMMxtAdclvmWcBVxUkEZgzajX1Cy5
rA+uvj8VKjsC6Edv5IltmRkWGDLex7G7R673fVLU0sQ9ucKWv96fOlQ/JpMBvL0t
VyI8WnntUFobPrbZZojfJruRnya1uhqKwVaH346p0dpf2Xtrz4gUlKpzn01LG+qN
Ft7OmAVpPn71223LWLADuISedlxR0nezX1dAb7c+PxFEy4eEG1GBeOSbT4BoAYmx
auv8wH8P0W49z16z9vCdHkEkCCmi3mz35UjsJXS9nw2wgKn94xW3OllqHex85hKs
OAShPlGHhepv0yp6/V9fbI+PRd05FINkVljkOWHRjfJE1JFyi7MO45WTFjODRmre
AlsbbV5Q2Eg5pKrKsEl+Pw194XRxG/MooRAefQAROnPcB9PmV25PJq7fyD7a1kbk
c8Rl3eLAs7jmrQaB4wcaUNVokXR/sby0OGEXihLscBEYDJRvsUZozTGRL4h+HuWY
nuXwzwaXylwN6/W+6aHZFEJEQv25t4JsrWZDweeNtxEF7FezXIlp5yNF48T2+Cy1
ai8etFNvY1Y4wKVh1oUs1Oz34ap5+YwY5ruVlFBYskPXiA0o60ggkYtGDeIj/3/u
J4TVVdJiDFsYsEaIOb6BPEiaLhvYzanhjElx/5YqW6HQoh97iS4=
=/VlO
-----END PGP SIGNATURE-----

--XL2bfSxRpjAumrC7wVtqMgD5SQMflOQqk--
