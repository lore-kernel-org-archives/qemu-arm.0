Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1965500lfb;
        Tue, 7 Jun 2022 02:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhIljCfk8TGktZJtZ9qrS2lxWfdWa6mSlwmEuqiXdBwaV8C2Si+i7sNR6itwPblp96TDiB
X-Received: by 2002:a05:6214:29c5:b0:464:5850:d57f with SMTP id gh5-20020a05621429c500b004645850d57fmr20242650qvb.126.1654595941330;
        Tue, 07 Jun 2022 02:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654595941; cv=none;
        d=google.com; s=arc-20160816;
        b=ouiYOF3oXPZ/oHHMDF4DvvD0r8iWxNGFJ45MYC3vx9yvKtk9xAOL8i6QH2Q6sdV07L
         N5as5tSRRk8OH9ysrgmUCyldlDa4aoFfWo8e8YppOm8CGWvXb5NQchW1AwbuCh+HxC9H
         ef5u1XGhpMHChOl+YT+T84daPEEd60Cc3ppOX00Ox88d1PgbWojMlp2vF7Rm8RcnmaFs
         8qPwj1mNwJBe/mw3/V3mLf1wz1670qjn9LaOnJe5OLbMD8zTWP0vvn52qMoBqomb4kM2
         ucZjSDdg4ir61olygyMNttgFhTj785+oOWAX//Sk9RINymnHLLxaVbWWDwnyJ6kPljCo
         rvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Ny3tMLV3lK+PSTk3NPnQGfhKomzaHenxVLPmgZphLrQ=;
        b=IUHfifg+mZH44AYzdIAX2cU5Sj12lQtzZ5Satz4UK8Igqwc0z1f8WAl04rlP2u8WtN
         O1G+wld8tgR1JDr/sSuyWvpWqT8542UFEf56RgQca6nPmD2ftadjEr8Gup5IMBHi/YJX
         lt4y2SLzy5tPSM8p4Fw8DQT65U77liLyz+W5+mRmCBf5YZUBKDgbUM+nmpezFBY+z5/w
         TB006STGPSlbvkWmVxydsxhau6mVFsloenGM6+qtpwse4//r3q3pHHzwovPUFiKg8ZZQ
         1raOQlxawaTy4TSTFzLcmeedAxachOcAI25Tq3nCbs+GDK6ilvv3BlkUgWn0YGJkpkNO
         8VcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBV3Rx9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020ac85bcf000000b002f3d8711217si6364559qtb.659.2022.06.07.02.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 02:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBV3Rx9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyVzI-0002a8-2T
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 05:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVvA-0007Zs-NU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:54:44 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVv5-0003Wz-GB
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:54:44 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-30fdbe7467cso134263347b3.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ny3tMLV3lK+PSTk3NPnQGfhKomzaHenxVLPmgZphLrQ=;
 b=QBV3Rx9mJ7rCJJ7QyjQuXu8mv2YTZyNV8zjwLn11GAZ6Q08dNiXAOmCrrOOE/6UlwT
 MMHsXzdqcjIy79rp/P/C0NPPhh9C+dV519IWYauM2Sup0x7UkvahF9NtsKQ3Cc4D+gf9
 cvkgxYlA/6CP3FU+cgPF7+3HHApVkTYhvVpf2hdtNIqU+9HqTke46K3uGe078aQ+Oojd
 cdSXAKVfftAcpx0Pri81ut+IrwGsU/W7/Nkx8mqn6TA0i02+gp5Iz/OebQYVSElh5ajz
 6ln4eKTcrTu7EpMmN8duPGW5yTODhUX2muiAO3D2+SWlS703uGaydYvqLRvtAAEHEpkQ
 +4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ny3tMLV3lK+PSTk3NPnQGfhKomzaHenxVLPmgZphLrQ=;
 b=xvjOqcnRgbjx1eSdLZpDes8Ip0Vo6lW2djabjJ+9OnrU3rWPH1pmuj3HiOwswsZ4W7
 As5HyrwMfB9/o8bL8+hweGziasHgVBKTmV3nAI6a8StqrCN/0MBf5b/i6ehjzscRz/10
 anTfDRfuxlmBfQU9MNghkTIH6R+J5Kn+TDi+Iqqwsc3Is6Dc2WijgjIre6tegl/Q6RV7
 Rb6TICYppZCwiWvkwpFyIjO3T9lG4OR2Z7LxDv8MzqqenJNGVUTRH0hmzVeusFV47RY6
 aCWSWYPgfWNkhMQeDN8GG5lQsREU/bLhY9ivZ7xudKUFyMdJMQncpBFsWVHAIO0JMVvl
 YogA==
X-Gm-Message-State: AOAM5337dryoYoDIB6VwVQI7LpEEHYlJaRqqBzuMyD0WHwE1yOMf7JGV
 oQTamNo4THvqnX0n1/hrh2cRm+xYyXztNR1+bQpo0g==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr29957437ywc.329.1654595678284; Tue, 07
 Jun 2022 02:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-39-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 10:54:27 +0100
Message-ID: <CAFEAcA_1T3SPwWrBJgem9S3mtT1RZNYnbuc79aVoTiYf26yuog@mail.gmail.com>
Subject: Re: [PATCH 38/71] target/arm: Introduce sve_vqm1_for_el_sm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOHqqHyeHFQT

On Thu, 2 Jun 2022 at 23:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When Streaming SVE mode is enabled, the size is taken from
> SMCR_ELx instead of ZCR_ELx.  The format is shared, but the
> set of vector lengths is not.  Further, Streaming SVE does
> not require any particular length to be supported.
>
> Adjust sve_vqm1_for_el to pass the current value of PSTATE.SM
> to the new function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
