Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF9CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:15:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtKL-0004Yn-PZ; Fri, 15 May 2026 10:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtK3-0004Nj-KP
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:15:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtK1-0005Ml-Is
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:15:27 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-44ccbd3290aso7593654f8f.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854523; cv=none;
 d=google.com; s=arc-20240605;
 b=CBmQT1Z7bUOa2aNbd4PgSc+UrA83ACVwkN/BqFdSrfx5EyP/ZTWVZTdRRpGFHSkOhv
 q3zW+dTt/HyTtuG3kBOUsL3N5Qi/g+kkgo6xEsuaaSRN1K2g7hMmoi7Sv4hk0EsCC032
 eDy5hyhNsnn2lSJYnM9uD/DRR9dVmu/CXqeIZ6XGQGsQK376Mj9p5KC3itnqt1TPGmB1
 k6A+iT74HsiZZA9qsAXohYaaFXRa/h/GZYllSojGJ2aqMsJoiwNJNdijMNJ7Y9lH0NEO
 P2Zb7ZJF2AOzUeKFBxFp4Y84sLEtOou7Yb+fSOAMFwmbB2IrvIApJyAFWcDC0Yyy69Wb
 LlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KpXZHB+kDlNhT0NyY42JfPpcBVeskn/dfBQ3/alXHXU=;
 fh=4jh/7NrZWcqf/NfGzMX//Y/nCzhLFNeupMCjAL/peLE=;
 b=VMEDgPPMM7ZBkKJaziSUV1CSCN6Uz2BsipmYNY7wKAbr92Qin5ACCqjGgAdcctlyc5
 UcwhQB5QewMFUPMUDw27KUMuoru4F7GEpCtj1IoU/TX8iLwDLnTlV1C6uFYX8Je0GJBx
 oQI64fAbtcKfGJ0RO9BnG7nrELf/Xs3YR7SMhLhxbxYsOl6z81PhQUaVywfhHDjzeFw4
 Pzu5MGUOyU7zCLmL+AJWTPSqC+ytp5HvfKq8EX/51dBlklXLGpyA8ocUw5uMiwkkwzxr
 GDiYrzBjFKxlgLFDOziR0JTZ1+Njfkc5dAaOY+1+M9b3qy37kKZCqj+l6b3ZplMdYync
 L72w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854523; x=1779459323; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpXZHB+kDlNhT0NyY42JfPpcBVeskn/dfBQ3/alXHXU=;
 b=MD71SUcqW/QN8lV5kDnCo5lTj5Oyjlg9N8LxNA73+tiKVZuQXTGTFSNt5wfMLYnXc2
 mH6eGtmhm48IvF96JtLpu+eKDwR/n8pCBOZoY9ddFtKZw/pSDXAZJgM5GiFPR9eYBKxd
 xpCTaN484Ow5Lhn2e65QIaMh0/d22RC6nqRaW5pGkKInj0sOMU93aovdF9glL7ua3Tln
 7MXtOS7pXQY1tYHPW2JPD4pWUA92EgP/3gJx7P/8CaCHzZOSreSFl7JN1JrIGnXWfMmk
 d4ObxLtGnG3Ne+HLWCtsuMtH6qWbE0umUSTPHZIpYhzrbMODr9ZzTG3Wrd0Swxc5UU+v
 B5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854523; x=1779459323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KpXZHB+kDlNhT0NyY42JfPpcBVeskn/dfBQ3/alXHXU=;
 b=DdJHX4NAoXegRc/+Ifaxn/BoziHPDs6rrwxUgzuuPcsglhf+f0ml1wIdhHqzGgDqjR
 tf0fGIwfaQ7ItQiOpubfnfQtRWIiWqhwwmfEGx26DO7s6h3IQxQn5uEtd8EyAcYDMwD3
 pOw3SJcyM0pqtnEMbOj3uBaTDouK8r/yxS/ubs/AhWq00USgNKN6yqs2/lulf2pKFX5i
 PGONymwVfDj+5iPwDlOWezWqba32I79JMVO+gNxI/WiyUrbVjLG9v+DflWrsT8hWzAQ4
 AsB4yvqC4d5xxberVkB9z2zrx67U0I0zmMpXqLrt8r4ROtNVjsfYdjC84iZX5iJS3JHB
 jAvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yMXwHdRZ+yI+97PanJftdcYAuqTKPX96zYrsQFONV4LEIttmajXlvk5rABHS7rs/GztmATMifdQ==@nongnu.org
X-Gm-Message-State: AOJu0YzQe85yOBuRDjxX8qquyc9F3QUfanKVqrOgvrt7T08p9sSj3zDC
 hdMGNudBCbS89H/Q4fuUvkgWxiGtgqrXSmJqEMQY3T3bLEbC1jOHxhDXEFVaKEj7dt+sotCUndp
 AtlzL6RdDHDiYa+AZD4J0BPc2YJniLRHwTFuLXS5xaA==
X-Gm-Gg: Acq92OFia09Gf9XSDfRbyf9Sxcf/Sve2iByCaTotvrCX6avcH2SuQNuyoWrv994ZHvW
 n087sht9BjdD3WGh4BxfrBBeTdGgMmzdDBGJ2rUdbxew2Oa0Cs6UGsEjOS4itC9TfHcD844P6G2
 nsHfxynkV126XBZh1Hh7DJ28P60O/QqkM9j6LBfOsry+pqW5vk+Se4Wj16oAiEaZwypsGEbDDvR
 SXg9IuD9PBAhF3kFPKDS654yNj8T1JL2je1MuDu85ZdK+zL8MmfuX7jpu1tXctbqyFoY4i/4O9s
 EshVo7IJsE/090wDI9bgwtCZRuul/KqqdqtU5LX4xcexFgh4QQ==
X-Received: by 2002:a5d:5d85:0:b0:441:2335:ac3f with SMTP id
 ffacd0b85a97d-45e5c59f46fmr5588686f8f.31.1778854523383; Fri, 15 May 2026
 07:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-5-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-5-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:14:56 +0300
X-Gm-Features: AVHnY4IxwooRJB8jhnP3pElR_5TuYYNfIw8UutdaZgwIQDOpOMZH6MnuQbP0Cpw
Message-ID: <CAAjaMXaNxSGQqoRaYr7FFQmH__9HvFoesUd-+h5u8NSnX7VZZQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] hw/arm/aspeed: Initialize 64-bit CPU types
 during DeviceRealize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x432.google.com
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

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
> CPU (Cortex-A35), only available in the 64-bit binary.
>
> If we build this file as common object, these SoCs become
> available in both 32 and 64-bit binaries; however when running
> the introspection test on the 32-bit binary, the init() method
> tries to init the Cortex-A35 type -- although not realizing it
> -- which is not available. This can be avoided by deferring the
> CPU type initialization to the SoC DeviceRealize step (this is
> safe because nothing uses the CPU type before, only the GIC
> access them, just after their realization).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/arm/aspeed_ast27x0.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 87dcb82e1b0..e50125bfeec 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -418,11 +418,6 @@ static void aspeed_soc_ast2700_init(Object *obj)
>          g_assert_not_reached();
>      }
>
> -    for (i =3D 0; i < sc->num_cpus; i++) {
> -        object_initialize_child(obj, "cpu[*]", &a->cpu[i],
> -                                aspeed_soc_cpu_type(sc->valid_cpu_types)=
);
> -    }
> -
>      object_initialize_child(obj, "gic", &a->gic, gicv3_class_name());
>
>      object_initialize_child(obj, "scu", &s->scu, TYPE_ASPEED_2700_SCU);
> @@ -701,6 +696,8 @@ static void aspeed_soc_ast2700_realize(DeviceState *d=
ev, Error **errp)
>
>      /* CPU */
>      for (i =3D 0; i < sc->num_cpus; i++) {
> +        object_initialize_child(OBJECT(dev), "cpu[*]", &a->cpu[i],
> +                                aspeed_soc_cpu_type(sc->valid_cpu_types)=
);
>          object_property_set_int(OBJECT(&a->cpu[i]), "mp-affinity",
>                                  aspeed_calc_affinity(i), &error_abort);
>
> --
> 2.53.0
>

