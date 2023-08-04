Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1789387ejb;
        Fri, 4 Aug 2023 07:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF034/+gWIKsVlsiw1WN79LX9yQVo+0Z0vf7VKOb0bZrxCxQmcZNP5A9P9BMYs6sWKoD0oe
X-Received: by 2002:a05:620a:3904:b0:768:134e:1d41 with SMTP id qr4-20020a05620a390400b00768134e1d41mr2226889qkn.7.1691159291371;
        Fri, 04 Aug 2023 07:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691159291; cv=none;
        d=google.com; s=arc-20160816;
        b=eIL1/84XEkMo7lm3J1Jot4e1ieC3ZSAdUmxrmfRQ5EPybwusGixyykcWKiEpc0kvPl
         tf+pR+W8CMgel+sYJiKL6b14JHMAOk+Iz3KuHs0fecW1TFYrunNaYo0i5qixDWr7H9Tc
         EhESZTCu08X9AK+jnSsUHjV4X6lGRwXTPN+tc3w2O1uuyrdSLwauD+MnEZuB7Ple0X0J
         vTcpGNZenB1ucmFV1b6Rc6gTs7ew0izr2i43BYeXA3myEOUD5rJi4DMaCuBEeh6D4nb3
         Vjwueio6jK5MlpIi4Ta7F71OEFCIRgSGgXiWtfaVih+78Nl0OhDUxygNhWvPDZ6bDqKn
         l9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+m7r6HaOXEVWJqFcrZmYLqYa6QckfNbPrfu3676xCzg=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=gb9xAV78Whm/cg6CV8CLmwUvf4Ds6B+5KLl5Znd9YkxUTO1f09s2d0dUTaCVENRG/K
         7Z9yYeFHsHqesp2bivWGxBcBcybtmtrAeuWvnm9dkngHJoqrlNIrhZ26J/OIX52P4zP1
         JTClhafBOKzBzZixKdOX3VlMJZ4wqzqWsiAOUOmXLRQ774a40kt4vrvw0T3hWpVlyhNX
         cvnsIFNtpFJVAspUwY/rYZrIsv8cLD8qC1S/wUJppUzrQZqRtUYsnxTA2CQfzErTDPNm
         ZfZGyytpssZqrE7viT+3nXifI6apcNu2AqC3PS/FRZLZFgtYo03gZm1rOkrl8UXdCqqM
         Z3Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBhaWXWq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj9-20020a05620a190900b0076ce5cbfc82si1334106qkb.389.2023.08.04.07.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBhaWXWq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRvm9-0004ly-Bx; Fri, 04 Aug 2023 10:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRvm6-0004lU-RD
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:27:31 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRvm5-0001dN-0h
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:27:30 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5221c6a2d3dso2773782a12.3
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691159247; x=1691764047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+m7r6HaOXEVWJqFcrZmYLqYa6QckfNbPrfu3676xCzg=;
 b=qBhaWXWqIMn9WoyI7lkBd73w3DjodMLW5V5B0mhFduK0lUQa20JbxJyMSvGoKBaYC/
 pZgvG7CbPq34kN3kWBGD7r+KCpz7pRtkakeJo2KpNT9RUvEuf746UTYt3SjjeZzs4Lcf
 eSpm/mgYOBcUDXGw6d6dh1cfEhUHonaY3agIpkn47zgeDW07XzTdcsJ7MEhB3HwOWdwZ
 GLCPAlyMPlq+HpE6EUVyADBskhphhccpRHU//AhyGJh6raso0zOhLGe6WJuxynssHf9n
 hio9WthVE8oZX6YnoT1TgRNK4UETNacIBXMRAjEA2CSECYf6OgB24uvdAYMNRpU5HKPm
 slfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691159247; x=1691764047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+m7r6HaOXEVWJqFcrZmYLqYa6QckfNbPrfu3676xCzg=;
 b=bsKqSSZqM8iFdx301dpJLUj903fSV5Q+S4rchFHGAvsz/YXm5GpE4xmRTubZfKZ2jr
 7BHlBseROeoEVCcnYw5CI7YfBe0HbC6KT9UZ9BPu58djVljyQ4PXn1zfYJfnsqfS0yJk
 VinAbqcgA5NfjxW/ECeJgQaWZAPUkO+eNJSshoREu0kbkI+EMIelQyhaf5rfjOj3zxE2
 BQD8n9ZsWK6qcCvOeCgXG5gh/c71gvqonZWgh1vQ7Su3o8kMwvZil2Epr+jrrJf4BfSX
 FLtNlhQn3RixHzj4ybxW5bCTtySUpYNiIy7aaiLBqXMyJ2Ip5CT/UuXVqJIuPyuHh88E
 BeTw==
X-Gm-Message-State: AOJu0Yza8xUcoE5H5Bfnh9JfU/YeG+Uwt/HLRBV1rFRpefrnquvRpJvn
 86R6xMN0CeNC8xxaZO8zsx63SVBrlWtx8Bn+dZEDcg==
X-Received: by 2002:a05:6402:1513:b0:522:2019:201e with SMTP id
 f19-20020a056402151300b005222019201emr1486563edw.17.1691159246845; Fri, 04
 Aug 2023 07:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-19-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-19-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:27:15 +0100
Message-ID: <CAFEAcA8BEMFuCiGMTamyZRbE95q5UcuMkj-OpjbvPwxswS1g5g@mail.gmail.com>
Subject: Re: [PATCH 18/44] Add RNG200 RNG and RBG
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: HQVKgFGynD1Z

On Wed, 26 Jul 2023 at 14:29, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/misc/bcm2838_rng200.c | 218 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 217 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/bcm2838_rng200.c b/hw/misc/bcm2838_rng200.c
> index a17e8f2cda..bfc40658e2 100644
> --- a/hw/misc/bcm2838_rng200.c
> +++ b/hw/misc/bcm2838_rng200.c
> @@ -8,23 +8,194 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/misc/bcm2838_rng200.h"
>  #include "trace.h"
>
> +#define RNG_CTRL_OFFSET                      0x00
> +#define RNG_SOFT_RESET                       0x01
> +#define RNG_SOFT_RESET_OFFSET                0x04
> +#define RBG_SOFT_RESET_OFFSET                0x08
> +#define RNG_TOTAL_BIT_COUNT_OFFSET           0x0C
> +#define RNG_TOTAL_BIT_COUNT_THRESHOLD_OFFSET 0x10
> +#define RNG_INT_STATUS_OFFSET                0x18
> +#define RNG_INT_ENABLE_OFFSET                0x1C
> +#define RNG_FIFO_DATA_OFFSET                 0x20
> +#define RNG_FIFO_COUNT_OFFSET                0x24
> +
> +#define RNG_WARM_UP_PERIOD_ELAPSED           17
> +
> +#define BCM2838_RNG200_PTIMER_POLICY         (PTIMER_POLICY_CONTINUOUS_TRIGGER)
> +
> +static void bcm2838_rng200_update_irq(BCM2838Rng200State *state)
> +{
> +    qemu_set_irq(state->irq, !!(state->rng_int_enable.value
> +                              & state->rng_int_status.value));

If the RNG is disabled, is the interrupt line still asserted?
If not, we need to check the rng-enabled bit here and also
make sure we do an update-irq call when that bit of the control
register changes.

> +}
> +
> +static void bcm2838_rng200_update_fifo(void *opaque, const void *buf,
> +                                       size_t size)
> +{
> +    BCM2838Rng200State *state = (BCM2838Rng200State *)opaque;
> +    Fifo8 *fifo = &state->fifo;
> +    size_t num = MIN(size, fifo8_num_free(fifo));
> +    uint32_t num_bits = num * 8;
> +    uint32_t bit_threshold_left = 0;
> +
> +    state->rng_total_bit_count += num_bits;
> +    if (state->rng_bit_count_threshold > state->rng_total_bit_count) {
> +        bit_threshold_left =
> +            state->rng_bit_count_threshold - state->rng_total_bit_count;
> +    } else {
> +        bit_threshold_left = 0;
> +    }
> +
> +    if (bit_threshold_left < num_bits) {
> +        num_bits -= bit_threshold_left;
> +    } else {
> +        num_bits = 0;
> +    }
> +
> +    num = num_bits / 8;
> +    if ((num == 0) && (num_bits > 0)) {
> +        num = 1;
> +    }
> +    if (num > 0) {
> +        fifo8_push_all(fifo, buf, num);
> +
> +        if (fifo8_num_used(fifo) > state->rng_fifo_count.thld) {
> +            state->rng_int_status.total_bits_count_irq = 1;
> +        }
> +    }
> +
> +    state->rng_fifo_count.count = fifo8_num_used(fifo) >> 2;
> +    bcm2838_rng200_update_irq(state);
> +    trace_bcm2838_rng200_update_fifo(num, fifo8_num_used(fifo));
> +}
> +
> +static void bcm2838_rng200_fill_fifo(BCM2838Rng200State *state)
> +{
> +    rng_backend_request_entropy(state->rng,
> +                                fifo8_num_free(&state->fifo),
> +                                bcm2838_rng200_update_fifo, state);
> +}
> +
> +/* state is temporary unused */
> +static void bcm2838_rng200_disable_rbg(BCM2838Rng200State *state
> +                                       __attribute__((unused)))
> +{
> +    trace_bcm2838_rng200_disable_rbg();
> +}
> +
> +static void bcm2838_rng200_enable_rbg(BCM2838Rng200State *state)
> +{
> +    state->rng_total_bit_count = RNG_WARM_UP_PERIOD_ELAPSED;
> +
> +    bcm2838_rng200_fill_fifo(state);
> +
> +    trace_bcm2838_rng200_enable_rbg();
> +}
> +
>  static void bcm2838_rng200_rng_reset(BCM2838Rng200State *state)
>  {
>      state->rng_ctrl.value = 0;
> +    state->rng_total_bit_count = 0;
> +    state->rng_bit_count_threshold = 0;
> +    state->rng_fifo_count.value = 0;
> +    state->rng_int_status.value = 0;
> +    state->rng_int_status.startup_transition_met_irq = 1;
> +    state->rng_int_enable.value = 0;
> +    fifo8_reset(&state->fifo);
>
>      trace_bcm2838_rng200_rng_soft_reset();
>  }
>
> +static void bcm2838_rng200_rbg_reset(BCM2838Rng200State *state)
> +{
> +    trace_bcm2838_rng200_rbg_soft_reset();
> +}
> +
> +static uint32_t bcm2838_rng200_read_fifo_data(BCM2838Rng200State *state)
> +{
> +    Fifo8 *fifo = &state->fifo;
> +    const uint8_t *buf;
> +    uint32_t ret = 0;
> +    uint32_t num = 0;
> +    uint32_t max = MIN(fifo8_num_used(fifo), sizeof(ret));
> +
> +    if (max > 0) {
> +        buf = fifo8_pop_buf(fifo, max, &num);
> +        if ((buf != NULL) && (num > 0)) {
> +            memcpy(&ret, buf, num);

Copying from a byte buffer into a uint32_t like this isn't
endianness-safe. fifo8_pop_buf() also won't give you all
the data in the fifo if it happens to be wrapping around the
end of the ring buffer. You can rely on it returning
you at least some data, though, so the NULL check is not
needed. So you want something like:

   uint32_t to_read = MIN(fifo8_num_used(fifo), 4);
   uint8_t byte_buf[4] = {};
   uint8_t *p = byte_buf;

   while (to_read) {
      buf = fifo8_pop_buf(fifo, to_read, &num);
      memcpy(p, buf, num);
      p += num;
      to_read -= num;
   }
   ret = ldl_le_p(byte_buf);

(assuming that the hardware spec is that the first bytes
out of the fifo go in the least-significant word of the
result when there isn't enough to fill a full word.)

> +        }
> +    } else {
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "bcm2838_rng200_read_fifo_data: FIFO is empty\n"
> +        );
> +    }
> +
> +    state->rng_fifo_count.count = fifo8_num_used(fifo) >> 2;
> +    bcm2838_rng200_fill_fifo(state);
> +
> +    return ret;
> +}

> @@ -89,7 +305,7 @@ static Property bcm2838_rng200_properties[] = {
>      DEFINE_PROP_UINT32("rng-fifo-cap", BCM2838Rng200State, rng_fifo_cap, 128),
>      DEFINE_PROP_LINK("rng", BCM2838Rng200State, rng,
>                       TYPE_RNG_BACKEND, RngBackend *),
> -    DEFINE_PROP_BOOL("use-timer", BCM2838Rng200State, use_timer, true),
> +    DEFINE_PROP_BOOL("use-timer", BCM2838Rng200State, use_timer, false),

This looks like it ought to be folded into some other patch, assuming
we keep the property at all.

thanks
-- PMM
