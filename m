Received: by 10.28.71.27 with SMTP id u27csp4841030wma;
        Tue, 27 Feb 2018 05:48:28 -0800 (PST)
X-Google-Smtp-Source: AH8x2267aBNV6H6Eu0rn8gyrG3K273ycSyX8/0uA9lHYGRQz/cF73rEROzq8k95ve7wrHBT/8ZyT
X-Received: by 10.13.213.75 with SMTP id x72mr9131010ywd.157.1519739308046;
        Tue, 27 Feb 2018 05:48:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519739308; cv=none;
        d=google.com; s=arc-20160816;
        b=RuXgVyy3sGjOdT4O4c7auMRFoEKjUIZaNBFCRfMD7omFwDuAErd2dgqztmDtdkdIA/
         sCcHYX3Yfa/9adk2iI2pxEsyIJyyqAOhWVjVolhnlZjsiVHd4FrpVMWPAxnM1REEUywT
         nKIoqcDvFWwgXK0HABK/8VtuqWg5HSGQ9neVA9wX2MqTw1MSdBQ7xZ6gP97eQfRDawtB
         CWa3BElVq7AniwTT6LU2OsH8M6pPOzluAsdBb7Nbpz36XW2yWUlVxJRSKUCA9ZTGEyFX
         wM1OSMa5wX6IKU4xl3OGgroZqLa/vq9fn49cMf3fcMw5qaNQbck6uO/HLxXx80WALjnQ
         1+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mle7HKzENTdzTpJUIt/1pciVuQ0rHaCZHd73J/guCzk=;
        b=gvPpMjT/fS90BO3zr52Lq1tX7COz6jY1s3cVmlyqYgzEQ7HI4WkK3Gjv4qFzXg6hgn
         C5+FGrO9z+upJuC8Fro01Cw3G43NX8z9IgugqSH9Ktl8AEGEkEeTKdQ93k5BFGWD5yUg
         nSd4MwE9fOcoupAbaaVlWvEcikGl9TNkTkItkBW2BMVhvIg1cHPczLSSD5PQ0869BaeY
         3V7DegSw+T+QGDKgsgpLbHZebtYTQZUNmvluw7S4e5SQuWMtR/6MaNPe4Np4S4+3YgUn
         SAjBuLCkCuVk9s5csHyYPDbAAOrZIMPhS+giIfBLxH/WfutLD+JBWFeaKdvFAPxlFRlX
         jjig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrBAUbZO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si1465749ywa.373.2018.02.27.05.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:48:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrBAUbZO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfcJ-0002En-AQ
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:48:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfc2-0002CH-Kh
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:48:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfc1-0003bj-UW
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:48:10 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:38068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqfc1-0003bR-Q1
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:48:09 -0500
Received: by mail-oi0-x243.google.com with SMTP id 123so10436215oig.5
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 05:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mle7HKzENTdzTpJUIt/1pciVuQ0rHaCZHd73J/guCzk=;
	b=WrBAUbZOeI1qwRoUjl9Qn996+Akq5KlDXwmtiaZQDKyl5camuFok22l0RA0su5K52A
	Uql763T2UU8vwHO9vq+pAuIoGZvGsOYf0leLdpdRDdDe6/6GbYSlE1uh9/7bG9z7xuCe
	bACBzezyrh9cw1OKKvJmHXrBySWbeZ5VsEGGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mle7HKzENTdzTpJUIt/1pciVuQ0rHaCZHd73J/guCzk=;
	b=TByIh2qNZHZuAudHeBF4rsQfIW0+LstPq0D9kYaQTsSBb3qVsOdUqQ3G2v2xZOB/0v
	LHx6oKHgeEJHTB7vCQ202To37VQMRG1/w8iO1vWWKHj4zdf50TkuKw2yGOfTGb7wvpnN
	EZSnG6cPOLXY+Rl+W+kIbOncMB9pWJ24a+SmiC+v4ZIax3KrWRuu4gaHNGNzc3M4qw3z
	pElck2FOXJsRdS8X1FSPE/YFocnchkCrSZhe59QUVHciGxNVpay5acDj8zy+7UXpQkwp
	lkn4d2Xv71U45Lg4INalzEg8XVDDOHT/YFIZvNHSH4PR9RdqVrS4TnZnS5q43ck0sz3L
	8xVw==
X-Gm-Message-State: APf1xPCRIUT15UFZ0mU1Ibm53iqd70Md5Lci/wJhe7ulOaY53nywayH/
	j55/prU014kvHvh4b8E2PlRQdRXAuULKjfOai8/khg==
X-Received: by 10.202.97.87 with SMTP id v84mr3556139oib.12.1519739288886;
	Tue, 27 Feb 2018 05:48:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:47:48 -0800 (PST)
In-Reply-To: <20180217182323.25885-48-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:47:48 +0000
Message-ID: <CAFEAcA9rJ8arjd_TxAp+dJBZPzDS0ajJtG1QapsbP+YNmibL8Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 47/67] target/arm: Implement
 SVE integer convert to floating-point
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
X-TUID: gmSUsU08CuRI

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 30 +++++++++++++++
>  target/arm/sve_helper.c    | 52 ++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 22 +++++++++++
>  4 files changed, 196 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
