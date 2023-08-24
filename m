Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp794537ejc;
        Thu, 24 Aug 2023 08:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDxOX0qZj9Vp0mHtibcMJ/aWF7/bPSXEDr13wFl1X5mGXeP9VI49D/GelTB5B8YOJytJLw
X-Received: by 2002:a05:620a:1aa3:b0:76d:b2d9:ae4b with SMTP id bl35-20020a05620a1aa300b0076db2d9ae4bmr9609520qkb.13.1692892005220;
        Thu, 24 Aug 2023 08:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692892005; cv=none;
        d=google.com; s=arc-20160816;
        b=PAqSSI5MhoOwLM16rFHEdJch5EQcv057ZAYNtzdC0Mb7+SmWtSGQ1xJLB2rneBfCD9
         xtpX7AFSNNQRVkMeiKjoun5hcXYCduYlczNvyuBRpAZFQTwZWRayzadkMq+VbBJdapYy
         Gdmo7PtEUEW/SQ92a8mKssIgTPuuJ2oNsPTUl8sAuPt4LuRNgNN5RM+1aLeKZQv/r8Wo
         4OxkwKYOR9IMpH4ySMqjEcMykC+hXZcD3r6yrIBVKtXHGo7Zcg6M3x8T8uXtu7nYkpQ5
         acFkAe9nzXq9KsjJ8ZGFB+StPqpajsw4/8QCTfzyd+6T0XjMAtL9dxVAPencDWSpufxu
         hoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=q4+VhaEXgXmTqoLvMnT0KLXbNrAjiK0HmCXQR6EejPs=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=b38u7j7Dn9yWOlarDUIa0mkmDGDjD39bPFcrGHHMVoLzqxGGwHbAXTzUYqloDVKAvO
         UGg6J3PjkO7tlH24bnZcqpx0HE70q3FVHgP14OCN7VQYro0Wp+H7LS67A8pWGs9Yqi1f
         KLMR/vadJ9ee9KRhrZwVmAlOcSn+jRPsba6+lx+TwC7A/Sjh7DGm7ZnUGqClyLMU5idQ
         PzfkeJQEZHMGbw5pue/6tp1gsgrbrtBB8tF2JAfubIr/+pOZKxc+6ux5tUKLbDBdhzNO
         l5+r6YMAKb6WWdSeNMrzuIpUY7C0hOjJV+4/WKY6dUndkEcgRCUY350RBPwFxolnSrxn
         K2cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5rWY2C0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a290100b0076cb4e7869csi8460208qkp.243.2023.08.24.08.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 08:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5rWY2C0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qZCXd-00058x-T3; Thu, 24 Aug 2023 11:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCXZ-000570-ND
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 11:46:35 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCXX-0006UH-I8
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 11:46:33 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52683da3f5cso52898a12.3
 for <qemu-devel@nongnu.org>; Thu, 24 Aug 2023 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692891990; x=1693496790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q4+VhaEXgXmTqoLvMnT0KLXbNrAjiK0HmCXQR6EejPs=;
 b=d5rWY2C02fteoKQEjfM63Y/iL5yXLQuiQ181gDfv6xm6hq82llRhvRyaKq4CdMKcv/
 D3qCkqsOH2cqMtxWgivopw0aqEuvHa0o94OgdphIkH/NEEVbCg27v3tXR8u0lwtjIp1v
 SWa1GlmAbkautJhYKTYNVfo0oE96GmT/biW4VtqMe/ZB132S7CgdOnS8J2ZeWrB3nGgb
 nLEMZx1ELwRwA6o074Nyw08cTkcurTB5iiigneddhNL27nBtbsrBiJehEq7efE9cS2l0
 UsdGz3ITZt9epEZlXL5FMd1mfSjhF7PKutFS3tq0ClPhU2GcKrvmUhRMTWWxOEox7Dvm
 jeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692891990; x=1693496790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4+VhaEXgXmTqoLvMnT0KLXbNrAjiK0HmCXQR6EejPs=;
 b=GtzFP9ZwCvhxfGmgRaxIX22S0/DHnx4JGjbD0P99Np7fPMdzjZHcRae+zEnChabYIz
 E9S8r41/UDWA8ymM/MThfQ69gkQa74uVTszaZ5nUU4LRcPM9bMTJTu1DvA4nG/ou6ox5
 SqvP/xs65t0EAQrTNxL4TPpE27RhJ1lwE29BcoMG2vaPiRWelIiwWtey3Hg0mBu4uvY0
 8I6nk2ek1EYmZgEeF2s23FAzW+7mKRrb9onN9LfwZpwouCDP+sUhMdShYkUHWwSc0rGp
 JQuQg6314OCPhNlAbOSV6q4GJwa1uscQY+9wMUU7KIPK/j0NGi2YBH3dKX4LgLlDM0fh
 DfoA==
X-Gm-Message-State: AOJu0YxZRI23kMK7XnD4y5Z7MAI2JzB98F8wBXkwwNJvEB2n6Ul7bkEL
 P2fV1buZJ8GMzuMgb75BudSHt2WL1fZXQKwYJ3ZuPA==
X-Received: by 2002:a50:fa83:0:b0:525:7da7:af10 with SMTP id
 w3-20020a50fa83000000b005257da7af10mr12646872edr.23.1692891989894; Thu, 24
 Aug 2023 08:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-5-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Aug 2023 16:46:19 +0100
Message-ID: <CAFEAcA9ks2dTKJQpfw6JwiBp7HVZ1r0ehQDQJQ0ZKXyFm80DmA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] target/arm: When tag memory is not present,
 set MTE=1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gD+Je1r+vUDi

On Fri, 11 Aug 2023 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When the cpu support MTE, but the system does not, reduce cpu
> support to user instructions at EL0 instead of completely
> disabling MTE.  If we encounter a cpu implementation which does
> something else, we can revisit this setting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
