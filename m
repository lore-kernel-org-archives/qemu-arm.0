Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp784015wrq;
        Wed, 20 Jun 2018 06:42:27 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKH5sNQfz+w70T3M0xENPr+6dN/JznAzFNgFX1+wqEMKnU0eTYdscmY0PYklFzKL5EiRk8C
X-Received: by 2002:a37:c602:: with SMTP id b2-v6mr17237520qkj.413.1529502147881;
        Wed, 20 Jun 2018 06:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529502147; cv=none;
        d=google.com; s=arc-20160816;
        b=Twdkk0hLwbJhKsZ4rtu1UTirWPFveyn5cvwKSem6n+MF4Y4+GvPWu+tpASLMzKV2vC
         TYkX7DfwGwhXuxzB5CbdYc2By/APdbcLX3Yyts2EdjQ2GEOLPmFj98+CldrZSVBmC0Fg
         pJgt0abfTcurq3CJaevs5ECj+xE6FFFUGRBOody07EVwRLJBO3qB8QcSyGp4otwGdBxJ
         AUdPTc4a1SSHAPzwwGi32M3awNjEAGNJ5MTJhlDALA1m0OUCunPeYaH/iLLTyW96SMwR
         N9xWcM0wV5+SKNzjM1d98FSk23MBNtbpdD/7Saw78Y8svw1Qm1nsal24qYoL0AmaVoE9
         cW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fWxAAZ/obC2dgK3P7HOhAcZIemIGG2MJB4LXyUpkMR0=;
        b=QbvKuJdtnsleWpzD8DWkU7y2jra2lR3IB3wWdku15LGmmZ5f0C4zuPqCJQRzaYtXNB
         MSMevGxGrp2BIuYX6tg2pe2Yxn0GEb7F6pd37TY56dd3aYPKEV341L8LkOJ3C2s/cJYj
         HBibaKkyISIcvoJzwzzwGUUMa/JPbnEe+cbIIKRIfOv2KHF7UyVo0Ji8GmykLt3LILGe
         P2X091aUANYTUFN6L3vECeK9p2HL5PHkmP47vsjEsCIQwlSJ0RoGbuSlVglxse62S/db
         lCpHSlmGZpmF5W5eytwSIdkOOZX2tAqml3L2PNmgHu7T1j0A0B7q7a2uKGJmVnYCHqKO
         2wuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NIJVBoZT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20-v6si1752512qth.328.2018.06.20.06.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NIJVBoZT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdNT-0002Ii-DS
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:42:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVdMP-0001ln-4u
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVdMO-0002go-EH
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:41:21 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:33393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVdMO-0002gV-9H
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:41:20 -0400
Received: by mail-ot0-x242.google.com with SMTP id h6-v6so3763065otj.0
	for <qemu-devel@nongnu.org>; Wed, 20 Jun 2018 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fWxAAZ/obC2dgK3P7HOhAcZIemIGG2MJB4LXyUpkMR0=;
	b=NIJVBoZTRPS57eXy/FZJdmjPCRUmgrD1uUM7FWpeU/I8j0UzGx6lVVUd1/41jap+wl
	BM5ylGEQVTVNKoBSWb8FBYOgbSbjMiw988ft/MDlqsL8IwIyJpiVH42tN4C76jofV0xQ
	60/2bc8RZirKruT2v8BQHko1GFvvLJSNFN99k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fWxAAZ/obC2dgK3P7HOhAcZIemIGG2MJB4LXyUpkMR0=;
	b=kPnAOAjsA9AnY3oLiDItmV5QsXzuDiG9F81WFbtwAadttIGi+VRKctY+xTTA9bOn6K
	v40u1wZmEHcRTZHt04Yq4d1BbRvQ/RihKAGicXWT2IaV5usQr6I1U+LGEnPK3KWL0cxP
	GRf26C/fH8yBgJhaNs3lU9nOLr7EoZpSnXRma+u94a9kT8C8PtMayTHFX6lV26a5nCkX
	sIsI3v87bmruVxmeJc9JyhdoGxoE3dFYREFaQr+coiXK0oDdj1ZRBaq8++hf/IlN321E
	HGleMG2Oj6fqW5U7TzT4vj1qct5/g0Gk/iUiSJQ3C5kWW0XmWcbXStMtYS1Y56qA21QG
	4cJg==
X-Gm-Message-State: APt69E0ACEttmGH3Rxgob+s+Wu0350NLj0uOeqVyf1ws4moXB9CjDFy/
	ATnRQ6Xt68zzahCILYiPstq8NUtFYm/Xt0lg7LpJbw==
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr12241675ote.126.1529502079584; 
	Wed, 20 Jun 2018 06:41:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 06:40:59
	-0700 (PDT)
In-Reply-To: <20180612065716.10587-1-clg@kaod.org>
References: <20180612065716.10587-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 14:40:59 +0100
Message-ID: <CAFEAcA9KJVw0fuuXY_Ya_F6ELrp-MmgTit4oHU_e0xM+VTdnWA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH 0/3] aspeed/smc: small fixes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l757zqYItm5x

On 12 June 2018 at 07:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> Here is a short series of cleanups and fixes for issues in the Aspeed
> SMC controller model discovered when experimenting with the MMIO exec
> feature and also from tests under a QEMU PowerNV machine.
>
> Indeed, the OPAL/skiboot firmware accesses the Aspeed SoC address
> space using the iLPC->AHB bridge of the SuperIO controller and drives
> the SPI controller to access the PNOR.

Is there anybody familiar with the aspeed SoC who'd like to
review? The patches don't look particularly wrong, but I'm
not really in a position to be able to review...

thanks
-- PMM
