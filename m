Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F117C55165
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 12:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpQ3R-0002wr-IX; Thu, 30 Jul 2026 08:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQ3Q-0002wf-0q
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:40:04 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQ3O-0004Wh-D5
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:40:03 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66807ba2f0fso2906411d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 05:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785415201; cv=none;
 d=google.com; s=arc-20260327;
 b=T3WiZIL7zHlwPUmlqygtRkbYAJGkqIcgvaYEY59g9EDe5x4jf5Ec3EiYDgWE6uk8zk
 lERhlNTr7YjF0j7qH4DyhpkWdoB37YhZwkCrpaDmjekAcR+tvCS2euRLtrn7pbDkKRWj
 jnz4FP3t/0A3DvBmsZPSvgaCJCTn5me94ixlbN0LvuQI+aEZ+EsqQuhsGh47d3pbSMk2
 vJjocHb4V/GiR9oOfelsvpKnuVJyH0djpTc7NY77f+ItuqoBOJ21d9mjZwQX2PmOroF7
 T114pSH2k+Pu1bbPPgEqPmtmomNWZxPUCN6udgAwmaZC6cVk0Fw9lX02u0dbLnmH6PoS
 9pMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/d6Inj6/U9LCwohs9S3aJ6OqLl/tb/tS0IkpZC/3DCo=;
 fh=MY+RTGlDZBw1hjx9sCas5mVeVTtr+VfM/WJHDpsZ79Q=;
 b=eN94SkaMHhhmg8DUZAa3ItdAm/7EduV8AIUUvYNAU5sY1ku3HekgJVpV/eBfBAhLhI
 EbEpzbD+6/2coAlzhKPZQFBxb/jMb2xkpSorcCjp+Sp07FrMcDtjFS9/KXtB+5FSbZk8
 naMny7qJ9zH8SYwf4Ugher1a+Gl2kH3zA/JHucp76ILWlrq762SNwibpwYBxLLSOu3ud
 hWXNILGXfgmEpt98tALuSdlwTJuSG/srZyQeNmQA1tSDDs9w9hVWZDHb7wYE7ijSoop4
 AQPlM5jvBBB8XxkYfJN/ODcYhXx/Ksb8wYUhC289Q1LC/szXXMbL+L/CI14WH/jSqR0G
 Xf7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785415201; x=1786020001; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/d6Inj6/U9LCwohs9S3aJ6OqLl/tb/tS0IkpZC/3DCo=;
 b=PH/X1CjiaXw1kf56/ZTETi05T3H1RkFWxlwZ0ZIOqgSJoX9yfGfk2+ab6VsSAfukKF
 bEXCqiaEO/cBvjXK75KEfxIzblGh+37NBtv/xCydb4bmVu7pQccHgFuwGasH+MXQPmSW
 kfTruPPTQgOW37kgZB2SbPpOicG5gpcU6Qk6cXVt8Sn31toTOSJyAWAZMYvBFs2NbzQP
 D2kv/CvgdVRT92V+KwGKch/SYNbCKd999kjtHxVg1dvyOLDfdgOvEHIpm2pdtwZE2vmz
 H1V7v4YcBUb8wyrFDmqg2Waa8IefF331kPRZckiyfXjppRXm1Vg24zY76RALG745CSF0
 10nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785415201; x=1786020001;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/d6Inj6/U9LCwohs9S3aJ6OqLl/tb/tS0IkpZC/3DCo=;
 b=Y2q+A3ESa4DbG9MOVea3IQVXjZCNVh3q86zOc42OkQnu3BXakvnv2WioMR+rJkLXYW
 Gt63SycSL0aXnbntzJ1trqC+p67uZa2KVaRFC3al9aRURRL4/bgDKij4oPA8BTGROBGe
 2N6tv71HiJkhe+QZtKHLKTd4PqqUY6lrpN0Rv+WhC6pk1VZMcgYx45t7WRLJyAGY8teX
 ZZfERkrXclY4ClazzSoyDg+QgsPT0dRORClNkGrfkf+QW/yefQQp9BSKujO14jjSNaDr
 4r/QZIwgmd5b/hkZr4U1QJFfdU+ZO6l9c0UboiPGgFIzYKRJz5iCkjY7Z/SN9oOan6Qa
 uV+A==
X-Gm-Message-State: AOJu0YzMpNajyH9gcSiCKnXIKVekbWDMArkqts5Cc587hBX2yuDumZe9
 ZZk7I0iz5nYBlahabcnrw27WvZYU9P2R0WeABxuwfw9nTpIZSxSMsPMkdbELsF1uMNa5sAj21rj
 APsgY0HmNSr3lWBI/ctHH59D0m3cd9wq2MaMadxVytg==
X-Gm-Gg: AR+sD1003XVHN5x8rF3rfB8EcNIcdA04apoa/PiLoio4YhEH8LKbmk4389K2QtfoI05
 6UxgBpgXtVAONVDyXuysoBWXiauvqauBRFA3Uq2wpUx8JJmvt2xjS3P9H4LKmyYjpXDKnexlLPx
 IGxz92+qWr8JSKUGKsPxpjUEhj8VY+SfdX2zEEt/06M/WNyw2dUUbpmxZvR/fbgRddI/KGnK33u
 TlhJba5yjeNoNEq9kBfHkFXUO67D2z6N4CwZTjhYNfBp2Ipen+QkprlGBNY+y9NyqKRlB+BwpIM
 gVVrKo4PY9J6SK/Tj6v+9xAtsm5rIMLdQzzTJQc/Z/YxriapOYUMOW0j/Lv265fxTWZ2J4ubeoA
 bGt/nmB1Fhc4VXOKdZFU4LTmH/U4ccw==
X-Received: by 2002:a53:a684:0:b0:667:a1d6:9c33 with SMTP id
 956f58d0204a3-6692f6ec6f2mr1233995d50.69.1785415200740; Thu, 30 Jul 2026
 05:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
 <20260729231325.3808993-7-titusr@google.com>
In-Reply-To: <20260729231325.3808993-7-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 13:39:48 +0100
X-Gm-Features: AUfX_mzS82PqNIcUfzgtqZbYbsM3lsTFrmm4fd5R0HXY4t8srKkA1Fgop-s7k30
Message-ID: <CAFEAcA9X+jQu9DtPoszcoa=wdJSPuxZtvA0j1BFJ2bzNQkWWww@mail.gmail.com>
Subject: Re: [PATCH 6/8] hw/i2c: fix VOUT_MODE representation on little-endian
 machines
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Thu, 30 Jul 2026 at 00:13, Titus Rwantare <titusr@google.com> wrote:
>
> From: Jason Fan <fanjason@google.com>
>
> Even though VOUT_MODE is only one byte, bitfields are allocated in the
> order specific to the host's endianness.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Signed-off-by: Jason Fan <fanjason@google.com>
> ---
>  include/hw/i2c/pmbus_device.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 9f3569e997..03b2c21c19 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -449,10 +449,17 @@ typedef struct PMBusCoefficients {
>  /**
>   * VOUT_Mode bit fields
>   */
> +#if HOST_BIG_ENDIAN
>  typedef struct PMBusVoutMode {
>      uint8_t  mode:3;
>      int8_t   exp:5;
>  } PMBusVoutMode;
> +# else
> +typedef struct PMBusVoutMode {
> +    int8_t   exp:5;
> +    uint8_t  mode:3;
> +} PMBusVoutMode;
> +#endif

This is why where possible we don't use C bitfields for guest
data structures. Better to use the FIELD macros from
include/hw/core/registerfields.h.

thanks
-- PMM

