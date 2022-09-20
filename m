Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1833381ejy;
        Tue, 20 Sep 2022 07:45:10 -0700 (PDT)
X-Received: by 2002:aa7:c61a:0:b0:44e:7d1d:7814 with SMTP id h26-20020aa7c61a000000b0044e7d1d7814mr20040380edq.44.1663685110890;
        Tue, 20 Sep 2022 07:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663685110; cv=none;
        d=google.com; s=arc-20160816;
        b=ahV6EbE/h4qGTlbh0hZRS/bvZlPeRj4B1iafrRz9ZyjE+c4/1xSQXu0C9SoXZdrVjP
         St0581s5Uow4EGljw97h7C16wcpBhEdmbfRBnjMMZc3MqANjTPpuZPYBbN6jbSPaXZi5
         LXbx/adWx7NokCXRnFdR5MxxlZoCBOLv1qkBFqnYsqSGsWb5UX4dCNK6kOsWCrEr62qC
         mgr07c8aRv1DhB3eB23BR0dB8UPuA+B4srwDXLjCNCUZQdtoxemwNvbuLNPQU/j5nbmI
         45JFQbC/17qKCuJ4IfLPNX1FSz3VJyeuqQi1bcGI2tAfgnE17+cIUQMx/1V9DLObxnJF
         LAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jxPnUpNOpVa2Yo4/zoa8595clQwIG4y1zhTPiPgm1M=;
        b=amdGSN/rorwb8c2UZP5MSNr5NodZMXtvKPeBWX+0TE5I1+3iJ4ftmaogl3F9L8CjXg
         zOCpHSk/zBxSUC6VAm/jgZykg5sdWGue19tCrGeWBr7WVIxgMP1xtPgE8EqWm8lF88Hw
         nivVqVYM+i9nOQOF5mkSdxuiwmywtQkMkXQI6uLdvVflRIcRqcOx9Zg7ewTjWuUL2t1T
         7dHa24YyL+ImGDbn6AGVCaQ38//N/YPiDgbdAQlvRjA4tH7Hell9rYT6lc99HWMJ3zXW
         TBzj1Dk4Bu5drSQiZMtKIM348rnz5UXcvr/QDWeWgfn8mEpvdwaRTE5VMP3ZYwZeE3w7
         qI1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNDdzYdo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e6-20020a170906044600b007314a005592sor818742eja.117.2022.09.20.07.45.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNDdzYdo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4jxPnUpNOpVa2Yo4/zoa8595clQwIG4y1zhTPiPgm1M=;
        b=rNDdzYdoZgRgh+aXmqVv9qUsSaSMMz/0wwzjOzj6VjpdBwXlXd6ijEouVRlcE2ij0V
         61SrzLjewFrntCpR9N75FmYRyMkS50x0Pim/0lIg/MtC4Q/eUv2W515b9kszEJQUNI4u
         HyxkrRxv4ksUqIgZ4tX6cVovt3x/ELftSv787I3eacCdqiVDI2E88cmIgQIfMROZpx4t
         ABw+A9wN6zzo5Q6R+uvisA1QS/0y430qFg44jLGu3Tyv23NHyIPK7xtgK3VSL6lSLN+4
         RLJ9SBvI1VaMhFGlh6sr/nasN100zH676o+f2BA2rnZ70ifqoMkuTP5GF0lu4hfVt2/b
         1AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4jxPnUpNOpVa2Yo4/zoa8595clQwIG4y1zhTPiPgm1M=;
        b=zbZsnHk04dfyhaOniDdCAGh4wC+MldF8ivDTFklwItgH0TR1t5UKW80F5rLbIF/PMx
         qHIx3qmUxQLrpHQO1vnT+Ld6AJIVrU7Am8F55KdLvR00zER2EH/1ApLoB4m0rJUH65I8
         zviCer26nvwekG8IxPOkOl7SVIaPR2nxci7SqRXJ2qi9SdzdEZZTQFCR1EFpsRA/UP10
         5HLtXwJfIHJz2/uz6fqdojvFTDIwU360g/JVPK1LjwA9zqLgjAypZ9oDe76TzFeSckuj
         XmTC6knK/GtZH9rYZ3vXDM1yedO5ufXmi0PC5P7uNTTttN2o5rIl9xYSfaF6NtQX4cfz
         UCPw==
X-Gm-Message-State: ACrzQf1UYANe8b+dLjTDnLwwwyKjFoWRw4+JdRfQtGMxlkgH0O+9+2co
	8d9V2o+qX/Vmn6xOXk+vwcfrpf5kUfbRoI0VcdeXpFDw
X-Google-Smtp-Source: AMsMyM5UKW7WyQnRDRX6sUEr1sxJLVVbtwbn9mUzrFg7NBETnXx/1kz7xsfaj7MaEyTl+Mk9ByyOrjKo9HrWONMVgCI=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16707897ejc.619.1663685110645; Tue, 20
 Sep 2022 07:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-14-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:44:58 +0100
Message-ID: <CAFEAcA9PYtEbWJqxQh-Hz-xdHEeNGi2k6kfcgy4sRSjb0Ug5mA@mail.gmail.com>
Subject: Re: [PATCH v2 13/66] target/arm: Add is_secure parameter to get_phys_addr_v5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 40lEPNUo5kYK

On Mon, 22 Aug 2022 at 16:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_v5,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
