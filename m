Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1432855ejb;
        Tue, 19 Mar 2024 10:03:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVg2dJPi77XyJURZ8eBVeHzxJqTG0Ti0wA1t6H+YKKipRadK4xMJZbbH9naDSlYnqAq/rDLylwmGJPSlzyu+6q9dA7shRmL
X-Google-Smtp-Source: AGHT+IFIYa2VqbwtpHQ71H0/JjP/P1fRmoGuMT+4pVFPtFaAxkbMWFhyIBG9nX+Y1FDsTFtd0sTz
X-Received: by 2002:a05:6102:225b:b0:473:c48:cd51 with SMTP id e27-20020a056102225b00b004730c48cd51mr10897659vsb.8.1710867831186;
        Tue, 19 Mar 2024 10:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710867831; cv=none;
        d=google.com; s=arc-20160816;
        b=wzRYa03kkp7kK4qVQpYx9NSu7CcjduGKVE2f7ONGTeP9WnXCW4JGSpPm3loQe27Imp
         EGW51F8zjTfKXwxfKL3FfNRfIJJonPoA4OcVHmpVVEDjZwNAWBzFR8DUdnmdXE2ybdzl
         GOrJE4CV23wl4Ibz4oj7LqOv7iY70ZhF+fRU1kt2esN+dNDL8uIkcvnOIQrSAUpTASBs
         NhCE5QC19igwSK2ptripXQDbYCgkYLZyUiASHADS4wuwKbK+IhWOorHcrK4+nYmMjLVI
         vTNI3TABC3OSlknkvI8869NokLlP26oC+mF5kWZ7dweTHu/b7MwuHrJ/A7255spBxFtb
         Blzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2b3jASX7RFyVohiA/6seRvyBdIah23RfJM1oQS2Tbxw=;
        fh=4hNCsbtSDSa3AbDl1hI/vcGkKcJE8vIEj0CWYymidT4=;
        b=m+YkveDvwSR47Dx3A4OIiJptnkeNFiqmZvMRFZ6Dit339s5YktjG3f3mOwOsT2QhSb
         LBPQsDsVlyaLiDaJiGMbN4PfqnwsIBhEXOdlWBNUWMbF+PnYfNii4hHwOp71CehgxB70
         Ey3QHzbX0rl3nIoIp539qCoFNfSelS1Jw70SPjyw0HsmSLOHvCyBYxfbxtPHtINL4H3T
         nuOZ84LNAROQ5f9Vz1w1aHEhIz7v5PrpOJDpghvQh5k3v7vtkZZD2rzoWrSAYwrDkHg9
         aHinRt9CR06CnIkcj5VF4jmx4h+fQbrQfBDjoWyf7iK+6Wd1y7WaUcYFuCgsqREUE3ei
         FetQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RRZHwZA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu15-20020a056102160f00b004769e6242e5si285558vsb.749.2024.03.19.10.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 10:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RRZHwZA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmcsE-000782-3P; Tue, 19 Mar 2024 13:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmcsC-00077F-Gd
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 13:03:36 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmcs0-00046m-To
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 13:03:36 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so6777419e87.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710867803; x=1711472603; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2b3jASX7RFyVohiA/6seRvyBdIah23RfJM1oQS2Tbxw=;
 b=RRZHwZA2mbNmYv+lJg25Ast331NSKJ3VPAnIez2GAgGAmaK6O7zOSdhr9wayYCYqEF
 dYaHSZDwN7JtDd7+0gfMSBL7NeAotLsEIv539SkEjO6Fmrn7L6TUpDCkSSD7yFx5Yilb
 U7e4Uxtj5wMLgr6Quv/Av2rSgPgo6sZ0kAlZqGICbagcVAheKhdlHiJ6zbkx6KKExE6v
 iy2CRSN3g2Z5/HAbUNTjYM9GGtQuR09eIZuts44UxisdEzVUGlX0g8dsLZAtUu/f9THb
 RE7SeyIiWAYV2HL3bK8zMahH4oZeqzbW/b2/MLkSMvW55lt7R/jOlO4rhzsTJOatiiTY
 Lj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710867803; x=1711472603;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2b3jASX7RFyVohiA/6seRvyBdIah23RfJM1oQS2Tbxw=;
 b=w4ao2JijHIJ0sYqvYE/Oq1eAB7ikt25z704UXgHlm6redcPOcnj7aidLhUUrwZTXtU
 4h4koBYLQSl5vETgo6qMysnlUz/LZ5jTzAG2xO/151QaVg61Ss3+uTOfJYZ89LaAjN//
 aqMNnhD3NfvsrtSr06Q06AGXRx0d6nTzn2eLfYpDZfRJTOkjXPMVneuRM9mWgrxyifPQ
 UffCfKD9NRglIDXJIPLj5yB4wOsyywnrCejdZ9RFLvdHI3W0MCU1HufCHtND1tqUUQX9
 R4oXztEW/TfFTZgw+I2hCAL3oRfGsNL1RdGGgnSp2Mtr3dCzTU6azLlCRu5P4qazKxPp
 mRmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxM4tT5Pu2qbhyu6FtiAk6qtvhJRu8Nn/I17P9XHj1NgyJNcssFNXxNXB7t7d74ZsfnL/MkslTPi6JIKiNo0c5lqOT
X-Gm-Message-State: AOJu0YxS250QUtU12qmpaZOaiEopiibfZsYltHqr/Ri6a3xJWy0r6S59
 aOW++pVJb9uHtf1Erp3IZ8M3k+JUiKgUd0DEJLViOMDP9oKc9ZTjMViaWQzuMa9gZPoI+Y5+uIK
 BjI6GYSZD0ZM+YEgfKu4B8UK5rgrQrUbSlXd/Dw==
X-Received: by 2002:a19:9104:0:b0:513:dc90:7d1c with SMTP id
 t4-20020a199104000000b00513dc907d1cmr8101164lfd.18.1710867802807; Tue, 19 Mar
 2024 10:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-7-ruanjinjie@huawei.com>
 <8d494fe8-c0f0-47b3-9f59-ac69f10c1e64@linaro.org>
In-Reply-To: <8d494fe8-c0f0-47b3-9f59-ac69f10c1e64@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2024 17:03:12 +0000
Message-ID: <CAFEAcA93HZEvVxFWE8GoCEZwOMjCVX-_EdOoubyGSyoMc+f6LQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/22] target/arm: Add support for Non-maskable
 Interrupt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: 6LfylZTPIH3k

On Thu, 29 Feb 2024 at 23:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/29/24 03:10, Jinjie Ruan via wrote:
> > +    bool new_state = ((env->cp15.hcr_el2 & HCR_VI) &&
> > +                      (env->cp15.hcrx_el2 & HCRX_VINMI)) ||
> > +                     ((env->cp15.hcr_el2 & HCR_VF) &&
> > +                      (env->cp15.hcrx_el2 & HCRX_VFNMI)) ||
> > +        (env->irq_line_state & CPU_INTERRUPT_VNMI);
>
> Because the GIC cannot signal an FIQ with superpriority, I think you should not include VF
> && VFNMI in CPU_INTERRUPT_VNMI.

The GIC can't, but a hypervisor can -- it just sets the
VF and VFNMI bits if it wants one. (Architecturally, the CPU
has a FIQ-with-superpriority, it's only the GIC that doesn't.)

thanks
-- PMM
