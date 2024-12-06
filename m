Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp942461njb;
        Fri, 6 Dec 2024 07:47:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWr6cl2iDHsD9yjdxkl2MRFPtv6xAugIc99eOtxhobmYUYKgsYZpxmgyqfHanpFdc8qL8yi2VUxlxPN4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHx4MWcU2AA9+dqRXMEhaFGlyEB0MhUn4qWa65YGAOQ7+eNwr5rldiAe0fujZKp+J63Agbj
X-Received: by 2002:a05:620a:2441:b0:7af:ceb8:13db with SMTP id af79cd13be357-7b6bcb41df0mr493234285a.41.1733500040746;
        Fri, 06 Dec 2024 07:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733500040; cv=none;
        d=google.com; s=arc-20240605;
        b=epikgk1PTgP5hwTGNAoBY5u9HMf4kv5c1LCT0hX/n7+Gg0usLRieXYgBYLuo4iSlUE
         QhERNzCFQM8LsRfr/wd7ZKAT1nZsGuT1+fki82wim+49rBV1CULgc/ErhMy7R4ZrvTNG
         7ZgIP9kRaoJ/6Am0wOUy1CtbwNLOCEQlz8QZaThDl6T/xXYur2zQXeBSlj8giQgX6odG
         aBjZv+5D3VfBlYeweFS3jmvUrRQuRHm4GNoEqdotNUzrntZOtqLa0KTXS8jvo+KX4LM6
         sjLfU6QZ0goEov9e7G7E87IyP4i2tdx4cOYplNph8fFsTkD2Nz8kAGK6TOsm9vCb4ded
         WD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U6SNQ+yfHAdSrUciOzwgTiudfubcDQS4W/05+DvyOVQ=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=TBDS/o8BLhwx7SdFeX7g8St8OOHBkXbV/y5qF37qCPgqPJq6izs3Jg82EFVRHO7yHr
         s3J3//yEky9u9k3o6Kf46DoArG/XuKz8FPSIrFhIeqbGZrs+RqfUHGpotTDVgSkxQMG/
         ymqUTqCi1eAT1ZmB6Y4xDQzT7buwhx/RXZJm8AHIe8NCc6Ge/28yAhKJNOjm/l7q57U/
         vx6IDNlzTDBcPTMnfjYoh+kMz70f4xYczQl7DKjPKABB2mhEKikvOxyE4cfK5k/F7GM2
         JE7m23liMRYsceALUvXTi3I+SJFiQR1CphAfVtFulL9ClHbR/+gEttWFhswilVZl9ig1
         pReg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgbbSWJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a4672fsi404953385a.123.2024.12.06.07.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgbbSWJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJaXe-0006Yu-G6; Fri, 06 Dec 2024 10:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJaXc-0006VY-9f
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 10:46:52 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJaXa-0004Pe-T1
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 10:46:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cecbddb574so2552891a12.1
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733500009; x=1734104809; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U6SNQ+yfHAdSrUciOzwgTiudfubcDQS4W/05+DvyOVQ=;
 b=QgbbSWJswSj883zKlKX2OJNesbJD1/YUzUnvYEBu3gd5ATIQOUiDKlmklNFs2t7IrA
 anzrh/YDkxquwgqZKtXWqubc3fLhPw7XG5uHSRqICIc+v5IMfWxsWCtmuwNCj7fDiqU1
 qms1y5Ir3ZGnUH2aS/jW1aNUJKPBdy7iNSbAI26YqYnmGFgbvq6eFtNMgrX0XjtKym5d
 NDDpNX1IhSKTwTAviISO3fCOb15ooHj1AKBLvt3uZP/jUIxjgu3BLgQeLvSB0FnW6JN3
 lejb6ic1zRMONl00VmyOOlS4GX8uiMxjnYtt0pTild52eGh2NKHAIiTN0mKBsG9Xxwiy
 TMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733500009; x=1734104809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6SNQ+yfHAdSrUciOzwgTiudfubcDQS4W/05+DvyOVQ=;
 b=H+KsWWfNevRV8Yk4AYEdQLF//B4O8AX1rXjGM89v4sBhP7dHEALBIw5XxNJWUKtApu
 WNCOutYH8TN4pjK1RNZewfrL/y/8KgqnXi9RtL75MuJTGVBkMDf1qwg63YMfiY77FJiW
 wm1VDkqdbDyIsq2T8+DucSPrUNctrXBJZjexyapZcY+PGH2J9a+zZcoBvG93lkLa1KhN
 qxE0ukWqpcEtqhYOVVEvHCIwTe3CBaQ03usHdiy04bYmn63MTfumoiAQxkNV6qp6c3jD
 UYvWRgUEJI7SKN51cBCDi6UN8IBhkTosSgICJCflU+WnzkVv/xx1kWNAVJBf3bMIVub7
 yp9Q==
X-Gm-Message-State: AOJu0YyJ34gw6BTEqh1i7jIVWL4NQpCrw400yvrqbmK9pRJSdXfVHt0g
 Qa7NAIn7t+UYq/8KmVGNFyOvYy3xSkLZsS7F/1fJQhYAbXHpiyR4PHHJEPQKGArrP9TJadkrttR
 qJooRka3YCzadzqynmyWWJw8jnbhHk+DLlXzBmg==
X-Gm-Gg: ASbGnct0M1m1T9B13dD+/HQPIiMt3jprWJhulGdm2UVhBUlk2hj+pySi6hCxK4tsDzS
 EMY2QSttARVc3Sd/ckwkXxowSztaPiuXs
X-Received: by 2002:a05:6402:40c3:b0:5d0:c67e:e263 with SMTP id
 4fb4d7f45d1cf-5d3be678280mr2843400a12.8.1733500008960; Fri, 06 Dec 2024
 07:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-49-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:46:38 +0000
Message-ID: <CAFEAcA9wqWr_2_sa-yj6e7m7qxp-Lyr2u1HGKjpCbYxeReFCnA@mail.gmail.com>
Subject: Re: [PATCH 48/67] target/arm: Convert XTN, SQXTUN, SQXTN,
 UQXTN to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qopeQ3NfFlgT

On Sun, 1 Dec 2024 at 15:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 153 ++++++++++++++++++++-------------
>  target/arm/tcg/a64.decode      |   9 ++
>  2 files changed, 102 insertions(+), 60 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
