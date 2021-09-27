Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3738945lfp;
        Mon, 27 Sep 2021 04:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySlM2rgjF+Ji6mWbNY1WJvtKlhR/tgYHx/aAx+tgQLWj2zIiJg35WbxhrIo1Bmt4ySPGtd
X-Received: by 2002:a1f:1f0a:: with SMTP id f10mr14814662vkf.21.1632740936671;
        Mon, 27 Sep 2021 04:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632740936; cv=none;
        d=google.com; s=arc-20160816;
        b=0iJzd0QGHXC1v4/A+D4XwbHFvAsBtitKFvC7DUxP6x2sl+ecEM4626A0gxizSI0Rm1
         LERWBcP9xdjLBueG67j4wb6sLgwMRKmBM3g3si+BlpqfCDIUxuw/tsdKU9qgLHrxH8/d
         A42PA5yGVpxEa+bSf58uqyze31xu3ZrWeTRgfQqKd1QSDqIo9RqZWpuWXFXXt6ZvqlHz
         ZSIIfPi8vwk5fcvsg1NJA/r8+TZxKN3zZM61626VtxcdSjkqe0aE2EPRJQSt1D9TIbrX
         4r3ogXGbCtuK4iVp99nubx9DiiK9eUzBQf/pBxyEfarv/80jq2m97sGHHe4ROw5EUXH0
         k3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NppfjlfrxnbSCEYio86jEeH02o2plzxtMdI/y0zriX8=;
        b=k2H5KnbwSnQLLFYFRckUega2xcRWQOJDKEjKKxSncJ4WnlWIZx/Q71ohp8xK+5q35v
         zhA5fcEvCfnhE0kG1hcti/oYHZi5TqOUHzQHo7Rv17ohtgdybdrvpfN7v7kWghMa0yHY
         2WVLwxEPifbSj+vmAN845i5vDRkx9lcXD1zA3QSb7YNlxoPI3HlIW+Ej/V7OdZxomL2i
         gxmwXuOrdpz2XMzCrGMqhUOgTXstBmuC0UvArOFuvznbWH+mqwV5EVra0I5Xw3MkM0nX
         jucVHQLpeuQ62GyNpu0vtihOJHKBmc+GdtSkq+zeyJOkIIBQk/r1vTEWYSVxfYmg71pq
         mH2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=cFGGVVo7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 94si2638734uav.32.2021.09.27.04.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 04:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=cFGGVVo7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUoVD-0001hT-US
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 07:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUoRp-0007jq-F0; Mon, 27 Sep 2021 07:05:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUoRY-00041L-UZ; Mon, 27 Sep 2021 07:05:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso108460wme.0; 
 Mon, 27 Sep 2021 04:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NppfjlfrxnbSCEYio86jEeH02o2plzxtMdI/y0zriX8=;
 b=cFGGVVo7f8fzamYStmqR7PX19VuXptJl24FZajx4fXaCdlrm2TBlK/ypl9RF+2LQ7T
 ULvcMITcrtPO8PSIPcWcPGdEhwmoga2U4FGvJi9oUF2T8v5I58lQK742NfTOriTLRTTa
 KATGj6d8QwisbrrP3W9VH1lvuXQCWmkyYrxm2/ky4xDeo7hmZGTgc34Wr/HjW7Qcp9ft
 oKIqu7qFMLHSTewvtTib0qVQ66eR5KfKy5hDWXQSe+il3arGGtL6z8SZ0lYct5xwlXDX
 y2JnVfQChl6P+fNLhA8X0QmSXs25UACKh96KQmdqVf9bRGsj2HJpzxgV0ETlSZpOkYoW
 ajvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NppfjlfrxnbSCEYio86jEeH02o2plzxtMdI/y0zriX8=;
 b=XcqjkWdtUC5np63J0QfeIK51oghPng4UNL+l8oSEqGHADbEpZ+C4jZl7GosfHPFmiT
 MDqbzQtO99nJyG0aBCWpZhV47lWRhVSVm5Ugew1mZecfKMK81RwPxYphiAC9ZHHwowKo
 ZmxB8vuhgEk0tMMn65497d3uAzx0oUlAB7XFKbUXhtB5ePbbFSJHHj9XWHUEGp5wOI4v
 SJOI6RFaFBDjgitt3vWhwooun+I6iVdZCfeciF0xUgusombg9YDv03dkrlMOK4ivUgjA
 snsRb2FwW6AjLDj7UDVGLWgawvFOPxp8ZP7IvsVubqzP3rsa19vHxR/ol+0eWmraGmxa
 lPfQ==
X-Gm-Message-State: AOAM533xSuUkZEa2mxP0xBuYYBucP6gKCq2LTMukal0n66qKg//dQHr6
 6j6h60H39YF+hzQM2dteLTU=
X-Received: by 2002:a05:600c:2c50:: with SMTP id
 r16mr1485759wmg.105.1632740707068; 
 Mon, 27 Sep 2021 04:05:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i27sm20804726wmb.40.2021.09.27.04.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 04:05:06 -0700 (PDT)
Message-ID: <e9abc010-46fa-2813-f6c5-43fc62488456@amsat.org>
Date: Mon, 27 Sep 2021 13:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] allwinner-h3: Switch to SMC as PSCI conduit
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210920203931.66527-1-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210920203931.66527-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NnaTOWOiR3Uq

On 9/20/21 22:39, Alexander Graf wrote:
> The Allwinner H3 SoC uses Cortex-A7 cores which support virtualization.
> However, today we are configuring QEMU to use HVC as PSCI conduit.
> 
> That means HVC calls get trapped into QEMU instead of the guest's own
> emulated CPU and thus break the guest's ability to execute virtualization.
> 
> Fix this by moving to SMC as conduit, freeing up HYP completely to the VM.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Fixes: 740dafc0ba0 ("hw/arm: add Allwinner H3 System-on-Chip")
> ---
>  hw/arm/allwinner-h3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
