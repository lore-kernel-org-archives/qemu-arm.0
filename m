Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp366374ejq;
        Fri, 5 May 2023 05:08:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5utohVoyb1nqq8/SZi0V288UBD19OYfL9d10WyUeDepDTHvk4JaZ4mC0WU3pE6ZDsSGHuz
X-Received: by 2002:ac8:5e4b:0:b0:3e4:d6cb:2e8f with SMTP id i11-20020ac85e4b000000b003e4d6cb2e8fmr1933589qtx.30.1683288496600;
        Fri, 05 May 2023 05:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288496; cv=none;
        d=google.com; s=arc-20160816;
        b=sR81QgsLYo2A1RbDKpECQSPxjLIQLzTvPu4TYk0tmpjr/A4Afr8whNvJ+OC9+nUjP1
         gcOln6osB12TcM/Vzj3iV04sf8G3m7hh55IICFAGw5EYNzdBqg04cFPO8UPhB2wO1OE4
         5RCvA0TcDwJExdn85GoOePhveA11K5I1mbciFbuTF4G6j1QFAa6qZI14aXq7yCgomR+7
         8DGpta10vLnX57JL4lirI+VaIXwUjT2Un4QhZ2cEf5xj5M3cWz+BwdNZkZksGBu6H+wi
         QdKiULiduglw4TwitCMf2RbiDLop6maF+05uI9etiTtQus/RhTxpZ/m0ovJgVIfAJtY/
         XslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
        b=Ho52y9pd+s78VCUlqON9fUztOH4wb7EHACF7RcTNXCKBZvxsnz4QE/fGWBta05aNAY
         tewIDHp0iwAlRnm+fC9pUTFfJ/cg5rzp7xZzYLmLdSy8TM8LQnxm0A5r++KJ+Z9utfFZ
         K7IVBUsvDO8rLCzNORa8kx490c+28MYOFXpSxkty3tr9u1zMPeFN1Cycjlzr878Vo1VA
         KswPnpJ2qTuml+Uy/F/vScFdwae1n/caLIhu+pod/6c/+DJ9QPgQsf+44PFd6ym8aicO
         nmZ1e78gbvPWgxi1otsfOgw7IEscLVvVp+4M2Z0DrJiDDX8xTE7BchEJUTAEZiXsyzyw
         zl+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toCwEcBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a05622a11cb00b003b9b59883fbsi485218qtk.573.2023.05.05.05.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toCwEcBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuEE-00025j-3e; Fri, 05 May 2023 08:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuE8-0001vD-7L
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuE4-0003v1-KM
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:55 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so2562277a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288471; x=1685880471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
 b=toCwEcBpcgznIvluG75IaXc21e31dkk2dhDH/BmSuaT9MCPkXZ4cryBg31RS0IhyCz
 y9MPG/MM43JArzFEQb9vGN0T2I2DvHS9R2pjP9Pd4oAikI7A2TCqqCMayyLsD6xPbVsi
 Fc2pRyypF5NF1WG7fl0woqZboLWo9yCtkP88KcQJR/UWNqWcA+9kaPd7/6Rn4NtLson4
 ZL9eiIGLQCLSSaWJlypva7wIMoDeWYTQIr3vU2tK+lBbekCjHFZpz06GV1OZM1fbkkUS
 O6a80gv/DI1ksLpSSfH1cEaPc1imfmVsDAZG3cLR0Xu9Z5JeTFQCKHw0aVklgzaatXqP
 DUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288471; x=1685880471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9PE4FJ0jA2F/7HzTPSy9Nl+g41niveHCq2SmQngHJw=;
 b=ZbUp23AegZfGy1BJHpHznggHin3WxalTnTsu67QMBMSPjMmEjciYN/vB3aWH24elCV
 R9PHK0e4sx0FtSlMv1tMj3eND6MXpyCxzxiKvmJ2Zp/uUazYgWL0Vx6TWoK/AnmPd4ZY
 H58uzNmwCv13/kaOOXit93spdOYDbl0WCwnWkKZ88AVMng8GmuKmw2vhaqUoQ2WRCNMW
 GNG2vIOe9+jDiIV4tkTYB5rU1WFzfrRm0T2U6JuUADkLV0McysPAHpXJ69ozPKh4UFaJ
 Q/966TJZr9GB57JHdl7biWwYy1GePdgITNwDATJboFkfkoUgWvPNfUOx5ljWfJo4xrZ9
 WjaQ==
X-Gm-Message-State: AC+VfDygpYSHpWibCceFPe2fFeLozjUY++VJT6yc7LyjGAk4AkwvyPg2
 XhcH9VeyBZlwfurkUuPZM+QSpJKs+5vgItTqK+yrSb0VW0Nppc+6
X-Received: by 2002:a05:6402:31f4:b0:50b:c370:4967 with SMTP id
 dy20-20020a05640231f400b0050bc3704967mr1447655edb.19.1683288471040; Fri, 05
 May 2023 05:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-26-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:40 +0100
Message-ID: <CAFEAcA-Z7m+jP4NnDf-yS_junBx7PMY91rWgWO9-1qFOg4s4Fw@mail.gmail.com>
Subject: Re: [PATCH v4 25/57] tcg/riscv: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MTeQE3qBW7xV

On Wed, 3 May 2023 at 08:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
