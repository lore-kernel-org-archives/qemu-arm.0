Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61852CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:13:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz4W-00077h-2s; Tue, 09 Jun 2026 12:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz4N-000752-9G
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:12:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz4L-0006PA-1k
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:12:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-bebbc325000so738335566b.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021567; cv=none;
 d=google.com; s=arc-20240605;
 b=PSWtSIp2uvQFtFh6wojXoUCI7CEG9NnLIF35vJBdnEAvjyw/gXf5rpgzKovOwJpbGV
 SzGxTKtHk998qi7BB8F0L19ks3THCoQ4+uSoJTfwS0U1OLYXl6LPmYQPJqf/l/6AzP/S
 CI1MtdHPCLb5ckSBGNZDwIjWegxz6zBRM2DptuoUBi7Ng7PRk5I1/wuYIZciEqIKV7fh
 QQ/SWmeqq1m585FPQngP2YTE2AYnba44+Zo/0PAnOunxyMXzlGsFJcPE9kJH9a+NWQ8b
 nvaM8v0zCUzNDPCh3gC5xGBXUDi2jNGjcN5iur+GYYPWkZmdoQU85fTUc4q1HsqKyQ5a
 gTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YYsc94xhr0awqd86wM3a2E9dmejW4l3RiQ2v50Wzr9g=;
 fh=OzEWqD1WgPycnb/x54cbH/GXJshivzDQ7HWBtK9Fr+M=;
 b=bwlwCN/D7D11xGtlKXpMRV5Xx3Sxjwp+aSlk2DADpWFV0yerte1aTwE0+tpTc0bJn1
 M7gA2wb2pcW5NwLw1maMp622icNvMfX4r992Xm36Lnc4LRXjJZ8LFnrEPSO0UvIwxQrJ
 jGh6eO77Ur5S95Znc3hXFSoBao0UtiZFU7gPwp2rSso43d4712FbnOplGNvzkaojlw0Q
 MEVYqZef0Yg1+wRVuNWpcpvttL50xFOnctUqFcX3KGXRkV2YJAFF8v8ErZsmyz0pj5Pv
 EPyO0Oh2AyyYtpLugE5V382pCK+GIeiBuyYed7mGLuYk8rjpxJtgQgY4sqleuGEkSyzg
 m7Rw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021567; x=1781626367; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YYsc94xhr0awqd86wM3a2E9dmejW4l3RiQ2v50Wzr9g=;
 b=OocZFT2CuuYfn8G/O45jTPMd4/cFYilXEg4P2hkOlyjcPUWst/mxtQ20BQ0q6utFl5
 DTBOJxiQXD/BCwq9QqZBCi1cjhWbtK9aUAyTMIreqcwVasmpne5CG4Q/Oy0JZMLgffZn
 9kVt8qWwCZyuayUbHcotyF1ZcGpxVcWCIksuoY1QZJZBUOJGj0Cj8EGAikNFiua3p+0M
 7hTAEHN5SZcSKTKA5tt1E/AwGg1KnYylxe44RHRIT4RqL7jTda+Q1GAu9X5FSwkqgXkI
 JEZrQXqg1Zv58b6xwjzs5//WVb1Pz6zEjqs9+uY3yN/0TdHSTuSi/npw9hzxHVrq3Pq3
 lQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021567; x=1781626367;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYsc94xhr0awqd86wM3a2E9dmejW4l3RiQ2v50Wzr9g=;
 b=Q7qjtGZ9coudNQHlCnwRmBflUaXiMOq8CSpJHZWuDYItFr1yigkjs9dgAhK3Ouqkqa
 uYol8tkcGaeYXvuh6Xp9EuLKcHcbajHxdXyoQA1blvWlUE3SKCBMr8mMgFnil+v/n54r
 sc/u6USQb/yLN7OU//L9veWuszphb9YDX0QQSA31zOsyczAa6P5GmJ0fjN3qD95t88Qx
 xA3rz8n3oPyYbGLi9T/xdUl31TrzsGKHELpexjoQXVOal2j0XTc4Wx6nrgSVMaWbneD6
 OfQJr8ZVeZpPwU2DxPSg4O9M6wZaBrXTnwmGgNuWJOnfJ7+h4dbXsl5U2iY5SrSalOI4
 Kw4A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9P9wn0BVkTGrgyT+d6FYEMFyPxfZrTFPG5b2hcpOONNbMqX7zca+ECfN6xDfMp/r8OuCUCM6NhtA==@nongnu.org
X-Gm-Message-State: AOJu0YzLRQ0DZuRfWT8g7huPLcHlanOreQcEvnNIndHPITdSyLJYzb3s
 YpY3Nc01SpwzcutQXwK/iuxbJejwsRBZqOwNeoQWqu4iUwjLiFmGGS1wsVErsflf+0NL/yyUgpU
 lKQD9RthgktZzAAN3kDiQc6GLNXTRaT9UphlHHjmYmg==
X-Gm-Gg: Acq92OFNi2AYh/PY0w052VSQTGhAil4DQyRcW8pkC5dibaw6BCI62bLGCfiODoRM8a8
 Msu9VoNM5BxkV8PvnA+jAtO7gLuzVINt5fXNBc4nUzmV5mAqjZ6KowExZPDaEqOaKkSQ/3Yu1ra
 ap1SFivTjcIncbs7c+g7reNpk8HhJGhyQC2QN4ZfdDgBsBw/rd3jFwxHbFMrnxSVbOicQh4+P5P
 qrDDbtjhOAq4ZwPyPplEkCIu3uz+rA/C6jsg0RNBz9Xnl2u0Itk2pqGi2Kblx4eZiM2cdBC643n
 QwgZHRsOCNGFohtwmqiNgj0gHcsbaYEavHs8fj3jvrggx1ABNmeQJ4CwDs6tkBIeB9MumHfcMhn
 nTA==
X-Received: by 2002:a17:907:6c0f:b0:bcc:e8f:c3a8 with SMTP id
 a640c23a62f3a-bf3738f1e4amr1020776066b.29.1781021566747; Tue, 09 Jun 2026
 09:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-35-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:12:33 +0100
X-Gm-Features: AVVi8CcYY8u_vo0WqmfW-Ajvzrf1ZcmpNYN00i1kqO4G5_EJw7xQP4Z5mCaVnCs
Message-ID: <CAFEAcA8cV5pOk8kQjYFb85k05WqM9XjuETHM49jbrLKEdKe6tQ@mail.gmail.com>
Subject: Re: [PATCH v9 34/45] target/arm: Implement FDOT (FP8 to FP32) for
 AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 ++++
>  target/arm/tcg/helper-fp8-defs.h |  3 +++
>  target/arm/tcg/fp8_helper.c      | 39 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   | 30 ++++++++++++++++++++++++
>  target/arm/tcg/a64.decode        |  4 ++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

