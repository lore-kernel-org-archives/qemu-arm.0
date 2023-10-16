Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3210804ejc;
        Mon, 16 Oct 2023 07:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2mt/iAHwAtF0N9PHG+PQiuo+LTYHBZEEXbLaGQjXF7UCiyWsQ6I1R0x3tMekFxfshOmdw
X-Received: by 2002:a05:6808:1511:b0:3af:611c:c74f with SMTP id u17-20020a056808151100b003af611cc74fmr43281136oiw.5.1697465665740;
        Mon, 16 Oct 2023 07:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697465665; cv=none;
        d=google.com; s=arc-20160816;
        b=wu1FvkRah7MMlGXdgZzKAgNBJpGk0LB2wcFKQt4XVA5Ieuefiek+BewTZTFNvTDVpT
         Tmb4TItxYM9j41xIFAjFVA2J55fXjzTp2aVJgg88AxRSEawxMw5s+b7iD1cNzZmUiohi
         KiWGAuNTycsfw63m4KnDFyoGglDVphy1HwckVcg6AU/ZouAYWL952jcZjZ1fUXogBaHW
         Wg3vWg3pXzT0QYAtpMg5hq3VSyqX3r2ZzRGM/xAH1x4RKHLZPb9CrtnLlgE+t5SgGcbL
         QDHwYiNIvR56AsT0rhjqb1nkkL8IAxiMJHUgqzuoWDzf8k4NBqEAl83kunMbs5ObzbLa
         QBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=phQxIX8T/eE5G1lpVLOkFYrKOLOKnb+r3Zm5nLLnAGo=;
        fh=YqwzSgE4zJvz4/IunW6OwTPS6XM7IyAKcDKuWdVMekE=;
        b=Iq0JJq1qH5mgy9mTkDIa1MguxZ6owGQaudNfsV1Ydd5gHiqAy1D/pIz+LZIZuXsTCZ
         SB/UuyZV6BDW5qB5AiI/no42MyeHmcitjKr4yv4mFMfSwpAWt9chqNj/mfsKBW4n/rx+
         tb7QiAmdcYAZfskuO2Th4q8Jj5RzxozrO7eP6wTvpZiFuq5MIqjqnKfCvLuLM30nic1b
         OmkWcFy1Dba/aB8BSPLzBckE7VcSyPTCEUvFnJVaRJNG8CzC5zED7oHCxFUMYfmDxK6l
         6SkzPTYLTfiq2f/KH7gm4uLPsUkn/Y9QnYNNOB6QsYPSLnMjtA3Xk3x51/5hB4fdjofJ
         PwEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5U3K77g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05622a064600b00417ccca0054si5351170qtb.174.2023.10.16.07.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 07:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5U3K77g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsOM5-0002vO-Dc; Mon, 16 Oct 2023 10:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsOM2-0002uS-Qa
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 10:13:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsOM1-00020l-7b
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 10:13:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so7935377a12.0
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697465635; x=1698070435; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=phQxIX8T/eE5G1lpVLOkFYrKOLOKnb+r3Zm5nLLnAGo=;
 b=o5U3K77g0qa67A8YIbdB+OCk9LClRjWIkZVZLex59PHDcu5NtDtYma+BhoAFDN1Qdp
 s0Tj+jyVkTb6hjowFID/vN3hT+Cbd+aaeGaNFAbtolHg7Spzp5lFkoM9VPKCQJ+0sRNJ
 lFdQJomzY35OGA12R2lJQk8zwjlnbdGPFpinxwnoi88B7WxoYZtXgOOO9SvChX7ZsdYp
 e5FI2hflRM0MI/LJLeHJzBzd3jZ/CJI70Fv7KBqD1w7IvHuDADtB0iX8OOAchZQsYpXv
 D/S9s5uOWHAcFlM6JXK0CyoQpMcXkinYtsRfHHGzaO8QpkvTAdm+IIAKzm7u0RPXWQ/h
 tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697465635; x=1698070435;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phQxIX8T/eE5G1lpVLOkFYrKOLOKnb+r3Zm5nLLnAGo=;
 b=K/DHc/tbWOY3PYrMpwAtJyzQWPMsmcUSCMlKCZpWR5MjoHP4a/F15EXT2Aj0yK/n7X
 WAPAj0Q5pLWbRdZdqzjS299Xwrf/J2HXjUuYvkrD9hnVwyUJFa91NkR7qBSmcigVz+5A
 M9qwYlIpNQa0QxpNyJqMC3i0vXkDjDzD/MgmGjde+GH+niWEXdDTz9CIJJn9ZfH93zhH
 JbitvVtWqesH9/BAAP/ZK5nrZIFK+B9wavjVkfPoD36aw6G9xBnp2cVPRxP/ezRe3Bx9
 KJHk3RpMh6vb9KhviwTi6X3jyRVkpiixbbCEuALCClkwPyQFRsVd3CteqR31H5PWaZnp
 PWyw==
X-Gm-Message-State: AOJu0YwyIK4bx03Cbefop+G3jKjZ3dDDjfkTeQBd/D5cxOkOXOF9RCSo
 LDP/rnAsOtPWbLsOkoqz3ysyyOwRuoXm0U5CzUAJKw==
X-Received: by 2002:a50:8adc:0:b0:53e:467c:33f1 with SMTP id
 k28-20020a508adc000000b0053e467c33f1mr6728635edk.8.1697465634909; Mon, 16 Oct
 2023 07:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <87o7h2hey5.fsf@pond.sub.org>
In-Reply-To: <87o7h2hey5.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 15:13:43 +0100
Message-ID: <CAFEAcA-LQP_dQ0mjeNe8nOtMVy22iwJt2yfG5m_f4oQjQ9ts7w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/78] Strict disable implicit fallthrough
To: Markus Armbruster <armbru@redhat.com>
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0kvv76CEbZGw

On Fri, 13 Oct 2023 at 13:42, Markus Armbruster <armbru@redhat.com> wrote:
>
> Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
>
> > Hello,
> >
> > This RFC is inspired by the kernel's move to -Wimplicit-fallthrough=3
> > back in 2019.[0]
> > We take one step (or two) further by increasing it to 5 which rejects
> > fall through comments and requires an attribute statement.
> >
> > [0]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a035d552a93b
> >
> > The line differences are not many, but they spread all over different
> > subsystems, architectures and devices. An attempt has been made to split
> > them in cohesive patches to aid post-RFC review. Part of the RFC is to
> > determine whether these patch divisions needs improvement.
> >
> > Main questions this RFC poses
> > =============================
> >
> > - Is this change desirable and net-positive.
>
> Unwanted fallthrough is an easy mistake to make, and
> -Wimplicit-fallthrough=N helps avoid it.  The question is how far up we
> need to push N.  Right now we're at N=2.  Has unwanted fallthrough been
> a problem?

Mmm, this is my opinion I think. We have a mechanism for
catching "forgot the 'break'" already (our =2 setting) and
a way to say "intentional" in a fairly natural way (add the
comment). Does pushing N up any further gain us anything
except a load of churn?

Also, the compiler is not the only thing that processes our
code: Coverity also looks for "unexpected fallthrough" issues,
so if we wanted to switch away from our current practice we
should check whether what we're switching to is an idiom
that Coverity recognises.

thanks
-- PMM
