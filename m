Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp164738njc;
        Fri, 21 Jun 2024 06:01:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9mJ5WztjasOzmgJnEXN6QQ7peaKR+iB12u/8zOFJl2vUI2GWn0jYMjeC9w4JRMoWxiLdFJj1rXDrAu6hOPze3Abz7z4j6
X-Google-Smtp-Source: AGHT+IFEO3rADw4GMUY+dKn23oPK8Ru0BTs+Len1vODnbLRrj+v4RxfxH4yLgJE+mapHtinU/gV7
X-Received: by 2002:a05:6102:32d6:b0:48c:4186:a41 with SMTP id ada2fe7eead31-48f130cfcebmr10194718137.30.1718974904321;
        Fri, 21 Jun 2024 06:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718974904; cv=none;
        d=google.com; s=arc-20160816;
        b=abmlYbgSJxZReJL6riMbCuXa5i13qxrf9Lw1UrN2ZvUo8Qzit/IBSEgpdLqOE9fyH+
         utBRuC/qGT9dWBWJ6wBU4vZmpgQ9dxq9JFZABO6RXjpg9jErXucCXhfeqmY6EEBxmLFL
         SfKcmIEZNB5eO7vTFeWUQHcmHkn1DdWCdwaS5VPrEA48U9r5GyL2Uk1la7sZYF5hUlY+
         GlXm6o+SfYOzZhD/G3tFOyYAWudsgAKUrxYPkY5dw+5xoe5DRwGi1W0JVSX5aAUiZO12
         P2omGWk7ShuL1SZK19XQEy1Fmq3EEDfGjmAvt4gNCPLCuNkTnt4iGKQ27d87tXgSnfVC
         54EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nAm0w/vBnIFnVOlRKiX2SvcAx5FlPkkpDJkrLOaHGbo=;
        fh=a9O7fhwuS87/66jvRAXjHtWWbMh6BJJopPqpcOtC6WY=;
        b=E5msCrvCjprp+pb4pxIgjR0OomqbMoPCH1sjNi0li0Hw4xBG0UI518bIDs7TcCML9A
         dzVpw7yvYzVgdwH8nlrX+7UD2esLGbPji5EA2Xnp54rA5EmSsvBjZkfuvCbMchGybote
         LW5lNelnyrVqWw6xRqQBTcnnZm2R/JapdBqCyqqEDTnSEjpIpBxCNnqnfDaFg7s/Kvjk
         DkQOaMqNh14p2d07WAbHfwfm6XVedeMNSCVtp+gkM8HmrZmGwCNYyRFmD1j38z5tKDQI
         aVzE0p16rLpKvIQjmE4ExshXoXMX3oZ4J24Umh/zkObMMw4Q+V2xoHFyvj+mIPjFvpf/
         N4Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwMn55vG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f40ed644fsi70445137.665.2024.06.21.06.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 06:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwMn55vG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKdtX-0005Sb-I7; Fri, 21 Jun 2024 09:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKdtO-0005Cq-0P
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 09:01:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKdtL-0001o2-NZ
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 09:01:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57d20d89748so2000018a12.0
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718974881; x=1719579681; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nAm0w/vBnIFnVOlRKiX2SvcAx5FlPkkpDJkrLOaHGbo=;
 b=fwMn55vGIW21YVJJD79Zsb9vs7vdAlV+LB1ea086xVe+XVFCst3r9be2p5UQRhGoVV
 DgOdP/wdxeRrOkwtw0gYrx3S4BJQDd8mD4Pt6VdQdjtWCJqLBpYM9zkUomxXEmiVV/jd
 QeXPUjNWEkRCswsH/afWzBska5+sdsF1juYh5YuuyPADG5hzwXvUp3k764Zrvn+9A/TG
 XgCkhXG0QmEMKkixZDBR/U3z5AykRe8zo1g8J709Fp5x6Kvx2LGGrweMhSc6Mg6uaNLL
 bCVoraLiMqOv/yPO7+YPraFhkfNE04aTbayk1IxW7EX/jJ9ErIwWwDCTHPwEZYGvtMRx
 MUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718974881; x=1719579681;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAm0w/vBnIFnVOlRKiX2SvcAx5FlPkkpDJkrLOaHGbo=;
 b=Vbzs+qhIZfBbWSLb0i1Zxd1n8zWgmcm0ldRto5CfJ+gJbyKuyNQ9YlOhq9QaWXGq/k
 BEykdoI58zqElvyVoFbyP8VHvl2pEnzQRRHjcq7pHW+CxzDNJw6d4YtVYBl2Dnuip+ny
 wVUtLKDi+OOzx5BtlKVimziM26FwDiLwycm/vr0wQYOmLSFcGQiuzfjMQsEd2Py4Vw1H
 QopC9+uODeF9fAb9MzeIZqOzUOydt4TbQV9JvThRNXrnIeAF2b82jO+Y0LUb7KqcRBbc
 XA+HBzB3mjyZxo6yDPQwtCEfw5gOzqPx+v4FKSvojFaV+YC7vhT0JCc/qqK3aTpVYk9s
 Tu9Q==
X-Gm-Message-State: AOJu0Yyz/Cg04D+HSuUCvZsuj/McFrHr1OopIAoHbkZyEwViC/wXEKzQ
 DC2G5uIq80qw5lCO67SlYfnw1xfmAx6iv6mQNDku2sP+r2G/1F8U0ToSrgjm1RyZkczl/eUab0/
 n05wweGZRyUG04FAsO8sc6/y1YreD2usoepOQXw==
X-Received: by 2002:a50:96cf:0:b0:579:cf9d:d6a with SMTP id
 4fb4d7f45d1cf-57d07e858e2mr5061879a12.20.1718974880894; Fri, 21 Jun 2024
 06:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240612020506.307793-1-zhenyzha@redhat.com>
In-Reply-To: <20240612020506.307793-1-zhenyzha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 14:01:10 +0100
Message-ID: <CAFEAcA-1Hm63Ry02aEma_k3GO8RjjGfcuaPuBROUpGXAT07VSw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Zhenyu Zhang <zhenyzha@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robin.murphy@arm.com, 
 Jonathan.Cameron@huawei.com, gshan@redhat.com, eauger@redhat.com, 
 sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com, shahuang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: Qc8d7eXktMYj

On Wed, 12 Jun 2024 at 03:05, Zhenyu Zhang <zhenyzha@redhat.com> wrote:
>
> Multiple warning messages and corresponding backtraces are observed when Linux
> guest is booted on the host with Fujitsu CPUs. One of them is shown as below.
>
> [    0.032443] ------------[ cut here ]------------
> [    0.032446] uart-pl011 9000000.pl011: ARCH_DMA_MINALIGN smaller than
> CTR_EL0.CWG (128 < 256)
> [    0.032454] WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:54
> arch_setup_dma_ops+0xbc/0xcc
> [    0.032470] Modules linked in:
> [    0.032475] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-452.el9.aarch64
> [    0.032481] Hardware name: linux,dummy-virt (DT)
> [    0.032484] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.032490] pc : arch_setup_dma_ops+0xbc/0xcc
> [    0.032496] lr : arch_setup_dma_ops+0xbc/0xcc
> [    0.032501] sp : ffff80008003b860
> [    0.032503] x29: ffff80008003b860 x28: 0000000000000000 x27: ffffaae4b949049c
> [    0.032510] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> [    0.032517] x23: 0000000000000100 x22: 0000000000000000 x21: 0000000000000000
> [    0.032523] x20: 0000000100000000 x19: ffff2f06c02ea400 x18: ffffffffffffffff
> [    0.032529] x17: 00000000208a5f76 x16: 000000006589dbcb x15: ffffaae4ba071c89
> [    0.032535] x14: 0000000000000000 x13: ffffaae4ba071c84 x12: 455f525443206e61
> [    0.032541] x11: 68742072656c6c61 x10: 0000000000000029 x9 : ffffaae4b7d21da4
> [    0.032547] x8 : 0000000000000029 x7 : 4c414e494d5f414d x6 : 0000000000000029
> [    0.032553] x5 : 000000000000000f x4 : ffffaae4b9617a00 x3 : 0000000000000001
> [    0.032558] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff2f06c029be40
> [    0.032564] Call trace:
> [    0.032566]  arch_setup_dma_ops+0xbc/0xcc
> [    0.032572]  of_dma_configure_id+0x138/0x300
> [    0.032591]  amba_dma_configure+0x34/0xc0
> [    0.032600]  really_probe+0x78/0x3dc
> [    0.032614]  __driver_probe_device+0x108/0x160
> [    0.032619]  driver_probe_device+0x44/0x114
> [    0.032624]  __device_attach_driver+0xb8/0x14c
> [    0.032629]  bus_for_each_drv+0x88/0xe4
> [    0.032634]  __device_attach+0xb0/0x1e0
> [    0.032638]  device_initial_probe+0x18/0x20
> [    0.032643]  bus_probe_device+0xa8/0xb0
> [    0.032648]  device_add+0x4b4/0x6c0
> [    0.032652]  amba_device_try_add.part.0+0x48/0x360
> [    0.032657]  amba_device_add+0x104/0x144
> [    0.032662]  of_amba_device_create.isra.0+0x100/0x1c4
> [    0.032666]  of_platform_bus_create+0x294/0x35c
> [    0.032669]  of_platform_populate+0x5c/0x150
> [    0.032672]  of_platform_default_populate_init+0xd0/0xec
> [    0.032697]  do_one_initcall+0x4c/0x2e0
> [    0.032701]  do_initcalls+0x100/0x13c
> [    0.032707]  kernel_init_freeable+0x1c8/0x21c
> [    0.032712]  kernel_init+0x28/0x140
> [    0.032731]  ret_from_fork+0x10/0x20
> [    0.032735] ---[ end trace 0000000000000000 ]---
>
> In Linux, a check is applied to every device which is exposed through
> device-tree node. The warning message is raised when the device isn't
> DMA coherent and the cache line size is larger than ARCH_DMA_MINALIGN
> (128 bytes). The cache line is sorted from CTR_EL0[CWG], which corresponds
> to 256 bytes on the guest CPUs. The DMA coherent capability is claimed
> through 'dma-coherent' in their device-tree nodes or parent nodes.
>
> Fix the issue by adding 'dma-coherent' property to the device-tree root
> node, meaning all devices are capable of DMA coherent by default.
>
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
