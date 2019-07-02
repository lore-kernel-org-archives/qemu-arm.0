Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3826069wru;
        Tue, 2 Jul 2019 06:48:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIaWd4xms3s3MSGCZqOFiB0h2BaKxQAzxuk76go4cNH0nBKPKsFLXwwhaxveZq/wd55LUq
X-Received: by 2002:a17:906:5806:: with SMTP id m6mr2925992ejq.80.1562075291003;
        Tue, 02 Jul 2019 06:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562075290; cv=none;
        d=google.com; s=arc-20160816;
        b=a8Bou5Qiv+YT/7EM7S8u5wPWA6thaMwI7gcdW0OhLWvMxeUEvsqr2rwkhAeORMDEKO
         94EsCRyRKZSDuyUlUGdtIxL9B19w6I5ouOD9cR8kAvUOPQPjHbE6p0jT3dLchMuuNqon
         eiPWHtwMFIf5Cnoy0EA8rH5bcbXDzAbTMPiHV7IHney74bDrm6ddVUT5x7qtAHbb9PFR
         1K6XdosGHmISab2USuacKX91ktwbrBUMERSadopy8Mq6fAXX82lMeW7m1J87gkjST8vI
         paA0de31o49CpZgPv6P0OklXB7MWr/KTW6fQMfXMiyIbIJOJJ9jpIYlbWsopvNhe3WPO
         ELGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VJaf5QiQw12UXFs71Dtz5sRrxskdcL8jkomFVtXibP0=;
        b=NiOKgN0lJphEEGCwgzsBabdG7zyZNp7Cj0cTz5Qvc++byf6/GTG7hofL5jhl4eAUby
         NOlp50BuS6wMm3jfXCTrrVS14M5kmzybkE1zWOHUoJnknjrtAA8TKZx3wTXpBu9m8flq
         wEYrjGlRVxi21GBCpuK+rPWmGIbElU2nJNVT+5T6Lx2ofsMtVi5x8H9s4d+XtqHmdnLR
         kIWYNv+nYktqv2uKeIWLFjXnPzTN/B2uW8fv2CP1x1Z41mrrvL4qwSpabThywlV1DgXF
         nRPE4eB8hqDpqEYTr35soORlXrqB7oWI1U8LPHHRRnw1BCwZr/UpfxBzH0cnxrEK9aeK
         FPiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q1CppeXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g23si1633283edg.39.2019.07.02.06.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 06:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q1CppeXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiJ8k-0002bQ-0F
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 09:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJ82-0002Zm-Ic
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 09:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJ81-0003Hr-7u
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 09:47:26 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:37223)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiJ80-0003Ec-WA
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 09:47:25 -0400
Received: by mail-ot1-x32c.google.com with SMTP id s20so17211650otp.4
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2019 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJaf5QiQw12UXFs71Dtz5sRrxskdcL8jkomFVtXibP0=;
 b=q1CppeXPB23L5qEJCrLxNvAWu5zZmHgRYRtgC9tY9i3QyjTOIDTNHYMWcN3d0OGMfP
 N4qYZAo8Q6qvzxB+wQPX+naN6LVI51CoYkWrRGNrTTw8ltS286itUPymNHF4Dos0uDaz
 gk+OJFRb653oC9Nx8tLl84Oh3u4jlfp879ItP8dVK8/NeLz0lc/+LSljpiryIkrHB9YQ
 6F3hlyV28UvcPolV5L/BpVeODECCn/VTqU9nRGvZPcHQi/nJEy5WkMZ7ynJBo1ExrReg
 bIgAGLRZlthjjrPKYW0Qz/xmO5eDtR6MtyRNHDgx9lgEqiNolEQoTYz2KDp2/NwPShP6
 zIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJaf5QiQw12UXFs71Dtz5sRrxskdcL8jkomFVtXibP0=;
 b=Diwamk+rkwtmJJCtzRPjYIgF8ifStB2WsCoR8QfQNtBqoKLjN57Fyevbiy5TZvIk4I
 tOrDk3moES0XklXh5jJ7ffwoYqbzQQboCr9VJ6PE+AIz87yQtnFX/z8zECwDjOhMSUir
 C0+jZhZgVUh3MAddstr0F1sm8PgXUwO8viZkylsLpZv6VMtad7mBFUcO/00kIa1eibc3
 ACQxwQURFo0C+psr8o/SmUy/T7VoieQucEXRO2bWb4bZrCS4wF2OZ393So4zH0tIj65u
 9jq5a3mJu5CHDX7jn8FKC1MFKI2oDdVVaxrf8m7nu7JJuhGzEs84c0l4Cx9pwQqbCown
 ra4w==
X-Gm-Message-State: APjAAAXeo2FpvTX4+ZsmoyZmpsnozH2G3vY39Rvc6U+AZOIaK7+AH7aL
 6kytaw/p936laZ1PtybfsUcsetwLgq6lJNkIC/t0Ew==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr25069542otn.135.1562075243729; 
 Tue, 02 Jul 2019 06:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190628103957.9504-1-kraxel@redhat.com>
 <CAFEAcA9Dh2EaPkcDmErEdJN+BknuRHvZKe5veOcY_7hMVEXiVQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9Dh2EaPkcDmErEdJN+BknuRHvZKe5veOcY_7hMVEXiVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 14:47:12 +0100
Message-ID: <CAFEAcA8W6OkDa8cY-YWq7dFeFoZENFiEPNfB3Hy3XQPe6GN2rw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
Subject: Re: [Qemu-arm] [PULL 0/6] Vga 20190628 patches
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GRtpTD1EaVLt

On Tue, 2 Jul 2019 at 10:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 28 Jun 2019 at 11:40, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
> >
> >   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kraxel.org/qemu tags/vga-20190628-pull-request
> >
> > for you to fetch changes up to 263807f4e85e94f2d4e988d61d2fc0319b1dd36b:
> >
> >   ati-vga: switch to vgabios-ati.bin (2019-06-28 10:49:36 +0200)
> >
> > ----------------------------------------------------------------
> > vga: ati fixes, add ati vgabios.
> >
> > ----------------------------------------------------------------
> >
> > BALATON Zoltan (3):
> >   i2c: Move bitbang_i2c.h to include/hw/i2c/
> >   ati-vga: Implement DDC and EDID info from monitor
> >   ati-vga: Fixes to offset and pitch registers
> >
> > Gerd Hoffmann (3):
> >   seabios: add config for ati vgabios
> >   seabios: add ati vgabios binary
> >   ati-vga: switch to vgabios-ati.bin
> >
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
> for any user-visible changes.

Hmm, the bitbang-i2c changes in this pull seem to have broken
patchew's asan build:
https://patchew.org/logs/20190628103957.9504-1-kraxel@redhat.com/testing.asan/?type=message

(probably because now we're using and testing the buggy
code in a way we weren't before)

thanks
-- PMM
