Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2733797wru;
        Tue, 17 Jul 2018 07:27:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpej/CotrHlCTqlp49ToOUP6yyXan5CK9DPYti7jY4up92p3pYwevdPR2XHPcNDRWz6xPb5T
X-Received: by 2002:a37:c65c:: with SMTP id b89-v6mr1573314qkj.421.1531837677382;
        Tue, 17 Jul 2018 07:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531837677; cv=none;
        d=google.com; s=arc-20160816;
        b=y4BkF7yy9Mk+vhXQfcAy8+K68PSM+DZQPKbOxBcpWzFmvN4R+c8RGsMjQnxVxHK+Z2
         fwaLZsJ9jj4cITGruilv18R2yvDAiogeqhLQYoH4CTmNiRRswF72gEbqgL7WbQVg+lWM
         S5uW3POcpt/6h74iqDEpDtTuR0rxiwFAxd/sU8lOSA0I2gMCrwZ3F3Vm6WaiggQKgjCF
         1UKsZ74DHJRV/RChNFyxFXGjP1D28Yu1mTGVAMxC5QdSo6t12W9nr+BoKPPRj5UOtHL6
         yNDQWy6iO1Tl5NUiRHLSJDaYTvtvWTZQsC2XdqbEtHEsZ5bo8TIaSPf73WzSvvhMMj+f
         wpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=O8EcFEyO6SiiSoYFeqcbA6HiB7uT6D4ezANtkdjYY7A=;
        b=M2PVjx/rWYpPlNjinbvhfQ7XJauKoSZ7+Qvo/qYNNXsCyJBnLdCuanb9Fl8/r9Pw8N
         0f2pEuBNGGEbxQfB+E2X27UK8REWYEOZppKHu3K91JWEm16+nqtXpky6WvPH/8AP3zWe
         J3pjSF7M9VgGUedoG5/Rzq9FfI3c5e8Odwh2Z+80WCv7dIxBOPXkKC2OacXZG/pvXqzM
         YD6haEY3OGjYRDKM0K6lR54bCk0jcRrLhrfSwrAfffLQTtr2Y5hpvVlUGrrJk59yZBcj
         qX/jIk1U7n5+BmouAWAkeLgCvDn19cxOvQ60aDDTcj9FL+JgFso03HX1XqJfJBdOei3X
         Wt/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AHCYTJ10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l87-v6si927580qki.360.2018.07.17.07.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AHCYTJ10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQxI-0002si-Qd
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQx8-0002rC-R1
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQx8-0001yN-06
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:27:46 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:41840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQx7-0001xt-R8
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:27:45 -0400
Received: by mail-oi0-x244.google.com with SMTP id k12-v6so2368118oiw.8
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O8EcFEyO6SiiSoYFeqcbA6HiB7uT6D4ezANtkdjYY7A=;
	b=AHCYTJ10gAjSo/E97RHZ7mxAXwRFp2yES45KDhaSgsfeJ9vwFvDBUkZ2JE5apZL+4g
	hdaSROLx/FBgdphZwwJPj58VjpJjOQ6ND3y/jAmwZUpS23noD96xPXS8gm6deD5/VDql
	VxS9V6kEiZDOeRj2OU9r8esNoLrcR/8xm6aG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O8EcFEyO6SiiSoYFeqcbA6HiB7uT6D4ezANtkdjYY7A=;
	b=DpMBeitXEWGcrU43FcVOWcm//ZBO6LQ+wwcgiLe016DpWNbt3X5tkZ0OTVgDQG9XiL
	mCR5ZPpfT00h/3+kDHP/aDJ592sORHA8EnYO7G053bkyJ82I1cxTssrTCPKMZaFxiTr0
	n9HfW3aSQeGUZ3I+9BP61JcWOI7cFcNpEpl+K5muVEzZjoc50sF2VrJ3kdHTTdiu4tTk
	lMFHEUvTqRgoRxd7lgujwGeK5LGB0WBqVgQu+oJdSDUHUk9wlFAJd8aswHrJUye/o51w
	sbRPVo72jwYj3itI6NSARlDxNqgp2/dxJeLBJLr3cXce+W6O+zygXFTLZGsTlFQdnD/q
	enhg==
X-Gm-Message-State: AOUpUlGPe65kx0qVfN+b19GVjJfsG0wEEz3nRNcjwu69eU0HoW9eBdWv
	qCfz+Jl9RaoyCaj+hTZRsIpK1o7zEjQKo1FBLZJkSA==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr2015123oic.252.1531837665196; 
	Tue, 17 Jul 2018 07:27:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:27:24
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-17-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-17-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:27:24 +0100
Message-ID: <CAFEAcA-FbMDNqWta1Vr0C=vh3CsxM9osVigQbE4rCYBBBQGTfw@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v4 16/20] intc/arm_gic: Implement
 gic_update_virt() function
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
X-TUID: 0ir6GP4JDhWe

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Add the gic_update_virt() function to update the vCPU interface states
> and raise vIRQ and vFIQ as needed. This commit renames gic_update() to
> gic_update_internal() and generalizes it to handle both cases, with a
> `virt' parameter to track whether we are updating the CPU or vCPU
> interfaces.
>
> The main difference between CPU and vCPU is the way we select the best
> IRQ. This part has been split into the gic_get_best_(v)irq functions.
> For the virt case, the LRs are iterated to find the best candidate.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 186 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 146 insertions(+), 40 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
