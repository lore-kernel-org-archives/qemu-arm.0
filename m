Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6916879lff;
        Wed, 15 Jan 2020 05:32:17 -0800 (PST)
X-Received: by 2002:a05:6830:10d7:: with SMTP id z23mr2722772oto.114.1579095137575;
        Wed, 15 Jan 2020 05:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579095137; cv=none;
        d=google.com; s=arc-20160816;
        b=Fqp8nV7BMHo3sO4FEH/4CIrXTeWrEBHxwKrbFlFKwxby0SD8GtI7rVBhNIfY8arevl
         x1oMwi9PLfXeKeSMXX7dv1nxQ1Ojg7jXN1wQM1TVL6QS6N9mhl1jko2GMBlic8UVhJTB
         wr5SOYppsD6S3+ND/0QA413tBPTP4q9bhbqL+BZV6O+aeHdtkchQzU0B9hiit5Nd21/O
         ztSOiyIVFQS9Fh80qI3t57tDXUiD2TE8g2nYN8FUAAVB6rFPqAaoH0jMjfe1EMjikv5X
         9oyqpRF4uHzyeDDlt/A3NqAJrWh2c6zhvGz8tYMHd6CNs04VRslah/fe4H72dWrlt+O6
         zqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/qC7LfI0GU9GYF/RzGSxqWfl63MVN3CJgjG7Md3SD2k=;
        b=nYufxuN8BA3koBEx25KhfhNBhFb83KI4O6AzcNIwY1AsaljFeIlOQzeohR83mlU5LZ
         DTYZBCxOrNPjGWFASW9DWB3Z/THEUBQhCUo8z8xjGPmXsmcvs/F279JbKYMTk0Mim0mj
         pIT98+F9ViHEXKimcBXsAT4OKl/VMw/TMC0zbXb3VSovrlDg6T6JwbWUgSy8o1aQoN1+
         F2pmZ/KU1jIebA1D0tbpp+/fmV7794Rz29kkNo2xCb0ZOOBtaD3FjxiIUho9pJN2uye/
         B2ltctZO3zTr9vVSCs0EuOpESRB/c+gY0GetW4DTbXTjvcfECE6GmSa1pu77CjUMbW8B
         1lFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fB62mJUG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g18sor9200664otk.82.2020.01.15.05.32.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 05:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fB62mJUG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qC7LfI0GU9GYF/RzGSxqWfl63MVN3CJgjG7Md3SD2k=;
        b=fB62mJUGIxCLCfDTEFnx3mFz9+0c/4Ved8CRsFunCjbUcn8PF6iQjeEvN7awubxuYg
         3JGDhZAt9ogdv2zcAMQIM8DZCLM3hwkOUiGQREDb8dR8t4pb6j74XJH5rU03Fihw/VYT
         0TFoqQfgrcCgEzaPa0+kh0nChlzyb6bn9Xto7kkYT2bK04kxljKuC9NwPqD+EBDDUvNl
         mSc6h+exTEgTh/Y8E3wMRshOVSfRR4ghCafDAX7Eh9C/gZovYcBWK2VjvYaLOR2fVWaN
         HKXwDner1+GQB1GlN+rkP8L81A/nGp4pdr6dhZBb/W0mvTOVaClbx0l0VgwqjgBirxk/
         VWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qC7LfI0GU9GYF/RzGSxqWfl63MVN3CJgjG7Md3SD2k=;
        b=KPeDVHexbpgnMMelksm0EnqrV82+BdhkqvzUIsH/Fa6vwD8ctS+lrvE8Rkoq4YeMBS
         07jLz8ekP67qSJXsm0M5AmSzfpBz7Q61Npe/AujCdXoN+7lMZcMkD14RLI6xispwD2+0
         t+gGW6yM6ef0Iol9GghEqaI0ksMy1ePfm+A8O0Wy6UZDhja4Ijmo212ltjv9efv4o4KI
         lZe9qhr2H3NLa6uJs+nAMDgXjCTkpkeikfrx1evF78iF4OG2ZVLyb8YeJ6IAqpHtcTFM
         UWRzS0090fRqzDl8Y/Mx9EqQdZenPER8May3etaecyM2ColUBFGmsqJXBluWULqIrhq+
         LLVQ==
X-Gm-Message-State: APjAAAXSrp9Vf24MmhrHhMTmP5k0bH71Z66a+UdPqUpvcnZH826z52Zi
	co4C8cY6bOtk62a4vKOaPFjREmexcR7V7OndEdWAuHq9+BAWgw==
X-Google-Smtp-Source: APXvYqwjaV3uaYdFtLb1OmV40Z+tpi2faV9rWGGcgVvlfd6pscpJAFJs1+9uHWSX6hp8dXNGwT7GrxvUTXij8qaGFrw=
X-Received: by 2002:a05:6830:184:: with SMTP id q4mr2782901ota.232.1579095136812;
 Wed, 15 Jan 2020 05:32:16 -0800 (PST)
MIME-Version: 1.0
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <CAFEAcA-A_caQgwi5DzExdZChoTg-Qa73hq7Ho7dPLiN633Yj1Q@mail.gmail.com> <3ab2ca1f7a9b37b201a58f3a817edc5193e8b1f4.camel@kernel.crashing.org>
In-Reply-To: <3ab2ca1f7a9b37b201a58f3a817edc5193e8b1f4.camel@kernel.crashing.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Jan 2020 13:32:05 +0000
Message-ID: <CAFEAcA8mphBky9Q2HTdOpQHiizd+5-o=yRnBbd_k1y6Uk-h8dA@mail.gmail.com>
Subject: Re: Semihosting, arm, riscv, ppc and common code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: qHtfTCtFLMEx

On Wed, 15 Jan 2020 at 01:17, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2020-01-14 at 09:59 +0000, Peter Maydell wrote:
> > Note that semihosting is not a "here's a handy QEMU feature"
> > thing. It's an architecture-specific API and ABI, which should
> > be defined somewhere in a standard external to QEMU.
>
> There is no such standard for powerpc today that I know of.

So you need to write one down somewhere. You're proposing
an ABI which will be implemented by multiple implementors
and used by multiple consumers. That needs a spec, not
just code. I don't want to see more semihosting implementations
added to QEMU that don't have a specification written
down somewhere.

The riscv single paragraph in their arch spec that vaguely
says "works like arm semihosting" is not sufficient detail, incidentally.

> Keith and I are somewhat of a different mind here. From the perspective
> of the user of that API (picolibc is one), it's easier to deal with a
> single one and have everybody inherit the same bugs.
>
> Now I understand the point of wanting to fix the mistakes made but I
> would suggest we do so by proposing extensions to the existing one to
> do so.

The point about the mistakes is that you can't easily fix
them by adding extensions, because the core of the biggest
mistake is "we didn't provide a good way to allow extensions to
be added and probed for by the user". So we had to implement
an ugly and hard to implement mechanism instead. New
architectures could mandate providing the good way from the start
and avoid the painful-to-implement approach entirely.
(I think RISCV has already missed this window of opportunity,
which is a shame.)

thanks
-- PMM
