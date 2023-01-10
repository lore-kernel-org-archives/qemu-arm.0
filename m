Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3154309ejc;
        Tue, 10 Jan 2023 05:06:23 -0800 (PST)
X-Received: by 2002:a17:90a:b110:b0:223:4308:1ab4 with SMTP id z16-20020a17090ab11000b0022343081ab4mr71374115pjq.46.1673355982895;
        Tue, 10 Jan 2023 05:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673355982; cv=none;
        d=google.com; s=arc-20160816;
        b=s8IqVCbSLAQ0Dr/41UxtfEHlKKR2b7DGxOFFOU0SCDRZfVDwjHyMKzcAs/MPk1kjYK
         u1477N/raMrKjeT7997O/U/+2aOFdLNhzJiqoS244ElFhfHIyNjA26aESZvpys1VtQIW
         psfZ4h/QPfK3UGQ7r9z1IRVu1YZN8VoY0g417BzZ5mBTt2UOJLrOTCJPiiEz/kpT4aUF
         jU+EV6Xq65efxtNmDGcz8YWcet6CzUHZaQFaMkBSkYqWS87tPQ9ERtckzBYXn/Le/lGW
         xpI0lcTaSxyo3lTk8UPZw9oAvuy+mG42q+EPwe0DbNbJgiAmlkI6xO6cF15qMBVXpXWj
         6jOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SLW6m+Dua0Xln5CTfFmVXNwER7zdgIJlXBCVt8Q7zbk=;
        b=KZr1kKd17FhpXhbTYz+1knZ2wxXEjPhb295Ug50tIqxOLIjzX6YaJ4GIwIfRgQmewP
         kXDSv9nScHP5qQiFR8PDWBHjBO+/eLIdOygrw808M1bc5QepnIVqpyNH5PnqtJ7pBObO
         V0F/s6kfoTHOtmQcBCmgJ1N1JPe4nFSo/30uKTdKDNNpvILb7ze2tq1FgbUrI3hNcdqD
         OfexvA0M5XvRJDFBDOBuK0R2Tg8wRbA5Tz7U3Q6MY3wh0atARerGmHVpgdI1MSKsK14N
         UJfyQebWs/JGe8BKMYm8TNGtU7c0sBP7n+aRKE8yZICX1aPPiNtHQ3DzTejHXVNMLMkO
         vS5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GF/VGIy6";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id nt19-20020a17090b249300b00218e877ec6fsor5310800pjb.29.2023.01.10.05.06.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 05:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GF/VGIy6";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SLW6m+Dua0Xln5CTfFmVXNwER7zdgIJlXBCVt8Q7zbk=;
        b=GF/VGIy64zEJE4NeO3/5jWwsnDqtpP+G7oDzVIfNYNj/pidgAXt2LnKs0KHVC1g0Ru
         CX5CsOqNDVqUl9s61zIIEmsTMJL8NtGWDoyH3/MCqNx/fzoFFmYG7Orql1bEZbiKLOen
         HUwXmDyPRSPBVj3wbNrhU5rkcKFkXbO1uhaPJySzrJNfmEmubcu+sKBSPyVaJksAlvGW
         QfP2yu8Mi7rISGrgA8WyrjnZRm4IMYgMoyUQoDXFif1PmhQopbQvtc9k6aSB7N9CIc3V
         PnyCTpbhavxPCOck+I1NOB1HM3uwq2fb1UAokO1kZrkDtr/3AipD9vU/Axhoh8C5joVK
         W66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLW6m+Dua0Xln5CTfFmVXNwER7zdgIJlXBCVt8Q7zbk=;
        b=RjZRevDRE3/hSUSNBaiCu6HMU+MeTpAmkhoTqEnNONPDmvbp3wBCPar42zEfo0g/Pi
         rRaS5+q+B30RQQSoRmBzccWrsWdOZKr+Xbip49by8kHELGqq8Dxde9mC8/29zJNVSiCg
         gVO/Vm5xItI9IAUH39UCAgf+8UjSPaZCgAA93QyIDbJZhhHsE6saTqTLzApErh3oNtLM
         bteT6kNmnT05qoqt30MZ3M5uTHbHzxnHldNBJgEAIFiqinBdC9kJ30UwURMbFFqR+Jdb
         c11VCC/JkymuH18TZgg3OSXNBTmmjVCfI1pJgC5LRI930Pe7Wt0rbX7xjXAFj3JbBhKD
         IF4g==
X-Gm-Message-State: AFqh2kowkyosPmTN+V7ziDsMM6f/fx4WiHAw1arzVCpc8kQ5K7qaCImt
	s9wLF3OYpoYTDvAFMWAfKJykSQiRcPylAbD0bgkgzCrl
X-Google-Smtp-Source: AMrXdXvfDyTNAMQ3kp9ArcnZ1T//kkJ7Gs9xTCiIukb2tJ7DQ66iNRY3kbZRbScSa9saCw6UCqv2TuALdOu2DBmHs9E=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr5533072pjs.19.1673355982503; Tue, 10 Jan
 2023 05:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de> <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
In-Reply-To: <87zgaqa6jk.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 13:06:11 +0000
Message-ID: <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, 
	Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 1nG7UGtXjRJE

On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > On 09/01/2023 23.42, Fabiano Rosas wrote:
> >> From: Claudio Fontana <cfontana@suse.de>
> >>
> >> on ARM we currently list and build all machines, even when
> >> building KVM-only, without TCG.
> >>
> >> Until we fix this (and we only list and build machines that are
> >> compatible with KVM), only test specifically using the "virt"
> >> machine in this case.
> >
> > Why don't you fix it immediately? ...
>
> My idea was to have in this series the minimum to unbreak the
> --disable-tcg build and later bring the rest of the changes
> incrementally.

This test is basically checking "all the machines should
work". That's an important invariant to maintain, so
I don't think we should just skip it for Arm targets.

-- PMM
