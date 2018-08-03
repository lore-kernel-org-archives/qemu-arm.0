Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3002970wru;
        Fri, 3 Aug 2018 02:21:28 -0700 (PDT)
X-Received: by 2002:a5e:d609:: with SMTP id w9-v6mr5381327iom.54.1533288088465;
        Fri, 03 Aug 2018 02:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533288088; cv=none;
        d=google.com; s=arc-20160816;
        b=iaEmP4xdVsnW5Nb+gYI7+Kb62h65Va/I+spSfqwiH/JH8ZH5VxUVU0d4VbuRnkR7ma
         vnV7EEInx7NkXK2GJY6x6hBiXu7qjdKLgWkjGLr++xXHNopNsN4OUFFS7bIGMauOPVMJ
         IkGxSROTRcD5+C4iSFfoqRinU3AVtkGF3uD11rU4DlysWxiqYIjGMtE7bxs8NRMjygtr
         Ajqe1K0lI2AF5yJ4f7W+BUV35+G00Kn3eE98wkqoxBrNhz4DDhrhUnUVQf1CPqaUjlwR
         f0wcjwkYGPNhaIZY8cST7RoPvD01T0X2Q5NnXaHYdLTb3EDIGzRqcJDJKovwYYhB/tjL
         c48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=jhy4bz2AZ+uiaKr40uWVQ+P2wan2ivjEwaa2sCaHAEg=;
        b=LNBOZ/OINjGoGg2Z2dhQ/eqVrV0dUvDC1dGj5l64Mu1jNdAHwNwUt+xKjrAyFNwm+k
         1twE/dC0DkCC0jZ1kHrrrW6g6qGeYaUvkt4KJX9jBKJGBS2oVLZHJhTRvHBnBdjSQTwr
         zxNDZ+aYY/hn9Izfre+evvFuDF+NtSSDheJIMvqjnpwvc3Dy0iojTCCfDvUW93dNr34c
         1ChYVCi4GPScqKkJKhpXw5qUMWruAaEmj2nY3QsYTC4JaSZfbYY1xAdtboK//ZnmVo5Q
         U3wB/3BNqhR0uz413b0PZbtmELqNA6/yNK0kJDrwh1jg1J0ns8YYh9Ka5KF74eXaTQ/9
         Jnzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAqXLNdD;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x191-v6sor1604430itb.34.2018.08.03.02.21.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Aug 2018 02:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAqXLNdD;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=jhy4bz2AZ+uiaKr40uWVQ+P2wan2ivjEwaa2sCaHAEg=;
        b=PAqXLNdDN7k2ieCzPnlRDAHeVqK+/bmm6RBd/8fNi4M2frr4U+d1v7zy4chAVpFaqo
         n+mRou+TIRRKvlHqe9YKM3aoXsuiMRiQRYNajTPzfeF6Rx65I0mGPkvv2Nbflxk0LLHU
         1bksiggQqFyJiDY0dm+Qqq4w7Z79xOaItUzT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=jhy4bz2AZ+uiaKr40uWVQ+P2wan2ivjEwaa2sCaHAEg=;
        b=dUOvU/PJjQwSS3ZRa0ngu7vZ2DZEJHN0/YmMNCvTybs9QuSp12EJZhFcIU7xw5YedH
         2amrf0LXSTPZSu0I9sXORqzscZCZ46PEoDdTv7+XbRRhpMq8tm0tgLdBsLP5ajToKtPM
         0lN/8dpiBSBLzNVN5qnmBQJyOt7VQV/yLLGJgwLxnde5yZrtW6gJtbbRoS1xWga25ymL
         AL/58zfRazzLlcFrj4CXiukWOudWfASZ9VD+EG8IyO+OY0kfb39JJUVK62Zl7PAfb2F7
         Ipe0PMmu49kujTKpE10JlYovovbh3kkZpIwkeeG1SPAoaVuUqkbUzXykzwHoN1yg3WFk
         lAyA==
X-Gm-Message-State: AOUpUlHGoeqsPn0tk2iZ86Dd4kP/YGbJztwEyx8ArwlO8jjXsqtY6IHa
	B6q8E0IxCU0K3SX2JOSdMGLNsxk+nPqDzVcgIr1oNAg4
X-Google-Smtp-Source: AAOMgpdR3wgv4wVKTb9MZQWhGvNajbZno/4aNgsVKc0SIMfZQCeP9KREnEYj3tI/s6iq2LaWoRoC8BfzNgNT+2YNEGE=
X-Received: by 2002:a24:a005:: with SMTP id o5-v6mr5592829ite.124.1533288088147;
 Fri, 03 Aug 2018 02:21:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Fri, 3 Aug 2018 02:21:27 -0700 (PDT)
In-Reply-To: <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com> <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 3 Aug 2018 17:21:27 +0800
Message-ID: <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: hfFBzm3JzXWT

On 26 July 2018 at 20:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2018 at 13:35, Andrew Jones <drjones@redhat.com> wrote:
>> On Thu, Jul 26, 2018 at 01:10:34PM +0100, Peter Maydell wrote:
>>> On 26 July 2018 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
>>> > The patch guards the generation. It'll only modify DT and ACPI for the
>>> > new machine type. But, while modifying the DT makes sense, as that
>>> > generated DT will get consumed
>>>
>>> ...will it? Why would we want the firmware to read the
>>> QEMU-generated DT? Real hardware doesn't work that way.
>>>
>>
>> Good point. If the plan for this reference software is to always
>> prepare its own DTB and ACPI tables, then this patch shouldn't
>> touch the DT generation either. Of course a lot of the device
>> and fdt node creation is intertwined in mach-virt, so it's going
>> to create a DTB anyway.
>
> I haven't yet looked at this patch so I might change my mind
> once I've had time to look at the code, but my initial
> thought is to prefer it to be in its own file rather than
> trying to share code with the virt board. There's a lot
> of stuff 'virt' needs that this doesn't (DT generation,
> ACPI generation, switches to disable virtualization or
> trustzone support, options to select GICv2, etc etc).
>
The 'sbsa' machine won't consume QEMU generated ACPI, so it won't
touch or add new ACPI tables.

UEFI relies on its ACPI to load OS, but currently it still needs DT
from QEMU to pass some info, one example is CPU number.

So, the 'sbsa' code implementation should be like this:
A separate file, no ACPI codes, a little necessary DT codes.

"Necessary DT codes" doesn't include so many peripheral devices nodes,
so the code overlap with virt won't be so much (contrary to sbsa.c
with all the DT codes), then no need to separate the common part to a
third file, and virt.c can be untouched or only a minor change with
few lines.

Any comments please?

> Q: is this new board model intended to be able to work
> under KVM, or is that out of scope? (You wouldn't be able
> to run guest EL3 firmware under KVM, certainly.)
>
> thanks
> -- PMM
