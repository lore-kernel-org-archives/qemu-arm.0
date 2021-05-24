Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3552912lfm;
        Mon, 24 May 2021 06:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxfOlVT+oDdoHO3h9j8sYBV2KaOX6LHn2BKuLyJ5zVyADR8oElhAaBW0Xq7HG8FT4q4OL9
X-Received: by 2002:a17:907:2167:: with SMTP id rl7mr21333287ejb.171.1621862408393;
        Mon, 24 May 2021 06:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621862408; cv=none;
        d=google.com; s=arc-20160816;
        b=Ya986xxvFdlx3HNONL5thV7VFuGN+afc9HwtvYExU5BzbrIL9sUp6a8qU0iRhRFJe6
         zCeWFsrSvjYF3KTsACKCzXZOWbFFnM10V0syV37nUs0MDIiK01cY2UeYtIN5Td1t7qMB
         CtDdOzhXbxVxBMCLLJtnK+yO/BYy1woy4Zp5leJTqfVyYo7KK3cGVjGJh2YkEFebmtd9
         2ac+wvOpsRVyUMHvtFthhFEv/P4ThV+lpuUpoHRTQLQ0Y4BDJBSVQyCofUiZE/yObQPF
         7TquJren3PlWw6phmdyzgc3OET7OARy7fDAyf0iQVa/ONNgByTeTqYAAJk1ygqWoMB7H
         P35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+SjIBBKkuWPYasnQ6RB/6atdlHjoqSPx/ywigwWPUo0=;
        b=Qvk7ioG01N/IwDbcauZC8z4jC1pxjZe8tLUwaVHy9MK4Y3GlKNyTFm0dVYafnBa27/
         oFI2R3s2pzIMKGltU4IPPEyzgG2LjXY8bAMwum3voQpYVioOT1y2IaPeLO0TLr6cY6Sv
         xzMvS+AndkF8072ic85vcnOHz8+r5oviqxI8Xs7m8N7I+xQQWzQIKW1He1VZZAMgoHG8
         rRmop4IlcpGbETSbIzYlRK6cFWQ7ATbGvZeUaM2AAGE5Deo8OTITbOEhM69tWVf5icXI
         a7hoCt39sTV0R+tv2h0EBLGMVRJC4kDbhtI1RmB0GlI8/cx+UMrcqu6FYzRWi/5R/fE+
         MP7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BnFPyMmV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd8si14069962ejb.132.2021.05.24.06.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 06:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BnFPyMmV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llAV5-0006HS-GU
	for alex.bennee@linaro.org; Mon, 24 May 2021 09:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llAUv-0006Fj-VJ
 for qemu-arm@nongnu.org; Mon, 24 May 2021 09:19:57 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llAUl-0001GW-6i
 for qemu-arm@nongnu.org; Mon, 24 May 2021 09:19:57 -0400
Received: by mail-ed1-x535.google.com with SMTP id r11so31855463edt.13
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SjIBBKkuWPYasnQ6RB/6atdlHjoqSPx/ywigwWPUo0=;
 b=BnFPyMmV0f7MIkeVO64Px5EH14s11mcKTlterzPPLEKHHCWm0zFb7qxFH4Ek0s1oSy
 L/AqjFljIOrMQxw/2yTz/0vU/B63ej00o3U3u+5rRTZ6g4+RHiofXbd8hGRRN/Z9L804
 A9Y2Xgr1EpndS6nO/fJ8bPe1PabhNhKVyD9GfLiJdMAj1Om7eKiDtbTW/rNUaYRAuFdg
 KxzT1kWJFJlfxnETn7klmYvaSaSsI9km5jK5sKYeRS7NbT8Otl3+4ETD/xNS3bG0TNFP
 sr0LZLUD+X7kiY3VGLVLrQ/B7XvH+MVzkVq/k8XPv5UNsI8V64QX7XHm7XgVfBDmIEcU
 jHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SjIBBKkuWPYasnQ6RB/6atdlHjoqSPx/ywigwWPUo0=;
 b=d6gU4VZgqKRKqOvV9rTbACxMm5mW8/zHIxrMvsrWmgtZw4hzc7VupmIRm39weEl97x
 +GMVXZ4c8Y7aTJkKzRd+Q3+kjfgB+4HTpegyW1acyzr1mynT+NjBsrgg/7mYcFuV8Z63
 aGG4Nbzdn9SZUd0awmdH1PXMim5KbjyVbYnyoUVggqaN4+cjFQA+xsWRY0ybawPbDB4K
 MYYIOJlqCp44bjl8gWW63c9VHSW4MA7s2YEb68biEFXO9yqLH/dUmFhkJH/8yOedAQeL
 MihWdOEprdo84okEp0F0lLLbjS9DwKJ9Bwn/a689Z1GqCLyrjrcHsV0tGyoz7nfD6w26
 EqwA==
X-Gm-Message-State: AOAM5324AzhSxT+rTUGLe8qYxzOQ45cP4QcjA5K0FYvR6MuKLeOy82wR
 fG+lFxWm6SDObhhOoZQqEzLd3BL3vfdYrtsNgc3kgA==
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr25440324edu.52.1621862380715; 
 Mon, 24 May 2021 06:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210524084201.1665973-1-jamie@nuviainc.com>
 <CAFEAcA_AZGK6yKy6FN=YfVC=OMdpQnDBz=nndKaibDLRXk2aDw@mail.gmail.com>
 <YKudsW/Drzqcxnoa@hazel>
In-Reply-To: <YKudsW/Drzqcxnoa@hazel>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 14:19:17 +0100
Message-ID: <CAFEAcA8dPOvZpeZgRbq-W=y+tE_hqxkN_ZRiF9uSWHV=91EhoA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix missing exception class
To: Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: snBrnoVmbvOo

On Mon, 24 May 2021 at 13:36, Jamie Iles <jamie@nuviainc.com> wrote:
> On Mon, May 24, 2021 at 10:41:58AM +0100, Peter Maydell wrote:
> > raise_exception() and raise_exception_ra() are supposed to have
> > the same semantics apart from one of them being passed a return
> > address. So perhaps we should look at trying to fix this by
> > making raise_exception_ra() not first carefully set and then
> > very opaquely unconditionally trash env->exception.syndrome...
>
> The simplest fix for this would be the patch below and that is
> consistent with the TLB fault handling code where we first restore state
> then raise the exception, is this the sort of thing you were thinking
> of?
>
> Thanks,
>
> Jamie
>
> diff --git i/target/arm/op_helper.c w/target/arm/op_helper.c
> index efcb60099277..0b85403cb9f4 100644
> --- i/target/arm/op_helper.c
> +++ w/target/arm/op_helper.c
> @@ -63,8 +63,11 @@ void raise_exception(CPUARMState *env, uint32_t excp,
>  void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
>                          uint32_t target_el, uintptr_t ra)
>  {
> -    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
> -    cpu_loop_exit_restore(cs, ra);
> +    CPUState *cs = env_cpu(env);
> +
> +    cpu_restore_state(cs, ra, true);
> +    do_raise_exception(env, excp, syndrome, target_el);
> +    cpu_loop_exit(cs);
>  }
>

Broadly speaking, yes. I think it could be done slightly more neatly by
making raise_exception_ra() be:

    CPUState *cs = env_cpu(env);
    /*
     * restore_state_to_opc() will set env->exception.syndrome, so
     * we must restore CPU state here before setting the syndrome
     * the caller passed us, and cannot use cpu_loop_exit_restore().
     */
    cpu_restore_state(cs, ra, true);
    raise_exception(env, excp, syndrome, target_el);

Then there are some follow-up cleanup patches:
 * fold do_raise_exception() into raise_exception(), since that
   is now its only caller
 * mte_check_fail() currently does cpu_restore_state() and then
   raise_exception() with a comment about this being to avoid
   restore_state_to_opc trashing the syndrome; it can now be
   rewritten to just call raise_exception_ra()
 * the v7m_msr helper in m_helper.c does a cpu_restore_state/
   raise_exception sequence than can be rewritten to just call
   raise_exception_ra()

thanks
-- PMM
