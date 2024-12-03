Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3841692njk;
        Tue, 3 Dec 2024 08:47:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYQ+pYEr6f8WuwwjupHHS7/rOubuaUGrV4vfsNEMtOBF1Wx796fglhB5pRXR9WMHmRr/EHS8/jNre79w==@linaro.org
X-Google-Smtp-Source: AGHT+IGnA9srrbpXkJQ2h8Fo/1Naf6XP0iLrbEHcXcrhHaVW2Tzi2T3+eZXEvgPT46+4XM5YIraX
X-Received: by 2002:a05:6214:2622:b0:6d8:b3a7:75a5 with SMTP id 6a1803df08f44-6d8c46dae1bmr14100476d6.42.1733244431729;
        Tue, 03 Dec 2024 08:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733244431; cv=none;
        d=google.com; s=arc-20240605;
        b=OAKX85Y4kIyv02JbdFwh+1evA17WEqBznA30bawEJ+7EFJcnVda/vuIPnVfpWJht/E
         v533TMMb4b8938mRJ10+YOn6lqioFm2jYF5Ap9Mg9Z39H/cTV5Dr8BT6NKsv0uKF1sGx
         iTkcmkSmHhovOWWljTclPcnXn+0zLC20VbjDs5JnV8HW/zdodMLgop5HbLOiv49QvtK8
         ZcVCkvNgxEeVIgB2ybmsF779yBX2UfTEyLBHcf1x7O37MATJQUBLxzXLzjHmx/rhwZPI
         TKCfjmrqgwBA9TWShQvx0UKIe8Uwk9VgcV+5NdBKsEiG2AJZgMnvVBN8TwOk+1UVVwWm
         +zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gu6IFtHi6NhS1YbAIlb98eMw8DAkKkiLvZulg8F6074=;
        fh=fLIreIolfdHxAleIAzKsfrQ6rgr0brrg6DQQU9rr4+o=;
        b=RWz6d6gLxvgIhtGCs1G0vp19I21QQQxt7jTwcCbyhfBwYgCJWxOgleaQw0y/wdjd98
         VwZUsOrsxi+Nf83TdMtYP5+fzX32U9SHA+YDXNqnNKjG+DpUUDA8gf94MI78g9RNWrnB
         U0YOMgwL4P2p9aG9El/iGIxt+lWxwdPxgS5IjC+vGYtYJIoG2lAWxtegmqoS8hSwjY2j
         Ss6Izyt1csqAjG52L15mhwhEcOzWuJGD/GSDezS0Jarbgg+QL0AhK4xQIv+3GUCSdhsg
         AuvMzDSbogGUVaglKMhQWFWotuSuVbbhytyJunQ5vsq0hjR2y4zSap8iHqh/XCcNyF0Y
         iUHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RR0+Bilh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d89cd99fb6si75675526d6.15.2024.12.03.08.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 08:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RR0+Bilh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIW32-0002dZ-Mk; Tue, 03 Dec 2024 11:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tIW2v-0002Z3-2U
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 11:46:47 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tIW2s-0003eL-Vg
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 11:46:44 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ffc80318c9so60450271fa.2
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733244401; x=1733849201; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gu6IFtHi6NhS1YbAIlb98eMw8DAkKkiLvZulg8F6074=;
 b=RR0+Bilh9igXLTUoQBfoubDhogMqPbJ9IjodsLUsnu8IvJDmtjLkUqBJCu3A7GDiQ+
 jYWlK5COAPNXhIk4WPcKFFa0HIqdjNb7qXJpcMeaw64G2fn9DHN6pHlark9gSQCSbU5k
 NrSqYHT9T9DMN4KKbWDXl2rAkADkY9bjhkZZ9XkXBhUQxwb/4krWaKqtjMsMWz7JhlI3
 8pW5e/mca2dB6JV/4Tomwba4nH44a9fvn04TITdxk1PtVTYcA68S5k0WdAIHEZeF0yAd
 MYzZF80p5ID66TPFNx4IUFtYD/3UUCJm8LX7b+2yXwjNGdqmnYHlnIujI2EYesEpA4O/
 lkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733244401; x=1733849201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gu6IFtHi6NhS1YbAIlb98eMw8DAkKkiLvZulg8F6074=;
 b=BKzqyeQ6SZWfeWTSz+JO9kjZzPd+sVnixia34p0SdXVYe7oYcOUYjoFJLEk+xjrSjR
 7v6VSGjidPEA2juVc48sJa92vqIGzYOWdB8xAQ4RncALzXgF+IUMJ9EJJqeuZ71PU3ZK
 8C1N8AuBbocibnNV1XHFFiWHIf5SEcCt9lDuADEJl5OTGRHIf5tXJw59H4zXWaOo8tih
 HDBZniALXcstpSZr6+IhAK6gUURw7465VKAi7YJ2irh0q4JO1ab2W6j4rdJhN8KCuUFc
 tYIa/AaU51WMQLsEzgwVQNyEdbdJuXGm7ulsKNUCKVXCaRRBfHusJzJ6P/04tE2HOgxK
 l/vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTsn8r/7231C3/eGc+knH1+CXaDnmDPHWDrhiZCD6E4XYGa0G7dUSVK3n96K7WKpFQ8N577OSrBw==@nongnu.org
X-Gm-Message-State: AOJu0YygGxQHJiim1A7PpMDdgovntwBrlNNMOYM71iT6jt0d3pqPDg0O
 8Jh2hXZMTxrropA5r+0vyD6YkDpM6JVrwDW6UXdTVmF+Vy8lmnT2dQzChEHs482Xbd853GRrWji
 kNmB3sEIfVvU8PGiPLoZUQ6k6HxOdkBTZvXz4EQ==
X-Gm-Gg: ASbGncsZaFSD6MqwGpjO6+QBwWGIXInD8QMHATByzI+W7xo4Gwia/Hra0C+s71GaCTm
 qOUeBz3R6Bf6oSA36mx9eIIbsz03a1rlr
X-Received: by 2002:a2e:a98f:0:b0:2ff:e5fc:fd0a with SMTP id
 38308e7fff4ca-30009c12978mr20821791fa.23.1733244400798; Tue, 03 Dec 2024
 08:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20241203162525.75156-1-abelova@astralinux.ru>
In-Reply-To: <20241203162525.75156-1-abelova@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2024 16:46:29 +0000
Message-ID: <CAFEAcA-y2-k8HnTHwTzqL4MGqrTAC1AKD5iP1s9XOTk0OrVYTg@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/nrf51_timer: prevent integer overflow
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: UxxrWi/weB83

On Tue, 3 Dec 2024 at 16:25, Anastasia Belova <abelova@astralinux.ru> wrote:
>
> Both counter and tick are uint32_t and the result
> of their addition may not fit this type. Add
> explicit casting to uint64_t.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: c5a4829c08 ("hw/timer/nrf51_timer: Add nRF51 Timer peripheral")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  hw/timer/nrf51_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
> index 35b0e62d5b..b5ff235eb8 100644
> --- a/hw/timer/nrf51_timer.c
> +++ b/hw/timer/nrf51_timer.c
> @@ -44,7 +44,7 @@ static uint32_t update_counter(NRF51TimerState *s, int64_t now)
>  {
>      uint32_t ticks = ns_to_ticks(s, now - s->update_counter_ns);
>
> -    s->counter = (s->counter + ticks) % BIT(bitwidths[s->bitmode]);
> +    s->counter = ((uint64_t)s->counter + ticks) % BIT(bitwidths[s->bitmode]);

Can you explain when adding the cast makes a difference?
Since s->counter is 32 bits and ticks is 32 bits and
the RHS of the % is a power of 2, it's not clear to
me that keeping the top 32 bits in the addition and then
discarding it after the % is any different from only
taking the bottom 32 bits of the addition.

thanks
-- PMM
