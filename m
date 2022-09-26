Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2245213ocs;
        Mon, 26 Sep 2022 08:18:19 -0700 (PDT)
X-Received: by 2002:a17:907:2bef:b0:77d:e0f3:81e6 with SMTP id gv47-20020a1709072bef00b0077de0f381e6mr19124589ejc.513.1664205499211;
        Mon, 26 Sep 2022 08:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664205499; cv=none;
        d=google.com; s=arc-20160816;
        b=WvDo6qyQPrm1LQP7dFteTWOJ1+HFaRRpqtuCTdvhto06oIJumIOnRRm2xvZiodCt5H
         IBzKO8AIMeOFIf/cCRHIqam/j62V8cUwm5nEppFFSgmdjsq5p7mNlaA4AdmEyxDCZTb/
         V0UVezieB2PcR9xzajydSI+iDlqwIdRGLGR2ddXy5VSTUysUNIE9qdV7PMo+3R6FEVXh
         /QAYyFVFzO9IRMkyHjxwKeFZ2DnDGHL5vrhUkWPzibIid0VJj9yNxwQGmVdmejMH/2wz
         8gebV6sKbGBIsnI7JInPZRp4pC0+Li5Yv7sIRJjlNORo32t9wuNfY19Uof1VXvH2KQjH
         Amrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9AJQA7mWwz22PtirPnEVg3grxJXEJnpC25c2pUFl7aI=;
        b=rV/FiC7Sr61VsiXf+KMNsHKKMHftYSkAPX6ygcZKFu5mLgI1Kb2yce6EfUMlRP8rGY
         lw2ZW4wCLgriiEyXMqAdvpngNTFAXX5w2rffQCxE7WFK1AK5ISUAO6nDVqOZ/+dQK0l6
         peCWUGQEmKiVaMJWUxmQ/jA1/8UnrffUv7tRQmoiRla2dAbnJj66plKGEoztOBW16ZlI
         V+6u6woePJrD8BXaUQyUOEpxLBc+nCd+oumvJf/C8f4sgS+sJMqw1BbKOBvrAsFZSMTz
         +6zqHhUEQ0tLddR44kiqQHyS4xJ3xLMBp8gXnSSo6AFI6H24hot9Y2KQuKxwWkvkb+mO
         Iyhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcYHCEpZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lo14-20020a170906fa0e00b0078005ff4117sor7045818ejb.80.2022.09.26.08.18.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 08:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcYHCEpZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=9AJQA7mWwz22PtirPnEVg3grxJXEJnpC25c2pUFl7aI=;
        b=KcYHCEpZwp0xn94iFllcDLYwJvCUxyJ2k/lH9eBvoNq2xeWz10M2gFnZu+qUiiaXoZ
         bmtTgRPSzn/lNwvaSM5SY6msLFgZfqhBEIfs6mRFizrh9UWNP1PlBRNTQdHolpCyhcGl
         xwBQwGmmlLlkkWliiCaBq8LVmr8sC3/CrfrtjtCjLTZMcHW8wY7JePjFsIlkorwq3HXr
         pLOZj2OpqZRQdf8rXGmEkHqLzItEQ/mYktI0bkIlkoHZMeGCW2pgT527LOb8T7cFXmyt
         FPWs09Zng6RgKBzbxUtLh694P8KPa8A6St0Lph2+M94Ufw3Cc/CBeuZcHU8BX6SSQb4B
         iF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9AJQA7mWwz22PtirPnEVg3grxJXEJnpC25c2pUFl7aI=;
        b=6Fdxqjqb/brLEFC85cn3lDpwO+3Tx+UmgTgAiksGB9PQGl5qAE8QiUu0WaPCPL7tsK
         fMOe3+fvVpHyDlMMEpcwREinxUOlWhS/sK4thgBDa4TTGuamk4PxKelXhpAbqEn53NJK
         Qie/TeqirL1OrMmEKKYTnOTydQO3PtOr0Zk3nEcsjTQDXAsuW210iluV61k008noVQkH
         Vg7IoJLyWYZ5+/su7LqJvcfOuISIbHaeURREcARJqgBxtjVw4UBpUMcKGOqA5J6ACrUk
         zgYlzVlzaHO38vj1b/z5jYTGFrnDRar5RTMaOYPwI5PzchF2N6aFba0dVXusKQnZ9jYt
         ITjw==
X-Gm-Message-State: ACrzQf3xhl+Biu8gD6Q5huJmf2R1ByhcotmqtNFpbFV7fd4bJextb6vw
	bIBJ+zsRPuUhquTbZOgvQXOM0CyiFZruDA2C4nc9dLIS8NKfow==
X-Google-Smtp-Source: AMsMyM7WlsHkQoIiqJ6N9guZsFR2xPImZM0TYSeymk4JDQx2ewQxsTMvc4z8cu5jB5HbhWLI9geUa1FQAeyKiSHZiYA=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr17941073ejc.504.1664205498790; Mon, 26
 Sep 2022 08:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org> <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
 <87leq641id.fsf@linaro.org>
In-Reply-To: <87leq641id.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:18:07 +0100
Message-ID: <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2AcDH1KkDiUZ

On Mon, 26 Sept 2022 at 16:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >> -static inline int gic_get_current_cpu(GICState *s)
> >> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
> >>  {
> >> -    if (!qtest_enabled() && s->num_cpu > 1) {
> >> -        return current_cpu->cpu_index;
> >> -    }
> >> -    return 0;
> >> +    /*
> >> +     * Something other than a CPU accessing the GIC would be a bug as
> >> +     * would a CPU index higher than the GICState expects to be
> >> +     * handling
> >> +     */
> >> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
> >> +    g_assert(attrs.requester_id < s->num_cpu);
> >
> > Would it be a QEMU bug, or a guest code bug ? If it's possible
> > for the guest to mis-program a DMA controller to do a read that
> > goes through this function, we shouldn't assert. (Whether that
> > can happen will depend on how the board/SoC code puts together
> > the MemoryRegion hierarchy, I think.)
>
> Most likely a QEMU bug - how would a DMA master even access the GIC?

If it's mapped into the system address space, the same way
as it does any memory access. For instance on the virt board
we just map the distributor MemoryRegion straight into the
system address space, and any DMA master can talk to it.
This is of course not how the hardware really works (where
the GIC is part of the CPU itself), but, as noted in previous
threads, up-ending the MemoryRegion handling in order to be
able to put the GIC only in the address space(s) that the CPU
sees would be a lot of work, which is why we didn't try to
solve the "how do you figure out which CPU is writing to the
GIC" problem that way.

thanks
-- PMM
