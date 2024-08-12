Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp836768njh;
        Mon, 12 Aug 2024 09:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMRFAY0axpdS6ktNHMQa3KNaHzCz47PGhK89AmXPYi5HMBZFq43zb3JpI9hOcT/oiluqYY7K30b8j0fqMiWl5R83OQd+50
X-Received: by 2002:a05:6402:430b:b0:5a1:1740:33cc with SMTP id 4fb4d7f45d1cf-5bd44c0e074mr678696a12.3.1723479064683;
        Mon, 12 Aug 2024 09:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723479064; cv=none;
        d=google.com; s=arc-20160816;
        b=hgXQqBKYPV+qeR/7Oss+Fr83gB6L5554ft6RYUtAAgfeXFjK5xFhJWl0movHLaAgcn
         xDFpOvGP3nUzC3tPW6tMPA5+I413Jpe3bG7dllCk467sxzyZ9z6qFVFqKel50B3cZZNU
         V1KpmgVugfhWPyNMWxSXK7tKR0PuZuHkoCxm5t1MX08rBI48jw74mY0RUcrZgG29nPPC
         fq1iPK1RgVKhx0RTbQ695PkUkF5N6DpsefrKqNxu7/0aZbUN1SAfmz1NMLA9GVdKlgUS
         eznzKILqTXQNtPYSMlOic+UQC7hm59bp2htx/hkz4fbLS1DhXt0J9a2k6MWnqq3E42X7
         XSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hc2w2iG3UkYhVLoPpMdoBTiz2g2dRwmzU8ANaYcF6Xk=;
        fh=Obuyz2V4TH1loAPocJY8d75VMiWgym8k6sBMrcvrnaA=;
        b=0cI2xYAPHiF4von/ecDhm1sMvEQtqpw3usw/seBNg13JS+sUm2D4kCmnUvdYifeo3h
         W1Ch/J0H9wDDb9Nv8KyN0DgHwCJyAqt48FnRuIQkqcNbGOEb+d/pUPxjH4/2lzck42pt
         Xmx2hcc2l2L2up3eIyFSKM1lCvUqQd5t8bBsVfrJTmmP5b+OgXUXv5gqJgwR+U3h8TEr
         AZfqVWVnu8XiuWsoWHlZMtmOA8bmB6nLZkBFGpjiylZ6AEHoevUg39FT4ibLe5KMK0NJ
         qX3X/HALbEBOGt2hV328qqZeSfNEl91ItuJhIDtwAQ6mzxJKl20JbRTNpk53R7iKSvkr
         sQEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yvEeSIw3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5bd1a5e039dsor940924a12.11.2024.08.12.09.11.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2024 09:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yvEeSIw3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723479064; x=1724083864; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hc2w2iG3UkYhVLoPpMdoBTiz2g2dRwmzU8ANaYcF6Xk=;
        b=yvEeSIw36y3kKjNJ9d7YjAHIabzRZsMWvA5e3yEn8MAsc04wL26ttDWJAUufRulXAV
         FE2eHTGmxYG6is6Ueu2xYgj1aWBMMIIwY0hBqfMsoO7TxLGNmQpQtr5FAj+eEp1qa7+I
         ntvrbSwgknexsK6I5lc2k/IUAJwmVFH4FiqmdtFAleSau+pajxEyZYYpAon2RvnkerGB
         BjI+WGKJUTgjvaIDtU2bG1tKiaS5DcHi5zbShlrMVhisNb4MGrRxIJkOsLoLFcUNYPBi
         5mS1SNuj0AvY5ItYhTMFnlNDUaYOEG0almbHY3+heLxMqLQoKJAedx8Xz8QJJX6szaAh
         ElEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723479064; x=1724083864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc2w2iG3UkYhVLoPpMdoBTiz2g2dRwmzU8ANaYcF6Xk=;
        b=EXxC+e7CJbs6d0LxpoyLDGFTtVv9Yuy8MX4/zg2dBAX8n5OUZbED1D61Wxwx6/HgWn
         rGu0OHvv4gqarOFTcRQwWib4L4QcK04qEWDEX9LxMKE1Axs9aZFL5AKUofT3O8lyAALM
         KOJTKDq3a3T2AFD+lW+hh472GPFo6kmkAn/tSNOtYnprSoXeU1D4IMpdvZw5Z3jyeOky
         xUm1ISViwD+lqSuethzuAGJ/e8wvpZk/8tFAs1adUjjGerlqBMqkE+pvPqnikhcqqoKE
         Lvw+RolxZ9VtGJjOhi181zyx1rbgLp+s0YzkB6swoYZoBXkeXSev+wHwuwNt5aycTvUl
         Q6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXnfzD0dh3HFceLdjF+7kQRdK1L2KmRvoDH7JVazqN2qAEcoK4GF2uxlNWt8gUHxCOECoZou21SAV3tH8yxoFhlpyyH+rdK
X-Gm-Message-State: AOJu0YxvRhVZYKwT4ueiJbbj9Qm/k1CInnODTlu81mIhwW/lhfhFJuPq
	cU7OWZlut9RafNneAFSlCTNS2j3nFUX3HohloFAP/ezrJ0TCFYxlxxqq79Q1E7zB0PVQOwimqAk
	0FEvdpDcrP57iAky00Lg7Uz7a7OCPDEmVJ3wlo+M+
X-Google-Smtp-Source: AGHT+IHeat9FGu2yrOpeIJKQ2r/Iw6e1bIiFXGUhMt4NvKuKKf4PUsiYouEZk1AV8p5Euo3QiRIHOushkEDwroMtTRM=
X-Received: by 2002:a05:6402:51cd:b0:5af:37c0:b5bc with SMTP id
 4fb4d7f45d1cf-5bd44c6a631mr509650a12.28.1723479063876; Mon, 12 Aug 2024
 09:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 17:10:52 +0100
Message-ID: <CAFEAcA9tUW0DHHOuGJ4sUxu12JMLUMxqW=_9oUHKiiRTenZwKw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/23] NXP i.MX RT595, ARM SVD and device model unit tests
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: Oc2MjF2kgNNv

On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
> It also introduces unit tests for device models. To allow accessing
> registers from unit tests a system bus mock is created. The main
> advantage of unit tests for device models over QTest is that device
> models can be tested in isolation and do not require a full qemu
> machine.

On the other hand the disadvantage is that you need to add a
bunch of extra code to mock the interfaces that the device
connects to, and then you compile into the test binary a
subset of C files which weren't written with the expectation
that they got compiled into tests like that, so it feels a
bit brittle. The nice thing about qtest is that it doesn't
need you to do any of that -- you just run the QEMU machine
model and prod the devices it already has.

Do you have examples in this series of tests which you
were able to write with this unit test setup that you
wouldn't have been able to write equivalents of with the
qtest framework ?

thanks
-- PMM
