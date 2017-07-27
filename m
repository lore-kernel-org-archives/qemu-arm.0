Received: by 10.25.44.15 with SMTP id s15csp1962712lfs;
        Thu, 27 Jul 2017 05:37:08 -0700 (PDT)
X-Received: by 10.200.53.196 with SMTP id l4mr5408891qtb.248.1501159028865;
        Thu, 27 Jul 2017 05:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501159028; cv=none;
        d=google.com; s=arc-20160816;
        b=0ymhcQtqoPickia90IaziCwTJybOBRPAQlR0MAJB17shAICWsa1cQFCy9qcbXTQtwL
         TiJUsQWhF6Ro3X/9NDxWjiNi2FvYS4LcZlp9YeW+uvRZOFIvx6Vh4R4zvhk2DTPz71aX
         bGMBVHYVk8INym18xr7IGEtkuaBm+zASpFJQImVSzlZkKotjxGDlL7fr2BfMzfkcn17Y
         vqJYiddupkPEm50AXStJtoK+TNs/NJI+H3GCWsJq+8nXiAAka0ZWI63KohwSjity/sVL
         HOS+alZadYM7eX97ipLMAodp1Ogd835ozUz1/lGwiU0Y8yNWnc/aNZURj+RS+IBcNGO6
         rnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=VaGufHKppsgOSkCr0A+5FDQf2c3OZuiNx7OziEjQnRI=;
        b=jGBufJLveil+8mT6rRG6f5GA2zvo5Vh0ewrk1HgGEQZUBQ8kPusQ7LFjkwsZKVVzR2
         26flT1SFfz9GvZ+KxPacuXstPd7rcEoCw3YiANT18DjLWpCO1fhzrzsKMelKVsFM+rkR
         S8g3D3ZdHyqrBz+toTbrHgcK+eiVqg983bMt2FSUAcNK1ABSSoEZJxR67dhOKwFNaZ3s
         EOSEgOPHaqEWF3WvOqrLvxkn9Pp4XimrJpIBP2cymHhi21PUKodbdVHSSLXn6p5vqks5
         fkPBnPEBOGniIBTuyANtSbT74lMZ+5JkxWCyr5ezfbR0LV7oClmrDyUY+B7TnY/KJNZi
         hwLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Z6OKq5B3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j31si2394504qtd.489.2017.07.27.05.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 05:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Z6OKq5B3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dai2M-0003QT-7j
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 08:37:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dai2F-0003QE-3t
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 08:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dai2E-0001gX-Dj
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 08:36:59 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:38460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dai2E-0001fy-6Y
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 08:36:58 -0400
Received: by mail-wm0-x234.google.com with SMTP id m85so92049234wma.1
	for <qemu-arm@nongnu.org>; Thu, 27 Jul 2017 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VaGufHKppsgOSkCr0A+5FDQf2c3OZuiNx7OziEjQnRI=;
	b=Z6OKq5B3dcIJCTh8kSkpz51ytK86Om//TJ53f6rpagHsfyKsGtXEhMP7GeiugStj4+
	8I5krfZMg97j6wFWpi4PpqygMhREpkTPmZmInAIRo2+WPAX0AZhNu5xOYgNCSjhUK6Sl
	S7DbQbZS/4fkaDoqrOKQStdbLQtfg0+8G5+x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VaGufHKppsgOSkCr0A+5FDQf2c3OZuiNx7OziEjQnRI=;
	b=tsA0QJI6bx+OdfGgoYEJck00vrcHYUv3fHYfJ4SgIUilhqg7SO6qV10JXoMzoWQjA1
	33idUj9sXEZJ+LGfduq2UbYJsjEh4X2aPgO1teOa41QKrM6wFy9PcIp7d7cWtryqNIdJ
	gD27OBAJ/7EoTdjQyUQfvqeBW0UhjCsxCk/MbYzeD/FryrT98SLJIRWgrQ05lWYzzrYA
	j+2aEl9kgJ29pTJTHZ3T5P3yPoVwh/S2g69bOcbvDKYn0u23bfIS9DIMw+UVf93bOIJa
	p171cVzjhs/JpEjIjgvHWI+K6U6mW+5bejDvSdv8/9mzE+Oa7lyz70IQxFGhITyEvHVY
	0H8A==
X-Gm-Message-State: AIVw111euFFy5QNTrnMGfW4wvDmyNoJLZey2p0lfUMourCdDKAPQI3Ez
	96wuqlT5ptBaUJhdXES6JwIdBqoz4CB5
X-Received: by 10.28.40.215 with SMTP id o206mr3253002wmo.74.1501159017089;
	Thu, 27 Jul 2017 05:36:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 27 Jul 2017 05:36:36 -0700 (PDT)
In-Reply-To: <20170717133010.12784-1-f4bug@amsat.org>
References: <20170717133010.12784-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2017 13:36:36 +0100
Message-ID: <CAFEAcA_rhoCup57nYYW4HN6Qsz3sp-cxY-OwsK-x=fYtfJ31aQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [PATCH] hw/arm: use defined type name instead of
 hard-coded string
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
Cc: Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /36engURjPCo

On 17 July 2017 at 14:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>
> Hi Peter, this patch is waiting the IDE queue to enters since it depends =
of
> commit de09efcc7b67ada3593354711b12a03dea23a9d0 to fix AHCI includes.

There's no commit with that hash in master -- do you have
a commit subject or something that I can use to find out
whether it's landed or not?

thanks
-- PMM
