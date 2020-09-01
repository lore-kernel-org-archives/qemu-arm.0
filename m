Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4466941lfc;
        Tue, 1 Sep 2020 03:47:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4D9RIVQuUgwvEjVUtbo3T89XXHav8r7+4CiDLGMKlhWbpDXk5NnFULXgT754dGbqVgAYg
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr1652853ybv.401.1598957276759;
        Tue, 01 Sep 2020 03:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598957276; cv=none;
        d=google.com; s=arc-20160816;
        b=JvEp4En+C1vTKGXXfVuLk/qMSH3ZPUDbgM9uK9zdznc91nqdvBR6kfouLceb4GmqX5
         lEtJzgyIXiGOVhdmICTLHMSOroCk7A5qT5yAZJhJYLhT3glVXJHzM6RHbMbeB/eiz++c
         woVknJQA+f4Q0ec+JwZ/2vvPOYisI6FeTZui4dRH/+Ay+37cJBTtrOPmezx2TezaCWIM
         yiOeXJPzSkQYpcSX6MNfXvlpGDD4Kee+Wu+BjUlMzmmqSLWlOEzXiR2ldake1j2a0hUy
         r/Qv/uQC2zRu2BPQzubuJG9jeyhN0GdrVQu+Eg+U7qPYj9BNFtz0R04iB7jbYBjDed9I
         wB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iy3sccm8fjT+ATmdM2Je1CTkkwV+/bf6H9/Ajo8YwfA=;
        b=FwhNZokvAvRwWqDyeQWqMiwizkLL8y4lNxEH8BNkYlJ6JWkWZ39lLCJ6yLkQOXjp9k
         gLUHgVncK0kv597/DmMg4UDHQBPPQHSiguA6rzTBhPIv9HPiG2idw3IX8+Pgb3KNLx9X
         6sAQXWMurRIoo/1X48SMRmsm/FEgvkN6cR6Kssw5x0rxRu5cJ5S8hjrZLkudECSNXKO7
         s0Q0+d4wU0r06T1HjX4cmYwDDBL6KPb4t/yNH+DHSjT73UtqUveoD/97taJSk3sHYm88
         Y6RF6DrvuG2SqIUxZl1e8DLIxlu+eoU/3UHsFBoZiPn5n5zOfmVBrPL2st1MyXn+WLim
         QvMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=og2TzfK6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si708243yby.495.2020.09.01.03.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=og2TzfK6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD3pU-0007th-5o
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD3kq-0000hR-K3
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:43:08 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD3ko-00026W-DM
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:43:08 -0400
Received: by mail-ej1-x641.google.com with SMTP id m22so909459eje.10
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 03:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iy3sccm8fjT+ATmdM2Je1CTkkwV+/bf6H9/Ajo8YwfA=;
 b=og2TzfK65fHU42vGC3jsBcBg4QfctnbvBSA7OtgtzoqtnMWdla4tlk47bD/DF50h8f
 4dp9mmSiRsMFSwBe2TIA8El1H6qlPucy28aYSsmcZinaL005ep0PZJ2AGwgU0f0HVETB
 rHqc9hydK9iBK88K/VGkw9XCmksh/i4hmHIJc6/605m6bc+kn9T7yNc/kdjl8lVd8B5n
 CupEH9eMn5pzwpSw6mw/6gEkjcz/by6aP0xGeYYr97UkE7E2e0xlrRZCiAM9WLoze3PK
 +J0BmfBJH2p6fbVAi1S4kmnh816ienf/r07DRvfHK3i4S1CyviTGPNsnMxpT3DFnfG7x
 KFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iy3sccm8fjT+ATmdM2Je1CTkkwV+/bf6H9/Ajo8YwfA=;
 b=jgG1Nepu4nvv4GE4r8bsrs2ZqT9cgZVf1KEYZQIEUb+lwdhnLyEjuX72ZbcP5013Zd
 i3LRsR1eTKoM9pAYW8No9wU46N/7Q4xpjUyZej/vvHHmwGuovdqa+njBEFrpEJRlQyni
 XdYF3SchaCwXgKg7WyyUkC8MKQzj5XLFx0iol2WH4xXFwIYhfGy0LjtiQb1Ug9eOdpUx
 yzbrvygldvVxyTnNQSZljUZ8y2aEtllXBgibFiB8ai1eMpTOc9OnsjA4kTzZnCblhNWg
 7dosdXUuQEi4R4vAfhTjxasF3TunoDWwcxpR8wRaGC3K3bX51LIMBdveF7yivEhKjW9J
 4oyA==
X-Gm-Message-State: AOAM532V1dsN3Jh+0Lx/0AcsezloZ7REnpQ/+6wbYyRBypol6vzcDVzY
 nrfRYqmmLQyFfycLkSA2HOVuPB4TM7ImmS8Rqf8vrg==
X-Received: by 2002:a17:906:71c9:: with SMTP id
 i9mr884602ejk.250.1598956984999; 
 Tue, 01 Sep 2020 03:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-2-f4bug@amsat.org>
In-Reply-To: <20200901104043.91383-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2020 11:42:53 +0100
Message-ID: <CAFEAcA8fcBZpQcZuS7SgOxpAcMRMjOPrG0bJcKSTsxFMitHfzA@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/gpio/max7310: Remove impossible check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ewoh3RLkpKxc

On Tue, 1 Sep 2020 at 11:40, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The max7310_gpio_set() handler is static and only used by
> qdev_init_gpio_in, initialized with 8 IRQs. The 'line'
> argument can not be out of the [0-8[ range.
> Remove the dead code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/gpio/max7310.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
> index bebb4030d27..7f5de189acf 100644
> --- a/hw/gpio/max7310.c
> +++ b/hw/gpio/max7310.c
> @@ -8,9 +8,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
>  #include "hw/i2c/i2c.h"
> -#include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
> @@ -176,8 +174,6 @@ static const VMStateDescription vmstate_max7310 =3D {
>  static void max7310_gpio_set(void *opaque, int line, int level)
>  {
>      MAX7310State *s =3D (MAX7310State *) opaque;
> -    if (line >=3D ARRAY_SIZE(s->handler) || line  < 0)
> -        hw_error("bad GPIO line");

I think it would be reasonable to retain this one as an assert.

-- PMM
