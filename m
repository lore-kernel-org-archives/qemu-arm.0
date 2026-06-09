Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8919CD8CA7
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWt4a-0004hO-HD; Tue, 09 Jun 2026 05:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWt4W-0004gq-0r
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:48:39 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWt4L-00042n-TW
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:48:27 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66061993121so5036661d50.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780998504; cv=none;
 d=google.com; s=arc-20240605;
 b=Eja0SPZBQ4eFNcQ0MVCPMxHQmWdkQvr4h5oQ10ifmpOV+JQRow8+naauzn6gjbWbem
 q0BMQP8pA8exJDIs0gTK82JFV1WzQ0scsOZBDq3uEKwZTrxSsa6XKkqb1KXI83c+214e
 WMRJl2togAc8yEExR/yKdeT4mKCmJ2LAKMVGWoSBC+Y64IeI+qQrO4CU86BL4V8jzq4T
 87Z1hKuQpz8tut2UQ1e3v1FyzcjvY38SoRDrf5955cna8adRyawPuCwFhlCUun5qGJmU
 cBTqsD1Sy7+zCKfBdizHnuu1QoDTQkJDHg2hHVyJesZBi7TmZ8NH7QhijsNxMlznqFIu
 jKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8C6ZONQVBaodsbCuk0XADIqPMQQraaAB/Zt49/PsOPU=;
 fh=4K0OJsKg+QlodxQwxEShxsLJPKk4eiG2SPMhBsM+YWY=;
 b=Jhc+ha9EUyWlpmJYUx9PoWL3nvBMCst1Gz1i1+2gUgZ1oZS61m2KH1od/9GQU4DWEW
 htSf5qKVK6C03/SWN3qixEfRyv9qcNqwvj8lAJck2qTQd2HaLN1+fPlMCOqjxIfJZ9pg
 1HtkiuHl/zaZncjsSqaHxFmHWqYUEzc1Oga3R5OrbRhvpr4iwA+5bZ5UaKvtuKdQMd5k
 49qujvHY8g4F3+uX/rFIaxCNpB+t5Xrr5ee4iVHpIq4uolmz0rDAKTzC/3hR8TBxd1QH
 cGVpFLWY1zkUnijnS4tIciz1C7pQWgTT50vpBycKqes7XIlw85W5ML9WZ/G+T3EkTjZz
 heLA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780998504; x=1781603304; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8C6ZONQVBaodsbCuk0XADIqPMQQraaAB/Zt49/PsOPU=;
 b=V4zt27yZI0PBaw1l7RmhGbYKSNbKKhx9Qb2PpROq4c40iYNLeW8BZlyuyjUQUwFohi
 1sNB+YMLEeaSybQEwl7mH+dA1nPCS39VaxDsXeoatSW5VReMKw2fz2aBnVbdPcB/g1Bt
 r3d9+lBTB1rQhORL615A2ewB367r9R9ZlhXZoGUucbsfogXvW2AYqBNwukLZ1U6t+XEw
 zaLvbZNIVn71OcVcoiecTNsgTZQTda9uexQzhN/i+VHjC3r+rry1P1ry/vUGlcloGNy2
 TSYWQWMlVK+jC4vBEb1USz8hY/IToypV83MUbzf0tO6xZfWuRXKufJa+davdqgGlLa7R
 P4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780998504; x=1781603304;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8C6ZONQVBaodsbCuk0XADIqPMQQraaAB/Zt49/PsOPU=;
 b=f+yHVVY0FHvgboqnlT6ZTltUgp5Q2cCqUAcJKAZnOQMreA+PgzgHxen0p72da884u4
 /peFeLUy5JKxzIu44iUnyAwgfxYTOeNjK11wZWkBtbDfD8jut/pgCqm6sNgjud/JiFeV
 E8/IY/6B9WSrtpI74g10cuh7ZqFn8TJhRTqyc2qsh73+R+89ATcZK/BaHJ3pJB0ynoYu
 cEJkUC3tE6HJoDCUlA1aPNd2Zm2R+wp6XZz+x98BeeeJI2C4vvprOu+LoVS5B2N/sgV7
 nypjzhKRDO1VC4jlAUQBcZCKmxRYVay5eB+kmSGsS79PtvM3jRGwqvr4LeLuEzFXu4+1
 E26A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8CZjjCP4j8IMhkxlFPQ+lCT0X1/6qhsib0+XjGeCRolVxocRMdqLVn5y3QTniQkScaiAynDerzHA==@nongnu.org
X-Gm-Message-State: AOJu0Yzmcz/RWU1Y80mRHa2syo7EFgAerRy1Jw2xDvapr/ODMa+204b/
 R+24ehIb7CRO1iG5c+o/re2eQHhqC9pNZfhpVm0VkgkS3lLIiidkM/vhx6W3FkAGArwXm50kj+e
 BowBCWAp7olSe95bYrMNPwDqzigbIwuw6tCi15HLoGA==
X-Gm-Gg: Acq92OGXLFMtW24oGCzpRQd/fKaxyeMURUCwPrxg5HLnGId7E4DVxON9awxGbZW5q+8
 ja+a0FKRm2zEAKO/ehtYRZd/aGuy/Lx9SurprJfD2+wBip5BA0FOfzpWe9G/TrMDyX4gmmKisD5
 gXrxusHeQYGOzyaMcjoLIMOlKJeOAX80iz67pBd9HZDyiDBKIFn2hkXmqsvyVCCs2XN7AfBOrVb
 rUPivpRJk/CpH4AHI1waijkVv1Dw1gAssCAgMYfLvPLooKzp5AOoHso01X+ddLwOPM7nEhWbl9Q
 zJqccPROHE7RDYPJymnrJIvdYfnQ3lohiugZ30I0GaDK+YIIXT4dsY1jLyoYK41EAIBIX7QKD1w
 g3w==
X-Received: by 2002:a05:690e:440c:b0:660:57ad:a541 with SMTP id
 956f58d0204a3-66106e382bdmr12181517d50.18.1780998504302; Tue, 09 Jun 2026
 02:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-28-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:48:12 +0100
X-Gm-Features: AVVi8CfDJrARZbA0vgd9jBeaAjnjP5gHD1MqWfTRb5JsCsQCfXMGcW4es9325sg
Message-ID: <CAFEAcA87wAL=uaMmCkBmWKnwDrvPTpGmwZ0aymniUGb62V6dOA@mail.gmail.com>
Subject: Re: [PATCH v9 27/45] target/arm: Implement LUTI4 (four registers,
 8-bit)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 +++++
>  target/arm/tcg/helper-defs.h   |  1 +
>  target/arm/tcg/translate-sme.c |  6 ++++++
>  target/arm/tcg/vec_helper.c    | 14 ++++++++++++++
>  target/arm/tcg/sme.decode      |  6 ++++++
>  5 files changed, 32 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

