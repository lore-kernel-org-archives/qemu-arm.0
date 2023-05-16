Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp304099ejq;
        Tue, 16 May 2023 03:12:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zYTlLxTdPmY/RO9TLDot3UWkM0OxPXKo08On+CwuKZas9LpD2r3ePol74CRAyJaeTJ1ue
X-Received: by 2002:a05:622a:198a:b0:3f3:86c5:21e9 with SMTP id u10-20020a05622a198a00b003f386c521e9mr48570540qtc.14.1684231946694;
        Tue, 16 May 2023 03:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684231946; cv=none;
        d=google.com; s=arc-20160816;
        b=o0D9066YQB+4Wp/9IES4k8mXkuFGbvdJCuRevKg1EXwfepoR/qs/L2XpwkgqTjc9d4
         +hJcnpwjfz75BuvCNbYvbWc4HHV7lDYv/HGu6/XqgwMgaAh4v4DgsRIFP/Pej9jqPPra
         r/ccv2/CpT+RHfigrNPx5nD86HVMpcZlTT+VSQVyvTX849jTB8Syh9Q5uaq2rKRme6iX
         XqhDIK6bj5SWziINnI+r5u3zW1RtzgCwnvt4wap+9f9woUZPsELDJb6jp4y7p66ygtV2
         JiruNp8TdnwQ8Xp2u5/QDIrAeHIBdcCMcha20Bv7wlA3wF8ahMZ9BHkckjm0qXTS0XMk
         I3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WygLdQMdN1rlePQOoCk072TMogyRaOR7qohsfKBqRxw=;
        b=vQECuM7aYu2GQMm2X7Lca2K//Cte54GZSaCv7qWysbf6OuEAj/g1vYJ1BiF+MfklRk
         Zz3Ye1mCsKAoRNGFssfjj0x14fNxPcsizk7rou+9tyy1MSnZIQllqo0nvSkUWlOTnPLc
         w5xRBdtHdsferEqpS37Zwra4cBNQvuFLJ57MEuogZTnwpvPu1ogazr6nKmQ7ATUiJYrh
         sY3FfxgKNFMYNFSlqTPT7aBrJEaML/WuIrnbOyXz4L+XmalY1BXbqaVBQmnm+oH/L4Ub
         KNiAdYYT4Bvkyne8JbCRH4GsqaCxwdCudHgr2Zei65uVg+iP5Zmsszfl5Udaxo4apyLs
         jJJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIyFR7mt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a05620a112100b00745f6c539fbsi893587qkk.705.2023.05.16.03.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIyFR7mt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyrf0-0007Cx-Lz; Tue, 16 May 2023 06:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrez-0007Cc-JR
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:12:01 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrex-00059I-O1
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:12:01 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-510a59ead3fso65810a12.2
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684231917; x=1686823917;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WygLdQMdN1rlePQOoCk072TMogyRaOR7qohsfKBqRxw=;
 b=SIyFR7mtlQTKf7ThH/E1qtXvA4cbekko0XfDh+Lzj6yOiKkFS0RjkIdoH2Kkeejjyi
 Nv8qt2kvXL0xwFal2oqhzRkl9nvNrx+n4ZFr8cRUXvxAWzC982i3XV0VYtTi4/J4cBV6
 bC40E1JFthD5vCYOQwzCud+awgS7kyPpWDWIv+9ZhrBaqRH2A5aj1QtZ2Go5Kii4M2BI
 dXLu5PMqX3RAo+yCwKkHOWD8nhjJFjCIaDCtNw2hZ8pl1JypRHOww919+DaZzXb9QSjy
 Y7RsUCDBqFchz5Xe4ZOQybHg55jr92DktKBWFU09q7P6eA/ztlQRUY2TC5MQKQwIorvh
 nc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684231917; x=1686823917;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WygLdQMdN1rlePQOoCk072TMogyRaOR7qohsfKBqRxw=;
 b=hZQbL1A81XsvQClenbaBdotTUFnrWbE5kE8fMYh+zJuO9heORP+zodFIr4B1MK2VqZ
 emtgnfIft/X34k1uCGFnZlkU17G/k2GuO5My34abFvTCaI7ziMavDnEaWCxcSjiPSO2a
 dyPuGIcRRBJ3F/FgSoiq53W5pcCFusKvIi0BbmHvlO1+CLPPmHBNaaHqan+1TFegzXU8
 LVUI8QooPlMdxSdacWkfLZAu+626/JLruvnbJ+8jKUOXSpRrzR8xMZnMR3s9BLVOMRc0
 sIg9ooLQeGlbMUxnugpFGNbYHzp2sYLJdT4+ZHNoRrYbar/A/5P+qwPCDtATIzaunzy5
 cKCA==
X-Gm-Message-State: AC+VfDxAp+DRdaGaoZMpv00ta5fAndA3puMKPnnd5u3U6eWv7M9KjOJF
 OniHjMvkTX5CCX+q0wOtmDeCGjHT5KpP9/vGgJDN8g==
X-Received: by 2002:a05:6402:100b:b0:50b:81bf:9e4f with SMTP id
 c11-20020a056402100b00b0050b81bf9e4fmr26011848edu.12.1684231917359; Tue, 16
 May 2023 03:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-41-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:11:46 +0100
Message-ID: <CAFEAcA8pLTxuy3WeOsWczd-_ErioQAuRUg9ZbpU2QWhaGKJ7tQ@mail.gmail.com>
Subject: Re: [PATCH v5 40/54] tcg/i386: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4HUywbCnzCQo

On Mon, 15 May 2023 at 15:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No change to the ultimate load/store routines yet, so some atomicity
> conditions not yet honored, but plumbs the change to alignment through
> the relevant functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Removed r-b for changes to HostAddress.
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
