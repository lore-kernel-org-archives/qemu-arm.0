Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp695131wrq;
        Fri, 13 Jul 2018 06:35:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcIGBcXraJ/gMHUKXKVVC7ZDmccVpaMHCHCv0lkZBFVqJ2WcjgSXQTa+qvhicAaPqo0boJs
X-Received: by 2002:ac8:178a:: with SMTP id o10-v6mr5998803qtj.125.1531488915837;
        Fri, 13 Jul 2018 06:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531488915; cv=none;
        d=google.com; s=arc-20160816;
        b=jDC/yg0kHa4112GYl1DRVrcj3OdIs6DqSKMZtMOVmBPzNT/suPR9ECwpdBfAPVPUAt
         i725YueNcVoYfZD2Jk1U0K1JV7yyQlYufG5kx2Nh98wiMmjr75AKL1GNhgZB4+mDyia1
         uzuSfaJRAM7CWMokE5PJtFnj+MyTHrp/gZBrVVLw3rMqHpOM0bO0plyAxLTVJfOhzFlZ
         FhZ2mvttDw6mqlnKtZufyVYu1QV8bqOoHyhgcneiP7l18nwW9MKyInrIo4WF+A6CyX98
         rtwBFZ8VV+DOHZ3Jj1ngWPHfkmwfptiMBxBaZnRWb+oyKZFFYTH/M+2OME5OVCBJEIb0
         SdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=WTe/Ccri6xVj8Bmo/ZLpIvlk5Dcf/n9ZgUgcqxaQFug=;
        b=V1GdQ40U87m9hYRyonyIADD74LinT27NsPmD4bt00Gz0f4AYpAwK43me2Rm75Ie/Fi
         GfEWmJwzK6rJENmRNIOL0kIYmd1/RV+YpFtpR+Oup4gQqvxotCFUYg4i9UPjdSEv+AgM
         No7O7VIuXRwK91UIKEnfvhMgBMaR2xYucznkq6VMQ7j7mP1I+6zsiQMyvWy8lI3qwBCt
         15KMiyH3XH9rtpLezB8UNb9x+Od9oYIoR07DtwMunGJ+31OM0uSMRQoqjA/a+NlHSMXt
         hhksZdXAs8bmYa6DZPTdMv0xT6l8/JI6gzcN46Q8AgnSaSJdBQaZxIKIuTbW83Yu5ZYz
         zDcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=q47Gd3Do;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HVTKXvKJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HVTKXvKJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4-v6si6397465qvk.287.2018.07.13.06.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 06:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=q47Gd3Do;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HVTKXvKJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HVTKXvKJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdyE7-0007Ap-BO
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 09:35:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdy46-00080V-Dr
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 09:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdy43-0002Pl-Ar
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 09:24:54 -0400
Received: from greensocs.com ([193.104.36.180]:49407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fdy42-0002PN-Tq; Fri, 13 Jul 2018 09:24:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 60EB7C7AF7;
	Fri, 13 Jul 2018 15:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488290;
	bh=8AFHnYwTBKcAc/6GsZ5DU2lJaTQEwKUSbJN1Awcj5SY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=q47Gd3DoRk/7VW20tqemsP+d5ktEz5gQAGqvxL+iHpVdT4bjJgw5u3MvyMRgtw4ly
	baHsIJpo6a8IqF2JKZNnglKJnet0glN6I9runp1sqhXj+jSGaiE2QVfv9uSREpuRy4
	fAK/CNdK5ai//l3j9mWCID7XuJuIhM48fWrT8TZw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=HVTKXvKJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=HVTKXvKJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEacxzGy-ymI; Fri, 13 Jul 2018 15:24:49 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 85BACC7AEB; Fri, 13 Jul 2018 15:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488289;
	bh=8AFHnYwTBKcAc/6GsZ5DU2lJaTQEwKUSbJN1Awcj5SY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=HVTKXvKJvQG1FqpNP/R2pqVpPoY+BbSkYZx8ystu6sKI9EPMuTcSPLi0yv7uOP4PK
	kSFlp7K3nyq7uBTRCWSdpi7GxnQjPFgd6uIcDqXDDbb3L+JevzWkRLW/TLkHvlzlVZ
	drktatWZl5e3venML3z0ZsxueppEjbWqANJyf2j4=
Received: from [192.168.1.5] (unknown [105.98.62.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0BC56C7AE0;
	Fri, 13 Jul 2018 15:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488289;
	bh=8AFHnYwTBKcAc/6GsZ5DU2lJaTQEwKUSbJN1Awcj5SY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=HVTKXvKJvQG1FqpNP/R2pqVpPoY+BbSkYZx8ystu6sKI9EPMuTcSPLi0yv7uOP4PK
	kSFlp7K3nyq7uBTRCWSdpi7GxnQjPFgd6uIcDqXDDbb3L+JevzWkRLW/TLkHvlzlVZ
	drktatWZl5e3venML3z0ZsxueppEjbWqANJyf2j4=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180712154152.32183-1-peter.maydell@linaro.org>
	<20180712154152.32183-3-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d483ae97-c1bb-2df3-8610-538bbb6efb38@greensocs.com>
Date: Fri, 13 Jul 2018 15:24:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180712154152.32183-3-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6MIXvKl8x7kn5t5xjo6zocGuc3BTf8EW6"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH for-3.0 2/2] hw/intc/arm_gic: Fix handling of
 GICD_ITARGETSR
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
Cc: Jan Kiszka <jan.kiszka@web.de>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: knUONdmyShFy

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6MIXvKl8x7kn5t5xjo6zocGuc3BTf8EW6
Content-Type: multipart/mixed; boundary="WAedzOEPt4OluoXl2dKKbF7AhNL007Qmu";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <d483ae97-c1bb-2df3-8610-538bbb6efb38@greensocs.com>
Subject: Re: [PATCH for-3.0 2/2] hw/intc/arm_gic: Fix handling of
 GICD_ITARGETSR
References: <20180712154152.32183-1-peter.maydell@linaro.org>
 <20180712154152.32183-3-peter.maydell@linaro.org>
In-Reply-To: <20180712154152.32183-3-peter.maydell@linaro.org>

--WAedzOEPt4OluoXl2dKKbF7AhNL007Qmu
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 07/12/2018 05:41 PM, Peter Maydell wrote:
> The GICD_ITARGETSR implementation still has some 11MPCore behaviour
> that we were incorrectly using in our GICv1 and GICv2 implementations
> for the case where the interrupt number is less than GIC_INTERNAL.
> The desired behaviour here is:
>  * for 11MPCore: RAZ/WI for irqs 0..28; read a number matching the
>    CPU doing the read for irqs 29..31
>  * for GICv1 and v2: RAZ/WI if uniprocessor; otherwise read a
>    number matching the CPU doing the read for all irqs < 32
>=20
> Stop squashing GICD_ITARGETSR to 0 for IRQs 0..28 unless this
> is an 11MPCore GIC.
>=20
> Reported-by: Jan Kiszka <jan.kiszka@web.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

--=20
Luc



--WAedzOEPt4OluoXl2dKKbF7AhNL007Qmu--

--6MIXvKl8x7kn5t5xjo6zocGuc3BTf8EW6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltIqCAACgkQd8knW3Qn
Tr53Vg//QRGY7g8Cwt1F/J6IHCujH3pDhnMmP5brckQsTi3atcOI5gNNF++t5mZ1
/X+CExXtTgmb5bVW+ncueE8Kr5lKly8fIwbRnw0stu6i56C/IDyr49X3jyZfdrYN
COTqzX28mxy461rRQxs8MLG24MrwSHn7oLbBpRXtOhEZ2vc9hRREwuoc6cAPIc9w
HMUgdOyhA+rOqOnPXk2Yz3kxUo6aEcOHm0jr7DfIpGKUcCjDHERX20e5Ss058VyV
RakKftc6ZHbLR/vWdBZOaqBKgliYNoCuTa996Y+MqgFJVX5kTB07nnuR7ZZkhMLP
amht+o1UzDuesozEPn1kTtI+75O9Z0yq9gqiETi7bYfDu8jMWDxbZWrn5sNLK4dM
cXnLD2LjcYhvwYlt9e1FmN/lQK36YqVIXCwOlxZ8c6DUREcrK+03NVCk8cnLYpfH
vsQSqtt+M0abYRY5V1zChTTGSzK3PAzvlcLU2A+clmO2RVmQps8BM9sJj6WK5tpa
9n+zUBBQoN4rVdnPMXDzRF6++xq86hDQ4jUf2NiWxL1C7yiD5TEwKINqkXrnxOsS
9hHcBAJqSVMzs8rqQkfzUcccROxobG+1e6o6N2M5WgJIYy3Ta/IuUsIHkCcZc5xp
VSTyvS/a6PC5ddfwRghaq10783yUPDWESX/92SkMaip9HW63y2Y=
=WHAH
-----END PGP SIGNATURE-----

--6MIXvKl8x7kn5t5xjo6zocGuc3BTf8EW6--
