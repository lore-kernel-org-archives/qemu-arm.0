Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp836986lfm;
        Fri, 26 Jun 2020 14:41:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZHtTTG6MuNm7+DFlUbn93L79JaAfiKR4rh6c3lY4jzQW6rUhPTMTSwdkZM86TPmvYbNaz
X-Received: by 2002:a25:504d:: with SMTP id e74mr7697331ybb.47.1593207671804;
        Fri, 26 Jun 2020 14:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593207671; cv=none;
        d=google.com; s=arc-20160816;
        b=pHnpk9VnBtvr5pgsLcuXlQk//jt1Oq3Udf6WHfVj9xvdQty9ajh//qS406d1DvskQi
         8LF1Y58G0pcYDGQGhDu1ZdIX8Hp5ya8AkkatdezVfE9tkt3P5LUKa35AdJV5Fw2zaA5z
         tZpKEdlTFs3mTsmfvYE049o0HQJcMOL/qF0sYHKfOL/ErdkConMTd0aBIY9WMSn05c82
         Uo9SMoi46EADPqB4DfVu4Z8p01e4rUCnEQwTOaquyNCrqzPRWCA0nhVSe/7vEEgySeJz
         R3f47fgdHB5Jdbbf6Ui2/qEVX57Hl3zy2KLKMmwiAYh6A+UrVlpkThzMuFi4lqalD7zC
         cKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OonjJjqVdhCWklfLRYzsIcJOt3ledBb4lvdwgj9eqcw=;
        b=BNYAxxINTaIHft0GfZhNJLh3ydO173LAHZ97C3J4XyAwacudFFsDojzBY+5ZRqTDoK
         Zw4vJE7H0U43sG4B+oIAPFNhRp+bfbzag3c/neVwi+WVmmYKkO/gFFH6FwvKXH+U2lCr
         i4ZBQhVCZ8Nnq9xSXIYLYMXlMjJssGooHEOZu4Mrg4HQ8XRvg4fOB+gYD2G89VjqznGD
         pVmGYxHENhZFLhLSYcO55KmVJUi7+B75gtXxHxM2KTUNeF2xtkx16M7ctes2Cc8m4247
         56TSTIfnA75X8/IWetH6i7JG74BoZObZRpurGxuAxnuN2IwdyUtgngiV/mOTM5lV0WPB
         bX7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V+G+LAqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16si26593098ybk.13.2020.06.26.14.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 14:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V+G+LAqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jow5v-0007Nn-5i
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 17:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jow5k-0007KM-Oz
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 17:41:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jow5h-0004OV-TT
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 17:41:00 -0400
Received: by mail-oi1-x241.google.com with SMTP id w17so8573138oie.6
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OonjJjqVdhCWklfLRYzsIcJOt3ledBb4lvdwgj9eqcw=;
 b=V+G+LAqIsRzSpKX8lle4D/FSD88mCl63QC0y9bFvci6sUi1svc/izahcTdfM5DwXfK
 h4QWFA9HzuwEvbY1CaENtGJAmsQVtQmztFEeRtMuEzr02MqnJf2e5SKVDHJcxyRYAmXN
 1uq16Es2Ip9zKsplVg6/4/+m4x0+AcsdoBM3ztW2/x1o1JGqeKA9TtOsFnSz9NPKfxlv
 ue+VDRw2QfvLfv0unPT12JcOGOkrhv1eDiDtGTOoG1fbEKxptiT1O50w4hUfxAIgs7YT
 gHPEOYlo8qREL7/uOXpCtIgolvsPuzjGNqw6iVdsj0FDh013fxpMXDgl9S91vB4eFh0Q
 vSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OonjJjqVdhCWklfLRYzsIcJOt3ledBb4lvdwgj9eqcw=;
 b=fc4Eu32sYh3FqKWGSB2jCStUaxuwOq1GpWXpaqUD/UwNRke7fyE9o1YxLByM0sle2a
 SkMN2R/4TSVsbPjCX28hM1usi/4Ut2FkIuS9+oI9MN5KvGGnJa/9biKdPk3fu1qV8PoJ
 QnUJCiuGLQHjYdC8verbT1iewvTE2M1HebCjsoyL4jJRl4grTr4oHajEsLeTB3wBikRO
 yGGpcb8OjC954BF0ZKlNyGg1lRNm41ZIvBRPWWFZHDkMLO1vcSQBW1IBt9v+TmIahykv
 5rtaNpiY/Ovv4nZp0BWX0WVA6KMjC+z+w0CAkZ89EBqgfNQvI08iIAF/rZQNhaC6kWMv
 cFyg==
X-Gm-Message-State: AOAM53034NLVFGcPyi8XHrbaPxyLy9hIURcd6CilHW7rapQiCR/AJrWu
 FwNKs/I4pauihKEoPIqhcSYBuyUqM9M4+RTCRVRUMQ==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr4092816oia.163.1593207656006; 
 Fri, 26 Jun 2020 14:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200625230740.549114-1-keithp@keithp.com>
 <CAFEAcA9ut5CVAgRTP-_BK3WpiDSmitFowZMe549TvgSAjj+Kfg@mail.gmail.com>
 <87imfdixv9.fsf@keithp.com>
 <CAFEAcA_ZRMpqAhR7BL05a+O_C54fhXZn8-+kC_KUU5n3BpzoCw@mail.gmail.com>
 <CAMo8Bf+57b=u12nMp4EWaza3WdOQpx_L_O=HvdouM99wW-Xe=A@mail.gmail.com>
 <877dvtinyx.fsf@keithp.com>
In-Reply-To: <877dvtinyx.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 22:40:44 +0100
Message-ID: <CAFEAcA_E3MUbfgf11j=FdpeNbCr622g3WoNhWdMD0ONUAynM-w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add 'virtm' hardware
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +pDHTkefHCow

On Fri, 26 Jun 2020 at 21:14, Keith Packard <keithp@keithp.com> wrote:
>
> Max Filippov <jcmvbkbc@gmail.com> writes:
>
> > Most of them are due to unsupported/differently implemented
> > syscalls.
>
> Yeah, I think that was the basis of my confusion -- qemu-arm is not a
> bare metal environment, and my work is focused on enabling application
> development in that environment.

Yes, but for certain cases of bare-metal code that doesn't need to
touch devices or use any privileged-only instructions it may be
a usable environment. (This is more side-effect than intentional:
as you say the primary use case is Linux userspace binaries.)

thanks
-- PMM
