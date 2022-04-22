Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp118920lfk;
        Thu, 21 Apr 2022 19:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAP5ldpTWHuUB4OESV4fhwP6Ni+x/YnHoYlxkuwrKKSV/rvAy04guh0GuD270gRPEpjY6K
X-Received: by 2002:ad4:5ba9:0:b0:44e:21eb:c02c with SMTP id 9-20020ad45ba9000000b0044e21ebc02cmr1727261qvq.121.1650593298111;
        Thu, 21 Apr 2022 19:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650593298; cv=none;
        d=google.com; s=arc-20160816;
        b=qGy/cgXfBghg92Bqwd30pD0rkhiNt4Arw2XTS0T3+zNA+Tlf/w7PlIS1Mv1ygpLte0
         zKpGoviqP4zTwE/iaPuPN55uFSKRu1mBdEFamYRK7yFJFR+EwsjoczlWrfw+6xZqPKx8
         Mhk7k2GflOuxJfFCmBoH1uoYuDRGYVZGagkG6JvRszwuxOOcWc/qJrdrdJ6sE3y9i7eU
         RY1p3xFkbQG0c/aAoFPYoEIrg/DLAlwLEQw4iQvn4xzrowqGsDJeA5b0ewAGAYvXAZZ9
         Zx5WUtmzRNsIRq1viAg2Q+L7Lvrak59T8ug8JvPuYuZNGr+ba8I/dqMs1rtuSqj9sxgE
         OObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csrfyuv8B+sLo0NtBnzWmwaz1IBy+/r3kktNgQP93wA=;
        b=al4YQWahCOY1wyF3FP4TE6DB137rba/6jd6a9RdyI30RrifLt3iLb3YBt1684vVUuA
         tHZs8/0YbrmP0HKHVjAx4jeX6gyH9sxx7BQ7n/SP2ERrNZtEhi/CBRl06sDXLnSjmKkW
         FjY/Fx+4NsjkqCO9szOir3zgRy6S15/tFZntW9xlzM2yXFKxQGq09RzqGpYQR8Flrdak
         wLaPtXUbiCG1gwzpsuov80wTyXPQic1xH91Em/bg2XGpdKke1j3Z2vUcPFDzb7tMkeAt
         FzLk2NoZ2oypIgMD5zwM4spYLQ+E8t3B45QQ8z9Kkg/k2Mz8R29HGTgnd0k6bkaYZl0s
         NwrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=p4HyP6o5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05620a121700b0069e9f88b88dsi1760635qkj.97.2022.04.21.19.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 19:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=p4HyP6o5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhiiX-0005bN-M7
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 22:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhiha-0004nn-MQ; Thu, 21 Apr 2022 22:07:18 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhihZ-0000mH-5p; Thu, 21 Apr 2022 22:07:18 -0400
Received: by mail-yb1-xb31.google.com with SMTP id f38so11972842ybi.3;
 Thu, 21 Apr 2022 19:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csrfyuv8B+sLo0NtBnzWmwaz1IBy+/r3kktNgQP93wA=;
 b=p4HyP6o5umf0pRvtpVvUYkLSJHx+iwZhDwuX/gosszlvErz17nVCYhfHhJ/RKZCfbL
 EqSUwhb5sLJn41uj5LCDOlbpi2CAVyhMsZd8qxD5kfVBQR6ryP3lHAcBatZMDhhaQ60/
 FZ158CL3nI5vHTL39BwmYaLaw7GXg05V1v8LHZQ8/cJ+kJVhjF+FWH8nqoE9L+I7/OVa
 evF0ILQotkC07eAKR7lm/XETJOuee31qbqTDZiZBRv705Lq8ILvBQlYSGs7qEK7Z7eCE
 FFYoKuY6JF8wEQlJUmQuKfNlHQiy+UCK0oOPnluqAuLCITaaULVvXa9T2cGOHlFcjoic
 UBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csrfyuv8B+sLo0NtBnzWmwaz1IBy+/r3kktNgQP93wA=;
 b=RRIgPFu8kLtC2+X0H3OdYvMReHzs0Z/O6lnqBXBG3DRKsXB1MZJNBO3GT2vQCCHTXL
 3R0+mKi6FabQb+nRQKV4CEleNi5+xJOE4nUpgPHkecTCkFkhbexzMC5RRhae8lozwXQ9
 iaNfXdAx8qGITYvVjxedR+6d+dHrRJaj8Cc75kI5EhEBfoTP9UStoQNMKYQ38q43pk/3
 ae2N6GOL2+R8bBoyN5hvEKH5+ibdjOQDJtgjIlNsa92CG9qprvW5pz/urw9L5efbH+wt
 sezbcKT3U4gzcCD25PZcOrcGP5Dc8I0mYHwmRFqG+XG/ChfK7TdBmEOl6Plb2qPN1dQV
 0C9w==
X-Gm-Message-State: AOAM533Kx6ilxpaSrqDX7cidjm08ftgAv/x+dl2bnOD8Ptyos7wACmtE
 hhvTDUOco9XVtbB88u8qdfm5/hvE2GzASpAQiUc=
X-Received: by 2002:a05:6902:532:b0:644:b35d:a27 with SMTP id
 y18-20020a056902053200b00644b35d0a27mr2374066ybs.579.1650593235188; Thu, 21
 Apr 2022 19:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-6-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-6-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:07:03 +0800
Message-ID: <CAEUhbmVfvP9F0jxJ5QFqf9npOPZLjgA2p+_cXbJsGcv+VACRBA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] hw/riscv: virt: Add device plug support
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCpVtR4wigW4

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Add support for plugging in devices, this was tested with the TPM
> device.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
