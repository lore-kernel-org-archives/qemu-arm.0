Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D389ACD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 16:18:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ66a-0003vd-6M; Thu, 21 May 2026 12:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ66Y-0003ud-8Q
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:18:38 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ66W-00039m-PG
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:18:37 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-651c5d525f6so6586923d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 09:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779380315; cv=none;
 d=google.com; s=arc-20240605;
 b=gWKs8A4iEbhsyiFA+ApPjh2b5REwARrpr2Hpe1fi0yL8QZpxIwbKPEyisfnkeuxFdM
 cfyuheJkGamgqekrsuUJVwHxd3lzcXBHB1IrCpJWGbWB38P9FMm5IO76JRaxNL9OL2Tj
 SgYDp25cowb2nUrAyyM2uLRVvkHhibeEHpMdHP7YymBoWSOaOVTr+g1B96jf8MZ6LRTW
 9qNE4vPqFjxJ2Be30CXQsxbw1uwypMMLwF/lJDKd0XSvfTKml3fGsIQd+YhYwqiPWCSc
 tg4qqRATZHYVZw2AzrojC5GJiSvpWpHxZX6tVCpHztXKlbYtXl9Ll/xLpM76cl5Qh1jn
 Y7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tMI/evBTMShzs84jPFqhsyqVZe2nlZMQeCzSVZ3bSC0=;
 fh=6GSW06l5Sv9aHObe/OaXd+I7J/YEagI30GNVsk65nqI=;
 b=MjWy1jiKM6RdG0ivzS5Z/1x+K3fdU+/iaFj03W5t2VJcFHJQOeVbQdmQJReY4h5iR3
 8B9xbD/aA/rukwdymrhcQw8bsFfPITvwb8TGsTswx/yRmxVKzcMQKAQF1yzMbHeE4Tnb
 m2p/LYVAUbnS8CkWiqHBJlAU1duDfVYdbwTjzR8j3l39nlbszvQ/vSNL0hUEg+aYQIWq
 jqfx3No4+qm2TNUOYDz9RTAwLh8nDX5E3WfuwsDfqhFO33ur3ij85x8lKgBknazeyqKe
 /LdETeUDeD6oZvExkC9zBEpmhTNs7J5oSHv1dO1nncen/nDVEQqS8syhmV61RZt2XpIL
 S0fA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779380315; x=1779985115; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tMI/evBTMShzs84jPFqhsyqVZe2nlZMQeCzSVZ3bSC0=;
 b=MV8xjHINOwS0nh54+M6+znOKe5ObOmF9ehZ39VbE/1F6+bfOT8D0TL1+/vIzqea0Wj
 sTSNwEExX8dXgmcj4AodzOQEvUjYGreVaoRGU+EalQ9Vg+WhKRfzUc6eVfQaIEx9nqbp
 pc2lZJR4lnN7KSzA4bLhxaRrZeE3wBRo2/T9v9eljI33+/h0Fh3+7SKIMcuYxi7tf5j0
 EgllwnnGSBBJr7esRymctjJDe9xDBK5TBpUK8/jJvTTkEbYjnz6tpCepuZe7RjUDaWWO
 266lRE4iqD9NPkq3D6cBom3Q9Q53aqIFiAQnBojjJZ/4MyZhKygDtVjh5vIxL6TPTS2H
 H+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779380315; x=1779985115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMI/evBTMShzs84jPFqhsyqVZe2nlZMQeCzSVZ3bSC0=;
 b=JIQn4VmyQRVXMCM329nhUCdLCrvjAxCIvSA5KN82Y7UOH/tJT+wLe/3WoeY6PJQnnJ
 PqieLWD52zqDrvbihM+5kk7Zd/nUSYz5DSacm2S8YWM1au1wCVPQs79EgyJJsqvtEPuJ
 vBFOcH6wCyzJ0faTSsAW18znb7M7DbwpPCUUpQkjGJEx75FbdGbgU7TTa11txAly0whn
 2NfvPm999Zz/1EtfzJkGFKfi6jWg0/tx1hWhLMICEwWhh3YIkJUb/2pwd0dV9wg7aDtG
 REqEZaCpyFSq+OsOogKErp5bNFgAzfBLb9wHQLm48uiGhPrLZzUkMg+hJqkCUALTgAbX
 Ry4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8sn1oGsynlrUyQQ836/kjkx05WwGRtwXRlwITLqPifu4sxoVWE+IwkgHITt0tc1rUwhEZG3khAA==@nongnu.org
X-Gm-Message-State: AOJu0YyTFrAYXNrFMjwBXJ19e9cor6USO9ELLeJJitWgGYqmKDNZHSCW
 XUxW19CuJuyRKQryvuxqPq7o4GefpXZuPzIhQZGOvimQvhFyw3tWgz/Fzb2k5aCAhixb+ah98ZI
 UcYSrjlJGJfLu9MIttdPj+6mE9w9HOgZ8k1RaeIfhbg==
X-Gm-Gg: Acq92OFBe/yXrXQDRZaRMednTrqW56JGEdoQBlt8fKBGEVoEbTSPEm+6Gzt+93KGTZ2
 YEsnpf7gYf3HNjo7pB0yhmUoBTGHlAP0QM9Y/zHzdvNVrlhqWuQqsT/S7l0PVyl77IGvF40EUZj
 Zuudy3/cae8p7SF6shqgAQlsTxBdbN5NGmDoZo0Hck/Yw4cqm67Itv/4AzfT6QZOYzx95OCVL/i
 qRL/QF9Na+CLpmfCd/gjcS0CAN41LCYcm8CC6r/eLCN723PJ9C4LloafkBzJwtpxTD0qwyjal+f
 eW4llTDf7f4D5DWMmt4otW2A1yo1SCqQDQnsbNUMwGMh9Xgov3+lnp6uV0wuHC6kJU2cx1gH/Yr
 rhw==
X-Received: by 2002:a05:690e:4393:b0:651:b477:71cf with SMTP id
 956f58d0204a3-65eae2ee64bmr2115463d50.31.1779380315400; Thu, 21 May 2026
 09:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-25-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 17:18:23 +0100
X-Gm-Features: AVHnY4IvPWaA1dov9w5mABJ56fZrMJUU-2ef5ftWke2t99YwRo-t9MouQfapaW0
Message-ID: <CAFEAcA8TiBX2Ej8TqBkvoivDo2_QdM7G5VAAoSr73Yw=CGRKqg@mail.gmail.com>
Subject: Re: [PATCH v6 24/64] target/arm: Implement BF1CVTL, BF1CVTL2,
 BF2CVTL, BF2CVTL2 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Wed, 20 May 2026 at 19:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-fp8.h          |  14 ++++
>  target/arm/tcg/helper-fp8-defs.h |   6 ++
>  target/arm/tcg/translate-a64.h   |   1 +
>  target/arm/tcg/fp8_helper.c      | 124 +++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  34 +++++++++
>  target/arm/tcg/a64.decode        |   3 +
>  target/arm/tcg/meson.build       |   1 +
>  7 files changed, 183 insertions(+)
>  create mode 100644 target/arm/helper-fp8.h
>  create mode 100644 target/arm/tcg/helper-fp8-defs.h
>  create mode 100644 target/arm/tcg/fp8_helper.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

