Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp206867wru;
        Thu, 26 Jul 2018 03:27:45 -0700 (PDT)
X-Received: by 2002:a24:be8f:: with SMTP id i137-v6mr1331549itf.113.1532600865421;
        Thu, 26 Jul 2018 03:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532600865; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8YhOAn4ZjSU4JMQ17+mIu0x20810O08gNzIqBvLlaZbBP6Fno3f2YFHi0kLR4K7/3
         wbzgizaYH2fhFAzHABBz1F9PFxNGB18pbQykz9IAAZasTk/BfA/S8+WEXslk0JBBHtMJ
         uMru6nlu1PdRWrs2VfkMPf2tbAaUMK4Q6MNyYyLPm3DP1SyqaKXTyK2LKdvy+JNGEtof
         Lvs09ZjURzW6p1Dpw3r+a/IrQaXpE7kjiSASELqKnMGFSxgQsgK30pgF+IKUt+OCcM+x
         C79MbXqrcFoqUWf1K5ycu5vhpWU3H+VCctnrwP0KzjUnnOAJUsft1WdKB2Lf8luH81Wp
         kSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=LsHQVF9pYBg5p1icsmS7hH/hXw1BRwljHyZ2MbZiDzI=;
        b=Wt8l7z6uX/aDocxADq6dftEeY3VDCsiQepn9Ww1kdPZvVZEAN1+2x/Y1GeehnTawGl
         oIog6/PBCvF04ahbHRPx0g52VtnCRDl7zb8nD2WemP8dHxoyUOGr4dko/JfiYeQwSS9r
         xj5CKgkxxhEKBf63GK5+MeOQ5yYiYT3vZcBiu+rCQqtSRABL5x437qPVbe8mnxmtw3IJ
         UAx6fCfqaz8LfGHwq3JaDt0fW65DLAfEaYsgRNIZBkCONxXBeeOvVNG3FMcn4sPGKubB
         RQjwJISIg/QByZ8gnyGwdI6xB+UMWIVgOCtp3QERSzh6XXRKKUeCXCY8BwMdg5C4DOL0
         d1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hvr0QiQu;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q25-v6sor402000jak.13.2018.07.26.03.27.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 03:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hvr0QiQu;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=LsHQVF9pYBg5p1icsmS7hH/hXw1BRwljHyZ2MbZiDzI=;
        b=Hvr0QiQuqmpmhu5QHmwGKMW8bLAIIfRM6EH2rexvQPZulelz6qfBwjOvrx0yMJk6TS
         Vf+wKL9Rwze5X7xCGyNTbghQEr82v0IugXU+EGMk1/V2JkccUkdn4CyFf5hRYJzFBAmm
         U79GQeGk+7KaZqhNsra5JUDd9MpOmSETiQWMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=LsHQVF9pYBg5p1icsmS7hH/hXw1BRwljHyZ2MbZiDzI=;
        b=RQAdqDsK3XJS0FPN2AZRHzOLdGSFPtiCzIAo8hHBxL3WcDmWGUV5gy1/KR9iawL4ir
         fqG5+8z9LzJ02dnIZyKdHIDxdbe/pX2xdWlOXPQJ6w6qerE4h4ZyL30JhuVzNI+dqQde
         8FDkcAvaaI2qYeXGpSwZQ3ItXvD5gpSXSWSCxDSNnrBIzdIxfM+Cg5HXRdbd2UOZmd3S
         cYCwT5juWuHoZw/PDl52te5XAkj53Qqt1+Xv5quAN8ygh/KxC9LL9RzAowdG4FRUMUOR
         LEFzhe0ZIkHffDkNrkXpjlO0bCBgawL5QaShh8UigfvqZ4lrIyIMEDTZa2rK2Cs3xUOz
         PI5Q==
X-Gm-Message-State: AOUpUlHcpGOywpD/F64sERWsTut16J7G8j3jVRU3dYfx79I3h7VKMd3/
	jBjOWOGFdy0pdjc5NmYN/cAcSqZ5cQfJDjX8duIp8gZtSvU=
X-Google-Smtp-Source: AAOMgpdjJ0bmljpR12v3gX1Y8M4Sva9qjXjpB7OZbrBEJlmGAVhhPRfJCzTxlvVG9d8xyqMDf9uU7m0ye9g6rUxiPOc=
X-Received: by 2002:a02:687:: with SMTP id 129-v6mr1172306jav.59.1532600865115;
 Thu, 26 Jul 2018 03:27:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 03:27:44
 -0700 (PDT)
In-Reply-To: <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 26 Jul 2018 18:27:44 +0800
Message-ID: <CAHmQWvDZytNXkw05DAnq_5HY3RN_UZUpue4kQ2-xSb+75SPgAg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: yFg/WlZoGSkx

On 25 July 2018 at 20:19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 July 2018 at 12:44, Andrew Jones <drjones@redhat.com> wrote:
>> On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
>>> For Armv7, there is one typical platform 'vexpress', but for Armv8, no
>>
>> Wasn't the vexpress model designed for a specific machine?
>
> Yes.
>
>> Namely for
>> Arm's simulator?
>
> No.
>
>> Is the vexpress model really something typical among
>> all the Armv7 platforms?
>
> No.
>
> "Vexpress" is a model specifically of a development board
> produced by Arm (the versatile express). It's useful if you
> want to run code that runs on that devboard, but (as with
> most of the devboards we model), it's not necessarily ideal,
> because it has all the limitations of the real hardware it's
> modelling (in this case the big ones are limited memory, no PCI).
> The hardware it models is also quite old now (maybe 7 or 8 years)
> and it's not really "typical" of anything. (In the primarily
> embedded space where most v7 CPUs are there's not really anything
> that could be described as "typical" anyway: everything is
> different.)
>
> For most people who just want to run Linux on an emulated v7 CPU,
> I would recommend the "virt" board, for the same reasons I
> recommend it for v8 cores.
>
>>> such typical one, the 'virt' is typically for running workloads, one
>>> example is using it under OpenStack.
>>> So a 'typical' one for Armv8 is needed for firmware and OS
>>> development, similar like 'vexpress' for Armv7.
>>
>> What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
>> two years?
>>
>> Note, I'm not actually opposed to the current definition (because I don't
>> really have one myself). I'm just opposed to hard coding one.
>
> AIUI the aim here is to provide an emulated platform that is
> set up in the way that server-style armv8 machines are
> recommended to be set up, so it can be used as a testbed and
> demonstration for the firmware/OS software stack. The hope
> is that following "best practices" results in a "typical"
> machine :-)  But the word "typical" is probably not really
> very helpful here...
Yes the aim is truely like that.
Let's forget the word 'typical', a none-english speaker may has his
slightly different understanding according to his own language
culture...

>
> I would expect that in the future we'd want this machine type
> to evolve with the recommendations for how to build server
> platform hardware, which might indeed be different in two years,
> since it would be the development platform for writing/testing
> the firmware/OS stack for that two-years-time hardware.
>
> thanks
> -- PMM
