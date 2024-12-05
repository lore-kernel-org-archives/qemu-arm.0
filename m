Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp298288njb;
        Thu, 5 Dec 2024 09:30:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeWvcsdkUD1mROAXixSn35bcHnRdtXWnsIqm0ceUD7KlZIgjs+kUUWJc4VMPe3uxfREQbQWLIdoMTWwg==@linaro.org
X-Google-Smtp-Source: AGHT+IGyjzuCcx4gdVsy9ULPCnumYmKqR/cycG3cR2ElpMU2c2AB4H0lsRxolpmRCqSCJf1iaCSi
X-Received: by 2002:a05:6000:698:b0:385:de8d:c0f5 with SMTP id ffacd0b85a97d-385fd3ce003mr9584379f8f.16.1733419840260;
        Thu, 05 Dec 2024 09:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733419840; cv=none;
        d=google.com; s=arc-20240605;
        b=LRV6dZoSPXrWidqX1kvmIP91diahEU5zsoQg5WzmyfFzMSitdcfdRrQmVx7psoqRij
         RyKHzBusSja+6YX+KEUU3jXqLr/CoFGDgAYNWt6ZdjPaRLQwo63hwFh7h7sYlrT8yPt5
         3EMKOkT6lSt1mqa4S+dp2cqtoITPJxVKWWroQGMrN+9YhaY18H+q1Yqu9+eCaOlhhvhx
         93mzXjkS3OIlruh7xQipjFvppaWTK6aWGfKg+Ulovs146U6Wr1er67l9X8szRz3OAW3j
         ixAIZWVHiyG16m6aTKYA+jh/QziYaJ5PiMyDEaveAGQHuW+FkAxbFK9qG3GxYF8lOFxn
         FrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bFGgK1p+XckRKimAjQg/rIk3yfNBLaJvo7hC4EBr6oI=;
        fh=0FPO4u+Vp2fiJOIbuiMx1Dz9SIrKBHizmUMo4PjZgp4=;
        b=UZuCfdjHzmD8QLlHd3xPebrriVqTea1a9OOgs4CylA+DmYxqis41kT72m+G8MAI30E
         wTroLUM/dgqSqPEMykdLK8VqQM1mBlz8Sx3gqhl6+Gdr+o1cgbm2qiXIMsj6YBVMVBEy
         Y41TtlkemK93+UAomaWx7jm4bsl93Q3nSucebXTEQzDpGcWJWY8TWuUfEtEMff7mqx8S
         H3wAHue8lwj017ovL2GKIeynVUUaHvQ8Oq1gf4lrQd4EmUH9+Jh9OT++8WcI4iJUoAcB
         5PdqMLTGe4rcBxKzDzhbqgCm5vt3U5DUYtTua19Xv0CKE2w69Lq31j8uZG4I+ZcJdP0v
         U2tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUd72Kfp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3861ecf3915si1064909f8f.113.2024.12.05.09.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUd72Kfp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFfh-0003Y8-0U; Thu, 05 Dec 2024 12:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFff-0003XV-FJ
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:29:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFfd-0002kr-L3
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:29:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e075255fso929620f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733419784; x=1734024584; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bFGgK1p+XckRKimAjQg/rIk3yfNBLaJvo7hC4EBr6oI=;
 b=GUd72Kfp5zhNfJ856ugVs1wTgktwOZp/YkoFDgt1uqrgzYlNV+5xNx02F6+pRjpokd
 2dVKo292wcH4wc1IT8eSr6DM4zeEaLK0yQQkQty50QufXDRoAGot7ksB3vob+t7rnUJ6
 /4nq+YId7tNJMPvdabZp5bKeRP+wwzI2De3GkuR7+VsUPH2dEgTf/a37FrFqAl3nnYb5
 GVeit7Qg9+hYQSzzhDVOrBFJ0thFBhvWpmGv1XpSKcMjfdG1TQfzk/wGJf2v0EOrGrkn
 A66gpG/lEP+zmzB87ikkxfsU70m9N+KbAA5MkJXmgeAZy4p81viBx23xy3eaU/5oRAig
 dG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733419784; x=1734024584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFGgK1p+XckRKimAjQg/rIk3yfNBLaJvo7hC4EBr6oI=;
 b=mG+OhYB9gs+/GpAVcpE21U20IyVq1V7aXNcy50+TOewsjjnWD2PCSvj4nchQpAVcmk
 pSHFI2LF4sOBa4DLa/YNl2F6GQbZEC5d+r88VsM3+hBh/7kAhzXZdYHL29giB6vEcaEM
 C69cJOU303XFv01OSIjG7hAaP6w9nKssWfDbeO3uH9g4shp3UtYwJRey67WE/px8LdGc
 QgMmm7eBXizjD41Em8HdxyDou4hNItiXhh58//EelGsmKSr8iq0fO3I/9jTx2Vdt2evp
 bFHMy40/dkeW5UjgDNVg31pf1KQVZUZdhFWX2bbkdgxwhzLonLSxBaYOiA3c7VLD0Kjh
 E2yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoEwyQ5mi0ooS7JzMxUu6pTTFmit9YktH4FeOeAY2KagAmbjcCjTyORB+2nsoQbrSazqPd6Njmpw==@nongnu.org
X-Gm-Message-State: AOJu0YyfYrL0xPs7XFBbjwAca+nFZu/TRoH6qpNIfJ54YC31UTcNkjRM
 tLtr9PWIRPx+4O1bFxFPeSxid8rW9CbBMGScWHVe6ep1Xn4w7mknl54h1lqyUiiFgx0sVh19gye
 OqiovFTok9ggaAlaRR7aEiFsm8MM9OsNrqYwmJg==
X-Gm-Gg: ASbGncsVLMEJQMlfWoKM7XykvlW3kFQn68WBEdIkcxj637P1wKv09G9rOLuyiUyjB4V
 N9kGfPCN3N3jNAG1QxpV3Zdd9YTfuYJhv
X-Received: by 2002:a05:6000:156f:b0:37c:d23f:e464 with SMTP id
 ffacd0b85a97d-385fd421500mr9515912f8f.38.1733419783672; Thu, 05 Dec 2024
 09:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-10-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:29:32 +0000
Message-ID: <CAFEAcA-BEXL7bGhv=F06ocq+fxeU_DqWhPRgTzdpAs8=qcFfew@mail.gmail.com>
Subject: Re: [PATCH 09/67] target/arm: Convert PAC[ID]*, AUT[ID]* to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5Vh/gCgOqJaj

On Sun, 1 Dec 2024 at 15:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes PACIA, PACIZA, PACIB, PACIZB, PACDA, PACDZA, PACDB,
> PACDZB, AUTIA, AUTIZA, AUTIB, AUTIZB, AUTDA, AUTDZA, AUTDB, AUTDZB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 173 +++++++++------------------------
>  target/arm/tcg/a64.decode      |  13 +++
>  2 files changed, 58 insertions(+), 128 deletions(-)

Well, that's certainly a more compact representation than we had before :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
