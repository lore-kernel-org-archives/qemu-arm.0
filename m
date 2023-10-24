Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2215800ejb;
        Tue, 24 Oct 2023 10:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcvzWDyPiy15bIo26R9zAo73Vlq9yQpNrKQ+8UitVPY27ObZg66Q8eDa4vY7OiZQahEZen
X-Received: by 2002:a05:622a:281:b0:41c:c3ad:922d with SMTP id z1-20020a05622a028100b0041cc3ad922dmr14925003qtw.52.1698169596356;
        Tue, 24 Oct 2023 10:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698169596; cv=none;
        d=google.com; s=arc-20160816;
        b=LWRMyBfVffWBJo7NSBPG2BZ7h6bKJylpBLv9UFplgwfpccw7pVe0bR7Reh8faLx51/
         2MQ4oEKgSRuAWeBkkeVl2IVgSeraZMErtjF5c5liNBztwJY35tzc1vbBGC1QIDku1UFI
         LjcTxKYyWm3sYvUSwzZjJJJAvl7RuYlxbFo/GsbmUuvM6+Tqylv+em/1HHal1nzMYxbL
         5l9PHf7f8ShmohQiLLiZA3tYl5fJFeIeVBBvT3EQCKIQslYuR3Vnj3PR3TM443Gcyn+3
         gVpr98rZmA8pE+D/sdowgeuKL6k32k8PvOZ+XTRRuCDPIKLuOovIQ9TzkS222arusMJy
         xKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HOrDbc0nM6QgTDLV84pYjI62RbgxYMi5tMwl8lyeQpM=;
        fh=8ZvqHR4zlDjBTNficCG8AmY6zPuCjMlCgUWPFQllnqw=;
        b=aGLVoeE11KND72UkFKnE0O7elHGk6Pq1gmiN60H7TejQV1coNgflwqn5Q4M+xTwbEJ
         O7RgtaghEZmrd6yDtycKOlvYt1cp3Y2RMiLezITfbpj/wUjueCyZNQ9cuyQLEy/UvFTF
         hIkhOX4yVP1EKJt2qy1dqJc/+Q1jaQUxplaMcBeI90lAk5zG0VXamAIe6Ak4V3CTH12s
         HSDNbb46qpeFYfcE6RfcW0Gqq5KVMiV7BZvPCrZjcas1sd5yybvU+Hy5IGzoSRnVQgmh
         XpcayL5ICGmi7OaiKrFVqOhxgmIB/prFJDJVfPuRq+b51RhA1eQnGZU06pwpvdkPoUcu
         IP0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNUXMhM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020a05622a031500b0041814926f4fsi7775377qtw.91.2023.10.24.10.46.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 10:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNUXMhM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvLU6-00086Y-NZ; Tue, 24 Oct 2023 13:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvLU3-0007zX-90
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 13:46:28 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvLU0-0006bS-DE
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 13:46:25 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54041e33845so4193046a12.3
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 10:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698169582; x=1698774382; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HOrDbc0nM6QgTDLV84pYjI62RbgxYMi5tMwl8lyeQpM=;
 b=rNUXMhM4NlKa+0LOpuAumsjviRKIjv4vcoxnw7k+dR68HBsvc736kdx5FbTV9jebjy
 /vrOJ96qFY8a0P1U3Y5kSYHpjF7pF0VLOyOnszVgp/okEdu2jpLZqvZu6ISd5yX6DPCR
 hreHACgu5U3JPRpixl75PX2rQBZvZ4lG8EDDa4PV/pSVZ69tHG/H7mUZSQ52P2EB0UXf
 k+XnUSdCj2E1hft/bAAnHiRfCvQxbtu3aSI8e0mHrc0yW5iOTLAhPFniPw6KC4yD4NxH
 jzs16M7sGiwzsV/aXO1dBeQmZsamEKJoIAsgFL34Qtf5fWW8jIhi4yOtO65tNHj9sQ/o
 nPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698169582; x=1698774382;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HOrDbc0nM6QgTDLV84pYjI62RbgxYMi5tMwl8lyeQpM=;
 b=pPi90tZvJXpQsBVsaQUvq9qc9qmIcU5HhQE2fd8FLkjQRpNE6ZNQ9Osi4jJN+iaVUW
 QD90IkFRco+zs/1a7BHN/Npk+dll/X80ahVrsw1K/8tJY/VVzBMlw+P2HQ+s9lkLTJ8k
 TMgLQ8gm5rvjnwtfIuBkaZhyg2/8QyqMEXtjlKvvhupKgZMcAW2assA5QBEFSxZjYYAm
 MvTrytla9HM2TAfggZgfTX/pPVZnkVCaEIKzbpgWpy7jBraqbnytVYHSeCYD3D724IV1
 MeUHvvV+0K5Js3jo8ssl58XUNH7Sq4J99114pTrzL3YLyR7RCCL3TpXQJCo2TuQDvsZl
 SMVA==
X-Gm-Message-State: AOJu0YzJdaeVPXHaxvXdzjW6WJCm0y19zKowUw1wnU5qGJ8ZG7tT0XcC
 gV6y8sHMFEeZC2XIYK9ae2OWNP4da6QgdL8XJUYGjA==
X-Received: by 2002:a50:ab12:0:b0:530:7ceb:33c with SMTP id
 s18-20020a50ab12000000b005307ceb033cmr9300084edc.4.1698169582329; Tue, 24 Oct
 2023 10:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231024173923.4041874-1-milesg@linux.vnet.ibm.com>
In-Reply-To: <20231024173923.4041874-1-milesg@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Oct 2023 18:46:11 +0100
Message-ID: <CAFEAcA9ZLk7XYpjOQ-_9JXELK_qjgW3ABmpHY=aiPa+DS-131A@mail.gmail.com>
Subject: Re: [PATCH] misc/led: LED state is set opposite of what is expected
To: Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org, 
 andrew@codeconstruct.com.au, joel@jms.id.au, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: PdVdP/2iiPUy

On Tue, 24 Oct 2023 at 18:40, Glenn Miles <milesg@linux.vnet.ibm.com> wrote:
>
> Testing of the LED state showed that when the LED polarity was
> set to GPIO_POLARITY_ACTIVE_LOW and a low logic value was set on
> the input GPIO of the LED, the LED was being turned off when it was
> expected to be turned on.

It looks to me from reading the code like the bug is there
for active-high GPIO as well ?

> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---
>  hw/misc/led.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/led.c b/hw/misc/led.c
> index f6d6d68bce..96cad7578e 100644
> --- a/hw/misc/led.c
> +++ b/hw/misc/led.c
> @@ -63,7 +63,7 @@ static void led_set_state_gpio_handler(void *opaque, int line, int new_state)
>      LEDState *s = LED(opaque);
>
>      assert(line == 0);
> -    led_set_state(s, !!new_state != s->gpio_active_high);
> +    led_set_state(s, !new_state != s->gpio_active_high);
>  }

Maybe "!!new_state == s->gpio_active_high" would be clearer?
Then you can see that we are (1) converting the int new_state
to a bool with the !! idiom and (2) we enable the LED for a
high input and active-high GPIO.

thanks
-- PMM
