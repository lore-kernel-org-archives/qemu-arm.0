Received: by 10.28.71.27 with SMTP id u27csp4948321wma;
        Tue, 27 Feb 2018 07:30:34 -0800 (PST)
X-Google-Smtp-Source: AG47ELtkgSswfFNV7+RSvupe28zME/98WCzSa3+jh2j/CvF5CJh2dLXs4rcBEG0tef5XyB9CyIZ3
X-Received: by 10.129.209.9 with SMTP id w9mr9701114ywi.58.1519745434429;
        Tue, 27 Feb 2018 07:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745434; cv=none;
        d=google.com; s=arc-20160816;
        b=rMbkKk7bx/Ogn1rzhnhZ5P3ha81llseaNoje/f6DElH/ET31G7Spku88ZAM+F6zd8q
         0rze8U+6rkxq1cnpCXPIggT1t0vKRwWOH8Z9PC1HRUivu4pG2oYFhvIwRn95udpsZsPN
         lLlMgikezz7/ighiYmsuqIwhOQVG8H0XpqsNQ421T21WC4BjCsNethkGW2c/MwOraYPN
         uznkYUKiiImkx2SJvwUIiGMAwqECYHHc6eDn+pr7pSOgPRoBCxjpzb3UPsiQ1tVqeenH
         ocy0fuF8hfukSPBG26E2MB+u47Srl+36dvUwB84+ld5FNc+UDJ+bjNyHq+ADrOc/+mSj
         Pj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JKQzeGZMmHhqVqtErKFOQ54Lf15EUhHRWfPtsQVrhCI=;
        b=I/OCEFnsg0U8f/PZodUD0m4ISs9of2eRT3ksh/zCS/Uvnimi/t8Fsy3svV5IikmcNH
         9OnpBLXPyYpfrDhgj3i+aVEMRWt3a+jvWdYbFZ077Hhaema+svwBiUc3662IZOZDBa6e
         Tk0001ZWO0g2TRp2VYIkxityhhv9QVzGBDi8GTw2gWZ+2PQPQ/yBnGcceoZHGpxcHqgS
         O24A6DZOFk7LWh3xxE6xtL9B/WtaWOgvHx3ZVNyz/S2L2HWmTqgcHWEPd0oZ7syhA1C+
         WncHTO74Vw0WMY5OBicLMzrxqDtLwLKkZrhKP1VbXJGGtGchq6qRR+Qa1SMBu24c7mYS
         GU4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZVi9oBVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r70-v6si532362ybr.513.2018.02.27.07.30.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:30:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZVi9oBVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhD7-00008T-Or
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:30:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhBr-00075y-KN
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:29:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhBq-0004w0-PK
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:29:15 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34179)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhBq-0004uu-JM
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:29:14 -0500
Received: by mail-oi0-x243.google.com with SMTP id c83so13162536oib.1
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JKQzeGZMmHhqVqtErKFOQ54Lf15EUhHRWfPtsQVrhCI=;
	b=ZVi9oBVOwClI3PXbXMq4fhnRBhGTTqZII2uqzyH/bxvlepwzMAiBRxuMC3CIJbpMFL
	qyUi0f4JPdxkWZ778ke4hCoBqQlOBvCrgj0LNI0rfbp2yazqN2vDD2SUMo6HpXHs48Mg
	zWJbrW9/YkzLmGEmfrI7Lv1Kj5+zjdppN944E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JKQzeGZMmHhqVqtErKFOQ54Lf15EUhHRWfPtsQVrhCI=;
	b=iSAicUpeTc+LiLdTmrSZ9D5MCMOV2jFM4zTRLejYTAx/ZafrgohiU2DvY7UQQiyOYh
	/TCc+K8it1Hci+VNJEQ1tGdgpCSesUciP88ZU35aNWDk73o+AqHlcmUKPwJcuZyPqkNP
	lulaO8bqPmfVrgS55aN8TSYK+e7heA9FNg+r1KoBaM76+SKaNyS6InJNjVb6UQNRr6Fh
	5EGwdJwmXJ0k+NNvReKsu1/Ob4PLDG8DdIXxDsyBlDVaFeJjTEiyTmP9veyQwEcEuiJU
	3XdzR0dT9O31v4SVwyktVh6nW/be3HReErAER2YeAGwxPhF7hPXubanRCJEij7HE/TaJ
	3qRQ==
X-Gm-Message-State: APf1xPCTitTUSVgDpBrwnErICXKUdXXINttoDnH1437po2K2gOhdNbce
	VkzhTijm0x9y5D18SnATZO5wHsqd3SrzxZNoLBMZ0Q==
X-Received: by 10.202.97.87 with SMTP id v84mr3783966oib.12.1519745353909;
	Tue, 27 Feb 2018 07:29:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:28:53 -0800 (PST)
In-Reply-To: <20180217182323.25885-62-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:28:53 +0000
Message-ID: <CAFEAcA9V+NRVS+yEFXhsc7Qbfgg3TVPaMrPmOw4pv6gkLdxjfA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 61/67] target/arm: Implement
 SVE Floating Point Unary Operations - Unpredicated Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IAg/4t+0mBD+

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  8 ++++++++
>  target/arm/translate-sve.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  target/arm/vec_helper.c    | 20 ++++++++++++++++++++
>  target/arm/sve.decode      |  5 +++++
>  4 files changed, 76 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
