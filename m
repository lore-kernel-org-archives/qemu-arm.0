Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp8612551lfk;
        Tue, 23 Nov 2021 04:35:03 -0800 (PST)
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr2719702wmb.114.1637670903734;
        Tue, 23 Nov 2021 04:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637670903; cv=none;
        d=google.com; s=arc-20160816;
        b=hKjnlM1da2VCpKp9adF4o1KdJ9dxQS8ey+11Df1Fa0S+v7Ge1UJ0Mhw3bdW6mRG4/K
         c7Y4rAsiylU4PUK1EhlAxsjAKos2mpWYGufWsm1FM6xk1b7QDB6fFDe4ywRe0r64tzei
         m5djmBr+Tz7XX9Pg9FRbjGwFq17+OCTtbbro4TKhJc/To2jV9nsmHubLZ4Dije/5f0mL
         +2rug0/T1GjVjbbyhnwrNwhW0Qba7s/FxdmRaTh3ZPSaETy7O6KxFx4wv8JbCMhthPRM
         lYInUk5IPhrwAtwgrSHpUz/z+uQE5udkWbi0upWDhMIk3V5sbBmBWWsfLoks32g8nGOb
         Y/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O/Po9GBMwTKKj4W7NuVI3DXT3epe9RRJlNRAzOi9iWw=;
        b=sUdhPJXAE1/f/EkraFBN1TULD7SpZMnfbwXSdXEoBhkcrsVt09ivqizWrwZejCN3QE
         RwUHgq3vz2UD1sCCV3wgpFOmp4IIuzFMz0UcH78uCjCaVfAfRE9rkxONCt5dGE5fLVei
         jh+tJKE07xeKbOz9SMH5cWuiqXmoJOS2A2QgfEJD9N75jxvDsAIlpM6qt3C0v+4gM69u
         qoTH8qFikueV9kObgTE+nw/JalyDJhJIMsjucysK82WBUyNoHoTccy73Vs+C4+d4uaxo
         Az1Tsb3Os2KrUWUA1foEeKEa/NRkSHlDFWwmp3zCa+dDbK2eTbfXRl16nXboKe6i+6LG
         Y/PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kA7nI6wf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f18sor672278wmq.1.2021.11.23.04.35.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Nov 2021 04:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kA7nI6wf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/Po9GBMwTKKj4W7NuVI3DXT3epe9RRJlNRAzOi9iWw=;
        b=kA7nI6wfccDTW0gkZMT8nw4iyBKRjMjxIK5qQOSs1b1+jJe4Vn45CBbJ/15n2ESaAY
         c2+c4c4cSedBmCsxB7zxKhp8q9fbulJw6y/89J8rW8sUUHaUvjdmvsSO9T9MFg57m3eg
         se2veRKhwjhQ+dkiQVK0QRfA8EFrdKriORAlWkWTcVu+oXOf4GCtC4Ew23wviBJ+KbVa
         gZcnt4yLWo4O8h2nVMn9kd0v/b4mjDfJ2SFK0cvoqmTp10xybrstmohj31l+n2PVudyi
         I+0HOqDQ0B92hscm3tnCQdu7urpSbtuvFJfxJy0zNgzOO87vzD0pucWE3VVd2tSMTEBY
         xR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/Po9GBMwTKKj4W7NuVI3DXT3epe9RRJlNRAzOi9iWw=;
        b=hl0BvyH+cGehPzUnWkB/DEAxxftQwkxp2fNbOPg5s0wyMz8qtMI5MOPkLeUreu2l8C
         IZqbFtZecqVNRxfjF3O3rvEMY4In7bxkdqMqw39l2lcodYP6G2Uy53Axzk7BAj8TmeS4
         tFr6zhnpggJcgiep7hMFtXUe35Y2EW/YJBe+/MGyjHXqtjO8WeXw7V6GHbSAnoXRDUd9
         3wD/V+vp3PWM9jL/aVWuRyJHyVUv27gpVGvVTknmtL79vMVq51xe1c9nIHh+hjYFiELJ
         D8zxUI/9cv4iSExxvG6uYu7+n0hjMiRAcDHpXtpuTM5w1ep4cEo40eAUCJXpEeVMTWIE
         AqKw==
X-Gm-Message-State: AOAM531qp4Guk0gEJRiMVvqFRQKHXkPJm5spRVWVl6Jp9yx0I6PkxMZk
	gsKfevlwdMPfxA3anRJLBOvDFddi3X15P6e7YkP4E9iw
X-Google-Smtp-Source: ABdhPJxYOC5J1CEm9KNhTZpZlKiYQbyTxcK/CHKVcWXcMJ4l/UoHi4p74/By7Qv5NSmBMKoF8HFUOiPEnMUt/SfsndY=
X-Received: by 2002:a1c:96:: with SMTP id 144mr2719123wma.126.1637670903375;
 Tue, 23 Nov 2021 04:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20211123122859.22452-1-agraf@csgraf.de>
In-Reply-To: <20211123122859.22452-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Nov 2021 12:34:52 +0000
Message-ID: <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	saar amar <saaramar5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: l+J5diANqbhN

On Tue, 23 Nov 2021 at 12:29, Alexander Graf <agraf@csgraf.de> wrote:
>
> The virt machine has properties to enable MTE and Nested Virtualization
> support. However, its check to ensure the backing accel implementation
> supports it today only looks for KVM and bails out if it finds it.
>
> Extend the checks to HVF as well as it does not support either today.
>
> Reported-by: saar amar <saaramar5@gmail.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Without this check, what happens if you try to enable
both eg virtualization and hvf? Crash, unhelpful error
message, something else?

thanks
-- PMM
