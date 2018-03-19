Received: by 10.28.91.67 with SMTP id p64csp3035422wmb;
        Mon, 19 Mar 2018 13:35:27 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvvGLbKKAlKj9MCKOxn7OK8iVvVYoAkAS+/QVaG/R211J6TJxKfPdV5syFDqjVExlHQR97Q
X-Received: by 10.55.78.212 with SMTP id c203mr19980542qkb.351.1521491727093;
        Mon, 19 Mar 2018 13:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521491727; cv=none;
        d=google.com; s=arc-20160816;
        b=OwOrPu0QA3G/+3w6z54dnIuh8Vye2pJhBQZgFX85GDl+KE0y6LFCM3hKC9xP0fDyzn
         KKOal9MYDU9wJ346AicFyOrHUQY2lGcfn8FPG/t3CuYssDgpjLAC14llED3GbIZaLWNE
         H6S2PkWtIc6hNzeEQrldz6coXcjI+6VccPKPApK0M0LB1RrIysG1EwS+n7yqKnkFRvR8
         iKvAlpd0sKID77gOWh1yeOl1cYEZ9ykjbLNt30bz6FO/5jyRzPXOTsEZYcHoJwwQ0oJN
         NLDuM2KJRmXyw6wtcibqVl+IsikFYkubcRgCi8CiPioVrE+AdsZoQLMkWxuMT9xsEl+a
         5C2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=zN55oNd3l2wkmelRrAOKuF4N3l9uFQEKqW++vb0yre8=;
        b=cXU9uNfaeCM9G3/8Tlb1ysOODEjnh3XLR6JNhsaLsqtMNV1g6AxixSjHzVx49a8g9J
         mAKBVpeng7dRP+hpa9GiByGToKCFhSLc9eSYTkP6C3zzUullL7uder6AZIqsuwNSMVvm
         urlPurO+BHhHEFEJzMhQWZJwwykU9WjMWqjSdQQ3HAfm/LIgXctkpJQGjRwCsTQhh99x
         +mNSaHkA5b+vTEZzbUNAwylHmQvTxgDhhwuwctQsoFLWNUY7kCrOXlNqoDfTIBUfQdql
         6EXtw9cTcKxudMPpqLupRpTQCaB0cW4tkbdSwQwtjm7pwpyAdaSbriTJ7zIilMRu9uhR
         M56w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=CGQUUv4q;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=T+Tdjxdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h124si896190qkf.108.2018.03.19.13.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 13:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=CGQUUv4q;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=T+Tdjxdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey1V8-0004ee-JK
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 16:35:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1ey1V0-0004eG-Eg
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 16:35:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1ey1Ux-0000le-7L
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 16:35:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1ey1Uw-0000lJ-SW; Mon, 19 Mar 2018 16:35:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8EC7060C67; Mon, 19 Mar 2018 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521491713;
	bh=odc83z5pIg+u22eyWsBDYUtak6WuBePVe0y6R5fwhz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGQUUv4qTkEf6w6cu1VJuxPbeU1AKwWSQJ3cPD6pLN3mP10NW1ByftEaBXUOiKW6V
	upQ4qTRdeZ35hqYefMM+2p9JHdyfWLrZ/Ahr4TJrz7QNLJos5FxZJonIC+V5mDD+xM
	g2IBBPM9nte5YPB/bInNpcPvrtSxZF0IPqpPdxRs=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E34EB60312;
	Mon, 19 Mar 2018 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521491712;
	bh=odc83z5pIg+u22eyWsBDYUtak6WuBePVe0y6R5fwhz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+TdjxdyqomHJUDblrODahaN/DkeOhdE5UtLqqtrML6tYPxHOZm2v0E7rpbysrWxS
	SRimsy8dDY5YmKynLjDUkzWj+f0OOuIFKhcPBK5x4/t4t0ueWmF8MKdafDjkXzxIbp
	BUMR0mGVVcUzTgS8z7gWc2KA7nuAuFAsSe5Hx2Q8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E34EB60312
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Mon, 19 Mar 2018 16:35:10 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180319203509.GD24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
	<aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 01/22] target/arm: A53: Initialize
 PMCEID[01]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XBinR7yYlXRS

On Mar 18 23:35, Philippe Mathieu-Daud=E9 wrote:
> Hi Aaron,
>=20
> On 03/16/2018 09:30 PM, Aaron Lindsay wrote:
> > A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01].
> > pmceid[01] are already being initialized to zero for both A15 and A57=
.
> >=20
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu64.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 991d764..8c4db31 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -201,6 +201,8 @@ static void aarch64_a53_initfn(Object *obj)
> >      cpu->id_isar5 =3D 0x00011121;
> >      cpu->id_aa64pfr0 =3D 0x00002222;
> >      cpu->id_aa64dfr0 =3D 0x10305106;
> > +    cpu->pmceid0 =3D 0x00000000;
> > +    cpu->pmceid1 =3D 0x00000000;
> >      cpu->id_aa64isar0 =3D 0x00011120;
> >      cpu->id_aa64mmfr0 =3D 0x00001122; /* 40 bit physical addr */
> >      cpu->dbgdidr =3D 0x3516d000;
> >=20
>=20
> Maybe we can move this at a single place in arm_cpu_post_init():
>=20
>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>         cpu->pmceid0 =3D 0x00000000;
>         cpu->pmceid1 =3D 0x00000000;
>     }

I like consolidating the initialization - though I think it can go in
arm_cpu_realizefn() with the preexisting PMU-related id_aa64dfr0
initialization since it is constant once you've chosen a type of
processor. One of the other patches in this set actually already adds
some PMCEID initialization there based on PMCR.N.

-Aaron

>=20
> Regards,
>=20
> Phil.

--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
