Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp126398ejc;
        Tue, 11 Jun 2024 19:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDugDkBJmxrPCrCtrQElDZ2vUhHbfw0mnBvr4q6HenYNdL7vj1m6U0UDCLXddVmldWqB4edFBSBaKfya5oFMWRzCOaEFm/
X-Google-Smtp-Source: AGHT+IH1LQDD0/84h/QwDPfE3NXZxnNnMbMtVqJp8JMphhEI3ZUMCI8YbSjzY3+DQIUgVAnrGgt+
X-Received: by 2002:a05:620a:4487:b0:796:2856:9663 with SMTP id af79cd13be357-797f6025a8dmr47785985a.19.1718159160421;
        Tue, 11 Jun 2024 19:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718159160; cv=none;
        d=google.com; s=arc-20160816;
        b=EiQmWiRWW0ZExOdy2xs6VxQrONkgeFA2ojTplh7VtwKgyrHbXAgGlwv6E2jApcZcHg
         nNRvMnZpBk0z8PiLZba997JWBl9tUIkp9LBdoGlvVPdvffB+8mr6PW6wkyM0Rw0REh7U
         sVJoGDtOdREIRs5YlAmFgvZG+FXICqp5x/EqaLPVqZ9G0YXAVAPLZQYVFP9p+SDNnVap
         Qs8TPrMXd9salK080GGo1yToxs1tWqdbLfzgYjZz0sXuRV4E0hny8VbpEoHcP9U0MX7q
         yaBt25ULd1VY7cHZ2L31DBO4Xg0JMrvAfRkNlTAVdE2YJwgYkZla3WpdcWwZCsxirtUK
         t3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eth8zu/249M8nPQmTdDsAo4QECDF1/gVZaRBKjhaVN0=;
        fh=KlOsmsTWSKG6UK963oiKMj0BMZ4gp09EdnuiuPursEg=;
        b=Zm8y51WX9t9aL6guVPieef18+2fSLethdOmwnPAcHSrml19QqSgQ5ZG0gj+5zlUt2b
         WfyFU/6wq7F140yF1sCv/63T33qsA8Bm+tytkCVJ6K3MTi1iWzeaataZNDEpQjy6vbnu
         +ha4k8g1aHuyso0SpN0G2MNNWdQNgtvQf4h5PQrWzDxSMbdLtu9i86S5OO8BFm+ozlMG
         qPqi2yO4W6vpwePw/WGAYZAw8TqlFq/RZeY0M5bv2tfzd4itSA1zH0ZNmQvyFIW5Ayjy
         w3CM7bKt6HUZA05woQ8r9PIR91VGSUHNFMUDIAUBQ/SFbkBV0jX1dlkS8o+HLdnTz/Iv
         Ylbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cM8qPdqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-796295d05acsi620721685a.552.2024.06.11.19.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2024 19:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cM8qPdqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHDgD-0002yx-6c; Tue, 11 Jun 2024 22:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1sHDgC-0002yG-8j
 for qemu-arm@nongnu.org; Tue, 11 Jun 2024 22:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1sHDgA-0004rE-Gv
 for qemu-arm@nongnu.org; Tue, 11 Jun 2024 22:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718159134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eth8zu/249M8nPQmTdDsAo4QECDF1/gVZaRBKjhaVN0=;
 b=cM8qPdqCeRzsKIdMlSi+jwtbqxaj0QjMc11Z0QhfomSpKZcE4XsKo0AFD3Eb0yxb3XwGQK
 28gCSyJF4275PRu9Q4OAEfk/ZPGKL+itZL6nQcwnHkB+uGOrU2akVeRMVEQBaQRkF0Lz74
 BEoasOdNmGpcknTygRubG+dMoxBRKAc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-ZKr3wyd6PpeNwa1R_tyOVg-1; Tue, 11 Jun 2024 22:25:26 -0400
X-MC-Unique: ZKr3wyd6PpeNwa1R_tyOVg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-6c8f99fef10so5900828a12.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2024 19:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718159125; x=1718763925;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eth8zu/249M8nPQmTdDsAo4QECDF1/gVZaRBKjhaVN0=;
 b=IarLwyboyrnmdDTOxt/jYbwy3NeiGFLzXfORA3/XsAQizmQaObhMBXaOoYkWhHjIru
 GvbTDKvtiP8Wukd6C9dhQTzcSUz64eP4vCOnydRFyJLOCCIg2L0g1YE/GYLeaq3u5+Ml
 caMZ6nOtWJ3P7cr0hGWYhlZOK/1vHFupHeiHVsr8fkmASZ1RF0H3tcaWZVJPJYSJbaF6
 +V0nhyBw/qAU3yo44YQ7JlsqzNGrmbYlnG9JSeOe7gJMN7m71vmfE6yXaqmviQYTJEo8
 8yzb178zDtxcL+XQQRZp7CT+Yeb7AMlTXbW0XQ02dR5AUbROi4hpt2/68bM4SfkuzQaz
 cjHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIFZBCsayKIu6W4MNKkpVIBLn397RDvIQmhHrBfN3wh9wZ4ZPkGpjQDvEKOsLzlMScRufQxusXBj3efIaJ7r55js5w
X-Gm-Message-State: AOJu0Yyppsom9+rdvNs9QHHkjM8ptuGgDMqnmDjnSJ/JwQ7kO3Ye9PVu
 ATk6+SXSNne2lbII+ilN7E+L9glRJO+yxi6zoU6MfZ3AsKxDBWOwIRguo+Z3UPcUuyZa6G2/TNV
 Y/F4pKY1F+nVB2DdvOgVKAPbUCtk5P8wKjXVULKPulEOqmfpfJw==
X-Received: by 2002:a05:6a21:3295:b0:1b7:889d:f206 with SMTP id
 adf61e73a8af0-1b8a9bbda24mr780887637.28.1718159125559; 
 Tue, 11 Jun 2024 19:25:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:3295:b0:1b7:889d:f206 with SMTP id
 adf61e73a8af0-1b8a9bbda24mr780875637.28.1718159125164; 
 Tue, 11 Jun 2024 19:25:25 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd7fdd53sm110391655ad.293.2024.06.11.19.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 19:25:24 -0700 (PDT)
Message-ID: <c744f128-0933-4ea9-ba41-65b8e5a90c02@redhat.com>
Date: Wed, 12 Jun 2024 12:25:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, robin.murphy@arm.com,
 Jonathan.Cameron@huawei.com, eauger@redhat.com, sebott@redhat.com,
 cohuck@redhat.com, ddutile@redhat.com, shahuang@redhat.com
References: <20240612020506.307793-1-zhenyzha@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240612020506.307793-1-zhenyzha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: zTl9yYMuVBt6

On 6/12/24 12:05, Zhenyu Zhang wrote:
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

Reviewed-by: Gavin Shan <gshan@redhat.com>

