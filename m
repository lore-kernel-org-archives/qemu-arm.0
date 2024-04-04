Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp289698eju;
        Thu, 4 Apr 2024 07:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWjT7rn/WCds3jxq5VFyaZASxdyK8EORBcnfmNXmfgKj54X/ue4q5cM7j+deI4sI3hOSVd8Tu7tZjtEI+OAXNk8kwjJVSN
X-Google-Smtp-Source: AGHT+IEOe6ZcPI2om16cg5s81KrjX4rHfPF7A4+zKRoNd+g2zBTDPiA9/GnRAT1af6Ad2lpCuvR5
X-Received: by 2002:ac8:5cd3:0:b0:434:4094:2cb5 with SMTP id s19-20020ac85cd3000000b0043440942cb5mr2754496qta.0.1712240313806;
        Thu, 04 Apr 2024 07:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240313; cv=none;
        d=google.com; s=arc-20160816;
        b=H//VcX2azj9f3e0X6qUasURY3FFzPsi7tYjA/oIlsnrNQf7Ftld7jShUa4YgzGlPn/
         6GM26brSIBP401Bm6usHvRk5BY16BHfFWiqoHPDxNw/3Bdg4fPDxzaZF+xo62Ot930yj
         oViOC5u/A4g237u5cBWaJSJZEhv/hCyBw3wYZ52bDcbgXS667XhpXHQ+gLtqOGCnpaVl
         DL/XjaIyD64I0Az9SpXv6/zXOYxxljJnApb/5Ei/t0POQ3sfErrmnJAsezP8PIhLBP1n
         +Fq6y6ypYNcdwMulmNXhYkibA29yrju1ciAbz0SC+Ljsz37fvnb2eV8M2nhaiodXfJpo
         Cbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xikcDFJLxhtpWznEYltiS0RR5yx3flfHluguPP/wWa4=;
        fh=GPhr1zK7PLdmZEinTYZQ/FAuEESBhAszdxbf1anPT0s=;
        b=iCIYDhsaJZgXj31JUmFJdLVhRX+LnIJhKGYoxW9vtTo/weZ2vnjSpJ9rpPTjsDEoBl
         yKjb4Y7bhj6JnMhvmr6jPmdsP7rB5VZMcu57tQzokXkzBTC4GPS7oaeACfgMv10bDQqy
         fR4nCnLqx6XEh/aHNxyPzQzT/7QhqEOlOMRnSxLisegHyC3471jen7XRDFlJz4lw7y88
         /xiahZv94KmfPy9FZ9XJIAH34gBO5Bue7DDPNNzEnbh76HxQkTd708WRAnqhzitbCZ5R
         /98I0U374UIBisGXUfOfb8H1SXRugmxf7djTU93uZrDnuXJU1T5nDmrmhA8D1V1QdZwo
         Fp6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s/KZFMu7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05622a164a00b0043182d46f04si16715652qtj.306.2024.04.04.07.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s/KZFMu7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNv2-0008Ra-CZ; Thu, 04 Apr 2024 10:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNuz-0008Qj-Nt
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:18:17 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNuy-00008E-8M
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:18:17 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e0acaf69aso1287464a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240295; x=1712845095; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xikcDFJLxhtpWznEYltiS0RR5yx3flfHluguPP/wWa4=;
 b=s/KZFMu7ErZWvzlFp8cx0ElYSSANcKQe9FnlIHg+wn4QMU8KKeQDseAIW8VjEhzXxj
 fKRMtFqzgJij+loKqgJjAqzoa2mONKdHf6fjB36CuA5NYLyIIFnMTEhA2YvOxHNMkswY
 F58KzNkuzCfWBZOi6hgbHHJRQ91nZTHj6lUYqX4LzTnuo47QzPOd0MuJ64EgB5pME59y
 mlaJnz3rRZ8hcuLHJMEWZsKc4h3ffSmWHEB3AZlp+hU98n6KF2C78vbbOKAeLeU3ZEAe
 CFDCDanmMd2mQt7NRlgT01OzV8gggHbvhU7GHHMNIXm3JrSbuCY34F7o0oHzUPSXyIsd
 1fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240295; x=1712845095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xikcDFJLxhtpWznEYltiS0RR5yx3flfHluguPP/wWa4=;
 b=K/3Sfmf6zSd5/3lUvCLuY8LtZShNVkwqNvxsVS7+UHzGmQ856J9u1F7WGreWPINbrT
 D5vHLg8LPx9AYXV+W6ay5CZY80+TwFGSD1R5wNpSiVhBI96pJxXFDYu9mBuJvUQ9JGyg
 e12pNU9QpFoNhVnwrOgMsg/TsxMEr/Ogikhw0e9okTQnM3CLkpwveiCIGQ7Bu81x0euz
 Ghbc0XRQEqjPHbJ5f7BOb4h3YKonAaTJOh2sp6/0YDr21Q38YX7XUX5usmifqHSa+BpK
 u6xjnpuM73+2c/wOgBzvRa1pDyFBQK2ufiX3P5XOJ0Ng8UNN7QRXXrtMSmFwLhXYoYg5
 RUHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZPJQVgOBYN8CNM4qcrD5kczUOtPgKQu8JZdVFh5HEVq0Ak2czvSFhEq/jC14v78Vli7aXW3M1RRe6omWT3/BDKKC0
X-Gm-Message-State: AOJu0YxqZB491+RgjNAhoPjst2uc0xXAB2RB80HgMgA+V5+GRsTYGKbR
 8JjDpcTmSi+TpMwc5kVUK4ZoI0XR0J7JDkVioLtp23m7hlYLixOWS/OSeiuZczWr7aTI5Hm8wbn
 s2PWwcD1vYmldepXU3GGQijTqK69IN1ic/hDSvQ==
X-Received: by 2002:a50:d541:0:b0:56e:f64:aaf6 with SMTP id
 f1-20020a50d541000000b0056e0f64aaf6mr2111228edj.5.1712240294663; Thu, 04 Apr
 2024 07:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-9-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-9-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:18:03 +0100
Message-ID: <CAFEAcA8sb4w2VHrqFa_t0VjjWem1MJkN=9AwCNV17u==WOev5Q@mail.gmail.com>
Subject: Re: [PATCH v12 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI,
 VINMI and VFNMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: 3j8y75B3inj6

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
> CPU_INTERRUPT_VINMI, both CPSR_I and ISR_IS must be set. With
> CPU_INTERRUPT_VFNMI, both CPSR_F and ISR_FS must be set.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
