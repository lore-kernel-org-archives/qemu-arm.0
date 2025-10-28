Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B0CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhnX-0000LF-IP; Tue, 28 Oct 2025 07:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhnW-0000Kj-CC
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:23:30 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhnT-00037k-Sp
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:23:30 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-63e19642764so6008130d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761650604; x=1762255404; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsoW7yIBRI2K1yaRJR7zeK9skbEHmWgo+8BSB3Jazuw=;
 b=Fw6Gtym/ey7E7kfBGrMRNhXMsv+TLuQqERRWU/KPOTIfn5+xblN1LdC9WqohMHi54c
 d4SUAJc/FJ9JiRm2X9ZXHNvLW3mo4dvGf2u3ozSKnlIuiMGDePIujm9XmCx0hZ2/m/MV
 UHYhh6gzDAsU5KOLeswkLhONExDFiyRjR9xcuUOtHjvfq15PfeNtmOpKQy5v18wlBltE
 /uOzyrglE4Fu7KHUnK15z6u/dsMz3oqni6IW2KJn4WOxmSABC3DaJH25NxQ9/SpsWo+V
 qhZn3qAEeVo2JV8esl5QmkUE3N82pjLzMhJUCUH2W3y8dbcNSurhHWuqMNcoBkDqeUv2
 /DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650604; x=1762255404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qsoW7yIBRI2K1yaRJR7zeK9skbEHmWgo+8BSB3Jazuw=;
 b=oEav6ZkNqKLv9IwCuyViAFTKPuFabK3ZVpaaFNcee7+HrD8SIAqTDZ7M5BKG2GIl9H
 wF1aTqHF2+2yIk48nhDwaoRGkHHdhS8FGrstmXGaTFlOG9L9z9s791YE/XcRG8q2XFlE
 S2p33/oQrZrFZwTvmcIaSYT1T+RNtlNyyXxBvk9tqcnX93/0cToXSNVVGnkPaWv/qdkw
 MRoo3ARyjWjVnUFU+L9wO26gc57ej6vKcD6ilD2h2XpthyDMar50X4gACN9AJHnCEzdN
 M0Q6iv3WcRpcI6iFS6uG/xwM94zmAaE1J4aH3KvQsrWz7ruXnrbV2V6rfDoAvIFbceuZ
 CBaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX23hB68LW5HiQnANaEUKlmQy1Cf7/rUFpu3xUgBOQHebP7Uq0ImWcVbAKyFjkqkDvXgXJepcsu4w==@nongnu.org
X-Gm-Message-State: AOJu0Yz/IzxT+qb783pPrOgFl8HzG9EOKyI/EPje/8EB52TxRGYFIw9x
 ep8vaSufmoKTW56BMrNeKHweI/ItyPuQEXw6Izyd8LnLdVoPvgzBRGBYjvh5ImL6qK0qpblUu/r
 1M+sZ7Sv0Er+AJEiW00FYWjwXr1Pvdf9iKFu807D8/A==
X-Gm-Gg: ASbGncvyc1g5tCcPEy/GasDFMjmj3VrH+XCMZkSHHZhS8A3T48m+IQwtS1MW40ZBtwr
 qqmDrFQ19zClP9MAK98KFcP5gzVaAKLPdQycSuKngNqrf96FnsZ1MR7dtItEyNVMbxk7ysCxhDm
 XmiH9WuNaZLxlSTg032g5d+IoEjRyCPifj5nZjpeMbOcfZ/PNfW0h22LQ+ZPL0K8P1EtU7yPP6T
 yc1tCpQL2xCjbtdgUoHxwugLYwL5NUzy/Ej1E0Xn7+jV8GhyBVyXFNfF6EjBA==
X-Google-Smtp-Source: AGHT+IF/ja2+1o9Vr2fKdoteQSFy39NxiXPKDPa/xGpYwtqttmIckPiXPNCEUyCjMJLKrHWX07Yy9y/2uVnE+mm2ku0=
X-Received: by 2002:a05:690e:4186:b0:635:4ecd:5fcf with SMTP id
 956f58d0204a3-63f6baace93mr2661531d50.44.1761650604408; Tue, 28 Oct 2025
 04:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-27-philmd@linaro.org>
In-Reply-To: <20251028054238.14949-27-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 11:23:13 +0000
X-Gm-Features: AWmQ_bkLfdJgALNZfKqFAjmFUAGJBWH9PSXEvlhHllJ2Qrq5N31v7Ka3ziCP_GM
Message-ID: <CAFEAcA96PQJTth-+xDMFL0rsgdYTr1Y1C9+i_UVgr5na6BfXYw@mail.gmail.com>
Subject: Re: [PATCH v3 26/59] target/arm/hvf: Rename 'vgic' -> 'emu_reginfo'
 in trace events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 28 Oct 2025 at 06:01, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> In order to extend the trace events to other registers,
> rename and pass the register group as argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

