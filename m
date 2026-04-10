Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C64FE9905C
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 09:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB7z1-0003Gz-Ix; Fri, 10 Apr 2026 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wB7z0-0003Ge-Lf
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 05:16:58 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wB7yy-0003SB-UW
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 05:16:58 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-65006c99d38so2038801d50.3
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 02:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775812615; cv=none;
 d=google.com; s=arc-20240605;
 b=lP/0xguFYZ0CdOeYzqp2razOxB497at8PjlNcyWdVoy3Rc2QTmcVnPdi7Xn9dHyGdO
 /YT4OselKJbf7EfDmsTYKuebgyT1/msPVbvUQFXQeVtQjnsvfXtzZcbJ64Tkfn6hdBfi
 ObgP7S2PlGSK4l2QrlwYwOe175YpDRFOINO3vmNZOxdKOpxCetHM2XdXKQjIfm1CRq3v
 D16oUuQxcvRR39MYRFiAp9fEttrS90YC5JUv3hDbJrpjsNeAZprZPIBhmG1E0LQlqr4b
 0NqU9jTXly8BhdXNo4mr0kbuPEz5x6voh+7g0Q/+t85vf6MoLNITEp+qp52NFBFqXIjr
 y4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Kf3Xoa/d7lWrYpahFp0rvEzojVSQo2YBSoepHoqnEjc=;
 fh=ngB1m6OVxA+vUXEP8l79VgdFBjli32s93eiRvmPko8A=;
 b=ZSWyJ0NHk3UJie+754cINEpLKFpHto3wNEA/qkH8mrOWY7LpgnnzceOFO6MVORJznG
 wzPNrZnSyaWBSR4pdGGtd9ooksDjk9flFWI1afBP2jITd2pDy7GxfjGguhNHkONsCLQe
 7u1JMaUCWFGcYVjq36tyORZ8b+XW+Q0QSVY2TnAIdB498oTzVy/GcWnAq+FGao6kxQkE
 VyoGkyw5zqf+jemzWbJx4yhyPSMmnIzDj6I2YulkXaSSOpeuHb3Gxw9MKsMPxKNr3mVC
 xEMsNDmtFHmacF3jnRrAkZQvAYfOkMs7HmznGXJ22V3uMTIuWB6kx2xo0r8dcabhNZYG
 eUBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775812615; x=1776417415; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kf3Xoa/d7lWrYpahFp0rvEzojVSQo2YBSoepHoqnEjc=;
 b=nD5Xr+BUDruqBs/pMvEILgwmbUWoVj5iuPhWMksWxe/w2keDI8CHuWYbNTgtOprF+h
 Ub5o7+K3zKf4jj8lG5+Djy0sX+S3dNNiVAxSkNz9moX09EC+0jaaJazGa9KSmmouZsjD
 b3n53f4zfFLwBUZYW/aYUSPF9l3LXohx33/0ItseEWpP/rHjwlkJSkSdVkgu1eKOsJEd
 aGmRcAjp7AlMNgukGvGJnBCYLZKcaHtECxyuNzMwj7k/59W3UKjMrIxDWxvnOJjOTnXS
 b3Z9ahydtT4tqC/kyONMrfgXAhPV4a6znvIWYB7KSKQ6Qk0BdhzBXWoibh7yiRn3f4p8
 yTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775812615; x=1776417415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kf3Xoa/d7lWrYpahFp0rvEzojVSQo2YBSoepHoqnEjc=;
 b=jNWSWk70yGGE98p/0zHbHk+/40yH0fWZMpmJmrMTgv0+O4dsWGvh57n4orgpOqDB0B
 KWhK6zvnQ99GdZeSn1+2xes1Y3JgYDQ9OwnVARXGAER5ZqK2uvK8f+1qp42/zQ7UQlK7
 USvZhi/Yy+gwExGQz6Rv4kX3YOjVt/ge2hPE5CSTdvF6+pa1SN6aAtBYoFvUFNvuYIkC
 /BrLzNnKkuvJoplUiLnJ+ilEfgOFfUzW3/qUGOudvXlrCtEXdZofmMC1ZAj6iIX+yLwG
 p1tBG9w4rJ0otkcoFH73zglnnBqY6dYmeFl0c8/UfmHlAvpOUFd/aiWE4bxoQCPcOV5p
 FYUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdlWag7BnHBHJmxzHcmPKV42s/dHR6pO5GEVYY3CN8XXDf3+5hvNI+cZvH+pi3UMCnf9itCIyg6Q==@nongnu.org
X-Gm-Message-State: AOJu0YwW4KUPVs9PITpXEx0T44Hs5Y9imjkB3KcxuV/nZ22nigXGHoX+
 rKhvfzfgNLXkefzWKq2s0XPHe5bqzMczhu4sNarVmlQ1Z+XTcaPosXBNdzykd5jji/Risjwi231
 L2jst4wZ0Buc6STOHMbdPTndCUzBGYDU7mm7gsIuS/g==
X-Gm-Gg: AeBDieumKgZq9yAYjkYSueSMxaz1Mf+aY0PHhcrTmVn09/HGjEgj72r0jBVJ4YACRmU
 tsw+XkbkQwc2D8+e5IXtrxLFavkluZhozCIdYWMIYq3vmuOmlHv5bYqFG65u5KSJAKDnwaqDMgq
 wN8VNa8FjMQkf9Mvx3nvvxM/JjQ/WtMvRiXic386XEIR3TwmOM7Xvl9cQ2E4RRXPxAoeFfJGfoo
 3bc0iqMdMXm1f15n/POWN/MbngKl+Zc/be1oV2dwtWBXQQUKFX9e/29BDlPuDTVq5ExQqTLB51T
 vQ6H6ySzUeq7FeK42CEswxqM7cKhohd5+SzydAbsi7y5Inc3QshCqjHKJkj/RF2azfMH1FsCfDZ
 uyg==
X-Received: by 2002:a05:690e:43db:b0:650:31d2:234f with SMTP id
 956f58d0204a3-65198b90f45mr1379512d50.51.1775812615347; Fri, 10 Apr 2026
 02:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
 <20260320130607.2071996-31-alex.bennee@linaro.org>
In-Reply-To: <20260320130607.2071996-31-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 10:16:43 +0100
X-Gm-Features: AQROBzDCiCjcKKyGuZ0ea9al60ecyBGitM2rXdwjxpI4GpkT_ZjQ4kxBlKTuP-4
Message-ID: <CAFEAcA_eQDLF1ix89h=W6vugFp1+SWyanciMDMdSmpRK8eck8g@mail.gmail.com>
Subject: Re: [RFC PATCH 30/35] target/arm: implement global monitor events
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 20 Mar 2026 at 13:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Moving from Exclusive to Open Access should generate event stream
> events. Technically a non-exclusive store to any address range covered
> by the global monitor should also trigger such an event but we can
> only detect that after the event by seeing if memory doesn't match
> cpu_exclusive_val when processing the eventual store exclusive.
>
> The CLREX instruction has the same effect as do other operations
> clearing the exclusive state (such as eret).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/internals.h         | 1 +
>  target/arm/tcg/translate-a64.c | 8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 2296ac9cfb6..2e59d58f3d0 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -690,6 +690,7 @@ void arm_handle_psci_call(ARMCPU *cpu);
>  static inline void arm_clear_exclusive(CPUARMState *env)
>  {
>      env->exclusive_addr =3D -1;
> +    env->event_register.as_bool =3D true;
>  }
>
>  /**
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a6=
4.c
> index c25ff9351b4..38a51eb3600 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -2270,6 +2270,7 @@ static bool trans_CHKFEAT(DisasContext *s, arg_CHKF=
EAT *a)
>  static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
>  {
>      tcg_gen_movi_i64(cpu_exclusive_addr, -1);
> +    gen_event_reg();
>      return true;
>  }
>
> @@ -3336,6 +3337,13 @@ static void gen_store_exclusive(DisasContext *s, i=
nt rd, int rt, int rt2,
>      TCGv_i64 tmp, clean_addr;
>      MemOp memop;
>
> +    /*
> +     * All StoreExcl operations will transition the global monitor
> +     * from Exclusive to Open Access and at that point generate an
> +     * Event.
> +     */
> +    gen_event_reg();
> +

This needs to set the event register for all CPUs, not just the
one that does the StoreExcl. See the state machine for the global
monitor in figure B2-5: a "StoreExcl(Marked_address, !n)" (i.e.
some other CPU stores to the address we had an exclusive for)
clears the global monitor for this CPU.

Also, this happens only if the store-exclusive succeeds, so
ideally we should to set the event reg much later in
gen_store_exclusive(). (Because we're allowed to spuriously
wake up WFE for any IMPDEF reason, it's OK to err on the side
of setting the event register when we don't need to, but if
we're taking advantage of that we should say so.)

The IMPDEF latitude to wake up more than we need to is also
why we don't need to try to distinguish "StoreExcl but the
global monitor for this CPU is in the Open Access state".

The important thing we want to check is that our implementation
does the right thing for the "litmus test" example usages in
K11.3.4 which show how WFE and load/store exclusive loops are
supposed to interact. The rough idea is that the lock-acquire
goes to sleep with a WFE, and relies on the lock-release
being a WFE-wakeup event for it. Unfortunately if you look
at K11.3.4.1, the expected "clear the lock" operation is
a STLR operation (a store-release). So we will likely
find that we are causing deadlocks in guest code if we do
not clear the event register in more cases than just store
exclusives.

-- PMM

