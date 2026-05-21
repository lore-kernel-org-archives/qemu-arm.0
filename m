Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A523CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:16:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4By-0006BN-OS; Thu, 21 May 2026 10:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Bl-000688-RO
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:16:01 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Bj-0007lZ-P0
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:15:53 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65c477a3278so6514613d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372950; cv=none;
 d=google.com; s=arc-20240605;
 b=hLBPblBJO0qaTn7equQ2THfB0381taa7D5wl+eNYqf83w2Oq4chGz3fWt2dj6NDf8q
 1qudlNMB/mmrwLGn+eDHOKwTDHSjlfG8zcKmaKQ5zszMR/gaXuxDF5eigT5gLYqT2c6V
 OIT5iOEojfRnCJPTxp6tfhLSi4AjsYPur0rdirglkI3rf6YZne17DwSD7rGJoO/AaOjZ
 FWgLVio0YEmcCHEfmnPcnTnmWr28v91nh908d6x2xfWLoLkm9n74oxBUS7y4Hcf7tnIq
 rVKZ+czGUNbdIpe4JE9+xeAy1wto2nIWAos0QY/7dvnsx1TNXB2pE3CGDwjlgz9DefNq
 TKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=i3SZX9b3XBKzh8GrCno8uBWd6Z6M7n+j+/60T4uS5pk=;
 fh=9lUv8xrhlij1hV7TMljHgy+gwEClQnRdUKC4k2mR0k4=;
 b=ZPgGg28uiKKz0oGkcsNu//Av4Q+pS1XgKbFp4Nn7BeN+4oKPpKEqvyvRcX9wX1gygm
 9IvxBUiZsQOe5dbSSxx/5IuM3g7P+pk1+a53DdNmbIp4es3JFxZJabcxCPeXhbjS4YjY
 ONxD+dY6bDd0+uS8vyj6GKfkWU+b7xSRHt4kG4uYr9IqxpL1CFX315KoD0LTkNunO6bP
 Cr/riBGDe0MGSf8Scg3p2pQ5OVJC0Kh68+uaa9WXFVVTd0sT7LI8ga1afbiTXV0QBzkO
 LBSSDP+0Ia+Tk8Vwosfp7ZnzdOTUBiExIaC4cC7YU68RA2gWzY7oi7eT3sgqggusiK2L
 ehcQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779372950; x=1779977750; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i3SZX9b3XBKzh8GrCno8uBWd6Z6M7n+j+/60T4uS5pk=;
 b=OtGS2a9EObGoKz7b27NXgRZAsMP1AaR93lPm5h29snadveXTZI9oT5HdMzOixdHMPC
 GRpGfZTtri+c2TJJm6cRTY7DSTb45YLG3ci50EUxQ4UKITswuefA0ciqA6HDTGShDsA2
 Vavf2sDFPfZ2TppPQ2po4Eca28Hh/SQSflPel8Ttz6gRkt5MpngBdASuxw4Y1UbnagGX
 Tr+bIuEpwJAAxM789bqT6hAxAqIvFvO/9naUvpoUfEpBWnumQg/hGBde1ytotu6UQURM
 ZLr1XOouxy8wLQLqIeMqy6xqPkLl5vAtqtuwGrTCAvWAbrEqHEkDkZr/lDTg7jKeG+t+
 kWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779372950; x=1779977750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3SZX9b3XBKzh8GrCno8uBWd6Z6M7n+j+/60T4uS5pk=;
 b=g0H8zhNwvZci4l1odSHZ0q/FnGOeOG4lJoASxM8MzfBONqv+LM6pd/8bLpAltWPC92
 fYki87WrkBBnUXOTnpjjiC7n7cvpWKkmqhpzO7A49aC1aNb/Qz1sStW4iunJx0U3/LQB
 2cLuwI5lyZApf1imQo/nGdnYtrcv/wD6C/5TuWlyrjA+8nkQF+jeQPqGZdHGVOzuxZOH
 FxRx8LjPhis29Z3S8fL9EEzXlH0bNh514uodonapPQpTUoD/3CWVcbAVuPzTr08/Z3sm
 +WZ35+V3lup6OqrNmB1EL6pUxA2VXqxCuxXmM7PaQlAzTxNbQ9M4x8HU49KwAC9/F/It
 kaPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+g6NJLDmjXWPCC6UlpZgly/NulC9CqSF04bA3HzuUos/VfHRRSAEuYHMQTMTEwYHBc998+Cdmsw==@nongnu.org
X-Gm-Message-State: AOJu0YwsJk4SyFYZzdzm89lVUbWI2WRXEDcISljW6s/3v4r3cfOwToXh
 iwrPksfxgqYjO1HJtBnOkFIIltu7IYwVqvKDNKXk9/ek3qYdcRAciuLT/VxIAIl7r1fQ+JHJ8IH
 v0CwfEnZXJ9YKkUYYQNPYj7XiRPcjmiXws1yDq23U1C6dMhMlMw17
X-Gm-Gg: Acq92OGOYs/9yHuSD56BBgEixH4y8fT5M+qCgUe2laFEgpLLn3/gfQIfY9tvxBEIuX7
 73EhQNkM+a28LbfcNxEzFj5GPrblPaJf3VyCGAfxGP3kA8mI22MAtj4FgPoM3VDyJPIzGsA0lM3
 C2q37x4VIs8de6+I1npuzX+A+Rft2r0U7BH0C7/fw6IMW5bpkRYPUtpFB9nLKoZ1hyh9BV6JZ81
 tKJ1rnXQCjTiEygxthwIRsMOGhOrYDKDnxDFvc8tkm2oqSgDP8rsmU80f27QtyDzE3ONsFSKrgT
 6y7pKd3lvQrLCqw5uyO7J0dqbDxDkzxEj3SbJFyvBMzoRJc21p2UYoFHcBFELmCT/4c=
X-Received: by 2002:a53:acda:0:10b0:651:bc7e:4687 with SMTP id
 956f58d0204a3-65eae1fea17mr1960145d50.42.1779372950484; Thu, 21 May 2026
 07:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-11-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:15:37 +0100
X-Gm-Features: AVHnY4JJIhNEtLHBWSs3DG-Foho0SXBp8_N9_pC3NqZf1GCRUvHdYshyAuGIhDc
Message-ID: <CAFEAcA8ibw4o3R6eJdtupAc8o0Tk2N5iWahDHwbuCdoCLKK5CQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/64] target/arm: Enable EnFPM bits for FEAT_FPMR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 20 May 2026 at 19:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ae1dd42dc4..7eb7031294 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -787,6 +787,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          if (cpu_isar_feature(aa64_mec, cpu)) {
>              valid_mask |= SCR_MECEN;
>          }
> +        if (cpu_isar_feature(aa64_fpmr, cpu)) {
> +            valid_mask |= SCR_ENFPM;
> +        }
>      } else {
>          valid_mask &= ~(SCR_RW | SCR_ST);
>          if (cpu_isar_feature(aa32_ras, cpu)) {
> @@ -3973,6 +3976,9 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      if (cpu_isar_feature(aa64_gcs, cpu)) {
>          valid_mask |= HCRX_GCSEN;
>      }
> +    if (cpu_isar_feature(aa64_fpmr, cpu)) {
> +        valid_mask |= HCRX_ENFPM;
> +    }
>
>      /* Clear RES0 bits.  */
>      env->cp15.hcrx_el2 = value & valid_mask;
> @@ -4046,6 +4052,9 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
>          if (cpu_isar_feature(aa64_gcs, cpu)) {
>              hcrx |= HCRX_GCSEN;
>          }
> +        if (cpu_isar_feature(aa64_fpmr, cpu)) {
> +            hcrx |= HCRX_ENFPM;
> +        }
>          return hcrx;
>      }
>      if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_HXEN)) {
> --
> 2.43.0

I think we also need arm_emulate_firmware_reset() to
set SCR_ENFPM, so we get the "emulating EL3 but starting
guest at EL2" case right.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

