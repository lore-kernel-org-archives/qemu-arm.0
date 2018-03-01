Received: by 10.28.91.67 with SMTP id p64csp1729429wmb;
        Thu, 1 Mar 2018 03:44:55 -0800 (PST)
X-Received: by 10.157.48.118 with SMTP id w51mr975306otd.281.1519904695562;
        Thu, 01 Mar 2018 03:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519904695; cv=none;
        d=google.com; s=arc-20160816;
        b=Wfh7GrFhtL5s6BRcCXcwy3QBGf3F7fsBig93bXpN0rLCNqVu7TNMAcbVJ1YdbV+1q7
         z7k2vMcrdwEZCrPjcePAfgJy9W1yc/IyamfnNwz+bQLN0MFfVNItQVt6m5bOSWCrQVI1
         V9SjRztgJ7bUyhWUDW4bnMWRmc7EjkHVpbZhJIpDi947E7HwtzrztHqzkuOI3hmRnGCO
         rRpTk/sC86poS8CKzbjHNkerM5bMX88JhDnXn4hOBym2/rwr6uHoEvZi1/Nr90gVYTJ2
         ptqSHKX3hatKqqs3NTyDvUPMl+rC0TUqgjuBhWxq0Iim6dR504583EfRKFLdweRpNQQt
         N+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=c1pP3UWoDuWUVpWLo0tNZW0MFfD5grikFnFbKUltfQI=;
        b=ex955vu5kQmwIqerDERH9IGuuyQXzrwl34XtphuUo7E3NX7nOxX1/Pok/VozVuu5a+
         Fz+mFT/U08s+5Up+o5I9Xw5I47AHyGsIWsJCigyXzjvFA2oCKVoq4TwFUsBoHKTUKJ+W
         U2wFLEHQK/VWtQ2e08geb1MK/mICSagnQNgGV/AssG6T6lpuwxrArwizcRaU5trsfy0w
         U1G7YNBLoc3/f7hsSBw/W3+Jq9e6dLFMbT56z/TNfs9hSOyCm7Yxm8lnKxl2nopjYVBf
         OGJ5JNb9xYVNgfqntdvnMh2aEy3d6yPO5YPb4wOWAzg+ytq+tny2fXsFznbYdOBgC75h
         q5Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GS3z8sKV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f10sor1534536oth.134.2018.03.01.03.44.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Mar 2018 03:44:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GS3z8sKV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=c1pP3UWoDuWUVpWLo0tNZW0MFfD5grikFnFbKUltfQI=;
        b=GS3z8sKVd/fj8ujz1MgPKwzIA4m1MvUMC3NPOOgfxPxpAHaYQC2G6ifpkRpHD0ovB/
         mP3go3mgL5FhQHdmd/E9xrGX4XMt6vgfKQIAO9M9DQc1E6DhpVzCrhA9UQXws0jAN5eV
         F+3jFU3zwUhx66ckx6l9xbKgY1G8wFLWEKGcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=c1pP3UWoDuWUVpWLo0tNZW0MFfD5grikFnFbKUltfQI=;
        b=PJEvOhGytdmL7CPlQ7MPEGDzPGwr0c6fMO01jDTv8r0yycSbBrDNolNDhbSZKAln5V
         G3XQyCksSC6j0GdiRgyh0AcNGLaDtwyur7G1CGLrt2/LwXGiAsH1unlnDZe3ghCoDx9D
         dRU8GoHfKeLKnBfXd3BTwsESrl4O2QlZqeU2pFZivhnxh7rX0ZvlQD7Xx7oVoPZZQoBM
         RcvSbR5lEBXHjQQcPUqoe6VHUC8URLjewNjVt73p50mPrXoDtARu/pdZ1kDXQ4QKTgR1
         ltpwIgKUGMu//VbcahzijZGmHrFSa224PJENQugbLmS9Txk+ahPCfYcl2w9yuelmXW7L
         u1mg==
X-Gm-Message-State: AElRT7HuMZDaXtkAs3svgW7w4hg0e2wA8KQs4bP6IcAw80ZXObZZuTm6
	sUugHYZ2njuDBxEbhsimonwFE24U/LdwUMKqWeS25cO6Rpo=
X-Google-Smtp-Source: AG47ELuTHKG3E6nl4AaqqIKGDPNb065UOn58dTWvUQVpz65CwFUnsh+ms1l3xje+9ntFuiymoTr6q/XOycmv12H0We8=
X-Received: by 10.157.28.156 with SMTP id l28mr642188ota.316.1519904695130;
 Thu, 01 Mar 2018 03:44:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 03:44:34 -0800 (PST)
In-Reply-To: <CAFEAcA8-D=f-kAKMB+cj91ffUW2MD0wDQt0XA_3gVec=YDBfkg@mail.gmail.com>
References: <20180223154613.2096-1-alex.bennee@linaro.org> <CAFEAcA8-D=f-kAKMB+cj91ffUW2MD0wDQt0XA_3gVec=YDBfkg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 11:44:34 +0000
Message-ID: <CAFEAcA_4jEgbJfk7HzeaYoFm53FopV=8RO9K=uY0H8L74-zrJw@mail.gmail.com>
Subject: Re: [PATCH REPOST v1 0/8] Group support and random clean-ups
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: HuZcxjG9YB+l

On 23 February 2018 at 18:23, Peter Maydell <peter.maydell@linaro.org> wrote:
> I've pushed all but 3 and 5 to risu master. I don't actually
> object to patch 5 and will probably push that too, but I figure we
> could have the conversation first :-)

I added the missing patterns and pushed patch 3 and have
(per irc conversation) dropped 5.

-- PMM
