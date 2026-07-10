Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E1C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 11:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi945-0004EN-Tp; Fri, 10 Jul 2026 07:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi944-0004AO-C6
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 07:06:40 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi942-0002z4-LU
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 07:06:40 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-664d4478a64so1033197d50.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 04:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783681597; cv=none;
 d=google.com; s=arc-20260327;
 b=dKrQwMTS796TgU6o/4svKgvzToIgpfZ0+7qhw8INNx8ejC8JdOXVb4Z2IN2nRBP9oA
 RtE6nNXBfwCZRvTkaxl7mh+bqWXE4xaLm/F2D/wPYUwOAk7z66yrFlf8/9+S2ruKh9aU
 4XqgtQQaIgMzThrx3xpGvovp7UqHsbQosF6Ek9uDbcNGEdWIQfHP7nPeho0fi/1DVgDC
 y9VHjGaziC76H4BsnuBo673i3DmEjAtgDbaQkvzLq+hJkAB4BE7r1ZKswb6F1Fof07Ac
 hJncWymgC921b/xWZS1IKs3Zn5ODoErZW1OfENrXaM+EUY3Y1dgqDYVjkJFhkQNVFNC+
 nDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=x8HsZE5XjZFh1KROTAxOBXAVD8y3Zf1yZmVnfUK8hvw=;
 fh=OiEK0lKvbRNQTWzJHYFdmMAQiOXCiWtCS3zThGXy7gg=;
 b=gbW9CE0hhV5v6s2EJ+xtPpViXaQ590LQCJ2RSWlope0IWyon8LGJQriLM5XKwhsDk0
 5Q+UJgGJUif0vZzL93XvsFBENeVbVgV1auij6Jm8ol4asC82eSET0+1HgqvCkcGftHcy
 T3mW9nkRNL0tXoHrChEwGIs+mzgNaZR9reY3YPWJkP0LyXlP35NPA/fPqzpQ0nQPfnAZ
 CcWoJ0VZnRlzezH4zUGapAUxAGnNhYTS9IRuhuck8qNE4EmjRCbcYpXBAiCKB23WJ6b8
 pJaLEAZ/XU7fODKnhyuiwOXK/xf7PGMri++CHWS5rDPKJANZ9XfbW1dsZCLshNJJ2q1Y
 5M9A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681597; x=1784286397; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=x8HsZE5XjZFh1KROTAxOBXAVD8y3Zf1yZmVnfUK8hvw=;
 b=nCTXsGjv8kpVxYTlbmK+S37yHJd3d0HiK661ayQ+bvFiCopVBe2XUUq7LxhU30MRmj
 PDQ1H7cjzgnx6BSwIFltfG8S8FcbNSHSvGroxpI7HKQuzfAmzYhAoTLAdsD5HyMymazk
 WQmoyfhfZli7py+qEKVYZXlKWJe3W/I2aX00ph7AIN1epQ4qpRGS5N0VIs/j6Q9t+4wd
 pAP4fH4Q0+mkFxGgyU4flZNZc7TpG+lQ/RKvFCSyEPFBa1nYqQjfTowMIJ7OHn0Pm1a1
 o72ONMXz+ty06DVwECw1gOlzWNUm019XYELYCiKIMUYy6T7onnc8Gi94biA0ymqEeImJ
 erPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681597; x=1784286397;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=x8HsZE5XjZFh1KROTAxOBXAVD8y3Zf1yZmVnfUK8hvw=;
 b=H4TpsuAaV7BovmvbQGX4T1Eaf/xNgyYD2GrjgFeJb5RY0x/mSZ9hvSI9/YF3fV+1aC
 6FUGYdU8PaLMM20i9BH1iuS1IO6+dYgQTzxaeFS8BAs9vtyQxpESJTigt4yw87z7hdLx
 jPXGcrN/4lLRpJUTiAS1ysMzWnapUBcnIWnpd7bTighMDi2jliDTv1m3+wQ5vDyUMLg9
 5GtYHMCODDC0o5qaDzftMCSTuteDtOYjMkFJtaQ+iKMTHURRp/XziMcoiGeyQ9GApGpj
 kOMBQqc/76R4iWmQVfwXtU2WZv0V0nik1dhqHsFlli7bopEN0nDCcbCbplfHX2OiTWj6
 oZbQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rotw4evzG88/Mt/TRNV3323W0OeMYI05YwQ3fvxZKyv9YXLUILuS/XFtF3R4oRQnzN5weubYZSIQA==@nongnu.org
X-Gm-Message-State: AOJu0Yy9qie7YBm3jViuWakd/8eR9szaDjY2dHivEnn5eAkSb1Xh5NIz
 L3zgJYag6wC3o+JD6whKnOTSWPnIIGp9T2oqbGlvD/S3sz0fvAsoSo8N+CddomOrZ0/kulUb57B
 MxGm/w6R99dFA5hB2mN/6Yyax92oe1UgVAfYY6co8bA==
X-Gm-Gg: AfdE7clp2W0P/mH51+G6m0BQ6yHn3jG3phLKT4r9FZ+7J5JcAxI6OwvG68+QUVpScXe
 +j0v4EUgJChjo1P7x07qsJAA5X8SMkJci9UZknWF524YkZnnD8jEmUVbj7miTtX7oDsLv4f2rE0
 38Yvoyhn8aymUPBlGQ30HvLFbVowyKlDKd7jhLZi6XmGl7lTQpuuk7/kluS3gRPsXwx6hW1VWqj
 k0I2UavF4gLQU/mtW4dqQ4UspehdVxGEuHZfNE/v8CC/nkJoUoz/xchuEFRIFw0vnVo1eizWDiU
 Kde2Yf5HDt3Fd4W1T1xlJxod5B7YY8ZxZkkHpZhVRlPCQekbA5MCWH2D
X-Received: by 2002:a05:690e:d4a:b0:664:f765:24c8 with SMTP id
 956f58d0204a3-6679f0c2e50mr7032421d50.43.1783681597202; Fri, 10 Jul 2026
 04:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
 <CAFEAcA8R1RXrGo2xov-4gKLQXX=FTVKoK1rGuxuYmBo9e8SN_g@mail.gmail.com>
 <CA+1f7BD2pVP2ByBRbwbHBRWNNuZHKdM_7xSVSmPztEWw1BbVbw@mail.gmail.com>
 <CAFEAcA_jkzy4evQOefKz3B+=wzcVULWr+swVP4=zKkcbcE44pA@mail.gmail.com>
In-Reply-To: <CAFEAcA_jkzy4evQOefKz3B+=wzcVULWr+swVP4=zKkcbcE44pA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2026 12:06:26 +0100
X-Gm-Features: AUfX_mwOQ2VIPWWBmDtkuA9a35g0gnE1BCF-u_q297ELVkZ2kIAfTlH2H9k0u5w
Message-ID: <CAFEAcA81tCVFQw4J42f8YgdtNCESOA_vnXDGoVW8hJ_mKPnH=g@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] target/arm: add support for MTE4
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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

On Thu, 2 Jul 2026 at 15:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 1 Jul 2026 at 06:38, Gabriel Brookman <brookmangabriel@gmail.com> wrote:
> >
> > Sorry, repeating as I forgot to include the mailing list:
> >
> > Hello,
> >
> > According to ARM developer, FEAT_MTE4 only implies the existence of
> > its 4 subfeatures, plus FEAT_MTE2, and MTE_PERM, all of which are now
> > implemented. There are no features that MTE4 guarantees that aren't
> > either already present or introduced by my series. This means that we
> > can now claim to implement FEAT_MTE4, and close the issue.
> >
> > We can also add it to emulation.rst. My apologies -- I can't do that
> > right now because of my current role, but it should be a trivial
> > one-liner for whoever picks it up.
>
> Great, thanks. I'll send out a patch which updates the docs,
> and close the issue.

Alex got there first: there's a patch adding FEAT_MTE4 to the docs in
https://patchew.org/QEMU/20260708145841.3032079-1-alex.bennee@linaro.org/
I've closed the gitlab issue.

-- PMM

