Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp318014lfk;
        Fri, 22 Apr 2022 02:58:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxM3B2nucIp5eVKPmDKAB4xhg0OOdHIICkXkB2YcYkaWPT3YwFGm9DRlXbxkyshDb8sbpM
X-Received: by 2002:a05:620a:28d1:b0:69f:376:7d93 with SMTP id l17-20020a05620a28d100b0069f03767d93mr2064238qkp.710.1650621507627;
        Fri, 22 Apr 2022 02:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650621507; cv=none;
        d=google.com; s=arc-20160816;
        b=aFxgCNY10Covuwr1pmJGmCGAwx8rl7dYFvHxNQZgaEJk2mQMPrOo6luHSeTMSzFDIM
         JMidv42b27na/2gYR1xumRRlmSqGgEzF8q4vRvBKlrYGlJeNqR5BV0COmomZkFbp/2T6
         zraWLYRf3+f/vZFeHPEededYn1IL8epQ65thZR3lu+KRwGnJ48j4GltOeEJJd1mI5cKl
         1RtaHkPglBgAPeXP/CqxuYto6Ri/n6PEikGrVk5XgGMTDa38lLnlWSfEaKrXvdJ4al2p
         4X9LfR7zn6x7eY4yyn/fgmJ68A0jlSUWEY0OcdLO0vb7XKmklKdokobQYvMhZJNByZx/
         fsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XJPHEgoOJ+ItzhjfRqSr1f4ZwMiieNqr+Co9gMeqiUE=;
        b=VeDdPagerFr17iVrOKqgp2XzH1FkDTSvXuHAJ+CgT0bPLBmPc5rNOGu+qJUdkyNq3K
         4bYqGEsAiCAtAjch4zq4nAq7S+D4k1iQue7CxCLcHDnagVBeAK+c9AZA/d7zcF4fJgTQ
         4asdqu1Y0I6rg+zgXNSl5nsydarqrf1upDIckzqKz6UVM+W8Zu275r/b1VNDX39vlaGa
         dltgPWVp+BSxF/Ug+Qz6G2EotgAYmU6T4k1LBvnHY3piiWlAvEw6ZNn6wibJHpwy0Hah
         Szj1WEs4qilulihTKk9AduABbGA2DPfiZNKjytGxIvJh/HcKukzeV6sHbVXjAzkYNkn4
         IoTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="P/8Q1M5r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020a0562140d8500b004462b86fa1dsi2038390qve.267.2022.04.22.02.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:58:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="P/8Q1M5r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhq3X-0006sB-4r
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq2f-0006pS-Gx
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:57:33 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq2e-0001Vz-1t
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:57:33 -0400
Received: by mail-yb1-xb33.google.com with SMTP id f17so13528743ybj.10
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJPHEgoOJ+ItzhjfRqSr1f4ZwMiieNqr+Co9gMeqiUE=;
 b=P/8Q1M5rrJglX6EXlIWFS8iWv9Wx2aqq2alrMtDAq0/iHpJSgVC8grH3bnNYV8bERT
 bDpfFN5tAMGRKLHxQfW+h/6LBGCDm8tcdpSY0U/d94KMS5fJM5YokAMaHmcWuRhhg6XD
 lOmndHAh/oTq53bJgaEFehyHe0hhkUUExZWvlJAealei3D6dwc9QOI39Sy196/+x9Jea
 y1hZqsdhmtnI7YfTzMBNkzI8EHy6F5zV7VYTC6keAY3L86O5qM2tqGVPyJ84veVFIqOV
 p2vW+SuaWBDiTyswFErkSzdUKtbLYAsoQl3oHnrGEuytjUOQgSP5+8Nqj+Kgq29MlQUG
 OqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJPHEgoOJ+ItzhjfRqSr1f4ZwMiieNqr+Co9gMeqiUE=;
 b=RtGm0RMaDQVic+8ANc+MDaOGpeECGrKRV3G1M6w15pE50NqPMhtn0z51lfBKpFlVLR
 S7eLIDLT3hWz/doLveL9z5kL5whFs2T5cwP8Ij+YROu3iU64iCFkjee3rbkQcpN3Dnso
 1d4FXKBoUfkc+4VikeAgx6n90sFteapyWWwW7CA3ovymrOqqUTxUB7iKJ4A0kQCipgJi
 gbAtWlb9HCxJTUyQBlzHyO2GOYTHacUBOPnK6967u9AEVDp+LztphydqhQG7TZsC9FEr
 wdkDhvGIEkDu+klnnTkkX4mMuT2lhjmoX86UDakNV6pHlc+3yPNy3UYtRkP2pws67YI7
 FP5A==
X-Gm-Message-State: AOAM530M2dYRGx5fIt0vykBPvel7sd0UNgT7x8jNX7XlLJnUqrqqF0IS
 sBzq3uRzhuIvzKPoL0EF7SsOtVk/ut97QGtbkJk1Iw==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr2426202yba.193.1650621450166; Fri, 22
 Apr 2022 02:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-32-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:57:18 +0100
Message-ID: <CAFEAcA_W5euKsWkYCR3sg=WoADa3QFS2uWOh47vRE7S5=t1DQw@mail.gmail.com>
Subject: Re: [PATCH v3 31/60] target/arm: Name CPSecureState type
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7kQO6IBNBsb+

On Sun, 17 Apr 2022 at 19:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Give this enum a name and use in ARMCPRegInfo and add_cpreg_to_hashtable.
> Add the enumerator ARM_CP_SECSTATE_BOTH to clarify how 0
> is handled in define_one_arm_cp_reg_with_opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h | 7 ++++---
>  target/arm/helper.c | 3 ++-
>  2 files changed, 6 insertions(+), 4 deletions(-)

Maybe also change the "default" in the switch in
define_one_arm_cp_reg_with_opaque() to "case ARM_CP_SECSTATE_BOTH" ?
Either way,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
