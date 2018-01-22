Received: by 10.28.71.27 with SMTP id u27csp2927810wma;
        Mon, 22 Jan 2018 07:25:30 -0800 (PST)
X-Google-Smtp-Source: AH8x226uxXOYYtJfb4mJ9qjjuXRR+xjIZQVZ7TAip5psy2lYvYdPKg0P2npiiBuI7Pi1oPFtMqX0
X-Received: by 10.129.138.197 with SMTP id a188mr7579020ywg.88.1516634730884;
        Mon, 22 Jan 2018 07:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516634730; cv=none;
        d=google.com; s=arc-20160816;
        b=SqxBd3YYuaaAIXmb+GuGe5ZVpJ/W87l5fBDtrCTC6SFu4GbHiBqDwmzsJAm8KJjggF
         ymfMCoEPyHFMfchuAcU0OtHR8h8VUmnXonnhr20NR8suU4ahPqcBjMrexy+prDDNURJg
         xd2ppldT/xMwQ4hY4m0NWchbCk9gTsnQIP6nKBtAmrmHvO/kW/s1qHFnjsvO/sWIjoTa
         z6FNAY5vyYHqcA6VxwjbPjvo8GiyIfCl76X4k4jkjDntjWF48OLpQwZchy+yi6jtRTxJ
         rQLcu8TgRMF7qlg4WQ+QUcOly6YwVhDxTwbeOCsH2QXo9x2fRebYZue9bmWkEDHmniap
         UYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=fyWoA9vA8s/wGaaGDW+ybYhSSZhxANCbLWwCdVjcK8k=;
        b=NbDI+bwZmft7I3w7r38ZfyfegJs2exrvEGctasnCcfnUASl12FxlNxtwBSRmENXA+3
         c8Ij/anrwAl5Q/6nz0dQsueI1pwR/UF2scV7+xrbX5goVvWst4fkZb/VYVwZZ99a77ca
         H6hcUy+wF8fyPYaOVC+Bxq8nhUnkeYYuYHEPnYbk4ujcbxYbkRlAmyeu6/EGP/RmiY33
         YIE1k4F+txwL01kh0DQnuFFX0Ez6wypsD9li9zq2QJhgnKnS9Ij3b2hQS2SvuW1ltuv7
         YF6hTi8KGckjVb1ApVXF04WKrzBp9Oh+G7Kg2xoNBkqlb14WSuZ5I6VkZasX0hRIlh/j
         E69Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CTzRUncV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=x0zTjfPF;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=x0zTjfPF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si1601726ybu.303.2018.01.22.07.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 07:25:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CTzRUncV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=x0zTjfPF;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=x0zTjfPF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:47980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eddyU-0008EN-9P
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 10:25:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1eddyI-0008A0-UM
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1eddyE-0002IT-0H
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:25:18 -0500
Received: from greensocs.com ([193.104.36.180]:38316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1eddyD-0002Ej-IL; Mon, 22 Jan 2018 10:25:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1D637319FCD;
	Mon, 22 Jan 2018 16:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516634704;
	bh=TlVYb+JL7OagqKLWvP2LJRGEuniPpbw1BdQhjRiDjXc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=CTzRUncVvK1I+O7uPiAFEsonKQ9FPQxxDyH8KtUV2NoOqwRku/6JuoymovLBVS3IG
	2eq+EUTHEpZw6vFkvMbIhpgKDug5ddv5mKLwJd9VeSYCdtV830LuHayf/UxkSMhGCI
	CAhAePaUr+Mq0ouZJCAGQrke90E9ZuhF50qdxsdI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=x0zTjfPF;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=x0zTjfPF
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOK5ZoK-rdFe; Mon, 22 Jan 2018 16:25:03 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 25182388FBD; Mon, 22 Jan 2018 16:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516634702;
	bh=TlVYb+JL7OagqKLWvP2LJRGEuniPpbw1BdQhjRiDjXc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=x0zTjfPFRE14A65oGVIdFnevAmX8fz2dIABe9GZDen51gqkNlVyVbulbtOYnmWMHY
	/B9rda6JOtdk/SYsecfLPEW6y/pVM8OEA/xCrSjFvfyacQ6H5v26kiOOrFXPf1IvdS
	H3lD/NmsxflAfb6wUy20/NOfOJ6AV3BoanovGoAk=
Received: from [172.16.10.222] (tima-dhcp-h14.imag.fr [147.171.132.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C507B65A34;
	Mon, 22 Jan 2018 16:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516634702;
	bh=TlVYb+JL7OagqKLWvP2LJRGEuniPpbw1BdQhjRiDjXc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=x0zTjfPFRE14A65oGVIdFnevAmX8fz2dIABe9GZDen51gqkNlVyVbulbtOYnmWMHY
	/B9rda6JOtdk/SYsecfLPEW6y/pVM8OEA/xCrSjFvfyacQ6H5v26kiOOrFXPf1IvdS
	H3lD/NmsxflAfb6wUy20/NOfOJ6AV3BoanovGoAk=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
	<20180119145756.7629-6-luc.michel@greensocs.com>
	<CAFEAcA8VJAfksRenr_CJauTc2wpfN1fUchixrfGbvjBkeoR-Vg@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <dbfbc395-48f1-9f0d-cfc4-29ca41076c01@greensocs.com>
Date: Mon, 22 Jan 2018 16:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VJAfksRenr_CJauTc2wpfN1fUchixrfGbvjBkeoR-Vg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="c7UddyyFRxcnPSq52kssngWhFQMyHOyO9"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 4/4] hw/intc/arm_gic: Fix the NS view of
 C_BPR when C_CTRL.CBPR is 1
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hatfgoe8Lmh+

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c7UddyyFRxcnPSq52kssngWhFQMyHOyO9
Content-Type: multipart/mixed; boundary="9XoWID62Hra7i0JzWUEI2zWHQ2jXB9NPP";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Luc MICHEL <luc.michel@git.antfield.fr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Luc MICHEL <luc.michel@git.antfield.fr>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <dbfbc395-48f1-9f0d-cfc4-29ca41076c01@greensocs.com>
Subject: Re: [PATCH 4/4] hw/intc/arm_gic: Fix the NS view of C_BPR when
 C_CTRL.CBPR is 1
References: <20180119145756.7629-1-luc.michel@greensocs.com>
 <20180119145756.7629-6-luc.michel@greensocs.com>
 <CAFEAcA8VJAfksRenr_CJauTc2wpfN1fUchixrfGbvjBkeoR-Vg@mail.gmail.com>
In-Reply-To: <CAFEAcA8VJAfksRenr_CJauTc2wpfN1fUchixrfGbvjBkeoR-Vg@mail.gmail.com>

--9XoWID62Hra7i0JzWUEI2zWHQ2jXB9NPP
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 01/22/2018 04:19 PM, Peter Maydell wrote:
> On 19 January 2018 at 14:57,  <luc.michel@greensocs.com> wrote:
>> From: Luc MICHEL <luc.michel@git.antfield.fr>
>>
>> When C_CTRL.CBPR is 1, the Non-Secure view of C_BPR is altered:
>>   - A Non-Secure read of C_BPR should return the BPR value plus 1,
>>   saturated to 7,
>>   - A Non-Secure write should be ignored.
>>
>> Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
>> ---
>>  hw/intc/arm_gic.c | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index d0a41a89ae..7418b7a082 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -1211,8 +1211,13 @@ static MemTxResult gic_cpu_read(GICState *s, in=
t cpu, int offset,
>>          break;
>>      case 0x08: /* Binary Point */
>>          if (s->security_extn && !attrs.secure) {
>> -            /* BPR is banked. Non-secure copy stored in ABPR. */
>> -            *data =3D s->abpr[cpu];
>> +            if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
>> +                /* NS view of BPR when CBPR is 1 */
>> +                *data =3D MIN(s->bpr[cpu] + 1, 7);
>> +            } else {
>> +                /* BPR is banked. Non-secure copy stored in ABPR. */
>> +                *data =3D s->abpr[cpu];
>> +            }
>>          } else {
>>              *data =3D s->bpr[cpu];
>>          }
>> @@ -1285,7 +1290,12 @@ static MemTxResult gic_cpu_write(GICState *s, i=
nt cpu, int offset,
>>          break;
>>      case 0x08: /* Binary Point */
>>          if (s->security_extn && !attrs.secure) {
>> -            s->abpr[cpu] =3D MAX(value & 0x7, GIC_MIN_ABPR);
>> +            if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
>> +                /* WI when CTLR is 1 */
>=20
> should be "CBPR", yes?
Oops yes, sorry.

>=20
>> +                return MEMTX_OK;
>> +            } else {
>> +                s->abpr[cpu] =3D MAX(value & 0x7, GIC_MIN_ABPR);
>> +            }
>>          } else {
>>              s->bpr[cpu] =3D MAX(value & 0x7, GIC_MIN_BPR);
>>          }
>> --
>=20
> thanks
> -- PMM
>=20


--9XoWID62Hra7i0JzWUEI2zWHQ2jXB9NPP--

--c7UddyyFRxcnPSq52kssngWhFQMyHOyO9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJNBAEBCAA3FiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlpmAkwZHGx1Yy5taWNo
ZWxAZ3JlZW5zb2NzLmNvbQAKCRB3ySdbdCdOvvpgD/9m2Trgk6iZnmkehTnEn+5d
FB7oMBaBga1zmaHdTWM/Eqw7X4Fh/n9O/lt555laDBMsxesB0mAEZXYiitUTnZqP
I66kpGMYJk0uwDwwiRSKUMzAhZUO4WAocaqxSqjimDnQaWcq35qv5/DtbUGSTPQz
X/0VJv5Wd+3tEsUYJVGE7NCtyeH54NMiSmHc7uNh6PSwajV3jK88o3TEziFd/Y/a
MYkVC7ZrFn8Dg1dtJijPq7I9xrcYnvqqw9SkJvzGDbo/3jdse/SHqSlj/df+hpj5
odW0SGb7tYvDSrOib+Tf5j+v2TIyw02shTGAVz9TYzhQ7xi7uit7gkrY7xUAe8ZL
wgHsvsrRRobH/F6L0qL80C6qJ4Sy5RY0gdst055rpiSV0LIEvgNMPakq7F80hYX5
/7r9ZB+GinkAhLDdVTqYPvx4hqM2M5TwycLmGWtw2JsWGkXT2IlDVuJKjLVsd8Ho
K0ZV6k1xZHDbMDlu8mfkQvhBsk/RSkDamcXctqGeLq6saqCZ8ds9WBcKwahLr37d
0ARCuVkNYAKcZUwDMQgZY6VqVyqG4z5qVym0wDAqc2GYZAnNm/j+5cPituaqJUJI
w39Mo8eAxVNx7IrIVxPYDlSXtJNv793Y9l1ub8c0IVQDAVLo8sOpo35dcemAyiWO
7b9G9dNGLxXFk4O6ivPdjg==
=M33q
-----END PGP SIGNATURE-----

--c7UddyyFRxcnPSq52kssngWhFQMyHOyO9--
