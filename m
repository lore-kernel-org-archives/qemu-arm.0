Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A214CD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4DP-0006pt-7C; Thu, 21 May 2026 10:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4DA-0006hC-E7
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:17:23 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4D8-0000ei-8d
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:17:20 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-651c7ddf514so5788797d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373036; cv=none;
 d=google.com; s=arc-20240605;
 b=UKFIfQLdgrCTWfFLQorS1tOQe4Fw23tNXPD+3s7J7LJNxtN8E37lqmRabohGLYK8Mz
 30HdukYmZeoT43wKTeZEiTqQlAHM6Bc+DOmJ/nWvcbc6NHr97s/X9cMnK3VRLgDJXAfj
 5/oJ/7U8MvOUYo3YRSsNchXrH5d6G/I0pUYbZUD9OEBX2lFVTz+DtFFnmBMIofI0vkCJ
 OSQkYeBHMPY12OD7HXfvvnNQKkrj5tpE8MWgvVPqlgcaVX1k+Io0hUh3ZV7GLP0dfp20
 oYXG9nX2JdFvhsfsjPMceBLPx76QCweOWvbR7WEjEHAaukkPcYCDBODNlKnzAe+9TU98
 mJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=B/R5nmoCOoJ66VRW1FPc4pkr0+6I0oidqAcJnl8VECM=;
 fh=O3SP7DiUeg/ID1PwfagId2fnPwelvfOclyZjxYfM7Go=;
 b=UOuvjpcht127xeelgHft9SDf8gMaDnwGUY9gBN4eX2wE22P650k7+j1CCBs6ndLlMR
 DgsjALSS1HDmxB6Vpn75M+njzCUGNN55O+U2M5nE6whAIc7lJHYsQbXYluDipPhRtXRk
 rCsW1a3AozkNltjtc6waOibE5wNuXhhTH0PGzX2CiyxIyTUorXmZOayRA9F4liETsiJF
 zaMF3DiXiKutVHzR5aT61mMCWZN1vtYJmZ7oNa5uSIQTKWKapPUYl7pJpu805yF7GysP
 Y8i0wv4KBMrTKhtewjvgc5bjb4XK1JsxGHE5Eb/7rUsKTMce1P54TaHf0hflRvclK88K
 GdrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779373036; x=1779977836; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B/R5nmoCOoJ66VRW1FPc4pkr0+6I0oidqAcJnl8VECM=;
 b=OIECp/R69JahI1/ycKrAZ40rae9o6uCtVTY0u+La7G6G0ygW30ddCpWMcnb7sEDOBS
 Cz0L/GEH4EMvDcKS0Eg8X+3SaTycGCrdtk3Sv+d6PjFIZ1iGyIhEyVBu8WtsIX6fklWx
 kfwQAHh1dV1kMnKrrbNgDqWmm+w6C7OTaoHiZ3Z/8uH8IwCdO2n6fOWVqCk8UrPByX0g
 4scFgrp6gyOkglI9lWVtOw1DqNVqVL+pqS7exgeS8Yq99+pJnowDOecTuZsvmk5KUcwS
 4vD8kh56HuNNSXRKyZBikv3mtTwwNzS3QQI+GUXhJivfgE0i5ZnKNfuZ+W5cfOzADPwO
 M+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779373036; x=1779977836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/R5nmoCOoJ66VRW1FPc4pkr0+6I0oidqAcJnl8VECM=;
 b=fkExhchEuSTgR1lzW8EIe6U8L7k6mwWHshRpT0bm/PnqzVxvAyn/4RkkyGtsEd627P
 IEmvw2P7T0JDTcPAsyTja2rRO6v7Ubpi3+Mf9BK1n0YOcfmQRIYwLhDWd2nzh4g7m1Gx
 OPsYJDZFfd5M5Lz8ywCOA+vzOWmg51wPqvBukZOdm7/27rVPRwpolo2JDkjamMea12j+
 e1ZYz3PJW7zG2LwhaL/0ZuJr4pSzzqyIHhZNXsvPjH3m+DEcBdJJyQJ+efcYCYmXpL1X
 rEKgFWJg9Z2SKlSZX7tambe0dUWcNyYx+I55kzWPQ9SNwB8vs+BR6dDNg2IUvKgeFU5L
 AK2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8wILc7tBCkTpMdnRE/HcsHRO5O+tcMgbUukQNwv+n8/nlyGK7CE5ProEHtLwGYVgRj0qXqYtQ1mA==@nongnu.org
X-Gm-Message-State: AOJu0YwMM5uKkNBdvu8zr7EB5WA+H9Slh8prKUPlBAR6hIPHHM1eSTBQ
 iSR6wXMHWEjXcoL+vCxFgyo5khBUHn8k5Z4x5p9F/q5DHvdaMaO2vSqBv752t1cwAPRPr1yzuCD
 ZovH616nrSpdEdKwVvxgF6z/rauuMxhsqpwA8QRwiJw==
X-Gm-Gg: Acq92OHtuHdl1G1lpG2K8ngAMnGR9I4aTMpWqOnmOJhCLGNjmQsWJs1YAQaKaSMOQpn
 +Idjo+fNqWIYqF6bJnffAAFFDc7xoyTK0nT9Yfb3iw1FZIMoHQqdMo92YyAGQUPANyhZQPddDeb
 mJzh7m1QlesGe5zvOBPghumlmp7/zdvhGwL7DDcXhdTcC8/X09Oiur1O3AghIdeJwLnQR9ThgzF
 b+WIfBRxqGfCXnRDS3YifTvG6GT65ZK9qYchJBJJu19WnIdVKzAc6qSqnl0Qo1JsEDYuNDyiG8J
 lo07nqV6aJO8W/ynhdJ3ZhQbIUs6qWKVcDUic3LVeBXp541GUvkMT8VhcN+Ol4upRm92drQPUdE
 tI7fbe47g2z+B
X-Received: by 2002:a05:690e:418c:b0:650:4a79:f3ac with SMTP id
 956f58d0204a3-65eadf36cb0mr2252646d50.9.1779373036353; Thu, 21 May 2026
 07:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-12-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:17:04 +0100
X-Gm-Features: AVHnY4Kk6ABXHM7dhBLcu0KepWMwRXBxbijqYXT2_J5mfEx1NQjS1mzjHadPeUs
Message-ID: <CAFEAcA-kqCYK9a=XA=YDEWTz7fQXSW3s2a17ZyYf0HThQFpPgw@mail.gmail.com>
Subject: Re: [PATCH v6 11/64] target/arm: Clear FPMR on ResetSVEState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> FPMR is cleared when entering or exiting Streaming Mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7eb7031294..3d6e7f1ccc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4856,6 +4856,7 @@ static void arm_reset_sve_state(CPUARMState *env)
>      /* Recall that FFR is stored as pregs[16]. */
>      memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
>      vfp_set_fpsr(env, 0x0800009f);
> +    env->vfp.fpmr = 0;
>  }
>
>  void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

