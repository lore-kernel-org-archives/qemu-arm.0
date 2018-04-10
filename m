Received: by 10.28.71.155 with SMTP id m27csp3524719wmi;
        Tue, 10 Apr 2018 02:20:56 -0700 (PDT)
X-Received: by 2002:aca:ac52:: with SMTP id v79-v6mr1496236oie.329.1523352056205;
        Tue, 10 Apr 2018 02:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523352056; cv=none;
        d=google.com; s=arc-20160816;
        b=nckZZVagVYfhkJfZzyNvjdTMhkwEMXNPlZrUqdGdALTneAipn+Ytv3GrgCrTDU4m18
         qeqDUu1PwIYa9ZoH3dyAYJlG3rGgHDxRnoyr0ftGS9mifk70T5pA4Q78b3X7qTzUccVZ
         ezvPBaNWK+RzSqS7wqQmkjkBJOr66mwZUT2ZqxmEsu1DliuuwwwVqTT8mGiI2k3RjppD
         rQPsNPnjJoQcOAjJtQaNE1hQseqELEECeOmaQsI1stjfgCRPsxGTf89RTwRaKqKBXrl9
         M92b35JNLZvzHQneCKlB1ZZC/dnMyuClmOH1gt/OW9K4Btta2DcUH2cwxqRrFn0C7RSF
         L3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=EhIYjKmM2Qg9NsGHCNJhRo0RAEFOgbpVYRe2YOiZVGw=;
        b=HBZJYFd/SnbKfwu8X9+dNcF4ZvrT+Aboi29TlqAgz0qCkYL1e79kaEeAkaOVB9Jz5G
         twHQ7xLxVSgAhQMzBnmpnwgfaLR4CCf2CZ9mySjfMsRqIqyCzr8hKz3evyI/T8dc3nhy
         fHzrfERymmEx3gh35guqwkDXgLHWQklXs+FQDhgC0O6t83OL5dfCRe92ak5WqxX7S4vW
         3JccJxiU3w3+wVaWL1nROqYpkoBqEXhMagXV3rlIMfYihPl7FBHOIRtCsmPCAHNVRueF
         /AMBUtHrkBmFrvQq0islzQJCu9V5lZmKdZHUxEkkxReGfl2aYfL7GHbO51775BGYqG8/
         rvuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvqKFe7P;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e133-v6sor1076416oic.297.2018.04.10.02.20.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Apr 2018 02:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvqKFe7P;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=EhIYjKmM2Qg9NsGHCNJhRo0RAEFOgbpVYRe2YOiZVGw=;
        b=ZvqKFe7Pk/+KC2eYGqBSFncvFiBFBJqmLI9iaKRZNevV4uuLU8DqRM0l8pOAFatxhm
         CRs89AQx96pPvkpiCYefwUB4g55I20fgIRnDV1ZWWcZYdZNBpNAFTyxrEfsPfBe8/5ks
         goSTBBGDo3B3HJ2CAgIfs9EoydNfWz4qp7+uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=EhIYjKmM2Qg9NsGHCNJhRo0RAEFOgbpVYRe2YOiZVGw=;
        b=ENqniIKySoFGvbCl5GI6CNhSCU6WjOW5l2KiAIg/G0DuBYL88GlBEj+27SJa9DLH/V
         dfPbXvO3pS9Wis7ezFZ5IdjZ/1FRFBkrNCbnSxi9XQ1IxIS0aqMcuK/R2wpv6aD53wVU
         APOkVq+PtSDsoTdqD1pxN+5StxeZzya9cuCbObgxKTq6UP419Cil/qoM1ogUIzY9BOX7
         I1KNy58udaz9uD4qOFVkK9+rS0h2QStBGY4DnbFXvMC5yKNaqGP8o3pe72D9sCbrzGjy
         5CIfVYAQJxga+nbXM46d02CysKH41C2O4AyrnMSU+0IgRE9ZYFdng4e2NeaAknZ1k8f8
         IZfw==
X-Gm-Message-State: ALQs6tBeD07Na9L0hZL+8Woc/bpiAJUMAdzBkOSGIjmEBQX/nv/FanA9
	WqjbseGzFCoCG5qQA7r+VwXK0w/k38KPVR1nKwGAeht4j3s=
X-Google-Smtp-Source: AIpwx48+VrohwiYuKm1YJpinXNnwlgfh4X8t9e6hR33z7+de3WbxeXIkAVye6KQLSPYed03gvLao2Im9SKYCwngwe1c=
X-Received: by 2002:aca:3f55:: with SMTP id m82-v6mr1508179oia.252.1523352055797;
 Tue, 10 Apr 2018 02:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 02:20:35
 -0700 (PDT)
In-Reply-To: <CAHP4M8ViS=O4R+sMmR=CmkbgQtwd8RHGxLwNb5m_aMS_M++f6A@mail.gmail.com>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org> <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
 <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com> <CAHP4M8ViS=O4R+sMmR=CmkbgQtwd8RHGxLwNb5m_aMS_M++f6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Apr 2018 10:20:35 +0100
Message-ID: <CAFEAcA8xG_GrVL5zgZqN26OQGj0UHWFNZ9xWEmHJyaiUFZLH8Q@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] Crash when running hello-world unikernel
 for ARM
To: Ajay Garg <ajaygargnsit@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	rumpkernel-users@freelists.org, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: YTch8TyD/uE7

On 10 April 2018 at 09:16, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> On Tue, Apr 10, 2018 at 1:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> What hardware (what CPU, board, etc) is this "rumprun" software
>> expecting to run on?
>
> Yep, just to ensure that there are no cross-compiling issues, I am
> building rumprun on the pseudo-real hardware itself.
> In our case, the pseudo-real hardware are :
>
> a)
> An ARM32 "virt" hardware/machine in a qemu environment
> (https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/)
>
> Once I start  this machine, all environment is arm32, and I compile
> rumprun within this environemnt without any cross-compiling.
>
> b)
> A beaglebone-green-wireless.
> This is a arm32 machine bottoms-up, so no question of cross-compiling
> whatsoever here :)
>
> In both cases, I then use qemu-system-arm (on the "virt" machine, and
> beaglebone-green-wireless itself).

That's telling me what setups you're trying to compile in,
which doesn't correspond necessarily to what the guest
OS is built to run on.

> One query : It is apparent that there is nested qemu-virtualization in
> step a), could that be an issue?

Why are you running this in a nested setup? I don't understand
the purpose of doing that. It would be simpler and faster to
just run the guest on a QEMU running in your native host system.

Assuming this is the source for the guest you're trying to run:

https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch

that suggests that the only Arm board it supports is "integrator"
(which is an absolutely ancient devboard with very little memory,
no PCI and no virtio support). You need to confirm what Arm hardware
this 'rumpkernel' is actually intended to run on, and then give QEMU
the right command line arguments to emulate that hardware. I can't
really help any further, I'm afraid -- you need somebody who knows
about this guest OS.

thanks
-- PMM
