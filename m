Received: by 10.28.71.27 with SMTP id u27csp4949698wma;
        Tue, 27 Feb 2018 07:31:42 -0800 (PST)
X-Google-Smtp-Source: AH8x227DOH+QAC683gMAcE/nOHVpppuA/uPVpzFTih0x8zjg1j1K5q5NJ/gsOpDBOxiN7vIBDjtH
X-Received: by 10.13.227.194 with SMTP id m185mr9491290ywe.105.1519745502213;
        Tue, 27 Feb 2018 07:31:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745502; cv=none;
        d=google.com; s=arc-20160816;
        b=zowRNvaLhg8FXvdPawYWLP0IaixVEKDoK5jgTrGulyNH9N+MN8SCxyyd55n9thzGW0
         cRh2uSXVTJIwgIf/LAEeeLbCcezSKi0vgYftcjF2j65wWjDwqjTAzOThQDebCaA8tx+t
         Uv/C9e45exf99Rj518CRnToZ0xyDFrX0wsgXwO+YneoSftp+gv4DUvHnzZLlyt4KTHXs
         GyQSAX54CO6Vf0NrzDCUia0sSIqrdyvGW0EueQwNeSKWqqyL4KY9Xa3OkG3/e/3nwups
         ZbyE0Fy3UFtEEe4oBnaZLnxFMX8YNuFQ8E7Ep78HEFtMZcygyOAejk7tMhCUtHtTodVW
         eX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SFsSRM1FoJwdZG0Kd+Bg+eKYU+t1wS0sTd8W80KONaQ=;
        b=N85m/Zz1ucB1mGQRvfZ/zYVNa276HL7AwU6/aWvt0eB6NXxEwh/BwaXG/L9TZfNIGr
         4duuvlyMlcPKLbuwbzSTIHCJ7DJaunRgtsBL5aCG9RCeNA/FdkYdi9fq0nWsnSgU1hDK
         xKH2uJEgWkETB+veRKXTJVCWNP0DQRbvLuou85tUrLQy/jEppll90K5LpvhjuzwKx9+r
         UwLdrWnqIct0IZg39nhYHHfEcBAC7au4qtCoAWRz+7ZbcKzCrQMRlWwQ8szPyiiY1aqh
         tpVv+U84JPidkZhEjvOR6UvTgcGOiN6D3+pnCReqNARe9kBrkkXSewPpScv7fj86r2et
         8aRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DtYg7Ap8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m131si1937415ywc.621.2018.02.27.07.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DtYg7Ap8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhED-0001HC-Kx
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:31:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhDy-0001FL-Mf
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:31:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhDx-0006DI-TA
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:31:26 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:46531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhDx-0006Cw-OM
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:31:25 -0500
Received: by mail-ot0-x22f.google.com with SMTP id g97so4099233otg.13
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SFsSRM1FoJwdZG0Kd+Bg+eKYU+t1wS0sTd8W80KONaQ=;
	b=DtYg7Ap85fYv6bkuTBUOveRaHUG2ILpsXZdmxQopJtH66y1PMGoLEprZFiP7yPBjlW
	dXTNVyjYDOCWN+EpjWESABxKhEX0JczycaKmKEWT01d60UeRVFQZY4tmUQx6VDdkk8nM
	aOyJRogr+nLOhTU2Pk1mWcnUtBZS7GLOjd43I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SFsSRM1FoJwdZG0Kd+Bg+eKYU+t1wS0sTd8W80KONaQ=;
	b=gr6ItWmfSSIgx9S3YoKIxTosGOd3JSnz14ydEEfUlVMG5qzVcIbR+9nWpIZWn7eFC/
	mdTJ6GmzZJ+zI9Z/o+nBrN2/0V/raqlmN8blFz7qCNSEzFsj/Ujmv3S2XWkKBFDtVBr6
	8LJMNAb5Ts/d/p5uv7x0yjurVM6GBbjtSx5htHWCjlYqNmlT0Cwx1EVXiGUgNBZwSjxz
	cPBqd50e/vc6C+KYh8NMlSw6JjwZVeUKAM+taxJEMigdh71MIbwKEs59Xl2K+3ufyuWW
	B3EQq/Wmr8r3UhzdiDm/t9jIG4lxI9E1UGHYNPIIjCe/2/TKtojSToO1T59+RJir8QEr
	b4GA==
X-Gm-Message-State: APf1xPAUNhlbLq3+iyeHPy3vTFHYNfn/DOds9wUZ/MJTRRWq1jEdpM8S
	lrDPLZ41YGp3FW31vHLebIe/IYCcvN30f1eVtmaqNg==
X-Received: by 10.157.23.34 with SMTP id i34mr11254244ota.210.1519745484932;
	Tue, 27 Feb 2018 07:31:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:31:04 -0800 (PST)
In-Reply-To: <20180217182323.25885-63-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-63-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:31:04 +0000
Message-ID: <CAFEAcA-KWSNgAtZvxrfdJ5YMv4og2bmj2p3sFKAaHhdmFD66tA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 62/67] target/arm: Implement
 SVE FP Compare with Zero Group
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
X-TUID: Hq3F8sFMFxKR

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 42 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 10 ++++++++++
>  4 files changed, 138 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
