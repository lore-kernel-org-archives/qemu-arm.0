Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3184577ejb;
        Tue, 30 Apr 2024 11:44:51 -0700 (PDT)
X-Received: by 2002:ac2:42c3:0:b0:51c:5fab:c23d with SMTP id n3-20020ac242c3000000b0051c5fabc23dmr207675lfl.17.1714502690906;
        Tue, 30 Apr 2024 11:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714502690; cv=none;
        d=google.com; s=arc-20160816;
        b=FAna7/jKgZLPKdFyaHI4dDlqjqGhxaux3DtyTtQzPCxuPdhUJq+9zB16UBhYt3bEl1
         CVxALPHhCBnYqseJS7zueYD9tHuyDE2X1xmdSzLrYNteRIkE/R5OlP3GD1kh5hoMzY+z
         sx4VBWil5QEv35qsuEuWvCOwhgs/MMshIa0P3UUiF0KsP4Y0PBvdRv4ace7P7tkhtHoh
         LZ9aL3GnB9Pb5YpJRirhX4mDmxhYPS+EAk9DDCsmz9bOWPheTZYJzBvmUVZLUZd1JXeu
         ZMq6oxi1nJqM2YAYRvh0Qi+biwkdD1dj4QkjvPjp+qJYc/BFkmLr+Jv8AWjYtnFK/JwW
         7usg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3gBgASPmO3umVtWBxwX2dWIChGUiJly3iRrpORmwNCA=;
        fh=lyYd5u/xP7MkSXnqR0B3Lug5GOOGoEqAPzvNtygcaUQ=;
        b=CdHhrj6GJxUtPv6YWUI6zHSSpabAO7T2OOg/BLGnJ4K9px1T3s9riWVNDFcj+Ny7KQ
         soGMgUHONUQ560vfprjfpwqMzN5LGLEaZUfIsWOiKuP5vfRWGqC1hkqchOUMBfRXIEuV
         xyvVflY60MyYl7cZ0DdXwryP5AYCv1DvajEbri431zHAn6YhSmAGlpycPC/z2UsYwJC5
         nYXLlAnS2KY4/MOyI5uevGeRXSMDIfXWM7b2ZQOl5gSCayHV1nvjmVHZ2aUX4JIwWKB5
         TpKmxIjAYE9lgxh3M5MPdERa7DDyGk6rGpqTT5FaArQYOEg6GdBKIbzaIzD6kHxL+Z+v
         wduQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eH+ZN/wG";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w20-20020a056402269400b0057288f630f4sor1598302edd.5.2024.04.30.11.44.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Apr 2024 11:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eH+ZN/wG";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714502690; x=1715107490; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gBgASPmO3umVtWBxwX2dWIChGUiJly3iRrpORmwNCA=;
        b=eH+ZN/wGy3/t+POb0Iv5PFFejtSkTJd+USNwWZZEuaOr+UrgsqAPyYRVnXAHWK199m
         5YvQu/F9hB9riiqtTE5EqK4iE6wHmZCdxktpfF+xSnaSc30CgGmYGplBBiIfpiFl7ZJi
         df9yb3mP4IBcW4VtTSLQlOWn8dBBZH4/sdJjPGc+EaO60C2VStYL4Rzbp/wRJyGvDXuF
         mA1Q7enT7ez7zq0yH12yXU1eat6SaEuUvLMTJCwc98NEbfyY6ma/FSMb6CrOKe13K7HK
         tNIL2r6fu22U0lzpO1omJ4xlz+FJteKcxfxJiN1V7jIYE3RLkXJucLNhzB814CqTZehJ
         YTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714502690; x=1715107490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gBgASPmO3umVtWBxwX2dWIChGUiJly3iRrpORmwNCA=;
        b=II6srdoigS8I18C6Co3jvC0JkVyCbXnluNynjxS1D9nBPtl1fXqH2qDR+unf0Izh2M
         3CYvl+n9Ue24dXl+5xUN2Eav0NcReJmQWVii4vKtK9vZNH/dG1W3sw4u/tx77MnL6i+y
         oVAg256FveAntgLRadsUDPXWyulkmSRNL8ftu8tsA9HpJfMvs28Spu8Hoki4j0Yo/2rW
         wV6DZDL8mGgxa9kxr6Copl+YW5PBFVX+v+ObS0RSjG9bLFuzM9NJoiIokvBp6Lina8Cq
         Nu6MAWORuPhz635J60xbXt/dAv87I3KqwQ7wPrcfs0QMsBEmLCup1EKY2e7x7yl7s9Jb
         HB9Q==
X-Gm-Message-State: AOJu0YzpU0Cvn41+TdbVD+WeIx5/nmrP1oPp3Y7knhLvgWJD10+kqWle
	SaRPuG4UYpNLakRgQFRXG7zx3/0uhQgXo82jPSruyJKeOKAPV8f0K/7GPkBozTyCFeyQWlxfNpx
	r2hdmaHKNiLcR8GBDTFqscYKx/02phddHtTom7w97roK345lX6AI=
X-Google-Smtp-Source: AGHT+IFuMFg0PiJtqAlOUKGqjf2n9rAlcZePYebauohCzwk4FET2C8il2R8vdrWLPxH/BY67FY6E7Gwmcqno3AoQvXE=
X-Received: by 2002:a50:aad3:0:b0:565:dfac:a686 with SMTP id
 r19-20020a50aad3000000b00565dfaca686mr411314edc.38.1714502690495; Tue, 30 Apr
 2024 11:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-2-peter.maydell@linaro.org> <87ttji3h69.fsf@draig.linaro.org>
In-Reply-To: <87ttji3h69.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 19:44:39 +0100
Message-ID: <CAFEAcA-UL6cd7Obbx8sHpJ-Vdb-vpU8NJwdcLM2P+8ZpFnj2kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Make TCGCPUOps::cpu_exec_halt return bool
 for whether to halt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kbs7wxKySRzK

On Tue, 30 Apr 2024 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The TCGCPUOps::cpu_exec_halt method is called from cpu_handle_halt()
> > when the CPU is halted, so that a target CPU emulation can do
> > anything target-specific it needs to do.  (At the moment we only use
> > this on i386.)
> >
> > The current specification of the method doesn't allow the target
> > specific code to do something different if the CPU is about to come
> > out of the halt state, because cpu_handle_halt() only determines this
> > after the method has returned.  (If the method called cpu_has_work()
> > itself this would introduce a potential race if an interrupt arrived
> > between the target's method implementation checking and
> > cpu_handle_halt() repeating the check.)
> >
> > Change the definition of the method so that it returns a bool to
> > tell cpu_handle_halt() whether to stay in halt or not.
> >
> > We will want this for the Arm target, where FEAT_WFxT wants to do
> > some work only for the case where the CPU is in halt but about to
> > leave it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  include/hw/core/tcg-cpu-ops.h       | 11 +++++++++--
> >  target/i386/tcg/helper-tcg.h        |  2 +-
> >  accel/tcg/cpu-exec.c                |  7 +++++--
> >  target/i386/tcg/sysemu/seg_helper.c |  3 ++-
> >  4 files changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-op=
s.h
> > index dc1f16a9777..f3ac76e6f6d 100644
> > --- a/include/hw/core/tcg-cpu-ops.h
> > +++ b/include/hw/core/tcg-cpu-ops.h
> > @@ -111,8 +111,15 @@ struct TCGCPUOps {
> >      void (*do_interrupt)(CPUState *cpu);
> >      /** @cpu_exec_interrupt: Callback for processing interrupts in cpu=
_exec */
> >      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
> > -    /** @cpu_exec_halt: Callback for handling halt in cpu_exec */
> > -    void (*cpu_exec_halt)(CPUState *cpu);
> > +    /**
> > +     * @cpu_exec_halt: Callback for handling halt in cpu_exec.
> > +     *
> > +     * Return true to indicate that the CPU should now leave halt, fal=
se
> > +     * if it should remain in the halted state.
> > +     * If this method is not provided, the default is to leave halt
> > +     * if cpu_has_work() returns true.
> > +     */
> > +    bool (*cpu_exec_halt)(CPUState *cpu);
>
> Would it be too much to rename the method to cpu_exec_leave_halt() to
> make it clearer on use the sense of the return value?

We could, but that makes it sound like it's a method to say
"should we leave halt?", which ...

> > -void x86_cpu_exec_halt(CPUState *cpu)
> > +bool x86_cpu_exec_halt(CPUState *cpu)
> >  {
> >      if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
> >          X86CPU *x86_cpu =3D X86_CPU(cpu);
> > @@ -138,6 +138,7 @@ void x86_cpu_exec_halt(CPUState *cpu)
> >          cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
> >          bql_unlock();
> >      }
> > +    return cpu_has_work(cpu);
>
> The x86 version is essentially being called for side effects. Do we want
> to document this usage in the method?

...is not how the x86 target is using it, as you note.

thanks
-- PMM
