Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1216537dyc;
        Fri, 4 Jul 2025 06:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVps4V8w/LPLPLTIFy2kJArXAssHms43sNkwuk9QEbeCpTlgJvbPFxCDPXsrYZ3Oz66/0bWCj4vG256xg==@linaro.org
X-Received: by 2002:a05:6902:18c7:b0:e82:3cdb:7e9e with SMTP id 3f1490d57ef6-e899db9b7fdmr3657111276.3.1751635985417;
        Fri, 04 Jul 2025 06:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751635985; cv=none;
        d=google.com; s=arc-20240605;
        b=BDODeF4MBHrqBMqPb1QcEp5R/HJ/7XvLANHQnA1PeiNqS+T+T652XzvvASFQC5YfIt
         7RSThf6V89auXnn8T+iqMGJrbjpZHpFhUPVVPtQvrXFmuyo+GUgWqAzDZCvMnFQZDxD4
         COCupW8CQlqBVWyTqIKY4P9xqe+bG9qjEnfEBu6bUhCYFHFs3e9GiUy3xrsSidL5A9wY
         olW2ZJnLzYe0pWhQYWl/GOaMiYph7KLYT2/jma024ph6s5LDh4C8zt+e8mWAWbQ0GkOZ
         Pc7df140fCvIPFF9Tljw+PMeI5+d5dIYF1U2z3RwFxQyoESsfHnnae6l2/iyRaxl1ZCw
         adpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwaDmSI+c+ULG0pcs+kC8v9tTILpDgFwM3hxFcbfcyI=;
        fh=rKIEP+rY/NtSTUXmGCZv/uveaoJ9D4yi2LtENJ4j12A=;
        b=fIOuFM9k7QZJF+qsYwNzTHOj7b3VQSZw51VMnu3AH/8CvryuPQ5HXKIyQNDgdnNBOA
         HaWA5WFevblBZH+3O9E/YwBUEgXht18Qar9L6OY5JFZSlNeOf5VF2nnFUif4uQtsIKEw
         L3YGlxadgm3ryGbVA3sO7tU7GTorW1vhuuMNOpuIagvsuVWcNz/E2sMsE5p1JnnQoIAD
         RwzaPiJH/Bb1vWrZNHiwuBn7tX3XXuE+iyPPGbwiyHZaHxT407N5axrKYM/2NCc3+M1G
         KTAZYnXscpxgdDWbPRTD8KIUPMc6BQ9UT31TTnIVVgzCEc0y/vVFmen5xnTVyLsdMwrv
         /Tug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M1x8/xd0";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e899f27e23asor657496276.4.2025.07.04.06.33.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 06:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M1x8/xd0";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751635985; x=1752240785; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwaDmSI+c+ULG0pcs+kC8v9tTILpDgFwM3hxFcbfcyI=;
        b=M1x8/xd0bOOYBmjIsOPk7/5/+IP7JxR9gr0+NwDBpm49CN+iaTaPSjfVSNAtZHLnKJ
         pY7XxgPO1FSQGmmftc1wSFCtuPCVF6qXj8p5VzVPtZx2rGiKJ2AuZDKRjNSQnBYhTrRI
         KsaWr087Um7ItaQTqb8ZUEw9MGTu1xF0SdnkvbtjWG1V08dlqRqPC65vUHHTrO0eIlFq
         t4gv0Tt0ljYQQUgVD15Vy+0V3q31QCIS/q1zlhBxsrPcT8Rst/O6CGusnAu44Z0Zxxkg
         DtQU8QL2kR8IjCBZhjKA3yU0Pz8tkQ5jmbI91CpX3A8YPiQuVoHA4HIWPHDrepALx3gQ
         NLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635985; x=1752240785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwaDmSI+c+ULG0pcs+kC8v9tTILpDgFwM3hxFcbfcyI=;
        b=c0EbVq+3guEbUuqWdiPDyxf8P8pC+zf8vn58myHNpR+kXU1t0BnMJ9MfWdEzQ2kq6Y
         1eSVOXTCr+qQbQ30MTJjUxCuAz0RU8kgzQLeq1WrC0HJdofH94tGUYpnMdmUw2VAbHx8
         q84VQi1QYc21FsTBSQOapRo4eSFjQlBD2M5xjJjDD0RZGA0cRr13Hok9Z7EJaGXpLI6Q
         RE5d25BCJLAfBDSH0ljZTUlf7vjGJsldchCQ7zKnxav2/0eZrFWlrWSmSJprvDHUwDzr
         6aAQ0PEqeWxoHcTNjiuvtPCmfRpZXktbqjSgMj8AFRkQ3I7YgJtC0x2Ux0EX1QbpKgSF
         2qng==
X-Forwarded-Encrypted: i=1; AJvYcCVlLDm/EhQLdZTpITcD6YEZgO3W+mqn1yLcQp6RCzaXXnwF06zgVqoxObdCqqaBbJRO33/rBDwW0v/7tA==@linaro.org
X-Gm-Message-State: AOJu0YziVhfe4e9VwTdXf+HwckWepVOafJafl+O2ExeQHkNvVcsI7GPg
	qLlIAgbASmg1HNjBwSwrQNALymp7wlKoCxHueHo7AkoLBIHhYg3GzFL11q6gn7mxhugd0tdM2bA
	SDOned02AkecfGU0eFj8sDcESUYu5O1WmSKss4oSQOFPwnDAhguBUh1A=
X-Gm-Gg: ASbGncuU4x/UFQU/781MfD41UW0U9NM/9ItTA8jakHFFte/zH4jtwuLY9ThBm951VEt
	WwopVyb4AB1Z8PsC3KyAXweotTF5CMdEZIjQwi9YCrAkhB4ZlIsa4QZ8wWi0xS9InB2thNaeDZU
	w3f8mcwYa6IoUGUUvAa+p2l8CwTJzUnMzwpz7T5zb4T78b
X-Google-Smtp-Source: AGHT+IFCAnEZls9tvJ2p1vJqD4nxu7483ggQioJYTrgA1iflgq8Prd6RdGmdyuEWQ5cYALjCPuoaeUD1L63dzhiU3Gc=
X-Received: by 2002:a05:6902:2849:b0:e89:9a4a:42cd with SMTP id
 3f1490d57ef6-e899d13b7c5mr3492974276.12.1751635984913; Fri, 04 Jul 2025
 06:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250630130937.3487-1-philmd@linaro.org> <20250630130937.3487-3-philmd@linaro.org>
 <CAFEAcA8KBTfJqUbBeUm9_=JoMf133Tt3tcWhJ=sSSy-Yc6Cdcg@mail.gmail.com> <eab8d30e-011a-4ec0-ab70-827f6a33a5c5@linaro.org>
In-Reply-To: <eab8d30e-011a-4ec0-ab70-827f6a33a5c5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 14:32:53 +0100
X-Gm-Features: Ac12FXx9p9M4oe1SZla9vu98oaZURWdG2Izp3rDg0x0klQ7UiXTxUxNHCnc1V2k
Message-ID: <CAFEAcA8sH8HyskYEfoNKFi9N3Bq7e0ze15_ouus82nEZSchrJw@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/arm: Only allow disabling NEON when using TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5B7IFuuU0bNY

On Fri, 4 Jul 2025 at 14:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 4/7/25 15:03, Peter Maydell wrote:
> > On Mon, 30 Jun 2025 at 14:09, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Only allow disabling NEON when using TCG.
> >>
> >> This avoids confusing user experience:
> >>
> >>    $ qemu-system-aarch64 -M virt -accel hvf \
> >>                          -cpu host,neon=3Doff,vfp=3Doff,vfp-d32=3Doff
> >>    qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or ne=
ither
> >>
> >>    $ qemu-system-aarch64 -M virt -accel hvf \
> >>                          -cpu host,neon=3Doff,vfp=3Doff,vfp-d32=3Doff
> >>    qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or ne=
ither
> >>
> >>    $ qemu-system-aarch64 -M virt -accel hvf \
> >>                          -cpu host,neon=3Doff,vfp=3Doff,vfp-d32=3Doff
> >>    qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=3Doff:=
 Property 'host-arm-cpu.vfp-d32' not found
> >
> > I don't know about users, but I'm definitely confused.
> > Aren't these three all the same command line ? What's
> > the problem it's trying to show ?
>
> I should have only shared this confusing example:
>
> $ qemu-system-aarch64 -M virt -accel hvf -cpu host,vfp-d32=3Doff
> qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=3Doff:
> Property 'host-arm-cpu.vfp-d32' not found

That seems correct, though ? We say
     * Allow user to turn off VFP and Neon support, but only for TCG --
     * KVM does not currently allow us to lie to the guest about its
     * ID/feature registers, so the guest always sees what the host has.
and hvf is currently the same. The bug the patch is fixing
looks like it is that -accel hvf lets us say '-cpu host,neon=3Doff'
but it won't actually do what the user might be intending. So
we should avoid creating the property, as we already do for KVM.

(The other odd thing here is that hvf CPUs don't support
AArch32, but ARM_FEATURE_NEON is about AArch32. But that's
a separate thing and we'd need to cross-check that nothing
aarch64 is incorrectly looking at that feature flag before
we suppressed it for CPUs without any AArch32 support.)

-- PMM
