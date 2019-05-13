Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2960969wrg;
        Mon, 13 May 2019 08:41:03 -0700 (PDT)
X-Received: by 2002:aca:32c2:: with SMTP id y185mr15009690oiy.177.1557762063641;
        Mon, 13 May 2019 08:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557762063; cv=none;
        d=google.com; s=arc-20160816;
        b=o2lBUY28rcn4DU5O1BE9cCmiJiBhHIg6sgxXPCMmaVBfcjhKs2+QGAVPuCnL8xuMkr
         cqL/ZY5P8UMzhkLEbjT+mRlzP0yDG/2rPRzN5MTVa5a9A4VTPyDhdWNcTdH/n8GtbWgT
         lDoTmE8BDMgwtQiD5TbM79RgFpNwyJxRn7qWqKpExKJsP/9co9fo2F5jw/9XeHx8FXVW
         3UTEvgMF4NtCihym23HlQb7PN6QjDdzNqHNtUtysDGmgUnNZOTRUBR5hxFeWItZH9k2B
         6whgo0j1vTxFY1ILC4fFT97Kprg3xtOi1fibkwjamHXXVKGeU0UDOTKsz28bOuzpGCcc
         Fleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2WtiAmLbnppF5wdYRwwdYOHNgP4UsBxqvFA32h2u9G8=;
        b=Kq65GIRHEEsxEG9EtdANjNj9QnMgyvidUP/XZ2/+sArRnrdC6ihW9VzzDmyPc/6wyi
         BLw8CFwqlzrcqynOAQAhmHg2MK123siiCwWTEu1EDVkAXv2gKuCmpmct0VsFjb9k5Hcs
         gEeVq6f/R5hNDprH21fzNZMhsxLTNnEl9Ca+3O86YLtomeqtRySpaMpIEqUsCe0R2ISr
         aR1ueZlZs4axQJCPoZdm5N38QUvYbCYyeyzCnUEGSiUc6H14TpFTlJQE/J7wX1IOEECe
         GSNUkRu1Kd40iTP91Isc7jADOi4rVovrtEiyNwl8VDoc8xg6MzFklHmioOJkWYhV/mnn
         tg1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WB+Nhl7c;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x26sor6383437ote.128.2019.05.13.08.41.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 08:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WB+Nhl7c;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2WtiAmLbnppF5wdYRwwdYOHNgP4UsBxqvFA32h2u9G8=;
        b=WB+Nhl7c68MSZAYYp+dtLDMiI3zkm0/8X7dMzFpOJXTpHShrn/G5jDLTTmScVCwkyl
         Fpp/gs5r4yqPOsT8nT4kaD1kUy3mD/g/TheRs04VzR656nnEFo5o9NowQqJ4/5iqXwBw
         3fAN2zo685RLbUd6ALXlIYPGlwv1agUqC66gZNcsI+xGksSJMUTjrNf4PhNb1z3vyHVA
         86ZT6g27aCD1NCEN5PC5nnO2UPmFLJpXeCTDEA1d8+/Yut3C+MBudza6xWy3v6bPtYL0
         EsY9IynoQUHszdjXy9vy2AZa7n8MGHNU6ACTZ86GzpP2cslSqSHeq+X8sEzmg+acSdTL
         zgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WtiAmLbnppF5wdYRwwdYOHNgP4UsBxqvFA32h2u9G8=;
        b=rEV7AyoJ7WTeA63gAhpXQOtBlQPn/ScBJB/iAZ0fgcQIyc04NCbV+dxEgFJ+tbooF6
         5Tmh1G/gG9OLqJm4J++2Z/JyWKxhTIhD3QJ/xN0I+AWZp/DanmMh6VcBbEX2GIhdz3qk
         dUSc85mCO7q/8Ee6/qOxOv17GTKLjBpvf6BdB948jbLOCdaFtuirC6t9ljsgZHgd2vHG
         jUQmPB54/Jg89+1Bs9I9Qu7+aTVxICZo3FWh6UdLnFljzP/ZBiZe2E+nM9rZ1PfLVjTL
         qFEmy2gPFc2Ypmm7u56nJs5GvNQp+Em0h+GG0/dCrEQnsYMa7miYqBg+lvrt05Q+P4IU
         JzaA==
X-Gm-Message-State: APjAAAXJzNsObVTv3hc1vANOEFMMjH1zZ8z1nkhflfNJLy6RsvW2X+IH
	EjdGTKUdjFRr2ufGlWURXUEHeggBq6SdqBc79Praqj60
X-Google-Smtp-Source: APXvYqwH/5qZu17agIjGYc0FSyUggL70xbuawBciikn7GtT3GCIIQJbuX9X6C6rfbeSNldIVuRLpUqf1ioT1A1omw1U=
X-Received: by 2002:a9d:404:: with SMTP id 4mr7099927otc.352.1557762063062;
 Mon, 13 May 2019 08:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190512083624.8916-1-drjones@redhat.com> <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com> <20190513135501.ztggqdac57qbpuft@kamzik.brq.redhat.com>
 <20190513153116.GL28398@e103592.cambridge.arm.com>
In-Reply-To: <20190513153116.GL28398@e103592.cambridge.arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 May 2019 16:40:52 +0100
Message-ID: <CAFEAcA95LbXZOJNUAYuYoVDkM0auj-RGACXPp9Qe9ANp_b3C=w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add kvm_arch_get/put_sve
To: Dave Martin <Dave.Martin@arm.com>
Cc: Andrew Jones <drjones@redhat.com>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "abologna@redhat.com" <abologna@redhat.com>, 
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 932uQ6ZZiVXQ

On Mon, 13 May 2019 at 16:31, Dave Martin <Dave.Martin@arm.com> wrote:
>
> On Mon, May 13, 2019 at 02:55:01PM +0100, Andrew Jones wrote:
> > QEMU keeps its 128-bit and larger words in the same order (least
> > significant word first) for both host endian types. We need to
> > do word swapping every time we set/get them to/from KVM.
>
> I'm not sure whether this is appropriate here, though it depends on
> what QEMU does with the data.

The layout is optimised for TCG emulation to be able
to work with it, I think (rth would have the definite
reason, though).

> Something non-obvious to be aware of:
>
> As exposed through the signal frame and the KVM ABI, the memory
> representation of an SVE reg is invariant with respect to the
> endianness.

Yes; we handle this conversion as we write out the signal frame:
https://github.com/qemu/qemu/blob/master/linux-user/aarch64/signal.c#L184

thanks
-- PMM
