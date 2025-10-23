Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C51CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:18:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw98-0003Ip-8w; Thu, 23 Oct 2025 10:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBw96-0003Hc-Rq
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:18:28 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBw95-0007su-0Y
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:18:28 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7849f01e56eso10643047b3.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229105; x=1761833905; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILb6a6dquYwm4ywy49WY48dEBgbB4ZDhcXdzJecZtIA=;
 b=lUyk59dLmLLD+kkCwXS4sYApgDohef5xSUFf+tUhOLXIZUXHs/WprT9z3Z48YI8vWD
 cTuz53Tpjfymv09JBIl+L/8BIYHorEcYzNCl6H/LvBFHpyoKYfZXazucAOAtua6fz4Kd
 QWSzbPfGTnEZ2gaPy0egF2er+cQeW2GKI04s6xX6P9N95xhkJQpnZvo7/HMGjkX85G8/
 IX0y7i/YWXr6ZJxiO5sQYA8Qo3aHZS3sSdMOLP5AMFvCcMLXNIBcl7SMmionLzJCvVZI
 cUHpWCFb2RgIHU2rEvzf+q0VUFhOybNmy8Hz+ZlQDcEiWxV46OnwqGMJfPn6E9QKVdgZ
 wd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229105; x=1761833905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILb6a6dquYwm4ywy49WY48dEBgbB4ZDhcXdzJecZtIA=;
 b=PsQ0pfM/JiNtX+VnSZ3AEMSh3kGFQUZvCWrR1mNYq/PTd+lfKa1l6ELWhYmkvmLM7Z
 t2c71W8k7eWmC/ZejyxnXjTfKseAC8b7vXeeo7BRtwnpzOC5Dxz0ts8OdHPTx5EGhNL8
 jTgI4M8iTaodP3mMVtR2awVkGzbGxBiFZk1aVxVuPsrbXila1yHz3kJ8PAs98/Bsr3DX
 kti0D96D58+m52tPBYhnPzXcmOK75epR55ntcjDESLO1OoXQChVFqcUSgRvYcOdzp1A3
 DUaTqijONL/enuJmF645TmSZn9g3qqFEO9RNRoK9lErEP751EtdSmtsD7xyqGHhjs2f+
 UvHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUbtEdJ32gD3s9/8M0+xWtLuJTwbUwzTPLEaiLCY7rwJk/aR14Z7MCxz/RfmARNbIjYDeNo2D+xQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxkl/znaDBEutkiQ9jKnkD0b4Tq2XVNFTUP6mMR8F4advGQ16MX
 spByQfzvoSL7gJbHU1I4cP8S00m3F+RNDJ1dMrFadLSSQD9dgsbB7EtQPkUrs3WuEX4Okjqig5U
 pnZ1bmlnsx1dPu8cLry+21PiPr8yQEDImYiE+CUm9DWOr16aRWWNi
X-Gm-Gg: ASbGnctlr+ynkl7XYOPPxKmmvQzJ39YXEwJ9wOBtdKh4VCGpa1GGGOD3rXjmxAQSu9v
 AZo1AXojz+ZRH12tQ5QAn2yajSqgyWNbL46s+hETBr3Jy9PbISMBtBhNkkk1K1NPn0JkRzzaVPt
 c5QVJvk5nTJ5y3qXnScvXcGfKp/qTaHHLtzXxHjG0muerljHKdazS8GlylnGuJgJxW8ovLWyKQv
 KZtxHVksmrF5w60nslUg5JcBq1QPKHlcyTJ5foEyweQ+3qNTHa2T+6f3xwmKkN1vSujTiY+
X-Google-Smtp-Source: AGHT+IFrBvYTznie5yOrXKRJeJERtPINvFVVYR1GSwPbvkwVab/Z6QUfz1SSGw+7D1+rAUd61nVybMIep1rnnZATmPQ=
X-Received: by 2002:a05:690e:151a:b0:63f:1e8c:f264 with SMTP id
 956f58d0204a3-63f1e8cfb4emr8097616d50.69.1761229105416; Thu, 23 Oct 2025
 07:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251021145313.4584-1-philmd@linaro.org>
In-Reply-To: <20251021145313.4584-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2025 15:18:13 +0100
X-Gm-Features: AS18NWAMpIG0-9i3EwRbCO1532y9Q9DCV5ubWS2KFVwAsxDgyTq6cgGiLfv5NYM
Message-ID: <CAFEAcA88AB9q=R4aN+CJj_xOiBNmS=aWEV72cwKTRfX_FEjTPA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/gpio/pl061: Declare pullups/pulldowns as 8-bit types
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 21 Oct 2025 at 15:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> uint8_t is good enough to hold a property "between 0 and 0xff".
>
> Define pullups/pulldowns properties using DEFINE_PROP_UINT8()
> macro, remove unnecessary range checks in pl061_realize().
> Update the two caller sites.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> v2: qdev_prop_set_uint32 -> qdev_prop_set_uint8 in callers (Peter)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

