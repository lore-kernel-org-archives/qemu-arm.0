Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp1211857ejb;
        Tue, 11 Jun 2024 05:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWatQ6XeNrKH0oyvDEDg2vqwsVAe0NInw+8p2RcBj0CRXq47RM6aGMEYHpZG0aC+33bg6M3yszuRDod7iOnRTD43O6Srbl/
X-Google-Smtp-Source: AGHT+IF60Hb/oZBZZWLABlNbhtyAABYKigMgtLcOubryN83o4Ap4g6xHd9kID2ns4y4zJ4NPlXnl
X-Received: by 2002:ac8:7c46:0:b0:43a:f949:85b9 with SMTP id d75a77b69052e-44041c7bfe6mr163932771cf.32.1718108216361;
        Tue, 11 Jun 2024 05:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718108216; cv=none;
        d=google.com; s=arc-20160816;
        b=XK0VDDz0ve++zQJtK5PTUuiZ2XhfLrI0bQjPbv74UE2WitpjRjGwLUxCLidMgCoemZ
         xdBsCjuTDlQ3UYEi5wh1EtS+mYc0b3mz7yUUkb76QIxyfV2/qQpmljOJG7lt4hR/KXg/
         CysOD8/EniR8aZ6QdFuAa2Jci+pgx7mrcn69SqM9mhAJWr6Q2oZsDx0+J/zlZKuis8pJ
         Pr4Hd8qvv6MUCu7RFMSy9w/Qzeq9qcFMag+NxTbJZ+Mq3yOSku+43CxOIrzdehCAEEs2
         UFYRJln9UOpq/0mZqTK5u+rAO8MfRgL2m3drewP0NJ9DgaDCMgJd7slpHwtbbkilWOW7
         NcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tllHxYXax42Ye0XAHXR2DWbO6bUPcY7cyXxcmp3Rr18=;
        fh=a9O7fhwuS87/66jvRAXjHtWWbMh6BJJopPqpcOtC6WY=;
        b=nOG3egg7GDIZRFTGiKoDVci65seua6AAAKsYVs/dHTGjv2PrJoYgN77dXCGMf3Jpc1
         OpKuCP+1pP/Diq586ewVSA/FQmqSroCHozmixLVZuDgFlojSQiYA8PgfCyUp7SJpj1oc
         equ2XzlcdJm85XmPI2vW7kelJVaSBNRtwBP1pIsGWjbhR3Q1FxHwNefLliNt65dlkME1
         vi07iDeFFPfEjXOBO9sTnTwR+DJXcRZdUpDED5ZaTqn0NqE+muuRt7h0LKeWvIBJC2Dp
         a2ohniFat0P8yMmEeMYvWTujAJQJuUso/T6Bva41k8g7Cw0c8k8MoJyZDPCjPAvv5QGw
         mARg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XYf/kBxB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44120fd23e1si27216701cf.13.2024.06.11.05.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2024 05:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XYf/kBxB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sH0Ql-0006EH-6r; Tue, 11 Jun 2024 08:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sH0QT-00069q-GU
 for qemu-arm@nongnu.org; Tue, 11 Jun 2024 08:16:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sH0QR-00061I-In
 for qemu-arm@nongnu.org; Tue, 11 Jun 2024 08:16:33 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso1700972a12.1
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2024 05:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718108187; x=1718712987; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tllHxYXax42Ye0XAHXR2DWbO6bUPcY7cyXxcmp3Rr18=;
 b=XYf/kBxB+7sAIb0Kn5d9ipzVFcQtgimmGP7Wqhn460aK113Q+o4IyGAyfpUkWQX4Dx
 ivC3i1b7yqj3IGwvS3aWbZ/z6JLu7S2miceMmUqJR87vPQerAq/51BnJ5hUfEkn3HFot
 G/BtK4vSs7b87TZ71bDk+wKAzVBhoBmuBa+D2PzxT1ChlMd7YomxEMCQnduAu6bUpBD0
 Tvt5298V+LAZhZdH/xeX7q3hUBQtFY1toBBSrwzruY0OG0Z3fJRYsboZQ+CMSYRK/9c6
 UQwL93JKqxUwgJlZ2gipXwRrluH6ccUcTu7er9mXvZ/6wyAAyNCqYS+diHN4QEKbGrxq
 K1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718108187; x=1718712987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tllHxYXax42Ye0XAHXR2DWbO6bUPcY7cyXxcmp3Rr18=;
 b=Fv9G8Z5MtPfG4C07NnaqvdlZbr6EJ/qy8S6fNnmZ38v7p65KjGVoXktGqmScW9KWBH
 /YAMuqDcHE3ExVX4Wbnd5gCMdgnoWtWJ3NpyrNuXHUAPlHtZBg5/l8B5g8ScGRtCocY5
 viRSBA31XGbMWDQJH7UgFERu56RYAeKb6cCThaBnS3bM/nx6mQ4Y7FkaIhcJ3hhmifBU
 shQaiHCrmYlb9ozqcYj2myI+LuNjp/Igg9qAPsIwpoGf7NlSuw1o3q/DMU0+MROTfqlK
 gtKDcNqqr498f2yBn4dT62iy4IN9ChPVuYKWcoEHndL6sJ+Cve+lh5QRJhM6AapD+jGY
 pbNQ==
X-Gm-Message-State: AOJu0YwW+bFAi1Mxqck4i1qlkoq/43BVp6SHsk719gEF1bcFn/R/aAyw
 kEm6zpTJNOwUVKsIkWcJcqMHnqSVF/AoA2KcOglm/PY7/rJFywPsTUoU4YmCNanDyGiXZLHXvSQ
 AJDzUihxuRRVcFd1jQnFIaObNIsfIv9fwk1UIVU9AQwWluE7K
X-Received: by 2002:a50:9344:0:b0:579:cd1c:8d69 with SMTP id
 4fb4d7f45d1cf-57c90a18932mr1601087a12.2.1718108187483; Tue, 11 Jun 2024
 05:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240611121222.305185-1-zhenyzha@redhat.com>
In-Reply-To: <20240611121222.305185-1-zhenyzha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jun 2024 13:16:15 +0100
Message-ID: <CAFEAcA8gK0neoaQPu8j0pUZrcU7MsaCj=R6hPwtktVHNH8Qjrw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Zhenyu Zhang <zhenyzha@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robin.murphy@arm.com, 
 Jonathan.Cameron@huawei.com, gshan@redhat.com, eauger@redhat.com, 
 sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com, shahuang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: DWXqR05ocjnk

On Tue, 11 Jun 2024 at 13:12, Zhenyu Zhang <zhenyzha@redhat.com> wrote:
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
> through 'dma-coherent' property in their device-tree nodes or parent nodes.
>
> Fix the issue by adding 'dma-coherent' property to the device-tree root
> node, meaning all devices are capable of DMA coherent by default.
>
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3c93c0c0a6..0680b792bc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -270,6 +270,7 @@ static void create_fdt(VirtMachineState *vms)
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>      qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");

We should have a comment explaining why we do this:

   /*
    * For QEMU, all DMA is coherent. Advertising this in the root node
    * has two benefits:
    *  - it avoids potential bugs where we forget to mark a DMA
    *    capable device as being dma-coherent
    *  - it avoids spurious warnings from the Linux kernel about
    *    devices which can't do DMA at all
    */

> +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);
>
>      /* /chosen must exist for load_dtb to fill in necessary properties later */
>      qemu_fdt_add_subnode(fdt, "/chosen");

thanks
-- PMM
