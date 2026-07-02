Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF5FC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 14:46:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfIg1-0001BF-Ca; Thu, 02 Jul 2026 10:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfIg0-0001Ap-MF
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 10:46:04 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfIfz-0008U8-Cp
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 10:46:04 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-664ee752958so2632341d50.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 07:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783003562; cv=none;
 d=google.com; s=arc-20260327;
 b=hKnIy2HiVWqcGXj97PVH4oma/V7aJkApMF2zk/qItwZAZvaJsFXfova411zj9xoNBM
 P+BiuFcH3K+hlyLxqQ2XnlU65R+wgM2KwZcue6u0zUaqvtlAHgmhDGUeZOvtQUjjvZh+
 qU5EYZJM637rHl54omQMMN2jkgmKqmiWc16DnYFqSEMCKrJWfbmU0XlmGqhGbiKXYUnI
 rbJamiW3yJ/FZALc5P9vP7qJyFtlJqLrHqFrJljnbiRze1qjBKU2TACKfp1FjVnV6lkI
 f2hIZeMlUy98ZAkYfnbZJB8bzSmXiYdTmiVdlPzMDCBVR9I3mJxp8jrCOyAAoDvmj9ko
 WWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=V/XuN+kAuWIj2q7usufUAWom2uprrhjVLsVtB5cdVaw=;
 fh=QUX21auvWr1hhkdCam3xUCT9zcm7ObFn6aiRwLiAM6c=;
 b=bmJ0Ld5ojh/BAKMqZN7hDNYPr/q5aMXXYFddTHHhGs2zCC/UXmaPid+ms+uG1Ydrzl
 YmpA/mwyok/dU6ETmPiVD7TmdKsweKIF51f95gB5gRqFwd/hKd3DkUgscUA5ZxujdIPQ
 8h2D05FWmfuiJgn0TYqCuHm0zZiRK8/YgRp2zAkPfUCi2O+elARlVSl5s8Ik0Z0au6sT
 Bimd2/s4dFAkbZfHs4rFfp0gM8EFnMlJV/mLazc0FZvLHOdqt/fuWHKyzJyM2yLWsnbE
 JNrIEzCBLg1UN2mHy/DAr4jDto7uchUtUIwGpTTO6JbJzPAg1qVcekZdM1k4edxoDSDG
 kqlg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783003562; x=1783608362; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V/XuN+kAuWIj2q7usufUAWom2uprrhjVLsVtB5cdVaw=;
 b=kD8CuzUDUBdRPh4k1ldJ4UvxQNnZGXEB5f1kKyOCj4XSQuUXIr8aHbl/5FNR5IoYFp
 vH5XEQHi/xTBaPr8ztdjU9DRZCLONZpyTxlsYeTunFH2w3GaZ0WeK+j23Cxd7kXws0jg
 5WSah/iwprUdU5c7mmm6vxElzbqpMHSxwoDAb7QtdYnh+x4adLbzdwx5z3M+Pu2bLsXG
 ZU5Tv4glhmSUreDOn7mI6Na+ioTblYOZe5y12baqh7lGESmBUN5M2oHCUTWCoSFp3j6H
 nRH9qUbh4URl7qb8wIl1WH2xrS4nDt5CJzvwfX76h2bY7AzEbsOjHDzFnbejtE/S5nIL
 6Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783003562; x=1783608362;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/XuN+kAuWIj2q7usufUAWom2uprrhjVLsVtB5cdVaw=;
 b=Vjc+POWyv+lsgekOf1rcpXA5coObCSrqyXXYcnM2D3xtqWZtGLlZmuRYzL+8UkX6Bn
 Ki8OS/VflPV0YKJSKacEL6lJF9gNxsehitfhQj1/o54U4WFILjPQcuadwUXEuhGSppc9
 KFpvIUOXqYcpeEpyNHkdw9LfUgW4JQeG/kkMl7V0bmGypAiaHLylYISXbCt5K4/6+Tf7
 GaYuYPUiiDEsUQuR9WtXdub8lfotHF6n1ZtdrMZVK0ySwaYxBgPOQCpDrijs245LDasr
 JDlYPR63XKdnCWgpavbFXi8UUyVeEMBdhOjbwb1qzwRGjP9lCIGdXBp6cowh7zsoLoVF
 25tA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrbvi+z6WdXvx8axNByXmvTmAv5woyx/oRED0zdNuWKgndMiEbrBZTeTYVX9giezA2lhblq1caeRg==@nongnu.org
X-Gm-Message-State: AOJu0YxchzD7vs2az3ELJB31zt1glMAs+XSLQQmP10iQGlBlDSgAYJbo
 HdK92XBOE9UMsFLjt3Ss28gEharV4AcI9rF0/6a2W7Ba9DcAvsBumVrA9Rz2kAuLaSiVv4dQb+Y
 RSijTmAePEQpdRzROq8CpQsehW+S9KBsX7SzTEO+neQ==
X-Gm-Gg: AfdE7clDkOrPASknV0CG33Nlsjmt3eajStmmHKmjWFMGbTmBakSp1ANAA71G8ylwa1w
 RoC7CV8s7KtzDmJwJLWn4ViHc1mz8tI3I33REbLQ0KAZiPtjSTXgct8QwGMTfejfn65FWxp5j09
 rg0qZ6o7LMMeL7ZtKw7Go8Q56dWtY9XOeQ3Cv+p76D0MKMw/NwbgUq6kajFoQu86U4Ednnd2O/n
 gT+ZcVAuZvtAJiQ8sBEFPMOY4HxH9hw8bxrcyXr75/F5NL3SVk044P639UXpaUfdMHpKcP9XTFf
 X6sesofqTwyIi91Qwm7ZgIHbGb3iq46/LemheyUpfUv7EFBDFmbAuXZ4
X-Received: by 2002:a05:690e:12c4:b0:665:2100:990 with SMTP id
 956f58d0204a3-66521a1eed0mr7183330d50.28.1783003561829; Thu, 02 Jul 2026
 07:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
 <CAFEAcA8R1RXrGo2xov-4gKLQXX=FTVKoK1rGuxuYmBo9e8SN_g@mail.gmail.com>
 <CA+1f7BD2pVP2ByBRbwbHBRWNNuZHKdM_7xSVSmPztEWw1BbVbw@mail.gmail.com>
In-Reply-To: <CA+1f7BD2pVP2ByBRbwbHBRWNNuZHKdM_7xSVSmPztEWw1BbVbw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Jul 2026 15:45:49 +0100
X-Gm-Features: AVVi8Ceh5Mi6Q21hlZwgPuzVtjkrapNMI0dwIIC9hQk1MNU62sEJ_UrwgxYaUk8
Message-ID: <CAFEAcA_jkzy4evQOefKz3B+=wzcVULWr+swVP4=zKkcbcE44pA@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] target/arm: add support for MTE4
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Wed, 1 Jul 2026 at 06:38, Gabriel Brookman <brookmangabriel@gmail.com> wrote:
>
> Sorry, repeating as I forgot to include the mailing list:
>
> Hello,
>
> According to ARM developer, FEAT_MTE4 only implies the existence of
> its 4 subfeatures, plus FEAT_MTE2, and MTE_PERM, all of which are now
> implemented. There are no features that MTE4 guarantees that aren't
> either already present or introduced by my series. This means that we
> can now claim to implement FEAT_MTE4, and close the issue.
>
> We can also add it to emulation.rst. My apologies -- I can't do that
> right now because of my current role, but it should be a trivial
> one-liner for whoever picks it up.

Great, thanks. I'll send out a patch which updates the docs,
and close the issue.

-- PMM

