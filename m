Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp166469lfj;
        Fri, 13 May 2022 02:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO+IHT8cajf4mNIZ22m0HUX6Jeko2Gk4h8eq8iREKdoX6ymsb6VAUPNR0Ape6pziEtJicQ
X-Received: by 2002:ac8:7c44:0:b0:2f3:dca9:fa63 with SMTP id o4-20020ac87c44000000b002f3dca9fa63mr3636703qtv.589.1652435527711;
        Fri, 13 May 2022 02:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652435527; cv=none;
        d=google.com; s=arc-20160816;
        b=vW9Vp/KdksswK/FjQiroozi3cHLMlM+yanY30ZJAFdxnOk9LMOfiYsrWA13H0Yg12a
         8X42htAiXTJQYw7H1UZ3dqAuMFuibjBgPrp9PGzhzickHdiqIpQ13XTCicSeYFOlQgoC
         ZadAom8Axwr0SSLDbWWLRHvG4nN6Y80A/OPWZCQfLwrO3aVZ+DkeHWrQdYISNz4f1D32
         9EscOdSXEtCwSuRH4tNZEIBGzCHKxaSUZOqECdLwCPmmn0uMImgqWAvWXPg7a9XMTLWl
         WBTVAeBaftx65MNMdYTOsIeRZUFxSoLYoYjwCoP+hDGzCG7pV2FKCl3nkUyWosupI7h4
         xcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3YTnbfqNSSq55crGmMx6dDnfZ08hCd9gHpW0zzIk8f4=;
        b=zizibl8B7zyIZYVVQzYBbxGt9KWQUwhB7gM40OqYK9LXFO0MlGqkEqFDaI1v/yL0AB
         BkLOqqwUyyPq2yVXra8ohqSxkfy4kAhCzAKMBbaYUTh1rkcyXCpmxutk4/RnWzIQOOGw
         fnc4Q+F3ZJCHEnDSDJ/idcG9nTPpiGNwrIfngzQ84RsY/CI6qxa+qcF7CHBwqDcbGj47
         kFnBaLXCPg8lEYX5i9r+lgq3w02CqLVO17ePCGueOpLbSmp9fB4WyJjRe+5AoUeHVmNl
         aEpzmNugUIE2qPFM3jLskMmLkBXuTFc1OL7k2ONigZelbFtmiKrSF1cgy05tmYJSxlh+
         /FVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UDlmOo96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a05620a24cc00b0067e4be23a0esi1333912qkn.595.2022.05.13.02.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 02:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UDlmOo96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npRxv-000565-73
	for alex.bennee@linaro.org; Fri, 13 May 2022 05:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npRwk-0002rL-Nw
 for qemu-arm@nongnu.org; Fri, 13 May 2022 05:50:54 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npRwi-0005f4-W0
 for qemu-arm@nongnu.org; Fri, 13 May 2022 05:50:54 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f863469afbso85210647b3.0
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3YTnbfqNSSq55crGmMx6dDnfZ08hCd9gHpW0zzIk8f4=;
 b=UDlmOo962YiNl8oCm9EYJO336ui3wHptu4Twb2/Zol2lL06wrOHlJTW/XeSxGnidC5
 80zqRlrQff8hTsgxHLFkQW0Il84HwDtKCW5Mo9mka4zJPCFykmZHH3Vzyz50BK6Pkm4m
 dAcbyYSZNXYvmxUDOD35xRoLsIpZeXlVWjnIYrB+2Q0vzX8fshCmyflMV8qqT5UJ1yAG
 Qt8vzI9ZcYkH0YEwGb2+XcFAC2mc7PxpHf80rJwskbnQ0tORdZnr9hBtwJApDxEY/eeF
 RY5AdGldigesFwNkxj7yvG1UZv2JPG+5C/Wnq0pXW6WdAPcL/EeDpyu+wRVSQkXphsqG
 ktkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3YTnbfqNSSq55crGmMx6dDnfZ08hCd9gHpW0zzIk8f4=;
 b=CxOa7nBmtfwfgXN+HTZGZsOMuc1SF+qxupv7yvP2NquJZdqUXT/kAsRj9yQ78Zp82o
 HU4Yd6o1/FZQe7IRUBRyZeErQp+gxfez1kGkrNxG3WEEnMQupP0AXFdvPhMbQ0qfYijI
 25WR+hd9xZss/JeRCVi9MxywA+A/GBg+8p5C9RhxQPpOeh3pTPd1Dyg84WTl+Yu7emF8
 HR6LTheapSlRd/NsGP8O0/b4J5e/rgtzzhQU4X5MK1BX7Lo4nbJuS0lcUzJ7nJB/Yfev
 4xjweJ4cYTRDlj4if9N3lJOUD6RYF3apAGNI05Jr658r71jq2QJlVQ8Ci37uTLxLXzW5
 Hdkw==
X-Gm-Message-State: AOAM5304XbgZyOGhcFomZJe2aiuBki7wAkputl1so6OX/q1weskwt/mC
 P4N9xjkc6LrJCNgi+NCQYm4TGBnHA+CBXEK8KLfmcw==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr4853224ywb.257.1652435451187; Fri, 13 May
 2022 02:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 10:50:40 +0100
Message-ID: <CAFEAcA9oEUHL0Z0+bSmP-Hx7e6TUdz=ahB5rgNgYt0GUytTTnQ@mail.gmail.com>
Subject: Re: [PATCH] hw/adc/zynq-xadc: Use qemu_irq typedef
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: csFI4XIbq1RP

On Mon, 9 May 2022 at 21:20, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Except hw/core/irq.c which implements the forward-declared opaque
> qemu_irq structure, hw/adc/zynq-xadc.{c,h} are the only files not
> using the typedef. Fix this single exception.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/adc/zynq-xadc.c         | 4 ++--
>  include/hw/adc/zynq-xadc.h | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
