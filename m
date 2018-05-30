Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4696063wre;
        Wed, 30 May 2018 05:40:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJaGlPmWwq6PdCSxrbBE9l2q3idXAZv01Ei1P6ArN6RLEFPnMyHYhUzv75IoUM8EVel4452
X-Received: by 2002:aed:3bae:: with SMTP id r43-v6mr2261652qte.362.1527684058833;
        Wed, 30 May 2018 05:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527684058; cv=none;
        d=google.com; s=arc-20160816;
        b=YmKbKzbz7JwIGlVqvz8gizWbPFwZDQoZFLb2t0SOT9xlpX9eGSJO6n+SqaUcJn0Xe4
         ZtQ8duqVw8N3jL0RnPMUUfomcMEMTJwGsyRQxjWi2av8selc6F21EkUC2bBbIcuj9ZfT
         pocKS5EW2ubYNaO5+nKoyQqTShLvXA07j1PB2QHT00xS4Hm5zM8HEzhFkHlwrC5QPeiq
         oZmfUOp6WXpCeWjt0vKJnw3CP1VqtHvAoRWeRuDc8hTabfGaMONgLfPsaBWNYJYhuhvx
         TnqEbqKKoL8K0sRxIJdFWKdT+qrpCqUm3aT0MF/x0jeIcS6s4RyLs3dF5DJcjEMX+8Jq
         NPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mSwXG2onXm47Q5J+clz4OgOlTHma++YGdqhaFIJo9t8=;
        b=WFGuoRb/4MxlKFa6NrC7Aaieqhwt5lVPABZ5iHwWn1at4zh/+694gP9+tuunC9FDYa
         aURc1pCm4Ya6lBznzTQGZXABVqzU5qGFTgPR/Rr9d7nfmiDPVIungYSOefvM1IRNK5c9
         D32Zdp0ApFtWimuYfRlvTfb42a29n/bRTZf3QnlwwoQA6GBT51xr5hRtkeVh3RbCY3mx
         P0S5WIDF1K0uJ2w4R4dKtPm4W8YLmknO6nWDaAgdg7kIPtqItW9RmG4z116UMSzSsRBr
         EO1b1T3kdKOdNPW8LvcKqW8ziLRFk5efG868JjdiOEnCr3Et3TM5ufNSKSKdrbR2UX+l
         vxIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gjJXnbxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22-v6si31362qkj.109.2018.05.30.05.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 05:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gjJXnbxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO0PS-0005uV-Ao
	for alex.bennee@linaro.org; Wed, 30 May 2018 08:40:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fO0PI-0005tN-8H
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fO0PC-0004aM-PL
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:40:48 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fO0PC-0004Zn-KB
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:40:42 -0400
Received: by mail-ot0-x243.google.com with SMTP id l13-v6so20922204otk.9
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mSwXG2onXm47Q5J+clz4OgOlTHma++YGdqhaFIJo9t8=;
	b=gjJXnbxuKzdvweIplfxwxIFTEwtRiGkCJjO1zLY1s42kTv//rBs91xZRPN7F4SXHAK
	tKr3r1ZIkI36C5yqkn/G3c1laonsisd1QWUpdkflz0P8QYcMnuXwNvhCsak69rBDtDRo
	nwCTbH20CC9oz5Lp8Fc5qysLBL2nmusC1HqQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mSwXG2onXm47Q5J+clz4OgOlTHma++YGdqhaFIJo9t8=;
	b=L/6e+U9OZHb4olFJGmpE9rAnUNSTQOQeBuG4rAHlseS1kCSJ//9cfdIE+ZEmB24CBv
	uB7bDXpnPi1VoGeFnFg15fTA2OtfE8hITauIGZtXyVZmPHk1YY+P+DeBKJYxjPt5/YjY
	c9ghRY0OqSVtq3aFpjn5wZNSAR/+lzJjDqSdGd0PwyH5gtJKzWRWon/i+nlF6z2YGGOs
	SeE2aoLGtzcP5NeS4b379b5rYfBCHkYF+qCI2Z324BlQTtOUxxXdwwi3u0XYQ6ULA/CU
	PTdt2lSZiPA9Nlno1t4eOuZ9yeD00+fgdE8Fittt7GsvA9p0xHVKDKnQaTcJS3H3L0hK
	aEsA==
X-Gm-Message-State: ALKqPwf0jakI3fjIdBgRmb03baKJxsQBmkGP72o+BqDzJ5hIQVf/Ltga
	5va8eXyzrywhwbvGQp6vShD5gJZhvhWhOomY1ENz8Q==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr1473602oth.205.1527684041791; 
	Wed, 30 May 2018 05:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 30 May 2018 05:40:21
	-0700 (PDT)
In-Reply-To: <20180530075002.4618-1-clg@kaod.org>
References: <20180530075002.4618-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 13:40:21 +0100
Message-ID: <CAFEAcA_a+nduAKWhLiwoKvoybL+cKN=51xV5M9f-VatPdbnf6w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 0/4] aspeed: add MMIO exec support to the FMC
 controller
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r6FQAai2Iaim

On 30 May 2018 at 08:49, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> When MMIO execution support is active, these changes let the Aspeed
> SoC machine boot directly from CE0. As there is still some
> issues, the feature is disabled by default and should be activated
> with :
>
>         -global driver=3Daspeed.smc,property=3Dmmio-exec,value=3Dtrue

I'd really rather not add another mmio-exec device until
we've sorted out making it actually work properly...

thanks
-- PMM
