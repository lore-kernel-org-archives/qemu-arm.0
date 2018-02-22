Received: by 10.28.71.27 with SMTP id u27csp2248677wma;
        Thu, 22 Feb 2018 10:01:07 -0800 (PST)
X-Google-Smtp-Source: AH8x225O3ZdfMZmEbBn8EGmQ8YFvfMAOrGNOQTHap+dKomUboWEA4LXSQ2WxRyHzHV9VJZOvfwFC
X-Received: by 2002:a25:bb91:: with SMTP id y17-v6mr1296321ybg.17.1519322467762;
        Thu, 22 Feb 2018 10:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519322467; cv=none;
        d=google.com; s=arc-20160816;
        b=BOyUQRfq6KcLj/8OZzsFxQyuqTVKCku1wHmKkDcxQkduWgAAIFFGCgOdbkjTTN1Mb8
         XZYQvX6Bh9wM9LuUoNM+wJbHdRj7DayYwFse6m52cf5c7zKIXOgWJuCon5MdOsqqb7jk
         A0c+uNmCuTOnHmBqN14rwmSNe1WO7M6aDbATWaVWF81/UnE2VAFbGjsx/ggDeVjR+Yd6
         gBgvlY2Htdddhq029cO2sfKTUZfcHmTnZCG+cjKzuZdSc2GfIwRGcLEterqaMMeteRS1
         NABAsd7XC9Qbq5gVixFOq+mY6P238zPCzfFkYAWFdaE735TBam6VUCPDVcSAN9bgbTAE
         mwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+wKFH2twK4a235wdnyZEfuUa59xcR0210ouVNXtLCpM=;
        b=cRa49ihl9wJipnUqewh1//oSnD48m0wlJgRtS4kioky8TIu5qCi0/vkoi0STF/ELH6
         KS5PCuZL1Xv8qW2ol28V/S2y/N8r/m4fEbwaQYXXuNDuDZX2ksacuww3nFy71xMptKAI
         1uWIGiLKM5Z3phg3Bv/mUa0Lw3ge5lPYdofVIIHNByJzZWF68eudjFqHEO1spxQDW+Rz
         oVCeKffxLlXATL9jlaVdJrIC22qSCtivuwEI7K1eTFtfpuGZ44Bq0krCQEpKgp3PtOOq
         n1C8xuN3qF7qG7HjdAxo+k4aAlGF2agNMi2u116v9ZYoPEbkcz406BYWB3TtjnIMmFJv
         zU3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cKynijL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b38-v6si92391ybj.309.2018.02.22.10.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 10:01:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cKynijL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eovB5-0006IU-8g
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 13:01:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovAw-0006Ga-Jk
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovAv-0000WQ-Na
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:00:58 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:38134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eovAv-0000W6-JK
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:00:57 -0500
Received: by mail-oi0-x243.google.com with SMTP id 123so1898396oig.5
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 10:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+wKFH2twK4a235wdnyZEfuUa59xcR0210ouVNXtLCpM=;
	b=cKynijL9/O7QGQinQ2HzG4gzAwU2cx1mMdfndp0HPvy3qcKz7Oc+B4f9w/g5YfpOeI
	BXbVOKMpSP912ZVJsnFuPDCmqn3Fo6s/yotOdF1bngJ3QAUU34bRbraNZyBrs68p3shT
	sv2ljEpb/QM5F0okoMjYkAldvHUY1yRLEReCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+wKFH2twK4a235wdnyZEfuUa59xcR0210ouVNXtLCpM=;
	b=Hbe1lgjxFSsoKrlb3E/lqND++jjaoYkT18KxmHo7pyTPE0t4ImijJuwba75+RzrcDB
	k5NXUtaBERRPuzTyORdfA8E9eAu+NJQ2dw7e72Nyo8EyJa17t7bmjv29q0YSca/VgCVr
	l7TCeSZwQde7e20jbbW8qthuxZTkqj0kLCZBZYzvoee7o96XmiHsfzycOZONntXjR7lZ
	Uq5WaQQ2szG83QxishzPVg6xE/oc1iALBRalh7I0HHWZZZMHS0fCK1xcSP9yRyefcWcG
	XWLAmpaoN0bu5AW0TtwxuScLpKuN9vvkcVYbwRFaQi1zs7/2nMZlZt9zFssx2eRvqHJk
	DVfQ==
X-Gm-Message-State: APf1xPCsxUGf2OWk81mRcSJlrTuzTUhRY2DHj4k+2DaF5aCQvkbzmv6X
	a/KoicgY8JKadJ8cT8mEQIx/wM0QAolnYeSRzT6jCA==
X-Received: by 10.202.191.196 with SMTP id p187mr5317675oif.12.1519322456200; 
	Thu, 22 Feb 2018 10:00:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 10:00:35 -0800 (PST)
In-Reply-To: <20180217182323.25885-4-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 18:00:35 +0000
Message-ID: <CAFEAcA8oBn4xKJfuiznvz0rXdFo=2yR5eZnLR2HE01t4mKXHfw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v2 03/67] target/arm: Add SVE decode skeleton
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
X-TUID: R21K5hs/qF2a

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Including only 4, as-yet unimplemented, instruction patterns
> so that the whole thing compiles.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 11 +++++++-
>  target/arm/translate-sve.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
>  .gitignore                 |  1 +
>  target/arm/Makefile.objs   | 10 ++++++++
>  target/arm/sve.decode      | 45 +++++++++++++++++++++++++++++++++
>  5 files changed, 129 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/translate-sve.c
>  create mode 100644 target/arm/sve.decode

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
