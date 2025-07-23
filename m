Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68E0C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 15:51:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uebjP-0003M6-Jc; Wed, 23 Jul 2025 11:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebjC-0003FX-E4
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 11:49:59 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebj9-0003DT-6k
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 11:49:56 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-70e5d953c0bso774617b3.1
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753285793; x=1753890593; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TaLN0Vx3ld9S50gIhbWA/U9as2WkAODr+3HIu10m7qw=;
 b=dcuE4B32irzc8hgzRdffXU9pV9V2R9BTYAQ3bRYBP7KM5mGJKuYDJ8fwrZvhNGd7Q3
 5EQZ/lCotJgmo1S63hYCHtAn1wY7z7yI5PelZ3tQ7MghUHVm39k6Y0rXihB0judBDrDq
 14yIlObQB91g5yk22O+aFJn9l3xPQQXZKcfhVIMDINPyoTTnlDwpQIMaK6aM1rNzRo50
 sRZfYJq/w12Ktf9RAiXUZbm97IUJvwUSZpSe3UwuLSfqfWcD9t0SzOCRlYqyxnwqSi4F
 yG6+S9opCY/4ef7z5pjhZ61wQTlpkw7kzseY6bJg8cKL37L69EDLT71hbPMYZp56/N0U
 2Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753285793; x=1753890593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TaLN0Vx3ld9S50gIhbWA/U9as2WkAODr+3HIu10m7qw=;
 b=gP0aqkX3E9LXieBEshrZTaM5njc8nkQNUjczWG8dzZkEltPooOKZ5cAdZKCvFx03Cx
 ExeMruOtUMadc+Twjc835zU9XayRR/fPek8qiZpj3cGTRgj5FwKTGN5xhRepQIIgFliQ
 XXQOhpugbNP7+75Xpy5alketGgwX9jmOZEytCkMh+8fGJKIvKLG26+b9oHBRclnmDXtD
 irgWUHcsa/IhjtYDCSOHsfzUap8SoeYEBQStlPut/hGUsECjz0yXrmCVzKvIyXMamH3W
 0GH99rSNQF+oSYeEUBmAX86JxKfoN6EHVVpM4GKvmf5WA/vUncX74E1LsbrsxYCRnF8L
 rNGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0dIaBhdhB3wRovb62atPuTa58C1o2IGDRzEIRgUgEqS2yimiWzI/BRS+tajZE3GMK5EJmGA/fkw==@nongnu.org
X-Gm-Message-State: AOJu0Yx+wm9VVYXMKtPzjNF/X46W63dLCHzdaiMXprbg+82iLioX5UgP
 C0wJwRHlLtWRuMO+nwhvsrh0VCn3OB1PUo5H7v9y7vhfdFNQ3tI6hEgy/ebY/RRr5GHuWrbfHGC
 mISgO+DWk2FQtdKAtV/9pBpxRaa9mwkO997GCE0vElQ==
X-Gm-Gg: ASbGncscg3pez7h/t7kTZCjBT9+ezB0dN1Sr/oTt/4y1MoWcuuqA3kzYfh+4op+8foP
 lHKa8iDumHvLL7KwsYgbOfBcikg83mCzsWtpq9v6UZP8Sw+BTm0zipn1KR/QQvwGuAoXb6lYSne
 JMAJ52awtI8QBdempDm4Dj9JVpXIwpNTAEqJyytgHhlxiMeeo5onMidfrp/6F68CSPWp3WRtjVR
 eEvUGlV
X-Google-Smtp-Source: AGHT+IHUMaLXihYYm/GtmbmxwfleLM+GAJGIjg6BT9jUhejfSgXiXBzh/vgxifEj1rdH2yOyQ58Og3PbU/yljxbeuHc=
X-Received: by 2002:a05:690c:b14:b0:70e:142d:9c6e with SMTP id
 00721157ae682-719b433a10emr45716827b3.32.1753285793344; Wed, 23 Jul 2025
 08:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250723135156.85426-1-philmd@linaro.org>
 <20250723135156.85426-2-philmd@linaro.org>
In-Reply-To: <20250723135156.85426-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jul 2025 16:49:41 +0100
X-Gm-Features: Ac12FXwDgegYZc9Bg5loOWYI3loOQ00j_NZBMSC6OLdDgt2Ll3hlHe4WGcYPJiY
Message-ID: <CAFEAcA-HH3pyWv4sF6ujLFdMAhtYV8H0TxjJ1Z6myHu5hbWusQ@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v4 1/4] accel: Introduce
 AccelOpsClass::cpu_target_realize() hook
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Wed, 23 Jul 2025 at 14:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Allow accelerators to set vCPU properties before its realization.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/accel/accel-cpu-ops.h | 1 +
>  accel/accel-common.c          | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.=
h
> index 0674764914f..9c07a903ea0 100644
> --- a/include/accel/accel-cpu-ops.h
> +++ b/include/accel/accel-cpu-ops.h
> @@ -34,6 +34,7 @@ struct AccelOpsClass {
>      /* initialization function called when accel is chosen */
>      void (*ops_init)(AccelClass *ac);
>
> +    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
>      bool (*cpus_are_resettable)(void);
>      void (*cpu_reset_hold)(CPUState *cpu);
>
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index 850c5ab4b8e..eecb2a292af 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error *=
*errp)
>      if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) =
{
>          return false;
>      }
> +    if (acc->ops
> +        && acc->ops->cpu_target_realize
> +        && !acc->ops->cpu_target_realize(cpu, errp)) {
> +        return false;
> +    }

You don't need to check if acc->ops is NULL here: per the
comment in accel_init_ops_interfaces(), all accelerators
need to define ops, and we would have already crashed if
it was NULL.

thanks
-- PMM

