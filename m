Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4554178lff;
        Mon, 16 Dec 2019 05:38:20 -0800 (PST)
X-Received: by 2002:aca:eb0f:: with SMTP id j15mr8944219oih.6.1576503500294;
        Mon, 16 Dec 2019 05:38:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576503500; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIIcPbwTJGxCxFeGFHev++TW9LXuD+Ir2iCDv67P27FzjHY3mMdNcXBcqwZKNJzHc5
         9tXd3h0gu6LQtRQPM5vFsjCdGWl7wEO0gwpW7RbwUplJxZwOGvLivKlArJ0705Pb3hM4
         XSWoqfdvgRCv+hthbenenAeuxnDkkJMCccZy6252WNbBaj36bcYWkmjlewEXF6+azTnB
         eoaePhg03QvX10Qlzx7F1E5lLz8WPXIctnQ/MoIs5OTOJ+1YlP563RsLgkodFHbkb8st
         4iPa5ry0LBuXh4VCzgtUr8RTv6iYRaH/Ed1lF+h0w3CSyBp5QoH5wKSqPZzFzZeeT5m8
         wqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bOiOQS281XKOtaM1Cfka5yGcYTvl+GxoBwrv7dXPzRE=;
        b=lhac27YjPq3qkwFJsuNQceq1mq3JadRPfzceF2UgrP+6AC72BN2w2EinSwLly0fk4w
         OAZcumzlh1z7DaJjJ+wGqA9uxba2yX3F3W7ZyoTYTOWX537qhgug+SkJXV/x0cG/iuBu
         QcT5/huqkAKe7XWrA5hENj3IK2+OV3hDIrJxJdK6u6dTUjK5CqsGgTV4YWH2oLj+LpBG
         Ea0PZojI7AMGxtVu00SUTlecL/9lsy8lcnZvGpe/T2AGUxnK0UtMvxiJUvhLReHaME8T
         nnRpVy/KTtWUfiMsTNwYo37XHAKbIIj+pQ5cm22ESBCIaVxkqM8M516I/nL45Tpxl/UH
         54TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZNRKMHN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q20sor5798043oij.108.2019.12.16.05.38.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2019 05:38:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZNRKMHN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bOiOQS281XKOtaM1Cfka5yGcYTvl+GxoBwrv7dXPzRE=;
        b=uZNRKMHNPtZbu+4KvM8MpcX4OG/0UGhqrucOETxh2Qn3b4EQ7GuAqmv3TzqG/FrOQi
         LxpamBdf+KRO92/tXtvaC8wHtOt0iC9HsfeogKO25dz20Gg1ADKL7ZVFsV8+LcODIXvj
         k61L6YX/Wt3bdGuwc7QE+NuAT1EUNuCCfBfuEaOxWCi6ZH5CDpXEl9cWy2zov54U3DNE
         4VJMBP2ypuHT9TvQzGyY4rTHuvw9aPuFpqWwHb+Jp3M9QyycjoFjPIgvg/Q1R3W6TlrX
         5KJOr05Nk/F7IyWhspXEgJJAeJXQUIzKOs7IXBb9bSDu/QMz7bxS91u0vFqp6OwRmUbo
         o+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bOiOQS281XKOtaM1Cfka5yGcYTvl+GxoBwrv7dXPzRE=;
        b=aisFaIWGaNMmR4oPU5Q1f2HW6ON9NL0futJZA3Dt0kMFqLWHIfpwgKZ8Yurmw+N7lp
         XOmKmIq+nZHvneZohD9qXnWFbmkhRlAsLTZ9mMS6wsKnX7I+CSmtB70a2pKqPCsYqotN
         vAw/Gri85v+Qo71MwW9UCwqMgQDNYZBuhLWPS7u+gKRPbQdCqi9R2nCtHFC/1zBnIgMv
         bcBv8+4LKspUX5njqzQ0zRvsSjaes3Krl0kFcvVG1t84nHt8PSs2mQYXsgZKr/p7V4tc
         5W3xpxA5HopwHmoxZG4JTUzZxJpm7iFU4ib140u6DjIESIpfdujELhOsYsjG8+t9f2wR
         nUkA==
X-Gm-Message-State: APjAAAUbmgvcjxrkeQQJAIOO3KHM5LyvvmHujCx1gBBUJtH6vkgoM1uB
	2IInG49AW1rRGQx7mt2d8gTQjRh/tWFZ8L/kVT8I4EuXzbW8eg==
X-Google-Smtp-Source: APXvYqyTTxGrF/DBC+wnwjgOgqQgtg9ZauusSN/Nf8cHy6jYbWWOyLnaGadiTTHaQl3gjL8+WVUpOZsMDqpZpbnB48Q=
X-Received: by 2002:aca:edd5:: with SMTP id l204mr9820741oih.98.1576503499739;
 Mon, 16 Dec 2019 05:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20191212114734.6962-1-alex.bennee@linaro.org>
In-Reply-To: <20191212114734.6962-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 13:38:08 +0000
Message-ID: <CAFEAcA8aXE7aZXzVgVE9NxZgPug_M_QxJ+ngfjsncpOKKge8dA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: ensure we use current exception state
 after SCR update
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2xwfwZuocVL0

On Thu, 12 Dec 2019 at 11:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A write to the SCR can change the effective EL by droppping the system
> from secure to non-secure mode. However if we use a cached current_el
> from before the change we'll rebuild the flags incorrectly. To fix
> this we introduce the ARM_CP_NEWEL CP flag to indicate the new EL
> should be used when recomputing the flags.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20191209143723.6368-1-alex.bennee@linaro.org>
>
> ---



Applied to target-arm.next, thanks (I added a cc-stable).

-- PMM
