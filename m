Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2307599ejb;
        Tue, 30 May 2023 09:45:36 -0700 (PDT)
X-Received: by 2002:a05:6512:15d:b0:4eb:1048:1285 with SMTP id m29-20020a056512015d00b004eb10481285mr1140548lfo.47.1685465135801;
        Tue, 30 May 2023 09:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685465135; cv=none;
        d=google.com; s=arc-20160816;
        b=wVFuMpMYrjlOTubMsndIQ9jgy1+6TpDU0FQ70AeFYyXUOrvksBWyy0tCYB4iX9gO9b
         qQ2tUjgBgiwg0NxFY7klawIhRAg4C7QCLbQRunxmMPdjP5jBGnr1WD8y/vDoSf4iaAF/
         UJBwysqbAvdy+TO94L+vvaXeukS41nadVbDXrgkvFAHbRgs5PTUsxl29z2LhlT3R1Tmv
         A5+uYfkyKX2IA6x3UqZ52EtOKH40F0/rCPOWAEGlDW5U+960T76OA3kJa/pIkLpZeaQk
         HTOytKpmgI2FjCy2WqsUKWbKH2Og0To1syYIXaNyP49BFhv5uVvFdbk4DonyfWfJdNz2
         Djig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U9OoVmtBtifVAPYAGHIqRc0QgCbKza8ZHU5d3UDetPw=;
        b=ZihawKv9w9/m3xxRP7ne6ony0wd1erD90mXfFaMAIHG/OUZV7ZjYUwhnoS7s+7OTa/
         0rp52xJItWFJ1s3zyL2u9se+tPFY6/DpW5dcuDEYoNsz01CtDXW/GH3otwIgGCSMiXm3
         kYvt3ntSM8V8VjN0l0pL9FLFVD8ga5dVGHkq1R8/gk82uHnQ8Oo8wu6nR7Zi3DRNfRPV
         CDoSinVruu2zKss8CZmYdlhAjyT4MlC4JN1sz9nZfnSuGEARvo3oL51V32LcrORuwlxk
         6T6FWiWH8Om0S0++5blnrrrb+MqdjmYY20dEviTzfKSF/BLWVWzOnJ2pAYf4ilguLoEW
         n6yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmA+yJ6g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v25-20020a50a459000000b0050ccd833775sor4002505edb.2.2023.05.30.09.45.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 May 2023 09:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmA+yJ6g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685465135; x=1688057135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9OoVmtBtifVAPYAGHIqRc0QgCbKza8ZHU5d3UDetPw=;
        b=XmA+yJ6gkyDQtrUJg+tIBnvEuJDXtaltHae3LjbK493BdUh2tEFzAxoerRlItgqNoW
         NCYwdk/ndwroxqKPRjejTNTG8DpXqH85oFGwxohVD5riCD4m1dSXm0XwgRb7Tml1qhBP
         QfA5JQwguxguE6Isq5mN8ZlAZBG4qhBpikIPqjt3Vgxl287pdTmWyQtDkfEVHZQT+TkX
         H8vNXvNncP9RqLxuH1l8ZosWfJAaE8+0GhclHPIffW7aVWFELUoHRmN+DaNSerACFCtW
         BH3/ra2NQtRBv8PN4tsa2nToxOZm+GmZbH9V9IOhBvMubW3/BmHvbBj7HPtc7m+7MAAZ
         JL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465135; x=1688057135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9OoVmtBtifVAPYAGHIqRc0QgCbKza8ZHU5d3UDetPw=;
        b=Wn5G+1SKSqu8QGbbPrC5EsERmw17DmnPQaLif0ldDiPM698q5LdHWsWORlq+PYUeS5
         Jr98uj2ku2nGEyofj2hnrf1PrP/+yHcNEp9ZNfsRoYdPx9/YZ024w4phDgyp0GVyIdM9
         xcN5YvK+Sd77/9X9dEVJdSN6+0E1cmvZP9q6/TVEzo0vCV+rOiIYsAG1Xr4tJ29szQwh
         IuxwU58MglTy6/s9+n33ML4A57H+nrSgDCxYeRrRkqwRXpuXv7e2x8nrJ9evelb/R+4G
         78H5y3PWDdargbMwhh7ofOorF6ujFHx8ALyKTSkOqK0mv3VAQNTq0unkgkG9kh+lW1MI
         oyXw==
X-Gm-Message-State: AC+VfDxRctjb5SbmK8FxbeV6v45uxy61S3uXreCIJLgMJB6bnGteAlST
	LH8DjWDiozjZKnX0wPMDtwG+MAHAimU7zdiLTW2Cu2kX
X-Google-Smtp-Source: ACHHUZ7TERjs//ikShUkljz4dhSu5wn4zN09q3RO4LOjTbUYSeq61GbNT97Na1QbkLo5/eaB5sHqJS118px5XPIadMY=
X-Received: by 2002:a05:6402:7cd:b0:504:b6a6:cbe0 with SMTP id
 u13-20020a05640207cd00b00504b6a6cbe0mr1956712edy.12.1685465135479; Tue, 30
 May 2023 09:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230530135204.2903761-1-ardb@kernel.org>
In-Reply-To: <20230530135204.2903761-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 17:45:24 +0100
Message-ID: <CAFEAcA-RwXQWx4RhMhWk_xQLsJ0a1+MDKDXyKHdCmguqsuNKzQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES instructions
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: kqUKmi1TdQgX

On Tue, 30 May 2023 at 14:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> ARM intrinsics for AES deviate from the x86 ones in the way they cover
> the different stages of each round, and so mapping one to the other is
> not entirely straight-forward. However, with a bit of care, we can still
> use the x86 ones to emulate the ARM ones, which makes them constant time
> (which is an important property in crypto) and substantially more
> efficient.

Do you have examples of workloads and speedups obtained,
by the way?

thanks
-- PMM
