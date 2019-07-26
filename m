Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11628625wrv;
        Fri, 26 Jul 2019 01:44:44 -0700 (PDT)
X-Received: by 2002:a9d:2941:: with SMTP id d59mr58069124otb.8.1564130684717;
        Fri, 26 Jul 2019 01:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564130684; cv=none;
        d=google.com; s=arc-20160816;
        b=vYrvaKpx1wkhQ1DErioKpMxRO5gRVe12qHoNeGCnSnoxd6481A9W2z82DAahhQyXUv
         bDBLYCClLnLkcYu7rpAnUwQRs4n6B962WDiUmOwtunDDcOunZh6i+KaUrS0w5LMsReJc
         ZwLSVXfB9PE2MYjDDy1Yc7luMhQmgLaqrQQMiFJIbGnDmRfP6EPRfiILOQR9KLNDaOOq
         Uz/ms5CC7QOdnbgVHahnx6p/iDgAlNqjQXoS0qPSHBWhN/RyrxaXmAfNz7QG08UdkqK9
         jyPtmNVq2krymflXZ2UZNqek6Wp2MAbnM1NhgZQto418bLc+O3QwrFoUsgY5HFDKBOSL
         H0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xqC+SX+j9Dq2f5oljP/11thN99jHt/Y0ae3lWNDylKk=;
        b=Kpi7n+rd9WuUvCFGfNHiKf8pvQRTAGcGzaIBzQ/IFUtJ5kSXE2NzNgFWXkoROrHiKm
         55MpWYBdD3VD+H7v7hUgZgXqITWRJEBj3Gl6tlc4XeVO0RyVj4PZhmUmHQBKXXynEMkt
         Z6XIzZnGOkDO3N1O/Z6WZcg72EDdw1smgyKxrbmXk1UIGKsMiiLOKoBhwE9eVR7FVyDr
         VVn/HG8K0fhUcABDskzbg4dFizE2C8asxWe9rNEXjjuxHwFWY8Lp3dZyr5bX5AIjQTT9
         8ASkGxJ4SJCJyp8Y3xCkA2KQWA06CbtPz65xlodLIYHOnGabj+UP8pkh2a6wxGMIngSl
         kRFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RowEQ28c;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y64sor22866184oig.106.2019.07.26.01.44.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 01:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RowEQ28c;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xqC+SX+j9Dq2f5oljP/11thN99jHt/Y0ae3lWNDylKk=;
        b=RowEQ28ch3y0X9dVkVUIwPaPuLWWBanZnKMDdATHOByq/nk3iyVJ8OGQqaMC/0qvuk
         VJk+5n4u4ezhqB3zaZV4KLAp7QLSvv0DBbPuuSs8ZdHMUVYdWuWmgOmanS66xhW9zlRH
         r6J1W9NwNr/mmk80n3XwXkbzQ88XzY1WfjG2CjOWIjpFhILvzJlvA+wEwPQz0ther5jC
         JCPLpDoiwnDbRgJUdQUDhIeBiFvV/UyrVqx+ZrRPs5xE7qsFB2s1YgAzBDgzKgZwAZCO
         2/sZVJ0GKpBu8Esr9qLOyTVrqALff5aJ7mpEbyja+QYyQeS1nXh3UIZxyz3qnYIIB+7n
         D1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xqC+SX+j9Dq2f5oljP/11thN99jHt/Y0ae3lWNDylKk=;
        b=mmBJOyiarpHqM45WXZjYSLz36yAKMIjKWEHhPUcR2QkpjNNJ2/4fb8t+amX6crzf9E
         s4WcKvN1SJnm5TX7eR9uX5IQXjPvj9oC9obSNoAiWl1aGDJB9WV5KJjSGMUdJsVOPEn7
         wRMiM59/UWLZiwF/tsJUPjMkeFOBnWP6cgAL7MPXQ3bNLEAQtv4Crg2s0bMea5rAA9fo
         oMRLQGvm9cHkJMAfp7FbXXotVr0vMTcyfFNSV08/rXRvYdiBCjF6kkivAfvMMFjRLb3J
         wRbe98EQ3oVD2fDYBiYtAO9m5OVf4ZK7BXDPRzBNNnT0KtxXtEOpxl4bHrhaXymcrbc/
         PWAA==
X-Gm-Message-State: APjAAAWtAVUOsKYewsU/BKQbdOfnyJUlbexrpBBXZ7gBh6z+W8JWXlpX
	JIX7hAATRiQfoneoM/Pf2e1BkQAVcUbPlwNWG0oO/qCJsmTdIA==
X-Google-Smtp-Source: APXvYqx+pPnEkj/MZDwFRcxpSAxz5zh9BpKMgR83ckxU5HGVbCcbHefPDEqfj72AyVhLZjKhqRZjFB5BHKiNfDFl/6o=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr44420041oij.98.1564130684218;
 Fri, 26 Jul 2019 01:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190723113301.16867-1-alex.bennee@linaro.org>
 <CAFEAcA9CP0cUkDR4qOKVgM1b2U1KNot=A-5OPEAOKu3=KpMyuw@mail.gmail.com>
 <8736iti7hn.fsf@linaro.org> <CABoDooPYw5JccST8f9gVSmtA8ijeqmaVrqoDcqucbbctt5QvyA@mail.gmail.com>
In-Reply-To: <CABoDooPYw5JccST8f9gVSmtA8ijeqmaVrqoDcqucbbctt5QvyA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 09:44:33 +0100
Message-ID: <CAFEAcA_Lc-EVExMG9=kkCNe_Q4OzisbSdj=aFxsC2kDVhxiNGA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for 4.2] target/arm: generate a custom MIDR
 for -cpu max
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uTM3w690+D8W

On Fri, 26 Jul 2019 at 08:37, Laurent Desnogues
<laurent.desnogues@gmail.com> wrote:
> On Fri, Jul 26, 2019 at 9:24 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > > I wonder if we should put 0x51 (ascii 'Q') in the PARTNUM field;
> > > then if somebody really needs to distinguish QEMU from random
> > > other software-models they have a way to do it.
> >
> > Q is reserved for Qualcomm - It would be nice if ARM could assign QEMU =
a
> > code but I suspect that's not part of the business model.
>
> That was my reaction at first too, but that Q is reserved for the
> Implementer field, while Peter is proposing to put it in the PartNum
> field :-)

Yes; I should have been a bit clearer... This is totally ad-hoc,
of course, and I have no idea what other models might be using
IMPLEMENTER=3D=3D0, but it seems harmless enough and it might come
in useful someday.

thanks
-- PMM
