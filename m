Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CE6EC1431
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNvp-0007my-41; Tue, 03 Mar 2026 06:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNvn-0007mF-Pt
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:28:51 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNvm-0006gv-ED
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:28:51 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64c9cabfe5dso6715589d50.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:28:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537329; cv=none;
 d=google.com; s=arc-20240605;
 b=Qpmr6Gc94NBjxlxoqfqeJ5pVFVFCMKkFFBrPmkxajeatcYD0ECy1GF8VAnR+mxi2+C
 htAOQB+Fb+1AovJkYFezHRBM27DOKuWaOm6ifYO1pd4dJHQKiOIKzkKZo/2GfGtrMhAr
 h0x9T0UAL6m3Z57x/8csSn3oxkeJ+AF4huE1zOd9h+arEFbrYjz6IbfP7HXkIxGh47yA
 rEOwIfAJcwJBwWVvH9v7XJAzi537thv1iDM3OiXoNNb1pwDWujZHAkcCh9MSAxPRNp9F
 L6oyNZp/YcQwZK1wB8kug4Tj2YPuJo8dOk+is+NwA8YP7dQz/nurzuYGQez73nWkRab5
 Nhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+2b6TbtolqEqUHYCnJaMhaWWIYLpTc1S6n8wYDRGc5Q=;
 fh=0yT/+P0OSCosfONH02tSTLn3VtGLA+PfhBlwm1rhsHg=;
 b=TPFyCjcNfjE0nG0sE3VxSoNdWwOkOFQZJ6Wn76ShQtsgsxIC/i0hP8aWfn/WlcI7hr
 29yTIoqj4TysWXQDe4ZWThAp69ubEpWa8CVX8qjPyhHsJ1lC1I0UqLLM9Zp1kkTCE7nJ
 SMXdXYWGBhwBU5VKgqqK/5OYPcXSuF7o+4pApF5OdlKBMY8B4X+Fn3+jGwvqE1dtun0+
 fzq/M35Jh6KrkUr4UqEqjmtV83uax0tzX3Gb1kfI65ZfMffaRa00ArJaHMMp+z4yQ+Ua
 MucAZ7XH0/ftaGbO70QziWK6yajD6ieZrxsTnaF9Q3Pypt+44llbHVfmAcBXMq0HL+kU
 YcSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537329; x=1773142129; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+2b6TbtolqEqUHYCnJaMhaWWIYLpTc1S6n8wYDRGc5Q=;
 b=EMjVTD6BKx5zJRDFMR20Fhl/G2mCMn9Vhiy7bUk/wUzHtlTPasKQHWpxphTXppYWcN
 UTn9x4lgcnmOIv5hCRI6GTwApHcmEO69BIZhi9DgglczrQBZmYXg2yQ0x7jN9xyJraY0
 ueNz72ul+PJOxeDsN8dyiMZCdfneVAGGK1VTTEb7erskU3mRYqntWCftok0UzCO81DqI
 aO7FMwdJyW4vhXASAzfh7aj108tUbQTvm86wAnjQHBVOYweaXQbZ18SowJJ2buMDida2
 HLISfXkKQ/HYmjREGjJN6+gkNaynosL8rqb4nPJMKkvNkILvG1HLVZWVFCS6FY3d/TAV
 Eo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537329; x=1773142129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2b6TbtolqEqUHYCnJaMhaWWIYLpTc1S6n8wYDRGc5Q=;
 b=jwc8exNUSKK1HArwd0KoCisVtxGIuTfpjaFrDphBBLabhvmvXDNoJmsxv9QtYJnzQ+
 eNl9E+CZZLplBs1fenmc+IH9K7TlqR4zwuCNjZVNabWOLb41QN8jOvjOKNn+4XE3c+h9
 Nn34rYtbDkKRgHAJPP85niI1zlSA6DpDvbhRstj2yecCG1HFipv+53eGyBcLAw0havFY
 0h4HoHVHnYIaEC6IKKR2Cgku+eXlGncBdYLE4lIrrsYfWQOIJT4gkM+mKYRmiEGAH0dZ
 rSC9FHpacU1+pKSkj7xA+h7OZ96fEUWmF9v6hKcFxigRKfKeCP42CWEbeiVtbH9yolu9
 lzMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa2C8A5xHdM5wX39pVmKbuRBLiGCXmHTGdUlliP8CWT3ateax9vC60Zw3GX2PyUWbvE/lYcgtW2w==@nongnu.org
X-Gm-Message-State: AOJu0YwMO06kmrmn0MeWlnsU/6dxlajhUXa10mZxbB/J8dP6g5RAFdky
 XCk/Wh3T7cFnkS8pW7eCaWBS5AsWEV+f6y7MOdPA75HVOMHentY9xDHIyJsgJ0AMLoOhxc2wxdO
 FWwnZ0qBC6sEBjXj4I2Qs/YHJh5oDkdQTwomVrO7r5V3JNUMRPIC7
X-Gm-Gg: ATEYQzzNYlwrF2nakvvB87iFHlW1g3i6yGclouGW6/g+UVGXmVOKZVbmGFAMBaNfSKa
 Xwu+4CIuzeo9TeVcaDQGzfK6MIjCyl2l5Ec5+WPozKbyGj47K9q18OSRcsAIdEE/tltiWfYQ8J6
 AETWQGBJOVU1l8QwSovgBsMJKtLW2G/y6Em0RxeiW2O233pKg7eG8xULdK1jfH0KLYwE8feFQJW
 jpkhwxs2yw0vob5UWuoenT+RdS6rqXJoMpKgJ066/0KNbAA2xXp/nhCWQ9KxeoHnkTLewIfTXjC
 2aX868EVp4Wrquh9lsHLyKTxHHIUZuBY+LYoR7F6nQKCGncZp37ko7dfYGyt4ZhWHzY=
X-Received: by 2002:a05:690e:bcb:b0:64a:d3b2:d3a2 with SMTP id
 956f58d0204a3-64cedc262e0mr1043496d50.27.1772537329295; Tue, 03 Mar 2026
 03:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-7-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-7-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:28:38 +0000
X-Gm-Features: AaiRm52xJmXiTl3H3wJ3imUf6rNuejBCuaWciDbNh6ErOqVpoz8mJ_vdO97cyI0
Message-ID: <CAFEAcA__4Tc=QzZb4rUwWEE2s9naam2CawHZVyE4oy-GYMLu5A@mail.gmail.com>
Subject: Re: [PATCH 06/12] hw/char/serial: Add constants for Line Control
 Register
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Substitute some magic numbers by named constants for slightly improved
> readability.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/serial.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

