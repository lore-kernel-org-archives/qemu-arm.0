Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp264354lfg;
        Thu, 18 Mar 2021 04:21:55 -0700 (PDT)
X-Received: by 2002:a17:907:2d89:: with SMTP id gt9mr40526753ejc.226.1616066515546;
        Thu, 18 Mar 2021 04:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616066515; cv=none;
        d=google.com; s=arc-20160816;
        b=BPRB460WnN2ghlhFqTDreR0CfczKgpbSVvnTbabDKWFwqWyD7xz1frh0stsrjV08Ym
         nff1z04Nat6wq40Wshv3myLI16u8FKacxZEJk0Sr9OI3zNLlKLxAmIRt9JzNirdDhh29
         ExY0QH8ZSInIWD8yw+R3Wptc84cFkD5BEUZ68xoNeP8F6PM6z5QDc9hJO5g3YOHflh2T
         Z8foeYxvEoCiv+aOdetKQt7BZAdEiiB0fivY/+wSX478Z3oJH2Lo9MvrD+aOW1WBOUxB
         9vrulnKNpe+oc9BPrsmJQodksl4GCguUC5nkGzPVGgN+H6BeyFLElBEwyc5WpC4XjY5q
         Rjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TBmsAe7eB1LNAmL48prbY+P6GemZK7dVs0kkS9eWE7A=;
        b=PVQs+iM9weISOlibaNJpfgTtuRRrNafW8//y1MZ8Cy/eXNFWwg/Duo5pYh8wnxMBNX
         bK64wlZXKUKSYD2VO1iBUWfhnicO5Rs88pe4eddPXY4VXKNyt4ao79s1KdOiGboLrY9A
         7g5rXxsxOmwXT08QX6Y7CoI56qRuvQ2bT8Y6z8PAyNulKgOSllSQlrjjERZSdLMMxXuM
         +UD1F3wxCgyNgzpzXobVje7rUgCGeAc5u84WZDy3q3K3P/k2F5ZyEKG/rpfy9dWBQ+dX
         uP6UBspDc1P/j1s9qg4z4r0x8dctheUlwp5W/jYuTImdwbE+QgyZLKxG/dTwYEbzGDaZ
         0BNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GcVVGmMI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ce22sor959222ejc.54.2021.03.18.04.21.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Mar 2021 04:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GcVVGmMI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TBmsAe7eB1LNAmL48prbY+P6GemZK7dVs0kkS9eWE7A=;
        b=GcVVGmMIGdgVOc0oswPBptQuo/vJCiTd19MPsQjn2Mcv1T0S+hBYJoxuTgBJhwvtnL
         LrxqX2gTVKLZ8XWjZHImP1OyK8t2hdVyS97CCV5EiQZsr0pyk9hzhto3nUUm/YFYDSHD
         CpHKsCHpkuWwgm1TKw7DwGM3oCcQl65wDDiskPywEcDU/eHFtsiv9VFKo5bd6f1aWlox
         hieLEZU9RfUUZEz5KMij9/fNz5J+7fczrDRJzrC6u0yxleAP/7JaUb1u4H1l6CdP2fYj
         xtSY2QjtqXVYFqRR8BtSTkkuHoRv3w9FzsZVjFaNd+EMUk02/q1zIWtmFMywz89yy1wu
         Gufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TBmsAe7eB1LNAmL48prbY+P6GemZK7dVs0kkS9eWE7A=;
        b=gtQf9C/QS7hXP8FHb7SfxvKX6fCqc29V4nfZnT8ya2slF8DzoOuA9NL69dCIS6ZM2h
         qMWnFRTJccbP3wW2IxTA+0CJ7BmR8edpGyz+5bR7sc26i4BZEL1TkwWrLQgqPtsdd6au
         INzpbhlnNL4GA0o2o4WzuSbzLvpfjvx+Bj0xLUul27l9pEtkDKs6wSDFkjyc7IWs1u+x
         ZeKQWOIezU5fTTxZxq5Ln1rfuqNVwUQG+cqWVC9U9URkgU5iFMvSgzSk/dpMQBqQ/mwI
         tK+NOADjso6FO7Mv6r/pLgzEWwoW9oZoIC6FZBheSgr540Ia+V9HJF+Q7F2yMUDW8skN
         CIvg==
X-Gm-Message-State: AOAM532ToRM20IuoH0jDN7LH70M8Zm4my3F1RmCutCUmnjNIF2O32uvo
	o2DLrzQgXOw3mjVJzeAJ/1lXmi/8AWwlhfUmU4m/kV+e
X-Google-Smtp-Source: ABdhPJxycTeSWeIpXE604Rv7OKOhyPwdB/C0l37cZ9XFoEJPadt8TLt0mFAkArntAiJ+Yjwi+jCN60eEeH/i+uBtyoY=
X-Received: by 2002:a17:906:8a65:: with SMTP id hy5mr41270972ejc.250.1616066515310;
 Thu, 18 Mar 2021 04:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210221222617.2579610-1-f4bug@amsat.org> <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de> <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de> <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
In-Reply-To: <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:21:31 +0000
Message-ID: <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 30r7GqGIpTWq

On Thu, 18 Mar 2021 at 11:09, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Still, I'm not sure it makes sense. If you want to migrate a such
> machine, KVM can not virtualize it, so you'll be forced to use TCG
> right? In that case cpu_tcg is built in and you have the A15.
>
> IOW the problem is not this patch, it is that since 82bf7ae84ce we
> can not migrate A15.

Do you mean "we can't migrate a TCG A15" ? That would be a problem.
Or do you mean "we can't migrate a KVM A15" ? That's entirely
expected when we drop support for KVM A15 :-)
Or do you mean "migration from KVM to TCG doesn't work?" That's
a pre-existing thing I don't expect to work (we don't put anything
in to stop it working, but I'm pretty sure there will be a bunch
of things that mean it doesn't in practice work.)

> So we need both 1/ revert 82bf7ae84ce and 2/ be sure the kernel
> support 32-bit host... Am I missing something?

We're definitely not reverting 82bf7ae84ce if we can avoid it...

thanks
-- PMM
