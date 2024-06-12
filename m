Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp358620ejc;
        Wed, 12 Jun 2024 05:34:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcuF4DmSX7HDQsLc3fFCnoAruS+n2FLXo1kL2OOMzYAyrhSo0G8tN6n+wy/2vOS/r8tggwNDJumwkQQ/pVVoFUrmUpSD/I
X-Google-Smtp-Source: AGHT+IHRQ98cYq6TJ+ZvU8OXhhJKbhdNaZKEzUOeSAfcCYDYUbUPpmh2xs+V8P5vZVOiTejYkshP
X-Received: by 2002:a05:620a:190c:b0:795:b4ed:9bca with SMTP id af79cd13be357-797f619a4b5mr160680885a.63.1718195641747;
        Wed, 12 Jun 2024 05:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718195641; cv=none;
        d=google.com; s=arc-20160816;
        b=R7y7RRTefCDI6fTZSDi5aw5F0cNo1m2UU/3dJGs7WyIDGMXKgBAvGFWqC3DGx46dZ6
         ksKaF/obKL2I0eUdKsqhC+TB53/1bPFNKrF9tz38EFZdLwYHdBc/OJuCq/vV0lgrZNSe
         nTcuKF7Vi7wtB2kTtkI912J3yq9QOu50oFfTA9WFft0oa4TJ7hscEV+G1WIWPhh4IAEZ
         FPf57v0lWgUbqCtKh8f5gpzlX/Z7iOWo9lgUW5FNDxQWK1p8AC3lm6dpu9E5V/hc5pGV
         CcjjPFM6deIFtpy8rabtBL7akaEQ1QOH2wSjrt71cq6RzJUXNdUBRI1OKK1UND/zvUKf
         fT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QEHScbmL4R3l7GYXJJElRuFgvpRPXJ+4HyME0GWSF7k=;
        fh=iTHtc2qf4/gFX9SNtaqpGxu7tOBKFwGXGLI0t6Rq7aM=;
        b=sMwRQ6apJ1j3GYDLpFeBzC0ZEkMnNm50fpNH25/AR8clcxyNOrWBkkCyQhO/yYWy+Y
         CezFiGmS+Ar8tJ2+Jte83XnhFCXKsqKXsTgeqov62F9/HnPxCwTRHXG8JSdZ/s620rcB
         ea4C2UBQmn9Fp/iKl2qMpb3eOcd4YxP+5dyHUS32dSD+6qk3WGlx1y+m7+tqTzMrmdWk
         6UEXcIhQ2WQkochcKaaSSd2xd7eb02hDINcowyGG0eX7Ir55NjDGOyibI47hqMg/Wj8d
         KDZ44Am9U8rF3RvfxhgKP97R0jTuifCnGWOeuHepno77FvIFYVR732KBAxD/78B4pO+T
         psTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2g6z8dp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4416183cb53si4019181cf.431.2024.06.12.05.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 05:34:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2g6z8dp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHNAU-000555-3N; Wed, 12 Jun 2024 08:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHNAS-00054k-Ik
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 08:33:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHNAQ-0002kB-Js
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 08:33:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so576364f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718195609; x=1718800409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QEHScbmL4R3l7GYXJJElRuFgvpRPXJ+4HyME0GWSF7k=;
 b=l2g6z8dptuqjcYMo86woM3GouuHqLrUIBZaiVzqaSnWNAqfO3vmWeORP8Y9+vZERD1
 lBcuxfQojoPi3RSXgQ3OEU79DqSJLh0JlF7L6XtTUdLkHTGP/VlO0tVdbZIWBpsLBa0i
 58sDIdLpnY1LMWj1KS88C3GyMVR2Ht92bpz+sC3fE/VdIdOZKDEDO89C+zMsrlAPReuO
 1tQBVkGajnLF8C5VLLSY4aBFdvQ4jSG2/ChOVPHnKcKi2qT5T+0yLX/xwQc/Tb+tIkFa
 IAm8rhnIzP0tqgvugfWx7cAcKqeYwzeANBrlGE78VtLwK0QBbiqZD4/e5fhygkLHM/xf
 rr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718195609; x=1718800409;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QEHScbmL4R3l7GYXJJElRuFgvpRPXJ+4HyME0GWSF7k=;
 b=Rc3t1MdS9K2lqjN/PdK3e7m3tJPS10KrB10BjKQgUIQQGupB9MDXDzt9Y57d+B8ltK
 qh92EcWEhoOgWnUvPsU6YJ+x2fVJ3V4wou8A7Dpntxsvy4/lZXiYfMcQVyEw+BC1yxSo
 JrPz8Psi/+XjwFm9+AVqBpLdY9zrqtIsEIeovp2fpJ+v01TnRRmAFdzyPblLs7KAVXVd
 79ZCkhdqQgTEJHvdypJ/8vH92GVg3O1whjnidu7UwsvrT14ieO/3p8VDBUx7NeA42agk
 iI/9J+HX0z+STCVTo2yv7Po+w1n9h0ihIbkB3pYxirYV+7/zpuip7N2XLyXOI8NTguMp
 Qc/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMXXn+zaXon9Q3t1DbFJ/aPFtQ8n4TA/sQpihwfqSCDcBAgDHnTy1OiwPVFprc8xmXVshyw52CatAHdjbEONzabEk6
X-Gm-Message-State: AOJu0YzYX57nSyxp9ILIsseTIbIlh2j5wP3ZsnyK9s1vPkjlBvN7Iw7P
 I3P2JUzVh5jVezHCAfTAzhyRbWrBryhzskQTnikpO+u+qp1GBJIFZ4C3b+g/xIU=
X-Received: by 2002:a5d:598f:0:b0:360:6e58:c41c with SMTP id
 ffacd0b85a97d-3606e58c4a8mr1589917f8f.6.1718195608805; 
 Wed, 12 Jun 2024 05:33:28 -0700 (PDT)
Received: from [192.168.69.100] (ram94-h02-176-184-0-172.dsl.sta.abo.bbox.fr.
 [176.184.0.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f23a00997sm8485204f8f.0.2024.06.12.05.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 05:33:28 -0700 (PDT)
Message-ID: <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
Date: Wed, 12 Jun 2024 14:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, robin.murphy@arm.com,
 Jonathan.Cameron@huawei.com, gshan@redhat.com, eauger@redhat.com,
 sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com,
 shahuang@redhat.com, qemu-riscv <qemu-riscv@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Song Gao <gaosong@loongson.cn>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20240612020506.307793-1-zhenyzha@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240612020506.307793-1-zhenyzha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: RxJ9YiQAuEV2

Hi Zhenyu,

On 12/6/24 04:05, Zhenyu Zhang wrote:
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
> ---
> v3: Add comments explaining why we add 'dma-coherent' property (Peter)
> ---
>   hw/arm/virt.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3c93c0c0a6..3cefac6d43 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -271,6 +271,17 @@ static void create_fdt(VirtMachineState *vms)
>       qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>       qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
>   
> +    /*
> +     * For QEMU, all DMA is coherent. Advertising this in the root node
> +     * has two benefits:
> +     *
> +     * - It avoids potential bugs where we forget to mark a DMA
> +     *   capable device as being dma-coherent
> +     * - It avoids spurious warnings from the Linux kernel about
> +     *   devices which can't do DMA at all
> +     */
> +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);

OK, but why restrict that to the Aarch64 virt machine?
Shouldn't advertise this generically in create_device_tree()?
Or otherwise at least in the other virt machines?

>       /* /chosen must exist for load_dtb to fill in necessary properties later */
>       qemu_fdt_add_subnode(fdt, "/chosen");
>       if (vms->dtb_randomness) {

