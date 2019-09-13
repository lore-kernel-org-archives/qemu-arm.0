Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp720382wrp;
        Fri, 13 Sep 2019 06:05:35 -0700 (PDT)
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr14737780otb.24.1568379935708;
        Fri, 13 Sep 2019 06:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568379935; cv=none;
        d=google.com; s=arc-20160816;
        b=afrStJhdHe7q+VKUO8YK+mAtx6zjeFOQpopAG2EM4LzxDnp83Xr/eAb9aAdVZS4TSS
         hgEPkbPyxy+xUd4HpPpJcnY9JYG53rBTmsYvOGPMJMk7pTrQF3GyYsb/g/drNq9zvb1K
         aMFlfNGcdOqb5LrBILLiFSFxHYvJj6IctbYNiDz/ThKnPiKg9+jYGYjfcb5/Cn5f1115
         A7Bm2a/M7rRjkOPm0s/76oKmdDDz4XzMMHrolC9Z/6pcg3P9FyyNQhv+7zqln8j2YSQs
         CzKYXmm4/Sqsecv9x8yOZstPvkWm53Q11xzIAy1XUqt9pZyczz5DIwDy9Jve9FewuOrm
         0CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuLP4A/EVyHmsz+xdaxuusPVVYQJnMEMrotLGMCd3cU=;
        b=xt6KtxwWyNgz5FPhZ3I10uYJlRxYppt4BEOjRLfbgnXB+m1L6IE/367/3UiKCU2G9g
         xYudANl4xE7KcuFx5J2bSrJRfCiIxrtLdCSaNxN3Hha6UwtZB20xvZAhlhPmJJ64lzxJ
         CdDL3pTvuu03hcJKqxWA1erk6N3QQmg1EjzatNAbBzQzkXvRSsZ4A58cCMOnGtvCzhfI
         SuonQxnO1J2kzK3Gy3SmT204Qu87QVJ2+4qT1rkUz8Xf1+6V6ZS8es4h1LZWQISeMJ1E
         EQ92erfbopgemRFE6YBqd9vNAxOvNJsuuZHQLdtTurnJY4zM6B5dNdUUcwiDESRxzl9J
         hpFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKpcfEDk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p143sor1291548oic.113.2019.09.13.06.05.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Sep 2019 06:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKpcfEDk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vuLP4A/EVyHmsz+xdaxuusPVVYQJnMEMrotLGMCd3cU=;
        b=DKpcfEDkDeJoOXi0aTc4oPJ5aEoeBwkkkAXldgj37G+f/W0enZSbb6Jk3T1/0WQR6k
         kmd2DtoH6wGfkC+kM6ZLc9dKaSmQ7D6VohwIJLGIGRuJ+0VK9StUIbSCPldyNIngfhOi
         QP0oIg9YsTaSyONMoM35vLGZK5/Kkdbwxrn3/LNenvv27Q20WvORuTENrt33bwz7YLVt
         8xqOGy5U3YpyC5y8zqlrntXBjp6E8ggDPTCIdfw/UhBEpg/Q6teypj5IpKfPz1Mrh8DZ
         F6x+F4YKMM4ijfBBj8HlOtvY6PDIVRfLMqNEoUEasn49iU9MFH71vYfCCtdhB8z6w14Y
         o6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vuLP4A/EVyHmsz+xdaxuusPVVYQJnMEMrotLGMCd3cU=;
        b=YFHOI+/6C56LIpy9mKSXnW/QdKtfKoAaNHYUGIQnw5VdrxAEOL4H5GJ1WPVt5W/Hhv
         HH/edCw/MXxMf/y3lxnHKContyooK7gN5ejxHJIUxSF57mqfrfHZ0oN73RD9yDV5Gqpg
         BE6zp0ZrP0g4GshJi6AY5sPxYmD7Fbh/WOWfWA8zkCM06yJWDwWUgpN9/Dvl8ervzQzh
         nNYCtDXcyT057iJv1DWHcAAHeA5mWkIThbzaMqWT4P1o1vkSLEca3AWd5N0qhNBqJD46
         dQRnEM6IiqtVgBb7AEki/AkLwy8JaXcy73URROAHl1T8r6ZPJNGy0MF7lBmNWhmkTpDL
         7SVg==
X-Gm-Message-State: APjAAAXZVA4lnryo3dz41fK7hN0mEWyVO2dGh1nm77CeEiQGhGTZV/4J
	LRIQK0Mt4O1fGF/QUvf3cj7dtrGrIp26wH8XYzCNzT56ewiWDg==
X-Google-Smtp-Source: APXvYqxQvpWwhj4L3JcfY8LP2hErtb55ZYa6GnBCSxcuMPDloZh9z1Qf0OM6WajZ3P1Mcmm5OfiazAXyxzCPp+XajBY=
X-Received: by 2002:aca:53d4:: with SMTP id h203mr2049768oib.146.1568379934780;
 Fri, 13 Sep 2019 06:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190911164959.11003-1-alex.bennee@linaro.org> <20190911164959.11003-6-alex.bennee@linaro.org>
In-Reply-To: <20190911164959.11003-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 14:05:23 +0100
Message-ID: <CAFEAcA-yyRX3u2r_s1u=gEou7s-eh1Yexof_HonCPHL4YqbcKA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] target/arm: remove run-time semihosting checks for linux-user
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PtO/IbaQoQVc

On Wed, 11 Sep 2019 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Now we do all our checking at translate time we can make cpu_loop a
> little bit simpler. We also introduce a simple linux-user semihosting
> test case to defend the functionality. The out-of-tree softmmu based
> semihosting tests are still more comprehensive.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Could you not put the code cleanup in the same commit as
the test case, please ?

thanks
-- PMM
