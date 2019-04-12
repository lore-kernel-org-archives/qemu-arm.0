Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp11388wrx;
        Thu, 11 Apr 2019 19:18:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy22ZPlQ6VG48A5mhop+QpNGtEgmKm8mQ9uFqcOpV5rBW61toZrdJtI0HcSy6twRBawlLnM
X-Received: by 2002:adf:f68d:: with SMTP id v13mr32748753wrp.6.1555035539323;
        Thu, 11 Apr 2019 19:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555035539; cv=none;
        d=google.com; s=arc-20160816;
        b=o13SGtxG3lTAzWVLutTRsIxYYZwrTSBUn0JN5P7o57EkbOaHiSG7Bv8U8UwPPFJE2T
         qAeXJJOHVkOLCklOXdeLkYRq4WH3YYX5pXmrg0dEhCuExQCVUuNpPv7rpVzBAhIK3/82
         YkJbpqG4MgNBj4lZoNjgblFrwad+6ddoV+s+gsxaVylhl5szEwup0dWfudzezDxyw6ye
         yhaa64pvGflRwLhk4NGjECS1ysd/wsjK33vbseTimNQc/gdn+CXp4kvjWnfsE+yfQgv4
         r5A64r+LKjcgfZaiJmp8+mu4Irc+hLlLCNNJk3WkHH0l6TPR+vRj1GwdvEthIMoKgnqu
         5EZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=aL+Yylu12gi6XCiKgLJ9IpSKqK7vCbcazrVnKnO4KqI=;
        b=djD2WI+3PYsuYEifCELucc2Ok+G8kpmxkyUzkDz27itjG55U/IfK4PyR/eb4iDEe9p
         44kGIHq6Yfw+m2Df7+vS/ZNZ6ZocsM2f469hfLKG58N2D7hy1LZ+/UmYN1EY0PltGJdN
         KeCb6WHYl4A6jH9+xns/Cx64GUBonphn+TkS5wiIuY+wDmwRC0IAMGwKC20OC5CXmam9
         IhegWYqGUFfh1PRwBRjiKgrPJs/fbvN9NjLFE5GBWJ/oDVXgypjF6+tBvDNgvrDVJ4yh
         /za5Vr8z4ay9B7MZPOGUCOKo5XqBTPFJHmrWZGR+t0j7cHklcggaxGGtV1f+wmzFlUpB
         v0Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=fhqadoVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si25327234wro.38.2019.04.11.19.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 19:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=fhqadoVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hElmM-0000HX-EK
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 22:18:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hElmA-0000HL-2m
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 22:18:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hElm9-0001kW-8i
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 22:18:46 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:45055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hElm9-0001k8-2v; Thu, 11 Apr 2019 22:18:45 -0400
Received: by mail-qt1-x842.google.com with SMTP id w5so9516026qtb.11;
	Thu, 11 Apr 2019 19:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aL+Yylu12gi6XCiKgLJ9IpSKqK7vCbcazrVnKnO4KqI=;
	b=fhqadoVYuMYk8lfta/4r02EetdvhHQmtfR+jKFA7VYj1VKZlKuUO1UoEH2Vx2fFIbl
	Jyj2ezurzO7wuCBPXuv0dwApD/fQxH2bm3vwDBkRj50V20i22QqUxfkCqaHEkaXyU6Zr
	Ryu6M/Q24E2ooTQOnVryLdKlavsKLj0DFrjFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aL+Yylu12gi6XCiKgLJ9IpSKqK7vCbcazrVnKnO4KqI=;
	b=nlpovfSAoPKJx1TyIx23Z2yFwwwcZReXlRCn2JfjEHr61X3T13YOxVbd2GlJ7NLzqE
	nmxvzbwXQh/o+OtbTqoBmR4IKqVboxRvutrmSP4LNxUxcLNpj4icYdcyniCmdzKbZ/l2
	eDSr0ag2PSMEpiGvTSwOpS9ASdtS+pfjgunAam9eRPSpmQndEh9DfOvtnSC2Kg2BVkuZ
	U7iZzUAonSgWPwhcJIP9Cq1mS5EQJ6D5PoZVyMdS2Bsz4TrU87XDKvdGqSxLiofM8eRm
	mT4GC/LikpiKBcRMtd6KMaoqQIIIbLff1mSln/G423/lm6ycye4A1MeEHonCHy+Rn7xe
	a5Ew==
X-Gm-Message-State: APjAAAUL70uZQRa0H5nUi5ew/fcUuHdalMOAy4LetK9AiyNdS3cpVQ1z
	nofmgpdEM5ANqYo8BzuVN8re+BuKReaeKLT/X00=
X-Received: by 2002:ac8:2f85:: with SMTP id l5mr45837720qta.269.1555035523784; 
	Thu, 11 Apr 2019 19:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190411161013.4514-1-clg@kaod.org>
	<20190411161013.4514-3-clg@kaod.org>
In-Reply-To: <20190411161013.4514-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Apr 2019 02:18:32 +0000
Message-ID: <CACPK8XezRXPFFiiK7_xXLs-ipnfw9400E1dSRHN0XnF2cc4=vA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-arm] [PATCH 2/3] aspeed: add a per SoC mapping for the
 memory space
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ds1L7ci+zaa

On Thu, 11 Apr 2019 at 16:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This will simplify the definition of new SoCs, like the AST2600 which
> should use a slightly different address space and have a different set
> of controllers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 5bbd1fb87d18..9b601709e93c 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c

> +static const hwaddr aspeed_soc_ast2400_memmap[] =3D {

> +static const hwaddr aspeed_soc_ast2500_memmap[] =3D {

Most of these arrays is common. And some of it will stay common in the
2600. Any ideas how we could avoid duplication?

This is fine for now.

Reviewed-by: Joel Stanley <joel@jms.id.au>
