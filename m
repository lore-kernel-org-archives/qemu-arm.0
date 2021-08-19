Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp606252lfg;
        Thu, 19 Aug 2021 12:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0L+IIAO01WxckcRG4g65otG46WlvXMM5E7y9rJpKJyMEUjBHPDbNaKOHaTAjjho64cfhV
X-Received: by 2002:a67:e2ca:: with SMTP id i10mr13710433vsm.38.1629400800077;
        Thu, 19 Aug 2021 12:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629400800; cv=none;
        d=google.com; s=arc-20160816;
        b=G93F8w2VPNrzJr8lqyY6VVXxWjhDOCWgidXpvkW2eniOreHlZxlChQ+bVJYuLxEAU7
         rgLhiloHC53guPzs5Sa/dgJ4gZksiYsms/FTf/+kkIsUucF2nhwNJnmOBTF3J3QHQ+2Z
         uycq62fxdKStFCfaRV9Djz2wAHw8lUv86MbVJLwrGgHut6MfMb2v1nxpXC/dH/F3XRbd
         TYKeRdK4yGOXUBmwz57sg2JkB6FWv6N0c17hx+9rzOAo311xk0JJFeAWU7IYbrX2RlVA
         X22YOCHZ/FetgDT//bVRhLN+S2eZdhc+KlDL3OuUP/6V/2eWttZh/lBzBz9J3yNyN9vX
         VTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z+ijzJuK3AxkVIhbD9WRW+OuXS8t2Ky23gI2rEggEYo=;
        b=Mrsz+MM0+nbp7XeFN43WDK4tPglpVS7RFAvpZdb61A5rLaKvZKjY1IYugqIdDHaQh+
         M1slwWtPsVm5tOZj9stW82WSvb8WEr3GFmg0X8KE6P6cOpq6Uial79eZtYavlgRYmLZx
         pud+lvG85h1VdveY48Yk8CQQgVPw91GN3ybN+kFdiyRYpy0+iFNrgcjzwXXBiIFcegPn
         LLX2RfTGeDZzRKMAA8PUEYIyFnyJ66HVFgTd9uOc2IAfudBLQBMt6hqEA+GPwS3of12f
         SarTQg/lInOnhmdxXmSguvmZuD/kChV+mH5crJSxnUBxu7YknR2w26/u0v/Yx1pb2Ras
         mJTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RmeOdUTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o202si277016vka.21.2021.08.19.12.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 12:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RmeOdUTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGna3-00006j-DQ
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 15:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGnZu-00006D-Jx
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:19:50 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGnZr-00044y-AJ
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:19:50 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i22so10335761edq.11
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z+ijzJuK3AxkVIhbD9WRW+OuXS8t2Ky23gI2rEggEYo=;
 b=RmeOdUTN/N+KmAKOjJzZTS7QMOvx2oP6TNXbAI16iyQCPOZnxvZL+kbm1TKLL0FYL5
 MQbfHzous6ofovC/CuzRWsAi00jmKEnR1ULuyaWbjhPQ+h+Sp2OsL4hx7dibBh1FVIw8
 AdvBHr5s0RuWMc5eApolKeDD2/DxImojpKRY6nDHw1Xbn9irnXr2o8F2goxy17QysDgG
 J/xYLIH83oFXcQvCLFhrNrNfIltF9H3SIUcHkYMK6Xh1McV7IQFPt5k7439ciclDXxWF
 ScxiRAZmb/8HXMt8QjaQwncyYhJeN3J0PNmdI9npn1LJdpPZzt1JuJ+bMJSs2W0h6HEc
 tJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z+ijzJuK3AxkVIhbD9WRW+OuXS8t2Ky23gI2rEggEYo=;
 b=ZGbtOLEndRrkus0gJI/Ye2tISZAIrM8XScCgI7QTJ/F53/aJZH00kmFABW/vDTxjOu
 CAWgapiYx6pX1LwzKgzn13aPPrS0G2wYMIC3uud7FmgIB3BNYQZiM4sJFovOzeHpKm5w
 FNad0R26IMe/HBwp2A3j2GcR/yaovik9Xoj1aQHa2nZd6b11CzpYENp+bhfRj7M4aqIk
 ujNcGNEq+UD6Bekb0PdDYUSAvpVjhauz3kM5hAKDRu0kXvHIPr68j2slil/ZPirgHBmd
 LmlLvZNMIOQ24SBd49UCYUsz/zUoTpU4kiPABMhV6kGdwyImdDe1sIkeeVGK/wEhSJjh
 KVdw==
X-Gm-Message-State: AOAM533MCsd8/6BaTLyjIiY0SlqwPHVYz8Vh1+tCTI97nkRQ/4pfAGIR
 tStnrpKpkEe+sIa7lKz0boeXot9blW3fQbC4l3qbRA==
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr18028073edb.52.1629400785576; 
 Thu, 19 Aug 2021 12:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 20:18:59 +0100
Message-ID: <CAFEAcA9NF0zR8eyzys-V6+VjhfM=7WGLYMYTHkSm-RSH7LHnGA@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XQPMyMs8eL4d

On Wed, 18 Aug 2021 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNDEFINED and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.

> @@ -9500,7 +9504,25 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      CPUARMState *env = cpu->env_ptr;
>      unsigned int insn;
>
> -    if (arm_pre_translate_insn(dc)) {
> +    /* Singlestep exceptions have the highest priority. */
> +    if (arm_check_ss_active(dc)) {
> +        dc->base.pc_next += 4;
> +        return;
> +    }
> +
> +    if (dc->base.pc_next & 3) {
> +        /*
> +         * PC alignment fault.  This has priority over the instruction abort
> +         * that we would receive from a translation fault via arm_ldl_code
> +         * (or the execution of the kernelpage entrypoint).
> +         */
> +        gen_exception_insn(dc, dc->base.pc_next, EXCP_UDEF,
> +                           syn_pcalignment(), default_exception_el(dc));
> +        dc->base.pc_next = QEMU_ALIGN_UP(dc->base.pc_next, 4);

Just noticed that section G1.16.7 says that when we report
PC alignment faults to AArch32 they should be prefetch aborts,
not UDEF. The fault address and fault status registers also need
to be set (with slightly varying behaviour for when the fault
is taken to Hyp mode).

For AArch64 we should also be setting the FAR, which means
that for consistency it's better to use EXCP_PREFETCH_ABORT
and set exception.vaddress in the translate-a64.c code
(you get better logging in the exception-entry code)
even though these different EXCP_* all boil down to the
same synchronous-exception vector.

-- PMM
