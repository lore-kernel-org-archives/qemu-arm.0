Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3707158wrq;
        Fri, 25 Oct 2019 05:06:38 -0700 (PDT)
X-Received: by 2002:aca:682:: with SMTP id 124mr2730127oig.83.1572005198728;
        Fri, 25 Oct 2019 05:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572005198; cv=none;
        d=google.com; s=arc-20160816;
        b=bQsHnhqBWsMR7WiDKtn8l3O5cDaSBppcXSp3nB2X3GmE9RWY/XYQOC1MV93N7SyUrL
         Uk76APmpKks/CCzdyHyOkNHOao8jRahHzrH/aWZomDQCOgmI4l3gv8Zx1NCxaSq7v9bH
         lS9ZhyijreGJaCSsGfyJMzEImX3sDexr0PCbcXp9lkmcEANxGDNHzIkBcBk93qaxR+X/
         sHUeKCqbdRKLK5hizu9BWwlaN6qTpuT0pGYGpaCrRqASFcy1FZwm9aOp2Vg350tjzdh3
         gh5lU/+6xky9IokEFCWg7fAuZcxHTtA8sMMWCIXB4PjHeIX2pjBu8reFTgtGwb3HRJks
         o/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XrJZ5Upat20NnQrE3c+6xlKbmz6+F99IqJyeX/iGlpo=;
        b=V2zIDnUlzcM15ptcrQx610jhUJFSRfZ/+t0fEcY2hQxNHlqjhNVsxhEwXVsCluOu81
         IXcB95w3G2doN0HsaVrJ9ER6G87k8CCzDJxxK3EhN1wmUoyEnBusSkr5pKces6Hp097o
         7shppErpJMZfV70a8X4+AJlOzs7LYJeHH+dvUvu0LfNbjhvu8ZbN+E1+Oa0aPFNLMaO5
         3UgLWx7ObObMYrGLpEEK8LoSx/rMMypKq0/GuUgZF9LetIJ0CrKVYV3ZmHMjKpHnp8PO
         jQnCQc/tlbljM3L0PH+grI/7ZOqLHxIIdSV8gcJMqqVqdnHOsD1SIYmMK/+S+o2HH86/
         LMgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xv/S7XCp";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w199sor994178oia.15.2019.10.25.05.06.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2019 05:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xv/S7XCp";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrJZ5Upat20NnQrE3c+6xlKbmz6+F99IqJyeX/iGlpo=;
        b=Xv/S7XCp5IYCu/bj1oeYZFcWfOfCr2u6tZEL0S3sojegoQ2vZi4EJWaqdS6v2akBRu
         qMkE1LNVQduee8FIF7frI7B1u8YeWayEFyy/mrUNhEKOsfuqgQ2yBCat0jIkTqYOBjF3
         yvXrLtIOAYp5oYZyOLn4g87Z9ePgydxofGgfg2dPyEc6lsaNoFhoxiH88lwPGpUYgBcL
         i0NJDzPDA/JNCDAcR3bO2pAUU4u5141vKLTl9am7G0r9tqNRk7kyCqGv2AU4D5hVzBdQ
         V6ji+jktEhUXVjzh9lx3l+Je+Fx6u1EpZgB20aX5pbF7Kq0UyrWgAbJk4Il18flPuzHS
         JXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrJZ5Upat20NnQrE3c+6xlKbmz6+F99IqJyeX/iGlpo=;
        b=o9FDQYP/rkfhytmkykE2N2vL5Ywl8ya9MS8w2zbQoENVD1V2bEdig/oiCalHRX9M8Y
         1dZxQOiPA9q2+ruwxlPyty4jpVqUAiunJD3qABaOkeOymKVCCpTpYDYKV40l1goR/noK
         A4Wa7BoJTvMvAzEaKw/GnzFvWKA/bo/+KUHc//yI/162oiGKvxHGoeA/kBEr875UtD4A
         D+8RL0nEVC9EJeJ2eAxgO8iZAUz3nOTLl7KplQeA+EoBjJei9psuaHzl0OIJxHu8XuDC
         0NIHxyL0kVmuAzlK7GxX0B9zNYkId2hTX9XWiYfHw1ZouuOovk5wHtvwwre7BhVJA8X6
         aMhg==
X-Gm-Message-State: APjAAAUoQx2E9OH0HPSOMKymh88YHqAxFurwX6cIMXz/wuBQzkTGclw1
	Gqx5CI2UD/J6NkYH0LkFoeMzAFbhRPDldax3Qqd2DzOO
X-Google-Smtp-Source: APXvYqx14+9iGIOuDNbFI0CEcx1ayIbAwq43UODovKcay0aj8tmI+9BvMGRcYtry7TvYCQDPd1XZeuHc0iBCKoId8R0=
X-Received: by 2002:aca:451:: with SMTP id 78mr2771712oie.170.1572005198127;
 Fri, 25 Oct 2019 05:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191024121808.9612-1-drjones@redhat.com> <CAFEAcA9ehcuktCTGR0xpTvZegUkr99H62F_fiT7RY_L_dqgN4g@mail.gmail.com>
In-Reply-To: <CAFEAcA9ehcuktCTGR0xpTvZegUkr99H62F_fiT7RY_L_dqgN4g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 13:06:26 +0100
Message-ID: <CAFEAcA981jAU6F9RRWBuzg+_5JDrd-ip-L_awtzdZFqKmewMvA@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Eric Auger <eric.auger@redhat.com>, 
	Beata Michalska <beata.michalska@linaro.org>, m.mizuma@jp.fujitsu.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>, Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: GZLDgoeaaGOo

On Thu, 24 Oct 2019 at 14:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 24 Oct 2019 at 13:18, Andrew Jones <drjones@redhat.com> wrote:
> >
> > Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
> > This series provides the QEMU bits for that enablement. First, we
> > select existing CPU properties representing features we want to
> > advertise in addition to the SVE vector lengths and prepare
> > them for a qmp query. Then we introduce the qmp query, applying
> > it immediately to those selected features. We also document ARM CPU
> > features at this time. We next add a qtest for the selected CPU
> > features that uses the qmp query for its tests - and we continue to
> > add tests as we add CPU features with the following patches. So then,
> > once we have the support we need for CPU feature querying and testing,
> > we add our first SVE CPU feature property, 'sve', which just allows
> > SVE to be completely enabled/disabled. Following that feature property,
> > we add all 16 vector length properties along with the input validation
> > they need and tests to prove the validation works. At this point the
> > SVE features are still only for TCG, so we provide some patches to
> > prepare for KVM and then a patch that allows the 'max' CPU type to
> > enable SVE with KVM, but at first without vector length properties.
> > After a bit more preparation we add the SVE vector length properties
> > to the KVM-enabled 'max' CPU type along with the additional input
> > validation and tests that that needs.  Finally we allow the 'host'
> > CPU type to also enjoy these properties by simply sharing them with it.
> >
>
>
>
> Applied to target-arm.next, thanks.

Fails 'make check' on my aarch32-compile-in-chroot-on-aarch64
machine:

(armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm tests/arm-cpu-features
/arm/arm/query-cpu-model-expansion: OK
/arm/arm/kvm/query-cpu-model-expansion: qemu-system-arm: Failed to
retrieve host CPU features
Broken pipe
/home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
terminate QEMU process but encountered exit status 1 (expected 0)
Aborted

Dropping again :-(

thanks
-- PMM
