Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp599783lfb;
        Thu, 9 Jun 2022 10:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye2Hb+0KYs6TFzWjeynrBgzyjpdmYRcJwqNC5d280hVfDj/b7eWRfQvgnXbQH4oZ+BcUfo
X-Received: by 2002:a05:622a:144e:b0:304:e73f:33ca with SMTP id v14-20020a05622a144e00b00304e73f33camr21534961qtx.96.1654796953010;
        Thu, 09 Jun 2022 10:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654796953; cv=none;
        d=google.com; s=arc-20160816;
        b=05kw3DMMS1M7zBly7IXGBZ9AJ0IthZHc+i+m336vLsO+l79cLOgjVHl7VsB+fiA40e
         WX5m9xdeUar0y7lVPhb5QYvuQDuT1htQ0e5h73IOAV6kZ40uw7qjf5zDAnnoc7+qyQ0C
         11N7OvM/Bqnc3ItogQOdA/AhfJMIPBPrRZlGYcRTA2atJG3TQGd6W6a7B5E2csEQY7Kg
         6jajLfkWUU/Xq5keVrDNrW6TYWxGkLwn/xvjPmWl1dYg8bmtf6Sb+K3g8zOwuIS+0WIR
         iUtzlEAWqfw6f9JraqfaxAAIPCj72ouBWJbBO/3W6QJ2J0NPBmah6fcQ7pkQZL1/aPgt
         qWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tBajfl/V9PKEjNWjC6gpud/59W1ow91+uYXhZxUnyJc=;
        b=yqfpu/1EHBtIaz8nahyZyyHz4YlhUS9Mn1FLApiPAnC5ydl58/X62/rKIuElIdD4mX
         NIljoQJDnM70k+QA/LjruDAod7pFUthTfZ+HvZA+EXteT5K7a6VYWVvGI5AM1+DBlnyv
         M8W6bjTfg9Jsv91hs6nt15iHupWpSFMhz2RmkrTHGfEK9n6ZVB3+ZTLrBpQE5ZHwDd13
         hsH3nXn/eRTOHRAu4zf7pTmzJ1h3X6sjgRT71mepPdHh4EADrIvb+BFvEUoYgixEcs4J
         xFpnEhu4Wzcaie//C8PloBK61xZAm4U54YeXrcRFxHQIOwDQyOBRypzClL4YZtJW8Dhd
         EPig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iXCBljsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a37a50b000000b006a6aba8ed8asi8420095qke.617.2022.06.09.10.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iXCBljsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzMHQ-00019o-HC
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKep-0005cz-7S
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:05:16 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKem-00085e-Hh
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:05:14 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e184so42528729ybf.8
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBajfl/V9PKEjNWjC6gpud/59W1ow91+uYXhZxUnyJc=;
 b=iXCBljsKllXPdXbsBVRgKD43Sb7in/zRrEioT+qwJU6gSuT7I9XigqhLL8IcrYR3Wb
 uy7+5z1UFkV2TC/5eLxQQxPaJl17U0j8vczN6z/b1GrSqWR9TPSWUfHKwzx4I3SJzozd
 5mW2Q5Tz4D3WWxpAwUHaiG0q+1l95X9Swu6H8hRgkic6iLnCw66hUWqbNMKWp6kME17T
 upH/keN+/8KQmmvPtH6TL9d1BsoP2PQ4kPJmUcltYdxJjxA8jwbwEycgb76TQi5CMhU7
 o/gmMm5PF1k20keJuOaOSk7y3nhw1wy1BY0pPKm+unzp/QqPKsqJbijKMWIkITNx68bU
 fTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBajfl/V9PKEjNWjC6gpud/59W1ow91+uYXhZxUnyJc=;
 b=k1LkQt1ne1qzZoGVmVkcICsQL4vM7dbg/on0fhxUxsckUZJFgaobTk/YswxoMUf981
 zg4N6MpHXCOQEXEEJRbi3Cyhq7iQBITvMnsXj3RvmhAkZ9M3+ma5K1DpA7ng47r6D2cF
 LrMvWuEOq7zNZEBebguE0VqbnlX6ExDfbvZWyfoDYPOPAZPef1AgJ4NQe840GLi1HVwB
 OdKUfd2zQxfOrUuq+1rS3oNpd9mrynKekUdvjraQdow2weAjYrT8aRo5eSih1IZ3cmDm
 fTQg309qIRMc7bq8y1NQs3QY6wkQwkGFTYC5/9ZWCXK63rZ1VvosAGviingZbIKIsI8l
 gLoA==
X-Gm-Message-State: AOAM530rxjMi3Q7HWB/fmCYpRUu1Ik3DYlQlcxwh4SJ/ZWXAINlcvyg0
 /yBg6VlyovDsW8E08pPmldw6o8BnLg6ZYoe3P25vf1LgwH4=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr40938204ybq.67.1654790711269; Thu, 09
 Jun 2022 09:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-12-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:05:00 +0100
Message-ID: <CAFEAcA_CBwzJqMSknGf6kfRGHBukeqFHnNobYksbcuy7J=kt7A@mail.gmail.com>
Subject: Re: [PATCH v2 11/25] target/arm: Introduce gen_exception_insn_el_v
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LWseMvoIp0Rm

On Tue, 7 Jun 2022 at 03:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a function below gen_exception_insn that takes
> the target_el as a TCGv_i32, replacing gen_exception_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
