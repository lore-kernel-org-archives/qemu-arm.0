Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3709256ejc;
        Tue, 29 Aug 2023 07:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDYN4wqVXnOGjKLo86VsgFeV147CWfsMiEl2l71iw+FA1fb2fk8sirzFl49QiRt1gx8Nrh
X-Received: by 2002:a0c:eb4c:0:b0:641:8df1:79e2 with SMTP id c12-20020a0ceb4c000000b006418df179e2mr28012486qvq.30.1693319769514;
        Tue, 29 Aug 2023 07:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693319769; cv=none;
        d=google.com; s=arc-20160816;
        b=m1aj4p1Y8mRg84C7+0vy8xuQ5zcgMvtqGdiz2qYwe0ZdGmvQ0PJZ6zd3lnK9/fZquF
         M3+KS7+8IHoG1xpbl1vp2x0txvhhaf7RCY1He6ewHBR6J74dAwSU+7vi3EmjWeXWS3P5
         bkkgebZWWkK2oYyL3ZqrUBRlFtkmWjqiQdLqVU8MlayqsTPAmyA07G7sjjDkswxOyQD/
         Fgdf0Gy+gsjXMRF1rFejwyZvwRMNC7QS8tS1pukeNDcEFDraG4dJ64xNsWemVrmtvxh8
         bDODkD7R+x0nTT+9L9nki19Iv8K4cBUXDejMj50/B+ROt7WtjspZa8AtXzMi9PtkycTA
         0qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3h1b7kPJvga7cN/wVmRcSZqM5wn2f7wlhi0N+cxTypk=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=HBXlBlXU8nW0i57zeY3MPuBfLsD1Yp+uK9ELsGPa6uLeWVfAbf98lPD1Xgwjgg7p8i
         ZIW7Uqpmmhv1idJb65WsCm74uvCoMVDQSTl9v4pS8E/c4xJZfuldsF3zNSAGXj4kl+mS
         0pgxV5IbXzWiIjR+Vg/6lQWHI4KUZFkygpCIj53vcHRt2r9QpEh5lb8qFAptGJskhsDP
         ZwvekVvYAMXYgQ3HM2TSzQEKhhXEYseSkRXcTMzw0e2YPAO8Km7oSgybfDRfs8oYvGP4
         QOImqVLsWduTW5zmxbV6RX4+HWP8yflwGArCZY34i/Y5Z6ZO+h8jA55Apun3ty7siNG0
         DsoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eut3x4xs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a0ccb0a000000b0063cf4d0d55asi3676854qvk.83.2023.08.29.07.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 07:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eut3x4xs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qazou-0004b3-7x; Tue, 29 Aug 2023 10:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazos-0004Zl-L7
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:35:50 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazom-0000Jq-Mp
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:35:50 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52a4b62c2f5so5863082a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693319743; x=1693924543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3h1b7kPJvga7cN/wVmRcSZqM5wn2f7wlhi0N+cxTypk=;
 b=eut3x4xsoyHG5J3hwgqfusd9isnoV16dxjXYZlb4wCCeNchUvvSK78F5YwyISth2gc
 9GSzEHzVm36anp97QPf/YmkY0PiVABhu8LQL8gNNzAY/ivrMfGilatMbRZCLFquCyesX
 3We2lKzMJIOBwL4cliUaIZ8p9baNXB2zJJx6FbVN8je4I2uylNf05M6H4yZL8XIYeX4U
 47gfy+osV8V8Qr1DpuuDCdTQ/kRCF/a030JZQw0D7gwefgfoeiZZd7/BD322QmnvyNKM
 5UkXhVeB/b5ZpyELyAPQytktIcKnWabxMLNAQx3dnP7aWbiOOctjIgWh3/3UkUnk0SF9
 jjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693319743; x=1693924543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3h1b7kPJvga7cN/wVmRcSZqM5wn2f7wlhi0N+cxTypk=;
 b=DAP+Eo5Sw6S6avji07DL35OU2Am8pp5HKJiSK/N0HRBIxUDvWU9N1AVHjkbG1RNThA
 rRslriSuNPrRvWuS9hablWMvieIg02oIoCuPuH+CVsT/5ZqMyHRqP8WTr5/+iHJAAVW/
 e4PwVG/Zkoq5Arwfjt1y98ePs+FhBoK1SFrjyEpjSZOKxRbD6bH8SQVmLJjVn1+485zs
 8C9Ot8wXW458+CiEmpviIIm3JEQYlEARoC64TYz5QQQ5Daz6ZI6aZuLFkZ9zqKR3wRUp
 UVCE/ke9oLwukp1pGpX5kUwebQrvceYoQUnvJpVXEsdaFT0sJpicFd+xdZfotDcIxHJo
 nkSA==
X-Gm-Message-State: AOJu0YyycTxkuWSNBCm1AdwlLdDPMaRj1/cWA1GtN+0RDuZzD2QpZYs5
 VKjYFNyl+1wVhs5QyiUTNFv38bsU30iV/fSc5ErmUg==
X-Received: by 2002:a05:6402:14c3:b0:525:466c:5fda with SMTP id
 f3-20020a05640214c300b00525466c5fdamr21646427edx.28.1693319743054; Tue, 29
 Aug 2023 07:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230822170209.1130173-1-richard.henderson@linaro.org>
 <20230822170209.1130173-2-richard.henderson@linaro.org>
In-Reply-To: <20230822170209.1130173-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 15:35:32 +0100
Message-ID: <CAFEAcA8vCKZetufuysbsvSPo8xZaVHMa5n-mNrc2wUztD+Mfyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] linux-user/aarch64: Add ESR signal frame for SIGSEGV,
 SIGBUS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: CP1uLJ13L1Rh

On Tue, 22 Aug 2023 at 18:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are all synchronous exceptions for which the kernel
> passes on ESR to the user signal handler.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -191,6 +199,14 @@ static void target_setup_end_record(struct target_aarch64_ctx *end)
>      __put_user(0, &end->size);
>  }
>
> +static void target_setup_esr_record(struct target_esr_context *esr,
> +                                    CPUARMState *env)
> +{
> +    __put_user(TARGET_ESR_MAGIC, &esr->head.magic);
> +    __put_user(sizeof(struct target_esr_context), &esr->head.size);
> +    __put_user(env->exception.syndrome, &esr->esr);
> +}
> +
>  static void target_setup_sve_record(struct target_sve_context *sve,
>                                      CPUARMState *env, int size)
>  {
> @@ -443,6 +459,10 @@ static int target_restore_sigframe(CPUARMState *env,
>              fpsimd = (struct target_fpsimd_context *)ctx;
>              break;
>
> +        case TARGET_ESR_MAGIC:
> +            /* ignore */
> +            break;
> +
>          case TARGET_SVE_MAGIC:
>              if (sve || size < sizeof(struct target_sve_context)) {
>                  goto err;
> @@ -558,6 +578,23 @@ static int alloc_sigframe_space(int this_size, target_sigframe_layout *l)
>      return this_loc;
>  }
>
> +static bool need_save_esr(target_siginfo_t *info, CPUARMState *env)
> +{
> +    int sig = info->si_signo;
> +    int type = info->si_code >> 16;
> +
> +    if (type != QEMU_SI_FAULT) {
> +        return false;
> +    }
> +
> +    /* See arch/arm64/mm/fault.c, set_thread_esr. */
> +    if (sig == TARGET_SIGSEGV || sig == TARGET_SIGBUS) {
> +        return true;
> +    }

It's possible to get here without env->exception.syndrome
being set correctly, I think, if we take a host
SIGSEGV or SIGBUS and host_signal_handler() calls either
cpu_loop_exit_sigsegv() or cpu_loop_exit_sigbus(). Can also
happen for other places that call one of those two functions,
like allocation_tag_mem(). At least, I can't see where we
would be setting syndrome in that code path.

> +
> +    return false;
> +}

Maybe we should do the "sanitize ESR for fault addresses in
the upper half of guest address space" logic that the kernel
set_thread_esr() does?

thanks
-- PMM
