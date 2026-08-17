Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275CEC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:39:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzQj-0005bz-3d; Mon, 17 Aug 2026 11:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzQc-0005bT-D9
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:39:12 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzQa-0000UQ-D3
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:39:10 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-66c711b7f2aso5215798d50.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786981147; cv=none;
 d=google.com; s=arc-20260327;
 b=Ra8RV6iTJq8FX4jQrZ0zxZf7jRBTcqBbHWYRePMq+alz3Ffnx3pVA/xe80b5QSVEy9
 6AJY6nak7pJaiUHA1JeJhFe5r8UHyHC91cMc3Z1WehtSN63KdPbuhiKcwrMHN1XpXPyb
 G8rDpnhpIlrKbi79YUlX0G6dXSjFhu+Mj2O1KVDoO4vpbHsgNmGkfrs4J4NMRJugj6os
 HOEbPFRZ/2TXdG1XKFsmm69Lu2pt7pKYo/PyePj5wkSWn44pXjY0AGGMEwb0g5dRbky1
 ICOOlkZBufEPwTFTXwKC24Fs7E7jyP/1LUk/7PQ4OAtUorS1iRCCzTsCbmKuNfiFpi2O
 3FbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=n6jmdcAg8V7YZllZqZSNbr90fowePbfCBGSOOGmRag8=;
 fh=5Wn0T9UKM1eCm9jM9rDUz1Dz6HJkwMSyELdzy52zcSQ=;
 b=rcy/i4RkpSei7CqMyaPo2J2oQOrwjn8BHHBKCEuUXU+wwfSHqcFFIogZqGYParNVAH
 29aDmjtFNGNTSfVff8glLRvBdIjEwPhXiG9J/KrMEM58xiz844prV8dQy+rex4h5wlXX
 sAUAyIN5QUKNoamw849jIaJW6IxTYz55n6O67I3/sPds32Hcv1yFoEGk1q+kVwciQ1U+
 s6jejHoOW+8r/AqkOtAj11uljQ9f3dZ04SSapqCnEA8A5ABjafdqwbrafc+Uccn0gbfx
 thD+Sc04MOxNFoN5DOFzd58Xi/uvxbd1mXwEU0WBBN2QRfHPYG2wQ+TqwZeoVuT+M8ZW
 Kh6w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786981147; x=1787585947; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=n6jmdcAg8V7YZllZqZSNbr90fowePbfCBGSOOGmRag8=;
 b=lyCuKF8owAES92kB0vVEqo6Kh3EFp138wkNoGQvcdAq+aBP9quoX+BV23ESsFV0RIw
 bxmaGoghZUvcSbPOxJehAKi/OPwKy8O0P8s92wgFpQ+c90Wq/y6+uNacuD+VPOSS4yUE
 a19oP5FjDALYPZKhWXUDGCGOa1GLez6kx49GwenHlF0bQYm3ulPUhVaZSY87wXKhgG+L
 B3DM6fM+L9LeD1hX3KQKEhqIXL7/KJq2+FSG7QxTKuLstEl8+uT6PrAmBbuZOMnh2tZI
 Qrx5wyJEhR5ICbcbddr0rRckhcDHE3CZv8Idbl8jkgJEtpmqFa5hu0VOIgWf94Rm5z2Z
 B7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786981147; x=1787585947;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=n6jmdcAg8V7YZllZqZSNbr90fowePbfCBGSOOGmRag8=;
 b=JoZbIp1b3FS3VaMSjImgWmqttOcMhc8O68yiJ2YyztG45GpvUxWYiyf11e1w4Pqr9d
 u6Zy4OvjNNl6bsK2NjZWQEsXPSzu0XEwHdiMQYkuNvUtB8jh4SjN+C3dsspla6Mr0UeQ
 CK4TwPCosv7YN3w+Dhmd9Jgi1dzFQkhoiU79RTb9DTd1UVXDBYeudb+9pfv9RcJokTLF
 FoyHko61ir2hIuqOFU6VuSCQT8XFU4W4MIgo8tbBg1IoF1DVuJGlJofZBren0HCY/EFE
 x/IbqO5u9fUUA1D/lUeOMrcvp5R11pf/ysSE4f0gpiiQDCdLs8A2plixyQBkvobR1cRl
 4yJQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrnzOWY06/5PUZe6Bp1Rs9mSg2dE9SkcFxVs4ikxkKXNxNX/cnX7Fiy3P0DJEW9MxoNQCUQ3q3z7w==@nongnu.org
X-Gm-Message-State: AOJu0Yyj7Q0Pt4asYBvnCbEfJEF3Po+eO0cA3RUenWSUFUNAe/BYHE2f
 OLM0f50N1TDjFpR+/4KLUyrXLPhHCLJaJspBVTx1UT47QnH7TcQsS3n1cKpybSRGheANLvBTMEW
 5z1xXvt6ImzgdgzxEpicJIcVH0fWVDq0zkHREjbvsuw==
X-Gm-Gg: AR+sD10G05h4kzbZXu5XbyCZ76PsQxtbgGO30ZTpsx7uVApSaJvGVaixFv65OcBYCDZ
 BzA9kwolgNjikyG2mN/k6YSJ4HSztKga/cqcJ4MjYwSTaOm98Wx+Mh25zwS5/hN84YHo3pmOEox
 j6uZmgeyNecSbUefmDF5AgEhW3shIskP/IuxN9TK9gzd14jlSf4elVj4V5rwletjqhv1+wPzsr8
 rUeX9/GBA3Rs9GNSBc3eepmgp3w7PQQ951pUo7T/qx+/cDrcKFhXl85tUNSCFZSy9CAOuzQS+0E
 Yjs8TnDljCNKHwQKEbJdtuHGzZG20ayVFcGMEfixw9fDkRR5E1bedL6Q6ysqOSFBoYIrnpj3ggM
 K9lbYDMD83hB8EWMnZ+FU3Rg9+9LnWqlyl45/mO0=
X-Received: by 2002:a05:690e:d84:b0:668:8bca:3c41 with SMTP id
 956f58d0204a3-66cb9da22fdmr606139d50.17.1786981146796; Mon, 17 Aug 2026
 08:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-8-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-8-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:38:55 +0100
X-Gm-Features: AcwNN1XtSLekMzWbkZk9OBbiQ2fBoN9KmdC0b8MVN_UCRxIyAIVmMp9X2ncLBTA
Message-ID: <CAFEAcA-znXsy0xwyGdpA=CbC2piEQ8EWWNPOhQOo0FC8yCxJUg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] hw/misc/iotkit-sysinfo.c: add SSE-310 support
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add SSE-310 PIDR and CIDR registers. Add sys_config2 register and
> always report 0 on read as we do not implement the NPU.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

