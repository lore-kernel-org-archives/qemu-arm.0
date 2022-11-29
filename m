Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp390185ejx;
        Tue, 29 Nov 2022 06:49:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KLRpB/zN3jmjftRgfCDIbc3HpmSdT5/SWaAUcqxCmuQ9nmnLZS57aLJ0Ofwp8YdGhAddU
X-Received: by 2002:a37:9587:0:b0:6cf:7dda:5d74 with SMTP id x129-20020a379587000000b006cf7dda5d74mr49335307qkd.640.1669733374654;
        Tue, 29 Nov 2022 06:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669733374; cv=none;
        d=google.com; s=arc-20160816;
        b=nQeh/nOpnRtRoYwFbfCL9b8XI1Enpzum6Q6tQIoVJYRjHuli+skRiLnONRMXZUKPKD
         qS/pK3X3eYMTS37nSI2/eWAG9gq+NsEMeQRsyVw2mcwgEhIG6szImDdo+ntAE9J7SjyN
         FDMMX6qp1n4fIWBputngb9r9qGAjvYyVzYgSTD4rV6Ep5Ygt0xs/YL/PGGTlaqDRtAlZ
         ngjFauwyYVDYrGg7Wy1dXW3gLQxgIWBCSCXa2bf3mYEjXPUplsBE2klTy+aTCBYxh2yz
         lXJX/RQ4eTZqKU4RZkl0uCs2JGDxG7h0aOcJgaWWuAAjWIfIk3OTrvJ0SrXcWBPXEe5E
         AZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=f4LVW1HhglgqGkPs+655xsfLtbysyYg7JZJML5/UigE=;
        b=hhniyLSQcQ6GDc0T+PLOZ8L3DnNDg5jlafk0oyvQ6sGgoRdemZ2CGf3Bw+yCE74t+t
         p4lKZn4X1nAAiv0MW1ZdjHiITufvKaIiA1oW9Wn7IGco0scIxuk8krAIjyZRU6aPWVJF
         BH1ZCF9pLPmJ57Qdspbm7ajQ7ZG1CwqPEpG5FtngTO2L+CvcEwhfddbW4cmX/GnwuOIp
         7F+H/RKcClNu34ZcuTkPR2WtSpPdXbrTCGWyNrROJ9/8UIVn7EUhkIoZvlJhqbZApQ8Z
         kR99WVNU5ad8wqcHX91wS66Crg5KaDkVhZtb332Ddru9+Z8q+VeYChhNV4UalPLQHkSH
         4I2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h5/TrH2K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a281200b006fa30178ed7si8784868qkp.625.2022.11.29.06.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Nov 2022 06:49:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h5/TrH2K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p01v2-0002Cp-Jx; Tue, 29 Nov 2022 09:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p01uy-0002C0-FW
 for qemu-arm@nongnu.org; Tue, 29 Nov 2022 09:49:05 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p01uv-0002ee-9P
 for qemu-arm@nongnu.org; Tue, 29 Nov 2022 09:49:04 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g10so13610150plo.11
 for <qemu-arm@nongnu.org>; Tue, 29 Nov 2022 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f4LVW1HhglgqGkPs+655xsfLtbysyYg7JZJML5/UigE=;
 b=h5/TrH2KN1+wFD2kUtpN50NYTv1oSnXSU8cvuw4c1JMwAIa4lc8p/zMP8qdWH2HFz0
 1Tri2l9ZX0vBGgPPr1HgIw3lJidaSl4uLOeMQ2LPrk8DW8FYl3xN/lox2YWmYgyHXUkQ
 nr2DwkprvwlUZwetibcxUeg6HreCj8Nw1+61krWXqV+J8cbIMfda0iZ3MlZfHB/fUxn/
 4mt8K3e4A8cNdNPEA6L7VnqusG0P+OjXardxvWWiXtdcxZh5YKCw57BfFRKu9oEuxVNG
 IaLmiSS1MBWqLcs3FLvreLS8PeU796ypTRx3TY5a4FpSy9YH6wlgmdDkmRkYjMtFC2bj
 yyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4LVW1HhglgqGkPs+655xsfLtbysyYg7JZJML5/UigE=;
 b=Oa+3U6R10INAInDexIV1lFxRi/2NVV5b4O3te2IkfIIqmAsXXbITKnRBISfF7sAaft
 GGgbH0B+3iCKHT31qYLJsYoHlvm6+Nsytf48ZdGmH10vOTF677/1BrDuBC3MKwZaUyb3
 ngEAb03p/UkgGk14ewPyMvV+ALFDKsaw0gcT/gcut+DD9IVmSDw84csM32ZpaFZw+pcg
 QV1Fi87f4OWiV7WFBewYV8r+te7GbXxMVnYF9tB4kF9G1DuwHCFQ3lJZ1GQgiRKnmRwA
 a+prn9kGG/vh591QLY5oVoCO8YRME62hFppEcQAUOU9q1cbtASPuAXjuW+xrLE+Ra2bB
 kuXg==
X-Gm-Message-State: ANoB5pmA+SMXw+c65R9tMAv6gxY4/j8t9ejWCZUL/y+rjWgtLDsgZ6tq
 vPCJh712l8C/bD6fQRSzk/863A/F94g0hywfXfbeNw==
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr7539641plc.19.1669733338480; Tue, 29
 Nov 2022 06:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20221129104809.84860-1-schspa@gmail.com>
In-Reply-To: <20221129104809.84860-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2022 14:48:47 +0000
Message-ID: <CAFEAcA-nznyaoxw-Ok1mY7sxFRXE0=JKtLH4unrYDK3Bv4w_9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/arm/boot: set initrd with #[address/size]-cells
 type in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 4cCU3LzBOA3m

On Tue, 29 Nov 2022 at 10:48, Schspa Shi <schspa@gmail.com> wrote:
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
>
> --
>
> Changelog:
> v1 -> v2:
>         - Use #[address/size]-cells for data type.
> ---
>  hw/arm/boot.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee419..98cd1fdad2c6 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -638,15 +638,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>
>      if (binfo->initrd_size) {
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
> -                                   binfo->initrd_start);
> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
> +                                     acells, binfo->initrd_start);

Indentation here doesn't look quite right.

>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>              goto fail;
>          }
>
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> -                                   binfo->initrd_start + binfo->initrd_size);
> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
> +                                          scells,
> +                                          binfo->initrd_start +
> +                                          binfo->initrd_size);

This should use 'acells', not 'scells', because it's an address,
not a size.

thanks
-- PMM
