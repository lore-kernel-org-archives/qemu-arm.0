Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp876723lfb;
        Fri, 22 Jan 2021 06:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOzRuAhoWJ+TWpXt2n3t/qG2DlXs51sL1efco3A2qFhtXNLEnr/zPUfneqE9vyTzBBDKss
X-Received: by 2002:a37:9b55:: with SMTP id d82mr1055849qke.172.1611324311152;
        Fri, 22 Jan 2021 06:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611324311; cv=none;
        d=google.com; s=arc-20160816;
        b=Iehex2zaoPWhwYeCP/KYr5LeXgoh+Jzo/ZWoAoNbA9MCCfX0d+SAhkaGztfgUAhNvJ
         1+zruR77yD9D4tGv5XT4M/H5FUvcHUc8X8QVPO0ovoMFEa6XIgVLMouOtU7fEfcKjCMu
         XgfYn2J7mwHYgv2CIRZkjIh4Nh9oadiKObZhrjUibywyVQR3RgXZd/AYdy7X3JVynJQ1
         11zPY/qP1c8tHuOx99i3BTCPlxFduFbzXWLNRw2LBIaE3h/NBRQIZVHfggEjhPGkporY
         g9bMmSJoVAOGZ2vnzcQTwAZi3o8ps/73rzmxwSaquvxT52LSuZ1rNz0jM/TZhfUDnZS2
         ZbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zPqkB2inCyRDsgVqNysnSw/veEsPoyzxCNm4XEt/C4M=;
        b=fY7nV5DzjerE4zICFlkJQ2koZ/dAihMynimJRMzKq02/dindRJstBa/0jLu5cljQ50
         vqUiX/vJ1HsKr+QskXLhi4TMBjE7ET2vo1vsvvtfGLcxbUinPjGYlmxCJOCphPpnvG5N
         aX9esC0K+2iCFj/lBnyJVf3OStRTk3xQg81T4O9HvZnxz/zf9fYX/DlqK+nFwGNaxo1b
         B7p6N9XPIWThdr+ltrNW3NnBjbWMONocFk65B3EW2Q0QJwvN+fkOeGb33PncaNYSJO6Q
         NZ/F1rrxh7afp9QQ7v3RlXRYPIwWsX1ZReHpi4a6HYl3HxIeo986VhmFtQLPNMoSwDlF
         h3/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F3BeFxqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si1827647vsm.145.2021.01.22.06.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 06:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F3BeFxqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2x3k-0007CZ-PV
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 09:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x3D-0007BX-VK
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 09:04:36 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x38-00036N-IM
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 09:04:35 -0500
Received: by mail-ej1-x62e.google.com with SMTP id r12so7778586ejb.9
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zPqkB2inCyRDsgVqNysnSw/veEsPoyzxCNm4XEt/C4M=;
 b=F3BeFxqWKwwjwBJO2selV3VSh0tMWeIkyiFFHZ4TU/QA1JmsDZxtD+yqfnby9EKXZV
 2m4kFvi/8U7xZ69S3Gr2y81h13H8AL0nEsE/WiOswX23UkzQ6r15YHkt0CNAP7LP433j
 kF307Q92UIW1/lkjmEIdFz1+Ldn9KY10ZGsAZOzm5Rp7XB7DMtWph45lJb+PJ5Nitpgd
 f6bDYh9GCLShdrYswrKqzH5w8G6z9+b4+YgtXSh0ELAi17tISU9+yhrgRgqquCYIIs2N
 J+qqNKIaHHV1J3DQVrb+WAkJ9o/kyTFUlYmvvyYABxALDJA+S9a8XMapZLvg6u6Z4UIP
 dIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zPqkB2inCyRDsgVqNysnSw/veEsPoyzxCNm4XEt/C4M=;
 b=FSwgrkiJQDv4tRzfAWnc4kjl5ZWcmTfLxF0Za1q31jmd1VqHtF0RHIj2cre1EG7iuK
 mV0TewffMByB5PDHoU9gMqXZ/Y4ZUuaQf9n+TUzg/BozjMr1G+m9jHcm368Hwf0JPTdO
 3BUSwOZoLik6/FeyH4QP5bKJhRUVNS7k2FfBfAQ6taWGLFPkokvCD1WlhTIsdr73SNic
 lNfOmsrHlYHs5K+dKmpaDU4Uuk7+U/w0CIlR2g/qK2gBdFOSLb6CYr0/eOdnbaBiLRTY
 9tNIkCFN67pLNjOZrpFGnxta8B0r0DZbK7u7Nv0QhpDxuvgWrFcM3NevzzTx46FPyK8B
 3xSQ==
X-Gm-Message-State: AOAM532hxnaZfnKy/Eg0QO7WmKxpfxaaI4T2BQFKV6fJ8Kw1gZwWTMag
 sCcit519H9z0p6JmA8Ik2OjQYmvTa/B5jXiVbEcJwg==
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3004933ejv.4.1611324268754; 
 Fri, 22 Jan 2021 06:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-22-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:04:17 +0000
Message-ID: <CAFEAcA_6x8K6ALT52UAgndgaWh+TpD0V=T0AkFpAyJ8WXXE+-w@mail.gmail.com>
Subject: Re: [PATCH v3 21/21] tests/tcg/aarch64: Add mte smoke tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vCge0DckLOrU

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/mte.h           | 53 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/mte-1.c         | 25 +++++++++++++++
>  tests/tcg/aarch64/mte-2.c         | 42 ++++++++++++++++++++++++
>  tests/tcg/aarch64/mte-3.c         | 47 +++++++++++++++++++++++++++
>  tests/tcg/aarch64/mte-4.c         | 42 ++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  6 ++++
>  tests/tcg/configure.sh            |  4 +++
>  7 files changed, 219 insertions(+)
>  create mode 100644 tests/tcg/aarch64/mte.h
>  create mode 100644 tests/tcg/aarch64/mte-1.c
>  create mode 100644 tests/tcg/aarch64/mte-2.c
>  create mode 100644 tests/tcg/aarch64/mte-3.c
>  create mode 100644 tests/tcg/aarch64/mte-4.c
>
> diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
> new file mode 100644
> index 0000000000..038d33ab6c
> --- /dev/null
> +++ b/tests/tcg/aarch64/mte.h
> @@ -0,0 +1,53 @@
> +#include <assert.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <stdio.h>

All new files need the usual copyright-and-license header comment,
please.

thanks
-- PMM
