Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp69417njb;
        Mon, 17 Feb 2025 06:27:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmmuEM+9yTWjrxLNoScreWLEn9mb0DUrTpMluV0VGkZC1Vg//wb0lLpWOX2jE7eCYK20jIGno626Q+5g==@linaro.org
X-Received: by 2002:a05:6902:2e09:b0:e5d:b5f3:abc4 with SMTP id 3f1490d57ef6-e5dc9049993mr7414709276.17.1739802455611;
        Mon, 17 Feb 2025 06:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739802455; cv=none;
        d=google.com; s=arc-20240605;
        b=JARcHGZ4ivv+o8BS0IKTpBnG+XhpEu1gXQ8BDykXUfGVp6q7k/QaIlUBhesYcfQMSX
         I83SiQL4TOV5yFxfdA3PFglHnXEUS24yT2unIUT7fQhOt1tOKHvqQjcrCvWJYYX6q5W0
         AZIWBFtTuG61kFp4YORQGfG2mOPsrKsZnSFiOpa4b/08INL0f3yr4tUmnQBTx7l+5hP9
         kn2eQ9B4d4cKjkKtsdavN4BfX7JIGuscCgHy51/v+WMOg8DSs+vLNqZLsED6t0sKaUn6
         s4F5WyyKg5Kd7Mm2N9hMWCtaVJblkeP5OyQVvmYgF3oWXP+VuOkpxyS6J8aqWMSdcH2j
         b7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZxiwDJ1qW5vdcxFmENcGV/lROpT347z1Pr9uK/v9y00=;
        fh=6K7LvbH3cf+EWLx6nFOO3Edbzzqlab2CRZhO7TBT/DM=;
        b=ZrciV42+D/vFnLk1zwmt62AQZFlXX9Gq/5yHi/VHKl5kbrcAl2g7UAkDCx/jCYR2LJ
         pHzPtUN10kOfZ7aFuhcf89OR1UILRx2GDskGD859pLB8nV1g4/T7QjwIM+e8frNf83a8
         MsoRoTH+ZyF6d5VMCJCNnhZb9Q831LhmSrQ9j1OtFxJBEJYXb6OtNB42KE/Mpo1C796l
         e/75Pc+F6Npu78sI1IKLy/LoVbUpMpMayXluyb9Pzx2HTCw3UBf7gPzcFHbF3UJfMIuA
         8mvUZRe1N4yNliyVWXVM9umKWA8FrzVVdDzzqhhesEA2tVsbJMIX8gHYBAmW3L4ML9Ov
         52gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMhLS9qR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae13ddffsor4917820276.15.2025.02.17.06.27.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMhLS9qR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739802455; x=1740407255; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxiwDJ1qW5vdcxFmENcGV/lROpT347z1Pr9uK/v9y00=;
        b=AMhLS9qRr3j1inuv23SZe+7z88A/ijtX5ujUjmkdoR8+K3vr4WOm3TTR9IkIrMWdvW
         TfrBo8B1Nkb1booNyOYI1r++3r1N/CwPq+jfygB/Wvq31usV98e5faSkkpb7jm86olyy
         Mn1S4QDF8XBt6ddWuUiVq/VTYF2RAbnBtidwXj7srsZ8Q5M8rFpxWSBDti1AvjwXoJqn
         CpM13AxDI4HFK8XIYJW83Wqus64EMTNWRIMTtT2gdN4yKPRsFqroxVY9Ak+UaKBNC5fX
         UhsbjA+b8/OYSeQ/gPkv0pzah6QWFg8bq5nZFO1FxnpTXitzA+8zA+X1ER74DZi44DPG
         ZQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802455; x=1740407255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxiwDJ1qW5vdcxFmENcGV/lROpT347z1Pr9uK/v9y00=;
        b=jfSLN0vgxdXakMTMHtLu2CqbD4IoDc1pmzMCbEgzhzizcdPyZG2ByxWZJCsUYOBgox
         UYZuZHuQ1VLK9TM2Yr73t1BckkWIhk4b/WrK2Lv+UAnwc8S4HI0yvmvtmQnFN5Rtdtkd
         sdUh8lqmuxPNkP/GmW6CvK65V0SglFFSCWReDbXJFoRdd7n0hWEGS298H/Umz/XmDz3k
         FwuzkMYk65r66WS1Ke7YYgnvD22LtGbyoRWdSQV23f6ga3qNZAJdlVJqyCisdcGxV2AG
         WGbZ8HUDsXmFa5FwNolg/WKpRcKxTrdO0KI4ZNxMI56y/PDtg+IhVJCnBpWpD6+2Zmu9
         UmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg6tHm2zUGxBl1v6t84l3uvQCbw1K4m1YnxepO3LR9q0sXQx7A/F9STRVdJd3PPuUKvApPMbdWVsQWGA==@linaro.org
X-Gm-Message-State: AOJu0YyeGjMg55hXGWHMiSJRI1C36Wz0TQG4uqbKPrnnxTpUnaM85RkJ
	GwNBnq+GrskloHI3JxN+//2zcGVErZ7sKlr9EksqpImWkt2DWrtPpZXgtx3hpLBuXcrvSQJA9QK
	2q/4gX+G2csal7Zh2DKp6ez2/Wi2t9GvqWRgJOcao
X-Gm-Gg: ASbGnctAzNIxUlMyD/a7wV3mE6m96upF08mFgcpiIYA2Ecry6WfEuSzZ43IID+cl1VE
	toUZXzXg1nCyBMdWZ5Se+cuKAzCErPztBIzSBGUpeYk2DIh2PMr1bpKmkpbLpQ6jthz0Mq++VKw
	==
X-Google-Smtp-Source: AGHT+IHion98uDMErcaTy2KPDAunnvltZi+2+sHJ8Hxe7/touv6pVzrd3SAufrHnX48C56WA3GgnaBMlzBijSZiBlA0=
X-Received: by 2002:a05:6902:1244:b0:e5d:e04f:f29d with SMTP id
 3f1490d57ef6-e5de04ff47cmr3922630276.47.1739802455245; Mon, 17 Feb 2025
 06:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-5-philmd@linaro.org>
In-Reply-To: <20250208163911.54522-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:27:23 +0000
X-Gm-Features: AWEUYZnHyY9QVYCsEtLpJqHhz5JU_qpfhzRLYxyrW4MRz-YfS2xNraqZW7BR4jc
Message-ID: <CAFEAcA-tQUL2Rt4Y_eNFxCFXzNXupzQz3qYdEupB6Bb3HFyhfw@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] hw/char/pl011: Trace FIFO enablement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qyv6jq9OOUmq

On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/char/pl011.c      | 4 +++-
>  hw/char/trace-events | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index b9c9e5b5983..447f185e2d5 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -148,6 +148,7 @@ static bool pl011_loopback_enabled(PL011State *s)
>
>  static bool pl011_is_fifo_enabled(PL011State *s)
>  {
> +    trace_pl011_fifo_is_enabled((s->lcr & LCR_FEN) !=3D 0);
>      return (s->lcr & LCR_FEN) !=3D 0;

Might be neater having a local variable rather than
repeating the expression twice.

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
