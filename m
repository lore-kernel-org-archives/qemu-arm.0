Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3501253lfq;
        Tue, 19 Jan 2021 09:12:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3zr4SPUH46LUSpkaPAzECQDE3L5GOIJ40dagiTrKwIOGYebTiviROHlJOHt89JeQEZkXl
X-Received: by 2002:a25:f30e:: with SMTP id c14mr6047195ybs.251.1611076352766;
        Tue, 19 Jan 2021 09:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611076352; cv=none;
        d=google.com; s=arc-20160816;
        b=uRJDzBkxLp4s1cSJ46pMWrESO5pGbn5vB7HA3w0/dkFZ3TpXDYloc6j/J57M4ApJO4
         Gu931oJlZudF3J6cmfQvvxcxKuQkFaOWZR/vfJLKTsdD+DCWnrlGt9YniqPMH29cEThP
         j8mlooBH9z+VIyITMSDV9tpzhx5bW9X4L5XDqybkTQKZsBIkplvAIZXvYUE771Z5sLRf
         a8awQ1PTJeQyTVFxJfFe2YKyd5gep5RA6dv8VPeI1ycTYq8R5z+0Y8PCeR5uc1ctDwuj
         O+ZwV6b3lgBFHn32MeE2AKxZU7wtwiczKi5/unIGWUYDYXynhxkDe7YKhBa2sRqC3SfR
         /e4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5X5r7WJa+XVSX3DxTy0uivshgXFWba6je8SNSjwNWiA=;
        b=fgTkGfjQz+YGsFnEqLYtasGSPsjW05AwF1zOgvH4qJpdIEyiKlXPgGeIBWpvKCkydd
         C7uR5EN0B6XTKvSmZuHmYO6m4+yrECcHEX0s3GyEHw46ckkdW9ij/NkyzUww+UOGGWdd
         8hTZbJXWQVnG8/y3KaiBGpoKd7DTewSX2krABNKqs4suZoWKLh17gK8ceHnEeZ1xtoZU
         vfKpjIBKc0b/4j0tTsj+cdVtjj4sPDNp/MwXyg5cwpmiLGNdCSsjPKzWvWdU6Q+t/2zi
         Kol4T1I6ObndpvtM5+a51ugtNJVX9mRYxVDQ7Q1ZD5FrNgM0R31VDPTxoWEa0FuSv7vj
         wZpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wjbV2mEU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q85si14994025ybq.268.2021.01.19.09.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 09:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wjbV2mEU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uYS-00086E-5s
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 12:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uTs-0004pm-6g
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:07:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uTq-0004Mk-EV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:07:47 -0500
Received: by mail-ej1-x633.google.com with SMTP id b5so13116224ejv.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5X5r7WJa+XVSX3DxTy0uivshgXFWba6je8SNSjwNWiA=;
 b=wjbV2mEUaOSKa2Iw+ywGM5gihj8z51nig4Q0DsaAzdGQJLLoayWKoxjoqkqZ/jB/eR
 1ugkhEJe9ccFu4jZV9/C4Bky+wQdkJ5rUjH1Dk2YWLMQcYVqPf2hKXLNkfV9DBaqzWiF
 plfLw0/5get/M0rFMBrhYWN2zcB5PFSnjc42GY6a1u391AawXHifpf3Aj9/VL8J02+ba
 fRMoxAlLKp5Z9hzm1ajqt9w3WglGKrXirSwo3t607TM9K1RLaR3oWxL3Gu0cEwsiKtL3
 7f9qjEtdin+7dQ8GCmT1aJIvLL9xdmV1qzC+dSLrDtV2PtsL0iatBMB0eWboXw/ABPe1
 EiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5X5r7WJa+XVSX3DxTy0uivshgXFWba6je8SNSjwNWiA=;
 b=ZZ6xESphcCcMXasUX7kixLh7S9XaKZv8LHxt+mhNin4J9viWejlG7ad2FGLBbE8afh
 nmPRochBzHZxz58BgiA7HnSOTDNF+IaObTM7Kp5AE2ofnLzmbZbk+Hk+/tArAAIDgP9O
 CcenqFK3wzdxFecbMraLCP67g67xvhJzpFMWDOfKWEC7gJ/nPVvw9KhrCiryoiWXt+iA
 WiF2pd/GqvgNDJ47txcrFkw2CqtPpCEfZEiP6ZLaot1SGmUJeOAr0fxjMKqIJFMzQBCG
 rcDasMS5X+kPTLc0+ib1FFpUMwWzh9zTx/Flc0YaVGMTkB6cipc+QeE8p84i+VHzntUf
 F7Bg==
X-Gm-Message-State: AOAM532mjNKjeX6dcBsgntlD0siPUedLsmxHQndElfsnuF0fkIjRuujj
 oe+RgYdAupLMnBh4fk4XpWp63DGRh9VITkeIuGWmmw==
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3551386ejv.4.1611076062944; 
 Tue, 19 Jan 2021 09:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-16-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:07:31 +0000
Message-ID: <CAFEAcA8Nin7uEFHMT_zAgJU4bbAbHktj8mL+8WoA7cbX3j-yqA@mail.gmail.com>
Subject: Re: [PATCH v3 15/21] target/arm: Split out syndrome.h from internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dXhv4DkHw5Sh

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move everything related to syndromes to a new file,
> which can be shared with linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 245 +-----------------------------------
>  target/arm/syndrome.h  | 273 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 274 insertions(+), 244 deletions(-)
>  create mode 100644 target/arm/syndrome.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
