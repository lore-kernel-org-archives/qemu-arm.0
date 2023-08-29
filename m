Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3642691ejc;
        Tue, 29 Aug 2023 06:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkX/hPehtS0SCI8Qbp8BUe5jz2Y6cwNlXoXfn1neRQDjyOmbW1Lk3i3cYlNmT6zx3yUkoG
X-Received: by 2002:a05:6830:114e:b0:6b9:182b:cccc with SMTP id x14-20020a056830114e00b006b9182bccccmr15713228otq.33.1693314053041;
        Tue, 29 Aug 2023 06:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693314053; cv=none;
        d=google.com; s=arc-20160816;
        b=pAu+cQwy/Fw0CmVsGod+Z2NfCNn/MmMnWAdMr4slD6HAJG2GjBHGaA9tn1BQ+HZlaj
         Fkhyy1LOL1OqHOz4g/I1swqq4lmF6LEE0tv1QKtASWKvFmbSZ7vzkV5t0zJrxDhxE2ot
         U0/YEbAdrmwMslOFu0vvhmCCwhlPBdYZYXzN3IwaH/+VzJaShu/dDBEX9K5UpT8L3gUE
         cjHyka+FF6waHxooMXKRK7KiHPCdNV2T0mhsrg3EDCeSJR9NhVeeWrh09YgURjK7TN4Y
         sGU21be26Nhy29wlGfqHfrFBkyb27/zxr4BFbSW+HLPKHfvX3Ft3rGE3bgUYPmdZ63QU
         2G4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vFuwD9dkL4dLJSAGJZT3K9IX8xDvGoBK18tts9Jgm48=;
        fh=14xGkgxflx65Ik4ZuBHVKp+swAV8J+aiyP/MHJA6OPE=;
        b=dWDhvPTbpIJjcyrKU+1GShxuFILIvcK14OXbb6f7/Ngo7WLm5r+jJFf3FuVbdw17ly
         GD/hYPK4Xc0IgmlJwrk4cuGWIxHq0kfQIELm0Y5/yV998hZhAPEWvw3izjofQKHvk5WF
         /cEH7fV9977zcu8/0zJPTvpFmricQFALQ91VKro5LhcL89mZM1Ru9HsecuH7nryoYgR4
         z+ff1NmH/JUWIrnycFwvPzZQsWsPa+UpYmXps27cpUJSPnKfEwy+3dt0ATTG6fdZftGh
         zPdAX7UZw0k7bmYArUiZQXBZvDTgsFaSBmpsdyTcuyEpdyCtXcFAeZvdXbjdZg/1Nxpb
         +g7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qxz2ZeJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a05622a064f00b004121604095asi4889217qtb.61.2023.08.29.06.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 06:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qxz2ZeJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qayKY-0001IH-09; Tue, 29 Aug 2023 09:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayKW-0001HZ-H5
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:00:24 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayKR-0002Ly-EN
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:00:24 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcc4347d2dso64837741fa.0
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693314017; x=1693918817;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vFuwD9dkL4dLJSAGJZT3K9IX8xDvGoBK18tts9Jgm48=;
 b=Qxz2ZeJdmU7H40dVt4D/aQ+ULyGesLLOPxaB1WIS4x+de10YMRMS3kp8rhh72MmrUo
 1V9OH6hC8GHU2vhncahbOnZ3+EEzikK1kgTabNe+Lp+yC1eAXe243KPoZsFJr36An8kD
 OeXKqx6ygu+BsTRnXjQJ+OKM0qh9Ud0HGjEVRr2zvETwIHZrwa6Pau/vPlIWS7vLJ+nE
 NRYxuY/gOwCxs4OfSrENpixXK0KqibxAQXGiJ8lAtdmNKGpYwpwpO5nE60GkTnv1kneT
 w/OikAN61SwRZZUyZM52JSt2l/6w6JLt2zYqX6RCtuKHHH6b7TRXTG4bNtH4xYaGqeCy
 1Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693314017; x=1693918817;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vFuwD9dkL4dLJSAGJZT3K9IX8xDvGoBK18tts9Jgm48=;
 b=SLQvDIQlzcaF1QRQJ9otrg5/1HkUcXVcJLGykYY9CTrI2VFPHJAmKCV5KxbAmnxFrf
 nTtWm4K0n6WMJvEL0/5031y+OAGlS6YB3Lh6R5+2z7wopVCPYgeAXtCm4FfQX3HPnSIu
 jnp6U0w/gcv5LbRmhrfgXbQ220zSe6egtCxD4A1H9584ItfKyvroy6zcD/8kom0J527Q
 bunEMqUXCbcMpl3DLQmfQP9WSVXWRYxMiUVDfgN5Z+rtvxaN1Mo2cJf7iEfFkzZaQ2A2
 qrEp9+VxmHjB5JJcwhFuWOP4Fd5Lycxjy4P21U+I4tiDcoFbN48x6PZAQiVXLdAbwNTV
 Prmw==
X-Gm-Message-State: AOJu0YxrwydBc3BbWaRvSE123cCXnpW9EpmSoX/qpBoSV6idgE9avGx2
 mmwAdHErPUUi4IaZ8hDMZMWNPs4Shz6/wpBk8wq8FQ==
X-Received: by 2002:a05:6512:3151:b0:500:adc6:141d with SMTP id
 s17-20020a056512315100b00500adc6141dmr6570552lfi.45.1693314011526; Tue, 29
 Aug 2023 06:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
 <20230822042530.1026751-4-richard.henderson@linaro.org>
In-Reply-To: <20230822042530.1026751-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 14:00:00 +0100
Message-ID: <CAFEAcA9Wi-CU9uk_p4wze9OFQuHJdg_5zjYhOx2awsOOhNdA+A@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] target/arm: Add feature detection for FEAT_Pauth2
 and extensions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o40fbcShe6aB

On Tue, 22 Aug 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Aaron Lindsay <aaron@os.amperecomputing.com>
>
> Rename isar_feature_aa64_pauth_arch to isar_feature_aa64_pauth_qarma5
> to distinguish the other architectural algorithm qarma3.
>
> Add ARMPauthFeature and isar_feature_pauth_feature to cover the
> other pauth conditions.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Message-Id: <20230609172324.982888-3-aaron@os.amperecomputing.com>
> [rth: Add ARMPauthFeature and eliminate most other predicates]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h              | 49 +++++++++++++++++++++++++++++------
>  target/arm/tcg/pauth_helper.c |  2 +-
>  2 files changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fbdbf2df7f..e9fe268453 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3794,28 +3794,61 @@ static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FCMA) != 0;
>  }
>
> +/*
> + * These are the values from APA/API/APA3.
> + *
> + * They must be compared '>=', except EPAC should use '=='.
> + * In the ARM pseudocode, EPAC is treated as not being implemented
> + * by larger values.
> + */

Yeah, but we use PauthFeat_EPAC in exactly one place and
deliberately in a way where it doesn't matter if we use >=...
(I think the pseudocode would be clearer if it was adjusted
to do the same, personally. This ID register field follows
the standard ID scheme which means that increasing values
are supersets, so the "only if equal" part is weird.)

> +typedef enum {
> +    PauthFeat_None         = 0,
> +    PauthFeat_1            = 1,
> +    PauthFeat_EPAC         = 2,
> +    PauthFeat_2            = 3,
> +    PauthFeat_FPAC         = 4,
> +    PauthFeat_FPACCOMBINED = 5,
> +} ARMPauthFeature;
> +
> +static inline ARMPauthFeature
> +isar_feature_pauth_feature(const ARMISARegisters *id)
> +{
> +    /*
> +     * Architecturally, only one of {APA,API,APA3} may be active (non-zero)
> +     * and the other two must be zero.  Thus we may avoid conditionals.
> +     */
> +    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) |
> +            FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API) |
> +            FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3));
> +}
> +
>  static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
>  {
>      /*
>       * Return true if any form of pauth is enabled, as this
>       * predicate controls migration of the 128-bit keys.
>       */
> -    return (id->id_aa64isar1 &
> -            (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
> -             FIELD_DP64(0, ID_AA64ISAR1, API, 0xf) |
> -             FIELD_DP64(0, ID_AA64ISAR1, GPA, 0xf) |
> -             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
> +    return isar_feature_pauth_feature(id) != PauthFeat_None;

Having said "must be compared >=" you then use a != comparison here :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
