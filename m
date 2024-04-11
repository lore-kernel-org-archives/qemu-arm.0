Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp887585ejc;
        Thu, 11 Apr 2024 04:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN3jrJ2OwhL3HqtptV5QfnhhHwgNRYozTVlzRZYEfv/O8kJ7kB51O97iL6xBGdrPjQhoIGxVo0ktZoQPStuEkkdINk+R6g
X-Google-Smtp-Source: AGHT+IG6asla2wjrxweYJQ6M4f85PT/Yf9N+B9+QsgEXLQcGLfRWu36a7QralJ3riWWpoZ31eLO2
X-Received: by 2002:a05:6808:1314:b0:3c5:d51b:bdbb with SMTP id y20-20020a056808131400b003c5d51bbdbbmr5910008oiv.58.1712835051005;
        Thu, 11 Apr 2024 04:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712835050; cv=none;
        d=google.com; s=arc-20160816;
        b=0uj1ZO/f5kWMZPPYhGnClQmgZ3gxnL/RRC7sq6uTk89w7k1oIKBuXvh8JhNMZVr8+r
         kBMEoWuB8Q3/V6ds57ksN6iHSAt358WAT9AsP96KFGkAtVCM+WvYoZH4IkA43jMEHweI
         JwJnG4POAlv1YpTqDyR+d4EjS7oGDTPPNi6Kiw8mKezeXheBnvPnDUJakoLMxp6VPSCV
         HuxNN9q1ERnHzarJLEr8/L6peFztCputKhpwxEYOtp0gG9hFP3wfMBgFncwDQ0i1/eoj
         /fGmjPRb7cSu5VvCu5q7SXTR1yiikr6YqgWCdSyBSF71n2m3eCi9FsNN83bEg61byO1G
         1jQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C836pQcgTLra/kJ/JUFTbZumnEBac6SnR5IxpEompXo=;
        fh=mFaUoxSaWf+inMxMANG1xCNdgKH76F71PKjZH2uHLIU=;
        b=FY8ryhaGtcKriq6GGfgBlq7XBkrm6pukYUeBJlVWKLr1FZBcmgC5kVaHcjWI1xJ0ee
         0mFrB4jDZtsLZwspThY8By4s6YblOqtQD90gYexGYXjoms+4Q70P4qU4khTBKjWOdEWh
         R8vQt+k/8t2JqdryZfSF+8YsX9NRHe5IGyksuvh0s8WeGW7a8iCbmSEBoUv9LbcivaTF
         5Bor16+DQbfv0fmg7z52uu1b3wTNwGWHtzFLmLvyoAn3lNM39b9czPeujfICiBy0g/bq
         NiobjeaqxpSB/9bXUDRp33jBGmDIMXx5GSjwuH3xUUGkncMZgEC/7ZtviL3putDRlRzb
         jUUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQ3M5m37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac857c8000000b004366a236d1fsi729503qta.457.2024.04.11.04.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 04:30:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQ3M5m37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rusdY-0007Hy-Hn; Thu, 11 Apr 2024 07:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusdU-0007Ft-PY
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 07:30:32 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusdS-0005cO-3K
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 07:30:32 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56fc155b646so2111595a12.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712835028; x=1713439828; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C836pQcgTLra/kJ/JUFTbZumnEBac6SnR5IxpEompXo=;
 b=jQ3M5m37Q2hWiI6A79OiigDMPJee6BKQ+oRhGk/VI6wi6S6VBNF929Q2TsZjawjkKs
 BBhfgZx9oamVJPi5vTFH6nFcnCSQEDNOjJaLBN7qK+FJuF+sS+/asA2UzQthOpmbIP1q
 hmp+a32zsFsGQ67V/XGtRtmoUwYtbGWUis3Km8OeVH+Z67G/YtNHTLuMD+BUcb310xoV
 5hpf/V+MiKTmzUNEn7yFvR5lLTeA07J4p1JPoTofLrJP6Gm5opPZHmBtGlSq7/ao2P1K
 YoQmB9AbiBZ1qqUnl6G75I8bmRv/T/t8kkInfBMRylypiAowQSkmJj9m7vh3XcpSaAna
 xecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712835028; x=1713439828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C836pQcgTLra/kJ/JUFTbZumnEBac6SnR5IxpEompXo=;
 b=Wo69R9JjhXEG4ElV/Jca6z7rxuzRjf76Msw2i3bKEIiPZzOO7NVF7pRl17WZX9tjdM
 LxLJtW5p7n2GoGBvTxz6ojeBeI868nngNhz7zcPg976iD6Wr24gkjR8g2CBjK1myECwS
 kLrXymny9VDqrB5NPnoVaeLzUtFUOecnH0ebAz8FgUnEnPIoYn3Fnf285g+MWVqLbSME
 zXavQz2jLPQR1dw8LLHHqKC2nDRi60kCq/aW/NKJH/7q8ZiqPY6y2GE/YyH9el19/LRo
 EfLGiOJDSm+htGBLtD+KSXY/ymcOvA3L9b4tfasbn/gf/zqh6nuADoCkjFXIRGxAarMC
 YLqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrz9CBfC34GxWytZl04pj0twJlFOwZvbA4gEgsS1tHT6tbSBunV2ZSUWDdTVhje1hHCrZulxhYx5RsSgR6oQQoP3V/
X-Gm-Message-State: AOJu0YyKmLlfAJvRumA0elU4R32rvLfKo9MOVsl68JhyJzY5amoV0uP1
 t//zgmQRiu/v5MXdlmf/QqTRlLpCE8saiXL9IcVOq6iIYkbf4zDk/eblrg5u8+kTznScbw77hqy
 pME0DB886AkOLDUIHIy1V1q4M0kTBo+/n2mx0DA==
X-Received: by 2002:a50:9b55:0:b0:566:2f24:b063 with SMTP id
 a21-20020a509b55000000b005662f24b063mr3675472edj.23.1712835028041; Thu, 11
 Apr 2024 04:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-7-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 12:30:16 +0100
Message-ID: <CAFEAcA9_pbMBjNsOJe2LkfC6z5wuRMSM1pL7X0aHVjdzysoLOw@mail.gmail.com>
Subject: Re: [PATCH 6/9] hw/net/rocker: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: 6aQUYfPTdbr7

On Thu, 11 Apr 2024 at 11:47, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.

("developer")

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/rocker/rocker.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

>          switch (offset) {
>          case ROCKER_DMA_DESC_ADDR_OFFSET:
> -            sprintf(buf, "Ring[%s] ADDR", ring_name);
> +            snprintf(buf, sizeofbuf), "Ring[%s] ADDR", ring_name);

Something seems to have gone wrong here. Shouldn't this have
failed to compile ?

thanks
-- PMM
