Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp455278wru;
        Wed, 18 Jul 2018 06:24:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdxqdIu9lFIBWhj6yykegUF9KJBqtehe53t6ChgtsRMWOAzgsLNzDztLrdeWP9V0lcDX7iJ
X-Received: by 2002:a0c:9408:: with SMTP id h8-v6mr6356450qvh.135.1531920262865;
        Wed, 18 Jul 2018 06:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531920262; cv=none;
        d=google.com; s=arc-20160816;
        b=yord/LjaLxyujKPoVaNyCSdkQ5eCiRfl+/nq4KuCzd7Iuy38taqyaId+/hh1BJ6sHa
         GIQSmzX+JgrFkX9Xiij1Sh7VFmTEXNA/8o3ONgp5IFR3uh+PjurxX5COOsRGIaBXb/ZG
         /SReL+Bk3nSLKp85GFLFOWlQ8lsOmcCWOXnbbzGY3YCX/WCFP9DvDAKQLi7S3LMNSolc
         wqyx4ih9hN2tNeqv8FT2UnHGXw+wwpnoS9KVGJ4E3Yc6VemDWhpsx0Ntc0euPCCIdc2x
         jB7T7fM5TWkcv6ypl0gqBhaoawZkP0fw9nVOcY7YNzJYPj6YuQ3jww/+vV0DCmHhSRpa
         +50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=u5jqJqBXwR+1IsCNFAoqIwNovTEUvuQ0+154VpO4Y3w=;
        b=FSLeYH7uGk6eZLJdIP8+HdbPHJKo2Hknehew8POSLTu7Huhnns1QkCKtpXkogwkloN
         +p1ZNBNFA7sEKgNIVjBmkDk61yNnMwr56lEZqjUWqmKhNq6agTwCf9jb48K6aXMMCfZt
         38MVyisee0QAJ49JwXQ2zYB7ROdwZ9L9AAIBCEYkNp3fAx8vJqT+FB2C4BSP2gfx8XNi
         11e7NmKCxr3mFwW/kYsJfYVNZiG5QHf0v0EVH9KO0oP0PuEfdtJ7tRtdx7b/GxIdBH5R
         F6u/BpFN8XB/hnM43z1xLDVu1I3pOU96xxCMka32i9Ypkg3ka6KwsiQhzXlmm2Swwgkq
         FPdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ecRTE5hs;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IT2YrYyK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IT2YrYyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si1060192qte.29.2018.07.18.06.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 06:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ecRTE5hs;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IT2YrYyK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IT2YrYyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffmRK-0002R5-9I
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 09:24:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ffmPs-0001dN-C8
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 09:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ffmPp-000323-0N
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 09:22:52 -0400
Received: from greensocs.com ([193.104.36.180]:42314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ffmPo-00030m-Fe; Wed, 18 Jul 2018 09:22:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 17D16C7AE5;
	Wed, 18 Jul 2018 15:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531920158;
	bh=vOaIz9q7eGn/BzpxqLhJByf4RkZiPuDus5Jq6ZgCcLA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=ecRTE5hsuyXzyXA+i3G0VJw5qIZY74QdXvDZ50Fws4cPFgLSZp5TYGycnfoulS8So
	m/clD2J7Xb8M5e8CAn6XCer2SfGGW54pXzKrVqQbhIaDwsYmbIfFjPMavodeDDNxmV
	k4E3qP9HCpZ67/ah35AB4vNrLHal3s/qi4Oal+og=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IT2YrYyK;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IT2YrYyK
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlE3fCq8TZ5w; Wed, 18 Jul 2018 15:22:36 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id DE9B4C7AFA; Wed, 18 Jul 2018 15:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531920156;
	bh=vOaIz9q7eGn/BzpxqLhJByf4RkZiPuDus5Jq6ZgCcLA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=IT2YrYyKTdxIMdKQwxgjSOOMAZhTu3pnKyfsuqqMJeu4RCVTbMqUldik23nG8EUna
	rPJ8JtLbHf5bpIg60gbfo7B9Mw6tp1ZWeoMZaf4eGZ96XFB7Xs0AbQhTNkjGlJl65l
	COvEfFBbizDFtsHxQ8S0AxyNotPZpv46usW9WDPA=
Received: from [192.168.10.102] (unknown [105.98.114.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2DD86C7AE5;
	Wed, 18 Jul 2018 15:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531920156;
	bh=vOaIz9q7eGn/BzpxqLhJByf4RkZiPuDus5Jq6ZgCcLA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=IT2YrYyKTdxIMdKQwxgjSOOMAZhTu3pnKyfsuqqMJeu4RCVTbMqUldik23nG8EUna
	rPJ8JtLbHf5bpIg60gbfo7B9Mw6tp1ZWeoMZaf4eGZ96XFB7Xs0AbQhTNkjGlJl65l
	COvEfFBbizDFtsHxQ8S0AxyNotPZpv46usW9WDPA=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-13-luc.michel@greensocs.com>
	<CAFEAcA9dQEaONA3AkqnyY3PnkMHNcjc=MiBwoF99oHp-BJuRFA@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f2c6cd9a-0136-5a4c-64d8-854661f4278d@greensocs.com>
Date: Wed, 18 Jul 2018 15:22:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dQEaONA3AkqnyY3PnkMHNcjc=MiBwoF99oHp-BJuRFA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eo7GDi919OnPI5oeRcSVxzYHrlrzVhuoe"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v4 12/20] intc/arm_gic: Implement
 virtualization extensions in gic_(deactivate|complete_irq)
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HfjkfL4yePpB

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eo7GDi919OnPI5oeRcSVxzYHrlrzVhuoe
Content-Type: multipart/mixed; boundary="vHLJu9uvW5B1OfmS5Pbr7AEiJ9wDBjKaS";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f2c6cd9a-0136-5a4c-64d8-854661f4278d@greensocs.com>
Subject: Re: [PATCH v4 12/20] intc/arm_gic: Implement virtualization
 extensions in gic_(deactivate|complete_irq)
References: <20180714171601.5734-1-luc.michel@greensocs.com>
 <20180714171601.5734-13-luc.michel@greensocs.com>
 <CAFEAcA9dQEaONA3AkqnyY3PnkMHNcjc=MiBwoF99oHp-BJuRFA@mail.gmail.com>
In-Reply-To: <CAFEAcA9dQEaONA3AkqnyY3PnkMHNcjc=MiBwoF99oHp-BJuRFA@mail.gmail.com>

--vHLJu9uvW5B1OfmS5Pbr7AEiJ9wDBjKaS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 07/17/2018 03:32 PM, Peter Maydell wrote:
> On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
>> Implement virtualization extensions in the gic_deactivate_irq() and
>> gic_complete_irq() functions.  When a guest tries to deactivat or end =
an
>=20
> "deactivate"
>=20
>> IRQ that does not exist in the LRs, the EOICount field of the virtual
>> interface HCR register is incremented by one, and the request is
>> ignored.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> ---
>>  hw/intc/arm_gic.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index be9e2594d9..50cbbfbe24 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -590,6 +590,15 @@ static void gic_deactivate_irq(GICState *s, int c=
pu, int irq, MemTxAttrs attrs)
>>          return;
>>      }
>>
>> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
>> +        /* This vIRQ does not have an LR entry which is either active=
 or
>> +         * pending and active. Increment EOICount and ignore the writ=
e.
>> +         */
>> +        int rcpu =3D gic_get_vcpu_real_id(cpu);
>> +        s->h_hcr[rcpu] +=3D 1 << R_GICH_HCR_EOICount_SHIFT;
>> +        return;
>> +    }
>=20
> It's a bit hard to tell from the amount of context in the diff,
> but I think this check is being done too late in this function.
> It needs to happen before we do any operations on the irq we're
> passed (eg checking which group it is).For operations on the IRQ, yes. =
But there is also the test on the
EOIMode bit in C_CTLR before that. Writing to C_DIR when EOIMode is 0 is
unpredictable. I was thinking of keeping the same behaviour we had until
then, which is to completely ignore the write.

>=20
>> +
>>      if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>>          DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", ir=
q);
>>          return;
>> @@ -604,6 +613,15 @@ static void gic_complete_irq(GICState *s, int cpu=
, int irq, MemTxAttrs attrs)
>>      int group;
>>
>>      DPRINTF("EOI %d\n", irq);
>> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
>> +        /* This vIRQ does not have an LR entry which is either active=
 or
>> +         * pending and active. Increment EOICount and ignore the writ=
e.
>> +         */
>> +        int rcpu =3D gic_get_vcpu_real_id(cpu);
>> +        s->h_hcr[rcpu] +=3D 1 << R_GICH_HCR_EOICount_SHIFT;
>> +        return;
>> +    }
>=20
> This isn't consistent with the deactivate code about whether we
> do this check before the "irq >=3D s->num_irq" check or after.
>=20
> I think the correct answer is "before", because the number of
> physical interrupts in the GIC shouldn't affect the valid
> range of virtual interrupts.
>=20
> There is also an edge case here: if the VIRQ written to the
> EOI or DIR registers is a special interrupt number (1020..1023),
> then should we increment the EOI count or not? The GICv2 spec
> is not entirely clear on this point, but it does say in the
> GICH_HCR.EOICount docs that "EOIs that do not clear a bit in
> the Active Priorities register GICH_APR do not cause an increment",
> and the GICv3 spec is clear so my recommendation is that for
> 1020..1023 we should ignore the write and not increment EOICount.
>=20
> That bit about "EOIs that do not clear a bit in GICH_APR do
> not increment EOICount" also suggests that our logic for DIR
> and EOI needs to be something like:
>=20
>   if (vcpu) {
>       if (irq > 1020) {
>           return;
>       }
>       clear GICH_HCR bit;
>       if (no bit cleared) {
>           return;
>       }
>       if (!gic_virq_is_valid()) {
>           increment EOICount;
>           return;
>       }
>       clear active bit in LR;
>   }
>=20
> ?
I agree for EOIR, but for DIR, it seems weird. A write to DIR never
causes a bit to be cleared in GICH_APR. It can only change the state of
the LR corresponding to the given vIRQ. So if we read the specification
this way, a write to DIR should never cause a EOICount increment.

However the part you quoted:

"EOIs that do not clear a bit in the Active Priorities register GICH_APR
do not cause an increment"

seems to apply to EOIs only, not to interrupt deactivations.

And in the DIR specification:
"If the specified Interrupt does not exist in the List registers, the
GICH_HCR.EOIcount field is incremented"

So I would suggest that we apply your reasoning for EOIR. For DIR, I
think something like this is sufficient:

   if (vcpu) {
       if (irq > 1020) {
           return;
       }
       if (!gic_virq_is_valid()) {
           increment EOICount;
           return;
       }
       clear active bit in LR;
   }


What do you think?


Thanks

Luc

>=20
>> +
>>      if (irq >=3D s->num_irq) {
>>          /* This handles two cases:
>>           * 1. If software writes the ID of a spurious interrupt [ie 1=
023]
>> --
>> 2.18.0
>>
>=20
> thanks
> -- PMM
>=20


--vHLJu9uvW5B1OfmS5Pbr7AEiJ9wDBjKaS--

--eo7GDi919OnPI5oeRcSVxzYHrlrzVhuoe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltPPxsACgkQd8knW3Qn
Tr76yA/+MsiFEt7ra9Dd2jYXQmPAItqVkuPW2SkemHddAurcifwWJ9/MWMV3egm+
ieZLQ4wbvKvhLbnofAAtZLEMfrOv83uYdLcQcJl14SuOe5rvnQXftA4CPLc+Q3c3
07VOLScU8Sj/+9AlgNkJ5IPmCWbAg0jI41VCs/UzQtFwOrQCdE6nkhwSty2z6cbS
+mK1hawqeMnL+cI49FTFpHuGmVpIsxuk4QOOOFnddOewc4q2w0IamjliqtDDewEC
7UWdaXOIMf3SMgjywcgHUJ9hXMpNdMcC7VUJdR+1IupwRCX08HqcPGeli38jgrom
84KatfNnLuT8fc786wSz4ZBbFkD7jxaPkNBE4MJABRd9lo9+8pkMMpTt9thBzhI2
gnyzrM83HVEyScJSugJsrHPBQXrqth7mTrXRK3XuPs1peXrwfGxc8XC0KLKETJSm
JC4bSqPYz1ceyZJOmgfDlwy6wY4ZwzkTtcFUk5rIS8a+BVswkpfTZ1gkDZVUGxCL
qfESENh04l/FC63HCVxKwxUAh1RzSEiAnNbJHOCho0d+Gx/30SqhrnwbUQPfOE02
OHK3uzyFBOQVCZgfi70MKD/xPXRel6ib75j6QL66HBpFA1mRWe2CULbUb+DvuWpw
i3Pm0rKhoTE68YG30pRgP8qkhPQCcGK8lfGZMdMcw8GljQTS0Yk=
=9mY8
-----END PGP SIGNATURE-----

--eo7GDi919OnPI5oeRcSVxzYHrlrzVhuoe--
