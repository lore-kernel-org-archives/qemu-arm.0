Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4329310lfk;
        Thu, 27 Jan 2022 11:41:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyfN6+BsqzKYQISD/PaZtzVI2YLTOtnaSHORXjZ+RjPt3JfonI7CLPO+7rN7uOlit2eSvG
X-Received: by 2002:a05:6602:27c1:: with SMTP id l1mr3091086ios.36.1643312479739;
        Thu, 27 Jan 2022 11:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643312479; cv=none;
        d=google.com; s=arc-20160816;
        b=NmU1/5Y/kephKZvP56KdriiZwDfxYb5JjTXZr9TdmDMk5mKNNYmed+fgxoShpUSrAL
         72MYZMnuhXiIFUTQX6hKE99dtUJnUJkIS64Qo4CjvJ1jdh8tAK8R9lCHlFM5XbxbfYA7
         2jv6okeJc0YuwSwa9fhGTe3zLdl8ttlD5V/7QqxbXECURxFTB2Lhsxwhv2UfZGCzSkzj
         6O1p/gR5wrOmLZsIs6y+mCZtQXREQsSiXdCs5zQCrPVyEr49xXDtL/IODowGmGgkbPi5
         nuQBkP2BOwHEsD9Rtl7JVIv6or8A4QNcgB+GuYaQdAt6HXZC8aqXFFhBzxzmHjJJG610
         d17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnUsBtTGAkBKeknYVD38A9c7wdorYnP7nNyXrMzBxkQ=;
        b=Bb8oAWLGTxw51kbMVVNODOVaKx5wQjZ00EQtAQOKwRz6cZX30rAhG+OGLijnrxyQZq
         tg7PcrtwN31MyhsyK6SGjdNt8I1pIY2aN6xUYSkYvwU3RhXzutAYGmWavOs4aKtr54nQ
         +WnzglPp3kJseuAucu5e/3Im29q1LeYq52G31b2tqtnidjG6MAIs7zJncI3I+tFnLh/m
         xs3dwCraCIhGbxfRPb2lU7ymCsyel2S/iRI1fr+x+RdPWJPzhP796TN6+sIQM/S/mWAM
         HLerer4+yimWPlhGjznyrCzG9ew1MYmjBEuMfwgRCXvEVmIYq/7ZGG9UY8ZsSwL2sqek
         +NNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dg/QZHNy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p29si2202094jac.99.2022.01.27.11.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 11:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dg/QZHNy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDAdz-0007hi-30
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 14:41:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAcG-0007Lw-51
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 14:39:32 -0500
Received: from [2a00:1450:4864:20::42a] (port=36804
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAcE-0002I2-L2
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 14:39:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u15so6685223wrt.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 11:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HnUsBtTGAkBKeknYVD38A9c7wdorYnP7nNyXrMzBxkQ=;
 b=dg/QZHNyXVgd87cq104F/q6RZ47Dt03WyDFItBYKgSg8g6STeT8RNXhEszMCKc/MvN
 tbWSHuhNPETik8ZkWUEOX/5SmGkHLWfVXbOHN3UzYRtZloDbdTybVkJ721vYHJfX0RM+
 klUawy+b/iQb7ZYH7r0c6eY1Nrx2tfo1xW+O5+MsngiM4rP8Wb2G1dHk0mn4ZXojUmF2
 qtxPlZXhxHVzXYyRlEZFMIf0Go5k+bWDgzPpeI9HGO18n0hpfrjFLwDsPnbEpYDNwkb/
 FxjPFRf0zV3srh8V4xl05nllFEn7ojoBM8M/4Da294TySBc6yuX0/fEhFHRCR9o+GG3A
 qkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HnUsBtTGAkBKeknYVD38A9c7wdorYnP7nNyXrMzBxkQ=;
 b=3Hs5HGS2Fbw1z3DHE3rYycddyJ7JYZGIh70n/CfMysB7rJAn7ioKSAyP1ljIeISPZs
 UrbqNmlwfRbaG7MteUgNMC/f2GJWwSpBlTMHDDYFLSMLMoHXEoHja+Z1b/WYybeB4P1a
 Pd6aFWdMPzG17q7v9jwPJoTy0MSCOss6KlTEySxG0O5+SAIGT9cI9puuzl5iAlfZtt2h
 SHub6KP7eMto9O5jn4uwWykGtptb/wrFR1Bzxto5vIVfkBK8xnQlJ3WhqZowbYAOTTUE
 ojEu5SKOa3jxVG6nIc/vyxBlJE5rQeqYPzF7ScFPmzU1GGuewv+afZRGInTFpBTXJCff
 v7yQ==
X-Gm-Message-State: AOAM532Evk59kqwf6kssmyhl4hQ0Q+5+nYI1HCdlMjxjBu/zxGT0cUoH
 qizYoB729jrDnvNSSkAcLj3OFbpBb8Tz0oH5AuYtkA==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr4127434wrq.295.1643312369206; 
 Thu, 27 Jan 2022 11:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-4-titusr@google.com>
In-Reply-To: <20220106230936.417020-4-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:39:18 +0000
Message-ID: <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/sensor: add Intersil ISL69260 device model
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s4Fj8IX/Qs5T

On Thu, 6 Jan 2022 at 23:19, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  MAINTAINERS                   |   3 +
>  hw/arm/Kconfig                |   1 +
>  hw/sensor/Kconfig             |   5 +
>  hw/sensor/isl_pmbus.c         | 210 +++++++++++++++++++
>  hw/sensor/meson.build         |   1 +
>  include/hw/sensor/isl_pmbus.h |  50 +++++
>  tests/qtest/isl_pmbus-test.c  | 381 ++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  8 files changed, 652 insertions(+)
>  create mode 100644 hw/sensor/isl_pmbus.c
>  create mode 100644 include/hw/sensor/isl_pmbus.h
>  create mode 100644 tests/qtest/isl_pmbus-test.c
>



> +static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: reading from unsupported register: 0x%02x\n",
> +                  __func__, pmdev->code);
> +    return 0xFF;
> +}
> +
> +static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> +                              uint8_t len)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: write to unsupported register: 0x%02x\n",
> +                  __func__, pmdev->code);
> +    return 0xFF;
> +}

This device appears to have no implemented guest visible
interface at all, and yet it has a lot of object properties.
What's going on here ?

thanks
-- PMM
