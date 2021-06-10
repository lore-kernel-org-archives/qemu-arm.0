Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp322737lfa;
        Thu, 10 Jun 2021 02:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjOja5iynEQbDnhRLeLv+oGU4u5yImgkIYTR/hx/C2gsRmBlUozOU2kh7wfNQH2bWv21eM
X-Received: by 2002:a05:6602:158a:: with SMTP id e10mr3043421iow.137.1623317383734;
        Thu, 10 Jun 2021 02:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623317383; cv=none;
        d=google.com; s=arc-20160816;
        b=vgsLBL/HNpnXGZtXZtJqC/DIhm6nJiwyOJ22U8Uw0/b32DtWKI2PsyBgVe+zrZ7DgW
         3uzThOPApcn0O6VhKks/yleCUADDHPew0Jiy1NKnAQEIEwCs1Iqx5/qbyUXsWBQI7WoP
         0QYMNJAmZmyHYdD+MhBoh9POpj8727czHUiwPuy4gd7VjO6yCc3nm7wxxDaTJxDRfSUM
         ZYnjcYkIFoNOEWpFpRiWnXLEqKzWGmywIuTGbiXCR9Pl7SWwo8MyYRSYfBDpxLiWC8jK
         G1nNdlDRqFHgEsHtghT6pnpRbHoDHVblHogU4tPHRpmagQPK6jUXeEUDkKIu9DQMaEv8
         rwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tn1G0Psh9gBGfjtI+rLmwDa6qG5SqexuPEq6cTaj7mM=;
        b=A99p6M1yOF3GnOEqUTJzBqp9t3jAKTTzPTOhIV4dMxAFrAHA3AFbJgBpLMwHZ7Ofpp
         2IySqN/Z4vEAH67DUezSvUy1T/H87rijoXpXDGXN3NWCfkV6Ev8bpQ4joUnddhqPahNC
         yCl6bDTfWByf7g7oXPAEio2mCDipwkEmA3EB5sOTdN+dgugEJtYF9XXsjch4JXVczog5
         XkJPt84MaCi8slDhFA25sAKN0uQUo/YK4yDYgdWl2KT2w251+jp214Kw18RhRFjnrHgI
         yx2L50op1Hggak+yc3h3G5VyGTmkJ2Tx4mteXSuxjO1QK9rz4MIBVEIAOtk98zLNaeM7
         rucw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQbpmHF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si3031999ilg.25.2021.06.10.02.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 02:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQbpmHF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrH0R-00055Y-24
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 05:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrH0H-00052x-Cw
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 05:29:33 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrH0D-00056r-RM
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 05:29:33 -0400
Received: by mail-ed1-x534.google.com with SMTP id i13so32182797edb.9
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tn1G0Psh9gBGfjtI+rLmwDa6qG5SqexuPEq6cTaj7mM=;
 b=zQbpmHF0pQYDIEw3RGq9mybvGmX454k3Tmvci7vLtU1uG9a9kIxDi/zvoP+w4od0jI
 4444dVAi/tJPxHrZxd7O17iTU18usP51i7UhPFeyJbvdCdGWGUsfy9r9hk8I4tH3SQ9x
 vZWwN1beVgrWOM+BlPmvKH0qwgOUY1usk5A0c4/1Db2AtGL6J23YD1yazmfVzfRmsbMR
 I2AXLFiMS6T3aahmjlKVqIG3GI1DFYBOziRpin9pRmnffDMOEgFmLCDXeSd4fRX648Z5
 e/gUfnUbPz0x6KJS03F2XNweiFRjBzOrT9qCLBHvGCUb6+8j3wP2Th4+VP8iYHl08bGj
 vrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tn1G0Psh9gBGfjtI+rLmwDa6qG5SqexuPEq6cTaj7mM=;
 b=HXtw0yJHmOFBR3O5Ihnx8moGiDS2VURS9HsOWl7HUF6PI5wlmBqrAxtgMoMnIA5qmy
 4yKcp7+4Go7240KyveYAVm+czwfVXWhnEap5ipg9gTPNxnPBrVd5XRG1bzXSe7Ip2O51
 D73z12VHT/13Uq+/2R+CcAoiB5c6E9VDjl/2yyr0+63gkMU73rm36uNMeD+QtUGCjvtl
 1sm0zM2K1UtK9MCyuBNIFlYl32u7VGmmTgCVWbZUJ7BmbE+KGPXfCuRpo9TdwYhPyonT
 DQPDrWcuobor4DYucytB6A23Zs7JBMWGqABR7nwwlN6nqVMHrYDdqXvumhCmOgexcHdq
 nHuQ==
X-Gm-Message-State: AOAM5328JPGmrF1Bk349CM8HObzU9JeZ/HdzLKT8LwtGbkLlkJp4xMqe
 0Top5lQ+nfrR5c6V1leSfKUIpKu7KjoqvJnOFMXZEg==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr3691868edt.100.1623317368085; 
 Thu, 10 Jun 2021 02:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-4-peter.maydell@linaro.org>
 <23ec05cc-55d3-f343-d834-aa40f7685b37@linaro.org>
In-Reply-To: <23ec05cc-55d3-f343-d834-aa40f7685b37@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 10:28:54 +0100
Message-ID: <CAFEAcA9AH+YGJ3qT2x29EebUNF_4LFmrqNwjuh=7NjzgfHMySg@mail.gmail.com>
Subject: Re: [PATCH 03/55] target/arm: Handle VPR semantics in existing code
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2YPhxfdolqsm

On Mon, 7 Jun 2021 at 22:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > @@ -410,16 +415,19 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
> >       env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
> >
> >       if (ts) {
> > -        /* Clear s0 to s31 and the FPSCR */
> > +        /* Clear s0 to s31 and the FPSCR and VPR */
> >           int i;
> >
> >           for (i = 0; i < 32; i += 2) {
> >               *aa32_vfp_dreg(env, i / 2) = 0;
> >           }
> >           vfp_set_fpscr(env, 0);
> > +        if (cpu_isar_feature(aa32_mve, cpu)) {
> > +            env->v7m.vpr = 0;
> > +        }
>
> If the vpr does not exist without mve, is it cleaner to simply set vpr
> unconditionally?

I thought about that, but in the end went for the condition, just
to preserve the parallelism with the places where we do need
the condition. There didn't seem to me to be much in it.

-- PMM
