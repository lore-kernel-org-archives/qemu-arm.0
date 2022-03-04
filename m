Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1506655lfo;
        Fri, 4 Mar 2022 03:53:25 -0800 (PST)
X-Received: by 2002:a5b:ed1:0:b0:628:9a0d:c10f with SMTP id a17-20020a5b0ed1000000b006289a0dc10fmr12374942ybs.438.1646394805798;
        Fri, 04 Mar 2022 03:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646394805; cv=none;
        d=google.com; s=arc-20160816;
        b=WFpecTR+iS2yYa4ezwHJyA5m7ZQaYswqd4sAH9OELhJb3X2H29hJQpoWhKScmFDUh8
         Uq74Phbn7dz/gkLma76YyBmLgrFJfeUU/XoJLhFnnPhqHHvgP2g6lRdEwDtYMH+Xhpco
         CAfzObMM20nKPKdSnQWzeh4p3ebTPn/ZEVE5AKiS/kvzbwbqDQFEc9CSLXBZQnY2b+bo
         ZDy9d++KGUoGb1O5k63CH4gP6UF6PCbNNVyCqxGQivCdMyc59s7zmNjzPo8vf3Z6/pl8
         hQJl0sVTI2/ZU8poUcoR06CbB/xKdpgHTrLiENu/JnuIgZttNjpIfnqZsK9QIEDd/XtW
         G/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gLIvz9QKtJ7n1hgwuOlCbujSVYqtQLwekK7mffqhgsk=;
        b=No2Q7vWVq0GjVYUPbvVczfDM0raUL+j6QFxILUfAGh6REqLQJcpo3Kr5mtTsDP8efO
         oY9I6B23oe6HQ+1+QqLUSP930g30LOSco3PXvR0CdbVPi8uReSlNXwlDpf8zr5pXNVG2
         AZ6xofe40CpxCPHJ6I4kF0pj/mNVAXKffUQCu6DOP/mxdejYRygWJ8ySTedsoVxvuWB4
         +8Ti6f/Ar1hAzGHbLy90EIYtRRAoLMSB7pOAMXg0yEyb/3HSl/0VZgIFB5zOLKXSuF+D
         9sTsCHeU0MPvYoTS138+NCLNU/Gfd7vuLKW4+72Jlrv1pa9WUYksSHlIMstiVfWN25Jz
         DfTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCZ+ubJr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x10-20020a81d20a000000b002dbd055e2c9sor588454ywi.74.2022.03.04.03.53.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Mar 2022 03:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCZ+ubJr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLIvz9QKtJ7n1hgwuOlCbujSVYqtQLwekK7mffqhgsk=;
        b=TCZ+ubJrG6Qf91DOpA2iKiOHVfhKfGAMx5VBZpjhi9PsSTgkYZf/4Po2az1xYkSLUT
         1chOVFEDTbcfLKdxJS6jULyPkvw094lqVfb68iYhhXpDWkHwA7AzIPICIkx+Zv93Tdy5
         ftUJYi74yj2AETC3vHdediIr4Eda2mFJZBb8osskC7xj6knD9lmn0bmi5NGaiaITn9OI
         /o3bx6LCYDYcovQ3lBlU40QvAeFipYn9Q1v7XO43HAMMW6APshQhCAjJpEolaXiaoqyB
         VAUQAZauddDVKJqpOFrZV+t0Fe3MgvLUtGN+9tYoHowIuVNwnhkcxRE6rSw5Hmwwsx2N
         tUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLIvz9QKtJ7n1hgwuOlCbujSVYqtQLwekK7mffqhgsk=;
        b=Q7+HkvNrnm+zzC22PNLjGE7zJcZdndKkBWWC2tTY1GtbrIJ6oFGFAu4kC55JP/CxEk
         U4p9JZ4DZlAeN3U3uHs/QEfaCUrhS2CxWshO7tP2sIsMZ26j2/4i+uAtJH+yWkTvGCiE
         v+J2TG9r4gJxO4V9zKD4bGGixUUtHH3/dcSSnzGKc/WjuGZ3EMG8w4t28v9QeUMi77fw
         4mfL6ysEEztX3yLEK+xxtS/qy3P7JuZkzjoBdtSDL42jvwyhakIFpVxqaZAJacgb1eAU
         g6YyO+IVrQEOSYMk24DmkzrQvKrRLv+rbpq6vrjDBpPv8FyPRnfUqBXPWbF1CQYN+l82
         kbYw==
X-Gm-Message-State: AOAM530jwwZ0OnEprUGj7Sr7k5VZO2tTgSmP+nifiIYX6n7UIqcxEUjN
	44pRTOn6Hs8uHRfa2buQx6BIDkc1B0U+2CNDxaYyGtrB
X-Google-Smtp-Source: ABdhPJwaxnQuz8GdwqyeENQqwuhdTr8/NERdEBFE2DJ0DoQyvgJDRmR4KULmvpGPJjkLtO83yXaWwR1cipTAHyNZEiU=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr15890394ywl.455.1646394804847; Fri, 04
 Mar 2022 03:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org> <20220301215958.157011-18-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 11:53:13 +0000
Message-ID: <CAFEAcA9_z2RB0xvKWzSVQqopZ2-QCY-2GtQ5ES70vPApQ-KN_A@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] target/arm: Provide cpu property for controling FEAT_LPA2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5+AMa4jZOu2s

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is a Linux kernel bug present until v5.12 that prevents
> booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
> the feature to be disabled from -cpu max.
>
> Since this kernel bug is present in the Fedora 31 image that
> we test in avocado, disable lpa2 on the command-line.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
