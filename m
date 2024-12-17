Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp105485njk;
        Tue, 17 Dec 2024 02:39:08 -0800 (PST)
X-Received: by 2002:a05:690c:6a0e:b0:6e2:12e5:35a2 with SMTP id 00721157ae682-6f2bb2e857amr22734847b3.4.1734431948071;
        Tue, 17 Dec 2024 02:39:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734431948; cv=none;
        d=google.com; s=arc-20240605;
        b=lAesdAhU0hzBcSLVQi3bMZIqv9IyOYcuxLH5lBk5P2134szvtKF7WAR33zlz/z8bVr
         AaZuwgn/BNTSVDkksBdUflVnjJQnOTMryvTr4ASSS3IqBWJDQUTXohE1L/SGIMrYm5eT
         +que4MT00AF2j1RQXjre43OuCyt7mvNb3reOMQxda6X9eGMjTYpmoA+OeFeRlTnUMuuU
         wnFs3BjSY9TRYL+R61HHrDRLuTGbdFucetnyrwWISQXw8FT28XBqmL2MTEWi/GJV7bGe
         ODb7ScZ8k6cydJrjZNk4j1pM8dgFZY+8FRMhuO147aZ2cFA+COBNVwnqE+N4D55Ah8PX
         xVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W6eIxnqCtDrzYV8NrJJpVsr7m0UqjADBHZfxpQylbP4=;
        fh=AzP3l4ZbhLEWG0Mt74rZwVdy1N3CiIFvMIavePkQTLw=;
        b=SdTQyWfcpveSEgNVg1SBkZCwa6T8B6Als3ezEhUINduGTYIcda9CJt8JiOAzrMFEqP
         zGI0wTmr0TE2kzV/cf0Ixg7jVR9X/KAadVNia4IM9trMguSn/0C90MdXVG2cKd1r0rNb
         NLgERFORdGMl4JRlrrXfu8NVc4bVCCEEdHJm6XqkGTuGCkuDCzROgBpT2TCT0+2/jPxi
         DOpF9DK8A/EVN31ox1/CBWvjVBMuUio5zoJ65oRtvEafhJNOVLfTLpY2UYR/3+EQCyxR
         lTwKJJTbRTmisdoYY2K3DfbS9qwrvwx9BtktRb2PyIqOpYWXdz9iw2TfAbtmAOf7MeFK
         lokA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5hWOlvQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f289007c75sor38794327b3.7.2024.12.17.02.39.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2024 02:39:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5hWOlvQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734431947; x=1735036747; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6eIxnqCtDrzYV8NrJJpVsr7m0UqjADBHZfxpQylbP4=;
        b=h5hWOlvQoqUqlGZ1XjYaqMc2jEptZpzyqG4YMEKBB+/qdUcfE+Qblok+5p3BwLyC/O
         v0SmtXU8t8uXAkqOTBCEG6WaJ8HmEIvyJmd54pX+lYBWjSoQe8++jj/pTEmLwiNhBQZ9
         YWTs89clidxJgBr2eLHZLwPNOHU5hxJExwodFR+Yt8LQadiTiTVJgzWKKxKmV7cjpPFw
         RsU/QIgN7APteqd/PJB367UYGnqVRZ5RpK8Mss1uhDyIraCwZpTp8p5FPBsTag3BXX6Z
         qg7k1v1YzUBX+0d539dQj10aaPMS81ua2M4SQp0RWx8wqPM5VQb2TQETdgG1fy2AMx4M
         KOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734431947; x=1735036747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6eIxnqCtDrzYV8NrJJpVsr7m0UqjADBHZfxpQylbP4=;
        b=VjP8D87lyueX71i4xpet4UfRPFRDRL//9uPkbd0X0qGgIH6OK8wD6nv7zlu96dRWgX
         NBFkJmc0tCA728AdCYtAj2YBJPit6QnQYk6DLjPqTfpuWXVVwf65+Y2+/flhqrDSH8fl
         YbONKcdxhxEXI8ZFmPixqRxZNRWIoJc/ZAA3ARu7SeyWn82X+44gObloYtVv8u5eYLs3
         OX1SfobV7d+deKGhQf+Bj91hdOtnZFx/dq2WB5rbL/xH0xV3f7w8Z6rCQj8Teng/umHg
         +cwgP0SSRRlw7NUugZpPvHsUoCsb2WNoPsNV3pTeQV3ndF+6m5mrderDA+W6v2dDin5W
         5Qxw==
X-Gm-Message-State: AOJu0YySYoVUHmdMsUyS8RsPZYvWg+OVy7FL+PVAg70Zd/AmtFHRyi0u
	eLk9PDUToGA3y6ECxotpI2ZLsUZ2H8NoF7yw5FkIHNsKHGGHRqgp7PgZ6uov1PeXrhbZDjk5yH4
	WqubolgwLGxBYblt0Cn7V/rcRMFsb9vWjQWFnaRxJWorb9joLavo=
X-Gm-Gg: ASbGnctvrXZVofDgRhLuNwH90jX6nSDc4mcsxYfB3QQv27hPoQqIEV/0azb6/QUbBR6
	MEWfynCIu4wSL+8nQpxcIt1k+gFQqfjnEV9j/VL4=
X-Google-Smtp-Source: AGHT+IEtHJjW+dfTAA2dYgeekMy0SqyzY0XVWWzgpbZlGup+GeQJaI17e2w47ZHkT3K8Nz6vXW/oPNEvHsDUj3eifS4=
X-Received: by 2002:a05:690c:f12:b0:6ef:5c57:904 with SMTP id
 00721157ae682-6f2bb2e7fe6mr24412387b3.7.1734431947643; Tue, 17 Dec 2024
 02:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org> <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
 <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org> <19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
 <87pllq69l6.fsf@draig.linaro.org>
In-Reply-To: <87pllq69l6.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2024 10:38:56 +0000
Message-ID: <CAFEAcA_xe5QEPsrByM8ems_rxt-KsVRAgkKhGk24X-1J0vcCDA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1quRmkcxcFC0

On Tue, 17 Dec 2024 at 07:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>
> > On 12/16/24 11:50, Richard Henderson wrote:
> >> On 12/16/24 13:26, Pierrick Bouvier wrote:
> >>> On 12/16/24 11:10, Richard Henderson wrote:
> >>>> On 12/4/24 15:12, Pierrick Bouvier wrote:
> >>>>> qemu-system-aarch64 default pointer authentication (QARMA5) is expe=
nsive, we
> >>>>> spent up to 50% of the emulation time running it (when using TCG).
> >>>>>
> >>>>> Switching to pauth-impdef=3Don is often given as a solution to spee=
d up execution.
> >>>>> Thus we talked about making it the new default.
> >>>>>
> >>>>> The first patch introduce a new property (pauth-qarma5) to allow to=
 select
> >>>>> current default algorithm.
> >>>>> The second one change the default.
> >>>>>
> >>>>> Pierrick Bouvier (2):
> >>>>>      target/arm: add new property to select pauth-qarma5
> >>>>>      target/arm: change default pauth algorithm to impdef
> >>>>>
> >>>>>     docs/system/arm/cpu-features.rst |  7 +++++--
> >>>>>     docs/system/introduction.rst     |  2 +-
> >>>>>     target/arm/cpu.h                 |  1 +
> >>>>>     target/arm/arm-qmp-cmds.c        |  2 +-
> >>>>>     target/arm/cpu64.c               | 30 +++++++++++++++++++------=
-----
> >>>>>     tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
> >>>>>     6 files changed, 38 insertions(+), 19 deletions(-)
> >>>>>
> >>>>
> >>>> I understand the motivation, but as-is this will break migration.
> >>>>
> >>>> I think this will need to be versioned somehow, but the only thing t=
hat really gets
> >>>> versioned are the boards, and I'm not sure how to link that to the i=
nstantiated cpu.
> >>>>
> >>>
> >>>   From what I understood, and I may be wrong, the use case to migrate=
 (tcg) vm with cpu max
> >>> between QEMU versions is *not* supported, as we can't guarantee which=
 features are present
> >>> or not.
> >> This doesn't affect only -cpu max, but anything using aarch64_add_paut=
h_properties():
> >> neoverse-n1, neoverse-n2, cortex-a710.
> >>
> >
> > I think this is still a change worth to do, because people can get a
> > 100% speedup with this simple change, and it's a better default than
> > the previous value.
> > In more, in case of this migration scenario, QEMU will immediately
> > abort upon accessing memory through a pointer.
> >
> > I'm not sure about what would be the best way to make this change as
> > smooth as possible for QEMU users.
>
> Surely we can only honour and apply the new default to -cpu max?

That was what I thought we were aiming for, yes. We *could* have
a property on the CPU to say "use the old back-compatible default,
not the new one", which we then list in the appropriate hw_compat
array. (Grep for the "backcompat-cntfrq" property for an example of
this.) But I'm not sure if that is worth the effort compared to
just changing 'max'.

(It's not that much extra code to add the property, so I could
easily be persuaded the other way. Possible arguments include
preferring consistency across all CPUs. If we already make the
default be not "what the real CPU of this type uses" then that's
also an argument that we can set it to whatever is convenient;
if we do honour the CPU ID register values for the implementation
default then that's an argument that we should continue to do
so and not change the default to our impdef one.)

-- PMM
