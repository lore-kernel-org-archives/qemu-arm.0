Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp287595eju;
        Thu, 4 Apr 2024 07:15:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXV0k8ygn3z/aKnr69mRa1mX/1pdhNXafxNv5IHRu2bc2IjX9C81GzQ/6klvCRd/9FQCyRy+mG5yxgLZ77B03JcD4Ft/I0b
X-Google-Smtp-Source: AGHT+IE//yHerkpEN8dR7rr2scgskDRiv0DK7htGhX4MXJBFanqVBjHtdXNOYRK2Pfdxve5LBTXO
X-Received: by 2002:a05:620a:5a60:b0:78a:6e2f:8a3b with SMTP id wx32-20020a05620a5a6000b0078a6e2f8a3bmr2475081qkn.32.1712240158712;
        Thu, 04 Apr 2024 07:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240158; cv=none;
        d=google.com; s=arc-20160816;
        b=closEmbx26r1PjiFIqY2UjLLsn+dV6hnWXGuhyPiI2pYIRP+ptw3Lh6Yxi31wRLGtv
         7Drz0SJtibyT+fyeEXGrZXQhIPjkvmju3EeMtyzzuD95ctuYp0ZloQL0ZK8b/WousRJX
         egtG81CaMkMHt5H9KtsU5empilYsOrgNPSyTwmJUFgFsds/GHf5QcgambB/GWpltmvlr
         aHSuMiG/BGALTLjL343UXH7ZfjxMlCSrxgvbeMfC486qEjc+09YeHQKgBy/TXZjNnQSx
         RV0vloAVxA9s2ZQVdBzbJ+OZwgG3CRiScyZ+yn0e3VFiTxPHD4BIs3bsxiwTdLGFVnwt
         1Dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=P90flCIXqUHtKs0vW1E9bDJJZ4uMb2sFup+Z/DHN1cc=;
        fh=DVySG/Otr65ipM+QyT4AwBWW/OpyyDmByvB8pEQu/Fg=;
        b=Yuj9Y3trcrVKAiyhDyvNE5fdXtTDYK5Ju6JNEh5mrJQKb/GnQP7nHTL2HS/STxwqxg
         3eP+NNjoZRn7O2Ka4KaSEz3VWcDBzL58qtpA87fUSAY3FHXdzo+5ktQ70JytHSanmqre
         +GIQZtmLQqYaa/lt5bZRhXdyzzv6FrL9RdL6yNnM61SbaAhxpbL/6cGiqF8PwsXDVnZy
         Nlbe6e8DyRODEDZd18h63XiaVvBfxOrzJYc9iTsAmDtvk/C9LjCSEYzp8wV3zBmxwYgO
         BQNPOcBcPlQjqlcoZQXci7AjvxsHmSIxqAeZLzk3H7snFQjxhEPgQF45bqnjQX6Izgec
         bSxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKOGCR5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q23-20020a05620a0c9700b00788625ddf9asi16188680qki.224.2024.04.04.07.15.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:15:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKOGCR5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNsU-0005PC-4h; Thu, 04 Apr 2024 10:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNsL-0005Eo-8N
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:15:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNsH-0008Ei-UL
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:15:32 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56c404da0ebso1622019a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240126; x=1712844926; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P90flCIXqUHtKs0vW1E9bDJJZ4uMb2sFup+Z/DHN1cc=;
 b=nKOGCR5ZyjT+R3jQAdGhGm4lrCuX8Cf1zpCripENtv1uL5ONeo2vAJ+G0yhYNsDVCe
 3itiA1GaI7ESbGgWgnufFQSwWAonPjlVBx/Re7CwXvMwvxt+8rVlqxuHIFTtqZoDLl4r
 s9t9QYZxsvPYMpbEmHnz4wKWLjrETDGpdVQylEKVsq8IoMvbNCTsaWKeQluqJqinqrwn
 5V9AXGauAo7Hmhf1ERvJvmCjKa3kKpxYdROED35dFabXwl/uDSaYaTuB2Thmzuc2uB1X
 77zH7f5peNABJiwip89JnY5fjeskFBiKl1YAH4+IjAmfIUwNxNj22kN6nt4xhasJGQBU
 qYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240126; x=1712844926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P90flCIXqUHtKs0vW1E9bDJJZ4uMb2sFup+Z/DHN1cc=;
 b=TRrP1GmJFyFmKX5xX2+tfV0WFBSrJyOHaiNXbqPFJSIfaC3R/49wjRA8TSbCGmYF4t
 dEgXWfoLrRJy/inFSq3W/WrDLgSm+dj4Vn+DRxGPUWFtEv05ofOkrM/kDxcGrWeuTRgL
 4nuh7uulqIeugaLoi/PctuEDOo/SBX1wBVoLpIUP6ZOf0gYH0OjJ70tM/JcxWqwtvqfa
 lCzR5ne4QiI7pE4JX8gWnExtdJc4i5GiSgaUuHdqBf86HTt4o+DEe1hXYEGKXejSRB7i
 PFpbb/+lduTebjOJ6Spi60lUncxlve//zHKeolMtjPLLr94NVl3zzJUG0WWbM/91Lzvj
 QM1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpRwpp+tEZf/8zIo+hZT67BhPEjqLxpgMoamu1uPNTu0DkBOQ7fAurN5GjYrr6fFRZlod4fZs1hwrqHAbxmDOPU+ZF
X-Gm-Message-State: AOJu0YxGHew8AhiDWNHVL1ZxjdqLHWwQg6uLtS8VE6usX1BbojZsiXau
 q3cszu7qHK+CqhpztTy+TfHdM6XEpavCmOvPp8/PxI0nMyTqMU5PpWE+z52ZCeSPvKjImV6KGbo
 2E1Q1olVQhsFArnt1FbJoBuH5LIPqj9oV0Q22Sw==
X-Received: by 2002:a50:9b5a:0:b0:56e:603:9fc9 with SMTP id
 a26-20020a509b5a000000b0056e06039fc9mr1957815edj.3.1712240125191; Thu, 04 Apr
 2024 07:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-4-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-4-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:15:14 +0100
Message-ID: <CAFEAcA9-TJJuDvf1TZO4QcPPgH6Ct6sCbYBUHkhb=c9wxK2fpA@mail.gmail.com>
Subject: Re: [PATCH v12 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 65/D7IaE/p4C

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
> ARMv8.8-A and ARM v9.3-A.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3:
> - Add Reviewed-by.
> - Adjust to before the MSR patches.
> ---
>  target/arm/internals.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index dd3da211a3..516e0584bf 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1229,6 +1229,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
>      if (isar_feature_aa64_mte(id)) {
>          valid |= PSTATE_TCO;
>      }
> +    if (isar_feature_aa64_nmi(id)) {
> +        valid |= PSTATE_ALLINT;
> +    }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
