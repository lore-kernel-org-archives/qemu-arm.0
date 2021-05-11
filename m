Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3943578lfg;
        Tue, 11 May 2021 05:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzs+iZZh6micXQPhAhJn7xxouilLsXpBFVnpqv4qLiX6Wab7lwkoqG3FSWXk79Lr/Qkggb
X-Received: by 2002:a05:6602:24d4:: with SMTP id h20mr22158700ioe.4.1620737094590;
        Tue, 11 May 2021 05:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620737094; cv=none;
        d=google.com; s=arc-20160816;
        b=n8rJzeZ/WnKa3T3tbxx5zAz8Wt5mxH8wQSdu1LgYyRAkHvvpwv2FVzsmlxcBMAon4i
         8YFohcaiINpn+5g5fPDRNy9EasBtCgrPFKsXK0ZOmZcadUo5FqUfqwfMsJQdbr+mFsvm
         MC8Zr5Msk6TxZzQFXKZyOT9JolGmjGznepLD9VLWwcqGVfmt0yZjRPfFGVz/aTzHtm0b
         r00vjkfji8P3rtV1NOCVRGI26Nnn8Lnquw+Ippq9ZClNoU4kRJ447JzHh82KZ0NEv9HG
         S1xLkgACu5UQ99I2KuyNr4oVp9ebU2mn8uQ/V21B/8uxsOmWwdTjVaUdFY/kPfNaqgpR
         VfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F684eT0hVKGv5hV9NXyS7ly1wAr5UgED2uIgD+XB6wQ=;
        b=arlwgyoQuG8oiZlIyRQvZy6UzayJi/VJH++RmjN88jEH8uCf8zimi70fQcz6SYaqHv
         gwxft9et340FSMZbCuxYDrxexXYGW/bwWZw7R9ijPvmeY/2H7lnEiY0LQl86bjH7HVn5
         G/pneFmZ//ib6nJxWCQTNP9XE4Cnm23SD7VTMInFyPoAnXOTq78pUWfDQMnNmvLmpe7i
         uGe0lUqp05/G7Q9mEa12JjX5dW2IOHGj5cOlcXq1+Td/g9QChxKEkQb0PrFYFw2Mjbt5
         N20t4ql7flEGv0wve1boiC3RJGRce3cmfmjR+TmvL4xAX8x3ERIQtMJ945Av3a46+VUF
         aN7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pPeQ0udA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si22552898iom.3.2021.05.11.05.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 05:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pPeQ0udA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgRkr-0002Ua-WF
	for alex.bennee@linaro.org; Tue, 11 May 2021 08:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRkT-0002U9-7w
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:44:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRkP-0006x4-CW
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:44:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id j10so2488576ejb.3
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F684eT0hVKGv5hV9NXyS7ly1wAr5UgED2uIgD+XB6wQ=;
 b=pPeQ0udAVEsTEtTcq+5/7L0KJBZocwe/F0e/mNOKvk6Q2qDTc1+R2+l+7IdIeVSMoi
 yAncrh7xNeyrCWHR7gJfVs/1eHk9XBH2hxSam0D//dkAnp3T2zSA2WQ2nxpeyhuhgYhw
 coEFuuBtV2MQI5lr3KjqejgEJ03jf6pWMShhjHx1iRWqVnz/RbBxA4HPOFQ80iKt8lXt
 kiOc/78Ko5AselbLQrKLqdrxstaYW+5FJmJTRwFlvsPiuyQaavv9koJlcq3ADBucRwMG
 35KeHpmgTI7vQCD20BzO3KqrMLacfWnDRFckxpfcKt/X6pdesh3rPHpKA3pMdgvZsWjB
 q1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F684eT0hVKGv5hV9NXyS7ly1wAr5UgED2uIgD+XB6wQ=;
 b=ap84gjixHFEey+TBfttk9qa+Zd0aatNQrK0mQTwHFprqZs/ZnxP9mNrpH6rYVkKzEI
 2cuDf0wt911aPOR/xUCayILVPJULBWYCz5+ECROufj6bzwRzYWjH5Q950wTDUMixVIEx
 2cBiV8PPdbwwYDdfwt+Qgc6GLBtYcpib9Yj92tmpdgWgl0OG5fHceEy4ChtHNo232U82
 kMjlZv6/hZ+b/jcnIQMSaEDQGcGbeCles6d84TzzaIUvsbBGej4INpK4/tUpl5F1kJfv
 Rxrj5fwwHWlsykE3W70HPB9FkYNjwu0t5wr5bAfbcPcxtjUNkF2ILGPGsPA7Yl38+gf3
 6CeQ==
X-Gm-Message-State: AOAM531A2yweJyS2pcZI0KFT8scj8j2mCQ/OgTGQASluJte4l2aJPQIk
 dEXEy87t4nZrDPCDzdFLMoux5/2RfEIpFO11WK6dwg==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr31136874ejb.382.1620737063132; 
 Tue, 11 May 2021 05:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-17-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:43:10 +0100
Message-ID: <CAFEAcA_jJwuMaZ0wL-+CotQyhCp1-PeMMJ8A9LpVD=kruz4L4g@mail.gmail.com>
Subject: Re: [PATCH v6 16/82] target/arm: Implement SVE2 bitwise exclusive-or
 interleaved
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wpu9rxMGOgzr

On Fri, 30 Apr 2021 at 21:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      |  5 +++++
>  target/arm/sve_helper.c    | 20 ++++++++++++++++++++
>  target/arm/translate-sve.c | 19 +++++++++++++++++++
>  4 files changed, 49 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
