Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp469805wru;
        Wed, 25 Jul 2018 02:05:07 -0700 (PDT)
X-Received: by 2002:a02:4a0a:: with SMTP id k10-v6mr18034358jab.134.1532509506906;
        Wed, 25 Jul 2018 02:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509506; cv=none;
        d=google.com; s=arc-20160816;
        b=037upeaRy6ttoUvdkWEB1oAxfzb4JliQN1XjvN4xx0ZDmVgDNGz8s76wEBjswaEnsd
         QxdY684kks9acsIg4FgFkZLEoa0BKlQhyCJMUuMTdDDV7m/KXLlLSy6JJyK50BMILG25
         ISLtgrgxzgn99rus706ci/QNUVTFDYW7Hiv7NGHRSVoNbpElNxYW6PAlMR2XDbVtrCTl
         n4puUNEKoWHBLZu1C4xFIRYmlYf9PwRl3ftqbGHtD8XzzJ6HgRdOtcabJ8YWfNnIbyPL
         ZFXGBQz+eIhNLhqFUMy6YtygDyAedOpkI3rmMWvuJXUkH9UpBavJ57ejiHWnLeBBMH2T
         TH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uHE+Y1m0SDdlLN9rwfnyQvzwsQdG+IT2idYx5nWTuvA=;
        b=S1XErw49ndYUayQ9NpeIB0nQXezfZO5jTXIHXyz2zElDS3OdRohSfZLUQ1gZx/spdg
         CL52RyX9e+DUbw2h0aTaLCv+SN/PH/YZrJ0XisLJVRtp9416mJnC5VJxAyZqIytexZEl
         65CVajZuXBtORSJ+yrpipI/TtDrEuOKggM/7g2J2zqoIntls0TBcekcNo4cXauBBIOaE
         sZD0PtIu7H4TZtye8Cd4PKTT6Vual0Xbb7Wc7+67g3ovpMW8I0gqgNgnJTxBKqHJxtQS
         i0XuBIHhTLggJs1Bpp6OR7455aM31MrbFj3xP6+zNJPAGWu1FLnzjs24xfG3cCUhDi6+
         RPKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fO1bXBlp;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 202-v6sor1172950itk.111.2018.07.25.02.05.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fO1bXBlp;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uHE+Y1m0SDdlLN9rwfnyQvzwsQdG+IT2idYx5nWTuvA=;
        b=fO1bXBlpOQgSAZ2djWrfXJF39/Lrnl7hGt9ljR9HzkmMC1JSCcQeFDVUhyfPsdWbo0
         /BpzN7JTKK1s4/07vhFxLfIBCdpEYl5BgIVcy6OjSSugiofxbsX5wrYVnY48YHrlCmlQ
         0mxL/fQdFKaJZ9914OOYc3LUdhGGwjNWT6CWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uHE+Y1m0SDdlLN9rwfnyQvzwsQdG+IT2idYx5nWTuvA=;
        b=AmWucBmflSPGUJ/mxyAUeV+FZPJ7YEOgK2yYJpuyDk6g7cX0Ps8lXn6xGgTYqFlhiH
         MSntw+MGfYh9tQfToehMzsb96/+mrZhkjgLjdHtRpE7Zo12LLU+e/r3IpxBn4tDzWWXu
         cfjizMYeY/mbp//peysN957qmY/WbjY+j9ZW9pSSg7I6dqPhvyrOMd97Y+WZsaFELWAK
         e32W2bSaoBFVh81eD/8kxdv/t6CPSVWqASbiu5F6agjk1clu2OYdKcmpjw92yxpUeAhh
         ms79NS2n94ZIqiqRw3/tVrI0vPYMYZizrpWZ3mkYWXf44E/noxrG8Uo0Aw2/LgHr5Zwr
         de6Q==
X-Gm-Message-State: AOUpUlGh5IwaEUZn6vurpJ5Gu79a3G9cj2w7WKpvEqYZhukaYxjMiGc3
	LkPqaU/Joghp4c7JAfhNRsfRNgZbc7r5QTintMWOhkT8
X-Google-Smtp-Source: AAOMgpd/mNS5KPWrTaIg2bhybBhzORdA8Fp2yR12fQAu0ask7uJQkOqsNuaKqxvUSQs5bRW1zc2umPMiscok/2w1mvc=
X-Received: by 2002:a24:3c56:: with SMTP id m83-v6mr5910832ita.134.1532509506526;
 Wed, 25 Jul 2018 02:05:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:05:06
 -0700 (PDT)
In-Reply-To: <20180725084824.GA12855@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org> <20180725084824.GA12855@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 17:05:06 +0800
Message-ID: <CAHmQWvDtNQsPDy1tCnsy9JbGzMxLAik5S0bBfpCj_0ig8=iZdA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OvM6DEuGqVZz

On 25 July 2018 at 16:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> run on KVM and execute virtualization workloads, but we need an
>> environment as faithful as possible to physical hardware, for supporting
>> firmware and OS development for pysical Aarch64 machines.
>>
>> This patch introduces new machine type 'Enterprise' with main features:
>
> The 'enterprise' name is really awful - this is essentially a marketing
> term completely devoid of any useful meaning.
>
> You had previously called this "sbsa" which IIUC was related to a real
> world hardware specification that it was based on. IOW, I think this old
> name was preferrable to calling it "enterprise".
>
Thanks for your comments.
Frankly, I myself prefer to 'sbsa' too, in fact, at the early stage of
developing, we called this 'enterprise', but later I changed it to
'sbsa' until I sent out v1 patch.

The work Arm TF and EDK2 porting to this platform needs this name to
be defined finally.

>>  - Based on 'virt' machine type.
>>  - Re-designed memory map.
>>  - EL2 and EL3 are enabled by default.
>>  - GIC version 3 by default.
>>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>    can be added to it.
>>  - EHCI controller attached to system bus, with USB mouse and key board
>>    installed by default.
>>  - E1000E ethernet card on PCIE bus.
>>  - VGA display adaptor on PCIE bus.
>>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>  - No virtio functions enabled, since this is to emulate real hardware.
>>  - No paravirtualized fw_cfg device either.
>>
>> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>> Changes since v1:
>>  - rebase on v3.0.0-rc0
>>  - introduce another auxillary patch as 1/2, so this is 2/2
>>  - rename 'sbsa' to 'enterprise'
>>  - remove paravirualized fw_cfg
>>  - set gic_vertion to 3 instead of 2
>>  - edit commit message to describe purpose of this platform
>>
>>  hw/arm/virt-acpi-build.c |  59 +++++++++++++-
>>  hw/arm/virt.c            | 199 ++++++++++++++++++++++++++++++++++++++++=
++++++-
>>  include/hw/arm/virt.h    |   3 +
>>  3 files changed, 255 insertions(+), 6 deletions(-)
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
