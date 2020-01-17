Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9846898lff;
        Fri, 17 Jan 2020 06:07:37 -0800 (PST)
X-Received: by 2002:a05:6808:53:: with SMTP id v19mr3285354oic.169.1579270057272;
        Fri, 17 Jan 2020 06:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579270057; cv=none;
        d=google.com; s=arc-20160816;
        b=tqNZbAFNFj3/dVTUoD2pN00YB4UxgnQLCdWku32ZwF2uWN4ABjtvlMzYYRB3oXM+pj
         UK8w+ruRvRqOkiI9UYiwFtCePPRS30A9iWhTjIcjnN+dlLtKDJ3zYiA5Thoa0kX/Lvlx
         zoB0XXNp0rFBILtYdg22YM0cc/TppBjBTISSwaTJqvgKGJZvrHzdkk02Olb7ID091and
         H2SJs0LYr9CD3mzO2Ks2RPDQuzSgFAXzqrvsaMSbCMj4TazPLqL/Zbbip3Xx6uEa0fVV
         BOIDe+mVyyoKBpnr9UO+Yo73R5xh8d+OrR9PDddY+ScgGlpch0Nr7U+wF/RyKmRjI0GL
         /aAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwbD3gvEWa+hMsrQyvQGMC4eF/bJwAhYBiV4S+/BsuU=;
        b=wZoAJEOmMYrBcsSi0gWldfTjCjHlyiFzI6U/YA3Ybz5kFiiq2EjIgkGLUedf8Iaxry
         Fn7RA8VILTb4iPHXO3TWVbZd8Mn6ntiKUGELJ0zaHieT/JHrUyZ5G1P4jFHlzCxhTVq9
         H7JQe8Km5viLiJwgOzZIx65ki0AbUii+AVS8Cg9dSDB7KA7dfuGIMz+tMem6CUq+n8Xq
         FK/RQ8Ny7ex9VvnHLYKMwq6faahOvQNa2oEx7CLHXX59bzoFPdoTHgwcDJ0xF7SiwdNI
         uxVIwbIpS3I6QPsSnAdIhOuvAAIAJnPE2f4oyH3N3KFko2nll4fppmdhs6ywTyiPR3xE
         8Cfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRwLMoYD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y63sor12123357oig.74.2020.01.17.06.07.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Jan 2020 06:07:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRwLMoYD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RwbD3gvEWa+hMsrQyvQGMC4eF/bJwAhYBiV4S+/BsuU=;
        b=dRwLMoYDSnk5Oeg9kRsxLS2gM/YVtXjFN6QB0B05zD1YXKOE4qNTDUyfAHtcdZV2yR
         VveNXcphgf47S4eVkTzQs4KatrWOS2OSBxZdjtWNMI1vsNKNvJRJpu4jjYspbwbt/NI6
         PlwJkk7caNtvwdikWmt6GZCfRPhu8g0hgo25kS8kPVtG7NMqPykdG3HgYbGCM6iYfDGm
         YzPfJoJsAEKHnuBaVEdaODf8WQUU08Mc0Gu2hq8VIVUC+JWx+1iQrlUoB8HYd5wvcNfW
         xj3+SDi0qbmxLU40eu1+MFi8489q5CQPPYopijbKzkyfy88obbrUNi2NEVgYPDQGx+FT
         CvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RwbD3gvEWa+hMsrQyvQGMC4eF/bJwAhYBiV4S+/BsuU=;
        b=XVO83LqkJ7rpHbDge9uCuHhdooAejcEcjyvlOVte8vKvESZIQF3aEEv86zMUln/HNU
         b/NTMG3wI5ylbFQKFoKaccUCDzZRDjdyuwOhnKEMV+hPbcCdiD4kBBpUAzSoHw5zcUi9
         rQSsqB+MxiAfeFnTSLqGZak5kFXfOtdCWIMfVqu+CCaaFxowswP+94pEp1hcNTyIxzRv
         uHAb56zP5+8yFO8DCGCo9iRqMCDxrgMFDUtGMbzqVZdmPqbXDx/WthRkG8YJ6pt8tmnl
         ZxUrttwI527eU1PKnrziq5iuF355nTOQ9TIqWRhvCiyXlSOMnw79wwm8Pn6rsSbkhZBv
         Cwww==
X-Gm-Message-State: APjAAAWeH1LTE5nK+DdwA+IMcsHOsDKUhHzPLKjTH1by7L6zOS30+bvR
	NSuQ/AjqdSDgVnf0psebZ/urt8WVE95M45IrXdXD9Evka4fD7g==
X-Google-Smtp-Source: APXvYqzcnA6xnHJUTN7zD+Y/Um0YD0i/IU/jrWhLIuXdM7J0XdG9QPyyy5qyxwzYaiRKbmLnylDZMjtb/dmZt8sCUxs=
X-Received: by 2002:aca:3182:: with SMTP id x124mr3579334oix.170.1579270056529;
 Fri, 17 Jan 2020 06:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20200110161626.31943-1-alex.bennee@linaro.org> <20200110161626.31943-3-alex.bennee@linaro.org>
In-Reply-To: <20200110161626.31943-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 14:07:25 +0000
Message-ID: <CAFEAcA9H8oNBX4QcKjSB3jFqDq==6tr392yEzJwF2Dxnw9EFcw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] tests/tcg: add a vtimer test for aarch64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: awILs5YFe9P0

On Fri, 10 Jan 2020 at 16:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Bug: https://bugs.launchpad.net/bugs/1859021
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/system/vtimer.c         | 80 +++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.softmmu-target |  4 ++
>  2 files changed, 84 insertions(+)
>  create mode 100644 tests/tcg/aarch64/system/vtimer.c
>
> diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system=
/vtimer.c
> new file mode 100644
> index 00000000000..2f6299b5d2c
> --- /dev/null
> +++ b/tests/tcg/aarch64/system/vtimer.c
> @@ -0,0 +1,80 @@
> +/*
> + * Simple Virtual Timer Tests
> + *
> + * Note: kvm-unit-tests has a much more comprehensive exercising of
> + * the timer sub-system. However this test case can tweak _EL2 values
> + * to trigger bugs which can't be done with that.
> + *
> + * Copyright (c) 2020 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <inttypes.h>
> +#include <minilib.h>
> +
> +/* grabbed from Linux */
> +#define __stringify_1(x...) #x
> +#define __stringify(x...)   __stringify_1(x)

Code 'grabbed from Linux' is unlikely to be GPL-2-or-later...

QEMU already has a stringify() macro in compiler.h.

thanks
-- PMM
