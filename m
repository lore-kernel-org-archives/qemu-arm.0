Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp660415njc;
        Tue, 25 Jun 2024 05:39:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4i0AKAdD32hulI9R0xfoRKYk7LOXRAESJ37YuAZ96vdwZxXbN9QMPe2l1/gR9d5LRCf4A3fy4tYEDPMziXUSMhXo6uV1n
X-Google-Smtp-Source: AGHT+IEXwwMcrXbcy+b/i/zTKJciR2G0ovMGqoiQyeKKUtWi18LIE4zVvzLMqXaOQAW10cxkcnge
X-Received: by 2002:a05:622a:6fc9:b0:445:11a:9523 with SMTP id d75a77b69052e-445011a9a81mr4923291cf.22.1719319141847;
        Tue, 25 Jun 2024 05:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319141; cv=none;
        d=google.com; s=arc-20160816;
        b=HsEJ6suWOuTRFCQgwisima8zgTALQfSf68r+Y98DFotQvva9VgSkwkT4FEuMQSTTEZ
         3W/UoO7rOEfyHVa932qM/DUmvHUHkSl6cJ5Q3ffDZVZhBIPL9Tl9BKmH+N9m1uCEgZaE
         gjMgLYUraWvicsCN0Jx7d2AiAUwt3AGEv6pnTQzJll3V47hDiXtuoMVlMw6F9wsjr8w3
         hAxpi2R2Ti5YWKGAbTXd+OQh4avpf/rZf0zeqXB21GAKL1jB6oWz5c1I8YHuqWTU1IXS
         MirjbMu0+MWIROyYpFG4hY9a39AB5ib3VkYKvogs17fPE/3Mdvhm+BHSMkU16DT9xpCM
         0NSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MLeZl3QmhuuLGvbd3nbflAjflso1c1oqt71wUt/s65M=;
        fh=QEW03hIJJQSZQaBKhZyzhScSfMQSAWbjYwgAp72ALYk=;
        b=kCH4T7u7wJV5wy1kcdjnncgf1l1Irh4WVbks9pLqn6ok3EQ7yhOJ86TFPZg3PPMUQF
         8K1gvc6797MxUUDHOfZbn9UxpKgbS5xDb8/Osyagp6/qjFStcOX0D2ecr0NI7OKAIQvA
         RNEciOXVHmqLHQc7MABlpp0deNIEKDO/uD2JXtJO+YCB/A9dfEw+kXfjTrANP5hWC92L
         ZXXx1ndWJJLbiL5WHFmHKDeEwq17x3N5U4fYt15vDWYvi5LP2Sqs9DaW7KAcfvnABUIO
         9ac0Tn3fiO5jPdQYNxUOA7wJb9/n1Ntr4cLMMcRdW+YTbDD1SYZ7ACRlDx8NGNXdk4Z5
         yoig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vteUZUNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c6f61asi108577971cf.677.2024.06.25.05.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vteUZUNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5Rj-0003AB-KG; Tue, 25 Jun 2024 08:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Ri-000347-BD
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:38:50 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Rg-0001zD-Lh
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:38:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a724b9b34b0so276353366b.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319127; x=1719923927; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MLeZl3QmhuuLGvbd3nbflAjflso1c1oqt71wUt/s65M=;
 b=vteUZUNpVOQ5qFJlIfwD9fEwALrXuVGdkYaK2rzTeKyBE0AhpWCQBcxc+47liRLfJb
 dSkSHkMxfnXqcQMIUh3zy/zAfcwrh/rbgVI4Pc4HuBw0CdN1xyujCUHITkpsYH8z19GD
 VuuNKu6LLVGM8MjNSK0XXv9uipmgB4G2F1rKiH+UEFfnF4F8qLTfF5QcXSvDNSt5f07f
 NuTjPG52PZanVKO+YY0lanO0nytKI7B8WjN8TvQP/lMEplEGLqEaeVk/fOfuaHloZZNf
 DHBsBFvfcsRkqHX841KIYv83hJ1RmiWYKCjl/J1W1KbmlrYYE3yjM5l4Yo9iSxnHn1gV
 hY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319127; x=1719923927;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MLeZl3QmhuuLGvbd3nbflAjflso1c1oqt71wUt/s65M=;
 b=Y2o6wPL28ZDnKfDWkxSskPyYbmL/swiPgMIlq9NDBNB90BDWx5ec9wWa5n1iSyxiB4
 rsw/M3kWW1wgjWwayqtYF94cIt184UuwFmkgODN+V83L1+IoXTEOC5QloV4CdHqqLxTI
 Y6cwXfJ53CZN4BzuVNf8t8wEPAr2pjpQb1+HL/DD/W+O9dBGec7HjMFJ8zcfp+5KUP6B
 o/c2scv5ikquXaneCfOlx++WU1/K5MPiLMhXvaoQf0xqO1UX+U2/RThBfFVKBJr37RyF
 bu08mEn8KKirzjbFBa0p+FWAN+HlE1JgBDe2qPk2MgKurvrboE872FO6x+o9ePUZf4pa
 BfQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhSitFtCOhiDn+jfKvRRsXsg4rIsPPYIQieM/kFBDBDuqKUQfE1WCOlhR0iIVd/6//l0njskg5zYtjcotUFck+L8p+
X-Gm-Message-State: AOJu0Ywa94D18qm+lwBbzxBbBv/StP/fFDT5E5CXYfHgLe3+6gYHpyf1
 aKiiJq9h++3EwZD0Cnyvv9hCDNKOzjmsejN2VXqgwZvkZxHsFuNMnMLMLlLgirxuR3TUwrwnWDT
 BpJ2us22v3mg5vl4VYc5ZWDyq8qsG5d7c7yEXYHXNV6aNauDN
X-Received: by 2002:a17:907:a64b:b0:a72:46f3:ffc5 with SMTP id
 a640c23a62f3a-a727f67c2femr17090566b.28.1719319126663; Tue, 25 Jun 2024
 05:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-9-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:38:35 +0100
Message-ID: <CAFEAcA87Fp3PfLZPaRxcaQo2MbajjWf59ZNrFifZDf8DFRzHrw@mail.gmail.com>
Subject: Re: [PATCH 08/13] target/arm: Convert BFMLALB, BFMLALT to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
X-TUID: h6l6rsbFlyxQ

On Tue, 25 Jun 2024 at 06:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  2 +
>  target/arm/tcg/translate-a64.c | 77 +++++++++++++---------------------
>  2 files changed, 31 insertions(+), 48 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
