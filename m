Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE504606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h/f7m3L2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpQn-0006Du-8F; Mon, 02 Nov 2026 05:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpQl-0006Cu-F1
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:38:23 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpQk-0007hF-0O
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:38:23 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8ab432273c5so23636687b3.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793615901; cv=none;
 d=google.com; s=arc-20260327;
 b=Aoo/tfZ3bzZzZEHZAc05AKKKwwwiSzBSPAZ+cV1Oaq4CPXLCLPeyfWjOl5yGUcTH3C
 zhYYqEOR5rXa23YnH/MfZ37tMyT7w8pk2Ox+ClRklQTrp6ZR4ydA1dqQFkg9lwUZ7q13
 rLqZYIeyE90Sp/YlQKC44MKUX68uK9mnjQdWOybDiRBYQwfVsoTvfltxZ09Y888s9p98
 Hu+ilr3BxcuUXeoe7nPbXeJZun43R5tiIFIY8OLjQBARJ9lM2lv0h/k1JlwwB0quHiBO
 /L9Gwd1yS3osa5/vjYh/B3N1RZ+PQD3dacCKoLmeq+v2vYTNW+M0wM+PP2VwAkqzrr//
 pB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s4V4JgH1sRadu7eDYq9bAfUCFNtlrsLwFoYkQoWEgF0=;
 fh=h6H9zghzJ2T66frMhzyAWB/nO+Kkp2ldrAkhZegStkU=;
 b=SBp9qAFYSrxxP7I/TcofZVsc9Ye7Zo4MyaG/iB5KW2zn/3DDEovOk3Q+IAvGs90s9W
 Xud14IS3TYnb+PDHothpaZDFYd+RdnXjMKsI5otXcHAaU1DW4yKrXadfNmLrgbpbQgQe
 R5oX4hP4MIaPAlN7X4TtThlsiM5alu8Yx8LH4mZftEbRKEhGsZDfi1HEajGzrmPfW56+
 on8Nz976+qIol5rZ6ilCc0ChRp7TDbW45leGQqNVakLkdE4U228C+MP+GeMuX+EcfLR4
 NTLtYRnmG0rpV9NxrANn3tpRAMcN+iq3C1lZIN5Q+67QOGPqHnhu2lmN3gnCUHKPe8+K
 i7Uw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793615901; x=1794220701; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=s4V4JgH1sRadu7eDYq9bAfUCFNtlrsLwFoYkQoWEgF0=;
 b=h/f7m3L2By/4S11w28tcNl0jVchbTXB/pN1M6vBYIKEyB8o00/2O4CQjjCb9A4MHjr
 VWPibKZxRGp4p7CWyR2TzhQIMCp8hkem99QUa87wpHeiXQZ+KrSFf05qPaeJCJEhBXSL
 xN9FT8itLtbe64LZYbvnCJHZobhEzrdDHLLdd6WEuP4ONYPI+jtnZORCafkrW7uXt1wt
 i7CY0rItCGzpfe940fBM6N0X+0ellwTujBh4G+6LHTYLlvI5JKqAio57r97gCIyh28co
 sAPACY7YTToidLz+hDAQO7I8s4Eo1U7YN/+Am4ymrHf+ZQ1wnJPWrwtKqSayZyhKQ8wf
 f9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793615901; x=1794220701;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=s4V4JgH1sRadu7eDYq9bAfUCFNtlrsLwFoYkQoWEgF0=;
 b=lqUOg3etkCZ/t/wzyOPJQuKKuz/VCvJ+Fd/TNztGgFf98ZUYnJ2xnqVprllpoRHjQx
 PCjuciFp/0lvTJNyYgQPYxrura1ev5s+XsFO5zXw5nAifCbaWiADKLc6fo8/M+qEsftK
 fx05KAqk/2NFvslNss4GCkJ/A8nypGRWIZntOX9DikQQWrrBRT2AA4YrZxzgbbvXxgMf
 1LnXsRsRGXxVbdnER834oQhDp0fDw7h0plawPEaT3GHO9c0vvBTDbRFaZ1p9+3JrUs9T
 IuZ73dV9EyaCPRzJBOzhC2Q8HIq2WfaoBTV0vwC+0FRhuyKHeoLEMiHhHYvtPSytRCDW
 ZSLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4YtE1VCkObvJKLQ7XmKS9Wqw6VidxwSEn/hrsIr4dxlccy1tSOwSqnB5tQFOrM7lAgKL+90VZxg==@nongnu.org
X-Gm-Message-State: APuU4Z8bEKkmwpfd3VNnBIp84yMh6T954NDzibCHt0tDbHUosm3vew6d
 uWGf22+HVph5JoXFvZnxjqoHF5qQn4FU0q1Ba2ahjEC3vqhVchSrMyHKfFoSVJNeHjEpwR47Pv6
 gODw529uumHA+vbb5SuZGC969Q41ZvUjAohkuYHxz8NUcDvkuXYYbyjw=
X-Gm-Gg: AYBFou0iOd5OnIHoANVU1a32rfqQeHUtj+QcvKVbuqLGPp8ob00z+6JfTSX5w8ETP/w
 V5A4agM8D/MWe/DteW1qdy51Bw3ApjM1S/C+YjYwE5Hxk8AQ4nd4nPub8veiOzoMoCYjtfYnytm
 PThnDmysrzYLEgd/ZL47Ntoeqr6hBgxAhAHTQDAk8bOv8Lml3y8ltvIax8Rmaz1tMfvVD9e4gWQ
 DWlRjgdYzmubWcPnW4rp3V4zt2U2sUkWt02n1Fr1dKIY+C2BIQSfvoCIw2t+SXGCymSv4QNKJgH
 +oU3/TYhU4xElBEtefqTFxh1kW4cXH1JGGNB44Uvp8jBYnpMXL+rWcbT2ra2onMbW7Ovpg+tDdc
 2ymQKoa6fj9OpGs6t+qjIdSIE0almMnmBTUbiCEKXrmW1Zty6k8yhuZ+r22nuEKnkeO0W4gp6oO
 De3KxzGQh1VcWkBgT9mfM+
X-Received: by 2002:a05:690c:6e86:b0:8b0:d36c:14f6 with SMTP id
 00721157ae682-8b2b67d9dcbmr72015307b3.51.1793615900276; Mon, 02 Nov 2026
 02:38:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
 <c2ea822f9f49674173e5ae3089631838d034aef7.1793613972.git.lorandmarton.dev@gmail.com>
In-Reply-To: <c2ea822f9f49674173e5ae3089631838d034aef7.1793613972.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:38:08 +0000
X-Gm-Features: AclHuK_XqZtOsc8szfO9VHxdDkaxhsl6sW2hdRx0nz0Y1IhXdcnqNcnTAMDL66U
Message-ID: <CAFEAcA-p9oa=tAjDgWUHF7YfNq1SpvuWa4ta6uU0QAq1b6Np-w@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/timer/bcm2835_systmr: cancel the compares and
 lower the IRQs on reset
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:27, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> bcm2835_systmr_reset() cleared the match bits and the compare
> registers, but a channel whose match had raised its interrupt kept the
> line raised, and a compare armed before the reset still fired after
> it, setting its match bit and raising the interrupt in a guest that
> had not armed it. Both happen when a guest reboots with a system timer
> channel in use (the firmware or a bare-metal guest's tick).
>
> Delete the timers and lower the interrupts in the reset, as the
> register values now say.
>
> Test that a reset drops a raised channel and that a compare set before
> it does not fire.
>
> Fixes: be95dffa326a ("hw/timer/bcm2835: Support the timer COMPARE registers")
> Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
> ---
>  hw/timer/bcm2835_systmr.c         |  4 +++
>  tests/qtest/bcm2835-systmr-test.c | 54 +++++++++++++++++++++++++++++++
>  tests/qtest/meson.build           |  2 +-
>  3 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/bcm2835-systmr-test.c
>
> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
> index 06a919b1f8..3c03c98193 100644
> --- a/hw/timer/bcm2835_systmr.c
> +++ b/hw/timer/bcm2835_systmr.c
> @@ -123,6 +123,10 @@ static void bcm2835_systmr_reset(DeviceState *dev)
>      BCM2835SystemTimerState *s = BCM2835_SYSTIMER(dev);
>
>      memset(&s->reg, 0, sizeof(s->reg));
> +    for (size_t i = 0; i < ARRAY_SIZE(s->tmr); i++) {
> +        timer_del(&s->tmr[i].timer);
> +        qemu_set_irq(s->tmr[i].irq, 0);
> +    }
>  }

The timer_del() is correct, the qemu_set_irq() is not.

-- PMM

