Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6814659wrg;
        Thu, 13 Jun 2019 06:28:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUrvrV2SQhZwHTZVt4hMBa+ebUL+m4b3z+v3NR6lRcTWLD0lfERqnSguTLZ1IJm/GnyUZ+
X-Received: by 2002:ac8:88d:: with SMTP id v13mr24626242qth.51.1560432511055;
        Thu, 13 Jun 2019 06:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560432511; cv=none;
        d=google.com; s=arc-20160816;
        b=Xl12LEONzHGw3Yt9Q+cVmv9GJ/Dxr0nW2D7+uImDeacUWC2DGNp9fxfg0q0u0I1lJd
         b8xOo70AVcAiPy88Wmgmt4SVYhDE/3zKfbhKbySFPdYpLKgMAL5DWJhQWleTYRvKdm68
         cYq6vKGa7qoyaldyO9apHyPjaGOJ+U4s8Lw6LrzzWIBPGEVmf8t1mZN92I+4/hrcOAKc
         brUVg0n2iMqqV9+aKOZXqI99KYWqQoiqN78mtm93oTzyOf5cctBPXEOR8Yn5/xl5UNw8
         km2Gt3rEoRJvdfjKk83/WB5qDGCmYIve55TQEpdrWT6EfqzF9/cIg02XMQh/lV4sZJCI
         bnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QowaRIAuGY3+PR3B8GIL90ovhdHy+qXs/DJNY7PkzVQ=;
        b=gSM/QOOxXy3cEGz58YLVLuM3LgAWVGcZSZIAdMzbGWYmFVWvkw9l8Gj6lYfu5If71c
         iCf5rIUzwXk+bhqrJxCWd004pzECpuYluvcAOLP0oPjt7EVVI5Tyu1UKqWKwn1+zFhuQ
         zfHACqqj2bK8Z0x7SuN30iDgDWyKm+dte0lvVrhyJZH+nuwBC3hjF65B9WU3My6Sckxk
         5vWmo2/mtiqPrCme4KauibaZV0MLvgwy5fo2fo/CG67GWP9PicAYZlM8XCba1iMx5QD5
         rp76//WcHMXYufOb4wKKZ/rAT43WLa5GTvT2c3aAdlTWwxc3vzx+wDzNsbNwS4rNTJRy
         MVJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zS2fOGT2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64si1689615qkc.66.2019.06.13.06.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 06:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zS2fOGT2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbPmI-0002jg-Jr
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39136)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbP3Q-00083d-N2
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbP3P-0000NH-DT
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:42:08 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39939)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbP3O-0000I8-7n
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:42:07 -0400
Received: by mail-ot1-x341.google.com with SMTP id x24so18773348otp.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=QowaRIAuGY3+PR3B8GIL90ovhdHy+qXs/DJNY7PkzVQ=;
 b=zS2fOGT2z1rWN9yi7UFd5s8rqHfb5hw1/kcfNUeOGBVDIeP5nWN/g+EulDt0VuYUFn
 FIMZ0hhkiqZT8g6TFndlFdN2oXl5K/hJN7eIAmQQ1LpQJsg6prp/mqmuHl8cXxTVx2Wx
 dSZFTYhChy4oj8A9JhI2V2LGoNxEawJN16LVnsF4dXXTqYZVMkLwm7ptCWVbXkfjb+9O
 wQfLGtY8JexY7AerrZ4XbMxlGe2E/macDS9qqFQuzhf6sOqfwsfFM3Ypzg5LE/OVihy5
 ET0+/JgEfxEJw46Fj/RixkxJfEJdfRTzUuzKMTBRi+7n+efiFRuVXn6Es929iFpCiUVC
 hGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=QowaRIAuGY3+PR3B8GIL90ovhdHy+qXs/DJNY7PkzVQ=;
 b=ddOpukV0+LOQw97t1T8KRuCKpIrmR9sUBuvSpfCpvcyxJ+9YpKVpGMDiZhGr1b0ZDy
 p0mNFP6Ma6FXgxqmU80XK7dV/lm3aldaJwi0rTfEgohq2J/g+Mg9ifKj9JLG8Pak6+jX
 uolivgvjnFuittBPM2FwRhcvjcrPr3+WMzrKfVgjh9soE8Lj0M3uefoiylUxcpu2dTf8
 w4+2pcupqTcHZV7qKk7FPHBJO1xK3w+YK+/wA34LgNZvn74DYToagD+uvVI7l+czvjOe
 pTOfrHj/T4muXSbKwtC8xk/I0zH1enMi5VRmYZViMZZSUNT3dwkxP0gRKzmKe8a5kxu6
 Qrnw==
X-Gm-Message-State: APjAAAWhnifUMCzYYf1a+b1CLOEDKf5cIsU5W86QV5w+zvSlhOZXw5Lx
 PWSc5ABdadSaJpEbg7wJNKskoXtfPnqqh3Zw2entgg==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr8382329otj.97.1560429721121; 
 Thu, 13 Jun 2019 05:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190606171046.2732-1-peter.maydell@linaro.org>
In-Reply-To: <20190606171046.2732-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 13:41:49 +0100
Message-ID: <CAFEAcA-pYzZpg40E2xrKR0yXC0iJV7Fh+ONb9JedqXXJZka_0g@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH RISU] arm.risu: Add patterns for
 VFP<->gpreg transfers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vnl5xyvJsJsS

On Thu, 6 Jun 2019 at 18:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Add instruction patterns to cover the "transfer between
> Arm core and extension register" spaces (A7.8 and A7.9
> in DDI0406C.c). We omit VMSR/VMRS because they might
> have side effects (for stores to special regs) or give
> results dependent on previous execution (for loads).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think these are the only VFP insns we were missing.
>

Now pushed to risu master.

-- PMM
