Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp100842njk;
        Tue, 17 Dec 2024 02:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLIuvKjhZK9lXAfyFG/2jDk3F8kHoR7eA3emXQRmjTVGO4sMXUdfuMtr2DAGUlIy/L8/irFCZWKTdRiw==@linaro.org
X-Received: by 2002:a05:690c:fd2:b0:6ee:55c7:6128 with SMTP id 00721157ae682-6f2bbad5848mr21545047b3.5.1734431304771;
        Tue, 17 Dec 2024 02:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734431304; cv=none;
        d=google.com; s=arc-20240605;
        b=ICKpssztY1xGzBDJ+Lx++5ufJKHayXyE9uin8C+ijhwvIlCc2+EzS3tIsSdx8PLR+C
         7C0Syv9+B82vVowusJerjxPc4gvXOzGVIXXw0Leh2dUPP78Up/D+LpbFFFHLQuBWeGAZ
         /mW1nx5p4AEg5WkAEM1Wf55BsGNiqprWf81CvJb02XHhLEgwy7lsm24iTqpmJWie3T97
         fbRgK9SAK41PPFNKBD0m1SZpUusphByoA47tkUVRqp9CXI80keW5tLLnAHNMU2L3WdJb
         n7L1+owrBN/9zW4kP7RxboJgtjG/QqFVIFX1GNgdvJoLApgCjO7++shMGQJP2agn58Ku
         B0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kaPsc9feCuvoLCjWOqgOWlOcfR2XUn3EN3VHL2kW7wI=;
        fh=0Ck7AlIjTezWLJuEyFsP3i7nKm1olg/MApKQErfqxqQ=;
        b=ilOne0RQgnLEncCW0RC5oqtGWlRCodor3AJvcn953cAalHikuvwAzCmGbgp8QJ0N8N
         Qc0Rt2c3Qf4gQGyOjVbX56ywNZGrAitqDhySllEmFGcLr69+1mOoh3/UNX9zMqUq+laW
         qme3MDnO02Y2BFY90dtIN/G5pIS7KjmpomMnGTJy28B2eN/O3cPcU2T4oJggxA0ygC/s
         m0VDQ972KdA5LWnwA4rs0vXXbASnUqq2iRGt6bZq6km10vEymYppcxZR01wJxgLWn/0L
         RZzCudl1opCxffhvflDW2Zx94/XX0rfwjPHAKMNbuH+j6PbCwZTNqwcoJY9ePrjUX6Ej
         mpUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLvLewCT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f2890ceb21sor33089827b3.5.2024.12.17.02.28.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2024 02:28:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLvLewCT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734431304; x=1735036104; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kaPsc9feCuvoLCjWOqgOWlOcfR2XUn3EN3VHL2kW7wI=;
        b=aLvLewCTKRZGMpV509RRcHXt9lLpJ9+6G7BRgyMpLRRbb1y/G4xxtoH0mPqbcy2ASA
         Mwe3SDRWn5IJN3+rbeCuRlyZIAW42LYpxY89AiTtHPEaQ5noChy9kzstHWmYaG5mvZIc
         iuP153bdm8xNbFz9bxVYJqEdesPYJ1+3SjkCI7dnTvbCxetpGBtUTfAfbitsc24hpNpY
         b+UYncCltl4unqWKM/ghg83Y5ATwSFk38H3RSWmVKam0gWYQzkfE5ym3TxdaTn7Xeo9G
         g8TCnZEUQGQZ5YbFfT0FbGgGurgG4yCwe8r4M/MQ1MTwJScGtl1PN5BrBiYOhWpNq63A
         Hd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734431304; x=1735036104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaPsc9feCuvoLCjWOqgOWlOcfR2XUn3EN3VHL2kW7wI=;
        b=hOULGd6wWNowpLs96bMJNVYQqwBxUDOQm6mhqy7hS9lUhQwwaGnfjDzmtF8BB5Q6v/
         +7mi8ZaZwKuoqwDboxZLWvl1cAIym7pOHpbA3AC5/MB8NKEaLnERSwx08tA+X/OMPg1R
         ttRiJSNJn47MkU8apItns1CC/mcioTp4lTiYQf7OOiFLi93Zug0XwdCz0z0nf+0cyBU8
         jsYTd7aFryDx7/Du+KbZSqot3/DUFUfHPx4UrBflw4maN0RWNKBgpVaC2niYVsb33APE
         ZOpFKkE8L0PCwxF/F90e1KfjWf4cgIUx6zOM0SbO1kBbMjUNPUb/8y1Bek+I2urGuK4b
         vgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCtXp6znk8JsjJCOPklP5OgPtHpKm7Ve38vtr0NpCihFNr1yCYALNJvh/2dlTxakCWEubIn5D7kxg0qg==@linaro.org
X-Gm-Message-State: AOJu0YxqSjvuOe512uXz61XswdDVWiOg7k6Zn7qSkHnABhUn4NImSNNT
	H3pMJISOVAG6AP8vTUxSo6EVeEzbJ9d1iYqpEyJIOtQayCvBr/6hA1Is9rk+n74nBMC3Lv2YzTK
	SI/vxJh3KjKxdblkB7GgWKTihNhpTW9l4GqpI0/Am
X-Gm-Gg: ASbGnctZ90Anwufb8hWhQrNklti9RWu4gHb86MXtrVcWVeNbPWb5pbfhGajmDcOInZD
	Oxtb6pfHA1zfdkBgkoIxX1pEpDWQ2JEOgWbM73N8=
X-Google-Smtp-Source: AGHT+IEDNgFl/P6FRcYViOEEfRF+0B0DJ3tDGoX94v7JkkcRnbuwh8MF6k3lYqcD0GjwOyH+m8nT8aUQxWm8om9IF6E=
X-Received: by 2002:a05:690c:60c3:b0:6e5:2adf:d584 with SMTP id
 00721157ae682-6f2bbb1e460mr16863217b3.14.1734431304387; Tue, 17 Dec 2024
 02:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20241213224020.2982578-1-nabihestefan@google.com>
 <CAFEAcA_MR86C5+jV9=uQsZZ905w7+OgHozfQZKYXx+=Xdv_xqw@mail.gmail.com> <CA+QoejWYCMYRnrO9JnN9pEiJt0gLDUu8g5kkVenzp+xJeJp8Qg@mail.gmail.com>
In-Reply-To: <CA+QoejWYCMYRnrO9JnN9pEiJt0gLDUu8g5kkVenzp+xJeJp8Qg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2024 10:28:13 +0000
Message-ID: <CAFEAcA9Av_40TirO2a1uH9iEi_HdMkV-NcSJn8XqhLfL+mOvgA@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/sse-timer-test: Add watchdog reset to
 sse-timer test
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de, 
	lvivier@redhat.com, pbonzini@redhat.com, roqueh@google.com, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: fDZi8j0+w4+l

On Mon, 16 Dec 2024 at 19:27, Nabih Estefan <nabihestefan@google.com> wrote:
>
> Actually after some more debugging with the help of Roque (cc'd) we
> realized that this patch doesn't actually fix the issue, it only hides
> it behind the watchdog.
>
> The root issue comes from
> https://lists.gnu.org/archive/html/qemu-s390x/2024-09/msg00264.html.
> The function `qemu_clock_advance_virtual_time` is broken with that
> patch and the conditions of the sse-timer test. In the test (and other
> tests) we run `clock_step_ticks()`. This function calls
> `qemu_clock_advance_virtual_time` which now has a check with
> `qemu_clock_deadline_ns_all`. This returns -1 if there is no timer
> enabled, making it so the virtual time in this test is never updated,
> thus leading to the failure. This was surfaced by the INTEN fix in the
> watchdog because now we don't have that timer running free out of
> reset. Once we enable the watchdog timer, we make it so
> `qemu_clock_deadline_ns_all` will return anything but -1, letting us
> continue through the test. My theory is that in other people's local
> builds (as in one of our local cases) there is another timer being
> activated (which in our case was the slirp timer) allowing the test to
> get through this failure. This patch only covers the bug, not actually
> fixing it. We shouldn't actually merge this, we should instead fix
> https://lists.gnu.org/archive/html/qemu-s390x/2024-09/msg00264.html.

Ah, thanks for digging into this further. We already know that
commit has problems (reported in
https://gitlab.com/qemu-project/qemu/-/issues/2687 ).

Alex was looking at this -- I've cc'd him.

thanks
-- PMM
