Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp128531lfb;
        Wed, 4 Nov 2020 09:50:53 -0800 (PST)
X-Received: by 2002:a17:906:2895:: with SMTP id o21mr27309766ejd.332.1604512253095;
        Wed, 04 Nov 2020 09:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604512253; cv=none;
        d=google.com; s=arc-20160816;
        b=kxglmT4Zx6vwKJj9YoRWt3GWoBg2VPeDPPzlfoagSHKgRglxjfoZ9TYgdB/0M3U08x
         0bLXgHlNFW6ggb7O9ZEgQXbac9Tmni6qwiJsfOl/mBrM5oimd04krM1GZypWZMylxjbh
         K89elU/2e2jL46IQBNMHprv4fCBSZgyNEIZSY+FOa76S0ITNYl80+6a8th7CzVJS9eol
         KZxJZjOMotKem9AuY3TFueDcVliHGEziwXG6ylXhl2xNiYukgedr9KrdMgVKvcjZqNyR
         ECM+vSTnr3Oz/v/DSTY5omM7Tx7VQWZPAfuwBS+hIxzBkz8KM7GL/7FkPn/FThw/rYrx
         f1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZrFG8C/ZJphPxKRy8oxOpZD7OQkjRU2pTkYWNElEKY=;
        b=QTnDYpN068dJiu9h3ZTJEujqiFtP12D1XO+H8M8KyUqvhUYeyAKqmZzqO05iApmqZb
         3ybiF8g7Xn+xF8XABupGICHscIkuZcShRi+NvHEFmf5N8qgnP1KU5VS2H0j3coA9AM6g
         NKmPmiGH9RQnoVVLHXK9+edKWvWSHJBcszymaQAuRXLSY2higwmuXAzeN4aiq77YL1dc
         KDsio2A/RscysIk8COGIjdr84DfXaSW5ZubbpRTvjcssG4Yb9AWRpLZFYj7D0cwAvnAV
         mxGP+pc/AyNIZSckM3fZ7zSL/LwH4rT8xkH5TwkW2NF50GyNaepJhCWPwuOsoRlA/AkZ
         lgrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utqJBBhP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o22sor1831482eji.3.2020.11.04.09.50.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Nov 2020 09:50:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utqJBBhP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LZrFG8C/ZJphPxKRy8oxOpZD7OQkjRU2pTkYWNElEKY=;
        b=utqJBBhPbhMFUGsOvbKSRhKzCqqSv0HztQZVA3+r1/74+2iW3FjGnR5K3PJaRT3X+1
         mHXvh6H7Vu7E7EbAGCUZ8nVEENuspeOr6I+nAJefXU+srg2X3aNm4L0R+DPBOxS1Z9Wn
         egpgcae4zciabwY0cTRKli2p9dbIsHt5Rw4g6eQ1ohr4i5a87La6vK5hEFikRqOO1XaR
         86lHacn4o+4ZYlKm+cGVaVNcEj/7ewpA/1SIAAuQZIjSEfXS+fAXrS3GqDVIzUdgjXPB
         1bKMLcDYiHrJYEg9d4+ao4CJJRth7HFyw5DYWU064ZrdTzr/1Rr4OIfgN5XbAnw8ETq8
         WaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LZrFG8C/ZJphPxKRy8oxOpZD7OQkjRU2pTkYWNElEKY=;
        b=LdN4KOVpR3qRtkLlSxVN9Oz6DQFt+VH1C86Gby/adq1JkL0ugQnb9KAH75kL9GClBf
         KzdAKdUvbvIpGz7zwqHpwfvKSUssaldtm0BgZE4z6zK7tJh2iB1HnAZBx4zBEPl7leu0
         TriotjMQYddaAj2D8W9CNexcx0vgeJfoJ8BSyrZDAjlqEZWWPge9zt3HUGXq47vmmW5E
         c7idTapVF2GB4FM2Q0aEQ1LU672NmgdMqodwi/tOnERlcHRV9eeyNw/fuc3qn8QgyKo7
         8Ym3/1wDDGDu4MAwvQMWMtSbeYQL6sDtv+qLWHU4zzAyN0fa/majtn3HN/lHoMqkZlIG
         pLdg==
X-Gm-Message-State: AOAM533HjAKIrPDHydRt+8HemF4aU4uqn/Hh4vZwXIc9L5j4G8sAsZHR
	fXjXnri9c2pEkqaawbfnc/8LCv3mk4cb428O3YI4M1qBl3aQvQ==
X-Google-Smtp-Source: ABdhPJyHp3QBweb1QP1CN4fLb+I+8o3BpHFzRiRyNq8MHi1mN+A1+IbBq5bij9SJ4g2NEHjpXGeQjMWYC4OiuU/iQkw=
X-Received: by 2002:a17:906:7254:: with SMTP id n20mr24961772ejk.382.1604512252585;
 Wed, 04 Nov 2020 09:50:52 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org> <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
 <87pn4taufd.fsf@linaro.org>
In-Reply-To: <87pn4taufd.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 17:50:41 +0000
Message-ID: <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
Subject: Re: regression in TCG emulation of VTBL neon instruction
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IuMvnNsTaKQY

On Wed, 4 Nov 2020 at 17:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Just checking - what host are you on?

Oh, good question -- what the TCG backend emits as vector
operations or not will depend on the host CPU (eg whether
it supports AVX1/AVX2/etc).

If the test case can be cut down to a Linux userspace
program that can be run under the qemu-arm single-binary
emulator that will probably also be easier to debug than
"boot whole guest kernel and wait for it to get to a selftest".

thanks
-- PMM
