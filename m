Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDFFCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 16:09:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3zNt-00080J-I4; Wed, 01 Oct 2025 12:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v3zNf-0007tS-LM
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:08:44 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v3zNT-0003bE-A6
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:08:37 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-71d603cebd9so770287b3.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759334897; x=1759939697; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uhjImz1ARsjEJI8cAqVGDV5ReAvP4bsdRzz2Hi4V9c=;
 b=J/DL6Qekw3kALfj8U0KZyjh/WK5rgRPYQ6KzGhfJkejyZzvAijxxa3vcT1b0KNaXyc
 TDdeBPOfGb6BKO9r4RbxqYUuxEz5xsBIg+XUwC8o2bTcZU93QTuLUvBkMJMOFJjdaR52
 x+HiV9UkL+yoNVrRldvMg+pUOciydQA8oAxf3saELTRq9A0wRj7BjUuKNGHvsRAjFyKx
 daQHuPuHpsVG0odQ+rXUfO4QTnjgVfS1YzwbLt6hy6eE4En0hAL7xV7//m+jHHI2/EJq
 Bl9EJ85Sa8ilQsmMeZ1WwDnHQtH0leCjVwFIGYq8NpJ9j1ebXixysRLgOv3ZdtzM/mL2
 VCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759334897; x=1759939697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uhjImz1ARsjEJI8cAqVGDV5ReAvP4bsdRzz2Hi4V9c=;
 b=g0bIrKWTwodNVzkUdW4vWW+Vkz5IxR2Ky+tfLMvgzhDa99COiWq8zuB2vM17Z8MV3F
 dakAbMoFlFpoLvlR55t8+WfmgyDCEHPIjnOE8tjXffWYpV3aN5dsHBx3KAruEo8VMutK
 Va+p27hsnX0NXho8VwR5RksnMYnQ+KFufP2g7MA1EboYpkzRMX420tnNMm33Hwm1SEoM
 cJy3rnm1SYIa1s2GXJZ8kHPEasOzDZo+DkzxwDc43XYI09nVTra3+PnTLXp0xRyZJ008
 eKxtccWxskWDFmIHhZvBP3uWXImgzOnshGsKhG23ZgK99m6EJRYaTErHbsMjEvRXKnXh
 KsGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEbELbB6tEiVBsN6DQXoZZEJqcOuuPpX6RoWv8ff3dv75VJsvGpXECMGQB7DWv01++0uYwfwPwaA==@nongnu.org
X-Gm-Message-State: AOJu0YxyQkbB7LjNq5rrY3A/s3X8uYQwaKliqKdJkZcJtcF0ECaszxkZ
 R3W8vgulygYjTw74BRh2QOMg2G//99xoAjTcRY9dD73guxGhmQ6tc1cW/m+iqjsa90SpRqjRKGS
 tsgXuWB/FqIPFJS43XceropWKXOIV6Ge67EoBr6jP8g==
X-Gm-Gg: ASbGncs4812Qo4DM5x61JYRZzVINdzOU1NN5Eu/su+FR7KWm8uP5XejZK4BC+jvPMWR
 6xGsBsJGwPwNYK2O7EV+UCwj0cy0DThXadphRA/pn/xA6GPc2Nvrj8ALYeyPR2snhPK3W3R0BFP
 +k523lYj/hCDTeje7tJXXyHxJUif/WCIYgRvFPZD7scgeslzPDg+eHuhhla/R4PvvXNiWhfKmp1
 W6xpYvtsS2522qGp0W5MVvCxi+Y5wh5BBXpK1OGDfk=
X-Google-Smtp-Source: AGHT+IHoYmujh+ngr61sUEQChrIjRT7eIMmc3+Maq5QgQ/YNihIQq6LdvIUOvIYoA0mpB6KXjQYBWJm1phxDB5HlVF8=
X-Received: by 2002:a53:db09:0:b0:633:aff2:d73 with SMTP id
 956f58d0204a3-63b6fec8f93mr3901206d50.5.1759334897047; Wed, 01 Oct 2025
 09:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251001150529.14122-1-philmd@linaro.org>
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Oct 2025 17:08:04 +0100
X-Gm-Features: AS18NWCCjl9FtX38MysgzZN9RRCNI1ODO31lSIAWe3O_HbUNCUneU4cyytbeDdM
Message-ID: <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 1 Oct 2025 at 16:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Instead of using the convenient @CPUState::as shortcut, use
> cpu_get_address_space(asidx=3D0) to get the vCPU first address
> space.
>
> The goal is to reduce the risk of AS mis-use for targets
> that uses multiple ASes per vCPU.

I'm not sure I agree with this. The cpu->as is handy for
the large number of targets which only use one AddressSpace:
which is everything except arm and x86 right now.

Targets that use multiple address spaces need to be careful
about which AS they use by definition. Unless we have a
track record of code in those targets carelessly using
cpu->as when it should do something else, I'm not sure
that there's a benefit that makes it worth making the
"use the one and only AS this CPU will ever have" more awkward.

thanks
-- PMM

