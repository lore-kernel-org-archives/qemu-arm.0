Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3324749wrt;
        Fri, 30 Nov 2018 00:44:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wrrx806OtpHMZywWOcnpfVfJDSmD1an/3xFm9qLdaEONYdyhyx4JuibT6rTWwPh8ioj4hL
X-Received: by 2002:a81:5089:: with SMTP id e131mr4773787ywb.392.1543567475408;
        Fri, 30 Nov 2018 00:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543567475; cv=none;
        d=google.com; s=arc-20160816;
        b=qwfUCJufgd7vdasZWEbeB3DN/EwJT6AuuxM49/IL0Tt6VFTfFUI3LDu1uKaRPQ68rS
         4biwfYjwmfm0n0LEieWInHK6ab7CGkoduObhNp2UBM4rn6Tuta+E+k7zv8tgD7OTnwPE
         Q7K9hTb8nzhN9MJhYMB3JCCm5J9l644TSRUQFIaHF8q9E7CkHpFi3mXadUjlZqpmOwrH
         Ml95GPjdoMmNCSglRt6aDhsaD/XGGfr5oat/quEAsm6vdXFkAnKwxAF7tTpz3/oyyW95
         JiEihKPmtbFBYH5wmiqgrmKFNjULhdm67xLNZPbjZ/wJ4JHmRNPCH3YMxaSaTNXqzRXJ
         8o3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature;
        bh=AvylD4XQiK5DRij7YkEUj451PW3WGzmWlLIn3L+Tuqo=;
        b=Rn3Gt11iWNjYotdQmV5X/3w8Pjod477SuGa14MeY8Lg0gLILE8YjaCr30l9p+F6Hie
         fNJYIB/DLf7uyrnviTdgA0VJeSIHb+dTr8ovlqTc/k7JizZ8CzEYf3kOGeAwtSxn7Nd5
         iChkvJ87oIfuziUILQCRIBPKetZ5bjMf1jSlu/wnCCS39GRV3dAsmM0qvwTpPW2E48Dc
         go3d0Mj5be5GlCv5F/ajREqPdau8PBfWp0LQcRGpkbXY51+0aQFnWw1FOwFC3Vt4EB/C
         +kHmW25K3ULI3rYEC8TOi59wD+QhLciW4SV0VUkrNnJigwLUpKaf9Gs2x+AnwQBq6jzU
         C1mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QATP7q4T;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bdN2eRHX;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tAwygs2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201-v6si2576954ybc.146.2018.11.30.00.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 00:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QATP7q4T;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bdN2eRHX;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tAwygs2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSePa-0000yf-G7
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 03:44:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gSePN-0000en-Hn
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 03:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gSeJw-0007qY-Ts
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 03:38:48 -0500
Received: from greensocs.com ([193.104.36.180]:35313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gSeJw-0007oe-Db; Fri, 30 Nov 2018 03:38:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F20B0645DCB;
	Fri, 30 Nov 2018 09:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543567114;
	bh=6Rc3rm/9e3GFWteG3of2PzzLePaQNKflSCzZD4drEAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=QATP7q4TzZZN/3itjLY6fAnSPvufWSVX8FGMC1MZSNbIn4gI4ZSjG3PAMjzhSfOXW
	W3XWsQqgujfRhH9K88uAi5vvDpxDwSsElMKWet9LZRZudJF2JfyzTGY6GmwaiNJzGL
	V6t15R6MIr7k5ITHMHUlK2zw9+03UxARqeYBH5q8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bdN2eRHX;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tAwygs2L
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLnxBt7iG3pZ; Fri, 30 Nov 2018 09:38:33 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 1D742645DCD; Fri, 30 Nov 2018 09:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543567113;
	bh=6Rc3rm/9e3GFWteG3of2PzzLePaQNKflSCzZD4drEAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=bdN2eRHXVSMExb+6TbsvsswQys2JNu+lwYmG52so90KD1Ddshv9O3FBElp+ZL1RcG
	3QKi+fa4uE5/iB7XWf+pbX7e3L8QUNXQgSmd6V6fyviVFFUjEFfDlkiKrStiQ4a1NL
	HYOz3sLipdhGnWTYQcCg4QEluuIZSjWjZoGBRuPg=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6C714645DCB;
	Fri, 30 Nov 2018 09:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543567112;
	bh=6Rc3rm/9e3GFWteG3of2PzzLePaQNKflSCzZD4drEAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=tAwygs2L2lPZgAG9W/kyVAOMYsLS9N6yjt0hU/Rnfldb58zBBZ9QNA+4ybbi7JIc3
	+iua2ur0VbNQ4hLLVrEklN39JBRPBTusoGOBKJaYYiRWySHFuffjFP88Wh5lQv6iIG
	ElEpnD0T/IoVaJneiZoB6y70193xxlLjTVI93Ydc=
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
	<20181129163655.20370-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <60274731-58ee-0edd-52db-313780909834@greensocs.com>
Date: Fri, 30 Nov 2018 09:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181129163655.20370-2-edgar.iglesias@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="taoMADTdYPEZv5T0MLWf7NzOiZ1rvCkhn"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v1 1/4] hw/arm: versal: Remove bogus
 virtio-mmio creation
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMeA5nvWW0UF

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--taoMADTdYPEZv5T0MLWf7NzOiZ1rvCkhn
Content-Type: multipart/mixed; boundary="6r2X3ppttJE92qGdA7sXCfgzfeoZCGpSU";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, muhammad_bilal@mentor.com,
 frederic.konrad@adacore.com, alistair@alistair23.me, philmd@redhat.com,
 frasse.iglesias@gmail.com, figlesia@xilinx.com, sstabellini@kernel.org,
 sai.pavan.boddu@xilinx.com, edgar.iglesias@xilinx.com
Message-ID: <60274731-58ee-0edd-52db-313780909834@greensocs.com>
Subject: Re: [PATCH v1 1/4] hw/arm: versal: Remove bogus virtio-mmio creation
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
 <20181129163655.20370-2-edgar.iglesias@gmail.com>
In-Reply-To: <20181129163655.20370-2-edgar.iglesias@gmail.com>

--6r2X3ppttJE92qGdA7sXCfgzfeoZCGpSU
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 11/29/18 5:36 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>=20
> Remove bogus virtio-mmio creation. This was an accidental
> left-over an experiment.
>=20
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

Luc

> ---
>  hw/arm/xlnx-versal-virt.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 1e31a3f442..41b8d801c8 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -364,7 +364,6 @@ static void create_virtio_regions(VersalVirt *s)
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
>          mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
> -        sysbus_create_simple("virtio-mmio", base, pic_irq);
>      }
> =20
>      for (i =3D 0; i < NUM_VIRTIO_TRANSPORT; i++) {
>=20


--6r2X3ppttJE92qGdA7sXCfgzfeoZCGpSU--

--taoMADTdYPEZv5T0MLWf7NzOiZ1rvCkhn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlwA9wEACgkQd8knW3Qn
Tr6BXA//fIzD8sipgf9bAot29h+JPW87hPKHNcDi0nqeYIuGK1W0E8VxFTTsZ24q
/ihSiwiZFFibPYq6IwyjL72YhCRxyf35Axunb1GIuCATf5fVDb+D8tkgwOEDZfJw
bQA0BtyeLijED1sTYsOPrPeDARmnFcpsNRZH39rxf96u+vJsk6d8/Z7akkjx/bDG
IW339+VnU2O0/7FrILw21w/hprAelzbtjNiCXBcAs9rTdG6HOwnzJ1MbTvUPLC5T
fDAA7Gm5CVG8AV7teR8e1dHVgIN/mF5SNF7w2aIFu9sj5ebqxSeV9S63EzAnLeNV
RQruRaGE9BS+Z0/dyBYd/EIpgAw/xQ3U2ZveN6C4gAAgWSJGkPg3rry4ExL5524y
97YuEgJlIhoTuD2D9T5Qb4enVW2gHydYW3SeNwGKJq3XC4xUUOPqnl59gN5id0KG
6/E+tnRD7N1z1br+tpauy3cmcyTlw18MZBhCJh/PUErt1KSoN2yYFnWriJo/J6jT
/BJzZSDDfMXhffZ1akJpOFUQOhh7IvMi4xHD7ngqb8tbDUuICD8kiTjmIv9up9Z3
CdaO6297Vgfa4XIY05Y+/sUqp8oRTkH4QeVO4J3mshVkd69QQ6FhCd4XE9+seZnb
JHnW1+JtvgNk0vX6ptMjkvDs8IIeAiNOvCtRysWnTpGP9xzDzQA=
=idpr
-----END PGP SIGNATURE-----

--taoMADTdYPEZv5T0MLWf7NzOiZ1rvCkhn--
