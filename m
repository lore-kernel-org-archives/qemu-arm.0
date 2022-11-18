Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp350016ejx;
        Fri, 18 Nov 2022 07:48:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4l+saQjvZ2ww7eDLfC5kU6BpE301aPkmf2eMCIeKIocuTW0bn3gNm7Z7etpH1Px0jBuEU9
X-Received: by 2002:a0c:edc2:0:b0:4b4:4a3e:d20c with SMTP id i2-20020a0cedc2000000b004b44a3ed20cmr6908501qvr.112.1668786525706;
        Fri, 18 Nov 2022 07:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668786525; cv=none;
        d=google.com; s=arc-20160816;
        b=x7ieDdh3KbC6DAzooV48EpJdZlNFJw5C6Hv/YGJsDcp+/QNugqEEym2UrSwZL5Twq2
         Bdye2Y4w058HjAkcClp4RJKFxcjqmiFj3czWHROEpZWRF49RyC7RvGPQq6Dj89NMoxtv
         TQbEneZeMM2eyyYnzjuk1wE9Ej7Q5oKcwKWsrdPy1bfK58eu10ok3D98xCAwZRt3uEGW
         guTidFk/bS5meun9/fYswiUwqLa0yOQVWP5FnuC5YzHRMObhfJ2ZOSJIdC/tMuBQm2i4
         v/78a1P18Noy+RMBjWgMsFDhj8s63AYDLYdiy88Ngbtkcaj5iK6gynrIOCwSz8nuhz46
         4qow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iz2DFoK6l+9YBTKCKIBKy1dbR11sYBzDgRUtXIFKZwc=;
        b=MKYaA8L27dthrBgKcJ+OfZdwuihwYnxznZtEnad0gzhseZ0D/7MdVyToCHcOY1svzP
         rohrNfaFYY5awoNUU5ndBD+kcosNuyC47y1csarYi8tDGhYED+R0HVMCZkQHcwmRLRol
         bTm28mtQNcaDZanocNOEOL/GD3lwnJQIeaMduIoXto2i7AIVuSM/3s4LvjeClYYuX0yQ
         tJ+1x1dllkkXtB3XSgOuC6azqdNv7LpNwbyjrG6JOy+1AKSYQC1G69RGZvgngstR+WNt
         KegUFvPozV5m50BObqQGVxl4j8AjWoa6Z/v5cXgLgV91vz2WGYmKiCmsgU+GirIIVnQT
         cLmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E7rOsaEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056214076b00b004b7127d45c8si2152975qvz.220.2022.11.18.07.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 07:48:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E7rOsaEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow3bB-0000bn-DV; Fri, 18 Nov 2022 10:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3b9-0000bC-H7
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:48:11 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3b7-0001mT-QT
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:48:11 -0500
Received: by mail-pf1-x42f.google.com with SMTP id k22so5237887pfd.3
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iz2DFoK6l+9YBTKCKIBKy1dbR11sYBzDgRUtXIFKZwc=;
 b=E7rOsaEQb2KeMS1WhqUO7lHMhN8TlO4ipbumDg57UEVMQeX0AzXLic2oXKnfZeiVUh
 So+tqsEC/RliRWxKhAsRcfmSWjj9C2Z5jwLo/lzT1O8sliQ4FxrjGpJS7nMFdYWaPjAO
 HCK0tP7rxz7RWnNNw0lUW8Kpxt2aC3bbVGc8toDHein/YOaXvtw75zgNWmZb+mcRLc/c
 e+ZXi2KFVACKjfy5YFka+6VuCGUEReNbKsxsQAfeyCbnuynWnQ2kZkANxTFS8uCx5GBZ
 UtEzmDQsTOSTcCB9iIm8+53NkwUYgYSRVOrTcjoaZWgeOexGoTq0lxLZrd5PQuOLumK0
 tdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iz2DFoK6l+9YBTKCKIBKy1dbR11sYBzDgRUtXIFKZwc=;
 b=sLw1u579Ass/JYAitT0Sjdg3Og5fvZFKVdQgbMCQjiNRO6JMFBZnxLMVwlEcb+LDwq
 K1zn87MspU9uA/V9drqksJa4ZmaXwSpwNOmuNDfTbQJGNlocVyDkeSUbEA+dKV0gT8tq
 UogS5/Z0PgBe/3j9JFSM9PmiU7EKcEXQGMiTyfrzddVqxyZqUOrh1E6Bl46yZZtHWNUd
 mYLAH583SzTWOrGpvT5AfRii98EyUw01mQV4kzukdagugq2pYgKORQebpr9EU9UhEsFs
 /G7IuGSNKTJsRyd8U9J5k9dYjAlg9Ahnyl/TD6YwIouyzncWO7vUVHL/lDFP+IV1NSCZ
 Uyjw==
X-Gm-Message-State: ANoB5pkfYw0cObmYM9MK13UVx28aTRMy/X5S8yCSkTU5lc92vhga6oD7
 k4JLGmZEk/hm2/OgHYsf905sRqbccELqDwDR9LtV5Q==
X-Received: by 2002:a65:681a:0:b0:43c:7da:e64b with SMTP id
 l26-20020a65681a000000b0043c07dae64bmr7319447pgt.231.1668786488418; Fri, 18
 Nov 2022 07:48:08 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-5@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-5@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:47:57 +0000
Message-ID: <CAFEAcA8tVAqf8aF2Gf=0KJGXmytv7aw10o4+RyfQLB4qO7KVvg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 5/9] hw/timer/imx_epit: do not persist CR.SWR
 bit
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KNrQAPcZ/eMl

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 5315d9633e..6af460946f 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -191,8 +191,9 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>      case 0: /* CR */
>
>          oldcr = s->cr;
> -        s->cr = value & 0x03ffffff;
> -        if (s->cr & CR_SWR) {
> +        /* SWR bit is never persisted, it clears itself once reset is done */
> +        s->cr = (value & ~CR_SWR) & 0x03ffffff;
> +        if (value & CR_SWR) {
>              /* handle the reset */
>              imx_epit_reset(DEVICE(s));
>              /*

There's a comment just below here that says "can we just 'break'
in this case?". That's there because last time we had to touch
this device we didn't have enough specific knowledge of the hardware
or test cases so we made a refactor that left the code with the same
probably-incorrect behaviour it had before the refactor. But, since
you're working on this device anyway: can we simply add the "break"
after imx_epit_reset() ?

If we can just say "if CR_SWR is set then the device resets like
a hardware reset", then this all simplifies out a lot and this
patch isn't necessary at all. (imx_epit_reset() clears the CR_SWR bit.)
I'm fairly sure we ought to be able to do that, and the missing 'break'
was just a bug...

> @@ -205,7 +206,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>          ptimer_transaction_begin(s->timer_reload);
>
>          /* Update the frequency. Has been done already in case of a reset. */
> -        if (!(s->cr & CR_SWR)) {
> +        if (!(value & CR_SWR)) {
>              imx_epit_set_freq(s);
>          }

thanks
-- PMM
