Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2309554wrq;
        Thu, 24 Oct 2019 05:54:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKMjIrFElIJGSWpn0Qc07wX0KEjFYd57XwRPblFJLTp9gJo2S6yI5CO3pre07+BMlG+QFe
X-Received: by 2002:a05:6402:b38:: with SMTP id bo24mr44285352edb.103.1571921673096;
        Thu, 24 Oct 2019 05:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571921673; cv=none;
        d=google.com; s=arc-20160816;
        b=tOTR+dPBwyu7SWL77Ne+KtQ3OHQOsSqkccwEpJv6QK1mo/I7hcB6K2DgwoBtQ5opae
         HqevRqa4+okeVQ0hFuOIoAZrV6VyW/argc9TsRkFuwBIfVYTudhTbSjWzGsoEu9YRh7p
         ERG70/4fSSYTMkpt21gwHYQz9kc0zm0pydisTNSW5o/lw0y7IUhE/hfg8MyB0JGz3LJW
         uoU5NCE2jhXRLaT+p/EVcsO5jhSIXALz09h3kvjRzb0ao05vaEOdar4Iu2xzhn2PXjLy
         ycwuzogWAuOKip2CEspKljydi++s4rIDMn0AlrODNQSqbTJoAgHtA8EdmRjLknP4MUJV
         SKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bkRtwDTjVI3MLPVrtGeXczRUegD3guGhnNoJAE5WxCU=;
        b=hZy3W4w5YWao7OTa8IYU0qGIm4XpDy+t9LYP4qnpgbRtJNI5xsshBfz2JUEmyOLaO7
         AuWAn9ired6jwq9qk3wlkZy3EoHx4PPV/rgj0CN/Zed/+xgdolegVVmS4FxYXBRCskpn
         Smpmfu+zgZ/eiQsIu7XAJJi2yTB1hKVM4Oj5Z10LZfH77XQkjJjNqNDisgcDmTqIlAC4
         vIyJl9FUn+GdbUM3XptpCuRmrIxvn3uTsvF/29hjDhx/9JP+13T15PMzun9/c7dCNG+n
         VuePPZeRmNjsMpfiSUyrFK1DsQJtLrcb0ZhUkuWW3vrIbnz15k+gsWdEi+PWh5CQlv26
         3AXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KZzFTPWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b26si14319477eju.87.2019.10.24.05.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 05:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KZzFTPWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNcdL-0003zs-E8
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 08:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNc39-0006rR-M6
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 08:17:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNc34-00033n-Ig
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 08:17:07 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNc34-00033K-Ce
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 08:17:02 -0400
Received: by mail-ot1-x341.google.com with SMTP id u13so1676611ote.0
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bkRtwDTjVI3MLPVrtGeXczRUegD3guGhnNoJAE5WxCU=;
 b=KZzFTPWJOqN/6KlWG2H83ofpUsrR+SjsVlufm+ReByDY29pZypcuJ2FbCgkzFBTlY/
 hhT8rVLO2w+MKrOZJZHDSBbXpJxo0qh8ahAW/Jm2XfXUqwqVyXosqsL/hgK+Mm6mRCAw
 E4+9C1Mo2bDoyxtRBKvpfxm9V3mJ5LR3R1HRxwfJCEuTjDP9AuchrHiqK73SG7UG4zs7
 1NPHMFz+oW3h3+mane1rXoWkhvrFhUPvxmf0rEu56lEzPyUnmcwklJcqflBWIpbOogbX
 8R4sETggxR2CW0aS6jyQlQP/Pw+wm7OwUz3JjOqqdi8ayR+f1pXEnT2CMy3kYVFcUrQ8
 Sbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bkRtwDTjVI3MLPVrtGeXczRUegD3guGhnNoJAE5WxCU=;
 b=NqXikzV6BV7q33bC48mRGiBeCgtM8r9DU2SvAbZmuRIzAs1RfmOhR5jIxUR6w8Tz37
 dHAvzWza1bTG+QOmmacp5zDeEW2cubnr9q1ZvVACP+kZFqig94mY78kDWZvhnNyRKsXJ
 AlpStXB4IUoBmxPuZvtcLWlVAedG63ycEEfvEUbotUUkrrIAdfBvxUaboL9yIz6u0vOg
 4Au3SHFxrmstqKm4oYR4ipWGzE2GKNzBLNowtaL3lT8mK2LZZRzd5DUuRZrp72bdj8Ar
 oSJGNBqH9Ky5DCH8R8kHR0CamV3ddR2CwuhDrFKvraYYzusM+vzgkbJFOCOteooUB/XH
 fwog==
X-Gm-Message-State: APjAAAU4WUdxHOErtHzkp+hKmT28KBWutoSoB70U+n/MTrA/GcOS1h91
 IXSC4WnS0DVmMs8hPaD2bUg02MgTvbX9QXNiej+A4g==
X-Received: by 2002:a05:6830:4c1:: with SMTP id
 s1mr11816095otd.232.1571919421371; 
 Thu, 24 Oct 2019 05:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191017132122.4402-1-peter.maydell@linaro.org>
In-Reply-To: <20191017132122.4402-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 13:16:50 +0100
Message-ID: <CAFEAcA84xJPWjF0h=4e1g049e=4ZD2Kg0Y6aPG5K-97_e1Y4SQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert ppc and microblaze devices to new ptimer API
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iu8mFn3A40a0

On Thu, 17 Oct 2019 at 14:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the devices used by ppc and microblaze
> machines to the new ptimer API. (xilinx_timer is used by both,
> hence putting both archs in the same patchset).
>
> Currently the ptimer design uses a QEMU bottom-half as its mechanism
> for calling back into the device model using the ptimer when the
> timer has expired.  Unfortunately this design is fatally flawed,
> because it means that there is a lag between the ptimer updating its
> own state and the device callback function updating device state, and
> guest accesses to device registers between the two can return
> inconsistent device state. This was reported as a bug in a specific
> timer device but it's a problem with the generic ptimer code:
> https://bugs.launchpad.net/qemu/+bug/1777777
>
> The updates to the individual ptimer devices are straightforward:
> we need to add begin/commit calls around the various places that
> modify the ptimer state, and use the new ptimer_init() function
> to create the timer.
>
> Testing has been 'make check' only, which obviously doesn't
> exercise the devices very much, so more specific testing would
> be appreciated. I'm happy for these patches to go in via the
> ppc tree if you want, or I can collect them up with the other
> ptimer-related changes I'm sending for other archs.

I'll put these in via target-arm.next, since they've all
been reviewed now and nobody's suggested a preference
for some other route.

thanks
-- PMM
