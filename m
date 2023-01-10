Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3191245ejc;
        Tue, 10 Jan 2023 06:00:42 -0800 (PST)
X-Received: by 2002:a17:90a:f3cc:b0:226:daad:8c88 with SMTP id ha12-20020a17090af3cc00b00226daad8c88mr16130882pjb.16.1673359242345;
        Tue, 10 Jan 2023 06:00:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673359242; cv=none;
        d=google.com; s=arc-20160816;
        b=vlRibS5ccvTAUM45UHjQc9PuqHLiDphi4RKgxOpoSnY2nxpunT4GGgGVN75iHpUPHY
         H9n5GGf7zYwGDYQhkp8TF8Y2GRSYLncZ7y3+iTKBAeLXZEpoRqX8f4+CFhmEMH2qSo+5
         laipIsoiD8+kOQc4gZ6CMMaeO4eaUcIpje8+ukCI3a2zBw6ygv0hU1idi7zfP5+erZv5
         QTJKvaDgFfI1t/z5T3rqoT95KpW6u/rAKkdRjpjPplOrcB2WYlchKt1nnNYR2cNTmEhV
         a/ziu+oH5wAOxi3w+DN3Pxi6zh2aPf6WbReSXcLxpOB27rjOlgI2zeS767R065M40HvL
         GD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DMe7RbaSJgZe9w623NlnNt2u89RwUee6aXRdGZn6u68=;
        b=mQ9g1NTf9r+wnJ+nFWiVuLUM/lh14qT4tbw8H10vvMvlIcpgaK4QtYuQPF0i2/g9Hq
         Trq6zBCCjExrjGoW8KwUuPC/CfHKbwNwmJZfWcK2UjZSX/VQTqGRtkuI0kJcS9DvHQoo
         1CaQXPVcSaDxCZ0n+dOO6GhmhkK6/ytLndw399BMq0ebbKbvV058dYKzhuH/OkneXrMz
         yXK3X+vgjSRpjhQShXb/2i9tJvrT6aue+WU7UplQ1IlsnEwP7p9vmAkppeu2L8QWN3GL
         Max4KxW04mcdjhGjHWdudoZuwOE5lB813e0NeBTzlKJKbBZ524x/SE0Ehmz8NxbiayK/
         5UaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nB8UN+d0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gj1-20020a17090b108100b0020d88f95db6sor5665931pjb.42.2023.01.10.06.00.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 06:00:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nB8UN+d0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DMe7RbaSJgZe9w623NlnNt2u89RwUee6aXRdGZn6u68=;
        b=nB8UN+d0FTA8nZ2nPBX5r1yYRY0ODU42OIbACFuyGN4iT3WxumrGCn917M/CtJC0SM
         Qx9W6LpXjgKUTTwMfEfV+2uP+1tJJSsm8vmnfXkjldY11WLAYHnw5BzvxsTgVwlUyR/b
         e6Rx4dLPpKoVN/7dEcEKhYaF0697vhb+s5lg2ES48Y5vMNXxiEujPVx5xuhy6ZsgTqye
         +x99V2vPiXH7ApprPNDcrR5Qa9zXPX3bnFgIXfnj6YHH/wOLLesS9zScyISSpJSTV+ZL
         KU14KMm668eHahXOU2uVnkR55IUY3jbdcw8lTiRiRXxnbYZemMoCiquHo16Xv2+20hcx
         tF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMe7RbaSJgZe9w623NlnNt2u89RwUee6aXRdGZn6u68=;
        b=sBlOsXoLwhE0C5QaTx1rPsT2X16UaWZizgSC2zDR5Z+71x6mY4ZeqnBXY334eaEShQ
         B8JPxH1BIf5vvhpB1mIb47OA5r2RgtLmASjsh9EZ+XSOeNgDE4W5zGLlvI11ebwysciR
         VNNkXL8gD0AhxYd+TUBaBIh9xYeMwN9e0DEYx+gX4lfcRgDzOo6Ga3JRTFYgnFi4TZDy
         +nfD4+7r4OwGfPG9++nzpXnIQPKO7ECdLaBIT0HiOaa9MsNASU/ZRpDEd3986GFOdNS0
         fbACJ6b34dY+4tbnB9iuV+L8UEqczuKUbfQ3JVOmPKEtd4+2r+bOzdLv/5pCw8wqtpog
         adYg==
X-Gm-Message-State: AFqh2krbN4Qpy8jNFje4MRIro4G4316KyHPYdyCT0B4lFBONev1E2WZV
	E+ubw14ooQUIMadp7+wMjJ4QF0AeNNtY6vdvk6apgcJb
X-Google-Smtp-Source: AMrXdXvJhwsj1XZA/WWJ1qxaLRBPx96Pk/M9XC2XXMRS5QU8oh8JeWU8kSP/UogbhvGsnFww38EE/dVKDxklDM3aMdU=
X-Received: by 2002:a17:90b:30ce:b0:228:dac2:3704 with SMTP id
 hi14-20020a17090b30ce00b00228dac23704mr70836pjb.221.1673359241260; Tue, 10
 Jan 2023 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de> <20230109224232.11661-8-farosas@suse.de>
 <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org> <87v8lea5n7.fsf@suse.de>
In-Reply-To: <87v8lea5n7.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 14:00:30 +0000
Message-ID: <CAFEAcA_422_D4bCxO-_v8omMa4VRSwUwDaY3JHuhPDs6PCh3fg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into cpregs.c
To: Fabiano Rosas <farosas@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-TUID: K02SqvUOkKjS

On Tue, 10 Jan 2023 at 13:19, Fabiano Rosas <farosas@suse.de> wrote:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > On 1/9/23 14:42, Fabiano Rosas wrote:
> >> We want to move sme_helper into the tcg directory, but the cpregs
> >> accessor functions cannot go along, otherwise they would be separate
> >> from the respective ARMCPRegInfo definition which needs to be compiled
> >> with CONFIG_TCG=n as well.
> >
> > Hmm.  I would have hoped these could stay tcg-only, somehow.
> > I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.
>
> In general, what characterizes as "special" for a register to use
> ARM_CP_SPECIAL_MASK?

It means that the register has special-case handling code
in the translate.c/translate-a64.c TCG codegen functions.
Non-special registers can be handled all in the same way
(load a constant, read a field from the CPU state struct,
or call a read/write function); the special cases directly
emit code to handle whatever they are doing. See the switch
commented "Handle special cases first" in target/arm/translate-a64.c
function handle_sys().

-- PMM
