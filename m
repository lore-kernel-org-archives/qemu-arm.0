Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp396359lfq;
        Thu, 7 Jan 2021 07:42:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAKtyjCTzFK91+95DDxnlexcKzA0bERfjnahXm6+YT8dkJPP7tvUMHLr090d/CL/+rgN6l
X-Received: by 2002:a25:d60a:: with SMTP id n10mr13883712ybg.457.1610034145612;
        Thu, 07 Jan 2021 07:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610034145; cv=none;
        d=google.com; s=arc-20160816;
        b=o2+Sw8MV2P2hubKhhTxQmPoz+SfGdztmegwxatAYcqzS3INBNTDdxIeYXpDY+xUT5P
         20QkhlUrExXo2SrOxacCw/Yy3sKvhY5r7zBIZL5ZzpZlf3Awl1dD0T+8gXnCx6wvkgmU
         bHNVO+SKPIFdRQqdJhe4bSkSPc29TKj/4183paOgYM9/ZK7R46MvvX7lB7j5L4L4lH4t
         G4rfOu3GkKHY6DUc6+i2f/gSYTZhboGp42nVruzikre5sKsA+kE6Zs25sGnk3RGmRQ6N
         DnwGN9bqpY2dnfio61innEJi/2wVp/pkkpsMMOz+iSmAAO2HnOfATd0ahWUY80b/PKP2
         vh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1+BB7EAgsUKpRCVdjDUmj5z8BxSmmmAA8Vqd9CXW88=;
        b=QAKaaAABoegXY2dFT/a03zJnZoTLRbde6xqIhMjQ85MBp7HWgP0GUE7d0mrC/NtbOf
         +tkRLHOF3qVb9Vyzr6Vvl29rXoUQ9UAAuS4L7y33YGfFc7QZ//yHS+lYNe4KMWwVsRA6
         SwW1BgU3WVCtfnu1+HyD7vRGS8vJG7k0ykwVayJ81f5lAKczWPX0QpCaL9f7ylGZVh0z
         Y+Cl9XhicLeYTcumlj7Yv5BjUY9o5bnx8ZRHZh+YMK5F/L71LKXt/c18aCHg8wRcJukh
         exLTolu19KRUvkXbFMNFZPgwxae5Cgacr9vKRP7cO8RmQp1pwNdkfoGzTglCAZjD3T00
         7w2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Stv/xJyV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d34si7901789yba.296.2021.01.07.07.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 07:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Stv/xJyV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXQf-0003Js-0x
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 10:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXQW-0003IU-SP
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 10:42:16 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXQV-00084T-0z
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 10:42:16 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n26so10287670eju.6
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q1+BB7EAgsUKpRCVdjDUmj5z8BxSmmmAA8Vqd9CXW88=;
 b=Stv/xJyV/DbuHg5VjJUh8xPIgsTsIFKh9gcDtHpj63Nc19Z8N4Dj7GHmLZCNbgUf+z
 9Fu8ea3f256IRCx/dsricEqIWKd5jVxJYMtFhxgn7JJ18nTtqYu46gz6Ah6IBfhd019r
 /ImUuekYEAQrd/jTkFRrY+1JdFYpKkst6h4AUWpO8NvVse7zykdriuXdNND4iFa3RPVK
 7L19kBH1OLkFUEmC90+F0Yh8p4xc2lLiFWruXMnvPEJ8RKWNAXNKEBEU9nRTRmtNry0S
 Q7kJ/R2oKJCb7Bta3E/QVdCH5KehACRaB9c9FpIjPfdxPe7KaDSm86ATySWDubkZydDc
 T1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1+BB7EAgsUKpRCVdjDUmj5z8BxSmmmAA8Vqd9CXW88=;
 b=MjSqyAvV3gAKGswBpH5S0j0104E17C5jKdZe/HMA4EFcHIpPim9/w1y5PsQ1DcsFUo
 j2eXz/5fOy3YaNlJNZarfc7Ulh4qgNWPPWd7c0oIl0m8Z6cGPt4jQkgwgkjM4jSGa1Wt
 lRYHEp5niUk2V5/YkH1m0tm8R3pUFMe1EIZ9Y0wJl8kjb6e48hEADfiPSnjPKP4w/SEM
 1RUkQD1T9TBSGLr6Z0rwlxVrGli747xP7RYjQO9v0eiFXVifHDVu1KXqhW0/H9HCsahV
 pzIpklkk2doJv+FJ0Li6MGvvcTut5m/Twqg6ulk7m6ngeq9PHRAnIJLqx0RzJ0OwWIbP
 pJqw==
X-Gm-Message-State: AOAM530RV74mK9+bE1GL3BuobqR/5oGp0XmTM/kfKgN5+3TJKk5/IW3x
 VH3mUQWzct0FS7yZfVxIm0vb+V3QDigSuWofQLL4nA==
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr6495694ejb.382.1610034133227; 
 Thu, 07 Jan 2021 07:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-3-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 15:42:02 +0000
Message-ID: <CAFEAcA8C5hmyTWq1VYfLueaVbw99=D-AgW746eOuQAOMc_tk4A@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] target/arm: Add ALIGN_MEM to TBFLAG_ANY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKI8VLo8EO1t

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this to signal when memory access alignment is required.
> This value comes from the CCR register for M-profile, and
> from the SCTLR register for A-profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 20 +++++++++++---------
>  target/arm/translate.h |  2 ++
>  target/arm/helper.c    | 19 +++++++++++++++++--
>  target/arm/translate.c |  7 +++----
>  4 files changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e5514c8286..e074055a94 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3220,15 +3220,15 @@ typedef ARMCPU ArchCPU;
>   * We put flags which are shared between 32 and 64 bit mode at the top
>   * of the word, and flags which apply to only one mode at the bottom.
>   *
> - *  31          20    18    14          9              0
> - * +--------------+-----+-----+----------+--------------+
> - * |              |     |   TBFLAG_A32   |              |
> - * |              |     +-----+----------+  TBFLAG_AM32 |
> - * |  TBFLAG_ANY  |           |TBFLAG_M32|              |
> - * |              +-----------+----------+--------------|
> - * |              |            TBFLAG_A64               |
> - * +--------------+-------------------------------------+
> - *  31          20                                     0
> + *  31          19  18    14          9              0
> + * +--------------+---+-----+----------+--------------+
> + * |              |   |   TBFLAG_A32   |              |
> + * |              |   +-----+----------+  TBFLAG_AM32 |
> + * |  TBFLAG_ANY  |         |TBFLAG_M32|              |
> + * |              +---------+----------+--------------|
> + * |              |          TBFLAG_A64               |
> + * +--------------+-----------------------------------+
> + *  31          19                                   0
>   *
>   * Unless otherwise noted, these bits are cached in env->hflags.
>   */
> @@ -3241,6 +3241,8 @@ FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
>  FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
>  /* For A-profile only, target EL for debug exceptions.  */
>  FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
> +/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
> +FIELD(TBFLAG_ANY, ALIGN_MEM, 19, 1)

This is trying to use the same bit as TBFLAG_A64 MTE0_ACTIVE...
We might have to finally start in on using bits in cs_base.

thanks
-- PMM
