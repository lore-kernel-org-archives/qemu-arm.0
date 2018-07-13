Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp768450wrq;
        Fri, 13 Jul 2018 07:45:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfEZEYzE9VFSmYX690UgLmo0L0cfFrx3d8Zvz8gbiorXszNVbwrPE+HOgqT/stGFIQW5fLG
X-Received: by 2002:a0c:886d:: with SMTP id 42-v6mr7478531qvm.242.1531493115794;
        Fri, 13 Jul 2018 07:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531493115; cv=none;
        d=google.com; s=arc-20160816;
        b=V+sJ9DPXUULAsZJAOZeJPPwtuY8s49vF1Fvr3EkWiApJUXfQTqxttC+K2KmpJiQaRt
         qr0a5tkgYAaNQXJDDTxrVYOLlUtxdjGk8xYGRyPu9ir2VyNW5YqoT737rnB2Z/UGgb+3
         R5tC+wTK/W/IWUiBUoKHuH2fcfy1VKsl9jaRy6A6TcKRKuBVaAaGAG9wwxQ/KfKKucC6
         +aNzzSyeliSCnnQx41aMGOKn1k3OlVMGozLgFrWKubQKtrvjgxe4LKzEsjBlpVO2UKof
         t2setM/lF4G9y3sNvW/KUYSuSUP5ES8ghnpR9EyYRTk36T8yCWswvYtgYJv+/Ybkojd3
         SaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=sO9asnJyPV4ZR3Pem+Te36E0YUrCt+A3kgVES+cCN3U=;
        b=T5+BOyf9627qqnMliyCgVo4uM8w9MgEp896WJI1TgjLa7uD2WQbNTu9ruUn2criY02
         okwvRbsKeKdkP20uIT/mR2yuU2cZnchCfwCnjtqK4IIodgId7WgrIzthgxaQo7ygRf8m
         qw/900qgqtv3y1/9UIuNzy4VDaFJUSVB7Pg+/9mTcohIyJe4eOG6p3q8qf33cvqHFMwa
         uS+mM/ZL/QHAtsnENC25GMI3E3bBr4wp0f+lLxuN5aHw+wEemWSkmIGD8TCuJ7zNxEgf
         3w29t9YLv432IRZ75Tpv76TKn9MFVzlHrKwA516u385/qbkg4R1N2WroEhU5jaTHr6l6
         lE2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kjBq9JQE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6tEI9Cwg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6tEI9Cwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j16-v6si6054205qvc.65.2018.07.13.07.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 07:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kjBq9JQE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6tEI9Cwg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6tEI9Cwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdzJr-0007hX-97
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 10:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdzJf-0007f4-E7
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 10:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdzJa-0002Ml-CR
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 10:45:03 -0400
Received: from greensocs.com ([193.104.36.180]:51364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fdzJZ-0002Ku-SQ; Fri, 13 Jul 2018 10:44:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 63210C7AE0;
	Fri, 13 Jul 2018 16:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531493088;
	bh=PKRCjC60/xgUZDBYDAE+BJZPI+gh2/aPGYCt90aKhWw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=kjBq9JQEoeRpAdAoyQnuFUsI9ulKWBvuVTyv07opXhuH8wrUsGD0lTqcjAI4Uiquy
	2Ybb1yHfwrT2z7bmXo2wmiLkiEIUCRaqqQCKqrAn3tPDxrAg2f13pCP1mIJ13sQAoQ
	/AbtwbQ2IOjQ9z6CH3qKQ/3ubmD7XF/9eE0udq8M=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6tEI9Cwg;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6tEI9Cwg
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLcHzGrv6n-y; Fri, 13 Jul 2018 16:44:47 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 7D4E2C7AEC; Fri, 13 Jul 2018 16:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531493087;
	bh=PKRCjC60/xgUZDBYDAE+BJZPI+gh2/aPGYCt90aKhWw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=6tEI9CwgX3oHGcBsWz9yGWV4LXxpJxQ1edRVvu1QsBaHWZjv+7dAzuB8lmMagA+HC
	phgK9g4PwYVQBZzMe7PToiVmgyOix+QfKQWsCIL/tPFkiXD7nkhtVVojvHxPzQTPyh
	P+ik28DCpHiQlAZdYzSvB1afZg8HMYVwcdpzQH+I=
Received: from [192.168.1.5] (unknown [105.98.62.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CA032C7AE0;
	Fri, 13 Jul 2018 16:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531493087;
	bh=PKRCjC60/xgUZDBYDAE+BJZPI+gh2/aPGYCt90aKhWw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=6tEI9CwgX3oHGcBsWz9yGWV4LXxpJxQ1edRVvu1QsBaHWZjv+7dAzuB8lmMagA+HC
	phgK9g4PwYVQBZzMe7PToiVmgyOix+QfKQWsCIL/tPFkiXD7nkhtVVojvHxPzQTPyh
	P+ik28DCpHiQlAZdYzSvB1afZg8HMYVwcdpzQH+I=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-15-luc.michel@greensocs.com>
	<CAFEAcA_R9zp7EBtFetH5Q1Dnzj-kjPzDKRsBAo9aVnMZ3PW0VA@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d4406995-ad08-b6e4-bf97-f9c212569047@greensocs.com>
Date: Fri, 13 Jul 2018 16:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_R9zp7EBtFetH5Q1Dnzj-kjPzDKRsBAo9aVnMZ3PW0VA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="YHiNZgu1cQKIbjPAMqJZ94mFQG0soNmCd"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v3 14/20] intc/arm_gic: Wire the vCPU
 interface
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
X-TUID: d/0z5AuKR+JC

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YHiNZgu1cQKIbjPAMqJZ94mFQG0soNmCd
Content-Type: multipart/mixed; boundary="XVMrQpZuhBNHrlPkZROs1ITvsIpdLlO8L";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <d4406995-ad08-b6e4-bf97-f9c212569047@greensocs.com>
Subject: Re: [PATCH v3 14/20] intc/arm_gic: Wire the vCPU interface
References: <20180629132954.24269-1-luc.michel@greensocs.com>
 <20180629132954.24269-15-luc.michel@greensocs.com>
 <CAFEAcA_R9zp7EBtFetH5Q1Dnzj-kjPzDKRsBAo9aVnMZ3PW0VA@mail.gmail.com>
In-Reply-To: <CAFEAcA_R9zp7EBtFetH5Q1Dnzj-kjPzDKRsBAo9aVnMZ3PW0VA@mail.gmail.com>

--XVMrQpZuhBNHrlPkZROs1ITvsIpdLlO8L
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 07/12/2018 03:37 PM, Peter Maydell wrote:
> On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
>> Add the read/write functions to handle accesses to the vCPU interface.=

>> Those accesses are forwarded to the real CPU interface, with the CPU i=
d
>> being converted to the corresponding vCPU id (vCPU id =3D CPU id +
>> GIC_NCPU).
>>
>> As for the CPU interface, we create a base region for the vCPU interfa=
ce
>> that fetches the current vCPU id using the current_cpu global variable=
, and
>> one mirror region per vCPU which maps to that specific vCPU id. This i=
s
>> required by the GIC architecture specification.
>=20
>=20
>>  static void arm_gic_realize(DeviceState *dev, Error **errp)
>>  {
>>      /* Device instance realize function for the GIC sysbus device */
>> @@ -1531,7 +1590,7 @@ static void arm_gic_realize(DeviceState *dev, Er=
ror **errp)
>>      }
>>
>>      /* This creates distributor and main CPU interface (s->cpuiomem[0=
]) */
>=20
> Can we also update this comment to indicate what virt-related
> memory regions are being created?
>=20
>> -    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
>> +    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, gic_virt_ops);
>>
>>      /* Extra core-specific regions for the CPU interfaces. This is
>>       * necessary for "franken-GIC" implementations, for example on
>> @@ -1547,6 +1606,16 @@ static void arm_gic_realize(DeviceState *dev, E=
rror **errp)
>>                                &s->backref[i], "gic_cpu", 0x100);
>>          sysbus_init_mmio(sbd, &s->cpuiomem[i+1]);
>>      }
>> +
>> +    if (s->virt_extn) {
>=20
> ...and a comment about what these regions are for.
>=20
> What requires these per-core regions anyway? There's no way to
> specify them in the device tree bindings for Linux, which AFAIK
> only cares about using the "vcpu i/f for this core" registers.
> I don't think the GIC-400 has these. (It does have per-cpu
> aliases of the GICH_* registers, but this patchset doesn't seem
> to implement those.)
My mistake. I misread the specifications. Those aliases should target
the virtual interfaces, and not the virtual CPU interfaces. I'll change
that.

>=20
>> +        for (i =3D 0; i < s->num_cpu; i++) {
>> +            memory_region_init_io(&s->vcpuiomem[i + 1], OBJECT(s),
>> +                                  &gic_vcpu_ops, &s->backref[i],
>> +                                  "gic_vcpu", 0x2000);
>> +            sysbus_init_mmio(sbd, &s->vcpuiomem[i + 1]);
>> +        }
>> +    }
>> +
>>  }
>=20
> thanks
> -- PMM
>=20


--XVMrQpZuhBNHrlPkZROs1ITvsIpdLlO8L--

--YHiNZgu1cQKIbjPAMqJZ94mFQG0soNmCd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltIut0ACgkQd8knW3Qn
Tr78JQ//b8PVwiTP+CX4FcKkdEkOpEh7ejWreN9outjsig19XAlMb1i74iB+7NP3
bavtUrNjTiio5COPN7NT1wgCKagvasFr5yUWlBrg0cGhoehrjK1j2Gi6SX+smAV0
dTH2VfPD3jp7dBy+QrduT9W3GwuS0bInHaIYSSIPoqyX6EE7ocFkVoc6bJILxQrG
CQagHIpW6oyCJRzrLJU4X0eREQUAA4/Bup13ntRHJVyPMV1eB/RYU/SJEc7MX1Fj
zzwxxS3t4f5GMQi4DmRmfPrrG0K+Tw9h6H02EAt+DNZ4c9FpKsOtOwa2axUyS1nY
9y7lP14lAJsLZts7ap3QryOxlA1NEv8jBLZOWNO4o7xjCaVIrTas6zGGIj93unBr
Mq7BdnEZFfO/dGHjd37U/Qa0TA3i/fhHT6itaT4EILwGorsNSpEON6SHOYLMOY9B
5HyhfIGjNEofcmnpUzneXrRDLeuOj2CaPbanqhM0IFFOXZCdWa13qsV3i8EmbHSj
k9n27G2WVErJJMnuIHnDXTM1iakMXmwbiS50tV0C8Bi4hqHrumy7fKeRTyHnSaMS
GxlL+xFhL5+Lv4k9jOuRvwXAbUsvQUJ/nSiopKo4Y0l0TZ4F3R7PCzgjgLXHZqCy
AG6odpV4r4aNLBO1nKy3Sso6H+SjN8YCqzA3RdtJPeVVP6DaPmY=
=FfvZ
-----END PGP SIGNATURE-----

--YHiNZgu1cQKIbjPAMqJZ94mFQG0soNmCd--
