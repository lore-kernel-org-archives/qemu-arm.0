Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1212778njc;
        Mon, 30 Sep 2024 05:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQdO/w06mM2q1YXBkpQP/fVOsyoR5MKTij8tNuG50QPpnQK3BY57PrEh1gzEDi66PQa/8cqxGYuNO5cQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnPWNClPXiYT+RHpj3KUEhOQxpdZA2F57fxlzwdeChWJgtIn8szRvgPHl/bz8tLP5cfZ9q
X-Received: by 2002:a05:6358:784:b0:1b1:ac7f:51d5 with SMTP id e5c5f4694b2df-1becbd0145emr560272655d.22.1727701085267;
        Mon, 30 Sep 2024 05:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727701085; cv=none;
        d=google.com; s=arc-20240605;
        b=N/ZWbAqxqKPY0Qqv5CLzclg3K21KjNbywJqsmW1H3FtoIJQKx1jruqR2ElgV7UnwtP
         +UB2wOWy+dbkiVnqeW7CyQANyDnwBiEmJ4vt5+1Ukvi285e34UmedqcrR8uWlgt+/9mg
         jZE3KBvZIHqQ770sxpPmgoJfF4dlxHQi6kJDn22yix9/w1umTHWeBPBSOqZbc718Qafg
         EM7VsWTPJmKL7waHq+tP18ixB06vl2tK3ZZTXMSv+Nkn4drMxczYnbgY089Ck3KPyHkr
         wYpAonFoP0a5qM3ySLqksIKbGivLSJZ1akbQ30MbySQmvtX0yfwZ+2sflEsWT22WyKbF
         pxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RJaI5SK5VvVN/3U0o+ob6Z1YSyfENJJm/WYJimU5npg=;
        fh=Nd+7L+fH9JvxR+G1OLPTFbej8G0Ka05scMD0wpnBD4Y=;
        b=H0CmZRLurwQSo+1SSY04D/GZe9wPu3js0QEL/QQKGoRWGibHmesekTE/YsUgJS1V4b
         Le4z2Ee2Eu0yzt8et0Lb87AOaAT3v63fRFtPAmJ1IKOyt0iumgMZm4J5LrOIXYLHandA
         l6bqdhll7TdAf3YRS0w109Y6HdLTJobaMrGnbaDm6UMADDHN2Lll+6skXMh2sHa3zTFQ
         inVaDKZKQfMykeViE9K19Dd60MU0RRVS31Z1fRhlBmlkKuOVon4T+ji9KqYmKkBBrzZS
         Itrhx0UQsQLOQAVHlblXo+wMK95PJ8t/PIciekk7NeuxYEJorAI6cH21o7eGCb3gncL1
         mtdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Efxuk1M5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378a052esi847505185a.748.2024.09.30.05.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 05:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Efxuk1M5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1svFy6-0007hR-E1; Mon, 30 Sep 2024 08:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svFy4-0007Yx-4r
 for qemu-devel@nongnu.org; Mon, 30 Sep 2024 08:57:36 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svFxz-0006s3-Qr
 for qemu-devel@nongnu.org; Mon, 30 Sep 2024 08:57:34 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c883459b19so3645289a12.2
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2024 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727701049; x=1728305849; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RJaI5SK5VvVN/3U0o+ob6Z1YSyfENJJm/WYJimU5npg=;
 b=Efxuk1M5eJ7VsyFb8AreV4WWSREbzrnKjkB4GpPV4wylKkGzKcz9wsVyr9AzuiOtti
 END9AF/LlgMpCWl3p5+Jb6+x2C9lvPb9MOwy9d789i/r3XyD4ugR/bzsDr23e2ATyQiQ
 tR+A6Q+OBCnRblVkD9fzoCXKhao5XyRCndIAKgutn4vTL5ITPrTPr5jiWAnZmK6Vh6tu
 lUHGUTNfLXWWwG3WdwjhJjAOfB+PHH4cSIN1ylTV4aAUXDmShu1btqnyjlKIrPuv+dbK
 t6DVNfgKn7ZbtkE+JRKJs1OvivBAQFjb5OXBzD80iU9QZhLzJM3hkUJo3XucP1CtB1c0
 3L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727701049; x=1728305849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJaI5SK5VvVN/3U0o+ob6Z1YSyfENJJm/WYJimU5npg=;
 b=c1pON0nmx2DGHk/xgrzCMPLCuj3GzAmqj2v0xKjhXcdOQcZmV6+x8hFPvVLfmFL0mF
 MC3t1dnev97g/fw3Pom/90taPsutzX4T7YKLyy6flS8MPN3k/l/ir15p6jYPNBAibcgU
 s7rSJGoezi3jbQDLpk5vi+mW1/Wc85952WoBKDpU6I0iH83GWcfY1JZ09QIK5gWK0s9l
 xLK9kEyewDZUgBWpsvRTpyvFBUIAeXVeTXNrl3VhqZrfduWS14eXkY0E1w5tM0QD+3K3
 7RQPIxOH6ubdllN3dccqMjMmHsarbyhow+j3b+z0yfMaOS/E9yWKHIPFmp+gd0IJNkHm
 An6Q==
X-Gm-Message-State: AOJu0YyQmgjffbb9buwmV1zcjvdQMorPzrdEobF5Z91HwiFUD+OnX4fL
 jk+2ENe/kyRXpL/+EE08p04L5Jgfjf9EcDB/niIGQ2+yMvpq+7Rm9By9wJrGaeBz9DIOwc3FFzZ
 kdcaNXLKyOc3fYtf9yV2ptwiEjHKqACB0/Gya6g==
X-Received: by 2002:a05:6402:26d3:b0:5c8:a0b1:b60 with SMTP id
 4fb4d7f45d1cf-5c8a0b10bedmr417956a12.4.1727701049139; Mon, 30 Sep 2024
 05:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240923101554.12900-1-shentey@gmail.com>
In-Reply-To: <20240923101554.12900-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2024 13:57:17 +0100
Message-ID: <CAFEAcA-69b=MJtqpOss97erRH8v01GdUEGLNydQaz3bVxbUQkg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Split TYPE_GPIOPWR and reuse in E500 machines
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: axukDENH00RL

On Mon, 23 Sept 2024 at 11:16, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series is part of a bigger series exploring data-driven machine creation
> using device tree blobs on top of the e500 machines [1]. The idea is to
> instantiate a QEMU device model for each device tree node containing a
> compatible property. [1] achieves feature-parity with the hardcoded machines
> when supplied the same device tree blob that the hardcoded machine would
> generate.

FWIW, on Arm I have generally pushed back against the idea
of "create a QEMU machine from a device tree", because the
device tree does not in general contain sufficient information
to create a QEMU machine. It only has the information that
Linux needs to use the devices, which is a subset of the
total "how do all these devices exist and get wired together".
(There are some special cases like some Xilinx FPGA systems,
where both the device tree and the hardware were autogenerated
from a common source definition, and so there's enough of
a constraint on what the hardware can be to make it workable.)

> Just like the ARM virt machine, the ppce500 machine implements a
> "gpio-poweroff"-compatible device tree node. Unfortunately, the implementation
> isn't shared which this series fixes. In order to reflect device tree which has
> separate bindings for gpio-poweroff and gpio-reset, and to prepare for the
> above, the gpio-pwr device model is split.
>
> Note: If the split seems too fine-grained, the existing gpio-pwr device model
> could probably be reused in ppce500, too.

I definitely like getting rid of the hand-coded
qemu_allocate_irq() in e500.c. But I don't really see
the benefit of splitting gpio_pwr into two devices.
If you only need the power-off behaviour, you can
leave the restart gpio input not connected to anything.

thanks
-- PMM
