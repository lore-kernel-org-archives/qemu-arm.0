Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1960603njb;
        Mon, 10 Feb 2025 06:08:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJQQEu1kynf4sgOY7EIxijRl/6iFUD60c8eoauKiFENOXjrjnbQQYepsBBmW5pLIxv86A4S+9a7N/cQg==@linaro.org
X-Received: by 2002:a05:6902:230c:b0:e38:8a2e:e3bc with SMTP id 3f1490d57ef6-e5b46167939mr11758075276.5.1739196501843;
        Mon, 10 Feb 2025 06:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739196501; cv=none;
        d=google.com; s=arc-20240605;
        b=P1wP7YsnqpiE7+YIWC3nopB7mJ+u/iKUJGNHuNCJSttZotkO9/MVjzo5xD4ckVDcVX
         eQLPZTnw7jCZ8LESqdDo6nSDZQL/0H2TFb0WsiXnri/dt9CJK8g84bSwoCyQ7kKCVhGf
         wGBHjEyCHqK2JvNqZOme7uu3KsrSmo0ODCovQj50zEPuOO0f0Exurkj1FZfGWM3NB/UM
         RTFmADPvql6zBI5vHo7NPtlCAhljBpFoSijwHDJZfCgGolqIOMxL1gOzY4/5qfufFl74
         2EeZo2LkIrmKKNmeb7NF1ftrbCNbtGE6G7jONbE4ysKsvqus+4bciFqH7Vh3yfgCHa8Y
         gfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xMydYF9T098euIszM7ik4JTCZxbWbtFNiTuzagikfbM=;
        fh=EIPSrRRrt2CI+oBqMLCps0QbbOW2gMVv2z0ey2jEgAk=;
        b=PPi9TbLExKPMOaatbiJp5EyhA9bvJzx5Re5/QSB7Bq81b8vGCGWC6SnX33uKvauw7q
         uAErk/HR9muUYWM0v67yxW+mZD89s119OQy2ahZGXf6m8ALprc6RTMr5h6qqFGFPpOF1
         OGtbr9H5+6CwO3Av22Gbcuy9rnkPUdfB8NfSDPr2gNzIAJHIxXmF0W4A/hnW+IeYhsqH
         TGn5cqX6cTVNZoT20OzEI78nv/PKTdCclGoMKdjczp/Moq8XR/5WOB49y2goILl0/R3X
         3dDUF0FrYJZdFTlkhSxlPlH2EJpTB3+pRw2HKmDYuj21gBjO80Nz5lP6KN1rLpOU2o+i
         yx4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KsG4EgkG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b563c95cfsor2222787276.11.2025.02.10.06.08.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 06:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KsG4EgkG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739196501; x=1739801301; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xMydYF9T098euIszM7ik4JTCZxbWbtFNiTuzagikfbM=;
        b=KsG4EgkGghUZKOOjBLe/8bY4+3vkW4V3AOPiu6noOSzSHN67QlIMAijhIV9ng/t7S0
         D14wuoPFQGjPwLAX1FwpNqGXaIw5Q/tpeNGSU7lBV6+1eybOF6nAT7f9Wsg/0oQKLJg+
         K6UEFZK6Stza8NtxWHgr3wff3M+uwb53QJXnbqyesw1g0DzuJ9ZtzkbJoZInWqK7pwAb
         6AU5bv9fZRr2Kly3LXfOyWqqqhU03ttXzZ5q2KmfsfAGmu+NzwAImjd74WzYcqXcTzHj
         rwJkuBaXCgDqYTjSuUYx1irbX31nrChHKxlv08hQGdzwStky4mYU7OjtFwsptrZ6iwTn
         bbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196501; x=1739801301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMydYF9T098euIszM7ik4JTCZxbWbtFNiTuzagikfbM=;
        b=nh4UP2keSFpJVG3C1+AVpKdxNsY4MIDz2PSzu1tjP8YUt5LpXOOaWtb4/iQGb2KNE6
         djXISIJmCxshbRaxoSM1hIBJfFBXJnXuY4wbOsRLMrecapnQ/yrUPK7quBiqUgBoGJJl
         4Ag9xndDHNwodTtyGuk89egRzi5Or9+OgNXYwuzSwJ45SAZCTS6jUvvSdVfQq4f9G8DL
         0UuJkh1r09DeyQ6QBqLii7vwuzbmsh9UnKBc+rd9TcLEbruL6JB0NA+99GqjTUUpS/uK
         7T7rLle9+nLkDcHc7G66XPlxRESajxovIBHPrVz3aBZPEQ3dZJvSLOoBteHHCjCpQwKv
         peAw==
X-Forwarded-Encrypted: i=1; AJvYcCU3CM1/f/1aRzZ2Y3sjfMvR9bKfpmxZViOscmsctOL3N7z5J0AqlNk8BPA8dfGFFrgHp5UrgwTdc5vK7A==@linaro.org
X-Gm-Message-State: AOJu0YwwFWgjYwoAjSsRkaQu+g3Ks4QTVVT7nVEoEEUmg5M7V30uBZEY
	UkhadBisdoJYzssm2DmAThMrZQNL8/aNNiDFRC+fpEwpJ9SJhQdOCB/ny4D1UvqoEPNjy8UiPxw
	0n/8L3I9xt+1i20nEf15OzmExdo3rRL6YzGszylJ1
X-Gm-Gg: ASbGncvC47/HMDTPZ7HcVFrtSwT+W4SO0rVBr0XphfBe6v8sPt/+igFMMrt2+D/Pek/
	0aT9NqgWE6cbTMoo4ATunZ4noJigINR6NFEM2ypf3MbowYDFfMrH4Zrm7w5bBBMj+yK2eMqGiFg
	==
X-Google-Smtp-Source: AGHT+IGYtgvlbMteA8OshRfdmMAGYPL2A88mFNDr3gV4EUJ+eM89dSqUEk7RN5fsm6T9auPUoV71FAGHZlyC9MRddj4=
X-Received: by 2002:a05:6902:170a:b0:e57:fbf0:5016 with SMTP id
 3f1490d57ef6-e5b461c3280mr12034195276.22.1739196501416; Mon, 10 Feb 2025
 06:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20250210135804.3526943-1-peter.maydell@linaro.org>
In-Reply-To: <20250210135804.3526943-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 14:08:10 +0000
X-Gm-Features: AWEUYZlYGcA3eOXPzrsb89SM5uWj_mQXJ7tTOfjEylXNA0MUkyl1g0cGYJ_1XAY
Message-ID: <CAFEAcA97TpSfRVpNOg025GMw3pduR+73gr2LDmncoCpTDfV3jg@mail.gmail.com>
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: wE/5NP9D4oJg

On Mon, 10 Feb 2025 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we call icount_start_warp_timer() from timerlist_rearm().
> This produces incorrect behaviour, because timerlist_rearm() is
> called, for instance, when a timer callback modifies its timer.  We
> cannot decide here to warp the timer forwards to the next timer
> deadline merely because all_cpu_threads_idle() is true, because the
> timer callback we were called from (or some other callback later in
> the list of callbacks being invoked) may be about to raise a CPU
> interrupt and move a CPU from idle to ready.5A

(oops, stray editor damage "5A" at end of line)

>
> The only valid place to choose to warp the timer forward is from the
> main loop, when we know we have no outstanding IO or timer callbacks
> that might be about to wake up a CPU.

This raises actually another question: should the call to
icount_start_warp_timer() in main_loop_wait() maybe go after
qemu_clock_run_all_timers() rather than before? (Haven't tested
whether that breaks anything ;-))

-- PMM
