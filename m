Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A271CAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 10:13:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v25Rm-0001Bf-Pz; Fri, 26 Sep 2025 06:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v25Rk-0001B9-FK
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 06:13:00 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v25Rd-0006xR-I7
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 06:12:58 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d603b60cbso22103877b3.1
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758881565; x=1759486365; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoFBKgbJ+XVP3XKXZRH1nEVA2pr0ymC2siLpdG68qoE=;
 b=UA/J6YC5AeEDCUCHkoCji6lW+XEnROEeUh5CgCGN9PF29q8VvVCQiMjQKyuUf/55Vj
 MqL1pUqNsQQQSBbkXXaA7/h4EVxwVL//88SkvcrWQAYmNP6qssnFrx2JI9gPE3g9bBpw
 t0ilcE4zn+jL2zBYX1iaVAcp3MKC03xB+/iJk9Q4cAbA7uOisArvUIlRbMcPvkU/N/Oc
 j6vwdGT1+5lLVxvuuX3Du8VkxmamCMNkgpyb0itIM9jDA9qybte64uv3wsPE7Rc9uz7z
 ctE4rrWb6t5PszvSg5UowXlb0XcjtO5Yxnp4a9WkBAh/f81+7Uw5hx9FQ4gwkivoyhZS
 hPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881565; x=1759486365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hoFBKgbJ+XVP3XKXZRH1nEVA2pr0ymC2siLpdG68qoE=;
 b=UcNffDZYAQfr3PgFbPA8eDozMIajy9x7BBAxZvPMuhqIeNzonthBapD4zPf8BOwMW8
 eSWHKD0MUOqGgLymmlXJ7ZvzcOpzCo1NO7T73cgOuHvrnjTBLBj2asqef7cyIevXBWAq
 hEsPot43QQq5k3tNFkAm6ZPZulj/wzpiof2bWXLHpCFiOUFoE29aui780gGuX4Mq04z2
 GXhM8m8uzh2MCxv8RsITjL2ldrYDh8CBHmeU4o8mwCAEMeHYas5tqapA9mgDNf2arboD
 Jz/AbghPGlhvCuRYRv+MeUXl0lFVP9Uj2MZkgE4cYKr1DoA3LWzKiKixF9itfHDqSg/n
 xHkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL8kxRKvkKatpibjsvS2mOHBMY7Zj7p9kXXdr/zsCR0td2gT4dNaujW/X52XpZj+W2+9+18GLajA==@nongnu.org
X-Gm-Message-State: AOJu0YxGdtDkocTIEm6b/UOZwIgmLh1dIjmNan2j0Hgw99F08n+I80DJ
 HZyotgbU7cLE8JN6RlNu77d4ZVraHxy3sHWDYIeRFHtWQGYiau2SQNEARSrbu0CdiUDCcycfQm8
 9QdAHDLH8E3qnVRCq9bLuqKY99iXgMSwvBZEciuiJPA==
X-Gm-Gg: ASbGnct28UJd/+hv0UwGVwpcm98xwGu0fbQiOCEOwjWLviB7cl3tMO9DSsHuQoPoEVU
 myunQteNodla5EjDEsL0O0ZZrjOX3N/6Xue04KigX3orBEExDgtfa6SSLfWCj7f028qdBsXPjKo
 6NuOoMzvBQsCaxTW/fkVafYiFmT6uCgbPSgWjGwm07XmGNoMNufDhUdynH590C1I4UIKj1Iw3FO
 T0FXacIGbXf6fIc8Yo=
X-Google-Smtp-Source: AGHT+IE3Oa3gm3D0K46ujbkGyIVyMYwfgNclcgYKI6d/nolnzIRJtmlar+H9bkq/OGXTVfl22+PtNvOFUvWWAPGCbnc=
X-Received: by 2002:a05:690e:d51:b0:636:1a27:6aee with SMTP id
 956f58d0204a3-6361a7fc7fbmr5398072d50.31.1758881565625; Fri, 26 Sep 2025
 03:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250924163255.51145-1-philmd@linaro.org>
In-Reply-To: <20250924163255.51145-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Sep 2025 11:12:33 +0100
X-Gm-Features: AS18NWDnV_3qKBVqG8sm1MM-W0W1PFCjyriI1itFY8Jl689sbt3V89XGlY3K4D0
Message-ID: <CAFEAcA_zZ3g+QfuzWf1pa3wph4O512jCZXMtQzyo6QfSXtCYqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Few tracing improvements around
 power/reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Wed, 24 Sept 2025 at 17:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Few patches adding trace events to power/reset methods
> which have been helpful when debugging nested guest
> behavior under HVF.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   target/arm: Convert power control DPRINTF() uses to trace events
>   target/arm: Trace emulated firmware reset call
>   target/arm: Trace vCPU reset call
>



Applied to target-arm.next, thanks.

-- PMM

