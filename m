Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp821490ejc;
        Thu, 12 Oct 2023 06:46:03 -0700 (PDT)
X-Received: by 2002:a17:906:20c7:b0:9ae:5db5:13d with SMTP id c7-20020a17090620c700b009ae5db5013dmr21776010ejc.72.1697118363618;
        Thu, 12 Oct 2023 06:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697118363; cv=none;
        d=google.com; s=arc-20160816;
        b=AVmLRoYcgvDin8gMqqCDwEETP7vI83J4CsHqnvCJLPh5woNnU3Cufx8v3AHUQDss/J
         jUBojjAw8utAFdGjGiNxZwSEVvoDNKjTPuzu8G+Mmg1h2W9jIWnqM8tMFYFUZ32zU0ge
         Sb8qKtNClIjvCKkRSm26iFjGe/vuQoBW7cHkHpNWLRgNTxV78g1rK9FcRhAfFPlOHc33
         NfV5SBV6lpaLkB7EJ/PPhuP/l/xvVMLVerdYY9oghsP8zqHcfEb8q8kBN9hRX4QSCcNV
         NsFbLsrfDVr30L2YDMl/M3r7HofudB1B8iNuHZ8jGjKDmtVRjkEllxW31UI+CVvG+9pt
         unfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y5qqyPzMfBchWSX09ks8xoRx7OOOdYLZgYkzCeEAB98=;
        fh=i2QmgDF5aaiywkdO6+bNe/gPb6Y82jLgjbFDTeqpGng=;
        b=YdsJ76XLLlVbkY0Yp6EPM08X9njMZCGlvKDsVSfSWKrr0kDBgpQulXLuWvLkGG8nfY
         MmYu6f/NNHvkTL5rk99xm9D2rVYhwZEWE3d09Rb93WbBkAWyBCunQjx3j7ovtMk71Byd
         Ueja9c2PHO2NOA+E8EgwE/clk28DGT6DPHz0EuAMq1J8EmHZ3lw1ecBMYWJ43Lucf2Zm
         qJ+JGz7B+dZqps0st8M/KP0ZgAnxmkmFJWR4p1g70jfs/3QPP2fPlOWJwtY/fkV4yXLz
         pxungeZ1CCwLsTyNsn+BIN+BFsVZJzWenD050Om7d5ywIiJVvUOaCytDZ0mlZobdloyY
         sXEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEVgCQKa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mm9-20020a170906cc4900b009b927358aabsor5857010ejb.3.2023.10.12.06.46.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 06:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEVgCQKa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697118363; x=1697723163; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5qqyPzMfBchWSX09ks8xoRx7OOOdYLZgYkzCeEAB98=;
        b=FEVgCQKaWwalP3xzBuVIkvYRQKbIrwjDKsKQ/NzF3LjUzX0XP4X1CL1KmAerq5ib1o
         Mxdivfou5DXtBKttRcZH6EpvS2TZUCaNZQWJTUwtVfaGRA2ZWq3tv14e0mRm75ZbO2aV
         gj9fnhqIcOm2VEYp/8Vo9FUC/xHpwihLVMRRispjCWwezTRib6zM8xFT+0PuxBUIgLlp
         1CSFr4kPF/+Psb94QkplA/ZHuj7omM+WzXKjzWEi/hYhUFW4x4SjzjwS6MJ+36lnsXEi
         iDZsHF2cEgVhC5CgYTP9jAnclVIVgzet1NnZ2q2kpFv8jk8976/Ox2KLhJQVq8MrAkcE
         nwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118363; x=1697723163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5qqyPzMfBchWSX09ks8xoRx7OOOdYLZgYkzCeEAB98=;
        b=esDkZu+A2e5QrR1BYBDmcVqUBQ4JnA0XwI9XZTexY4PWJkHqbOnz+4f7GXZTNDyhTH
         A5/fz5tyVtuMW3krvsem4rHPxA/nzHHsM5vUWlV//goRoKMFBcuo8ji8CzMg6vrPct7m
         qaxfahAeuYg6Px+Gia+ML2nSRa+BWCnMwn9HLkMYy15MEeDmEV3FEiugBEDoiiYr1MQd
         K0TWW8JBgvmjeO3+QMANAv7ZzOiTsh5205aFqeWBLNJhXMYCN7F9BqTz6aiWCDLEs2ux
         FwojAfsuZiSBi0zNOQasThN9bgyN931y0X5zSSEbPq+skbcu/vgCRysFK0AiSv6gTPZ1
         dw9w==
X-Gm-Message-State: AOJu0Yy1n86gfSBy7tXXmSZ0qnmAcqn//NkeXXaduydFZr745leijUm6
	41NKJURaibuF4klsOYVJatKUEB68
X-Google-Smtp-Source: AGHT+IFwpyrpKzi1DxGwgDLQ+uExtNc5bh9SEaiArJ7YpDFiqNNM0/Vx5p9bNsUT7cj8zRyK7xSclA==
X-Received: by 2002:a17:906:8a49:b0:9ae:5202:e611 with SMTP id gx9-20020a1709068a4900b009ae5202e611mr20408231ejc.14.1697118363199;
        Thu, 12 Oct 2023 06:46:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr. [176.131.211.232])
        by smtp.gmail.com with ESMTPSA id h24-20020a1709063b5800b009b285351817sm11155765ejf.116.2023.10.12.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:46:02 -0700 (PDT)
Message-ID: <dc65e5ae-42b0-db23-4d1d-1dc58275e2e3@linaro.org>
Date: Thu, 12 Oct 2023 15:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-13-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012130616.7941-13-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zdvFOW01gguc

On 12/10/23 15:06, Akihiko Odaki wrote:
> This function is no longer used.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/hw/core/cpu.h |  4 ----
>   target/arm/cpu.h      |  6 ------
>   target/ppc/cpu.h      |  1 -
>   target/arm/cpu.c      |  1 -
>   target/arm/gdbstub.c  | 18 ------------------
>   target/ppc/cpu_init.c |  3 ---
>   target/ppc/gdbstub.c  | 10 ----------
>   target/riscv/cpu.c    | 14 --------------
>   8 files changed, 57 deletions(-)

Shouldn't this patch follow "gdbstub: Simplify XML lookup",
before "gdbstub: Infer number of core registers from XML"?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
