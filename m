Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1097075lfg;
        Fri, 20 Aug 2021 01:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhFfRW3ivXNqK8B/gsvwAJjN7WvbkG5Od9KRTlIRi4OotY9LSQ8OQdj03wkvV0hzGSzvFX
X-Received: by 2002:a6b:8d8a:: with SMTP id p132mr14970270iod.81.1629449603763;
        Fri, 20 Aug 2021 01:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629449603; cv=none;
        d=google.com; s=arc-20160816;
        b=jeoWP7IyE+8oECmqnkYgWd3VSgY0EWuBk7nxriMwAvbFpXTzqCutI3+u4++iOcUzda
         dkUIhQeIG46iHen0/1+QeP6rjOMD6eIywgb7BgWkRatYszTGe09iMt2bhR8tEe4pF3wE
         W2e8YUNClhuHh98a4A3bCTd+kg+3+5+KILwswF7+/hjGTUCNDMEpX5jRfxLCAAZV0pxy
         01B1qoWtL1LZAdrmoL4ZE0IvPsYffMcIiGOK+94Dmd/eP6iRPHs2kC+ZCYAYjIK1Q3kF
         OZyDM4leIJV8YzPrWyNHoDkPUr+I/jCZBqqquAw5rfL4xyl6wuWYwD1epklvXHkA9t0a
         zMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fOfjJl9UR+NsoS8tEvtVVkjolcJkT2AxrxuOF5cKDPE=;
        b=CuFYKB0nzR7AuLXJFxGTU+OFXvYzP/4Boydvd9mvUKZHnZ/Y4HUpQVh7Fr+UqrJ7ff
         fjm2zA7cch4j14nybvUExKcyMUinMV9eIToH4texosVuBqW8rt3fnyhbBMHk9vl7ObmB
         +qgMB6QZEEqFEF1zoAXzkpJPH7GG0cTUeLmtw3ofHCVcam8zsbfCEDOJIB1ejYZ0SB98
         O9B1Lr3xioULh//eACZe/NqyhLYeNDhH/vnCrnvEETC2RPNaDdRg8u6v4P/Vjdc5loYI
         oTsq+C0H0MTShvbXGHk1OKpHIaPydnrOGlIyJtOhQTEiaET/LxqTxHeUP2ratqLoNyWW
         JqEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SFnvmTy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si7609619ilj.10.2021.08.20.01.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 01:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SFnvmTy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH0HD-0004eQ-24
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 04:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0H0-0004eI-GX
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 04:53:10 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0Gx-0006uL-HD
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 04:53:10 -0400
Received: by mail-ej1-x635.google.com with SMTP id z20so18686781ejf.5
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fOfjJl9UR+NsoS8tEvtVVkjolcJkT2AxrxuOF5cKDPE=;
 b=SFnvmTy+CuZvHry64qeYCe/E5/wvJ2OOlBhSQjx0dO6QsP9DWVmZMQMo+Peqsybo3b
 j902+Ilg3PM+qwp4f3LARUN3/6ufFtm3mM9CT7S/vTVpwna8bv9IzgIB0Bq3mDovVNzw
 ebH1WiEayENEE+iR5su03Aqx9sJ8w5U9N6bnDpugXzcAX3sLiA3i9LLLD6b9IEMl2JMI
 gUGZj6MOELGC8kjx17nMVavBszksu08AGFrkY17LHI6X2wNHAL3URBAnoXqYpdetk9RV
 l7IPY8a1bJ8jCrsDE/BgNsb81DS0LL/x+UWXGbAT9PI6VZQIJTT/d7+TkIoxf4TAzhE7
 7b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fOfjJl9UR+NsoS8tEvtVVkjolcJkT2AxrxuOF5cKDPE=;
 b=LEyYV7xO1tvj2UKVqigSBPhbFNB032vQ/6Dfe+rMNnJRy9UOGpQmdE73OEZ5pfxhKI
 L4cVorexSf1/vLHii7SsO9UlpiqmNCrMNBGrorwHtNw+9j1ayYz3J7DqrNxGe70BMM0V
 UcA20zjLNvnuBEzqewRB26JGarn73vJ+/hSN0JuwaspqvdpFxaJyljrwnAxBqKJxnzqT
 9r4c1mUaEEnnubMQyEQ1/v/5P8RTsLEF3+s9YVw8gb71RjYr6tvNa9gNLyTXIENhOnFH
 qMC6Q/43o5K0WhNuWtgcQzsG8IPyhQz0MiVHD6GgdNsv22yR6a0aFVUKe+q3M8zik9vg
 p8xA==
X-Gm-Message-State: AOAM533CnrQxhyMEtkTy4aWzbCpE8hzhMuXCf0EnXY5G9LMgcUrAWf/o
 RUei/SZri9beFQz47rP1eTstQdbQrUlmBrJ9BzexSw==
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr20739015ejf.85.1629449585905; 
 Fri, 20 Aug 2021 01:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 09:52:19 +0100
Message-ID: <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Idu6qrF2M1Ag

On Fri, 20 Aug 2021 at 03:36, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
>
> The current SMMU V3 device model only support PCI/PCIe devices,
> so we update it to support non-PCI/PCIe devices.
>
>     hw/arm/smmuv3:
>         . Create IOMMU memory regions for non-PCI/PCIe devices based on their SID
>         . Add sid-map property to store non-PCI/PCIe devices SID
>         . Update implementation of CFGI commands based on device SID
>     hw/arm/smmu-common:
>         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting strategy
>     hw/arm/virt:
>         . Add PL330 DMA controller and connect with SMMUv3 for testing
>         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting

Please don't try to do all these things in one big patch --
put together a patchseries with several smaller patches,
each of which does one self-contained thing.


> Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
> ---
> This patch depends on PL330 memory region connection patch:
> https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com/

If you have a patch that depends on another, it's usually better to
send them as a patchseries. I was wondering what the reason for
that PL330 patch was...

thanks
-- PMM
