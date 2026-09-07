Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4645C79F89
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 09:09:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3VLq-0000a9-AT; Mon, 07 Sep 2026 05:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3VLo-0000ZI-7M
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 05:09:16 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3VLm-0008M1-GV
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 05:09:15 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-861145fc841so26800907b3.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 02:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788772153; cv=none;
 d=google.com; s=arc-20260327;
 b=beLy26EddhcH2vZX0oNH1j6E8FE9zPTKFJAWfLa2CSql6tsreHkfEhF+ulUUefFwF8
 qBrXodXpcHhqFPMIzTkqHtHSZvahSGsiTzcYK/QfCOB6lgUhhYK6rkWOAAlc9zCtpexH
 2RhL4Vix0njK+Bp7uXCqYIgtwxhuMbxlbVzf4CQEOUHfLgq9oNpjnge2BU+kh/e2T7N7
 TEC6Hap1t3sBZOrdt8O/l7Fk70/RT3N3XM8tqOhLIw/T6FmY9uLrSDlzjUMNT333XP+N
 Avii41m9A3qbV4hYOQ1JGirDQ8Yqz6o2ntMjTqAvrsUYahJPQs2LtBodrw7qHiLp0jZ8
 ZU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AgLMzHNdQvTp6QSSmqNNnxU6TShe63VrzqfdxLISUy4=;
 fh=tZfdY9HsfqLDdrGW1AywfowCdu8jIAKtWZBvGE9xqC8=;
 b=F3q+3f4gWeUr1QrVptDmxyaFYYZzXKqh2jLEn+vOH5IUWnVMz0og2CGoXttxSfCyLx
 iB6QxpjDeLLreXfdBNwfWvZdP8Pp69/MW/wtJ4k54yoF1BLM/n+xpL/ldQNKgIA/Ztpg
 ajI6rbbuZwm+7MUZm3EBO57I2Iyh0dbNMQuPA9nFWlSEu2/tneFDWb0mHsj1Z0bfTtqv
 gxxEYdaKXNr2ntXwannvgBXBbMu4MDB03mfsxSANOjGtmbMAa+GeJtVSlrxiDgB6lx/Q
 ak1nEFRn34UFB0t0JPte0FdFLq5BTsJBfFJkl8qdyLes11uH6f1oWUyB9LrsSBQH3Fux
 HB8w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788772153; x=1789376953; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AgLMzHNdQvTp6QSSmqNNnxU6TShe63VrzqfdxLISUy4=;
 b=srh+EgzCt+gOBqEFujnVKuRjsfIlcjwjX/DqDhkweOeGHSqGMGxAX3a5RWOHIajFDl
 dQ4giPBjr+tE+KxDlZcGlvOXTe0M8J0gxbpWiBedbqMN09BvEU0cT8pE74ppdCIjI4R7
 9qh5N8yBZbKYIus/baagLnQTPnlMTVJd+KRsf9ebf9aokdyPYBp1Lu8i78WMf+wT2gIN
 HZK9qkFieO06EaYDPBlErmzlEthxTtSX3eXXKICKDTbtdj2HUBxkQDIPqquUa08LgegC
 u6TeSO+NdREhYISJFqssFJ6YzwP+n/r5XloRBQQRyuVpd356eRCA45nNYpu1Jbg8LSIX
 ciQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788772153; x=1789376953;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=AgLMzHNdQvTp6QSSmqNNnxU6TShe63VrzqfdxLISUy4=;
 b=mh6ZkmJ6l0JoX0xQY5k8yvjCue+2EglWQ2IzoABoDIIPaACgDHBH5fTyPzYgsIAJP5
 /GNbDTMjfu37BVf5uZBxiG5Vo1XrsDjTuHbsZSGDAChwmyL7+6X6Hzn8Bg/LQ42mUUJ2
 ga+KshTuYQicdGZnXQ/pyBXbjt9Dg5Op/W2iWyhuFIjzPF1nVU4U9RuUmFDovVtBrkv8
 wvgwBnAdgfx1u84wT9ioQBXJpzmH9M0HujuIooNinu+wVF3bUte5LE43Hwee4LJKe6G/
 KXparxONdzSpzJWOmkyYFbUCyoHINcSzBCVN4ZKFHum9y2NttblSYpjDES5r75k4y79K
 VAtQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxu51WhGVo7z4iXfB2EfWNvTYKze0Zt8p0yXjIgJ/+Bw0HsNSSPlFfn6V1nkk3gpxWLeNgV/9GwCg==@nongnu.org
X-Gm-Message-State: AFuF++lSmo98idJvuvbHZpITA6YHYIWhk6TYRCSlbhC0MVRJyzWfkGlv
 xEHakE3Zj2tVt+ubREDhHTHc8JXfZ8l2QwXjd+AGHPihO8VDXtsVV5Du2mc5zUKJjG79YKINxFd
 RV4UuhyQ8Rkr8bYOXf8N+X5tpenr7boxNBlWsF5JJQw==
X-Gm-Gg: AYBFou2tMQcC9FYe8ICiehTTQ3CvQSqstDRcmracZZL9+3Ked0u0+Ci6IQq9VQcncQ4
 nUnqT0kC6MON27ZZv+7hGgx2OaJXMjXFZMQPw9yogQBIH0EafN78OP4zphkqiQfVHPekjOCeJsj
 JEUbHtuxscPPMTK2USVFfnFP6bFZt6INnlPCxRZX28fueZl2qyM5vCQW9h+4ZqP+wsW34B8jKia
 m/nqJZFEYDd3qIcu62GMZT0PxrsbAvsADo9lc6ATJZs4t+Ik0x/ILd/M3S6UdooFvpGAfj+uWvL
 r2JVAMyD1pgMvJ8BR8Fl8tRJA4kmwklbnstdclYgvuKPtYIl0rmUjJN9cyB4ZupcGCIrchocWlv
 8FNK3Me+SLNS4mxVUYRazm1P0/Wl0Og==
X-Received: by 2002:a05:690c:4a13:b0:857:f33:6f03 with SMTP id
 00721157ae682-8712a41d647mr90790327b3.29.1788772152848; Mon, 07 Sep 2026
 02:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260906194438.93046-1-gilles.grimaud@univ-lille.fr>
 <20260906194438.93046-3-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260906194438.93046-3-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2026 10:09:01 +0100
X-Gm-Features: AcwNN1Xfw07d8kdokwYZk6rn3gAjzlKwyPz8_RB2JK4F_amOP1Rz_RChlWDwHGg
Message-ID: <CAFEAcA8OYNNDn7tV8gzoVcKnpNc5MZZ1u0AmbbNpRfuzdoqfKg@mail.gmail.com>
Subject: Re: [PATCH v3 02/36] target/arm: allow Armv6-M to set CONTROL.nPRIV
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Sun, 6 Sept 2026 at 20:44, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> Armv6-M implements CONTROL.nPRIV even though it does not implement the Main
> Extension. The M-profile MSR helper currently gates writes to nPRIV on
> ARM_FEATURE_M_MAIN, preventing Cortex-M0 CPUs from entering unprivileged
> Thread mode.
>
> Allow privileged code to write nPRIV on every M-profile CPU. The translator
> already ends the translation block and rebuilds the execution flags after
> an M-profile MSR, so this does not require explicit TLB maintenance.
>
> Add a check-tcg test using the generic microbit machine. It verifies entry
> into unprivileged Thread mode, that unprivileged code cannot clear nPRIV,
> and that an exception handler can restore privileged Thread mode.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---
>  target/arm/tcg/m_helper.c                  |  2 +-
>  tests/tcg/arm/system/meson.build           |  6 ++
>  tests/tcg/arm/system/test-armv6m-control.S | 85 ++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/arm/system/test-armv6m-control.S
>
> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index 33c9e7c55b..0cd51c52ba 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -2775,7 +2775,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>                             !arm_v7m_is_handler_mode(env))) {
>              write_v7m_control_spsel(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
>          }
> -        if (cur_el > 0 && arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +        if (cur_el > 0) {
>              env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
>              env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
>          }

For v6M, whether you can write to CONTROL.nPRIV depends on whether the
CPU implements the "Unprivileged/Privileged Extension". In v8M, if
the Main Extension is not present then this is IMPDEF.

In particular, the Cortex-M0 TRM says it doesn't have that
extension, and that's the one v6M CPU we currently model.
On Cortex-M0+ it is a configurable option.

We don't model any v8M CPUs without the Main extension, so we
don't need to adjust anything there. (As it happens, I think
the Cortex-M23 is the only v8M Baseline CPU, and it chooses to
implement allowing nPRIV to be written.)

I think we probably need to model this with a new ARM_FEATURE_ bit,
so we can make Cortex-M0 and Cortex-M0+ behave differently.

thanks
-- PMM

