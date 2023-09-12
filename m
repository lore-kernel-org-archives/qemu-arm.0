Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1995923ejx;
        Tue, 12 Sep 2023 05:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYg2EzErU0bMspEjzDoB7BvgIZFUZmtV06/CJesK6T4+RsLmWwtFGodiWaspRSJkvKJRPV
X-Received: by 2002:a0c:e1c9:0:b0:655:dd4b:d077 with SMTP id v9-20020a0ce1c9000000b00655dd4bd077mr5506880qvl.51.1694521674081;
        Tue, 12 Sep 2023 05:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694521674; cv=none;
        d=google.com; s=arc-20160816;
        b=rigsPaMVocyfMh/0txfpteUbGsVx/fstydla1SXrgJpP7WfBqw4YPee4I532M4ZjHE
         tANKF6agqoHKnhAVy3xuTcCaIyLAwxIf5AAVWVmJ6ggIFVg0ma2ArZ1vVvhDdLO07HXd
         dsZoFPGly+/Rkuf5+WRIj0UZC5wevhyYjbjtIhWVdMSx1/O9otDp0abuCXMRrN6DggKK
         VSBPqV6KGPizTbQVC3yZHqNzYIKfY9Leetpfx2IsJj7x/LN2dL8a2fjH+8LxQmFVi8jJ
         1aEGKBXx/WYi0JX9dFyxm0/KC1tUa+gA0Ykytrtrmz7fgssSfnDThEng6+3EoCcWIqVN
         7Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a+QJ6aLCYJHfzYSh+WK/aIRaGCoM4QdlNhV2yGIGdAg=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=D8b3wHD01HDP2C+o7D+pGBgR5VU5BVxh5KcYD19iIuJ+W5iTN3FZQOMNeAMnWqPaBQ
         GlglPz120UOQbvcGShE5Px9vJvr4SvVgwLP+NoJtEJ/xotzBlg8uGa6NsKbzZ5p3Wuvi
         9ci6lxkpoj2/UTO89dIBSb+PhkUbAM57X6CO4s96Ij4AW4l9bWiDLK0TIbbnWuYYYW1b
         Pi/dWIAatHdKx5vJ3Kbkx95XVQgJxac68wD7ybEj3Ye2Rtmj/pi0JozFSDruFLy1WRvm
         VkFMz6vwCobsYJQLGjwK7kz8yA1jegUpAX0KL/g9KD+2ZExtpg1UTv4t9/04EdQ4dA1o
         9HyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lI+pE8NU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a0c8d05000000b0064f57c060basi4485157qvb.582.2023.09.12.05.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 05:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lI+pE8NU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg2UG-00036f-Jd; Tue, 12 Sep 2023 08:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg2UE-000360-Vt
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 08:27:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg2UA-0002AZ-ME
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 08:27:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31c93d2a24fso5056340f8f.2
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694521637; x=1695126437; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a+QJ6aLCYJHfzYSh+WK/aIRaGCoM4QdlNhV2yGIGdAg=;
 b=lI+pE8NUnoxtLrGFjMEYBs03Ix1zq3lgSiOMtxWE3QvWbunzPRiEda0CgnlYq0qAbO
 39qh113X8Y3gTx/JePuGLAqutEQVX+dYqfiw7rW7qwR1haXnjml/XXlk/kCcyRWnhiM3
 5XZTMzz9IC/yd0dmEfKaQFufovlq9pf1nAdGF26LyUAY0gCGv3b2fhTb6cXXQqsl6yxj
 u0nQQEvZ/3J96c3C9zAMkiimrMjtvmybGFeINi3lucPYHO56u0aZktZBhsC3L3YYYyKz
 WM7Uc2tyMSyytIJibyopr9EfEmKgH1MnNpvl6p3edJfrAe3Nwb5y5m1sjk02DrF+ZeLY
 Pstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694521637; x=1695126437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a+QJ6aLCYJHfzYSh+WK/aIRaGCoM4QdlNhV2yGIGdAg=;
 b=CVgT6qePzePTGA2FmhUypvyDe3NfgenB67NKaaxTHuQvJtSC7Xv0o5l7vllgRpjb4+
 XzNODys1Uh35c6BY0QhwPRnmpvhvvWCskUYlXYKQNkr3ALTducJHtnr9Up7HI/O7Nrbp
 0plp/qwWcTS+VCl71cfIL/dlF+m6Ukba3TSFfzA4vu+v2CbjZwZQUSR+OMyppl3DTy51
 zXlpuJgYJ/uMO5UcZsVg6U1+iKlLRZV4j2BKhBVzxpUY4YeGDTETfPhZsHgsd2dQ4vZD
 PnkQHOxqjnk1y+cVaMp2XqRMzFnL+tdxF8mU56CP5wkBeFXzhFJL4CCLHXEmslwrR8tY
 aP9g==
X-Gm-Message-State: AOJu0Yypg4KmjGohqcD/lCgfQtLsyQG9Ld3nMNf/LQOGilwGSP8v4GrO
 Qk8powRFdfSrUgkIuu06JDsrNn7zVbH4Yt5knX8QFQ==
X-Received: by 2002:a5d:4ac3:0:b0:31a:e6c2:7705 with SMTP id
 y3-20020a5d4ac3000000b0031ae6c27705mr10915143wrs.50.1694521636880; Tue, 12
 Sep 2023 05:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-14-peter.maydell@linaro.org>
 <28b64da1-6c0f-012e-1af9-ac27a8581f6f@linaro.org>
In-Reply-To: <28b64da1-6c0f-012e-1af9-ac27a8581f6f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Sep 2023 13:27:05 +0100
Message-ID: <CAFEAcA89pF2mw7ePuVOsee1n8+L8PMuBSKEYg-gCNLd2gLFKoA@mail.gmail.com>
Subject: Re: [PATCH 13/14] target/arm: Implement the CPY* instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: d4F3DUhz+yXc

On Sat, 9 Sept 2023 at 18:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/7/23 09:03, Peter Maydell wrote:
> > +void HELPER(cpyp)(CPUARMState *env, uint32_t syndrome, uint32_t wdesc,
> > +                  uint32_t rdesc, uint32_t move)
> > +{
> > +    int rd = mops_destreg(syndrome);
> > +    int rs = mops_srcreg(syndrome);
> > +    int rn = mops_sizereg(syndrome);
> > +    uint32_t rmemidx = FIELD_EX32(rdesc, MTEDESC, MIDX);
> > +    uint32_t wmemidx = FIELD_EX32(wdesc, MTEDESC, MIDX);
> > +    bool forwards = true;
> > +    uintptr_t ra = GETPC();
> > +    uint64_t toaddr = env->xregs[rd];
> > +    uint64_t fromaddr = env->xregs[rs];
> > +    uint64_t copysize = env->xregs[rn];
> > +    uint64_t stagecopysize, step;
> > +
> > +    check_mops_enabled(env, ra);
> > +
> > +    if (copysize > 0x007FFFFFFFFFFFFFULL) {
> > +        copysize = 0x007FFFFFFFFFFFFFULL;
> > +    }
>
> CPYFP does not have the same saturation as CPYP.
>
> Again, you would do better if 'move' was a parameter for an inline, so that the tests can
> be folded away.
>
> > +void HELPER(cpym)(CPUARMState *env, uint32_t syndrome, uint32_t wdesc,
> > +                  uint32_t rdesc, uint32_t move)
> > +{
> > +    /* Main: we choose to copy until less than a page remaining */
> > +    CPUState *cs = env_cpu(env);
> > +    int rd = mops_destreg(syndrome);
> > +    int rs = mops_srcreg(syndrome);
> > +    int rn = mops_sizereg(syndrome);
> > +    uint32_t rmemidx = FIELD_EX32(rdesc, MTEDESC, MIDX);
> > +    uint32_t wmemidx = FIELD_EX32(wdesc, MTEDESC, MIDX);
> > +    uintptr_t ra = GETPC();
> > +    bool forwards;
> > +    uint64_t toaddr, fromaddr, copysize, step;
> > +
> > +    check_mops_enabled(env, ra);
> > +
> > +    /* We choose to NOP out "no data to copy" before consistency checks */
> > +    if (env->xregs[rn] == 0) {
> > +        return;
> > +    }
> > +
> > +    check_mops_wrong_option(env, syndrome, ra);
> > +
> > +    if ((int64_t)env->xregs[rn] < 0) {
> > +        forwards = true;
> > +        toaddr = env->xregs[rd] + env->xregs[rn];
> > +        fromaddr = env->xregs[rs] + env->xregs[rn];
> > +        copysize = -env->xregs[rn];
> > +    } else {
> > +        forwards = false;
> > +        copysize = env->xregs[rn];
> > +        /* This toaddr and fromaddr point to the *last* byte to copy */
> > +        toaddr = env->xregs[rd] + copysize - 1;
> > +        fromaddr = env->xregs[rs] + copysize - 1;
> > +    }
>
> You're passing 'move' but not using it.  I would have expected that here.

Whoops. You can't tell the difference for correct guest code,
because CPYFP will always set up Xn so that it is negative,
but yes, CPYFM and CPYFE should be forwards always.

thanks
-- PMM
