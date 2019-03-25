Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3680240wrx;
        Mon, 25 Mar 2019 03:25:31 -0700 (PDT)
X-Received: by 2002:a9d:1e8:: with SMTP id e95mr12881741ote.208.1553509531188;
        Mon, 25 Mar 2019 03:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553509531; cv=none;
        d=google.com; s=arc-20160816;
        b=tj1nfMqWpuNUeWzYtWZSSlUjARo/IDr1HJHRygd+zlzAutkI2kxBtABzn9VCxQhgtO
         +h+IvoKw2sP7ZCZ61mtTEsojw1mk+DmYlrcqm1zHKcNSbP0RrXrWpJ5QVNqIk7xG02B0
         J99LmyOBQ+W/7pn/jxXVa9IEFU1qCyyG608j5cPbD+AX/q+T1R+BD1JeG5jQYyQW+TGe
         0NmxQw004MmZ7AubRzKWliRFehV41YL6wakvUrc5Tx9v6ELH2BBT9Nfp3vd2RDOFqrmc
         81BjNf+e827FOssRo/uZWWmqrTaMrzmDux9HS64vxYcO3NgFye1vOrL5ml8HAktfUNkR
         pZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i59b6i9AtG5Vt1EjsoGRtNoGJAdEX/s2DuL6bxvD6Pk=;
        b=hGcIPN1W6Ee8NpUlJ9aexWTWpb6gVTiJrAw2q/SAHBQzsSbULD/T67pbdteZY0jzKV
         2nHa4mGn2Su7L83kvWACIMCssa2BkqhTFArKiMEB4bDDmVrE2Put1+FZoOSmtKbu7CXE
         9cnHfu/aR5Lw1EnnDBdv6yM+I90xDyW0WMp5uge6UrPsvJvxZWQS7KurG3H705gxNCyQ
         xkPEu8Ny52FzNL7MR8ZmJqsYVgwiXgov90tIKwR16VIhPHOi5NVY6PmgFHSCIiTPasl1
         +mzOm8UxMwzsvITbEvkF4d6hCer+cHzHLxRL/jPigyTLZgJye/AzuPz1fwawuAQU1NNv
         poSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6vWtUIA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k143sor4978091oih.149.2019.03.25.03.25.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2019 03:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6vWtUIA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i59b6i9AtG5Vt1EjsoGRtNoGJAdEX/s2DuL6bxvD6Pk=;
        b=G6vWtUIAdcV5RnfWwqDUY+6/WM4758KAAzAZQ4ev+NspuHAgWaadTjPA7ELMILw87I
         NgNe0OiCPUQveOvezurYRlNu0sUfR+rbaFpAAJfeLi5Po2sk6A3eHnZTQujb9mCwlqUa
         dJWQ1bZPhGnusmkqw3W2iM4XgLZYOYVL0gSVX7qaiTr1U19Mr7ZpBCtda5owcACy3CSS
         FfsPPgWjOwYx+hiDip3gk8I2AGiHcMUDpW7eGH9GhfKdMXgiACYvVCYDIpO4+HlS3zJ1
         GmC1bU7nIYzK+gSIRzlCzrxV3r0Uk9Bmz3iUfxYfgXDnmTN/9rpqbyUTLuu/dinL5l7M
         UIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i59b6i9AtG5Vt1EjsoGRtNoGJAdEX/s2DuL6bxvD6Pk=;
        b=tr8iO5UxTofouIUrXOPZVyhLxAKUI259PdxoFKjh/FmscV7i+i6REuVL0qlSHEzSLL
         TiAGW+fulvsoSNbB6jbNAiTl5RWe19kjXmHppTZmszfYxYUjqHJk66VQXeJe89fsxUzb
         2dNJgSNOjuvCysRnA0iJ/DCfwT6ehya821Q+HbA6qoIFPizj+yRbTLYNW2B2T3/KTO7m
         HCCZlzn64h1h9EEMbszPaHXik265zveOzvQikqg057115qXoYGRtSfC9wWGkjz9oSqWo
         5kMmyJsa3Rh2Pxy99ICrkIr7H30ujimdKRncNhJGhtBdbx4mrMWw12j4SiFR+uqG/Rhh
         zpcQ==
X-Gm-Message-State: APjAAAWT6TtjdZ6UKqEsSRsLYoo1oACRSQPCWU/dBuHI8dkMR3Zpsxza
	lkLaYAaKpWlkCBbKrC+TIUV0WtJEv1T/5SzXv/xlYP6Mi7U=
X-Google-Smtp-Source: APXvYqwbwhCDEkr3FmeE3mGJ4RJwbR3NpRjRf/txuoQJ7uIkg4+NQd/mbxDJrA0DuTbW6a0H+jXOvVe1XJd2VO5jXtw=
X-Received: by 2002:aca:4c88:: with SMTP id z130mr11361759oia.170.1553509530717;
 Mon, 25 Mar 2019 03:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190315143057.20165-1-peter.maydell@linaro.org> <87sgvkw4vp.fsf@zen.linaroharston>
In-Reply-To: <87sgvkw4vp.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2019 10:25:19 +0000
Message-ID: <CAFEAcA_n2MvRfCdydianR9EgDxdP093+Fi-Co2WRa0ncAF=Pgg@mail.gmail.com>
Subject: Re: [PATCH for-4.0?] arm: Allow system registers for KVM guests to be
 changed by QEMU code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Dongjiu Geng <gengdongjiu@huawei.com>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WIeBKs7ZRvJL

On Mon, 18 Mar 2019 at 15:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > At the moment the Arm implementations of kvm_arch_{get,put}_registers()
> > don't support having QEMU change the values of system registers
> > (aka coprocessor registers for AArch32). This is because although
> > kvm_arch_get_registers() calls write_list_to_cpustate() to
> > update the CPU state struct fields (so QEMU code can read the
> > values in the usual way), kvm_arch_put_registers() does not
> > call write_cpustate_to_list(), meaning that any changes to
> > the CPU state struct fields will not be passed back to KVM.
> >
> > The rationale for this design is documented in a comment in the
> > AArch32 kvm_arch_put_registers() -- writing the values in the
> > cpregs list into the CPU state struct is "lossy" because the
> > write of a register might not succeed, and so if we blindly
> > copy the CPU state values back again we will incorrectly
> > change register values for the guest. The assumption was that
> > no QEMU code would need to write to the registers.
> >
> > However, when we implemented debug support for KVM guests, we
> > broke that assumption: the code to handle "set the guest up
> > to take a breakpoint exception" does so by updating various
> > guest registers including ESR_EL1.
> >
> > Support this by making kvm_arch_put_registers() synchronize
> > CPU state back into the list. We sync only those registers
> > where the initial write succeeds, which should be sufficient.
> >
> > This commit is the same as commit 823e1b3818f9b10b824ddc which we
> > had to revert in commit 942f99c825fc94c8b1a4, except that the bug
> > which was preventing EDK2 guest firmware running has been fixed:
> > kvm_arm_reset_vcpu() now calls write_list_to_cpustate().
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
>
> > ---
> > Should we try to put this in for rc1? Not sure... Testing
> > definitely appreciated.

> Hmm so running my testcase:
>
>  * gdbstub enabled with an active sw or hw breakpoint
>  * run userspace program in guest:
>    - sw breakpoint works fine
>    - hw breakpoint never triggers because guest segs

Further testing from Alex suggests this is some unrelated
bug or regression (ie not caused by this patch), but:
since the only in-tree use for this patch is to get nested
debugging working and it would be broken for this other
reason even with this patch, I'm going to postpone applying
this patch until the start of the 4.1 cycle.

thanks
-- PMM
