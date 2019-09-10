Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5719266wrp;
        Tue, 10 Sep 2019 10:00:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymlQvrQlrv8jF2jMc4J02nXDiRPS7gKDdOE6Lb3+lgAO1N8USNJnTsDqvqXwmvSKWDa/hj
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr30575685qki.125.1568134840891;
        Tue, 10 Sep 2019 10:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568134840; cv=none;
        d=google.com; s=arc-20160816;
        b=fP/DrubLvrFlZQeEBxB7Z/JJOjCQ96/WJlRM9WmI1fsj/n1qrEyluaq6LN7CoeOcr3
         lZN/+FpnSjkWqAnwU4I3HmQ2shYbwtPy2n/ji9ABlZlpgA8TUA7Y6Za4LwWgtxoEmKUp
         +uWNWzgpb4qSFWIEX3w0rK0oFzANxIB9OX3qh1jAj+v71eI2L4cXhAWYbQLJVGnNbUWk
         LG64UNwjtJefcnGlsqy7Z61WO58MFyynpqLvEp/A/hpmyOGXStStaumb4xSyFd9Io9xd
         FWOA1P/LMRlXFlHPUfJr4VW8tzxdIrwCYzfe+QSmD3m/KU9iy0dfHIP/x72WXMVvwUys
         kNpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9NxTTZIkf4Ry49sqeWCLjcClirLTjRg9oXv+toI+LLs=;
        b=AF/Y+6xOjigeXxIE03PGFZKzVZHKizcetJdlXGRDBuDqEcCSEONt9K+EwmukaL3Z6V
         W2GvQTQyJ4WDsPVSgryFBtg2ew5o7LACszIZNWx8c4QHodgHlnqG90nZOUjc1I2hfm/b
         L1u98bZ7mG3j6fihYdpoNdP6IW27vCbIi7awIfpZ1dQyJDzPRMovX54flPHF7qZnMag6
         UFzlNSYqU6wXC5Y0J7Pi8bC5q1M1PYP9L1wGn/4366i6Zjj1kpUnY50AtGNdR3BUuRml
         /CDSb2p+ZA5mJ38fICi328gS7GYEQrhdq4G/+xYif/9KEvao/yzzTSkcXeON3/e6IDQ1
         rcpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4JMZtYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si14347395qkh.188.2019.09.10.10.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 10:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4JMZtYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7jVP-0004uw-Oe
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 13:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7jVB-0004sN-KL
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 13:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7jVA-0004rm-DI
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 13:00:25 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41391)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7jVA-0004r6-69
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 13:00:24 -0400
Received: by mail-ot1-x344.google.com with SMTP id g16so4486054otp.8
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9NxTTZIkf4Ry49sqeWCLjcClirLTjRg9oXv+toI+LLs=;
 b=I4JMZtYIGysbWGYZnD5H9cJRdYh89C5d3ZiKzgw0e9egFam+P7crAT01g998Fudf/B
 sfTy8jIu/+L45dw8vFz2mV7xjC4ECMYVqeX/guPMXphLEs3YjliGIcKyp5sCEJ731J6w
 RHvsAyRvMphpRwJp9awGJhQzhyHL/qCkdGnWgEbS83nwKcim+n327myVbdtlljlF/LrQ
 uCcrcOBa3XpxuSLqKuxvnWKS9AT1fQsddxp2FrF1P84OGQQ8wiFRHsK2M/fB/a34ROn1
 dTAyL0uEtnU/mpenWoAtA5gPo7zFRmdC1VG/BXQTL03+ttlX8jreGmdFoINVa4CjbfXv
 u9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9NxTTZIkf4Ry49sqeWCLjcClirLTjRg9oXv+toI+LLs=;
 b=pFE4Cfx+qdG35COHdifNu16EI+VHG5gxOOh8cTmM7z2hxse7jlFkvGBh+qdS7Pb1lj
 izQpsIGmxcZ7Hg02e//YdSFwR7r8vMPgjJZjViuK24EIQ+9dsQsMghEVCpm1dOuFJyj/
 ai6BD3n0WKdOgWxxC8rodUcsv75gPcZZZGeHYtaS6kltewp+ZyTpOKi92wwViGAXoz7A
 hOspMmMy1K2sona1MreZoIQ3PvoVnoSuORcknSrESWp7iJ12K4/1r08zO7BPERCRkb/y
 0xrWqfp11n+hsLDXHWMBXq9v5dCQAaM+HIN24fSVLfUHDHOnUXmtgswAPvvniM/iJgOf
 MQ2Q==
X-Gm-Message-State: APjAAAVaYZH7G9n4Cr4thLzB4CcjZlHzLhLrsf0Iglk9yxU8B9znGW2b
 LeNVJNI76qkhR/xFYbB3W9lghj8SIil4WATCoLO0uB4W4tU=
X-Received: by 2002:a9d:68d6:: with SMTP id i22mr18309424oto.232.1568134823212; 
 Tue, 10 Sep 2019 10:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-12-peter.maydell@linaro.org>
In-Reply-To: <20190910144428.32597-12-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2019 18:00:12 +0100
Message-ID: <CAFEAcA_iYWMvJF2wy5P7_ddT95kuq9xWVFWcWpCMx6qAZihvig@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 11/13] target/arm/arm-semi: Implement support
 for semihosting feature detection
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqJ994VUsuLV

On Tue, 10 Sep 2019 at 15:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Version 2.0 of the semihosting specification added support for
> allowing a guest to detect whether the implementation supported
> particular features. This works by the guest opening a magic
> file ":semihosting-features", which contains a fixed set of
> data with some magic numbers followed by a sequence of bytes
> with feature flags. The file is expected to behave sensibly
> for the various semihosting calls which operate on files
> (SYS_FLEN, SYS_SEEK, etc).

> @@ -586,6 +679,18 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              unlock_user(s, arg0, 0);
>              return guestfd;
>          }
> +        if (strcmp(s, ":semihosting-features") == 0) {
> +            unlock_user(s, arg0, 0);
> +            /* We must fail opens for modes other than 0 ('r') or 1 ('rb') */
> +            if (arg1 != 0 && arg1 != 1) {
> +                dealloc_guestfd(guestfd);
> +                errno = EINVAL;

The spec doesn't mandate any particular errno here, but
EACCES would probably be better, since that's the usual error
for trying to open a read-only file for writing.

thanks
-- PMM
