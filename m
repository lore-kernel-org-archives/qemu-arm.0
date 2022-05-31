Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3400005lfh;
        Tue, 31 May 2022 05:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4+LPSVy3D++agA5vuL7d9tf0wGbmWfDkXNiO7Fg5P9YtSz8wC6MhEds/SEo4o5WMrwZif
X-Received: by 2002:adf:f291:0:b0:20d:bc00:61d1 with SMTP id k17-20020adff291000000b0020dbc0061d1mr49785551wro.203.1653998629582;
        Tue, 31 May 2022 05:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653998629; cv=none;
        d=google.com; s=arc-20160816;
        b=a9mUvoASOwZs+Tm+XtMNBcpaca3I5kP2GKFpgd8488mD/UwAIx9UQQhq9Wijy5chCx
         i5UBMv7sfA1duvCNeY9dV22j6i98ERpeENWcwy6UgUl8GCy0RV3VIIayap5MfNPMM+gf
         HtOcr7ArlFfCmz1x60KMdc7NGyc3049Ei6ypRM6WreGwN3ASz3iDhdb9gsHVYhtdpgWX
         NkX1HY6gIb1rd6A4xAe+LasHq68gY+1Wix78kiMnohrSmPIqehHzpMtHuproJ/0EBCgL
         oh3y7nEOrp07fDZbYT5RMey6qhEcv5vIMiDonJ0Jx29l0K0M+DCOOVbgem8+K8V5FNqz
         olyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6J/QaCCnPNnkoC5s5/lsaV1xAHyOU6JElZI8xeg+4Ro=;
        b=rTpviqWWZlm6sW3/kTNcek45ndKNqMgeIb/L43OCap4sov8ttusihXLzoDG7kb74Kh
         KhNq5AVeeMEsfWRS5BEnWiMWxjq2EPyG3+/dYl52mBu5uJYNI2cGNEILWHc39iDyaF58
         y6+Cgwn6wH9LbQKTv7C1Virr3i2abye8uXJ/j2muX2oOOyCT2a/CJM+yUnUu0glQOc/p
         Gu5qqzuq9ZXLUOZtheAibBKH3gfTP1Xe+TaSZuMcPIHsJDGJDY0MTp5oPpkhvRHUpAjr
         sQIs1gigpaRkOHgOhMJ8O2ca8GaOcEnSSAVCQjXBmyRRYJPcniUhYkTG6Donigkn1qIz
         U9kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UpqCrZOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a5d4fc2000000b0020fc383d737si10879682wrw.465.2022.05.31.05.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UpqCrZOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0bE-0002y3-RX
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0av-0002wW-BH
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:03:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0at-0001b1-77
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:03:28 -0400
Received: by mail-pf1-x433.google.com with SMTP id j6so12970992pfe.13
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6J/QaCCnPNnkoC5s5/lsaV1xAHyOU6JElZI8xeg+4Ro=;
 b=UpqCrZOLS4YRElqOD8VVVCpJr3TykyOxgtW1gz9V4rrVWB97HOV6H5Ppkw701nsA43
 kk8Njm873H4SFJ7+F/s9BzXt2chjFnae6+XRDOM+EklGsVKFdczCxdeZQfFiLG0q5wn5
 RIzwGB/I76mOjHX7HXEaE2k4Eji62HalS66dskik23ZPEumPExtuuReiRtOIEjBbNdvL
 lZEnRABuTez24X+faanc6mZOD0Ptuk8N/QHTssj8j7g8HFRPw69bMhLB+yp+hkVn/R+Z
 4pkRc1PH1bH88Lz84/KDva0b/4/cykBrycOiiWTOLq85xyNQ4fhb78wuWme/UmwUd3NN
 0vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6J/QaCCnPNnkoC5s5/lsaV1xAHyOU6JElZI8xeg+4Ro=;
 b=3i185J2p8SgqcCZhbaUj2ufHCdh7ShVRSGc2yWRikQ90iINMwyrWhpQkSaOlaJT1Q7
 1DCJqejKso/AvfkgNznS12PJx1mKtPbKhDci03vB8ayHI/zKn0oO4AK5ABqtPu1otv3a
 FDyqGGjTdz9iyjw7BRDcmFq9ViiuhWt91dJ/8Qrh9cC+4f+k72+XdTzuk6UdodzQjBFX
 rNx7JJDeSq+viIr2uuEtEYbSobbOVJkdB3FAhKRg1r7pegEYzfBfKzwx/qPpcAH1xn90
 X69MNJuPhK6yarekdbsYZuz5LtvSULwdYmHHBpq8h0RDKWD6cJ7X9Ql0RSV6vnqdFBKS
 qfSA==
X-Gm-Message-State: AOAM532SMBa8sqrc6X8R9pc0m5VD2rMIgcQYcsVaEpBfCON7PYx/UHi8
 AW6qM2bmwyvrDLsbrA44n8ve0yZP4Y4RuZB3pWwiug==
X-Received: by 2002:a65:6250:0:b0:3c6:8a09:249 with SMTP id
 q16-20020a656250000000b003c68a090249mr52821973pgv.389.1653998605630; Tue, 31
 May 2022 05:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-6-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:03:14 +0100
Message-ID: <CAFEAcA_orD7ZUrWThNHCvvWxgRPJN1UrqP+xuhevncxmRsmQ9g@mail.gmail.com>
Subject: Re: [PATCH 05/18] target/arm: Move arm_singlestep_active out of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 91ibjkUKaxJ/

On Mon, 23 May 2022 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the function to debug_helper.c, and the
> declaration to internals.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
