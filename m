Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp630362lfq;
        Tue, 6 Oct 2020 05:28:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfEgO5Hm442JakjpVO2fHjiuMfTaSYcx90Cjy+hg4ng3J88RomQlKLCvJc1b/TknEJ87i8
X-Received: by 2002:a25:505:: with SMTP id 5mr6157478ybf.355.1601987333349;
        Tue, 06 Oct 2020 05:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601987333; cv=none;
        d=google.com; s=arc-20160816;
        b=TCXgy2FmJiWpyYhUYsqMnPCkhIFQ5zXDU5kSiE4sI63BOMCqKGfNjc58fe0nVu6nCo
         B6GSTBkyGRgBUKkT/iI4tjs/TX9P80Mv+yGOeLubyA86NK3Ki0dEHfgT4JeMrR1rCQ/F
         +Xc1AryiGO7QloWWkhZZ4cazmYh9DQBQkojQloRM6/0z56T5IgiAmt6tgNUcXCOj6jGi
         d99hJCIroxHJD/NJ37mS+yi4YmuvzkeYcD+w9vrByFwmIi9eErx5qiyMumb4z7yZGwhj
         tcIo2+61yJTUGdPOOtQQqsa3nEL5mUxUcnRZW0qXSuZbCe3Otl93YQHFr8XJfRPot99Y
         b23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5WeevEvfpjBTG3OkCNgGk0MO+FrCtxerWMgq9/5I1g=;
        b=ZiHbPrI1gmEqlzRGZSkbLhsz3PCTPG5+B5yo7YUC6Q+VTDEAFqUHDn+jXnjWqj7j2r
         mcbj3XX9pJD6+yXCzllYM+yVDziMoN0jPW9eozuUXOpxJnHrR2L/mQcKV9SUBtTFmRPk
         c0l7Pe3onm5PnhQTMnLVIkUCT0wk4IpnuIHzzp+AM0NtVLweANPUXbmbKMY9j4C0df+Y
         VdEVqJ8dJdFvTaFY+Fyj/UoA05/5YvxYUXcx4P73F+vwsZcQhv2pgA+nub57yP0FjKhD
         hi6+BxsOSFaLl9zPlPi/ApKmC3YyMS6eKz5WZK80GzEkAhPfxQHALucufJfml/IfiT96
         BKtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQ172Zyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si3787454ybm.192.2020.10.06.05.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Oct 2020 05:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQ172Zyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPm5M-0007Sb-Pf
	for alex.bennee@linaro.org; Tue, 06 Oct 2020 08:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPm57-0007R6-UQ
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 08:28:37 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPm53-0006kX-VN
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 08:28:37 -0400
Received: by mail-ed1-x529.google.com with SMTP id k14so13324617edo.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2020 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5WeevEvfpjBTG3OkCNgGk0MO+FrCtxerWMgq9/5I1g=;
 b=fQ172ZyfZxFZavsnzWmgtlq8WGH2mOGT+PdaiB6qhLew7QLzheImH+8P01DcVtMih0
 8mPmegKSwu9TBIrYpGLFyviyPWVGmxsj+XV/AxxrK8ohSqZDqcKkYCdgmVfFzCuXQUAN
 wW3AyinYVnoBpXVBxhTp62F9AK+AniDL2MuMnquTDOU/HYyNDh5Uks5HI1Q07elJgYGL
 KwHYRvbGpHjmkETbdXSNNbF+BKZLdmXjst6JAAjaZHn4by7qcXcpQDR5rySDYAiE7glR
 HZjrh6XIedUbSv3u8gMOuwJqSdSd35lElOTnRhBP63DOfIJwWvmj225S+Y5+F5sb9XDv
 xaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5WeevEvfpjBTG3OkCNgGk0MO+FrCtxerWMgq9/5I1g=;
 b=sOk795pKgywmf/cFacqYguFkrcZ9E3Abe9638hfCQUbLeANmS0qzgtGLzGq69V2L+c
 75MfxwAuPB0j6DY4VcuToQzHpgiIW4PIbD4EF6Q0L8Yj6ijiObBIbLAr64rBNbkbpWW/
 V9VL/8JIT6+S9WG4hscityaNOjzOJfIBhKekoO1uJGkNEv+B5BOblVehLN3QhkMBU5mA
 R9pcnQ3sW9yzXl4G6iZYVjUMvXWwgcVUwQzbe6bE+EoeM4URDOxu2HZNtpA165LFAHVP
 ZcnxGptgFPJBdSouDOIY/uFbjKWydBpv6gGa763oV2zPhiAZMW4iA4ugHIKC4SKjsmwq
 O0BA==
X-Gm-Message-State: AOAM532h+vlbyxG6bND0a+pY04AFSNMRSTqOMyBKxrY2CJqElu3YNtDz
 G3Pg3XHl+LL6X7lhadNYap8ITdPbVU4ucwoze8HWLw==
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr5006200edw.251.1601987311400; 
 Tue, 06 Oct 2020 05:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <01e701d69bd4$e49413d0$adbc3b70$@gmail.com>
In-Reply-To: <01e701d69bd4$e49413d0$adbc3b70$@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2020 13:28:20 +0100
Message-ID: <CAFEAcA9HUh7Ge-4zqEewECCs0HwfdQXc3RRqX6hKKV=HUEMy5g@mail.gmail.com>
Subject: Re: pstate_read/write ignores nRW field that is kept in env->aarch64
To: ivan.i.kulagin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pG+VmL5CqDj8

On Tue, 6 Oct 2020 at 12:36, <ivan.i.kulagin@gmail.com> wrote:
> Could you please explain me why in pstate_read and pstate_write
> the nRW bit is ignored?
> The comment in CPUState says that nRW (also known as M[4]) is kept,
> inverted, in env->aarch64,
> but the value returned by pstate_read doesn't contain this bit.

That's because pstate_read() is in general only used from
contexts where the CPU is known to be in AArch64 state
and so that bit is always zero. AArch32 state code instead
uses cpsr_read(). Similarly for pstate_write(), it is only
used in cases where we're in (or switching to) AArch64
state, and the calling code generally handles the "flip
the env->aarch64 flag" part itself -- see for instance
the exception_return handling in helper-a64.c, which does

 if (!return_to_aa64) {
     env->aarch64 = 0;
     /* ... */
     cpsr_write(...);
     /* ... */
 } else {
     env->aarch64 = 1;
     /* ... */
     pstate_write(...);
     /* ... */
 }

This is because switching between AArch32 and AArch64 is
complicated (among other things you need to sync the state
to or from the 32-bit and 64-bit views of the general
purpose registers in env->regs[] and env->xregs[]). It
never happens just as a side-effect of a pstate_write():
you always know you're making the switch and are doing
a lot of other things at the same time.

thanks
-- PMM
