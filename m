Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp945909wrp;
        Thu, 5 Sep 2019 08:40:36 -0700 (PDT)
X-Received: by 2002:a5d:8e15:: with SMTP id e21mr3244973iod.296.1567698036075;
        Thu, 05 Sep 2019 08:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567698036; cv=none;
        d=google.com; s=arc-20160816;
        b=kdRq/9yRbqRYBRbfAFpcky1tjJpfeQr/zPFBGgtIf5NJm886YhU9iiiiCalP3ToQlh
         JCR/Hl4KuuToxeEKwMv4RoRKvFeyYJZYc+gTqgpyrU/LEfdVugefDYVQI99cxVPt6Ae7
         x2r/nO3C0RQ79+wlhB7DX0XngOd7NPxksJh4ay8iGJsAC+fJHYhM9ybq4RFIuEJqUR6A
         F8rXY5iZugrYX41izNu9a8n0jQlDios10OB9fl6dGBZdYjOViFJo4UMtwXdKEhYepWye
         jHJg+ApkhC2CCsdbCT7BSbH8R2EiqPaqKORxmG+fWRR62lmpZujX7qlkxyG+Jwv2pJDs
         WJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKkt/SOiKtFSstWvWKFbJtcesPFRXF7UnM8PUDvHq6E=;
        b=TWsQTrG5win4Y0v7lwz+m9eW72Lfr9RHbbz1kUj94NycZkejdFpHmkAM70HnVXsBDK
         weNQ3Qo5WqrUUjKXLSJzh1xpAyN69iY6rvSIix+oYYPhZMi7cRBKLR188wJyvw4G8oky
         FibbNZyn4VL8nw9yj5dhvy1cA6Q+u11q4X+JfCpxsqpgO+J5Bzzt6J5dCiO1+7G6fefE
         TnhpukwLHMH9fT9ajOZAEl4paMyY5QGa4KGT9pkbw/tIMmo7PqD9CRDCofXB3RR9/1nD
         64QK0mgC/0e2h+YfKG+s1bjCQKhlQeKB7t0X0WeJWPVsQKYEWHi1DNWmUrzbFGrncdzz
         +h3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l33OkEEX;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <laurent.desnogues@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v13sor2052166ioj.8.2019.09.05.08.40.35
        (Google Transport Security);
        Thu, 05 Sep 2019 08:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l33OkEEX;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZKkt/SOiKtFSstWvWKFbJtcesPFRXF7UnM8PUDvHq6E=;
        b=l33OkEEXX8e5yr0ySsd0fHjq8QrkZl60mdi74dmHRIL2Yf3USK82XGpaS1tgA3UMUt
         L4CYV3K5XfkcmSboRBLnQAKn9xiZje6ylEN86R5ZjseV0tJJv5or6CkEkyZOzKcTfAFl
         GNr0Yo+phLpCzLtbUxt9PYIUatkKrznozZRoGeihTzCzOfafdOGVFLiXTNpvPLqhzQsj
         AMo4cmKoGrynZKZ3ILHhH9tLpPjtiQqtCfish0VMoEAETsYGuUqAazTCqnLLyfHBPaCT
         QlfdAMJDqTR3lyUYR8Sy2pu5YbaSiqJr4zFOry8Z5GggF08b4NcLZC29CYnTDXA75CF0
         L+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZKkt/SOiKtFSstWvWKFbJtcesPFRXF7UnM8PUDvHq6E=;
        b=DYuM+/SpviYMKg/lrfhpwlpZbFG8ilFKZJ7hwabu8gnAKXXw2oiE5uAdmKaEjHlN9a
         1gmkNVzUegAb0es2PwDTGXBA0aHm3PgB/iUtg4+xnscSZajEnYPXKB5+Gq/JBrtfF44+
         99MhoZKBdmmROiHacgJjQXHdK08gFCNzNt2iPjUkRHao1DzmaBJvlTqR7r3wybc7FD+g
         oirisOeVmVfawF3mFkfSG/5u6a7zEBI4V+4YAhLYaZeatRlBeH0h8qmYAdjMK9TO5AiL
         O9E4CC/O+ix+a2yN1s0jKq+/7zz4KbEf3Qo31EiYVcjWgMq+0NEOCEIau+vkcMpkCobk
         K9wQ==
X-Gm-Message-State: APjAAAWAMLkrqTx4ets2i+Hj2VxP/D/1yFdpWhUviuwb811DokGYpb6w
	PS1ky2nM+01FlJXekIpEve7GIEpFVYzlZY2Xo05p6e3C
X-Google-Smtp-Source: APXvYqz4Payq1m8Y6bnhBpex/XOtc9a+Gb9PE3vcfDxlr0N5tIGNglOHITyINaMzXgOaC0Ppbul3sFHpN2Jsm/rmPlo=
X-Received: by 2002:a5e:8e0c:: with SMTP id a12mr4867148ion.22.1567698035385;
 Thu, 05 Sep 2019 08:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-18-richard.henderson@linaro.org> <877e6m937n.fsf@linaro.org>
In-Reply-To: <877e6m937n.fsf@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 5 Sep 2019 17:40:21 +0200
Message-ID: <CABoDooPis6VR-3zw6EcCerwmTfZ_c2gqbCtVDSnpB30q-Oh01A@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v5 17/17] target/arm: Rely on hflags correct in cpu_get_tb_cpu_state
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qsT64TEgNg0D

On Thu, Sep 5, 2019 at 5:24 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > This is the payoff.
> >
> > From perf record -g data of ubuntu 18 boot and shutdown:
> >
> > BEFORE:
> >
> > -   23.02%     2.82%  qemu-system-aar  [.] helper_lookup_tb_ptr
> >    - 20.22% helper_lookup_tb_ptr
> >       + 10.05% tb_htable_lookup
> >       - 9.13% cpu_get_tb_cpu_state
> >            3.20% aa64_va_parameters_both
> >            0.55% fp_exception_el
> >
> > -   11.66%     4.74%  qemu-system-aar  [.] cpu_get_tb_cpu_state
> >    - 6.96% cpu_get_tb_cpu_state
> >         3.63% aa64_va_parameters_both
> >         0.60% fp_exception_el
> >         0.53% sve_exception_el
> >
> > AFTER:
> >
> > -   16.40%     3.40%  qemu-system-aar  [.] helper_lookup_tb_ptr
> >    - 13.03% helper_lookup_tb_ptr
> >       + 11.19% tb_htable_lookup
> >         0.55% cpu_get_tb_cpu_state
> >
> >      0.98%     0.71%  qemu-system-aar  [.] cpu_get_tb_cpu_state
> >
> >      0.87%     0.24%  qemu-system-aar  [.] rebuild_hflags_a64
> >
> > Before, helper_lookup_tb_ptr is the second hottest function in the
> > application, consuming almost a quarter of the runtime.  Within the
> > entire execution, cpu_get_tb_cpu_state consumes about 12%.
> >
> > After, helper_lookup_tb_ptr has dropped to the fourth hottest function,
> > with consumption dropping to a sixth of the runtime.  Within the
> > entire execution, cpu_get_tb_cpu_state has dropped below 1%, and the
> > supporting function to rebuild hflags also consumes about 1%.
> >
> > Assertions are retained for --enable-debug-tcg.
> >
> > Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Hmm something must have been missed for M-profile because:
>
>   make run-tcg-tests-arm-softmmu V=3D1
>
> Leads to:
>
>   timeout 15  /home/alex/lsrc/qemu.git/builds/all.debug/arm-softmmu/qemu-=
system-arm -monitor none -display none -chardev file,path=3Dtest-armv6m-und=
ef.out,id=3Doutput -semihosting -M microbit -kernel test-armv6m-undef
>   qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1=
)
>
>   R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
>   R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
>   R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
>   R12=3D00000000 R13=3D20003fe0 R14=3Dfffffff9 R15=3D000000c0
>   XPSR=3D41000003 -Z-- T handler
>   FPSCR: 00000000
>   timeout: the monitored command dumped core
>
> But annoyingly not shown up by the debug-tcg verification. The commit
> before works fine.

There's a typo in the patch:  that should not be CONFIG_TCG_DEBUG but
CONFIG_DEBUG_TCG.  With this you should see the assert fire.

I let Richard know that there's an issue with the handling of CPSR E
flag (BE_DATA in hflags).  I don't know if that applies to your test.

Thanks,

Laurent

> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> > v2: Retain asserts for future debugging.
> > ---
> >  target/arm/helper.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index d1bf71a260..5e4f996882 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -11211,12 +11211,15 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *=
env, int el)
> >  void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
> >                            target_ulong *cs_base, uint32_t *pflags)
> >  {
> > -    uint32_t flags, pstate_for_ss;
> > +    uint32_t flags =3D env->hflags;
> > +    uint32_t pstate_for_ss;
> >
> >      *cs_base =3D 0;
> > -    flags =3D rebuild_hflags_internal(env);
> > +#ifdef CONFIG_TCG_DEBUG
> > +    assert(flags =3D=3D rebuild_hflags_internal(env));
> > +#endif
> >
> > -    if (is_a64(env)) {
> > +    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
> >          *pc =3D env->pc;
> >          if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
> >              flags =3D FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype)=
;
>
>
> --
> Alex Benn=C3=A9e
>
