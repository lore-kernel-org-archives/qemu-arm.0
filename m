Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2023503njb;
        Mon, 10 Feb 2025 07:40:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVuRRDttmcFRB8u0HcoCKtO1hgnlYJ36dfWElFLD/PjIYY52B8J26Ly9AT9MO+I8i4RucJJZs7zfconTg==@linaro.org
X-Received: by 2002:a05:690c:9c02:b0:6f9:c9f7:1a9c with SMTP id 00721157ae682-6f9c9f71b95mr81188307b3.12.1739202010393;
        Mon, 10 Feb 2025 07:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739202010; cv=none;
        d=google.com; s=arc-20240605;
        b=kjMA6C7ursxAf+I2/G9baxRwaf6sIHtPGh9Z5wM13mNKAQxMV47nFIyU8kOxSrPfbo
         yMjldxFm4OwfeMp3tX57JHlsV4vr2EpQR1qlJoK+8m+Z8pqe8pWEhQMcWVsI/OKWdmeo
         en01fJ5DN2DswpeRXecklQAyWuBbM+lXKuvA8BwAufoHW6Y6BMsGMk5U5jbMYwhnmaRb
         HxcJEjmlVg2W85eXdfcfQP+CXkK53EzUuuE8DrG0bF8YEuWpTEy5Sehz6BaCH5nhThXL
         8ebK07PMjedLwiXhU70NMi3DsnaKvp2UGtEGfzhSogbw8Zu1oaTwS5FTWN9GJ4pmKXSz
         RxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OnSd/e/jEqTUcYBz684UyvujbuuystBLx+4LOUZE/hg=;
        fh=ysvJG1roScW8u00qXP4hc/lCkVCeGVZEVsV6AeZZWI8=;
        b=RUzEqLwmpQXKjJvz7QOAiItye0HiTC4/mY0Vmn+aPX6ShLgQTHBxbvhH3wcchUMqOO
         C8fLV/x//z7otenvPZ9x4KSyg+Fc3qBwlo160Aqy/x5gYeSblQprnZkCEE6m4PhztUyj
         CAqzTmiIn5WM3WbXZy5V7NZYg8DbORKswom07mhvMmFDFyWwcEYCiP6e56XmHtMbwbHX
         ZfnHc9C0y2imoJGi5UzyU0O+mQmtFO2qCnlH6bA/d9MJQJlAE5e7uAgbwW9qfKpOaikk
         Se0IdIUbTrgI1rXABL5mtFIYWJmj1/Im1nEFRvP8kYLPwIM06q3UKGu7qc9QRCO7Cq4z
         LG4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EK8/YU7K";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f9e9ca3d30sor18267577b3.3.2025.02.10.07.40.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 07:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EK8/YU7K";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739202010; x=1739806810; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnSd/e/jEqTUcYBz684UyvujbuuystBLx+4LOUZE/hg=;
        b=EK8/YU7K8dhmkiq5uakCP7rKFFHENH88xpCgq50oEeWtzlV3DwqbLfdFzZA7s1Vbe/
         V+4sYoONFZwQuKLVA7b539Cwl/vLkEYQnr1dUeQHHbhsD4CcdF6ofvFgz7fY1sDgpJFh
         ZuaM9YplljJJsm65O2qGFHFxoIcxIc4PkL+KbgNnu30PNSsV3KS3X6y3SmdICWCVHiuM
         dH9cgU7MXCdRVu+4nRDfiyZHXK7T1BT0OQaXoqW78dQZiCBCnliE0rWQPOG95UlC4B+S
         uKJw7l51bUbX8a9mF/f2SHopKfGgv9qr0ZOLO1q1HMOt5zZPKge3RHAJzmmt2Wg3FNTf
         0OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202010; x=1739806810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnSd/e/jEqTUcYBz684UyvujbuuystBLx+4LOUZE/hg=;
        b=w8pNsebB3nrLQ4REc/jfnCQ3tmCvV6MZtIBa5HC28o6mU/OBechzc2pTuLPpzRPsDj
         hcM0vS0eobkbj2eo5iM+KOZrlNGkOP7nBKxsLhAQUaJSCdyQ+XkAAZI4phu8US8gcEjA
         cp/OrOyn3YbgAy3ap/7vOAqIG+TEZThKMj/l3mec3wJk/TCQlnCMQHbufZmMX7+n4zu4
         QaUmQTbEgaaIOoGZvK8Xxcs4rF7I9CMQCdUt5Az9VPzInXMyF8wQ+zyVeWP1HHsPK0Q5
         po8Ydp1Prj4rcW477ouvi6xq8HCImxM9UDiwxl6r2xwTCCkpOpk/RfYGyuOWsaLfUQT6
         T7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmknnC1utwZZrSSj4TeTRZF/4IgWOLSvWaNJJRGlLPIcN9YEnD9iafScH/uUMmeZFngH7HhAQX41+mHg==@linaro.org
X-Gm-Message-State: AOJu0YxrjjdHr8y/SMCPWrTCCXe9mm9qgDDuuLO/iTjxDA5atSXMBaF3
	lzdZ3i9pHUeD69ZbERLbeBaHA+4JELnJsmLOt6r2IO3SgdTMA0PoWBYvsPtc97vhg00HG+NxLan
	ZAB/1j+3KyKRbm6t75XYdfTIxwb3kmT8mvsk2SClo
X-Gm-Gg: ASbGnct5qKeIU6mHi+l3JjwkCXOw+c7a63+ab23xJYGlX+YA7FDFN8kcSk5hHj0HjGL
	qh+yEP6EPCEU5BXKxxZS0fwC+ppltda7LCvh91/6AefD1DcZtjK7M7rQTJ9z5vP7uK0nyllLKHg
	==
X-Google-Smtp-Source: AGHT+IGZ6tTtQbSYRKN7SBTNNh5paFiswS2IAV7Qu5inH+1JnCBNWIVqaP4UBWFpzvDbKN87vztRT1l9CP9Efq1p3fs=
X-Received: by 2002:a05:6902:1021:b0:e5b:38df:b44e with SMTP id
 3f1490d57ef6-e5b46b7d685mr9947422276.2.1739202009938; Mon, 10 Feb 2025
 07:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20250210135804.3526943-1-peter.maydell@linaro.org>
In-Reply-To: <20250210135804.3526943-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 15:39:58 +0000
X-Gm-Features: AWEUYZlKrxW_nY6VZoKTKhrWWp6oTjox6P5o4lp5DpJJOmaWb-04m8RbnrXulOg
Message-ID: <CAFEAcA_gA9CSsQboFYT5ZmOUc3Gr=c25ayOVyW=RzCqT3fdWYg@mail.gmail.com>
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: qK9hdHHqsELc

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
>
> The only valid place to choose to warp the timer forward is from the
> main loop, when we know we have no outstanding IO or timer callbacks
> that might be about to wake up a CPU.

This patch also seems to fix
https://gitlab.com/qemu-project/qemu/-/issues/2703
(a report that with an x86 system sometimes the ptimer
period would be longer than you'd programmed the ptimer for).

thanks
-- PMM
