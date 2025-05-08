Received: by 2002:a05:7022:a9b:b0:a0:2f73:dc0d with SMTP id dd27csp363130dlb;
        Thu, 8 May 2025 05:07:53 -0700 (PDT)
X-Received: by 2002:a05:690c:3749:b0:703:ac44:d367 with SMTP id 00721157ae682-70a2ce6c5e7mr49255447b3.6.1746706073189;
        Thu, 08 May 2025 05:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746706073; cv=none;
        d=google.com; s=arc-20240605;
        b=HB30fL1+pDNec0/zEqvCeC9yLPQbzqbhaXV5Y+s9mfr4Ht1ELJFAyb0Q6Vdq3pqpcv
         8frVav1VypK215szWIOrBqj4ebA7IdhemUjqzgjtqceWeMMDaLsL6Hv5aq+3cK84eUkF
         +PB2+9YU6itQUFFVGwjqEq37wSKTLjiX/MZkJDwwAU+mA+HYojxnZH7/pxsl9z+4YMza
         f8KdIMwW+BdtGFv44D5Qbg1Usp8XEwDoKWxhqHP38SioFCmgw1ryBQ8hU+1OkL1NnChM
         9z5Do4lcIsG03jGUSFKADLLrdkBBvfJs2/I4ByaTzkLt3J39amDVJjvyBSf3HfTyIqJn
         TS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YL87FuhWDvRyv0KfIzORqijLk934LJSUMog7volKFdc=;
        fh=qFyuN+9aQ9YqLK0SiskoA6AJyTxb1+Ky9x7CdeetCiw=;
        b=eQoAYRYYlw55D+UQsyun8ESvOrgze3frAPg7v0WHFv8R9Jso4Ltphz2xU72YHdvkIP
         wSD7SxPKC3rak21R7taQbqFF1FCtizDAWC6/GU3V4bjMtJqQN8sZMPulVBrjpDaFyS3k
         TvUKdHR696ymHOMcOtgeRnc4AgKCdMj6h2dTd/+qZPrMAZ3/XpOmFC81h1kc/GsixpeW
         91BpqTuEygB+LMtcEADBdY4k8Kr6PkDnnm4S3xHeo+SUWrvGcQgT4aZMeW8XhHluGa1G
         vSVpf5zhYoZ9h2f4nZyhn3V3/S0eScdwig9NjbY/wayGSsIH0U4MtrpDTN7A6Qz75Opf
         bqCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yqLz0+Bz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-708c46f95f0sor98860127b3.16.2025.05.08.05.07.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 May 2025 05:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yqLz0+Bz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746706073; x=1747310873; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL87FuhWDvRyv0KfIzORqijLk934LJSUMog7volKFdc=;
        b=yqLz0+BzDqFD5vG6r6djdMRrYvpKQUZXFjXuUM6/+bcLRCphTDNrBsHwdO8ugR6aEF
         z93ZSPba7MqIJRIgE40+t7RbVQt5RWtLzL2yC22anrayiezNSDNrpC4gwejt9YR7s8pI
         LWv9+dTtnBddfbCbQ0f3v9ooKXcjAcU8+XIIxstWrZRQ1hspq9Ymj12sa78QkRWubGaz
         5Jur+RNQj9ZaSMpGgte+4jBoNvwbpwp50mds+OdXlPiDIlHIQ/ppMDup24yzMk2jHITk
         0HZuQo5+lZnLHKrpy213K0zS5aDUN2WmMC1Da6G23d2GQ4NZugt9n123od62AHtrwC+Y
         hqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706073; x=1747310873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YL87FuhWDvRyv0KfIzORqijLk934LJSUMog7volKFdc=;
        b=qJjtGM3A9do9eqWWqkHcGk5R3nlm9w7YTJalyIIUiKDFNzd0LE/zPVxv6gRq0Ml2Cp
         Ao3ZU7CptMOOHsAGHDVZ+AFwK7QoAzdN4Wa2rLrXsEL9CsY6g6elcY120k7G6HzprmU7
         9isNsr87Y3SFoY4ToY1KGaBcPi6WnNXppJEVUuwZdm2MxwMn9qw2exqSLISGlshc2LIu
         SsJO/IGEZtCHdsAOMdhNH/ITiBpYASI7yiHMAqZNBkHaccmWQUY6P+Mnw2efwEpokFVj
         pq6n1dk6ll+IsXUXRckDTIc4i6jLU+65DIJZ/x9aeE34tlIAd8AdKufzG6IVvGht7k0r
         Csrg==
X-Gm-Message-State: AOJu0Ywrb5fTms30HjfAAHLN1dDpz3YBXG3Cvt1pfYwkuZrT09vvNIS3
	bciI9JjPySb4mpOQX3vJO7mGB1/lAyxfORRLYqp//CDzJEu5q2S76ahQJfchhOhbdPhOyxG3Lwa
	lO0pw2bSG9g0BJUrlPTAePJnRGpO3MrwA9oXpIx6SsXA8MXG6Jc0=
X-Gm-Gg: ASbGncv8QlZLbauSjUQUg2T1YZ5Q+Q28vbBmTqWpxP+pnp/woiwlNVPqKJNPDaBqaZ1
	lEkL9IfRVKAgdXMyvlptJ2SSEzpgFgS+2wv3CK2udX9ApcgVKXkMBxp7pnHaIAlC1ZEGav7fVc1
	lOx9aLOJxfqjCygve8WwEtYVU=
X-Google-Smtp-Source: AGHT+IE5s+nuYHd6x2a6aCI7dtUK2PdHv+gp2usVJxorITTM1P4EYvIoJcl9QwMcbO2gplMF/xxze1IqiTWVweuX+Cg=
X-Received: by 2002:a05:6902:2b84:b0:e78:6954:49f1 with SMTP id
 3f1490d57ef6-e78ef5efa6dmr3846126276.4.1746706072667; Thu, 08 May 2025
 05:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250507165840.401623-1-alex.bennee@linaro.org>
 <CAFEAcA_0cf=XEbH9VQdTHqu1wekSmFDLdqnnzpcwnshCT-UUCg@mail.gmail.com> <87zffnmidy.fsf@draig.linaro.org>
In-Reply-To: <87zffnmidy.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 13:07:40 +0100
X-Gm-Features: ATxdqUHvqCH0dZwizDr8EfdhDc4AqOMpAhinqOWIMw7rKJfMVDevOb_UT-kHgyk
Message-ID: <CAFEAcA80-CWEQYwTQPziUxm5V1K93VZstLh2r9mTGkD5QueKoA@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: allow gdb to read ARM_CP_NORAW regs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Julian Armistead <julian.armistead@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5PznW7zseObp

On Thu, 8 May 2025 at 12:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 7 May 2025 at 17:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> Before this we suppress all ARM_CP_NORAW registers being listed under
> >> GDB. This includes useful registers like CurrentEL which gets tagged
> >> as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
> >> registers. These are registers TCG can directly compute because we
> >> have the information at compile time but until now with no readfn.
> >>
> >> Add a .readfn to return the CurrentEL and then loosen the restrictions
> >> in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
> >> be read if there is a readfn available.
> >
> > The primary use case for NO_RAW is "system instructions" like
> > the TLB maintenance insns. These don't make sense to expose
> > to a debugger.
>
> I think we could re-think the logic:
>
>     /*
>      * By convention, for wildcarded registers only the first
>      * entry is used for migration; the others are marked as
>      * ALIAS so we don't try to transfer the register
>      * multiple times. Special registers (ie NOP/WFI) are
>      * never migratable and not even raw-accessible.
>      */
>     if (r2->type & ARM_CP_SPECIAL_MASK) {
>         r2->type |=3D ARM_CP_NO_RAW;
>     }

Well, we definitely don't want WFI or the DC ZVA etc
"registers" to be exposed to GDB or for us to try to handle
them in KVM state sync or migration... ARM_CP_NOP is less
clear because we use it pretty widely for more than one
purpose. The main one is "system instruction that we don't
need to implement". (CP_NOP + a readable register is a
questionable combination since the guest will expect it to
update the general-purpose destreg, not leave it untouched,
but we do have some.)

> > If we want the gdbstub access to system registers to be
> > more than our current "we provide the ones that are easy",
> > then I think I'd like to see a bit more up-front analysis of
> > what the gdbstub needs and whether we've got into a bit of
> > a mess with our ARM_CP_* flags that we could straighten out.
>
> Yeah - hence the RFC. CurrentEL is a super useful one to expose though
> when you are debugging complex hypervisor setups.

One problem with this patch is the one that the reporter of
https://gitlab.com/qemu-project/qemu/-/issues/2760 noted
in the conversation there: it will allow the debugger to
read registers which have a side-effect on read, like
ICC_IAR1_EL1: we almost certainly do not want to allow
the debugger to acknowledge an interrupt by doing a sysreg
read.

thanks
-- PMM
