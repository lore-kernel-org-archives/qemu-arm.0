Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5316908lft;
        Thu, 7 Jul 2022 01:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1udX7s4f/aMQETSevJe3flHR/mBKDEaq43mipHoIJwKWF1mQ0XYOjIPmGSPI7ixpUJO14wr
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id i8-20020a0560001ac800b0021b92398f28mr42262001wry.517.1657182760314;
        Thu, 07 Jul 2022 01:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657182760; cv=none;
        d=google.com; s=arc-20160816;
        b=F6qS2e9jh8CsPsYOX+9m8lbqtTCP34B7zKRiiRjCEOtV2xjqrwpoV5uTlFPtWBzakh
         IkONwPM/eHwGI6F1da+QmbT8kGyZz7o+sbnbrjKVVJLX91scnXNGNsoXSTE4kE+35D94
         sB0LEity+z7cOrG/IDdg0nuQfS9156T71IMRoQm+Hf5tMom74Ph8eXtepAPPdbilhcMt
         vQCWGDIUO4ljwCJLt61xxYZjMXipp+W8Vty3Vy0WAEjWb3VCf0jJFD9z933e3oFQwfsm
         vjHJBLfiaSpoU6li05oi5VMEJ10reg+HAn2zgNMq18CTkgTUdrlH/mLmmYc5HoTrV58F
         WG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X6ZqWm+8gfZ38fRuEbFy9FTJdrbiR1mJzW6B0QcDN4E=;
        b=KN7Z66Q9uMjn9gH+Pq2O02uO4IARccWEB+BilyjEmXtcnNJek7UahrW/5P5o7/15pJ
         PM798I+hpFq8+tulkuyHdQG8D9pun9LdplrYMvz6/mKncWql7j4LHYrtbviHzfZqPRIV
         9roMYlJOar4aWeUL79xrgbUpt8RvdZpSBpLzHVOKTLvd13avwBa1VhmKduEK3cwrB5yp
         FRR+vwhH5LNrZvhPAw0DsiaUldTPVUKgPu+d3POFlSVbHE8X6hVN5Umuwo2lOsAspKjQ
         kPSYge2dWzmdCvzrYxvBaWnyYzsdf+fCLhySleqMMFFyOYerdgbLP9AvmttpC4Xfn43v
         Kcvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=inQk1oJR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a05600c35c500b003a03d29b6f7si27495232wmq.58.2022.07.07.01.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 01:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=inQk1oJR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9MwB-0002Ht-55
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 04:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o9MkH-0006mZ-5x; Thu, 07 Jul 2022 04:20:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o9MkB-0006E3-Ey; Thu, 07 Jul 2022 04:20:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id r14so19411647wrg.1;
 Thu, 07 Jul 2022 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6ZqWm+8gfZ38fRuEbFy9FTJdrbiR1mJzW6B0QcDN4E=;
 b=inQk1oJRFjUec1pdXDIj/USBDRMJ/8n/GiPtBWcVi2NQo3hnmD7piwO2aaeDX8bLLa
 vsuksi4ysaeyWow8Mv6IsdyG5mM0bBBWw5d0C+nLtkuZuZ7osTrj4vGiif5+yoYJm39p
 vsOm5Z48A9fpPlGZ1bNBDCdyuqJHaOCAQ+aKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6ZqWm+8gfZ38fRuEbFy9FTJdrbiR1mJzW6B0QcDN4E=;
 b=wQFI7vzgFFrxK0EI1ltQFxbHY0cIgUSXIz2KGPS4EiQ8Cxa6u101o2H5lDEC7PMm0s
 IEx1R6etMweTEA003cJx9j4OPVuWEIKrxYlw33vJB9EBRoPUxHg4hzptp17wDpGUt5MD
 nbZ/RaXE1YrwFuFKSBXqjKm6auz+lcwf3K4lZUdyjUr0n8nkpgbtzvc83gLvrxbfS75Q
 tLahMmjLgmnFoyGjO9JsK3vwj/omRv2pfEEWGKM4zYjHKN06SQkESzIB5huZzMnEq5PW
 U2bW/CGiAWRojhR/DGVUA713hI/V6Gz/Q51ehRPZ7y/Kj4vhiDM+m8R4vR83C8Q0AFSh
 CmOg==
X-Gm-Message-State: AJIora+Woea0FzjTWDsvhI+0OkINJrV+KX9LsZoVOTES+8YGTmAeTXPd
 Xd1dJHdgEJePj9YhRV1tbK8ysQUSJrbOSnx50a8=
X-Received: by 2002:a05:6000:1446:b0:21d:2245:ab65 with SMTP id
 v6-20020a056000144600b0021d2245ab65mr41101046wrx.315.1657182013434; Thu, 07
 Jul 2022 01:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
In-Reply-To: <20220707071731.34047-2-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Jul 2022 08:20:01 +0000
Message-ID: <CACPK8Xe-BXFt7oefdO-QS67tQSRP6arzgnGO973MYDYOMrQK4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PdEihp2o5kpE

On Thu, 7 Jul 2022 at 07:17, Peter Delevoryas <peter@pjd.dev> wrote:
>
> It seems that aspeed_gpio_update is allowing the value for input pins to be
> modified through register writes and QOM property modification.
>
> The QOM property modification is fine, but modifying the value through
> register writes from the guest OS seems wrong if the pin's direction is set
> to input.
>
> The datasheet specifies that "0" bits in the direction register select input
> mode, and "1" selects output mode.
>
> OpenBMC userspace code is accidentally writing 0's to the GPIO data
> registers somewhere (or perhaps the driver is doing it through a reset or
> something), and this is overwriting GPIO FRU information (board ID, slot
> presence pins) that is initialized in Aspeed machine reset code (see
> fby35_reset() in hw/arm/aspeed.c).
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> ---
>  hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index a62a673857..2eae427201 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
>  }
>
>  static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> -                               uint32_t value)
> +                               uint32_t value, bool force)
>  {
>      uint32_t input_mask = regs->input_mask;
>      uint32_t direction = regs->direction;
> @@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>              }
>

Reading this model hurts my head a little. Perhaps we also need to add
a test for this case to make it clear what's going on.

The test above the code you've changed does this:

>            /* ...and we're output or not input-masked... */
>            if (!(direction & mask) && (input_mask & mask)) {
>                continue;
>            }

For clarity, !(direction & mask) means "is input".

The comment confuses me because it says "or", but the code has "and".

input_mask doesn't seem to feature in the Linux driver, so that will
always be zero. The test will be X && 0, which is always 0.

If you changed it to || then we would do the test that the comment
suggests. When the pin is input, we will skip updating the value.

This will solve the bug you had with your input pins being reset. It
won't fix the QOM case, but we could consider handling that separately
without confusing the logic in this function.


>              /* ...then update the state. */
> -            if (mask & new) {
> -                regs->data_value |= mask;
> -            } else {
> -                regs->data_value &= ~mask;
> +            if (direction & mask || force) {
> +                if (mask & new) {
> +                    regs->data_value |= mask;
> +                } else {
> +                    regs->data_value &= ~mask;
> +                }
>              }
>
>              /* If the gpio is set to output... */
> @@ -339,7 +341,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>          value &= ~pin_mask;
>      }
>
> -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> +    aspeed_gpio_update(s, &s->sets[set_idx], value, true);
>  }
>
>  /*
> @@ -653,7 +655,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>          reg_value = update_value_control_source(set, set->data_value,
>                                                  reg_value);
>          set->data_read = reg_value;
> -        aspeed_gpio_update(s, set, reg_value);
> +        aspeed_gpio_update(s, set, reg_value, false);
>          return;
>      case gpio_reg_idx_direction:
>          reg_value = set->direction;
> @@ -753,7 +755,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>              __func__, offset, data, reg_idx_type);
>          return;
>      }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, false);
>      return;
>  }
>
> @@ -799,7 +801,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>          data &= props->output;
>          data = update_value_control_source(set, set->data_value, data);
>          set->data_read = data;
> -        aspeed_gpio_update(s, set, data);
> +        aspeed_gpio_update(s, set, data, false);
>          return;
>      case gpio_reg_direction:
>          /*
> @@ -875,7 +877,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>                        PRIx64"\n", __func__, offset);
>          return;
>      }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, false);
>      return;
>  }
>
> --
> 2.36.1
>
