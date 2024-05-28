Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp39373ejk;
        Tue, 28 May 2024 08:46:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMfc0SHUgLDlgZywpih+wuE3Ty1wzkRL5mHr9jcvR2hAFSD0F2aH0K6Qat1xM/Fhc71Tn74R8jy/jpjFUnGXh3TIDNtMsG
X-Google-Smtp-Source: AGHT+IG6wyVqfTaJr7rzrdAJg3fKqI5SSYatPHJbj2H8i7yzVOGmDCYtb25S104yKmrUREKWa03j
X-Received: by 2002:ac8:570e:0:b0:43d:fcdf:9563 with SMTP id d75a77b69052e-43fb0e260c2mr149924691cf.9.1716911201097;
        Tue, 28 May 2024 08:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911201; cv=none;
        d=google.com; s=arc-20160816;
        b=b+TDml/n7k+VFNpv1x8AQ95vBIhC7/heX8vDB088KaVsLMKMj8nxUR5ZOe8mH+VX67
         lY8hCM9+RGM9/2AeekhBWsCskkQCWJZP7huVsa51/E4GpMLAiABefhhXI0MvMNNdIPYC
         DrWXHSoEibi0ahb9sHF3zKKAl8etpiJiRGpbMkqR1hZvbgyXiy5buwxMhqaTPrpSEAJ+
         pK0Wx/Rr/UcoliL4ryop2a4PXWCxinZzXRQi5+LVuLrozORQhGH9GoSzQ2fnPemgJrgQ
         7HOcLXF7B8v+cIhf0A/18KbaStsqnbCysDjNn0w/3wB01gjuQ75lNEIGW0prIQjA/y+v
         f3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kpJ7180e+TZ5lWjPD0LmR2ZLmDkI0u1LkSQbPu8TQ60=;
        fh=eB0w6Sui+5qBvmeA5NgbnqHLNLBRNDbM5acgof2/HYg=;
        b=XxON1AdcRxXgqtTpMcidsaANaqdfU6sRJcTAbH2pc47RzgzQ0lfuY1HaSMYW5FT5yu
         DINtfPBQnP0Wc0Q57Wo6txJcVq7VkUxIAZjcc54vo5Tk4deYqO2y9GeX8SY8T1ms9heD
         wz5aJwzXQVJ3WcbY42179eG5igj3NiFdNh0P8NrXPL5ErMEcGi447G9q0dHRyI4/zVKr
         J4a4uD62yLjoQAYZ0sNvFAe07D7TF44B+79kn+/dc8ECHlXwVstUXBBTiVI5oFCEUBCk
         Lv+t2NhZLMEVUAsWxda0iUkRuYpflD31ET8dtiZQ8o6iz32yEgv1mw09wYMW4DSc7OSe
         0IcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDioyZtA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c7337si106349921cf.600.2024.05.28.08.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDioyZtA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBz1n-0006fn-QR; Tue, 28 May 2024 11:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz1m-0006ep-0X
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:46:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz1k-0005Zu-GZ
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:46:17 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5785c1e7448so1042425a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911175; x=1717515975; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kpJ7180e+TZ5lWjPD0LmR2ZLmDkI0u1LkSQbPu8TQ60=;
 b=WDioyZtAiaah1d3/ublZXbX0VAsLFJ3SyeHdqxJZXUXCsdTFOSa5kWFNYhGE9IJRMJ
 czox1gN4ruoQcAdwywvYyOFvoRM8Wa5/t+V5CvF6xFnRN0KEXzLoRAxtCwrqaODGplnn
 TjWYvgGyewFG11EUSNQXPuzWOtewKsTtayfKUd7mRsta3paikTyPKZKeNiOVRgSRy54r
 eyCAjEB/USXojuwXu0mn53D3aY2UOUCxm9zurYYdlcCC3/ylhMi3iP20qWz3NcDtre1W
 /eoIQHF7ZYiIQcmgBddshETRtQ9UrIDaWJKmKVJYMfh2iI/Vy1y9pIY74P/tSJnYEgeK
 7yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911175; x=1717515975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpJ7180e+TZ5lWjPD0LmR2ZLmDkI0u1LkSQbPu8TQ60=;
 b=bqPfRMVNA6Mldf+C8pZKOotcmsKJNI8MFeBJMr9elWLg4orAAME2PH6mLCT4GjFU1M
 W0n4l+VaMBCGBHWFWQ6yLLso+QJPJJDm0nIQ/D5im37w7492M9ShjxmglRFekeCy3dkA
 /mYSZk8W54YEhWr2mWBIFT1bKbfoxmKpWfcVsRrZWwa0vhfchhRc57B3/xNGaJjuuJN8
 WG7KEYVIHLKNZlxr4KboC+RqEvmvfFVxKjYZvK9n9KXw8Iou2bov93BJVP0VMuAlOW2c
 zqTZRcAbjVAPwRf5kVD/O+tcGSnY/sD+NAG3hf6kpIBS/0SVyFaixDHerTZG6BrcbgMT
 2huw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ9SOpMqbj3HdBCWVG1aQZTg/4CimrZtGyUqK5Bd4NUoNDBaH2Yq9bucgk044oIN1Ee1dIPkHIsnJDUNOSE4wmTTFv
X-Gm-Message-State: AOJu0YyV3VND0W+L4Y177k90T8D0QOc+v20Lj43YpCEY3zLz9PJwnlXP
 LHq94XbdLl505hifOZuh0IePqZf48Czso/XKAxOvHFtn7VtJDQpR2+vKjlqRSzvWrih6tKStl89
 iwSl/yizut1VdXjxtpA/BOjwMSLXFb47WX8VbL99oi4hml0Zp
X-Received: by 2002:a50:858b:0:b0:572:a158:8a7c with SMTP id
 4fb4d7f45d1cf-578519cea28mr5871268a12.42.1716911174721; Tue, 28 May 2024
 08:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-44-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:46:03 +0100
Message-ID: <CAFEAcA9VVu_iT0TXDuBjK_DPqsQa3PNgFUCf4s775dYJv4-4Vg@mail.gmail.com>
Subject: Re: [PATCH v2 43/67] target/arm: Convert SSHL, USHL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: GgM5vrDUCxMQ

On Sat, 25 May 2024 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  7 ++++++
>  target/arm/tcg/translate-a64.c | 40 +++++++++++++++++++++-------------
>  2 files changed, 32 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
