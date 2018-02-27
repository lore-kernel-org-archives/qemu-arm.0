Received: by 10.28.71.27 with SMTP id u27csp4960334wma;
        Tue, 27 Feb 2018 07:42:26 -0800 (PST)
X-Google-Smtp-Source: AG47ELvwycgafFmB9PCBvshWbHtI9o4sPaYIyJTcj4gw0MyjEM7wK8jK13f508hrT90Pd1SZfsOT
X-Received: by 10.129.93.137 with SMTP id r131mr9726951ywb.56.1519746146572;
        Tue, 27 Feb 2018 07:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519746146; cv=none;
        d=google.com; s=arc-20160816;
        b=oJhUvLaA1c6wtsepxARlN6aEnwpI89b3pweFe36Zxbm6tkmFjHZj5Pb5V3F2GykoGv
         zqBVEm/OEpZJFzRdrj4f9AyPe3HBaUeqPxE9p4ay8xkkFCJQUKYKNyOOkETx8nN8ZbNQ
         33qH1X09F5Puq+f7mjkoC9BlfC0riK/AMMC9fnD8QPzg0tYWxluRP7UOL+sVn0hgUGQQ
         Ol0HaHH77bVxx258U4g0zzfMuXTI96CuIFEW9+muvNJaClqmS4JJpDwehbZUWZVcrBuE
         il5i/pLVAQEgs2wTOuE4yltysfIG2VYBfbJdHlycKT9GQVIQSwQt7C+qJW7vSbIADMoD
         2W5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=12zSnhZhpPr+eOgM91GC420aVUcKLrWaKa3bbXWk6i8=;
        b=KEaD90UQGcX73t5zJ80AJbBmUQrutS07eGrtunU7L8yGlDk2xn0xBfmjudnIDaKQij
         yA523hU/P5JVMQsepNDUuXadyOX48gxEVB0Fz5NMj8C+kgjaTIyuPUAROhOWREvBf9rs
         C7ARwmGnWMgcMQWi3qfhIbAdRyo9dWjNN+bClGK2uoHjJTd2XPhC0qgtTT0dpvlJJ7eJ
         n1UpH8jOpTA6yCSYqgTvEZxoxe0FIi4iZFZtbMPwFqCoJOgzG5EgjJQbsYZ3nRq4vB5S
         g4TiIllqDPLqAFXe4zbxC/ZcUqckZS0g+wv8+4j7C7+FBZYK58qhCcxsyjQI5kgxxEGU
         fnPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j+DyBoVx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si1944550ywb.439.2018.02.27.07.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j+DyBoVx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhOc-0000Vd-3E
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:42:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhNW-0008Ut-LL
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:41:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhNV-0004YC-R3
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:41:18 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:46004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhNV-0004Wy-Ln
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:41:17 -0500
Received: by mail-oi0-x241.google.com with SMTP id j79so13162382oib.12
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=12zSnhZhpPr+eOgM91GC420aVUcKLrWaKa3bbXWk6i8=;
	b=j+DyBoVxP/znnINSVja+uOGNcM/0scfPU0aIxoIQyu2muKPatRyTTjSdhEXfPFSZiL
	Oyt6XmIXI3yhBhQhHSvOB06lfSoNxlQ4w5ttEb3vr9e6Cr5czEyeywNBEsyER/Y4VSAb
	MkM+94EMF/FVV+uC6QzkS5DWrCRlmvozSJNPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=12zSnhZhpPr+eOgM91GC420aVUcKLrWaKa3bbXWk6i8=;
	b=lPm7Z8QbJGP2G3tjMcF9mur4629J0fGu0xLjdIgZzqnzWopUi6oKxpvkJemNJ/cnZv
	0t/KJzwuKDDh3MEonWql1J5JT6AbdM1cPPJ5k3DmruXcbnBIGO4AkjX7Fj0MecHtHvGs
	HlobG46gHdChXEwTSvxDfDY84dvu3Kp+yLZGC0IKtzW/znumvUt6nJHRNcG24aXHNby2
	ccqEmZvZh5vzk+DrBo23SE8Kt+mKNrnALqJMnRw517bDg84Lajjf15d0IKilQoVrJE5n
	6biWVvKhNw8NQ/VH0QLSTl5NVRLmS4hs+XKcRcgRBTepBYzwK+61sZMcB3dXWgit9XhT
	JA1A==
X-Gm-Message-State: APf1xPAcPzEcFCTjU3DEWCUP68m0ZNMedmImGWFwJRdb24vKpR3mUkCy
	yzbAu/wyRRnQrCwMM8mt1GW4/PrKE7MN3pOjgQqqztoI
X-Received: by 10.202.17.13 with SMTP id 13mr8792752oir.164.1519746076999;
	Tue, 27 Feb 2018 07:41:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:40:56 -0800 (PST)
In-Reply-To: <20180217182323.25885-68-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:40:56 +0000
Message-ID: <CAFEAcA812FD=kx3FjFxcF-bM_QEdM0bgo_xmjA8qitgm59aYwQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v2 67/67] target/arm: Implement SVE
 floating-point unary operations
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: saj6FPsGNb/I

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 ++++++++++++++
>  target/arm/sve_helper.c    |  8 ++++++++
>  target/arm/translate-sve.c | 28 ++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  4 ++++
>  4 files changed, 54 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
