Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp602468wrq;
        Fri, 15 Jun 2018 02:04:47 -0700 (PDT)
X-Received: by 2002:aca:a846:: with SMTP id r67-v6mr436780oie.12.1529053487673;
        Fri, 15 Jun 2018 02:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529053487; cv=none;
        d=google.com; s=arc-20160816;
        b=ezp14gOeIH+blHps3B6pvOUPOA+ybvfkmBW1pSqyFJbgvCOje6wv0zZ/+dBTLdSZV5
         J6k9qGSlIczI+drMe0iU5tnIsSgI8uGoxaCAKLA3kx3DowSrHiIUFRIQkxZks2unOR4m
         XrTQZ/fhDHlN6C8DJnQIWT84OJoyDZZGlHBVPPVo1bIXoJhqPeAlZKgKUPYtGjn2D46C
         hy6RsIgo6BxB3D5vxLN1z6opqIUbxNjMNcx+klZeJ+Dg00ZpeXN6/eP04S4r/xyS3a8c
         ZukzspGeJAS5EI5aKkfcNf0N+x2V+CjEg2oJY9HCn8U28tK3Bu6sLK3IWJEmE7W4wKLv
         G/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=crymNtFmgQ4u5F+z6NU70D0934qjsa1d9FO75ENH2+0=;
        b=VwZUEI13vd5DpPQC3NX7qfkSqRFFmOS36fVdaN4Vs5TrmQmNzIL+NK50SoD8C1XuKz
         uN+iUd7jeL1fCfRymFHESay8FMDNpkCTvu3Jc7sq8eD1YtRX7mnyqq3fIpg9u/RNV4Vd
         /zaM7U/6x/ImgY32bre0nW9DvTdwLG1lh1qxsyC/Uc+5y3qiYoE2o2lwZahKAJF4kSeL
         n5txg+OPF5j31Ns5h6fjnSBAU58s6N66bGVaAkL9i6B1Gs8YA5ToxVVDuJg5t27JKYl4
         eyCEzOfZN3hGe7L/P64dmf6QxnISyPo9Y1qoSXhO3IiLbERbpnFNZwYml/XGGi7C5kuv
         D/hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwX4RAdb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 89-v6sor3306074otw.163.2018.06.15.02.04.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 02:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwX4RAdb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=crymNtFmgQ4u5F+z6NU70D0934qjsa1d9FO75ENH2+0=;
        b=HwX4RAdbFxTFdYLcubBPv0S9Rru1LBhY0f8BFFEtr9MjNMCEZ0G/W8oAcBp8oTsIw0
         VXOLZnxHQPasBjW+wHzSXR8mViMaFUOL7y5lOa8POyVh4TojpsFqfcEpLwK12jGaDEfp
         oAMOYTL2EF3YDvRQcMoN7DnqG9LA7c8QCiWzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=crymNtFmgQ4u5F+z6NU70D0934qjsa1d9FO75ENH2+0=;
        b=JTbS8BV69RMjrHXtkbkGqpJRl/N9Nhy1YNW20h3UBf1Pusd2gGDvLE7tB/k9hq6th9
         pQb7LKKPKUvkG6TkSjG//k7LVcdUHyay3+y2hrS0xNdEctec0xf0BIZ4EzdBs99eNAKC
         3bNYLGv4XOz6nnoK3wYmUom3yk0z4+SyL67V+RnvUVNMRXeifXFyZdD7mop0zkxeP9Jt
         aLiCGwPiLxyhuYZOhudEOCivXR1557aTbrGndvpdnkLzDoPvEKvYOuNRCSWLr9UenBAb
         lEFyBp1kQk8N+8wYajFkO5Ef3aHQtYw7+XqhJCPLyopmaN93wcFhqr8e8X0Rmm8bsU7Z
         2JzQ==
X-Gm-Message-State: APt69E17Hcv05udjZaN+JfddqgbAawrmZtMiFn26ShuikFYRzHALrr1z
	pacDOc9zSMKqlL/N+4jrhQhGeDvnuTk98e407VcYTPac
X-Google-Smtp-Source: ADUXVKLZunEO35duhrBS8s2aax0rE6gclV91RrrNb7P2ETtJzu6cN+/ZPAAcXUX4cATbRrwpQbWOkfgprLrMdFtcwHE=
X-Received: by 2002:a9d:705d:: with SMTP id x29-v6mr487808otj.308.1529053485838;
 Fri, 15 Jun 2018 02:04:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 02:04:25
 -0700 (PDT)
In-Reply-To: <45d89f39-7397-bd71-5cd4-fdb1ea47595e@redhat.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-7-peter.maydell@linaro.org> <45d89f39-7397-bd71-5cd4-fdb1ea47595e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 10:04:25 +0100
Message-ID: <CAFEAcA_OpQYq6XuKhAsP-W9pimWpF49XVcttcV7rqpOgJu2ihA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/misc/tz-mpc.c: Implement registers
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: LIAxfzWgKp3E

On 14 June 2018 at 21:36, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>> Implement the missing registers for the TZ MPC.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +    case A_INT_CLEAR:
>> +        if (value & R_INT_CLEAR_IRQ_MASK) {
>> +            s->int_stat = 0;
>> +            tz_mpc_irq_update(s);
> don't you need to clear the info regs. spec says:
> the [info] register retains its value until mpc_irq is cleared.

The full sentence is "Subsequent security violating transfers
remain blocked, that is, not captured in this register
and the register retains its value until mpc_irq is cleared."
I interpret "until mpc_irq is cleared" as applying to the
entire thing, ie mpc_irq being cleared is what allows a
subsequent transfer to be captured in this register.
(Hardware actively clearing itself to zero is unlikely,
because that costs extra gates which designers don't tend
to do unless there's a reason for it.)

From a guest point of view (which is kind of the pov the
docs are written from), the guest can't rely on the register
value once mpc_irq is cleared (because another transaction
might come along and cause the value to be overwritten).

thanks
-- PMM
