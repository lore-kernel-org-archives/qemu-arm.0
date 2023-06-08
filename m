Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp382206ejb;
        Thu, 8 Jun 2023 07:36:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lmOMZ0xsTVFdfj0MX6QWksLOf8xwRn3q1CH0H6EfmVfcosvIQ6BuaYGWmLS3EjBraaSQb
X-Received: by 2002:a05:6214:d8e:b0:628:2d00:5301 with SMTP id e14-20020a0562140d8e00b006282d005301mr1630381qve.39.1686235008885;
        Thu, 08 Jun 2023 07:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235008; cv=none;
        d=google.com; s=arc-20160816;
        b=qTrxwuGF6vR4xqisWH8Gzb1ZBOL48PUyIvEgGhcOQwRaQ7bDfdZ13uQPCX+qVhWNzu
         gPCfV9ByS+76TymFVg8tUQNZc4FP0B6k+8vtyJ6gyHgx+fmg3AnBmgeHGlnBIvFLcXRw
         +5oDiA/Y6HA6cRKCtc7804Elcn8jMggUUczTjlbFwHl25H216jF+A19AOgDNBOaj6mEr
         v+IMbd7f7Z8Q+bgL/GwYOoZ55FB1k6BFj7WbZN3YIJ/Dq4LgiuZktVt859lyUV9o8xGH
         5XXc7hUQXNKCXe3KKZD6gVHpSMmR19QNzjxLPa1PrMQEVtvnoySUJa9e6ukdaX5t6l3Z
         8bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9sj8jEcdZiUOzpAI1HTm+tLR32HPM4AFQ2R/g9aVS4Y=;
        b=rMZpwRfmBJx6N+Tdl5mhC4nIHImJcdx3jmqiCf2uNX54njo73ll7A+G2i2BZYtb1Ew
         BguutlmlZLc+iIj6g2pNK8Pb9YK/p2UcMVaK3UPJDw4XIMON4bKhGZvO0qf0CqyCUGBj
         iEXUJBDkjT9WNc0urQmrdqmHBIYYuh+Kb621WJG0tPGhuqAZ4LqHkPg1pJXRH8rYbwbd
         paryzDbOn6Y4vbjezl3yEPEvLhJCUsNE3sSuxFQMpoZqYxaKVWB4l18TMxO8kPUcNjBW
         fFtTcizvUiOI61xeZOdSy0phj6kUj6s/ongBz9cE+B6mLwbbX0WJtfBNuNblh6CLau1x
         +0hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XvJACvfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj16-20020a056214529000b00625c0b59eeasi777204qvb.471.2023.06.08.07.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XvJACvfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7GkW-00076D-3V; Thu, 08 Jun 2023 10:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GkR-00072y-3l
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 10:36:23 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GkO-0006MP-Bn
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 10:36:21 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5169f920a9dso1508689a12.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686234977; x=1688826977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sj8jEcdZiUOzpAI1HTm+tLR32HPM4AFQ2R/g9aVS4Y=;
 b=XvJACvfhcx+o6w1A57R91WORjcxHF0f+8/SXjw2/lAskdC3lgyyoQPG9oD9qBg8hwX
 kByaU/IUpCaHJv2qRQTg5ih/ubo9/+GatmVeFZrbIPb+Qog8dd9/l1Mm+2BubwUWb6fi
 QeU11GhW1rWvO9hU6JTWLV7t/9elXNdc9cadEpFBP+LVZM9Tlx6drYifK1v55BwFJzYn
 8FiKg6CV7gY6Z2msZe4yV+2Z764WQlmGo/mUGSHP/qQH9YqTJCvkDG+kxAvcPU2+MfsJ
 XOmz92EjNY+JrOvJaPiKw6SAnKtzYkUjMXfFlygpSKBXjkCd+ZeeiKjR1K/NPi9ta8o5
 EQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686234977; x=1688826977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sj8jEcdZiUOzpAI1HTm+tLR32HPM4AFQ2R/g9aVS4Y=;
 b=ZoPT6z1NP7nNoJV/yELeswhDbatIpmxAPxX6ycQaqnxMf8WkVmqOm3gh4SZY1E9oOm
 4HskAuVYfLFE3i2T+qqxLqsXrZIX6JBO3+gONCuTZmrkW3rvBnbabU43ar7E5gPGEdYI
 tQPrB4QYLfpWG7YYm6iIb87gP9sewtlVtsnUKxQEJWk5wYOOOQPTXRHBdhyR/HW/YC8a
 Bsnu35tOUr0eu1rzCQVI70Pwlv5dTdIhFGrLbLutrZT5MEPi3e+YtWKcN53S58Ex0vGi
 raVuVINKnVFVR74Lh/CtnkG//7vQm3lsN+bGKnwyndcyZRGOIGOBTjIGaaLyCBYrmtMk
 HJlg==
X-Gm-Message-State: AC+VfDyemchxiGy8gIVnct3mgmBn/u5kY6eA7pN/U/WtTn4iBp2HEB+b
 B/R401xB1jhlqDesHsKyxgkHr6OJDw0RqaAaM2o1sA==
X-Received: by 2002:a05:6402:518a:b0:506:bbf8:5152 with SMTP id
 q10-20020a056402518a00b00506bbf85152mr2628649edd.9.1686234977483; Thu, 08 Jun
 2023 07:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-3-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:36:06 +0100
Message-ID: <CAFEAcA9Gd=6=DXkW0GoZF+_ROgnhPWG8VrwhxzuFsr4UjeBdZA@mail.gmail.com>
Subject: Re: [PATCH 02/15] hw/timer/arm_timer: Move SP804 code around
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d2dwcUjlehhc

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Move sp804_properties[] and sp804_class_init() around
> with the rest of SP804 code code. What follows the
> "Integrator/CP timer module." is strictly ICP related.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/timer/arm_timer.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
