Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp86322njb;
        Mon, 17 Feb 2025 06:56:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtPgcVXVpfNBL7wiqEjSIzQOpxRLzOqeR/wKsE1igWVt+R35jgJ9o2meu1WlzRi2QAxx0RQO2lWgpLZw==@linaro.org
X-Received: by 2002:a05:6902:986:b0:e5b:423f:3293 with SMTP id 3f1490d57ef6-e5dc906a7f9mr8194495276.24.1739804163373;
        Mon, 17 Feb 2025 06:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739804163; cv=none;
        d=google.com; s=arc-20240605;
        b=AbefYT4pNIJoZXUBhhy8G5KsnoV0YIzx16v2LrlW8KN6aYScJD1bQRIhklhwBbYut5
         7ImhwrUOYoArngsnz/EyhQjpxMkcW/y5h4FCiVNGNS7TW4eQeqI+tW09Ar7nSDiDw9U3
         +Pi00RaV0ZESjNr5m0LJ3Hwq2rvq7j9PehZLbGQA3MuyPbldoZsE3Krbhvp3esf1N6xn
         xg4fQ7P3OJbC8r8FSDQst8BHAzjUl75WI3EcWDfAZtcq81M9iKanWLje/k5PqlLXNgBo
         Y7MNYQa1W7pBNTMt7RcViKT9E25WTKvYyT5hw1p6IbdSEE/0xL8Br2FKaqPAlOGdj9kH
         zDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nBLALD+Vb9oUFnI6jxhdOaCAb498OH9AuKZBWSRaGLI=;
        fh=9qlZhV5595+GWGxz2AtPxkRQfGK8iHHsPUB4snV1WQ4=;
        b=BsH7/2NCZGXBHmoFRyFLiJDVFV7HboSdwvpeBIEKaQFYHytyEtWMUgyRJSWm1Fj8Rx
         +5bESyurjAZ2ZkPStuZMwFNp6kDLbR6M/PFQWXNvYtJzvkz/oKk3jjlVALD3ApOkLkiE
         M5gJlBTLuVfJkGQgNNqHnx+lWPYFM8RoehjokWwUO5eOKMHR857RTquGV0Coyx6waJ9P
         ndHRURbJRUod/r5akQ0xxRwXtXFgLGqu7IZVgQKb9NytzsBeq1AxDkLnNqTLAyqOOFhH
         GAfvXfuk6I8/6gw2BTGiFdfW2lMGjV86vPfx7XMU+Xvoc1KQTNsrjDmyqWU8PJgSRw+y
         VdiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ri9Dp0TS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae0e5dcesor5073234276.13.2025.02.17.06.56.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:56:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ri9Dp0TS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739804163; x=1740408963; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBLALD+Vb9oUFnI6jxhdOaCAb498OH9AuKZBWSRaGLI=;
        b=Ri9Dp0TSUCEFvpXKsNVR9bjyTTyv9ZYts0dFDiuCsj09vdOyf8hTYjanhbP9zPszTa
         XXaGm/BAVyY4KjmTdedfTVmWsjsOU3MpGrlDJ347Wtdsk+6FaAVmgsvz6K4DfVFlwlnS
         T4NBLbSj1p3ZVf7ebUVXkuCf/XNPJ2pDTWi3wSDorhG8zD7xnrba/B2KV/HMTIl/Kjng
         5wew9pJXZQgdcD+PwtA94qzx9Lif9/K/1uc8moIOIEIVGLU4fvLkMaEpJft6OJq3YipJ
         bCuF5/0Gp1ylpyKCBVxUBlFuSvzgE+c+cxEcg5pFOO1XMJAIJVM0afG8bt+EsnegyZig
         17eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804163; x=1740408963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBLALD+Vb9oUFnI6jxhdOaCAb498OH9AuKZBWSRaGLI=;
        b=NewHoercHuYCYoH2caZD2qzI3cfxPeckvcpAi1w9dxUvTRLwmnR/UZEKOmtAB83F6P
         hmpNEUIiyIe0gbOU8OxtD6vlDNfF8gwr8ClC1KjAdb50a+M0zydCwgHwdTrk7ipqopC3
         maZvvY9NpzOTJP/gizhkSYyIe0maQ6Vc7UeTbcrsvhNL34ohD7WhaZKbezfWSg7ZNHQQ
         Lm7S2eMAw9Pw9N+9/e+IwOFQ1elwgSYG5TetHw7n2HuEUPcjMF6WZYjp8jASkUlsKfEc
         z+D72TNeShyRYk4iHQO+QAbVu4Zt07Scx+M/udLkADV0sAabJ5WAax3xwlgB8X3TJce9
         otvg==
X-Forwarded-Encrypted: i=1; AJvYcCVuM2USxCmdrAA7b7uJrAiuuP+Qa8THcjWD50qzAp2+r8wQy7Ox03FXFS+b9RtnbL6TySgMpckh8Uyx9Q==@linaro.org
X-Gm-Message-State: AOJu0Yx0PJy89j5DWawaB2qECaoxrHi6nGy9dWWrZCjxwMniWf8tnhKy
	Hfzzdg0Ax/+UV2MEVhs8AjiChwQcG2a1Pam0dluOm04WiyUiNSxS5wYdtJnPSPIN7Jlgt7laVfR
	8KFXv4IXuoYdZwCgZwoZ5bAExGgUPMS0RHuI6L/3M
X-Gm-Gg: ASbGncvM3voqScIFGlZss86dyuCxfrUx7ImA4LnaxwHE58a6vXVASUdYlSja0+QON26
	IwQlpL0PGaUrRaeaqdgEaHuVDj4LSwtuUkN4oEeKqhES1Nx1vz7wcCJ2oNXJ9FVVazMDabd4p4A
	==
X-Google-Smtp-Source: AGHT+IHAlkWzeNzuLUhA1y7FYrX6rGdyfcIx/ns8YODDckg2FymVQA+cZAhoW8UjG4wNJGxOxcJ6QDegiUJOsUyILD0=
X-Received: by 2002:a05:6902:108e:b0:e5a:c5d6:3948 with SMTP id
 3f1490d57ef6-e5dc8f4bbfcmr7511987276.0.1739804163015; Mon, 17 Feb 2025
 06:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org>
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:55:51 +0000
X-Gm-Features: AWEUYZmE9Bg7EEVe-jdyUElUT8HIfLpU1M_vFyLsUVBaz9WtLZSLFg5UREGxAeY
Message-ID: <CAFEAcA8PYv3-JX66THwj-mDM0es6V5gVVWJsHTqkd9wTEVor4A@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: KFdznHx5AJr3

On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi,
>
> This series add support for (async) FIFO on the transmit path
> of the PL011 UART.
>

Applied to target-arm.next, thanks (with a couple of minor
tweaks to two of the patches).

-- PMM
