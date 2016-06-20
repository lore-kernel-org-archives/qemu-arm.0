Received: by 10.25.21.96 with SMTP id l93csp1511530lfi;
        Mon, 20 Jun 2016 08:45:36 -0700 (PDT)
X-Received: by 10.55.214.194 with SMTP id p63mr23599080qkl.130.1466437533581;
        Mon, 20 Jun 2016 08:45:33 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x88si778942qtd.86.2016.06.20.08.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 08:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF1OG-0005uw-Ri
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 11:45:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bF1Mk-000571-5Z
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 11:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bF1Mh-0003Cc-Hr
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 11:43:57 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bF1Mh-0003CU-32
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 11:43:55 -0400
Received: by mail-vk0-x22c.google.com with SMTP id d185so200760493vkg.0
	for <qemu-devel@nongnu.org>; Mon, 20 Jun 2016 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rT8lND7K4rSOa11pn55fP8huSIy3aWCe5BlPofG/jZA=;
	b=RhyT4Co+d+GT1ofLowdCTWRNYqXltmcTUkacLUDtF25fb79a5BMHW1YME8QtCgdjHX
	vrpYKH+a+tqHCfPyS6NUgHS8ti22Udo+WBHQLU6oyFbCNNP8yqGepahU1WqSfYX8b06P
	PprBrorpBJZwu9cxCocAIVl54xsDFE4mdkiPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rT8lND7K4rSOa11pn55fP8huSIy3aWCe5BlPofG/jZA=;
	b=R5QtqKU63KtaEwf/R9h5+9dOovu43KE5cq3tFXp+HiMn2DnhNve57/rsl5pyetDaG+
	tXPVF+e3JmEeOAMnfU8joOKwAWjOnf4KvYVVlDYg0xJsu8Raytx1OHB4JZDUpyznaVHz
	r+dn9mlDl8D7jxeZ+DBEMaQu1fFja+lpbSgg5pPDUesjFBJTzJ4IthksBn1BVRQOumFw
	pYKxmBjbSeIT+X4rn6g+LPgHyF6zMGSgcaAWvq2KEqjhawFxjtfDre90Oq2samT23gSs
	GKa9dHTr6b7Et/WkwU2GFA71Q7VCAYTvnSOHwnkwXH1FrbQPS5ZAJEntkT7EsqoJfaTl
	3a4g==
X-Gm-Message-State: ALyK8tIfZ3cHI8Zg5YRGvm6uw8jfq8mKBy0EhIzxYUH/A0iOz6J6STYnIXlY+5lLSIXQykGDPD05lrjC27pmcPOX
X-Received: by 10.176.65.7 with SMTP id j7mr5576299uad.38.1466437434607; Mon,
	20 Jun 2016 08:43:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.193.141 with HTTP; Mon, 20 Jun 2016 08:43:35 -0700 (PDT)
In-Reply-To: <1466152555-10406-5-git-send-email-clg@kaod.org>
References: <1466152555-10406-1-git-send-email-clg@kaod.org>
	<1466152555-10406-5-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 16:43:35 +0100
Message-ID: <CAFEAcA-jqSr_myyWVoWv8=7+mm2bW7mJ_1+P7c_a0tvWvK=yAQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-devel] [PATCH 4/4] tests: add a m25p80 test
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LxOk8V5gFdnS

On 17 June 2016 at 09:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> +/*
> + * QTest testcase for the M25P80 Flash (Using the AST2400 SPI Controller=
)
> + *
> + * Copyright (C) 2016 IBM Corp.

Should there be a signed-off-by from an IBM email address?


> +static char tmp_path[] =3D "/tmp/qtest.XXXXXX";

Can you make this "/tmp/qtest.m25p80.XXXXXX" so that we
know which test is at fault if files get left around?

thanks
-- PMM
