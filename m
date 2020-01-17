Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10168156lff;
        Fri, 17 Jan 2020 10:36:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHNSz9FZEZemjp7rER02fbXGgK8ZmLPmV0iCYk9NmB/Tj3siaItXo3gQQpBkNTasxWajQQ
X-Received: by 2002:a05:6402:1acf:: with SMTP id ba15mr5166821edb.279.1579286212105;
        Fri, 17 Jan 2020 10:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579286212; cv=none;
        d=google.com; s=arc-20160816;
        b=ocVbL9BySgUP0iKFdmauBSAvW2fipuyuTREU1cfkgRV+bue14W3iKWbLTmnyULUax0
         Xbz952+mNSNij+1KtkAE+F6YbM4mzfoPTnOL7Q0FMBdLDRmeRfpgUUSAw+9ydZ0NrB3t
         kX0BUtmFQe+Zr6AiKtbvd/V7IYH9JJ2PIbLYYRnQqwJbTz4v/0DpmM2NAPuhU2pxn25a
         i53I5MHjNdjzvoIEfgICg6vua0d6JalZm8VYuWf7wuj+/ZPRVuzUUWcEn5CjCZui1G5x
         SqDu2SbqM5+JTpFQrqHF2ze9qyfGmmxwLKMnJ0O8rccXjcxE+wWWzyB7T1oR1iDShIut
         cwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/F+uXSpXJTQnKmXw9qAp6TayRDJj1PO516WtDoWNn0=;
        b=YjzBjHkb5TS7F5BBTfkQy83WG9AyWbYwEUdxNTX25DNaKlzURje1hjxgA8qepuPWhz
         CR804T3r8JMuDam9guLYnS7m+xxEmD2PI4h1BI5akbxU8xxLQVyVJdZTR8eS3cEcuuKZ
         hZByXoYQT7+U208Okm4zrqdbUSFux1Om4A+I/AUb3AlQFLxZSn3AURsR4/iniN5ymhun
         d6n1yMOQ8wqahNWlNMWkS+1JgmA3U79ZMnyvDqCI2jXwUxajqYf9GK6zUStJBE8pvFlA
         CxoZ1TngtLi1WzXpnuazGIYvn1s+DFSmqSFfJGK+LHbxhR2Zil216ZdwG6V6zu0DYsmx
         O7eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iOzeS/mJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si17523747ejb.421.2020.01.17.10.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 10:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iOzeS/mJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isWUF-0002X3-3S
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 13:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isWTv-0002OQ-NM
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:36:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isWTu-0006WH-Pd
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:36:31 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isWTu-0006Vo-L9
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:36:30 -0500
Received: by mail-ot1-x343.google.com with SMTP id 59so23356382otp.12
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 10:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j/F+uXSpXJTQnKmXw9qAp6TayRDJj1PO516WtDoWNn0=;
 b=iOzeS/mJ2FZEbsjHJNcrdwIfOr5grHxmKnordN/hVMFNVSkIK2ztxo576tBK1sSB5w
 HH5qQ7yoqA3oKQS5jTcfSD64+39AZui5xmaStU9Rv/eiU7FGpvVc5CfPJEUKEeRvreug
 tt5ordui4t6x4XGrxtMuS0S9QX2W2AXGJwJx1S9GULsSwZ+EFLxtTHxeV67Lp9exkS9E
 KoRUIZc/s7HY9TlCirNvFVR3zPuPS/+tlwSGoC3audu0uRG9Kz+0CxZhsQZuemmWzuES
 mJaZanMkaiO/VsKkajR8MlFK7fyTVSUvDtxF9dmy4/ce8XqiDv7qVWN3aPN8d7esDtM3
 AGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j/F+uXSpXJTQnKmXw9qAp6TayRDJj1PO516WtDoWNn0=;
 b=SwVH5tW0/3vYk0M2JozLyrunhrN5mr/x14MjN2HiMlJiUXW8mCWfHM+ND/U9VKTJBt
 ytPvCHCZk0pGaPE0nwgSGY6pNfrI+7F77a76HvfOpttOq9dhzFz38JAjKHGHGnfuUVXv
 d+E+XiVtP4407WWFtHH8ESyq7R+2cZFW3XaGKaAg35scYRnUMaIWhtU7ky2qwk4LsHz9
 CkX/KyrIw1bDT0+dLlkVC3uhAo4FF/MB6AVg24mPwsgDFedCYDCZVPQAC1mKYdV94OCJ
 FlmTGcSrAX9zEIenuuHUJ1THFS7vbDDHxVG1KPISvRGIElsberMBM0vv866tHyaD9R5X
 7gig==
X-Gm-Message-State: APjAAAWJSou2UkQ9oJtv/MLJWFx1/ZX2BOAY8YTg1DQ44r7L018JTzMv
 4iYeOAU8h8WG+DpGt65Nwy+i6BSaEwV0GZOhWhk7qQ==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr7200236ota.232.1579286189978; 
 Fri, 17 Jan 2020 10:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-5-linux@roeck-us.net>
 <CAFEAcA81V46N8eqTtBo7YZE0kDaqVNz=iAjbqdv8m=GPRsaewg@mail.gmail.com>
 <20200117182129.GB13396@roeck-us.net>
In-Reply-To: <20200117182129.GB13396@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 18:36:19 +0000
Message-ID: <CAFEAcA-GRmu6nT9jQLWBMbXBu=ehSTVO=MX2xV_sDN4RxtrZCA@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/char/exynos4210_uart: Implement receive FIFO
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ewIpjhc+6cst

On Fri, 17 Jan 2020 at 18:21, Guenter Roeck <linux@roeck-us.net> wrote:
> Doesn't that mean that the .post_load function is missing even today,
> and that it should call exynos4210_uart_update_parameters() ?

Yes, it should, so that's an existing bug. (I think you'll only
notice an ill effect from that if you have wired the QEMU emulated
serial port through to a real host hardware serial port, though.)

thanks
-- PMM
