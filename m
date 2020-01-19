Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1752501lff;
        Sun, 19 Jan 2020 11:02:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUroQgqCF32l/sCqYAXDRq6QbMUzf8iQ2U+Ls/I2IbWO9pBrFWD3rxN2hEeG44dQajA1fs
X-Received: by 2002:a50:ed11:: with SMTP id j17mr13855460eds.38.1579460521218;
        Sun, 19 Jan 2020 11:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579460521; cv=none;
        d=google.com; s=arc-20160816;
        b=zQrXUK2tSVCYkIxjHUs5hKSD33+y92/ehTgmNkTftohkUFFXhUE8BfZthRJxNc9tGp
         227Xp2TvFqTFuOto1vMuk0JznaWzaqsPwKDyQoMurm3y2RN+mOzFs0Sjw1nDAKbGS0VT
         ScD3VgOsrtb5cpOp8vOcgAhwm3j3/MQYTfGSZUcOOSEszBxyOhw4Hu4PC59CmMu7u/iu
         BbcQp2LmK6e37qctuF6JIs4fQWw62N6x/YMfJ/mS0AQVdIOn6usnvNBS97IGilqQGauz
         k6MB0Hpomr2CG7uDYx3IKDfh6Zcua7q1ISeUasiL97eFB4MKjEOzAMToAnNWctNYIgS1
         wbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDi1N7Df12D76PLV6rwita/JJfO9QOIBjG3NPUf7ABU=;
        b=RdbvXTo+da+kPbiDX/kx9+pK8BvLgd9v4HnRKx0dyXjDFB6r6mB0xQ/oK/96F96J9M
         LJyqmaz/hsIkzuGFaXk9nya4NDRp23ewLQBieh6Ss4zvXXnmCGqqBLhqL0FJNqxs50v7
         fDZW1Qoce7zpaKqd3WxVBL066aw8VEFL6yfAZauHxCYMsWgbEK62qEtfYqkD/YTNazsQ
         rtNuhAI+Y78gFcJDBM1nsIhbg7XkbeFErnL3GyvAKSgAuMWIA7CLvuCAybcQvQn6tqgE
         DiV01kuquFUnR7zGUCIguq/pxZPqaRWudCy5KwMMZtAmiPOTGJiAU81sfC+Co1Q6jimq
         9OWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSJfac7p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dg3si21987717edb.61.2020.01.19.11.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jan 2020 11:02:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSJfac7p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itFpf-0000lv-Nq
	for alex.bennee@linaro.org; Sun, 19 Jan 2020 14:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itFpP-0000lL-30
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 14:01:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itFpN-0000kh-Uz
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 14:01:42 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itFpN-0000jS-Q8
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 14:01:41 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so26789409otc.8
 for <qemu-arm@nongnu.org>; Sun, 19 Jan 2020 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aDi1N7Df12D76PLV6rwita/JJfO9QOIBjG3NPUf7ABU=;
 b=oSJfac7pZwc1VOhHwbk9sKWYPvwS7PbAy7Um1A4jPHIX2W7q3x0lzqzj7/QIE1Zy5A
 vPpZ4+mfN+LLlNvmAQHmbHb1HTMhEkpZpkzpmz9QIyfsTBX6pLZkZNblXHGYCqCEQ/2V
 YJuzOTim5ZzSZ8MHOwwk+wOaFPLfSgre7gHfWs6UPJYFfZoO8psnk0RrkwjvaJZiG6yW
 Lbh5g+LJsQCCBWygle8GDUp5lYtk+yJZCslOvbjueNz5A0dyfhzA3x8CPqBdaYRpfQMl
 EjyguEF/TvHXnf4nfbJAI51v7P08gmysr+MjWH/L5LYkT6l7gPIU4ImZdUoE68BKIlCY
 jTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aDi1N7Df12D76PLV6rwita/JJfO9QOIBjG3NPUf7ABU=;
 b=coE0D33MpKiMEf7L7D7GrbXG4nlYBQhutqE/3QcoCuGgNyvasxGdIaw5hvbDX0ylVE
 yzl9l8sMyzEKspuwOqbYD/OzQzft/Ivv9JHUHJU8nylEFd5iSmbzr2tNiVbuc8CcqW7u
 3A5fkb2rD19PkI0Jb/KshoWMgZkslmHyeJ2wZc3mM9WIgEei3BlP0CYkps6Zqb25KhqP
 3EzHEvlBW7mVayhvqPVMTjHjmYZPPpUa+ZFi5jY4mBLZB1FEVZ06BBaODDTmv/qjPNUX
 NAF4Sy8rVugH8NH5HX8TNQkKq/m4xJ5O79NSWkMKmj4vANBybaGSjmqeFzv4gt1NK25z
 Hfog==
X-Gm-Message-State: APjAAAWS+nbiKB7FUoDmB0w6MBnepe4Ikc12VEIdBUjos4J8BXu1Jbjw
 c2yQIWbxp3Bp5anVsrg+Ccn2Vf3HooU2dt8k1HyXWA==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr12712126otq.97.1579460500310; 
 Sun, 19 Jan 2020 11:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
 <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
 <20200117182939.GC13396@roeck-us.net>
 <CAFEAcA9zWeW1k-K7qVzCSOA70BmOCa9onT2z_QUQK-=0AJ+NjQ@mail.gmail.com>
 <7a9967c6-a370-9137-10fd-095113dd9852@roeck-us.net>
 <CAFEAcA99CgreMMeTH+nmnY+6OU2xY3A-db6MfBuU8i_MCA+y3w@mail.gmail.com>
 <97dafdcd-3f4d-5cc3-efab-b07f373765d5@roeck-us.net>
In-Reply-To: <97dafdcd-3f4d-5cc3-efab-b07f373765d5@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Jan 2020 19:01:29 +0000
Message-ID: <CAFEAcA-9Q7kyJLGcz=kX+mgpL=8Hkt4hM2so1rG98t-ViBS+PQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: moxoiGjgcz6R

On Sun, 19 Jan 2020 at 01:52, Guenter Roeck <linux@roeck-us.net> wrote:
> I'd rather try to fix it all if I am at it; otherwise it feels kind
> of incomplete. Would you be ok with addressing this separately after
> the current patch series is accepted ?

Absolutely, if you'd like to clean up the code please feel free.
I agree that a separate patchset is probably the best way to go.
(Do you mean by that that you'd like me to take your v2 as-is?)

thanks
-- PMM
