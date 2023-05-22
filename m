Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1108917ejb;
        Mon, 22 May 2023 03:33:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JOpdmop5SRB4GZY3h1eNbR5WcDEsvpTZuPScXs58yRjU4DX5q/RwY0Ba9u4S80Kkj6xun
X-Received: by 2002:ac8:590b:0:b0:3ec:490b:ce6e with SMTP id 11-20020ac8590b000000b003ec490bce6emr17724295qty.48.1684751619196;
        Mon, 22 May 2023 03:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684751619; cv=none;
        d=google.com; s=arc-20160816;
        b=jKWJRlHdnCHzI5L7QLN1hg6t+vmT5uUs2O7+ObypWKTPoCG75PAoLv+78sLD9iu+jK
         MSRNY6UXyBUtTSKHlWlDWSJnDyxiXKVrS2P3uNBqiT+3YVhKL6IEzzV/9rZq4Ze5BJDu
         BoMModXNnYmHg51aege0yoLjK5wNiZIEfv8SJj9ZPB2/kAWoR3kw9T/mpXInsExrB68W
         OsnBIjviN1jo/y2LuRcG7J4QRy4b+ELllB8OfZu0bRm8OI5jP9JlNoAm4l/ET3WmFg2M
         D4r2HtuLukrqTrN7iCNXc5FiTlSvOhGiCAxCpi7zAqtnWELZK6pAinIKiTbmbVPLH9DB
         gGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OnudcCLiwG9YUI6gaGxh+J6vsLzl8Q360NlX13+JxzQ=;
        b=yPju4RDJj15pMEmDpfhSVsqMYx1lW+SNhwxo4ikR9QVB+WVqWyFEylvloVvX0IdPgf
         Q7REQPi+qAySqZrk5LSgx97+v/sZG9tHjh+IRRsl9wbZ2z0NLfEzl20KUWzR5wwvc5tZ
         uCMN+/Tb5q9sYJSSUQ+pQyN23xtPvv0itnk1kiiWXBezhwgBOq7gYIqVbXHTEN9RATju
         NbniHcb9AOZfvy7dNlcXdsy2lwI7Td0uP+Q3gdkEon1o6Kqy3ZrMQbnrk+fCuQpqnzjv
         T9ZP7CEknUxlVIYIgA432o21DOW7tIXEPWPyzgsC1OGJwHFyxGgTRv5r4UVu53Qa6GaI
         MKBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKmvWns+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac84e8a000000b003f4f94c6ab1si3534038qtp.272.2023.05.22.03.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 03:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKmvWns+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q12ql-0004VT-Cb; Mon, 22 May 2023 06:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q12qi-0004Ts-Ni
 for qemu-arm@nongnu.org; Mon, 22 May 2023 06:33:10 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q12qg-0007a8-Cy
 for qemu-arm@nongnu.org; Mon, 22 May 2023 06:33:08 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-510b7b6ef59so11171822a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 May 2023 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684751583; x=1687343583;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OnudcCLiwG9YUI6gaGxh+J6vsLzl8Q360NlX13+JxzQ=;
 b=aKmvWns+HDdkIf3t+M7Gh7+n38udf31K/z+RjV9tlDCbmdr93PhnrSVNlqAZS3EboI
 J7RuLnjE9X481gg8yurHhmGjPNJGnb7brped9VHGxBeaL0JkQjxtzvmgj294cUw7966F
 KiFwDcRS4oftP6d2U2mDEZVm+hvUpYT/4/cJ7GIzZyaXCJgTCtbWiR9154+xYLL3AYiZ
 2qAMNv0eO6lGJ2R8t8TEwwM/of4LG7ilTmDmjM0iC+HSBvw+OZLuJ7WHNqYiA8SQ4+fG
 jA9WGuGnmSNncrBwfGNxRkBS6hRgvx+5uKfO+Qk9Ia+otVGzpMEoQQjB6nH9Rsm6UDaA
 VQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684751583; x=1687343583;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OnudcCLiwG9YUI6gaGxh+J6vsLzl8Q360NlX13+JxzQ=;
 b=SR+EwcF7bGFWrNlE6M/HZKLc5IDTkeX3276rA4voNM3rd/4IKZYCvZKuS9zQ95gCc9
 N4BedyEVrc+QI2AiWANRA97U17A7fifrKVDPm0+y/R48RRv45eN0hgQNJ8OvCSoraaT0
 E2W0WIfUq6WGOy2d7l1UN1v5em0WdDje1Lzol0J5j1yJgzQ6LdtRMye7OXOXR5K1BRMf
 cQEMQz5aPRrA10WRnB7upPuqzt5L1lvvQKOoghoKdoaccPBmM2UT1ABuzY88UrCD4qrM
 QSyj3UM1cZp2e0gxKmvPAOBa9yQzNx9aihs3y2vuRQHeiBIyABncvsChiM6/HNbc5JMb
 bpdA==
X-Gm-Message-State: AC+VfDyKuHUCaM5ICAsFphG/rKQw48Ub1InM1Uyu07mOU8Y41y0SId+f
 GG4w620hfZ3AJL3ihKghnqvHp2KCgEFZSzKmWxsJoDf2Q4n0ziXI
X-Received: by 2002:a05:6402:31e7:b0:50b:d23c:deb4 with SMTP id
 dy7-20020a05640231e700b0050bd23cdeb4mr8320830edb.42.1684751583644; Mon, 22
 May 2023 03:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230522102910.20942-1-sergey.kambalin@auriga.com>
In-Reply-To: <20230522102910.20942-1-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 May 2023 11:32:52 +0100
Message-ID: <CAFEAcA_aV0DvL3DgqU9SKKRsqCoMrvwbPoomx+NA8fkXKkTytA@mail.gmail.com>
Subject: Re: [PATCH] [rpi4b] Make bootable rpi4b model
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7G9PWhLKk5rf

On Mon, 22 May 2023 at 11:29, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  configs/devices/aarch64-softmmu/default.mak |   2 +
>  hw/arm/Kconfig                              |   7 +
>  hw/arm/bcm2835_peripherals.c                | 223 ++++++-----
>  hw/arm/bcm2836.c                            | 129 ++++---
>  hw/arm/bcm2838.c                            | 283 ++++++++++++++
>  hw/arm/bcm2838_peripherals.c                | 213 +++++++++++
>  hw/arm/meson.build                          |   5 +
>  hw/arm/raspi.c                              | 129 ++++---
>  hw/arm/raspi4b.c                            | 243 ++++++++++++
>  hw/arm/trace-events                         |   2 +
>  hw/gpio/bcm2838_gpio.c                      | 395 ++++++++++++++++++++
>  hw/gpio/meson.build                         |   1 +
>  hw/misc/bcm2835_powermgt.c                  |  37 ++
>  hw/misc/bcm2835_property.c                  | 318 +++++++++++++---
>  hw/misc/trace-events                        |  10 +
>  include/hw/arm/bcm2835_peripherals.h        |  29 +-
>  include/hw/arm/bcm2836.h                    |  30 +-
>  include/hw/arm/bcm2838.h                    |  26 ++
>  include/hw/arm/bcm2838_peripherals.h        |  50 +++
>  include/hw/arm/raspi4b_platform.h           |  58 +++
>  include/hw/arm/raspi_platform.h             |  34 ++
>  include/hw/display/bcm2835_fb.h             |   2 +
>  include/hw/gpio/bcm2838_gpio.h              |  45 +++
>  include/hw/misc/bcm2835_powermgt.h          |   2 +-
>  include/hw/misc/raspberrypi-fw-defs.h       | 169 +++++++++
>  tests/avocado/boot_linux_console.py         |  37 ++
>  26 files changed, 2210 insertions(+), 269 deletions(-)

Hi; this is far too large to be reviewable as a single patch.
It must be split into more digestible chunks (each of which
does a single reasonably coherent thing) before we can
do anything with it.

thanks
-- PMM
