Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1278060ejb;
        Fri, 15 Sep 2023 07:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxNu7ClBbHyTL+tUL1xE4wDkfOtdWKW4idncveDE6UwJZ3M8u1FibXERanDX3sOmYb6iMm
X-Received: by 2002:a05:622a:6f0f:b0:417:9c78:b32f with SMTP id iv15-20020a05622a6f0f00b004179c78b32fmr1032438qtb.48.1694788164688;
        Fri, 15 Sep 2023 07:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694788164; cv=none;
        d=google.com; s=arc-20160816;
        b=qXH0ETKUKC2yeTX3XqRbMeI4+C6lDvZxxsKXlHMTiqLFi1BCflz/olCj+JT2aSGv4S
         Y9qiD/o81aO+phEtO+okN7HI0h7DVp4YbBmv6zYDUUgwSxt+zonCV3zyeRoCbd2MCi9J
         9AYkedJ7Zt3P7z0mVSYOciUZxAtzGxbe0LH3ezRP8s5O6HkAZjxn0tZZR2phKwvYU7aG
         xwYwZkI1j9IeuM4trJTZWL/r1fRaMv4hiGp9dMclxgZrD3rQH2Sx3eY2AwUj+kvcB6US
         UE5ePLRuaP09kVBAFiJ79PMrVxrDcGzhkNjRttjAsw7PICSCEdnLWQDV0V+8vXBzK6yW
         aXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9svSgG7YN8+asSGiL3ULeSkm2S7SnRq8qEawkaWRqAU=;
        fh=HHLscuJSOlFS7rWSLYvW+5G5S+QNgRE3HagF8s8gucI=;
        b=LKZmNz/vEfNIWn79sKAg+j/3bQzUW0TZ2fgfxcuFq7yxwYNAYnGPmN0L6WqIuiiWgb
         VpdtqnrhGCe6QpbjsaV9kojS8VNs8qkT0PgE+Z3UcfIN1+N1DjGnJJwUP2qQk7+cGe+f
         +8KqyLBQHBXeZHjFhcEfU6saHTzJyJ2dXSzvLO+3sW67WlzjbZI3GQlo9pEnkCm6Ul8H
         yLUiNDSisSqFn/albBl24U6mF4Z5valAnRfSA7gYaxsVVGY/DMnYByd2yHDC8+iQQxZr
         FrQjWc0ejeHjYiFBnKxsfX6oBuT62T5D73TYqld+ble9znNPDOU7/MNSitkcUFh/Fj7V
         4CHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnsrr9iD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a121100b004033ca9d122si2390331qtx.391.2023.09.15.07.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 07:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnsrr9iD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh9ov-0006gA-NW; Fri, 15 Sep 2023 10:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qh9ou-0006fo-Pp
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:29:20 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qh9os-0002Fy-Va
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:29:20 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-502934c88b7so3737860e87.2
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 07:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694788157; x=1695392957; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9svSgG7YN8+asSGiL3ULeSkm2S7SnRq8qEawkaWRqAU=;
 b=jnsrr9iDY2jCD+9x8NkDMw9oFxmxRYGRwz+jSB0FanN8fXAUJfMivIwaXYe7NIkVeP
 50cZrW9AyDJlZmQy+h4kalAaPyKvNxQjtuuelF1m0eW7sh7ErIwLKQT16eykr4o2v6/4
 mm3fa6Jg3vHRiDrLtLyHCICD6ADtCdTfIUtN0kLI+STE6Y3to+Qgf5nLm02jtCqanVXt
 zXevgSDlrHTCYYv2K1ZhYI7Ol+OLrhPI2E91Tg+eWsOW31OU8FILlAqU9StDYJ0O28PE
 dqyX4+JekLAE//7jj941o+QrOsXkCGcAu3vrTXRQyF9NDmApZUikDWDnhBQRe3t4LN+a
 R6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694788157; x=1695392957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9svSgG7YN8+asSGiL3ULeSkm2S7SnRq8qEawkaWRqAU=;
 b=ENaFXS4NH9pgQIAHIujg498Czk4RNQF/58efmKKZNjLLal/ge5Bv69f75ph8AHvULC
 2Cr5I16BYRCuQodJt0H8no6JAlvJ2I8lz1uoDk9lNQOAZAs/Vt109f1ctc+hzuacrNGq
 dEYhJROlKBFEf2uGBTOaGJSxomt1aCMA8/emXG4qTTTi0Z7uPYwMF9ogOJSpXtm+YNpg
 VQW5/dLz1w4kxjUtVL5VOjKpwo8szWp4Kcc4xdIGNK7gr7RmWNE2o9pRnc5zV+3yH3Wu
 5tZ2zz8OjZtlQvk+dp4bTrbmj5Zgaoypf/JNAoDBMeGUJKn071Q2rIhBje2IkWge588Q
 3DNw==
X-Gm-Message-State: AOJu0Ywfz9VGaAWR7Xb4Iri3G3AJwHPUfpwqK+sOqUg0T3rxhXNyMCyF
 30WjCpqFOWjCd9pF9HTrjMc5Kut8dmK3xidRskT7oQ==
X-Received: by 2002:a19:761a:0:b0:4f9:7aee:8dc5 with SMTP id
 c26-20020a19761a000000b004f97aee8dc5mr1660135lff.19.1694788156673; Fri, 15
 Sep 2023 07:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <4831384.GXAFRqVoOG@linux-e202.suse.de>
In-Reply-To: <4831384.GXAFRqVoOG@linux-e202.suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Sep 2023 15:28:57 +0100
Message-ID: <CAFEAcA_pAcmej1XY_NCPhLxm5qO55AdAHqQXtfXxe5oOJ_MguA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: Set SCR_EL3.FGTEn when booting kernel
To: Fabian Vogt <fvogt@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: HENnUQ5Vnh1q

On Wed, 13 Sept 2023 at 12:58, Fabian Vogt <fvogt@suse.de> wrote:
>
> Just like d7ef5e16a17c sets SCR_EL3.HXEn for FEAT_HCX, this commit
> handles SCR_EL3.FGTEn for FEAT_FGT:
>
> When we direct boot a kernel on a CPU which emulates EL3, we need to
> set up the EL3 system registers as the Linux kernel documentation
> specifies:
>     https://www.kernel.org/doc/Documentation/arm64/booting.rst
>
> > For CPUs with the Fine Grained Traps (FEAT_FGT) extension present:
> > - If EL3 is present and the kernel is entered at EL2:
> >   - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.
>
> Signed-off-by: Fabian Vogt <fvogt@suse.de>
> ---

Applied to target-arm.next, thanks.
(We seem to have a habit of forgetting these...)

-- PMM
