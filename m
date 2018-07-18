Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp456052wru;
        Wed, 18 Jul 2018 06:25:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfeELre8CoPdemROv04KZiJHxX3/Q/CqOcEcG4SwKuDHwDQyxAV4Ffud6LEN8h+4FOCoWTh
X-Received: by 2002:a37:ba02:: with SMTP id k2-v6mr5453394qkf.134.1531920305127;
        Wed, 18 Jul 2018 06:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531920305; cv=none;
        d=google.com; s=arc-20160816;
        b=iUJk8Cie1VjkuueOOgOlYF2ZyM1537EnaevUSYMDrB9RPIlPG9ppJIObu4bSy8lJ64
         NEvgpBWSyyzscZHXajuL2vjYTzt3DrHRVhzuZ1Vji9kyCg5YXg+tfb93UFAyVUP1yQny
         np8uN6pdErreog5gL6poEZpGZxZyaPEffHEYCHisJ833AO6TUPub9THnds93j2nYX9Jq
         nY+iuPZqHINPCa8fsHuh+BvED2cuAjsIA8ncC1E9e0fnm9Ilp2jfNWWdAFxXvjqnTHHk
         Ojgnbw6/ZUPpSs4q3PDurmsdShA3vdInO9Oc/McC1nQDO+CLMIJi2nixNQ+YwY6EqtqK
         APkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=2K6/wBjpwbN5qLyF1AsvU5VBIjVQHbLCHaOtGqlUYWw=;
        b=xBqO6xYLQZnWQNESSHJsJdUQPdEI/mITvSGX9N2I+WWPpSdUD77qNrzdshX/cUPsVs
         kVWNeTBwptR1MHRZG+qFqtcFZQ98Lijh5APVu5zen/a2qaP92aEr+P3obL4PIEay8w2i
         doOcd+dsmzhwQozVmB4i2o8/pVwRFCZX6SxhY7ElsBgPWVUwrhZAtQgheor85Ikfxgke
         S8XQ6xE7wrIWRFAVz6zWwrAeBFTTLpRG9DnNTcrKZrx7dbn2eUeP7o9D/jSTOj28go/t
         TloAAt3cW7ZcnRftGWt6VZjGZrJdwWFPYmgBtI1KoZLqqFGAyAr7HT/xattDIyXwIupp
         0oEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uGvVK8Xg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C6fTIO2Z;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C6fTIO2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2-v6si1947264qvm.126.2018.07.18.06.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 06:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uGvVK8Xg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C6fTIO2Z;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C6fTIO2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffmS0-0002tn-J4
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 09:25:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ffmRj-0002nd-CN
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 09:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ffmRg-00040Y-5i
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 09:24:47 -0400
Received: from greensocs.com ([193.104.36.180]:43057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ffmRf-00040A-Od; Wed, 18 Jul 2018 09:24:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2A3A84434A4;
	Wed, 18 Jul 2018 15:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531920283;
	bh=2K6/wBjpwbN5qLyF1AsvU5VBIjVQHbLCHaOtGqlUYWw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=uGvVK8XgCqhEpOL2QKHF7RbIWGxl0RE8OSm2GlYdotzrV/cn5fsf8Ln1GetZC7vPN
	PTSVKgn/i/s/tRQVOgyUTDHjZqpNpruutqJBdie8aAb6Aj/Hjir/mJEjedl+wwC9Lk
	tTWXSRjUYBu8Al8THJZHl1McsBVueeS+pVX0sjsw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=C6fTIO2Z;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=C6fTIO2Z
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9_PcxEWTMGB; Wed, 18 Jul 2018 15:24:42 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 61D11C7AFA; Wed, 18 Jul 2018 15:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531920282;
	bh=2K6/wBjpwbN5qLyF1AsvU5VBIjVQHbLCHaOtGqlUYWw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=C6fTIO2Zfb2xTgZAUvYmORLqUU96NdUCY/7rLF2tTg1r8gjEpIxxYr86p8hR0aBB1
	aTULZIMNsU9eD0dL6Bvjgxx5VvRdBqL5avO5SSMyW/aqCXfjFhrrnt4IaQDGlmGcbO
	i74i7RLB/twLBfaQQgH/9OwsRga9IF1kkXx7f6j0=
Received: from [192.168.10.102] (unknown [105.98.114.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B2CCEC7AE5;
	Wed, 18 Jul 2018 15:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531920282;
	bh=2K6/wBjpwbN5qLyF1AsvU5VBIjVQHbLCHaOtGqlUYWw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=C6fTIO2Zfb2xTgZAUvYmORLqUU96NdUCY/7rLF2tTg1r8gjEpIxxYr86p8hR0aBB1
	aTULZIMNsU9eD0dL6Bvjgxx5VvRdBqL5avO5SSMyW/aqCXfjFhrrnt4IaQDGlmGcbO
	i74i7RLB/twLBfaQQgH/9OwsRga9IF1kkXx7f6j0=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-15-luc.michel@greensocs.com>
	<CAFEAcA__GVdga=VDuwiVq9XW4gBRxMECd2Xm_U8fDzH+aTkzOQ@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3a34229f-a8c2-344b-2e67-7a3e2f330084@greensocs.com>
Date: Wed, 18 Jul 2018 15:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA__GVdga=VDuwiVq9XW4gBRxMECd2Xm_U8fDzH+aTkzOQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9hDg4hFnsvnsFAuosku8Q4T5Kcj9IFBoW"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v4 14/20] intc/arm_gic: Wire the vCPU
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
X-TUID: SVdJXufFP7DA

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9hDg4hFnsvnsFAuosku8Q4T5Kcj9IFBoW
Content-Type: multipart/mixed; boundary="wnX5h9eCiLVQzaqRFV7i4t3KA6eeSh1DO";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3a34229f-a8c2-344b-2e67-7a3e2f330084@greensocs.com>
Subject: Re: [PATCH v4 14/20] intc/arm_gic: Wire the vCPU interface
References: <20180714171601.5734-1-luc.michel@greensocs.com>
 <20180714171601.5734-15-luc.michel@greensocs.com>
 <CAFEAcA__GVdga=VDuwiVq9XW4gBRxMECd2Xm_U8fDzH+aTkzOQ@mail.gmail.com>
In-Reply-To: <CAFEAcA__GVdga=VDuwiVq9XW4gBRxMECd2Xm_U8fDzH+aTkzOQ@mail.gmail.com>

--wnX5h9eCiLVQzaqRFV7i4t3KA6eeSh1DO
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 07/17/2018 04:26 PM, Peter Maydell wrote:
> On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
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
> Is it? The spec says the GICH registers need to be accessible
> like this, but not the vCPU (GICV) registers...
Sorry, I changed that in the patch but forgot to update the commit
message. I'll fix that.

Luc

>=20
> thanks
> -- PMM
>=20


--wnX5h9eCiLVQzaqRFV7i4t3KA6eeSh1DO--

--9hDg4hFnsvnsFAuosku8Q4T5Kcj9IFBoW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltPP5gACgkQd8knW3Qn
Tr6XpA//aw5gIGDlGdVwxXv2FylRQQXKikuJ19/rfs5F3YCK3jnAYc2fh2HDkuYY
aI9fq4oFyA/LaapTsfVOI59oAptbt1QfTwZ/PjeyKoIBbAgtsUYb5FIvvuoBcDWn
Dltcvzcf9+LdM8AXxU17gRFFeig1Th1/QEt7QWVePZpP0kTkOGeAnEfwxkuN9UNb
NuT75xUzqBH6Y6G0XV++0A8z0c3PXxAtXeHm28cTdGZEXXPm9FDXkWGRrx8nc4lm
RRPYSVzMDk5B+LBgp53EkOqtLHbvsW6xoSBuh2yIMArmnV7QRyq/37eu7F7l/9Jg
i+3+Ju8BW89KWhPsbPBNnsJWQ9UKcikRq341faIi49KF5ZNs/PT4KECZX4BDQRDp
L8W/3M5nMCk55mxnwMXMOMhayVKUYZMzr9gsdcPGUCbn2D2ER8YsRE+//F8gl3CA
Qs5KLJ/Fn9fQ5jgSgTXgHoNv8DK4UDH07M6ZeOsvCeRp4UwNg/jAUSB0LTO5fTpS
a8q2DY6LXhFUHt1Usexq4zcKr5PPKoF7scPCYqW9U+Jz+uJqLkZtAuUUU2tL2FJL
zcANV9rOr0C3yQsno5zXVqwwmQH0OeTxUik4d1rDA9dGlSgHH8MSJrpEF6K/7oub
Y/QAmeesB/tMxGvfV5Dsh8Lg7EFOIV/AaWdK3Sfv/nKu1mcTRrM=
=nxvF
-----END PGP SIGNATURE-----

--9hDg4hFnsvnsFAuosku8Q4T5Kcj9IFBoW--
