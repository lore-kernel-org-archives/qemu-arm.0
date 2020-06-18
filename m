Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1804572lfm;
        Thu, 18 Jun 2020 09:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Ur7K7oX4pLx4MONcNxXPufHve6xI3Qy6SmFSN7rvjh/JERguEkZTcRWQQP65W2RVUmVv
X-Received: by 2002:a67:f349:: with SMTP id p9mr4342472vsm.138.1592497839627;
        Thu, 18 Jun 2020 09:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592497839; cv=none;
        d=google.com; s=arc-20160816;
        b=v0FTx+yNy12CVNjY/IJ7d4qURiEtrqEHnueEspuXj6faR1uXn9xICnv/j4MuHrFsPA
         zAPER8tquc4WpVNTm2agxNFTNREtRn1BJPmCiFBPnkPwbA/xRgJ73xvH1C9iGRxg1NRw
         +t1aWHLHpVq1JA8Zj14o5NDR5NXTF2uNmmJf8/9B7pA1rKb37gY9Z28PzLbPK7KODQ83
         5L2pCQEgb6WpbTndLoHF0p0eVRnvMoaKiKxs1HoG/763aYaPlKWrdJ8chq8u9mzwDm5+
         XZ97IOpcgsbcQBa25058Zdi3c/6A931tvhTwVuVnXSKzD328QIirT5qgeIJeqnpYZ7C/
         Gmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qd8diK4G6IguGXmqangBheq2zhTVbXCdk9eDcRP7wZY=;
        b=JEWL7qx214jZYcM0mleuGBTYbHoKoXdO2obi/1yNC/mfBRerZ61eQ/KiklC4NHpx9Y
         U0s0FP2AWU1iL5HDhUDmrMI4ulp6KvbuJwwkOckdR4ewuMe+ugVICtP2WmniUZgVah8u
         zmc6uP1QfEiGqE3nadrZoXxR/9BJH9IaSWU/cRc3CECMkCV9RI6b1z6yl8XHMAqaAWGV
         Tsywdm51lXDLDfn8n7n/5f9lBjIFTG5NIdgVQzURGgwR1UbCCGuNVd/uMnQKMJJlCA0p
         Wec8uFQp7J/WAWDSwX2w0k+ZQt1ZJpuoxUgJ5p0q4Zqu23WToVxK1X4jCSs7y+RSn6UX
         mEyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1lPrmy1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si213350uaa.241.2020.06.18.09.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1lPrmy1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxR0-0006Gj-TI
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxQg-0006DJ-0M
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:30:18 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxQe-0002AS-DL
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:30:17 -0400
Received: by mail-ot1-x341.google.com with SMTP id n70so5004647ota.5
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qd8diK4G6IguGXmqangBheq2zhTVbXCdk9eDcRP7wZY=;
 b=d1lPrmy1RUThdZO4jQUnA+r9syx2gtRV2acBIDswrkzVhtpOoGqS6Xq71SWcUMMmdq
 arOaiGqSn7pN+nnhxrqCufzY4ZJouXv2mNsNkNoOqJZHL/UBdfluvRwaLNe7DBb7p8I4
 ocrZFnl+2R9bCBeCKiwU3kfWtiAhqxXa9aRQEse7xpQ+P6O3EmZAB5No8Y8JqSAfWdDK
 05FnMJDHds64driWc5/6U803KzoWN9CRpbkWVXC8w2MKjmNxhS7ViRXlXzMeIv7cB/Kw
 5+8GwROK8C4MKz1qXfFPv93ZV1zV/VHrcO4j1XGkcEtkCINPfaARA3LdVWS5M4MZNGQZ
 +aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qd8diK4G6IguGXmqangBheq2zhTVbXCdk9eDcRP7wZY=;
 b=cVaHVGUYFni2yr0goabwOPHh+BTbevpQn2V0jRminIlvF599llXkz2PTRAiq46IEQI
 fyCNGYlqYuVkL+pFYDL9zW7Sb6QyiQ7C0/uPiIjMsUJL5hcT7ujYo7wiuYlKM3EJQ0Cr
 IJvwSzRhHHSoqkD6xh5vIApcL/HbrF7JbJ7/sHUhn9j4b8nkUQ4K3z3PsG9rbsXsl6CT
 t9ECStcYZjxBBH9VVxY5E6jbLxCDQ774eAUGTR7IyOH04PGgwo2X1fq1O/QQSJedXy9a
 2nqhQ8YY4MS4OXS0ZC1RAHZlIu2ZgnpiVkSwk2/Nh4o9e3Jurvs+MU1y9eKDDno3jRwd
 iJKA==
X-Gm-Message-State: AOAM530MNiHq9eZVMEQTWBqVE2hFcWJsSdc5BmmXtWTpro5hb40MwjsA
 dLmfP1PkUZFIhUHi8ZeaEFgoflLW9dzEu2QRyYoRPg==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr4204046oto.91.1592497815358; 
 Thu, 18 Jun 2020 09:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-23-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:30:04 +0100
Message-ID: <CAFEAcA8MJW00H=NmAs8AXLWJ-e28c+GVYjNpwigLBeL5JiULVw@mail.gmail.com>
Subject: Re: [PATCH v7 22/42] target/arm: Move regime_tcr to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fhjKKew9DybR

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly need this in mte_helper.c as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 9 +++++++++
>  target/arm/helper.c    | 9 ---------
>  2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
