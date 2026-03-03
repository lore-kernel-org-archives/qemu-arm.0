Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01440EC0488
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMaK-0007D0-IU; Tue, 03 Mar 2026 05:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMaI-0007CV-Ul
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:02:35 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMaF-0003Tc-KD
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:02:34 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ca09f2056so3826845d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772532139; cv=none;
 d=google.com; s=arc-20240605;
 b=DgQ/Gs7gAe9XqXG293i395smfooIR/RG6ClfNqmTy2czn9l2FwyUK8nH2yih902hvI
 7CqL6FpBvzwjTuP8amic2TWYmf56M/+hMpogoyfDKEU5OMNoLe6sZIe4hQBzLnkmiLOx
 t/WRqUHkobUT5dObH6ngV9d/dLvhhUSKgU5QTuuIweHA3NL1mW12UHgLMWatXYf7GivD
 y8GywqxMa0PPCKIuaon/youlsIoy2+w88cqWs3m8s6JCwRmv582mKQCLlZBpeloS+nNb
 p5wrLSqzhGl0gvYD6c6qSHLwepNlsIEnl4FsTeqbWReO8QfiP5fgoHiOHzSQBEwzyh5N
 8BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EntsRb85JProsrEQW+3gNqKQue1+QEBdP2giyri1q6E=;
 fh=HeroED4/BI4277tzhykTayx4g1Bw16dTed0sVQFdTPU=;
 b=Q4I6zXP7wbOteRsppHKBkJ99KY8SpLXZkUCWM3rg/gDd+tFGuIiXE4RLANd0AHjEeX
 bb/xWiHcHsJiQGZCXIGLJ3EgRKkaEWJdNIJvNqf47j8Ryo47h5VvRWr3V0NuQguEzL/q
 3oKMl/9NoHHdMx3UaPPhJRMINogTNgRo7xmIAg/ZHykzAVQz1Z/OJgOqQKjnQ3CIQMoU
 nHv0dFHV3LPFejs2n1EjJgFzkpvXtnQxLLg+FLJi7VMO9KgpJ/wDcKQeZqgcaDuvWdMV
 2ltNJCUAiLZ0NNr0HkVhAJsO4g9t9JZpDqbWYAYFM6Py1tbYeCnAXgy8bvoRRkJ6p/uh
 MMBg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772532139; x=1773136939; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EntsRb85JProsrEQW+3gNqKQue1+QEBdP2giyri1q6E=;
 b=g/gwHD6HkV0hOmphaR248rBI+r8Xzg02inTk2D24nUdLdLzqv35bJzBb92fCU2CRpx
 zlTii+/bjfj6m4h0QRoQPeG8ilXg6NTvwoLma2LIyJsR9uHq7fAMD55nKFRMNJt6iGsW
 mrKaGo/mnj9l6AAeERoVguH//DS+CytubVdp7AfrZaNRsMB0izv2lf9kbGy/imgGJxs6
 nQcc4m+F4Kv0FEW7A05W4k9bPbRXloum4QYPhcKNLUQb7J28OGmMEaU1RU1ymKJtFBVG
 R5lv80NC/YY1o2BWeq43jimSKjJPK6dRDKZpBZm8xKS95WPa8qGYBxuxH7M2SY9+hALH
 m+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532139; x=1773136939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EntsRb85JProsrEQW+3gNqKQue1+QEBdP2giyri1q6E=;
 b=tQW4SPBwVRvW+OZipCZQlR4lhBdASWkLQK8X2MM5Apsfi8JWO2LpkM9Gy68jCmRVxe
 E7T4JxMxILAkV3jOngaGb/5fxyoekOI2PCgiaFEVvdnLjmyRQHIQIYWYnAvxZznylkTc
 VJGbeNxgCRKmk1H+u79Rj2nTK8vyoTu63K2ZXNunbZGdsi4ybllxyyNABk5feH/HxIBs
 05ZivLXA+FYG4VwASO4Dc3cagWF78/UopAASErfI4qwZwSTze8lUEiSrn+4ORfQoEmUf
 U1hVsXuEKWDu0r6pDqNoKexE4WMRe4hA5KkTSgoYZi3rNI7XJvi5SX91HlCse0AI0g+D
 zBwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvJszUzni0DzlJA1V67cuhizYMbjjqOabFk6AtKcGt5CbleYepxBe0SXlVjoEbA1hSQJ0fTTvs9g==@nongnu.org
X-Gm-Message-State: AOJu0YzOO2c42z0I12Dhj84ZQdp1kwtHd6UMP+xzqbdqvvNgBZY0hlO2
 2NCjXwhEvp6zDulaoSSph7pHOAqvsSRuARnpzLP0hM5dqYXYqV7eY+hT6LCSRqr3qUJeYVJA7br
 8PDJx5aoit3SQoYEOtShQ3VqH3WVgBcYJz0t6/UCrdtRPulBbk56w
X-Gm-Gg: ATEYQzw9yow6h8fsuBUR4bc1d7PkFvK/YhXvc4GHlNm2JuUN3u2tZaoToN/OHUpBwOo
 lqHGIZCDvFyVDbwmAkCWoB4G2T2GGH/yoKDLxaV24W+IzRPUVIIAuM4USf75xG3+1i4GUfSAzeq
 8vFAoL9ABfA0JhEFJMBZ0UgFcsAwy2CNAqSiJcOBts7QINTnbQvUxOaSSsebUbgzNqVVtjhuAvd
 1Z2jOd4HuM5FIMSC9niNPKcEXYYLaOgLyJen9O9AKI+9YbSlSLHnIlsXaFqUrRD5pDrXMV27vm2
 pTM4xODOcFv8MQnDW5bScD5tZ7JdinrWaEgDoCmcL184XzdErAQOoUwO4skGNWy+QqA=
X-Received: by 2002:a05:690e:4452:b0:649:41c8:9cf2 with SMTP id
 956f58d0204a3-64cc201e400mr9694102d50.10.1772532139465; Tue, 03 Mar 2026
 02:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20260228070622.2195836-1-johnny1001s000602@gmail.com>
In-Reply-To: <20260228070622.2195836-1-johnny1001s000602@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:02:08 +0000
X-Gm-Features: AaiRm53kj8RV75Ryoijfh5gVqdmDWH8HxJcQ0ibsx4uYVJy9DtSgrO2EjZ2Y4VQ
Message-ID: <CAFEAcA9zBjycO_jHCdZDopkPbJdUje+xMA3EyEi3boSk9sGEyA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add missing dependencies for STM32F405 SoC
To: Chisheng Chen <johnny1001s000602@gmail.com>
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Sat, 28 Feb 2026 at 07:06, Chisheng Chen <johnny1001s000602@gmail.com> wrote:
>
> The STM32F405 SoC relies on STM32F2xx peripherals (ADC, SPI, TIMER,
> USART) and the unimplemented device (UNIMP). However, they are not
> selected in Kconfig. This added these dependencies.
>
> Signed-off-by: Chisheng Chen <johnny1001s000602@gmail.com>
> ---
> When using the following command to configure it and
> enabling `CONFIG_OLIMEX_STM32_H405` in `configs/devices/arm-softmmu/default.mak`,
> this problem can be found:
> ```
> $ ./configure --target-list=arm-softmmu --without-default-devices
> $ ninja -C build
> qemu-system-arm: unknown type 'stm32f2xx-usart'
> ```
>
> This is because the dependencies were not selected in Kconfig.



Applied to target-arm.next, thanks.

-- PMM

