Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2917510ejy;
        Tue, 4 Jul 2023 06:43:20 -0700 (PDT)
X-Received: by 2002:aa7:d882:0:b0:519:b784:b157 with SMTP id u2-20020aa7d882000000b00519b784b157mr9746184edq.12.1688478200444;
        Tue, 04 Jul 2023 06:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688478200; cv=none;
        d=google.com; s=arc-20160816;
        b=jiaJXA6BjvX1qXrIoEBzYdUvKLLpusTpuKJzvXknFSWtNkjM61Tj07e8RISWIJcp48
         QT6mY7SZP1ikJCh8HC7l2AOWYE1gDIbRTi7c4ykpdt5MxDs1wZndxCzjIpKS4TBHmVse
         LvucYiGT4xho4qDUXr9Y1ADkirAZFy26Tz/OnKVrMiVyFsGOGBtiM5j3v9cMpboQENc/
         IHv2eYKAPqJ1fiKQXELhCMdDo810u99POaiSiHqcL81omkV4/9NTkMZV+Aw9C+NdhT+h
         uPgDXrVgdQ6w9vSNQW4So+Jhf1JdvIW2NOOOffaQ7ynH0zTHvpGRq+7pnuZ0XHWknQUe
         RFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g3WKTMbCl14QBI4gfWNbliS4G7A4xV+8OkuzTjE7ap8=;
        fh=xeZpCZUcz5+/LxCyKk6qk6KK9cD4mAsPbYo6D4//XL8=;
        b=z6JQsstyV2G6Mw2uREUS2QzPeuUNwFcYklLFAEVyA3LyjrZ5/YMXFLcBscXwSGJhQG
         EZkEzX/gnOivdrrdnH5ugbdugWqvKWZ+LSt3dl3cqVki3EJbsk0MbzYLIof3OGQV5t+E
         wtwzPjXkOu42OHfznMHa88Warn6BANQfx5LHpThJ1x7QUpCHAVuvxGLEveTfF5ARgJoB
         A/TKhhq3FyouLDBW6MTBnMMIBoKOpfWahUs4ZGQF7hsA5qF2UEKjioWiRhPeOx5VfBZJ
         oGReQgs3pS+yCcRJcGm870X/z3l+FsUeAk74fzGLFHGLE2cVIAf+CHF0b7eP3CaZ1Ven
         iAIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sh5Vs7Pn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t4-20020a50d704000000b0051bf76b8289sor7145144edi.8.2023.07.04.06.43.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Jul 2023 06:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sh5Vs7Pn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688478200; x=1691070200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g3WKTMbCl14QBI4gfWNbliS4G7A4xV+8OkuzTjE7ap8=;
        b=sh5Vs7PntejJsry0A4R2zQ4DT2EVIf7xWN8ismR08/RHQ1QkxRHkh75NM3Dca3BJxF
         xuXZ5EQhrd0rmb+Fb72PcpWuzEShCXeTZoCjxz6HuCiRD2XLRPL0Ece+wj79/WoARsMk
         Y22WVe7LnHlECDfY4nFtY4tjCGpi5dNqGZU93SoXL7Q/D/ZnHI2AsMTVR4xcqU7Ski5o
         H9SdNDe4NwxSaLOIfh7/9xWhKFu3jhgNSeNvoMxAMJUHQOs5kC7GK53US/gJmNlaZAa0
         7kYrQN/NTyONxHPiF0Uy/DhOxGo2GkrmmSiDowcJ9lk5iARth7yIxSj8sMau+bb7wWOP
         ASTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478200; x=1691070200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3WKTMbCl14QBI4gfWNbliS4G7A4xV+8OkuzTjE7ap8=;
        b=czI1xdrNXlyTU4o+iBWPoHhPQqo7nCWA+/M81m3DNjm15Mdl7Je++k6LsuULUUUOd2
         hOW8TuFT5PA9wLWnw4WyXbrg/SozOuhyYoTFFa/E/UHb5UrH1udgJCqCrefggoKdmdyA
         dzqM41pFFm4nlgo94QGfNekrqql2fwKSfKAl7cLuKCEYeAJtIu/UgyLyvBaegjCZtcOS
         d5TfWDfuxbAXKqMkH+YcGbClYjSVf1k3M9+UEmMJcJVC25w0DoM+akNd8OsgJgDeONI5
         hbp/ZGEtXFDqjBKF1myI8DWvCHhtwTHDn7LUHHkWKUEYnUIatqjNQqiodyGmnIxLuDJc
         VN3Q==
X-Gm-Message-State: ABy/qLaLEsMmAwi4hwyba1IoMV6JE+GU9oOZP+4vvCZn58UQeqm/mJiu
	xLZ1HNYWVxl8SZokN1LSMtE2mqv1HE1tjssqa3EClqJ6
X-Google-Smtp-Source: APBJJlEcuLKTcNJ6WlGFZWIo0jTMJlh0p2VQSpCg8vaMmBhaHP8NtzF+wF7X13zsZGd0F/7QcAXBPrnc4xVfGh+hNjU=
X-Received: by 2002:a05:6402:b28:b0:51d:d5f2:121e with SMTP id
 bo8-20020a0564020b2800b0051dd5f2121emr10860178edb.5.1688478200125; Tue, 04
 Jul 2023 06:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230609172324.982888-1-aaron@os.amperecomputing.com> <20230609172324.982888-9-aaron@os.amperecomputing.com>
In-Reply-To: <20230609172324.982888-9-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 14:43:09 +0100
Message-ID: <CAFEAcA_j+3VJ4Ldbo5zf8mJfXTfHC26x8a6YnMbQCRTy45_qAA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] target/arm: Add CPU property for QARMA3, enable
 FPACCombined by default
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: aTk9FWzJ6MnG

On Fri, 9 Jun 2023 at 18:24, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h   |  1 +
>  target/arm/cpu64.c | 48 +++++++++++++++++++++++++++++++---------------
>  2 files changed, 34 insertions(+), 15 deletions(-)

This patch also got RTH's reviewed-by tag in the "v3 from March"
version and didn't change subsequently:
https://lore.kernel.org/qemu-devel/20230322202541.1404058-9-aaron@os.amperecomputing.com/

So:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

thanks
-- PMM
