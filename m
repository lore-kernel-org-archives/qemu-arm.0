Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2342033wrt;
        Thu, 24 Jan 2019 12:11:53 -0800 (PST)
X-Google-Smtp-Source: ALg8bN48VNo1hDFCETYnlnV5nuGXZGKDqrYcrigkZMK9titW4ZxBTXznVYg7Aw5Gn7EfEscDcCOF
X-Received: by 2002:a1c:ac85:: with SMTP id v127mr3708674wme.62.1548360713582;
        Thu, 24 Jan 2019 12:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548360713; cv=none;
        d=google.com; s=arc-20160816;
        b=xJ1w7P4pj+qMcGVzvLNhcgOiC4rfqrMiPTRyjiWkgdEtAoqBFFpSjkXITfsoX0ZML1
         6nsHRUzWPmLc4zSd7pHuIDQlQ4k0cTD7gY6N8RNKxx5W8Y9nK0WXIEOcpzbVN8gnY4f5
         TihEDmj4qn1++Vxpze3rmHWDTYdalfrvxTEU9tDpJarXo1E/pqz0bG1zV8GW6sw5lyU1
         /RKe7cfFAD+MO26j0WN1FH8mCOdXb66MyKkwzS+hxbKnDiXvYFHduIlJ9P4uCsTGJX44
         oefTtGd3R1I8WRmfudIaGVKd6AZ3YmvzVrPs/w7JhKYy+ovSrtmK8+xaulrOnGtIkZpM
         qs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=FFeihuSTCzZ3J6U/QWPJi9hSzKoEFBBUUo5qCxyJsds=;
        b=U+8Tp4L66HGN2Fy2KiTnmSWOA4whaqYd5mI+s0P2XQ8JyLbwbExUo+jWCnpqx7ohef
         0czwGMNH7tYjYFhux0kwV4UXrtqEDJaciP0tA5KhBr/2ZOmKRMrSFooY/WkGJhfRknCu
         P3igp6K1D+5lBe77UxTcZqWV/NdasANNsP6bOx3rgls6kqWx6XHSvKgxDzMomJHUZCLy
         z7rT3Nam8pZiedc+pK4sAyao0LLiicLG8raZzjFq1TUmQGKiNeUd0fD0J3uTJ6xmNarD
         SrS5+TZ0UMyDr6F34xY3X61FoqgeWNjB+3Awiqv0P9VIoluwECeZY1D1yHbsNfENaxXM
         J98A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=GeiKqkO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si77889807wrm.234.2019.01.24.12.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 12:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=GeiKqkO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmlLs-0005Mp-LM
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 15:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlLd-0005LM-Qi
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 15:11:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlLc-0000g3-RL
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 15:11:37 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:32799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gmlLU-0000ZG-CK; Thu, 24 Jan 2019 15:11:28 -0500
Received: by mail-qt1-x844.google.com with SMTP id l11so8233122qtp.0;
	Thu, 24 Jan 2019 12:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FFeihuSTCzZ3J6U/QWPJi9hSzKoEFBBUUo5qCxyJsds=;
	b=GeiKqkO3pP9RCSECY7FDD1WQD8UYrdu9D+xzz+BFnWcGdLPxyf7rZeITA8itGEO4kh
	0gY6COslfqhtJ9ITakg6fLTSSeCC7rpr6uCUs3a/n1IfiZkU+C23aXaSkUM2OVaEM7WQ
	XyDzof2Wq4r0ntAJZ22V14oCKJxbtJp1sYgQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FFeihuSTCzZ3J6U/QWPJi9hSzKoEFBBUUo5qCxyJsds=;
	b=ZdetPvwkReXkb8ogfTbJK3+PHHvoDsoKbXhD859rw//SCQzT4a4HedXILRtz+jOfpN
	Hh/j6WKbliLKTUzLSlr7AL4vWo6/hHw/vYjNsul+X+Lrt6TAlb8ivZ689jgJMiN722tZ
	h0oUv+Fivyaasky98P8khRWlMGeTFXIQk8KCHP1xDfRgc4j5Iv8jR9qlzGP/ZkDGcgy9
	CIn1j3D6peT9XY6uAKHwLj01RvY5Rsb4IdJV1N/i6Bs5wknYsaQIhe4BMl3Op2EWqZ3i
	thDyvNPIZ1S2HIUQ270+rmoR1v5QRSz9OqBe/sb0iCNLLVGD7LWaWKbLTFHTG4Byk9Io
	pmHw==
X-Gm-Message-State: AJcUukfgMhgjHVss5biowQrhzogtO4SgEPvLZq+Y408l9BxcE5EYu+yC
	oxuFszOFj59Ri0uLvTzOVf9xU2GFEWgJkedXawQ=
X-Received: by 2002:ac8:7308:: with SMTP id x8mr8314882qto.284.1548360686180; 
	Thu, 24 Jan 2019 12:11:26 -0800 (PST)
MIME-Version: 1.0
References: <20190124140519.13838-1-clg@kaod.org>
	<20190124140519.13838-4-clg@kaod.org>
In-Reply-To: <20190124140519.13838-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Jan 2019 07:11:14 +1100
Message-ID: <CACPK8XcnO43f-v4AtF2hxWLMudWqFrA8=rUThFLCJYH=Lm99-A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-arm] [PATCH 3/4] aspeed/smc: Add dummy data register
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W6teyeqBGiOg

On Fri, 25 Jan 2019 at 01:05, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The SMC controllers have a register containing the byte that will be
> used as dummy output. It can be modified by software.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
