Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1931437lfg;
        Fri, 21 Feb 2020 07:32:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSpjwrKNOdefBLxYOxU0ilC1JVL66yBJtxAifP8Is1NsqqWkJIHIPNzt0vYgdIvPZS8UYY
X-Received: by 2002:ad4:5a52:: with SMTP id ej18mr29799001qvb.172.1582299167677;
        Fri, 21 Feb 2020 07:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582299167; cv=none;
        d=google.com; s=arc-20160816;
        b=sSE0eZYe1M26eWekTkUzSqkxe6yuh0YR0FTl5AhIM/BC/Ak+gsPu+hmfuofoIoqnBt
         qHGPXHNU+J24I4j/U4j2xJYbTxqbetuma6eFKWgL2yhfPtU6Mqw7MKawQbrCpzKM/odw
         HYembRv1nfJNv7t3kI99xWukE6/0ShKu3Vpc9lAcHFK2vlXiIih4YqUBw0N+vSqxNWBc
         5GZk+2m3rQa/j8alPYy1fp+Hg3hH++kFKulWT861VXWIRYNRTFKGUZynSoSEaxyiZnSA
         j7tvJQKZvAhVnd90m/oT3TmOsVan3LNDSo1K1vJ/edbTOQsi5cYHTvwmd/saryU9rFXT
         9Z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XGKUjROpMVQ0Lz2PzHw4MiMJ3AJkunTOvgKHatWlkQQ=;
        b=e8IpOZmun/UrFDlzSKF4OngdBfljbM1X1hEJd4iKlBiRoO8coZH48oVJOPm5CnW2bJ
         Z1+9CNjb6ZvtCCwm/TLcZSc/WMlHT3Xz1qIpt10nnAZ4MtQD7U8YoKc+mxmCQvnXaI+A
         oWIzZ0WM/ZUDgM0wnaPMVS/eERplV6ruMfng9iWyL9sow0iEu3B/D2Drt+faDHHFDdyq
         D6NKSppF1+lQuWiqwVwpVrzvOGiE81beNZ80hOxhE9B6px6Xz6gl5qweBU0/vqfEq7rR
         Q0xGDJ9wrxortmg1xzQBVE6GSxYEAV8NeQfX9Ih2gUWmXfJVpD/fpbKPt845xjfHJYxC
         2WwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=diBzFmS7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q24si1501266qtr.100.2020.02.21.07.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:32:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=diBzFmS7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5AIJ-0002Q1-1v
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 10:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5AGP-0000x3-4x
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:30:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5AGO-0002vu-67
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:30:49 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35844)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5AGO-0002vo-1t
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:30:48 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so2345638otq.3
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 07:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XGKUjROpMVQ0Lz2PzHw4MiMJ3AJkunTOvgKHatWlkQQ=;
 b=diBzFmS7zS2FJ/Nao2Con9ESnhuZ6H15NyTQedQ5Lc9ttHd+MP6d3xlHxGM5sX7Gkj
 ZHBn9I41wiYJQrtz9uQ+k4o86Iqv4S87kGzJYqPekHU3i+8t3q8Fp0oA3J6Cq+n2uVtr
 eIxAgxq5vTz4aYpBGlm5ut05h9ZVYDB/VVQlmQvOVFXv9+LFniCqCacO+tTMtbtvGKkm
 A2Ghv6kGkYtE0NWdbV3shz/TfNybuBZPoUvvMqXVmgMTY+UrBtLD5mHHjU+G8Pay39fc
 7kOcZj9CUXcFilMl1iQmYDa+Elyizs3PAWfv9dVE+9jYhvVAggSF8/4MALluUf+In38l
 10Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGKUjROpMVQ0Lz2PzHw4MiMJ3AJkunTOvgKHatWlkQQ=;
 b=hQ4XUhEZdoS4c6lXxqJheUgMB2+vKoH3O7/hpL7YAvDNgmnkepwDlR1+TkaOlucBra
 R/o0zL0LwM4MSXpWi1XaqZrAxfpKdSSzUcxGgmHol6LqztAePTMna/M/vXIwgO+LY4E5
 a/9zP/PvgPXKtPzs6ZisN6Q5laAgMWh6DJ8mqFSamt/O7h1VMAWYCXJWdzxS9eM27ydF
 X/cH1NcdZBWaBLD7faLwEPSfcCYKTWrZxJTKKtVeCYZn0rSIZSO/D1Rgi9zZDqKk4OGx
 cg0oColjIQhJhzZBZDmmv9Sc+FnOsuICvYkia78lvcEgED9K2w2ormHYyxITbNgdhAvj
 IC/g==
X-Gm-Message-State: APjAAAU3TLoJTKJWGSD+EVR6nn6GrDLRsFaIQzeL+4p7DSeVj1MxtI7F
 W5MZ/UMTQgCE6EvaJkSq+HiTn2c5KkXS03AYTNWUPA==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr26794513otq.97.1582299046904; 
 Fri, 21 Feb 2020 07:30:46 -0800 (PST)
MIME-Version: 1.0
References: <1582270927-2568-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1582270927-2568-3-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1582270927-2568-3-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 15:30:35 +0000
Message-ID: <CAFEAcA9HuShAc_8=8HtAeTpw=OQTR-a0av=8RaXrtgOAv0c8Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] cpu/a9mpcore: Set number of GIC priority bits to 5
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +C36luigJdOp

On Fri, 21 Feb 2020 at 07:46, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> All A9 CPUs have a GIC with 5 bits of priority.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/cpu/a9mpcore.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
> index 1f8bc8a..b4f6a7e 100644
> --- a/hw/cpu/a9mpcore.c
> +++ b/hw/cpu/a9mpcore.c
> @@ -16,6 +16,8 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
>
> +#define A9_GIC_NUM_PRIORITY_BITS    5
> +
>  static void a9mp_priv_set_irq(void *opaque, int irq, int level)
>  {
>      A9MPPrivState *s = (A9MPPrivState *)opaque;
> @@ -68,6 +70,8 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
>      gicdev = DEVICE(&s->gic);
>      qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
>      qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
> +    qdev_prop_set_uint32(gicdev, "num-priority-bits",
> +                         A9_GIC_NUM_PRIORITY_BITS);
>
>      /* Make the GIC's TZ support match the CPUs. We assume that
>       * either all the CPUs have TZ, or none do.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
