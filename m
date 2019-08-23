Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp523819wrs;
        Fri, 23 Aug 2019 05:43:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyp6nzh+f2y33tfyY3Fx4RGcc85uH+G2ATJfttXXcPXTave21yQT8kBD7BzrOClJOUIMM6O
X-Received: by 2002:a37:c49:: with SMTP id 70mr3751585qkm.429.1566564215624;
        Fri, 23 Aug 2019 05:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566564215; cv=none;
        d=google.com; s=arc-20160816;
        b=QLvIZoewTYG+nZxX+ZMDbQdTxRI0SGqf6XD3ST8p0R/iNMBjKCUF1q1bus7WgT+Ifv
         8iw0n/9Kw9Wb84XT5plOPN/DoyQuDCaCYVr29NFKmE5y2l6flRLIsSlGY2Bia2CdwNd7
         GCFeNWc12wd4zhHxjVrMGvlsMLfkpQcUBMwfET1p8nduud4v4gtXC410tuc7dCjMGr8f
         3vBikO1VcAIhv7w+8/WW5ZBw1ERTI5lxzxCZkz/s96W+tuvbCOCXBqy6/aEK7hHy/7rE
         X/ly0IyK+4A59yoiPjyY42nrLezG4cN7buZJ2vlRBRDJsPOeETOLOmlAK9tl+hJkzzCl
         w5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=42EKvDIWkWoed2EM/Y3x4rwe8lyvrb42SbWTSMlOlDA=;
        b=NcYrwMqbo5bMyeXN/Gp2JxUwot5ytCqNMxUCZjgJ/ByYD6jJgSZZtTg6ixXEIP7yzs
         0mj/dGoyf2ExEOiBn6u60ctqXvL/ykepVeS4gQIlD/6qs4vushuRskJNsrEfFNYEu2M0
         83AU6pWPrEiPeYs4Jzv5pnzfuOoMcTP+Cplh81OKVWXlZK2qJJPPaKQakdFdVGSBD11O
         s3M5WkT7RADl4vNTQPQyibUWfkEEZG78ueRB/BJcjwMRxuFM3FD6HuaKh83lDcoGHqSM
         q+YGoeNJnBoL1D8/C1ODjgLk3irDKoEftP46TwIEaKiFOJIboHO5frS9H0ACvqGwCXE/
         bYOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gaSTU1iL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g37si1907697qvg.162.2019.08.23.05.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gaSTU1iL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18uk-000683-IM
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18c4-00035I-Ha
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:24:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18c2-0004sN-Ba
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:24:16 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33983)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18c0-0004r7-DC
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:24:12 -0400
Received: by mail-ot1-x344.google.com with SMTP id c7so8592884otp.1
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42EKvDIWkWoed2EM/Y3x4rwe8lyvrb42SbWTSMlOlDA=;
 b=gaSTU1iLA3pUkXzNZgaDRqbc8RwKG28YzhW+uGmfcwiFL8cxwezdF0IjiTCF3miIJa
 VUNYwPzBXeVgT+gc4CJ6Dmn+6hINLKXckfSdcZH8qrrHm8KOLgIjpx+PlpnS3EYb61fI
 QNy2a7kPU4Ev+3GVvjMJLcnV763Lb2vnJaXPXMBNY79en0UVWVJC5hwk9dH438q0Bf0i
 ZpId29xTDOwT8JtZvCKYpqm0vptWBuiroQfb/snice1e08i/FGOrJyWsc31gD9aOCqNe
 Cr04JD31IVsoA1eRFL23eOoAmzmwZ7Yh2z0YwptRmHMiwBNyWqykqmUnuEAmnw+h37Kc
 Jmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42EKvDIWkWoed2EM/Y3x4rwe8lyvrb42SbWTSMlOlDA=;
 b=mMFPq5jsccfKziQYINoUFBYK8ccXSmXgfSs7xw3ij3e3XfTFi3SPzC/8u4zOBBNtcp
 B1jZdVytR2LOdGwbCls/JHgM/dVGrzpJ0ui6E64hPdA3D53J7w0cKuAXOltK8bJ/oBGD
 X33m6GEBfclGqqsKNap+TUP25xquoc1F+zj/tSO7MFSa6Wvw/dSxl3PppnTrwkoyDDmC
 cMmEdg2tcHL86bSEjdnIICptQZo3agoBYZf5He0XVw0kWP4l1RMK8gXx58PzJMsPss13
 ina0K15quHcoS1VjkdEeRb94uIheyszO0tnrJTf1000/pGAYjM0TkZxr8ImDu3bo/vsJ
 Hs0g==
X-Gm-Message-State: APjAAAUFB49Ag4tIeObIYhSzBDfW+IKRRvvFt4VELCmYVW6GkqiLqCMf
 LmHCu9ZDGnqSGHkz7okS7uxPe5d6dCTzD89M4eN7IQ==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1046023otf.97.1566563050457; 
 Fri, 23 Aug 2019 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-15-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:23:59 +0100
Message-ID: <CAFEAcA9bWyYKF0LsfR9E+rG8v39ZP861v21DX8do6eyby2+JOA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 14/68] target/arm: Convert Cyclic
 Redundancy Check
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9VEnKaGcI7uu

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 121 +++++++++++++++++++----------------------
>  target/arm/a32.decode  |   9 +++
>  target/arm/t32.decode  |   7 +++
>  3 files changed, 72 insertions(+), 65 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
