Received: by 10.28.71.27 with SMTP id u27csp4958238wma;
        Tue, 27 Feb 2018 07:40:07 -0800 (PST)
X-Google-Smtp-Source: AH8x224yCP69JBQGRgkhBfJpqjedNNwFruwCVoS6b2C6pG1khlRy2XSMWmUPxuPfaZps96IRE6Fx
X-Received: by 10.129.166.129 with SMTP id d123mr9667060ywh.173.1519746007329;
        Tue, 27 Feb 2018 07:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519746007; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJqd54sbHa8auc2HL5+eBcSW7sM1dsPEZ8oBVvW8HyaqjPBOYKlCeh7T/oDEw3NH1j
         C3td5q4qK8AdiXURMymYif2kOSypbpnw7Aqmv4JA1aWQhGNw9nn3T/YIKl8tQb1HD72f
         jabflZ+ON4p2j9Or98kqYzWSHf2xMkL7OpdSdW4xBRA6XnaCu9FLpIWViamHWx8HVl52
         gn4QZ0acyUEWi91ko1Xjk7+KF+ayKJ6+YAbYMusf9VqpZtHIyZNVYT5/6aotd+6o6hdo
         wldfAdDBSXREJkQTGROjbUEcuzF/fgpGRE1uQqysFRjKij0SkqC7fYQpfBwCvDQ/B4N/
         AuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Tg608S0A67Y4SQLkRNuFJDdzFHxqK7Cd4bK3c7WI/0g=;
        b=AksAj1ud/hJczWW7nphfxwZaJwi3YwRVrzq6EfDYN2XnUt0tXX3D4vNvhRj4neiTOd
         W7upQHc7CVaeZsXFp6swSlHagdct0w32PpL64Jxi1aLm+6V8Uk97qRnN13LELrKcv0CR
         pD2rb7rLfmbzAn+A/o1jObCwe1PuNNfo/GP7/CbYaIRKFk4y6lCGelmiolgfg6XoKUQR
         xtTQMABURp83DpPC1rvAo/1q3MBFvAw55e2TUA7OOiE3MlQkFkRLmD7aRzuU9dOc2wME
         3qDZRN6RQqAismzXGLBTRdDaJEAXpAExNtBfeNOCYo2HOHxOQ8mt//ibpl00MWX8LjmK
         +tBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C8F92Zyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v204si1471568ywb.693.2018.02.27.07.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:40:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C8F92Zyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhMM-0007Q9-OR
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:40:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhM8-0007Oo-0B
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:39:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhM3-0003AK-IF
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:39:52 -0500
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:47006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhM3-00039n-Cn
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:39:47 -0500
Received: by mail-oi0-x22a.google.com with SMTP id x12so13155879oie.13
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tg608S0A67Y4SQLkRNuFJDdzFHxqK7Cd4bK3c7WI/0g=;
	b=C8F92ZyptnDQ7XXT3UfBf2LeufthgeJK4StJ4crfnNv1JMesYHs7wyVU/Mxf51NWzS
	B5vs34ckkT862s49OHU/ddjsSEUgUqKXZ7wfTj7Mv1CNir4h/b+RRL7vUh1bDDsXONiP
	BD3/dXmn7r4ytJANLzwRqQID4inBNoXXs1EAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tg608S0A67Y4SQLkRNuFJDdzFHxqK7Cd4bK3c7WI/0g=;
	b=VdRDIIMoTNTPH6cv/A/sOroMSN4vTpGBeuE4VCZwJyQgsXHYKOHt4hhuzqqCQDtxo/
	UW3Vtwqqg0e3vkSI+znSjE0Fi36Tas8U5YauBAMeEL/jnB9eptWKnhva0uOr9wkr2/ap
	tO2adPl4YBHrYGxWscPYNKbcO3obPdli7k12NhEhIRrbaOB+Q/Pad799VWVP2sZwm8+S
	QsHpC60JqoaX02ENaDmRIdrRc0nwimEMcGMU+MUFoWE7dqC7iMJ/wL+/Hbg+p1JawLhx
	7km1+2w/M3bDIaF9yUquVocEJs9VXbYXSmr26dGSM1exnbgw1yy3Q2GN9dj6B1SsuFx4
	hU5g==
X-Gm-Message-State: APf1xPAwyNIG2ybe5Pir47YjDpKe8s3LBjRNWbACjCPKlmGIZsQFxtue
	kB1BWQ70WNIsetIvPIo1nE+AVV98kpvhlrps/uMm0A==
X-Received: by 10.202.68.213 with SMTP id r204mr9683789oia.80.1519745986733;
	Tue, 27 Feb 2018 07:39:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:39:26 -0800 (PST)
In-Reply-To: <20180217182323.25885-67-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:39:26 +0000
Message-ID: <CAFEAcA-NLtqSyKLGwyD_JqKGCNz9mZYBbUzxUtHUYsszc+qAfg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
Subject: Re: [Qemu-arm] [PATCH v2 66/67] target/arm: Implement SVE
 floating-point round to integral value
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
X-TUID: E/MQvDo8/Dhc

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 ++++++++
>  target/arm/sve_helper.c    |  8 +++++
>  target/arm/translate-sve.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  9 ++++++
>  4 files changed, 111 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
