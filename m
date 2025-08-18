Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D0CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 16:22:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uo2cM-0003Cg-9J; Mon, 18 Aug 2025 12:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo2cL-0003By-7M
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 12:21:53 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo2cI-0001Lg-FB
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 12:21:52 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e9343256981so1206541276.0
 for <qemu-arm@nongnu.org>; Mon, 18 Aug 2025 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755534107; x=1756138907; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xlBhVuyiDx3sHAwIeScxz0yValA8W/8lvrL85/LjQu8=;
 b=M2P9Dg+7ZLroySTouelnVzFcgo1SmdZPtPhXJR76AF9tGmqROtpM5GnW1UXDFOdYcG
 wc4rfAB7xykAcGP4HS2qYxVrYICSwF6ja6Wxblddz2SxIPlu8Cg4f9I53kHP0FeRhEpW
 EC4TSfErqX1l8NWEXRZ27c5j4Ba0RcuJYCCGx2hTcMa2jAFDJT5rTVzieMuG4RWCzp74
 hyRVRWTflNMKU0gFiMgJZ5q6B5pdICVTQMX5tYFYpMpVybaxD/JRjOdqT0aKnsgv//cQ
 Na4uq9mORH8+ET7TDxl50rA1PAWY1to1a5exgd/KagauyFOUZ7mtVnlGPLac3EH4WUcx
 Vi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755534107; x=1756138907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlBhVuyiDx3sHAwIeScxz0yValA8W/8lvrL85/LjQu8=;
 b=PYTtvyr85fdRsbgBcynd9s9Ws6Kw8TXz9ywIRqPBdgeJCz+v6g+5I0FKbpFuct7aPt
 o5AZONQyU4KcIpNo4KN0/Vu3Yw6GFuc3XCacrrBbkW9ccbZw7czP3l61g7FoZ8KwFVXH
 /phfoUVKS2uxCFNL1FQCqRbJCQECkGe7gRmfjpo3gATQdhg6GT/qx5pksD+QMJQQD1c1
 nxA/kj+T3oRnIA0Kzjev7Ygmc4YysGtqXByNO+DTX3xDtxKsop0yO5c5DiQPqeDahlGT
 lrt5V+PV8X3QDo4euMlXsJ/j41F/+5q1ZCjdLZaxuHkunHvrP8wBF66rKJyNjWH6WpzP
 W+zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUGEkuF7kuLXClopsrRrV/+168WVehfh/yPdAxxZJERfBr9YxVMTFy8fqKp8ZWny1sDLfeBFWCSQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxq9FuN3MEEhLQPnVGkx+hOwDZ9u4oJ4FsqnLMrM32WehZOqQh+
 uSEb4shfBxZd3zYQlNzR/ZYHz5De2WFv7TQEAQrYMSezsNlUJsXkWssU5tLYiLOi3htPA6a6SHH
 2RKAxxNpoG7ks50j4tN3hvaujjpKSkiPABBZazE5TZQ==
X-Gm-Gg: ASbGnctJ8+RKOYdvEnl9nWAcaTZblEsrWqW5tUBaBlj8YWoCRFChON5ngQFGxIxZfqI
 EjVNJl/MBTfQqjs+gA3OiLcYG22GqIUiqDh4g73LJ+oAcjWZfC7ePP/05DvAi8zEGRJF5ijiaBk
 HCk1MpSDngxjAXMa6iML7fx0mHo1e3o+COyz5Vyu+GJfDaNLYRM5ozS2t4bjTgEZsXFoPWoI+rn
 H8FFbs8
X-Google-Smtp-Source: AGHT+IHnA1uI3SU6DTvJOhMFmpFk1QtysuhMzAccLMgPr14MSFtk3h0tHK7zXlgymAA2O+F1P/5jMoCI4AkWTyDvz0M=
X-Received: by 2002:a05:6902:3307:b0:e93:3d61:d5b with SMTP id
 3f1490d57ef6-e94e3a7ab92mr216663276.9.1755534107312; Mon, 18 Aug 2025
 09:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250807-nvdimm_arm64_virt-v2-1-b8054578bea8@linaro.org>
In-Reply-To: <20250807-nvdimm_arm64_virt-v2-1-b8054578bea8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2025 17:21:35 +0100
X-Gm-Features: Ac12FXwJP8K75WHUagGLprZ25owK05tXR_AvlNNdKwtxlouS53vCCBKmw8-vGwo
Message-ID: <CAFEAcA97c9XT17T=e_=O_8SRdfdmAOQM1Nv825-cLyMOxkB-1A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add static NVDIMMs in device tree
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Gustavo Romero <gustavo.romero@linaro.org>, jonathan.cameron@huawei.com,
 philmd@linaro.org, 
 shameerali.kolothum.thodi@huawei.com, hsiangkao@linux.alibaba.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 7 Aug 2025 at 11:14, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> NVDIMM is used for fast rootfs with EROFS, for example by kata
> containers. To allow booting with static NVDIMM memory, add them to the
> device tree in arm virt machine.
>
> This allows users to boot directly with nvdimm memory devices without
> having to rely on ACPI and hotplug.
>
> Verified to work with command invocation:
>
> ./qemu-system-aarch64 \
>   -M virt,nvdimm=on \
>   -cpu cortex-a57 \
>   -m 4G,slots=2,maxmem=8G \
>   -object memory-backend-file,id=mem1,share=on,mem-path=/tmp/nvdimm,size=4G,readonly=off \
>   -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off \
>   -drive file=./debian-12-nocloud-arm64-commited.qcow2,format=qcow2 \
>   -kernel ./vmlinuz-6.1.0-13-arm64 \
>   -append "root=/dev/vda1 console=ttyAMA0,115200 acpi=off"
>   -initrd ./initrd.img-6.1.0-13-arm64 \
>   -nographic \
>   -serial mon:stdio
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> Changes in v2:
> - Reduce ret value lines in fdt_add_pmem_node() (thanks Jonathan Cameron!)
> - Link to v1: https://lore.kernel.org/qemu-devel/20250730-nvdimm_arm64_virt-v1-1-f843596ab995@linaro.org
> ---



Applied to target-arm.next, thanks.

-- PMM

