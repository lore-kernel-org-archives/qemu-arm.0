Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp120440njb;
        Mon, 17 Feb 2025 07:44:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFUAbZWA03CrW49cIqmN/0cCkcNY4/UIiGK9qJ7c3IPddlvoEPBa3rZLuv4eoWaRjBgDNLFU4nAu8+LA==@linaro.org
X-Google-Smtp-Source: AGHT+IFlmivxY2zm5amGyVdAF/Xm4BYvAlfJ9UOnNyV9IvHEneWUiua8gcCj57A0ukLYuCJls4nN
X-Received: by 2002:a05:600c:3b92:b0:439:4858:3c77 with SMTP id 5b1f17b1804b1-4396e750e0cmr77779675e9.19.1739807068503;
        Mon, 17 Feb 2025 07:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739807068; cv=none;
        d=google.com; s=arc-20240605;
        b=LVb/v5017o4KZaxGhoupY+khFg0qt/CdKu6e/P42dCDxnB9ILmJn4YXdSBBGvRRC08
         jmQIuSxRjetOA5GIu7FUdd/v9gg0Bax8DiDjP8PxmTKCcuRUa59gWHlJmtVNVVDUNz4g
         +q1hXgbTtU5xibxXlxs41wiAXxOJySWlW+eAe/2ts1hvsP8YIBWv8Q1GF3zbHSyl6MQR
         RHVWUOEa/4xaBg9L3A04L37uiAuzbykB+5/TFcrp7W5ji1syYSLMmSpchYBEKOGLScAp
         wjf9/JWlrFuQqKtPSqNV2LSNuk/iZT3KpWRxjJTSRZ3D+3KHTks/6v3l8pVIf/K7j6XH
         MlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0ZhaA44eEXDUwObb4QOA7d1Iu1Es0Cz6k4D4/ctTUhI=;
        fh=z1RJMYgOFnuNiCM46tvLxqk4YDlWWeZM6FU8mAbu/lI=;
        b=YcUkVXDuO13B0T8/VMzoN15B6iJeseF4EaGlULHl0Cz2eLukwfBgsdsW2I6y2WzeBA
         bHIUpoCMs/WTa///XjN+QlRXR4C7uW9JGtvfF3OJyyEymAePb3aR3xPIEDnq/2O9cXo1
         IHZ/wlOhNDmQvy9dsPQKd3DuxNGc8BinP439YYdnuFVmP2ofJkXB03bZPWZ4SKjsqqhU
         Vp+B1jcTJJc4x5HEW5puI99ljl+V1kpIna0H+DiVZUIc3MxhlynK+LFyAe/TB4xJqx0J
         ZOaipkUfoJ3WxNmUCQ2Osu5B+pj1v3yio6C0TEWeblUdNr3bpTrbLTCfhPsfzHvJUZwM
         Qddg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D19EaSY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-439907181f5si2626945e9.15.2025.02.17.07.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 07:44:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D19EaSY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk3Ht-0007SF-OG; Mon, 17 Feb 2025 10:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk3Hs-0007Rx-Vp
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 10:44:01 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk3Hr-0004np-8m
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 10:44:00 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e5dd7b439e3so1318221276.1
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 07:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739807037; x=1740411837; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZhaA44eEXDUwObb4QOA7d1Iu1Es0Cz6k4D4/ctTUhI=;
 b=D19EaSY0qL4+yihXocJrg8CWNrlDwO+f4EvqCWsfbvI+sryKlJLGNu7vpYGuIxTTaS
 QAAmwqh7vBvcly+yT2vMY6P3otNpj92Wz5ZMt5pwh4CXrYcg3cicSXAoXKth9TKCOsJK
 OgthU3xroMr3k/qbUAMZMDaKkckg6YkNlNQA+mp45QNUaMNEB7X2GTj9pERTir5RWDTd
 w/0cm3wweb8ZFpfIq97n0oH0ML224ljWG/FmATDTt2soJHL6CaDcCbRNrEKIPL2z9hg+
 oWs8dkYcto+pxIQbxJX8ocl9V8gJPZKYJphQpwix3o5ZUclbfsnz1uysvdExAX6yHhoj
 LC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739807037; x=1740411837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ZhaA44eEXDUwObb4QOA7d1Iu1Es0Cz6k4D4/ctTUhI=;
 b=oqVmDl71YcJxJqtLmuVkjjOabZH5HdXYIA7AtkALu0pvCnSAMM9mjbZXdRlnGfm9LP
 pP0WfqsBucKd6e+7aAnJlMA1C7CgF228IWIgyfd3Zp4Dw4D2Qz0+YuWflbNB3DEbKctG
 S/wgyieEoOXZcFTeM0Tzx+ItSVkbbGtkvybZsVnmQaSV8hwPPWAluF9RlTzm4W97J1vk
 Gyc4Wo47DR8vegdVO4Ko9qbAr01thIHqv+lVUMZHi2BX6OTtUeUeex5cQQOOg5bMtDBj
 muxBsU1Q4//wW2FH2W0FJiLeru3bWyD769/2BhMJOF1ZBuj0j320L2EvMjm4RRUfa6sH
 WXpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHFn19fzIQuUXNNTnqpa3EgQPt9nn1GB0USvIO0VXEyMK9DPuzUK8XBP6SwZ+p4V9A5DhAUNJwNQ==@nongnu.org
X-Gm-Message-State: AOJu0YxuemCLm/QceBWeC5zqK7uVdN8W3dp2RNAuf8LQEttjKylAMiHf
 0iRiE/OIEQ4EiSnbbedlcWkiXlAouzcjE9BahSLJ9uEaRqrOhOxP7UT2IExdyFsCNFB6oY9L89u
 WWNZvX05aeU0fsG9Qo3ku1DshZ2GoGZQcVusAqg==
X-Gm-Gg: ASbGnctTXsNhDRTb7nXJlksVMBN5nEw2pZdrCjzi6eeWEaoSZvfgewLG4S0OI7prKwH
 qGGW1SNfS2uhLPX9zvq0oquR79Q1+sWzacqnMl6hdQG/bHGTFgQvF/0mX6XvtQoZsmAem4sbiag
 ==
X-Received: by 2002:a05:6902:230f:b0:e58:dbf:ed09 with SMTP id
 3f1490d57ef6-e5dc9038eaamr8213890276.3.1739807037523; Mon, 17 Feb 2025
 07:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20250212154333.28644-1-philmd@linaro.org>
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 15:43:46 +0000
X-Gm-Features: AWEUYZl_10_fWPu_ufGPbFmphxTHwnwPtq3k43WitvsAD-kUI4E1WUYoZZo1HWk
Message-ID: <CAFEAcA-4rdTWsBYKL05OKBQc2pLWoPsYm+Qdhb-ZD0qs0t8MQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] hw/arm: Explicit number of GIC external IRQs for
 Cortex A9/A15 MPCore
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8AHZwv/BMsvN

On Wed, 12 Feb 2025 at 15:43, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Some boards based on Cortex-A9MP / Cortex-A15MP do not explicit
> the number of external GIC IRQs, using some (implicit) default value,
> not always trivial to figure out. Change that by removing the default
> value, requiring MPCore objects to be created with the "num-irq" set.
>
> Since v1:
> - Remove generic comments (Peter)
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   hw/arm/exynos4210: Replace magic 32 by proper 'GIC_INTERNAL'
>     definition
>   hw/arm/exynos4210: Specify explicitly the GIC has 64 external IRQs
>   hw/arm/realview: Specify explicitly the GIC has 64 external IRQs
>   hw/arm/xilinx_zynq: Replace IRQ_OFFSET -> GIC_INTERNAL
>   hw/arm/xilinx_zynq: Specify explicitly the GIC has 64 external IRQs
>   hw/arm/vexpress: Specify explicitly the GIC has 64 external IRQs
>   hw/arm/highbank: Specify explicitly the GIC has 128 external IRQs
>   hw/cpu/arm_mpcore: Remove default values for GIC external IRQs



Applied to target-arm.next, thanks.

-- PMM
