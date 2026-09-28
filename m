Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A85CA5FA3
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 18:23:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBG0O-0008Ri-Oq; Mon, 28 Sep 2026 14:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBG0H-0008Qr-Bq
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:23:06 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBG0F-00058x-GT
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:23:05 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 956f58d0204a3-674138cbe59so2536248d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790619782; cv=none;
 d=google.com; s=arc-20260327;
 b=EfnKy6I7MOUsjewFU2weK/ZI3/qfJnsWwE1fURI0Rd5KpwYG6t89xNqJhZtcMcvSEh
 7xWGAlX+szuZW/6WXWbnudz0Jo3ThTeL+Yd50Z5ukgseJ2OTGRMiyOjquRERY998tNYZ
 TWRmkN/sZ6gtcXI2JeU7wwAC/jFqjzZFKr7/tVhMAdd7xQPATK2YMG68xceYaE0i41/d
 tKvFFWMt1NYmRjxNlpUX0ASF27RWc41reqr4vylkHeXoetf9qrvjCP2OVW5p2dTtbm8/
 DfcFwfBKcMqByjFLiRQmRH+lBkcb2+Eyj8/e+CBda3CuBcAUNmKKARTOgdf5nl2d+z5t
 kPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=T2iNR5FQsp70JtKxZOrNk2y83HYHAPVGZSVmLsoewpA=;
 fh=isGWODQVxc74kJqD/19tSDae/iAwkwpawFwizpzBcDk=;
 b=YDqtxlmmUbxoRCSvKtZSLZfv3vIfAlxXONNu7Ns861xK/75H9Ok3WlKwbwW5lNuweb
 z7F+RrmC2NQEjUeFEVZnxWWAq3zx/2P7cJY5/Cdytx4TlFnRHMkOkaNX5W2ftWgwo49i
 YOox71CVX+KC0t6F2Jp+elpJJHFB77uHxWcHcQ8lTfEVEZzJxmC3C/L21qqsnne1endv
 fctRCDg6GmoTuOn0Qpha0bVehEafaNGTLmF1q7zQm9YKkjucMdNIJMmBSKOOfnojSVs0
 20XKDHioVy2jIkvcx7B/AisNMaDKF6ryg5p3Bdl/UvxAho873E9+nZQ5wxzHI4Z6LXz7
 zC7w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790619782; x=1791224582; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=T2iNR5FQsp70JtKxZOrNk2y83HYHAPVGZSVmLsoewpA=;
 b=babxks+PJ6lZlWqare5YMm+m3PUSIuZXWa3/9Y37Te6F/7jwRu5sofbCaH1+mxytX9
 +3mSQtSGmQ6ER5V79vpGXskUr51N7qPszZcLtWWsTiWsyMU1xTw44CgAepCGvvi+unFb
 ok+ct2CQadSIg5SSlFNALcEFm4I/bUqqXNzTEPuLtMWQEulamMl2xoDx+RlsgcAEZh6L
 M8wWOTHSYRakSuVKzj+v1MVXWdEyMAmdMqobPhQMHd++JvbO7beZ33/muQZdJGIQYhxk
 RF+OWe0ga6uZSG3Si8ohXx78LWCh/XNKy/YAv6rNP2taTLyJOL9F7x/QJy2y/iDgsutp
 KJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790619782; x=1791224582;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=T2iNR5FQsp70JtKxZOrNk2y83HYHAPVGZSVmLsoewpA=;
 b=mdqlyLctbVBbjUgg9jjmkngkNRat6KDZY/VpNTIwbvM1Kg7AngJ/zrvwLfApsZBwnu
 bnWZup6GUa+XVY1IIfSdJ2AbW8S5BOruRPmgyT2P3ZHmY2pjnjZ1Hbc6xpA3TZYX7AH/
 qiuzhVj11hwzNlP9/f47yip6SSw/x+J2fCN6/UP4q+yod9pGG0dKwlqzp6nu0X7oU2xt
 BANn5XrWUz/5k0yNY0oW8jsuIiJc2aOqpt0Yl6zLO9TuUwbbjtuDRWV1t6Cq6lTdyEYO
 eLTSTxr9EPHwQTTHppLTZl27N9c9+WocBQYbzj3zgjRIAbtPO+wOUUkfkGqn6HNDR07a
 E0Zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwcQh9644vGUR19E6gcfwz/lxl4DhTrbE6ev4hd7nzHqnqBWpq3XW2jeUISiInU6WKwlQx2YchFlA==@nongnu.org
X-Gm-Message-State: AFq9FYIBZrWPlyYmKM1AhouwiaFLmBiJiBvc6HWcoyULt0SCmF1j+x1u
 O70rckWoeUGHZakIYVBL+vPVhpjyG6NJrtgAvzg6YRMMjE56ITJ7xEtZI11DLh/FJ3REeoD9yd7
 QFpy2xJk5/4qc+9vUA/yV3n2/xsNheE0Ubri8xbmpuA==
X-Gm-Gg: AYBFou2Zop2lW04ThqgCKWCr/IPsmWGUa0x2GpmK5AvkfHsXOKEZO5W0cqLZpW5XUgy
 SmAIavkZNbWwlKz7Hw331wTxt3LQ4ZqdRfe1mZfxdw3zR0whW6T2cQ+9+ElhgKpErgKZ6An3wQr
 Lssanjb/dgDe0KCZAdylW9blaqlXQdTcj8ooKK+NlbBbVysxME1tcgtNTCccUqfBvyq5+rgsYM+
 Mjts9YDRmHhTcuYoty6Ici9mQrdLxMTHjN5dHZu0McFNj0dXiPgp0+an+C02JfL/zBeEdLBd/dZ
 gww/qY18oqpIWRl/WYvNaIQkoHYtbAQVCbMGtzTb42d+gfsto9ttLfQOo5+w/TPmZ7kq+SoTico
 uRNYmFW40Jc6ERluUbkBhecuMLBWgSLU5R1vT9tM=
X-Received: by 2002:a05:690e:1697:b0:671:7e90:70f4 with SMTP id
 956f58d0204a3-672ed2263f0mr7677894d50.10.1790619781443; Mon, 28 Sep 2026
 11:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-2-shentey@gmail.com>
In-Reply-To: <20260921214710.29422-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 19:22:49 +0100
X-Gm-Features: AclHuK9ptH5nI8v-P9ELzPhwoodstuoK8rQto_4bAwC2L9-Wz5OjI2fcKU_CqCw
Message-ID: <CAFEAcA_xVcfC9UrxM4jjW8HOGoq96iuOABdbVB9Ftfxjq2zMAg@mail.gmail.com>
Subject: Re: [PATCH 01/42] hw/watchdog/wdt_imx2: Fix handling of write-once
 WCR bits
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>, 
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0c.google.com
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

On Mon, 21 Sept 2026 at 22:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Guests such as u-boot may experience inadvertant reboots when configuring
> the WCR register. Apparently there is a typo in the WCR locked bits
> handling: The locked values for s->wcr must come from itself rather than
> from s->wicr. While at it remove the redundant locked attributes for the
> bits which stick to one once written with one.

"while at it" is one of those phrases that tends to suggest
this should be more than one commit. It's doing a lot more
than fixing the bug where we use wicr when we should have used wcr.

> Note that removing the locked attributes required a migration break. Defer
> that to a subsequent patch to help backporting.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
> support")
> cc: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/watchdog/wdt_imx2.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index c83d4107c1..aaf4695db2 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -59,9 +59,8 @@ static void imx2_wdt_reset(DeviceState *dev)
>
>      s->wicr_locked = false;
>      s->wcr_locked = false;
> -    s->wcr_wde_locked = false;
>
> -    s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
> +    s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS | (s->wcr & IMX2_WDT_WCR_WDT);

This doesn't look right. Reset should be "cold start power on", so
the reset value of WCR shouldn't depend on what s->wcr happens
to contain now. It's also not mentioned in the commit message.

>      s->wsr = 0;
>      s->wrsr &= ~(IMX2_WDT_WRSR_TOUT | IMX2_WDT_WRSR_SFTW);
>      s->wicr = IMX2_WDT_WICR_WICT_DEF;
> @@ -156,23 +155,11 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
>      case IMX2_WDT_WCR:
>          if (s->wcr_locked) {
>              value &= ~IMX2_WDT_WCR_LOCK_MASK;
> -            value |= (s->wicr & IMX2_WDT_WCR_LOCK_MASK);
> +            value |= (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
>          }
>          s->wcr_locked = true;
> -        if (s->wcr_wde_locked) {
> -            value &= ~IMX2_WDT_WCR_WDE;
> -            value |= (s->wicr & ~IMX2_WDT_WCR_WDE);
> -        } else if (value & IMX2_WDT_WCR_WDE) {
> -            s->wcr_wde_locked = true;
> -        }
> -        if (s->wcr_wdt_locked) {
> -            value &= ~IMX2_WDT_WCR_WDT;
> -            value |= (s->wicr & ~IMX2_WDT_WCR_WDT);
> -        } else if (value & IMX2_WDT_WCR_WDT) {
> -            s->wcr_wdt_locked = true;
> -        }
>
> -        s->wcr = value;
> +        s->wcr = value | (s->wcr & (IMX2_WDT_WCR_WDT | IMX2_WDT_WCR_WDE));

This looks correct, but I think it would be helpful to have a
comment that notes that WDZST, WDBG and WDW are "write-once only"
whereas WDT and WDE are "write one once only". The difference is
a bit subtle otherwise.

thanks
-- PMM

