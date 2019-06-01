Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp1728119pjq;
        Sat, 1 Jun 2019 02:41:12 -0700 (PDT)
X-Received: by 2002:a9d:4d0b:: with SMTP id n11mr2503133otf.229.1559382072110;
        Sat, 01 Jun 2019 02:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559382072; cv=none;
        d=google.com; s=arc-20160816;
        b=KbF8QZ3p0p1vObEo1ydOaKSQJA0HkiqvSZ0Rt1qBuv8/soTvXMD04Le2VDQaOM1fbc
         XXcQjYEivVih51PTI7RaXhHNV+kjV7j8ky7lRgnI3R7+Y2F4gvbwCvmAIzJZGfHoka0N
         pLMtYP8wW0gJ/cRGxq11T0BqoTzyKW3kmAvNz/mw/EfO0Hb08QafQqxDicN+raBrdE6c
         RxWwqJBmqTQa5S7lt51GS+yonYKuUyQCOyPefh3cvkftB+xtF3jIs8Bbx2bJzn6KN3Fn
         ePx2Xls7XMb0fxNO5gPUmWlMLYgJs0HMuzAd3qrUHLGHyfsukJqWhWQAq5WAPeWv2n+o
         f1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OyUncQWuC08e2sp/rFTLIQ/A4TeV+nXqHCw5HdY5vb8=;
        b=NAh8F53uLheDHSexiIhgQeNyBymAzcnYifb+DaOHKoCL6BSY3HLzY7PFXDPvAQOQXu
         H3wd2oI3SDc9OiGkf3qjq77LgzUxh1iX/7b+BAO+2uT8HMUMYyJgvlqKYEPtNyW45uA6
         fLuyYGK2oUUoTfIfLmnfCUTougc0eYxGAtxWepwfuAp0jdHmz4Psxa6VqkqhbU9QOQ5z
         RO1aKlMBS92W51mIQ/u4W7b6y2zesov9fC5MhSpMJKFSkJgi3iQvUagUFMdU8hc2nUzI
         2x6wE1L9aNagzy45AM5hlHNCZntrL51RDVqfn+44dvuasPnjzD8FHI+StYl/OlemAs16
         1/Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QyDonpZL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z76sor3549856oia.77.2019.06.01.02.41.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 01 Jun 2019 02:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QyDonpZL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OyUncQWuC08e2sp/rFTLIQ/A4TeV+nXqHCw5HdY5vb8=;
        b=QyDonpZLae3Wi9OBqK3+qYu+BFdGsro9wUOt1sj4o/EtO4M5bnVPofUs3rUK4OpZ3R
         AJTGQW3ySU3F7w+bWzpeja47O+f7Nokdoc5gp68lKDQyZWd3maOihtcPmn2dPttXse0g
         BZJ4A5LUw6H0CPYVrmPTCiPYn24U3k3QjeiWe/TDsE6o4ghPxlkvW2uVc879K2aU8ci5
         pndCY1RCRGi/ux8BWH9YUcYR+/hYqv845J5vyct12LpoUazelGS4bjYrxIrd6Ddrp1sA
         9d7baKytIFARbVbDpcqiYExR1ZPc8c4ATUMsde08Ga2dW68OrpNcdjvORDYfwLmZqvm8
         zU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OyUncQWuC08e2sp/rFTLIQ/A4TeV+nXqHCw5HdY5vb8=;
        b=N4C5tT1sJHQ0iIogyOdwR0ngTOHHC8KEu9br9Pw9mcwo5eKeR+MK9sdMtRQoCGgb6F
         RfJ4cvIhNL5B5cycPVXq85+z395xl/Pt42mrWzZDv2qhmFIRi4179Hdjfd/d8MydyRp2
         Pe8va/XHJ2UidTX9TYT3B6gKVPXw8FAVKfvAlgGBSw+NlZApBfhqIGIqsmVK7spRd6es
         5Bwy1kTmGUyzKhFJBr1J7p4KpLw2ii9FzRbCW5+p7ytwuRpHRDpb6ATFf5YyO43OPtap
         a3l0dKvOLaWu52Crv4YRziqpSmvxrrqWuBwEVCX4hNxR4w8/xyYe27/KW4HRstaCh+lP
         mzjQ==
X-Gm-Message-State: APjAAAX+CHMevWuzBBa+6PyqxC6GoBsY/KkBIM2aG+c6rZb6BP1uyYYU
	K6YRO6mdqsHZu2m1IogXbtGpDrfBxXZwSVV1erAk1swdHeXbLA==
X-Google-Smtp-Source: APXvYqwR0YYSNGuYMUwi4bf4oidZ/wpUgurceVuHhW7+R4GNzSCV4ikULZoJ1fLHluUwarAJZbCWhrqstj13uuNZF3k=
X-Received: by 2002:aca:6cc1:: with SMTP id h184mr1748680oic.170.1559382071628;
 Sat, 01 Jun 2019 02:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190531154735.20809-1-philmd@redhat.com> <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
 <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com> <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
 <CAFEAcA_KKH62rK2pbR8dWXOCJWe1X8wif5whc+y0_e-hTpmoRQ@mail.gmail.com> <87lfyl8x8e.fsf@zen.linaroharston>
In-Reply-To: <87lfyl8x8e.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 Jun 2019 10:41:00 +0100
Message-ID: <CAFEAcA9W315__M3rGxarUOKkGo9PyqrDPa6bG7MWOv1jC0sFhw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Miroslav Rezanina <mrezanin@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo <arikalo@wavecomp.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Samuel Ortiz <sameo@linux.intel.com>, 
	Rob Bradford <robert.bradford@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: oi3kHPh9u0hF

On Sat, 1 Jun 2019 at 10:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Semihosting is a feature that works on all Arm CPUs
> > regardless of which machine model you're using (or whether
> > you're using softmmu or linux-user), so I think
> > the machine's Kconfig fragment is the wrong place to try
> > to pull it in.
>
> Although amusingly it doesn't work in kvm but perhaps it should?

It would be nice if it did, but the problem IIRC is that semihosting
hooks either SVC or HLT instructions, and inside KVM both of
those go to EL1, ie to the guest, and can't be trapped to KVM.

thanks
-- PMM
