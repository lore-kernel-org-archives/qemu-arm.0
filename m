Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5834721wre;
        Thu, 31 May 2018 04:59:54 -0700 (PDT)
X-Received: by 2002:aca:b888:: with SMTP id i130-v6mr3871141oif.279.1527767994603;
        Thu, 31 May 2018 04:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527767994; cv=none;
        d=google.com; s=arc-20160816;
        b=Oyt068STdMhxPtglrLA8M4i3HwcC8DGBzDX+/i7VQ1vITnf7CcXklslqOeVt0kxJUS
         URmMwOG8fJU4/rOA/FEp4fV9Y6xekPsKN+lNT9PtwKgaet6iHPScUyLi/jpIKK/9o+RR
         GSv/X1YwZ930sNsfSMqmjApS/lOOp7DJj6wt3us3ZNjv4UvMWl7mDoZpRNON0UhzPwL/
         ijVeQZ03OCpwu2gTzguhmvprQeExC5tZ3IYvTjLS4ImQsuE3lJU6Sq/bQWyWfjpZGbpk
         leN6GTnliCD8ZnDA/m6kWd+wGVLUAm99e4r0QdeEc6kUF4rKX62EK5Ky+ZZ2cz2WnzY0
         ZHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=/ixIJ3ACfZnSooa4i8viV2+O90B3l4NVW0sMYt3Dw8M=;
        b=gE1n6+iHnBEw/ubjwjhF8L5DE2kPghXM+sptgsb9hC0B5HteHKp2AXYjYnceKUt01s
         aGnjWbg0NAyny76MZkKq0R5uh/FPabhzFLcwa+6EHA7rIG89mw6l3x9WiK7H5+zTVDEs
         ZNuSOci1hdStluyo/rGWI9L1XUgA7rM/ELGx/PG7UENS0WAR8us9hvV1w6BsMYvMjlCf
         XkgoX8LSKanyYrMFoz+kPSXTPu83TTS8HDl0cCOWnav07I56rF6/8fjJ6qdCWPuk8SZb
         jOcwAVjdgl+UQJluM13xXzkgxA+rbaz74Nypfjy97STOixRZ1aU8gw1zN2mAGFNai+HF
         6AXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnAVdaHX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m2-v6sor16747659oim.60.2018.05.31.04.59.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 May 2018 04:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnAVdaHX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=/ixIJ3ACfZnSooa4i8viV2+O90B3l4NVW0sMYt3Dw8M=;
        b=hnAVdaHXihq92FjhVWl6xS7ZqFTzpfhQkHIvcts1VENFIZGmKi1vv2GKQ/Q6And9kj
         sBiV3HCLwE+lMCtCi7ff0gZTImKUpGcjFwfKzjiLyjXvjRZbAhaeKoO6rQq8YTJsduhO
         CieFgH8/dVdH6wXiGnhFRjtTPun43NMODI1DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=/ixIJ3ACfZnSooa4i8viV2+O90B3l4NVW0sMYt3Dw8M=;
        b=Fw+8SCFYUv/41wNzJamP/kFVwlRNmMVqwtylspi7W9QVxEXHtu6cgSyfchJEMiUoel
         EZ8Saax9c+nFH1uJXfjvn35zWTZPjyLGP93XhKXM0UQKtF0xfN9TwrS3/9QZiEzHjPcH
         vFdVluXWfXKfqzj60ehKVVWoGL4NjuAD7RcQuSyRV+ofdYAJAdOWWUrv999BE3bVqs2o
         hg/m/kArerkp7i+xemFpqIRT8+wXRuBqlXPoqGC4AJbOSMvmyDlJLJf5IAJ1aPTJSVfv
         r2xs9R6+3DTzYWurEgpcMlrFUrNHIM0MdQeoN204MLQy7VAAqL8Y5OOeY9EEzt01IwNq
         3iZg==
X-Gm-Message-State: APt69E1Z77ECJSqjYTAZzEqEKoFs2tdVNOUSrkvlDNTa9bxVIAlcpu5P
	bymiQpQeZPdCiytiHfsf74ILdYmaRownXSpcmYwNmLA5oXY=
X-Google-Smtp-Source: ADUXVKKycp/D2J9a6ZJI3XhstjVK9YIy3J7w9H0MYivr5N7qEF0GhcB7D8OFkmyk89rK/hhfzxLFmxJOvc418j/18p0=
X-Received: by 2002:aca:538b:: with SMTP id h133-v6mr3842195oib.252.1527767994255;
 Thu, 31 May 2018 04:59:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 04:59:33
 -0700 (PDT)
In-Reply-To: <35601960-682e-9ccc-c724-2c6504e8cc2c@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org> <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
 <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
 <530bef1b-a143-1566-3089-32629ab250b8@redhat.com> <CAFEAcA94JAccGhbhSrBkTHUV+dLR-EvYQW_nuB9FodtLTDQPZw@mail.gmail.com>
 <c7e4c537-2174-005b-fa15-0e8286e540ad@redhat.com> <CAFEAcA8p=PzfMbzbE6zQ-mAhP-vgvDRvPTjharRD76BFLyS_fA@mail.gmail.com>
 <35601960-682e-9ccc-c724-2c6504e8cc2c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 12:59:33 +0100
Message-ID: <CAFEAcA_8cPWHUQaBFE4hO=YKCTHUpNyBk=LUt11EePvU417j_Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 23/27] hw/core/or-irq: Support more than 16
 inputs to an OR gate
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AAkWo5brCY8m

On 31 May 2018 at 12:50, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 31/05/2018 12:50, Peter Maydell wrote:
>> No, calling qemu_set_irq in postload is a bug. (You don't know
>> which order the state of the source and destination devices is
>> restored, so asserting a signal in postload would have different
>> effects depending on whether the destination had already had
>> its state restored or not.)
>
> Hmm, I suppose the x86 world is a bit more "hierarchical" and you cannot
> create a qemu_irq loop - and creating the sink always before the source
> ensures that migration works fine with post_load.  I'm pretty sure that
> there are devices that do that

If there are then they are broken, because that's not how
qemu_irqs work... (Similarly, you can't assert an irq
in a reset method, because of ordering problems.)

>, and an interesting case (for the sake of
> this thread) is the IOMMU, which prompted the introduction of
> MigrationPriority.  Thanks for the lesson! :)

This sounds like a workaround for a bug in the device implementation.
Devices shouldn't care about which order they're restored in.

thanks
-- PMM
