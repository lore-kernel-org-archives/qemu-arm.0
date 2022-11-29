Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp548681ejx;
        Tue, 29 Nov 2022 09:49:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ke1bH5wXFLyOLntbcXhHtYy0lUmAf24jgBGPIUiM0WpJ4yeSNdSu820SPZIXNGgSqhj2K
X-Received: by 2002:a37:dc82:0:b0:6ee:80b5:32d3 with SMTP id v124-20020a37dc82000000b006ee80b532d3mr52190754qki.237.1669744197803;
        Tue, 29 Nov 2022 09:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669744197; cv=none;
        d=google.com; s=arc-20160816;
        b=fn75acT7boAHXm7pTGERc32gWgcYdkCO0YxQ/1ZTwnULehU8IlihmUiluhjnABesXU
         nCEUNGjjomXdv9SMP4qUco+bkX9XXHWiw1+fmI94hcIKPibGDCTozcf2Ipd5vDAMn0+b
         hvHYOsy8Qnb8CjWI58q5i8gw0iocvG7ytGN3pjecYtgwgJs5a5kByljD/wrW1401SVeA
         zKXyYUEekpaX8Fh7VW97Fg+cQyXlE6OuNi4I73f4/crTEh46+aRYVcK0UOuZkog6TwN7
         iV1gx5rv1gGOGaGhgClEBhFvq8UEn3qmjWLSfbsNbn1k2S6I50UURRucQzxfqkL2vIEs
         gQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5k7VTBT2vf6sHA5398chNOluBdFuuQn0BEfIFP+YJgA=;
        b=KXbKrPsk4woOTD+jooRGUQQ6WpOc93pgzgrK/nK67WQoOwSuq13F6NvVpi25Mlp0UF
         1i7Vtkw3Stzc8LZ8UG219y2Y6X9yX01Je0k/LUzKSGfTP+Ls21t0xvp9ZamYDS4PeQ8X
         cGnV97ftvbv86Sy7qiM7xfaSGTdccHObxIuF11wXZ3o+0lghFqQp37IXUIdadho6H7Un
         79kGO51Qjrzn2bY3clTWcTkoimrQDvGh0nu5UVD1WYGUB1Lxwf7VgZWpX2RrM+BqEA7S
         w+olOlV9Eaf6Bl5XWvWyxmDSg2Zz/hZCRnh0ipPA5pqyam1acseSc8Znjymr+G2FpB54
         ZtoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiyIKNYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23-20020ac85217000000b003a654cb8deasi8228141qtn.392.2022.11.29.09.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Nov 2022 09:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiyIKNYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p04jV-00049f-QV; Tue, 29 Nov 2022 12:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p04jI-00044q-WC
 for qemu-arm@nongnu.org; Tue, 29 Nov 2022 12:49:20 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p04j8-00019e-HX
 for qemu-arm@nongnu.org; Tue, 29 Nov 2022 12:49:05 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 4so14180121pli.0
 for <qemu-arm@nongnu.org>; Tue, 29 Nov 2022 09:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5k7VTBT2vf6sHA5398chNOluBdFuuQn0BEfIFP+YJgA=;
 b=KiyIKNYKUp3X0KBxo1EoA65OicqYBxj+rpc2SFu0b2bNdVYPus5nIaJVu9j6NrvJSa
 XOII4T22H/6L7Fdv/qMflS0AHKUwd6A4FhOThP6Q9DTt6EbZAwqtYu6r4hF+k0M848Eg
 OtDoh+MDyc1K32hUjxlH/FFs1JcQ+T6rrFwcBZDYCSMay5mNRbjidBxqs4wQ8xRBrPQA
 KOJ2hjNsnXV51Za0S4g48gyGBBTv0Z5B5TKkMu3KJnWxgCcpIq9ARCFGiAmNhLCfR/+U
 scmkOVC0935d+EacpL/NtX/Dv8up1Vr1W8XJ6wnnacuk1I66e+IuGjezB3mf9sKegyvB
 /dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5k7VTBT2vf6sHA5398chNOluBdFuuQn0BEfIFP+YJgA=;
 b=G4UDgwNhp+eivQzPYks+QUXNeGfm9hAl0DlKdLRmxTK3aNqoozq49qkGAUng6P64p5
 ht9Ev2IxX1wgqEAx9nI4nvi4jq4LsrVtHqyZIbo0HXGtTCn48/AhHilL83XwJe8pE21f
 YSHqFsJbdT82cItIp7l0iP7AaWii0tIslWg07I///+eXY1VNi1nR2doj3+mNx/aDjaoc
 Wy9fiEt7hUQdLEIYd0x5uUlAXL+1epSOBDts1irZuiCRwKRzO0Iv5r6Ra8ds3rjLWSvw
 Njv3uNqHH+3YZgzW1uX6BQtFxO5HG0wWApQAnGMwRyiAVY1BvGirU6RpsUNJs3vzpHoX
 VBUQ==
X-Gm-Message-State: ANoB5plffzSzdV8pDyH7SUaGni6F7oJ3OHwx2tvt/3Gh054MEd7xuP8r
 DSLeb+Ior6QfS03a8EhbpssDMxoK9XVBsX2K8ejFVQ==
X-Received: by 2002:a17:902:b691:b0:188:5240:50ec with SMTP id
 c17-20020a170902b69100b00188524050ecmr38472222pls.168.1669744139419; Tue, 29
 Nov 2022 09:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20221129160724.75667-1-schspa@gmail.com>
In-Reply-To: <20221129160724.75667-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2022 17:48:48 +0000
Message-ID: <CAFEAcA8mH8ZuyRvCAbgDCK_Rr7=SFXLSxgsc_ATOjo9XRnBOMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] hw/arm/boot: set initrd with #address-cells type
 in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: //P/qftJiS2L

On Tue, 29 Nov 2022 at 16:07, Schspa Shi <schspa@gmail.com> wrote:
>
> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] initrd not fully accessible via the linear mapping -- please check your bootloader ...
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_memblock_init+0x158/0x244
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.1.0-rc3-13250-g30a0b95b1335-dirty #28
> [    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : arm64_memblock_init+0x158/0x244
> [    0.000000] lr : arm64_memblock_init+0x158/0x244
> [    0.000000] sp : ffff800009273df0
> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 0000800000000000
> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff800008b46000
> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff800008a53000
> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000ffff1020
> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616d207261
> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 0000000000000000
> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e20647274696e69
> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff800009273a88
> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 0000000000000056
> [    0.000000] Call trace:
> [    0.000000]  arm64_memblock_init+0x158/0x244
> [    0.000000]  setup_arch+0x164/0x1cc
> [    0.000000]  start_kernel+0x94/0x4ac
> [    0.000000]  __primary_switched+0xb4/0xbc
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>
> To fix it, we can change it to #[address/size]-cells type.
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>

Thanks for the respin; I've applied this version to my
target-arm-for-8.0 branch.

-- PMM
