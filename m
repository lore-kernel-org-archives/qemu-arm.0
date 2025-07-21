Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7FDC83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 12:41:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udpow-0004a9-6a; Mon, 21 Jul 2025 08:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udpoW-0003cZ-Qo
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 08:40:16 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udpoU-0004g7-2r
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 08:40:16 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-70f94fe1e40so56450517b3.1
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753101612; x=1753706412; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fx+D3l+UaSeLFO1hwQVc7g7MnZhlXcFCOV7Ah1Fo6Rc=;
 b=RtmAmGUK4c//gLkPv0iQBKPYg/g+1+Tls3ZOmyc12IlvCbx+oJWDcbQE53sO80bVS8
 diq0yIMR4knQGky1jtMIkmMwqG+aw+aJm+dAtnQ9rKPzaIaEkEmrftZrt69I2Np7RbnC
 Kt82QNQTeKkPs8FgUWaxwYyCZJci1mbUjXX5hcwriO3uQtES/B5t1oqlfWlD3+ZNs0vE
 T5BWoylo0YcywxTy9Sm+gNrN0rud/H9Ecu9p60xkl0nG6BReUV8gaHq+vXuYfaaDolRs
 Mn/uT7xHsdmB+EYbBYvEG78C4oIzNteFHBxRQmnKjmLT0zkrdXvpiHyBTqRGw+Zbh2a7
 bp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753101612; x=1753706412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fx+D3l+UaSeLFO1hwQVc7g7MnZhlXcFCOV7Ah1Fo6Rc=;
 b=qjZTjXt+OrfNz/U8RNmHl8E3tTaYdHWj/hido1kGBxfUraQexNi4CcYKuEa7Gm82xB
 RdshCify3SNpGPG4JR/Xvd7koyudOry5jkZ66IlL+0unmgXg8fLs8uEn8oDUrmkXH52N
 gl4wU7J6UqzZD8o45R3cdUan5Fb38aLl7PgCnKhkfDGC4y7gV9nwlo7cYnVKOw9FOVZq
 v36y8/Gs6gAD5Hd4ZabSqZLp2Cx/51a9is1A0Ia/EvocL11NYAv4UnhZWnzkIYp+hncE
 X9RmbYoEUVvDIzlkXys/R2Y0GMGC0WJTJghnlTasCx6iiMj1ZClxeIUWy0W/k6ytXURN
 QCmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwGjnchcia8wF8gMh1aT0gfAcLGkcb4ptjYUDfRBr0KYZUig0WWRjEXlPXrVWzDIuATYpFfSVNgg==@nongnu.org
X-Gm-Message-State: AOJu0YysxVEZSHj1CodRdwgu9OSUGDjpznpp2Mi1hwX/otUIypqkOmsm
 vCpyIdnkLWPpJtbMtNgEUK97XioUnhbIQKEH8wilaacoS30YJnulHzQvWlvD0tjAJIAksznGqzr
 X0cQsIbDIQG/0jTAEfD4FoxK1RTEJYPPimE3QlaWorA==
X-Gm-Gg: ASbGnctb1YcFroekBxxE8Jywunib9F2LXVvT1V3sfAAF9rfqEmGMinPmqiFswDrS6Ye
 0FyyuOSF8whtoivQPobYO5AVXkclbmg/BOGmorU1eeIvxVDUcs9WX+hKebzx8PsjmgX1IwTv9H6
 5ZJcySb9hGodLeBIpqsrMJg1O2mHhHUp8eC2h07MGby0tPZeyR6FztsdqwMny4ZxEFU2mH/BBHS
 G1wddiz
X-Google-Smtp-Source: AGHT+IHJevQET7XJXhBkSvLqPk7DyBCQHZYlWaZzer6uYyUr850VWGHJH0TmMWmJliwbfdYc1Yos+OBgOV3nOYY8gN0=
X-Received: by 2002:a05:690c:4442:b0:70d:fd6f:b151 with SMTP id
 00721157ae682-7184f7a071cmr190726317b3.11.1753101611878; Mon, 21 Jul 2025
 05:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250716172813.73405-1-philmd@linaro.org>
In-Reply-To: <20250716172813.73405-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jul 2025 13:40:00 +0100
X-Gm-Features: Ac12FXy0n4FBY3_CuQrcvs6E0l8ly649O1sjKkf_Q5yN2Byv5ZR4iVtMUBt9I-Q
Message-ID: <CAFEAcA-nt-qeP5u=WyKS9pTWrpkDMTBPF241xKVsr+Q-noWtAw@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 0/3] accel/hvf: Do not abort in
 hvf_arm_get_*_ipa_bit_size()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, 
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>
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

On Wed, 16 Jul 2025 at 18:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Have get_physical_address_range() return when HVF is not
> usable, allowing to try another accelerator if requested
> with '-accel hvf:tcg', reported here:
> https://gitlab.com/qemu-project/qemu/-/issues/2981
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   accel/hvf: Display executable bit as 'X'
>   accel/hvf: Do not abort in hvf_arm_get_*_ipa_bit_size()
>   hw/arm/virt: Warn when HVF doesn't report IPA bit length


I've applied patch 1 to target-arm.next, since it's not
really related to the patch 2 and 3 bugfix.

thanks
-- PMM

