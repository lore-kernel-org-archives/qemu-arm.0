Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp932612njk;
        Wed, 18 Dec 2024 05:51:32 -0800 (PST)
X-Received: by 2002:a05:690c:640a:b0:6ef:7f89:d923 with SMTP id 00721157ae682-6f3d2679135mr22924897b3.31.1734529892588;
        Wed, 18 Dec 2024 05:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734529892; cv=none;
        d=google.com; s=arc-20240605;
        b=AAYYeNQVWMV1T84S6yawtMcdPVnasd6t9tRwhLOdikMSmca2CYtIF3rxNDPQxgf5ye
         MV/087KKAA7+P6zlgYZaKEPWfdTjueV7FY7WeIiAZzQUjN8s+DH/0r7LDmVNwhtqEC39
         pIE7bAO7/ZEWahO1yf22PN8RE6qcbaVS43sXhHM7PbDLnsq3kKayoVwIu3iwW3C/AKWi
         FE8WTbScMLnHuopMxWLt7Tg6+ZHBSbBZCC6im3AqjhKeT8t81CYUEDSn8J/avxNBT76F
         D+PECNdkvcLKFkt1osWuMQARscmxAkusR68QKn7B/IT3bqMRPPzHfrKstqo2ibQtOJ8f
         nJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/iUDoOsV26Qe4oFZU3uHRuMJZh3S91v5QoMM2nH7Rk4=;
        fh=JWWppIJr9OvekGe+mr7rLJSYjlg4GOH6qWvi9MjObog=;
        b=fhXqpQqQ3wMAR0MSDQhJptFN5924CBPtn8PKQSxw7WpJMIcNd6JlTSASvbAXI0p5/7
         fekPbpaF6wZziOeHxhE89eyc2ZSSDhFluKQY47McG6Q3CqrlAfxwi60l3AwUXXk9PZwf
         Uz95f4MBlhj50mPQixVB4OJRektKr4gZlGX85NbuFH7DRqnG+DeXZMEW4R9SpQjEDvI7
         khauYMHpGwR4U+aqEi8ZPmIi4Mb5JI8LkTJ49lPux4JoytIi1iYG21jm+l7yabFM7zKF
         nSX5aZJU63awfmgcHnIKzhOP2F2Ru+IsUYH2Rv7OqDMGH+0khqicT7dSFC6iu1TJoqwy
         V6hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSejDcAh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f2890386bbsor54541047b3.10.2024.12.18.05.51.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2024 05:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSejDcAh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734529892; x=1735134692; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iUDoOsV26Qe4oFZU3uHRuMJZh3S91v5QoMM2nH7Rk4=;
        b=mSejDcAhJj0IC1ECRVocGLLOIWE70x+8mQVc2bWweiUXmjfnvXU0+hk/RFqMYMXO/q
         z7ec5dIEwxSESjs63Hcht1nLCiNQRAuowWHYxz4if9RDc3+1/C3aeswPr8L4+2qrGap2
         7HwqZOibeosdhlFSHjolHL4oJPGP8tlM4HvBTIoREVWaRhZUB0Qhbmuros8O9Om5btDY
         7VRdygDJZcqkdI8fKFkTHkB2sRIef+0FgO9Dc2zjlUYllpZF5xnFEvByxLdn3O3kTMFg
         v8v3zpnGNQhJK9zQxkDUJssq4n+xvjGAI4xFJwMTrvbmA6kvEN71L69kXIFt2SWkN/tu
         OF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734529892; x=1735134692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iUDoOsV26Qe4oFZU3uHRuMJZh3S91v5QoMM2nH7Rk4=;
        b=WHdDLYCChRY7/FTNQBPI9dv7nqjUCLUaa/sgICdXFBRzyoZFd1SaP+0OFwIoeuw/k3
         /WZynI5cMOA4tGRPSL5r7oev6awD8nAYcKfi+mPQAkjuwMk6175wRnz8d0UJqszARzG9
         et1i5gOUd1dOMrnDBR0xQ/x412x5wIn6Psvilb10to2wmu10VptwAiRJfdxN1bcehsbQ
         6g+HtUAUYDLkVwE0k3RvjtHo07iilXfkUrx/wTv4V8l6/Fk31Xzz/en9VCzvONyLvEtD
         xFXfVOH8A6pxlO1xA8yG1t7SYjvVZHvvqiBBAlUB9/izx9U1TVuuizYI4rfnwXMOBPmh
         5twg==
X-Gm-Message-State: AOJu0YyebuF8JmtQSm0uR6NsNPHIwX1B+m6deQTxF9ywB+EFUJa4P7Ks
	TsG340TPUTcruFnaYntYx0NpLPZaZ67qWC6wQ0CPmqKod4KfHstaDMc192KCmP/qZHCnKYx4gje
	cSBVA1NWgFTQ4Y/pxzvZ6Sbs8na5d1FC8mvqLc8Bf
X-Gm-Gg: ASbGncsXSO/0z98JEiX9jULxrU1X+B0b1maZaFbnJIR1VoyU+TV9EIbzzhyGvuylN3f
	wWqoq+fpQdLfr5QI3F5zhVODwzn6uQLZWPYV7gOM=
X-Google-Smtp-Source: AGHT+IHXPem1A6ST3qeAiEL5KTr8qkukNq9VCj+GeLtRyG9HNbPypmNQkQCJ+fR3gFQH5kMC3y6EJP2eSJ+HrJgyZxA=
X-Received: by 2002:a05:690c:23c1:b0:6ef:5820:3901 with SMTP id
 00721157ae682-6f3d269397cmr22765557b3.37.1734529892137; Wed, 18 Dec 2024
 05:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org> <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
 <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org> <19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
 <87pllq69l6.fsf@draig.linaro.org> <CAFEAcA_xe5QEPsrByM8ems_rxt-KsVRAgkKhGk24X-1J0vcCDA@mail.gmail.com>
 <75ff92e0-7384-4af4-bc9f-64a6b0febc9f@linaro.org>
In-Reply-To: <75ff92e0-7384-4af4-bc9f-64a6b0febc9f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Dec 2024 13:51:20 +0000
Message-ID: <CAFEAcA8YNcft8KU8mytHv+H71L7L8d=QBgQmSAmq9J7Ny23=tA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PHNSiNRUd5Qp

On Tue, 17 Dec 2024 at 21:08, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 12/17/24 02:38, Peter Maydell wrote:
> > On Tue, 17 Dec 2024 at 07:40, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
> >>> I think this is still a change worth to do, because people can get a
> >>> 100% speedup with this simple change, and it's a better default than
> >>> the previous value.
> >>> In more, in case of this migration scenario, QEMU will immediately
> >>> abort upon accessing memory through a pointer.
> >>>
> >>> I'm not sure about what would be the best way to make this change as
> >>> smooth as possible for QEMU users.
> >>
> >> Surely we can only honour and apply the new default to -cpu max?
> >
>
> With all my respect, I think the current default is wrong, and it would
> be sad to keep it when people don't precise cpu max, or for other cpus
> enabling pointer authentication.
>
> In all our conversations, there seems to be a focus on choosing the
> "fastest" emulation solution that satisfies the guest (behaviour wise).
> And, for a reason I ignore, pointer authentication escaped this rule.

I think the reason is just that we didn't understand how much
of a performance hit the architected algorithm for pointer auth
is in emulation. So we took our default approach of "implement
what the architecture says". Then later when we realised how
bad the effect was we added in a faster impdef authentication
algorithm, but we put it in as not-the-default because of our
usual bias towards "don't change existing behaviour".

> I understand the concern regarding retro compatibility, but it would be
> better to ask politely (with an error message) to people to restart
> their virtual machines when they try to migrate, instead of being stuck
> with a slow default forever.
> In more, we are talking of a tcg scenario, for which I'm not sure people
> use migration feature (save/restore) heavily, but I may be wrong on this.
>
> Between the risk of breaking migration (with a polite error message),
> and having a default that is 100% faster, I think it would be better to
> favor the second one. If it would be a 5% speedup, I would not argue,
> but slowing down execution with a factor of 2 is really a lot.

The point here about "breaking migration" is that we have a strong
set of rules:
 * if you say "-machine virt-8.2" you get "exactly the behaviour
   that the 'virt' machine type had in QEMU 8.2, and it is
   migration compatible
 * we can make changes that are not migration compatible only if we
   ensure that they are not applied to older versioned machine types
   (or if they're to devices that are only used in machines which
   do not have versioned machine types at all)
 * TCG '-cpu max' is a special case: it is not a fixed thing, and so
   it may acquire new non-migration-compatible changes between versions
   (and so if you care about VM migration compat you don't use it);
   but this is not true of the named CPU types that match real
   hardware implementations

This patch as it stands will not preserve the migration
guarantees that we make. So we need to fix it by either:
 * only making the default change on -cpu max
 * making the default change be bound to versioned types

As I say, I don't have a strong view on which of these we go for
(and I'm actually kind of leaning to the second, given the discussion).

> > That was what I thought we were aiming for, yes. We *could* have
> > a property on the CPU to say "use the old back-compatible default,
> > not the new one", which we then list in the appropriate hw_compat
> > array. (Grep for the "backcompat-cntfrq" property for an example of
> > this.) But I'm not sure if that is worth the effort compared to
> > just changing 'max'.
>
> When we'll define hw_compat_10_0, and hw_compat_11_0, do we have to
> carry this on forever? (Same question for "backcompat-cntfrq").

The machinery for how this works means that you only need to
put the property in the appropriate hw_compat array for the
machine version before where it was introduced. The 'virt-9.2'
machine type applies the properties listed in hw_compat_9_2
(you can think of the properties listed there as having the
meaning "downgrade the default behaviour back to what it was
in 9.2 and earlier".) The virt-9.1 machine type applies the
properties listed in hw_compat_9_1 and hw_compat_9_2. The
virt-9.0 machine type applies the properties listed in hw_compat_9_0,
_9_1 and _9_2.

This is all implemented by the boilerplate DEFINE_VIRT_MACHINE() and
virt_machine_*_options functions at the bottom of hw/arm/virt.c
(plus the common code that invokes). We have to carry all this
machinery around anyway to handle other migration-breaking changes
in other parts of QEMU, so it's pretty free to add another property
like backcompat-cntfrq here.

The very oldest versioned machine types are deprecated after
3 years and dropped after another 3 years, so eventually the
older hw_compat arrays will go away.

> > (It's not that much extra code to add the property, so I could
> > easily be persuaded the other way. Possible arguments include
> > preferring consistency across all CPUs. If we already make the
> > default be not "what the real CPU of this type uses" then that's
> > also an argument that we can set it to whatever is convenient;
> > if we do honour the CPU ID register values for the implementation
> > default then that's an argument that we should continue to do
> > so and not change the default to our impdef one.)
> >
>
> For the TCG use case, is there any visible side effect for the guest to
> use any specific pointer authentication algorithm?
> In other words, is there a scenario where pointer authentication would
> work with impdef, but not with qarma{3,5}?
> If no, I don't see any reason for a cpu to favor an expensive emulation.

The guest can look at the value that the pointer auth instruction
produces if it likes, so it can certainly tell whether there's
a difference. But the only reason to do that is in test code
that's checking that the pauth instructions do what they're
supposed to do. Architecturally because multiple authentication
options are permitted no well behaved guest is going to depend
on which one exactly is being used.

As I say, I do think it would be good to check whether our
current implementation is "default to qarma5 everywhere", or
whether it is "default to what the real CPU says it has in its
ID registers". If we are already defaulting to something that's
not what the real implementation does it's another piece of
evidence on the side of "we can just default to a different
not-matching-the-hardware choice".

thanks
-- PMM
