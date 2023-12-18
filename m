Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp918835eji;
        Mon, 18 Dec 2023 08:36:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKJfb9okRmnXnTfWcBpZswuki5s7MGEX33o+1u9mPy5+SBAItZ9upifbOIufHQBlTi6tPV
X-Received: by 2002:a05:622a:205:b0:425:4043:29f3 with SMTP id b5-20020a05622a020500b00425404329f3mr20163154qtx.110.1702917369015;
        Mon, 18 Dec 2023 08:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702917368; cv=none;
        d=google.com; s=arc-20160816;
        b=Iy+pIOXJHemXbEm2Wk3ZFTLbOcUOZpMqAwnpVArFsH9gSHizEoFORavvz+8iXwyrDv
         UijIjoEq98DEXNxVxvSdQnpXxlOo57814i8VG5TMK9L8HMPwUuiGMs6EfUM70iLiIoLP
         xRz0VLFWtOYConpVhLteqaMWNvH5QDbjIGdeXGnqSlWl8PzcvMlQlIGGC2gSpptFethT
         P+WxHk/2ivFT3KOGZ3rfJ4la4U4w7ZF3J3efRQeDpdQKfu/9S/kVOgKlW6OM19dyKE0L
         onpmehayw7c5Ot/IRn878H5xML/WZYTQJx6Bdz2ShwqwUaR2ekuZ2pdvovXX6DJiDglH
         r4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kIO0Il9LLINrqLrssLbrvYj3RvRqz983KtfXAKLTwXA=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=UfLXXR68NRZU82IbfFVzEBCMUF/RjPzZSPNZ4WoTXYReUjyse8OhFLEPoduQVJcQcd
         hyrScKwWb2Mca2W+E4nuCrimhVyYdQjKQETYy5sJCDY+vROsPezMq4OwWhzwF9XF/wSE
         vCR0c2THWm8nYUoy9u7GUbJYZAVWFS0j6ySy4Lpf4YoiczjXLVGTrCKbgRVRfwO7A7yg
         b7B2vqOJXlVpK+24rdoO7H4UQZ0tHd++VdfY0F1/2a8LLvwZ1LDHEL38svc2de7sSbeS
         G5f3nIktUW8pwifKvqUJH6hktEQWNn8b7FLUzm+IJKYQrf0Y0jAnUa1E46Ca7ukzCjSX
         qlOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LF23XuqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cr26-20020a05622a429a00b0042586332d5dsi14705715qtb.216.2023.12.18.08.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 08:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LF23XuqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFGau-00031l-Ed; Mon, 18 Dec 2023 11:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGas-000314-UR
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:35:50 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGaq-0000Wd-WC
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:35:50 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e3c6f1c10so1307391e87.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 08:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702917347; x=1703522147; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kIO0Il9LLINrqLrssLbrvYj3RvRqz983KtfXAKLTwXA=;
 b=LF23XuqGeoo/MK5+l58siFMosZF+v3aXgOSe73Hs6WLWRXOw3IjlA7G+HcnQTNGktz
 IsDLrBbvdfL4q3+wpZrZ9IEeGp2hyG8fxPRsyL6fa79a/bPGrr3h5SMyH4nmUE76Pl4r
 zKnO+ISO5DIh0ATKA7KmTuoc1jGaVjw9VXnnnWoVP6kebLgC4eQLm6Bp4l3GvHMeVrZV
 nzoC+xFlsBFYt7tw6oOiOG9s43IdL8MfOHwnZV+vU465W5ZZqBJzcteDQ/N3Je/nITE/
 u7zkwOmtQC1rTvF8T+6iAM9Ut3iDRYyT55fwFRPo3A36QPN7sZP2pB1q4zDjBaDt5Y59
 xc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702917347; x=1703522147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIO0Il9LLINrqLrssLbrvYj3RvRqz983KtfXAKLTwXA=;
 b=oCR34fDJltvyc4YBYUctHWWVE2QRKnOwML2BzVsFX2gYFZPFPPceqP2z8NtqJjzjWL
 EKTnY8iosTjNZGF1gJtr/GkPX0Cxcu45tbiRL4BdArHAj4n3zsdrLhmc3IadOvJwqYrF
 Th25Or9RDrWxMIVHSkewmBaBKggTb6zg+YlYDZAYBpg0Zf/r5/zQSSM0IMWZch5bAn26
 pO/bolrDO92EqBdPDNZA3hiqx3Mlr+P9um43j4i/F33QYj30P2hj+b49xms3uuU5Ws5J
 9vZigUGwLtKQpEASB7I3C8rGuTwbSAKrOs7b+PVe1hZD2UFSUdVHHR+EIRix5zc7EgJ/
 oe+w==
X-Gm-Message-State: AOJu0YySRQhbMIpY8ryhyCBkCIDDsa6aMBlfAj58xUeAvHwl7nnIB8T8
 N2iD4eqFFuzupOrsIYSSx0T6iPjOJ9ujesKaQujD1g==
X-Received: by 2002:ac2:4892:0:b0:50e:297b:ed0a with SMTP id
 x18-20020ac24892000000b0050e297bed0amr717395lfc.132.1702917346876; Mon, 18
 Dec 2023 08:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-8-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-8-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 16:35:36 +0000
Message-ID: <CAFEAcA812WHybPZCw5vY_=ODgErU4+FzJoKPy7gPSwQQ-e4czw@mail.gmail.com>
Subject: Re: [PATCH v4 07/45] Implement BCM2838 GPIO functionality
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: nQOw+T3XifGo

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/gpio/bcm2838_gpio.c | 192 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 189 insertions(+), 3 deletions(-)

>  static uint64_t bcm2838_gpio_read(void *opaque, hwaddr offset, unsigned size)
>  {
> +    BCM2838GpioState *s = (BCM2838GpioState *)opaque;
>      uint64_t value = 0;
>
> -    qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
> -                  TYPE_BCM2838_GPIO, __func__, offset);
> +    switch (offset) {
> +    case GPFSEL0:
> +    case GPFSEL1:
> +    case GPFSEL2:
> +    case GPFSEL3:
> +    case GPFSEL4:
> +    case GPFSEL5:
> +        value = gpfsel_get(s, offset / BYTES_IN_WORD);
> +        break;
> +    case GPSET0:
> +    case GPSET1:
> +    case GPCLR0:
> +    case GPCLR1:
> +        /* Write Only */
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: Attempt reading from write only"
> +                      " register. %lu will be returned. Address 0x%"HWADDR_PRIx
> +                      ", size %u\n", TYPE_BCM2838_GPIO, __func__, value, offset,
> +                      size);

'value' is a uint64_t, but you try to print it with a %lu format
string here. This won't compile on 32-bit machines. (In general
watch out for %lu %lx etc and don't use them unless the type
really is "long".)

You can get the compiler to tell you about these format issues by
any of the following options:
 * building for a 32-bit host (eg i386)
 * building for macos (the macos clang is stricter about these even
   when building for a 64-bit)
 * running your patches through the gitlab CI setup: fork the QEMU
   project on gitlab as an ordinary gitlab user; then push your
   branch to your fork of the repo with some environment variables
   set to trigger a CI pipeline run:
   https://www.qemu.org/docs/master/devel/ci.html#custom-ci-cd-variables


>  static void bcm2838_gpio_reset(DeviceState *dev)
>  {
>      BCM2838GpioState *s = BCM2838_GPIO(dev);
>
> +    memset(s->fsel, 0, sizeof(s->fsel));
> +
>      s->lev0 = 0;
>      s->lev1 = 0;

I think this bit should go in the previous patch since we added
s->fsel there and do the other reset code there already.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
