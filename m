Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71F60A382B
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jylzZrpj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRUdA-0001Qb-RN; Thu, 12 Nov 2026 08:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUd2-0001Ks-EQ
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 08:14:12 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUd0-0005cN-Q9
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 08:14:12 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-67c6a0abc2eso2174316d50.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 05:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489249; cv=none;
 d=google.com; s=arc-20260327;
 b=CdnCS/2kXllm0IoM0dcCnNSRTMMUs37hHiLvF7wSIJZZbp0gqL1l7H3QkYa5wepLHs
 Uoc97v39voja52skt142UzPn14bxpi7KNUH76k2Pgpn+Lc9ENuPbwijAW4ZOnPGqMcaH
 1nxik5rS+2zJOQ1Y2r1/bYnxSYijySlS6bdTi0s1Bmzf1DBspqRSOZjDIG54b4WTGPsZ
 qIEqdE7NdUcI/7wwQXm3cjRd2SnxFaIO+c7Ge5wxEgh0mw92UOvViEnZKYMG4JBz8DDX
 7imkCY12IFhrfl+8dHQMkdWK6UW+38oV+CtSO9nrqM4vW+fEnfJkmzGZ7HLxNyxAJT+u
 1joQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7LtHY++GitWTEfm8K9Joulk+ck8KRYsjJYmh6ZgpacE=;
 fh=braYWlBofEntDsK4g3byQNbXwnWZ4MY/bToUDxts7Zk=;
 b=pVXdbPG6N8PhPPGN88ZoShif2rn5eNbBMTTUH2tqLDec26LstP15+WrowkfIzBXaUY
 pJVohRPJH19d201MRncoU46u7TOHZahXZWtKOrwxhYAhTfOA1cM0Uy+LsGOg1VE81Xs0
 ce4B5Zv7QJw4bOlbEXN2eKbd173ViCPjK7DqQOgmPDhPJuqdiqrQnpdXdADQYO37fjw7
 uDrAyspld7ZG+mBerTdW7/WIICb5x6khiIcUCxVHoU6w+r3w0533dZf2V00em+9Y6Fbp
 Fh8AFlDtqjYOp9lZxvdM2lbcNvJ0F8P0vF2JNJmV0Nw6U05jlbyn6Po5+RfkINor/N+P
 Zgww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794489249; x=1795094049; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7LtHY++GitWTEfm8K9Joulk+ck8KRYsjJYmh6ZgpacE=;
 b=jylzZrpjjjcimekkD32uBTP5Kbzm4AVJFEuPznnXwnEnGKi53ZkXEBi/KYFrLzQSPZ
 YCimYNc/H8/S7uAgiGW7Hj/ftmpbUFNWF6P8V28ttO1iPSCj3cZyOP+sicfwdVxmp8kg
 fJavbS5qP2vFvMWTulR1rVzygsUoYWcy6LMe3lwssQK+TQxBfuE9JlYElOU136SNjFGC
 s8cjJKnrsJWr2q3dHh7NcF3PVyFxCDuGBl5npCVauc8fAozkB2vQqm0dzR6U5K0DWv9b
 vZXPcsU6EY12Ne4Gj8mxhr6aYMMnJkyjHWrYGYRwcYE6mBdUru15Z+vRT7j/MvX6FIrv
 VDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794489249; x=1795094049;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7LtHY++GitWTEfm8K9Joulk+ck8KRYsjJYmh6ZgpacE=;
 b=nl6vzM4amASwubV46+rguV+6FmGk67f5fmohIGXYWBsdv+miYIl8Si6y9DRorK4TDM
 CM+YHepDWFY6HqciutgOzuxneHoePfNpv6GAYr8L6noer8UF1QXX4kl500oL4voPl6Pa
 SxUWKwXPu2ZFnb+K0BcQX95BMIuEFVyghWK2z8P1sd/HQkfZeEwT6anpYQ9f/Xt2Wyya
 10n0gIHbR3Mge8TsDPBJnQWrN2RizW2Llog63sKXrln+No0eyAlKhiQcrWPeI9VsB6mC
 mLtcLRp3QMqBoi6UFDUJjn/hJQizGOks0cJDo9bJFwD1UgDOmyuNI8nRddQTg2XCWe/N
 R25Q==
X-Forwarded-Encrypted: i=1;
 AL+hErG6bjz1w3MaPrJdJl9arVt5JO/4AtGd9dO9SoeDgkXllXFHrtheVScHVjTs/SFgrd1lLzv9uXaweA==@nongnu.org
X-Gm-Message-State: APuU4Z/pMuuBFIdwFYmR4S+lFG4Y1bbo0HUNPjhvCHxqFknbajhVXSUO
 I8X81DUMgGMGTxaJeS53nnGwljhs/kxoOLApNj8dH1lgLYMNZdhg7KkV5tpylhXevSIUyrI1zBy
 apCfyw4ourA2+N4UvBssS7ZM0fjEjCz2ur8OR86I3/w==
X-Gm-Gg: AYBFou25JNTJRyH0icIlvK9+A4HghgzFUcjHWvsEzNqOSLoKy4RmSoXjC2vcUzEMlw3
 iufpvGRAvSOafxUZG+GrIXzW0hBFQYG8Vyr2vI/GL6oCAFxWXgoGvhveUoetubiQyMIpsleQGAt
 ZQdijHRmC57umLPCzevUcLYxiM0CdPKYm77e13BcglGpJoDvXQzdConG9MMRPYyS5fjRR4Nj8uh
 DzbAdofQRLccT/rjy38dq1C6c3J4j176N/pSVw78AgL0qVkwKQcP0+/VIebab6moDnpaPn86VDW
 9U28uhZbUeOCFCiSl+9CvDSajJ35JnsdY+mvT+X6V49500Il1ybX4YLVgtWn8EERsoCcjd5hs5/
 5Ieg0BeeWNHFs9vBDFXeBMQmdKVd7MuNTY3GZG87mPHmQ878wDGrr6ANPaEVNNNhbM5Um09lER1
 Jcjn6Ne8vZBIoN523JZIKmBUfKGZx/2PRu7DvGUllfBQ==
X-Received: by 2002:a05:690e:43c1:b0:67c:1d54:d59a with SMTP id
 956f58d0204a3-67c67f77193mr2534972d50.47.1794489248919; Thu, 12 Nov 2026
 05:14:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109035234.722952-1-hywei787@gmail.com>
In-Reply-To: <20261109035234.722952-1-hywei787@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 13:13:57 +0000
X-Gm-Features: AclHuK8FbQHgTYgmpTC-r0WAoJXKqcEz_i60jjtZnOVDEcgnmKmALYn-_bniKRg
Message-ID: <CAFEAcA8r7=nZCE03ekQeT=u3mXR6eDrsQ8RtyE9svFm8Ziif4Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2838: Route SPI0 interrupt to GIC
To: Hanyu <hywei787@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Hanyu <hywei737@utexas.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 9 Nov 2026 at 03:52, Hanyu <hywei787@gmail.com> wrote:
>
> From: Hanyu <hywei737@utexas.edu>
>
> On raspi4b, SPI0's interrupt is connected only to the legacy interrupt
> controller. Linux guests whose device trees use the GIC therefore
> can't detect an SPI0 interrupt.
>
> This patch adds a two-output IRQ splitter to deliver SPI0's interrupt
> to both the legacy controller and GIC SPI 118. This follows commit
> fb3e0557a4cb ("hw/arm/bcm2838: Route I2C interrupts to GIC").
>
> Testing
>
> Add these options to the QEMU invocation:
>
>   -device m25p80,bus=spi,drive=flash0 \
>   -blockdev node-name=flash0,driver=file,filename=flash.bin
>
> Before the change, probing fails and /proc/mtd contains no devices:
>
>   spi-nor spi0.0: SPI transfer timed out
>   spi_master spi0: failed to transfer one message from queue
>   spi-nor: probe of spi0.0 failed with error -2
>
> After the change, the flash is detected:
>
>   spi-nor spi0.0: m25p80 (1024 Kbytes)
>   # cat /proc/mtd
>   dev:    size   erasesize  name
>   mtd0: 00100000 00010000 "spi0.0"
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3013
> Signed-off-by: Hanyu <hywei737@utexas.edu>

Thanks for fixing this; the patch looks good to me.



Applied to target-arm.next, thanks.

-- PMM

