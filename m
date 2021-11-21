Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5076699lfk;
        Sat, 20 Nov 2021 23:57:47 -0800 (PST)
X-Received: by 2002:a05:6830:1bfa:: with SMTP id k26mr16359379otb.139.1637481467382;
        Sat, 20 Nov 2021 23:57:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637481467; cv=none;
        d=google.com; s=arc-20160816;
        b=rHNtWpm5XW+wLHaPUiK9iASNAWeSIpy16DszB6UjBhrjW+vW9AQoTrVh3CNjmgASqT
         AtzphPo0KkNdRux04riTb0AG5fni5APwS2/JcIwqAPCFc5uIL7yghlNkUP989lMwm+hb
         LdSBgu7l8QI2j8XGY97ik3BmcoVdA+vyr1GS/PyU1+Oxl6F722kJWlJYhJ5GSdz2h52N
         bukYYdqtgluHLM9gd1zh/PmUvCFbQWABFhb5bAPqcU4R8+5BuriOXoDvcaBYiZU9i0SQ
         rRD/tXozkTEeUFVVYFI5VJMOekNZcV0a7GtGLMZH9W88nkv+om4q8BzeMCaSMXeYqKZX
         PsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NPWr9mja1pry25uoj9RtNq5ZQBSRSvzh2IkH/UhobIk=;
        b=IvEqNnaAMmMrLx1l5o2dQtFuLhu74XtkXY6h7zxPHpD0BnJ1BmGB6ejbrxvyROFNNS
         vF9J7tpvmGVwxYrXy0Su5KCYViztI9gyelE5bUZX27+fKNPJeQxgktRauBavIlBzdEhN
         vmkAIFt/vlSLCoGvrOlKav3n1y4Sg8LREDmilPPWBORZ2grTdY5fdfxSWF7HBOzM46RN
         LT59bYjMEe6c1eMs3GIlkWc+dZpCl2PPV6583z5OLRVbJUxJahSKsyUCsTQ6TWVB4Ao5
         Y+Dm8XGB5mjXYYwJZkwHpNimBiF4fvnraZVTM1r+H7KlFY0eF7uWRZXa31WyGGH2bMD7
         oPkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=liOqtzQj;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <idan.horowitz@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u8sor932019otk.110.2021.11.20.23.57.47
        (Google Transport Security);
        Sat, 20 Nov 2021 23:57:47 -0800 (PST)
Received-SPF: pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=liOqtzQj;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPWr9mja1pry25uoj9RtNq5ZQBSRSvzh2IkH/UhobIk=;
        b=liOqtzQjBvOcBBOnnuTkwhfL0PHBo3whR2Ti6dNDFhD047U+WEgpFgJuMrIgbTUf1R
         KBOx/KUXD6JqlI8OIUHMUJG0021cYX6PUUzeBD52k4ful9oXCQbTTt7c+RyyPTU7jyq+
         AJ2ggYUSvZjgtn2Vgaf8VXIGgR1mLqi+MeYnALABakpZgsU2+6RZk7cIpNj7fWVlX9Ix
         skcsh3jLZKnCn+M1KdE//G3KJORjTvjbskdVj5NHcUnSfn/ZrdhGEATUCn7YpOYjwZNG
         zdkMUXdLyVRb4pD4FLMAKglDuxtLS9rtWjMqOUfTU0SttPBEVIHmGV8FTW2tKMbQ/1Ur
         ptfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPWr9mja1pry25uoj9RtNq5ZQBSRSvzh2IkH/UhobIk=;
        b=E9hJbnUjRhQYH4GGwEvP3KXlOlsVjXGbu4VkRJab2GYAdYUM3t5R28oe+UyZoiM8sa
         mlbab/BnhuM4ywvl69YOQ7HVt3DSL7aNQuw1nb03jmUn0hsOvNFvYE4tS1Qb93WwRcrE
         tNd9ZiiJS/i5ecbB78YzlmQkhvn1Dz3yQwSxCh2J5CBLvwMDf0l4WzCUsFiIEhSIZmDb
         nflyHWmndo3++wjE2YX74CcTbh4a6dpJAquIXPMDE+zUbKXJieaJjw+8wuwFOnuJ4XnJ
         VGlRUZ7/XeczCnF3ytZCUdiSpArt/BzTQ6X7ALdO0CheiSAk7SQxchc7QuVQ2oFxvfAF
         tTVw==
X-Gm-Message-State: AOAM532nerutKIBxYRHZlc35r507zV40cmvihViE2UaMZmDjB3lbybVn
	7WwzWGh3AaTTBqT63penkdk15a2juPE81j2MOStZzmQP
X-Google-Smtp-Source: ABdhPJyV7R1pkQyLi6QDiBIoyhln2v8wbvQRs2a20THg7CzZ6KFzwGvCBdSRi5NZZ3NAkZcnUWVe9T7DDARTsyk8MYA=
X-Received: by 2002:a9d:12c:: with SMTP id 41mr9680991otu.322.1637481466723;
 Sat, 20 Nov 2021 23:57:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
 <CAFEAcA8+U-9OKYhGSm57dip-AhKpJq3AN7+aHoW9+b7NmTPaOA@mail.gmail.com>
In-Reply-To: <CAFEAcA8+U-9OKYhGSm57dip-AhKpJq3AN7+aHoW9+b7NmTPaOA@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Sun, 21 Nov 2021 09:57:35 +0200
Message-ID: <CA+4MfEJ9VnhMovESCdKWs6mTb+8p6HF-AsxhGXg0-EvGqk3jaw@mail.gmail.com>
Subject: Re: DSB does not seem to wait for TLBI completion
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RycdEG+lmmdI

Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Do you have a repro case you can give us ?
> Does your setup involve SMP, or is this all on a single CPU ?
>

I'll try to create a minimized reproduction case.
As for the SMP question, I'm emulating 4 threads (note that the issue
does reproduce with less threads, but extremely rarely) with icount
enabled. (so single threaded tcg)
It is a bit curious that the amount of emulated threads affects it
though, as both the mapping of the correct page, the TLB invalidation,
and the data abort all happen on the same emulated thread.

>
> Note that the architecture says that the DSB will guarantee the
> TLB maintenance operation to be finished for *other* processors,
> but that if you want to guarantee it to be finished for the
> processor which executed the TLBI then you must do a DSB followed
> by a "context synchronization event", eg a ISB insn, or return
> from exception. (See the v8 Arm ARM DDI0487G.b page D5-2833.)
> It sounds from your description as if a return-from-exception
> is done on the CPU that executed the TLBI, though...
>

Indeed, an eret is executed after the handing of the data abort in
order to return to the instruction that raised the exception.
(Adding an ISB after the TLB invalidation does not seem to affect the
issue besides slowing down execution)

>
> -- PMM

Idan Horowitz
