Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4366915wrt;
        Tue, 29 Jan 2019 03:54:24 -0800 (PST)
X-Received: by 2002:aca:f3c5:: with SMTP id r188mr8771971oih.255.1548762864377;
        Tue, 29 Jan 2019 03:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548762864; cv=none;
        d=google.com; s=arc-20160816;
        b=ZwkO+XON89pHQC/ohsRnsZLqlybggBuZ/a44lZvhRwORiXr0a0Rhj4+7WzpT9XnQGs
         eehIbNjRIq9aOqapjx9uwMla0K6nKf95/gPwKRf2qYbh+0zxxEhTXO8y8Emz6s0zEjeD
         f7qHOu5gLrXsRFYldwLU849+h9XODPIuZdGp6N2XHTOwz8tPfBCXl9ULKYLnqNdrsUME
         C6nO/7NT7raWNk6r/gxdUcQMxVfVT+erWgeQc2SQL7GdUk39wecMJ90hcHhwyk5W9fa9
         QuqRAWiTyLUfGxgG9vjaaQZcSu3gsJErxhqJYF7wMUQkGWM7WYh+ksKshMx0WDvaiyvi
         pO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eUDJPzJmUcC5k5nPZ7aRNKhFFZ0kgXfliFV7Lb7YUBs=;
        b=F78Vys1QXkbCTdRyXm9R04DwlAz+7Sl9U9va/i/PoJGsTogEITABG0j3CMOuEHGGMx
         H1sl0QywOaoYftnLfz7snTPVaktHRWFFm043TeUb6xK9e0Ff+EVr9WZ2PzugRTgE5oqH
         FqsKnVPoY0dYvnOHUo3ApLmAFqgCeiR+mXXc+A9cVHHuRPmlzVjAVNm2d4NaOgvhZtBd
         dIcWvz/duE5tDV18BM9iv3RpGfuvkObvLCwKAKIFRwOOJxZtHexmLI9jn5eo7gCHnvuu
         vt73z32fn2EnZsGtMw3NPaZv2vlNStLzBNDhNEIvPjFB6zELJQfiUgUvYWZ42Db6/bZx
         sOWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCO16ajq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 31sor8017717otf.161.2019.01.29.03.54.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jan 2019 03:54:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCO16ajq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eUDJPzJmUcC5k5nPZ7aRNKhFFZ0kgXfliFV7Lb7YUBs=;
        b=gCO16ajqe+1st5N1lmDBzQDm1vKfBFO8fsS+Qlg4UqXMQRvgKtWU1USK+/PYGo5a11
         eCmwJYvxLZf9dikZksJGn4SiP4MwKyw9AP981WVI3Dtq1lMSP5h2N84nL7yEY9rkegcM
         V8m3442MmFGc8nV+6K0NC8cLrFFEaIQbDoXlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eUDJPzJmUcC5k5nPZ7aRNKhFFZ0kgXfliFV7Lb7YUBs=;
        b=mkR7PYpiLztFFqWjYa7XvJWbJkqzxAjWWsdRAB8JkO0xgQ6GvFR3C/HgL+yzjqeAYB
         TSsgZadtHd32Qv0Y3dfV7PQBSKgQ1afR4eeN5+Mglt6HEDzR0jTAI6+lZnU2qbwsEZKB
         xIk9Cso05efieGX7y9DWFwkePcgyreFreLmydzow0Dc16LO3NzmBaeBldXkl5LggQaqO
         Lc823aY25SQQdC4xFV4OzG/vkWwiZgryCEtPC03yfLJeXRjxKlTxs6JT7MqOQm7h788s
         ktMibooxWqz+GGQDZ/5hGpCdBq0bTOOElWmgY1z9oJbehypkXPUMdqgPhd3e8Z+NMN87
         NTsw==
X-Gm-Message-State: AJcUukcTOmfwQ70ZobxH7g/pXMWVBFpqRK+awSgYgdTqStabfkluUCF1
	1JlV9lGgiKVqj5xp5/tkywnrMVTTdqVj7+S7++lK2BQ5
X-Google-Smtp-Source: ALg8bN780PtRjwCdzaurxtpBZc/QsC9o/lLyTNd3gzyE36H9FpYJ5lanyiEammZGVO/daahjzcdCeenJclaSBDX8u80=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr20197697oth.317.1548762863953;
 Tue, 29 Jan 2019 03:54:23 -0800 (PST)
MIME-Version: 1.0
References: <87va27n2l8.fsf@linaro.org> <20190129114609.GA25983@lakrids.cambridge.arm.com>
In-Reply-To: <20190129114609.GA25983@lakrids.cambridge.arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 11:54:13 +0000
Message-ID: <CAFEAcA-_ShbUthqPSPgEPmV0EeRUO85n=sC-+76gRAH830co_g@mail.gmail.com>
Subject: Re: Kernel boot regression with PAuth and aarch64-softmmu -cpu max
 and el2 enabled
To: Mark Rutland <mark.rutland@arm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marc Zyngier <marc.zyngier@arm.com>, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Kristina Martsenko <kristina.martsenko@arm.com>, 
	"open list:ARM" <qemu-arm@nongnu.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Jk/7zeiM9RaF

On Tue, 29 Jan 2019 at 11:46, Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, Jan 29, 2019 at 11:08:19AM +0000, Alex Benn=C3=A9e wrote:
> > The -cpu max enabled a cortex-a57 + whatever extra features we've
> > enabled in QEMU so far. It won't match any "real" CPU but it should be
> > architecturally correct in so far we implement prerequisite features fo=
r
> > any given feature. The cpuid feature bits should also be correct as we
> > test them internally in QEMU to enable features.
>
> Just to check, does this enable VHE?

It does not. (We have no implementation of VHE yet -- as and when
we do implement that "-cpu max" will turn it on, but today it doesn't.)

thanks
-- PMM
