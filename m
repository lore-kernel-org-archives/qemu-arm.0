Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp705014lfu;
        Wed, 6 Apr 2022 06:38:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTDX24yGO927+GXlUBItJyoYfZusrNmpOc5XKmo/Qx8ACJzJIZceozbooNFKd3NmxxgYR1
X-Received: by 2002:a05:622a:148e:b0:2e2:2ebd:63d9 with SMTP id t14-20020a05622a148e00b002e22ebd63d9mr7624226qtx.601.1649252287200;
        Wed, 06 Apr 2022 06:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649252287; cv=none;
        d=google.com; s=arc-20160816;
        b=1LeERBPQtZlq6v2kaO762OK1e5AyLS+9lnJOAFiK1Oc0DoXPN/W9+dlpQNjMzZa+/c
         5y2CgDQbVuH5azEZiR89Pv/apiyaaEVYZxRXOGR0JTPa2yPvK0g3p/1eXxMCzr04marX
         5UTnW0AKdpDwUwfC/J8lqKp0xzVS0XKguka2WN4udOyFJMSfN0c/KPzzXjJenw2lyBt3
         jqz+CqSUzAcuKcyzGsdFBeUThdn3SR8V+o1xk24tWOrVnmMbpO5jwt1db338KpXc8eel
         BFgtvxyO6sylwWHIfWWNpdFpLBdCwWfAv7by7GlceOhC0Tcpr0Vkj6lVtovV0xdetksY
         P7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=8jzSQ4vxrYlxCxwZk3zGR2uLgkq8J+1oFDzmDBJnjxs=;
        b=Mzj5gVpExaDMOpHjsCgL90ZH2b5mfbQ/VdgtFdFNdyUa/yfmZBMGurwSx72C3NQwak
         UGasPFd5JzPVAq57T5nIXl4K3kWH5I54OiLga79bWRZ2xFtWyefqE9Pv10PU4MPZ9B7A
         hAripDRQNXcY33zWEAk3wrOX6Hy0f5ZzVvUGlMeVg8ZT7oBqSvPo16Kqb+SXfMYvqklT
         sCjSIEoEuCd7LIfn1CzoCyrCaAhZGwH7R4/3asIBF7NcwW7a/VOSLfBzCxKdsbFWGIX+
         Uq22UbYKcKJ45bvje3FS5GGOZ+ELGgg5qRHQNcigXO/uTWCXqQLiilPRMp0n8/7X1v8s
         Fd8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQ11Dibe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05620a410c00b0067f2fada2a6si6809104qko.517.2022.04.06.06.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQ11Dibe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc5rK-0000Bo-M5
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5rA-0000BQ-32
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:37:56 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5r6-0000Ki-98
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:37:55 -0400
Received: by mail-qt1-x832.google.com with SMTP id o15so4236442qtv.8
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8jzSQ4vxrYlxCxwZk3zGR2uLgkq8J+1oFDzmDBJnjxs=;
 b=sQ11Dibeh4wfB0UxwB4XG5+xNMrgOVUMAKQMMGadD2NkgbNrGQRKX9e3Y2IjZ1vz83
 GN+z0fk8DJK+P2VB/9u84EUPfD4bbAtaOzTTXk1iZSxtb1WI/8AyLILDJ3l5ahe7gbmG
 84lLrT6KkdUJwC+qU9EqFPO48vjDCRVFv/pG50/vjsVPIbQOBZABq00CYL3FJ+aaDF9c
 p5rCP/ep8WdmA12wv8fMmJmWKpyrT6cgPgQYm14TeoCLZ2X+TuYbR5rjM66Y0SVFGk9P
 8TX6TMtf+vIxjZg9PZ91Xz44nYCDcR8LZaZkoVCV9rhs3udHxPuvAw6xcEUKvMzYcnN2
 3vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8jzSQ4vxrYlxCxwZk3zGR2uLgkq8J+1oFDzmDBJnjxs=;
 b=EnW21TOrmbpHO3YtVqTcCujR7RGFrCiL3k/SR+Ax2Kv+6jTIO36K5+FvNsT2kxLGpC
 wuqlbgrCfqrLzIj1z87vjvJswyKqOCh7snlkWm03G/79Iec6oehQ6U6rN3aLubI0fCu+
 trSAZx6Y/ilswEmpDd67WjOnzbpnO1F53FGJ1Cjgcez5w4sULSjBIEB8mlFOWnmI8FDO
 Itm5hvCziEOj6vOY4WO6pMkGpvMRVmhDsQgtwywzbv9Aqs2H6/RrayLwdIBUYwFvyRuu
 ypgUrAFkOQcYGyz9ctZaL11tDtczH1gqMLbDPsPamKB3Wb1TZxSEsUDor+1ay2l9HlvO
 yFRA==
X-Gm-Message-State: AOAM531+ndKPAVs+B6xFbXNKXLGgOZf4pnN9vnvk/u1PVwLLrrAeMIT3
 UQ+aqDVjTlYOKsspGaGLx1C9BQ==
X-Received: by 2002:a37:40d:0:b0:699:f26d:6cac with SMTP id
 13-20020a37040d000000b00699f26d6cacmr994061qke.152.1649252269921; 
 Wed, 06 Apr 2022 06:37:49 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b00680af0db559sm10215050qkb.127.2022.04.06.06.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:37:49 -0700 (PDT)
Message-ID: <2799d1ad-4689-7d63-3fe1-2d7d3f2a3b44@linaro.org>
Date: Wed, 6 Apr 2022 08:37:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 01/18] hw/arm/exynos4210: Use TYPE_OR_IRQ instead
 of custom OR-gate device
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LA3XqNN/4oN2

On 4/4/22 10:46, Peter Maydell wrote:
> The Exynos4210 SoC device currently uses a custom device
> "exynos4210.irq_gate" to model the OR gate that feeds each CPU's IRQ
> line.  We have a standard TYPE_OR_IRQ device for this now, so use
> that instead.
> 
> (This is a migration compatibility break, but that is OK for this
> machine type.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  1 +
>   hw/arm/exynos4210.c         | 31 ++++++++++++++++---------------
>   2 files changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
