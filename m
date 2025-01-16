Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3716658njn;
        Thu, 16 Jan 2025 04:41:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXheUaki4ij63ZTH85ptB607dKeteXYgMZEc+nWju5rkT4SEDga7Ou1zMl/o+PVnxvZnW6ATa1Sxi+Wg==@linaro.org
X-Google-Smtp-Source: AGHT+IFGa/JNJQNx8aqp+1JRHzE++hFj2aT7Jb78L6FO8MNoH9e8O/2m5r1H42c1+h61ghzAJJVo
X-Received: by 2002:adf:c08d:0:b0:38a:87cc:fb42 with SMTP id ffacd0b85a97d-38a87ccfc9cmr25243972f8f.21.1737031281885;
        Thu, 16 Jan 2025 04:41:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737031281; cv=none;
        d=google.com; s=arc-20240605;
        b=Qiqk/vLC8/ySbL0OmxQkycgj8TiOeO8c/q77YMs9AbQN3DVX6F8CmtAECwH5Zh4PSy
         5e5JQMRWP9JNfVblGjaU2t165+VO+GXJ0gmkVp3xeU6AiYKODRJfXvS3Q5+DDlCc5XZN
         US2639OO9HFP4bZDccqUTi/O889nl1hrWFf6f4p67gFGNGdpGyb6Zsa4303pXGFsifSr
         wv4AyCScB3VmipOcJjxw8KVIJ8Goc5I1kfjPWyoEkqjKQMOprhNA54/U3GjUi9jysjG6
         kxsQokTdu05NfRMqkraP1bMKpO3C6Y5wreUxj0WGRY4ReHxU4noUGKzHVGhZ4sCv9v22
         eILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yHr/thHl0Pqp9/aPVplGb+KVLdIqWX3rtBZC0y7+oOI=;
        fh=kTSsn6fYRhsfyFzP/18548WqblLj1cmDbMutDwTuQZ8=;
        b=Jaj/m5qs0XHf1bzWo2PFXl1n00Dzn9Q/EIijAkCxZGC+HBh05dBF5PI7yZX0Yyfe7U
         7r2PtZdIBvJh+zvjhWQtHSIpPHzrK82YnA7Y4BAanDRayCq+CZ8bU+cvYLxEloi6BaoB
         loQJk7JJgLQdj8sDa3qYDA6J34sR7t13GYnxxTdgrQji3yAJwPzNC/ehy7zf7jUak8xs
         MEHbeud8PV24MO/a8BaQicLQndIQqRudrlR0OVA+WIcZWv3vvKImizEPSUejBoOMDqc2
         ptnYAXmFsKdVxiEBtnnOWyo55et9Yp5ycV9LrZYZiNu2alpXDi8oUT725+llS+yRA9Gx
         yFvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=B1XwhFeo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-437c74e274esi27127055e9.156.2025.01.16.04.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 04:41:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=B1XwhFeo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYPBS-0000hL-Rd; Thu, 16 Jan 2025 07:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYPBQ-0000WB-Ax
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 07:41:12 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYPBM-0003iW-W7
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 07:41:12 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3ee29277d44so492730b6e.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 04:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737031264; x=1737636064; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHr/thHl0Pqp9/aPVplGb+KVLdIqWX3rtBZC0y7+oOI=;
 b=B1XwhFeothEla8KGY2/acZjpr0EzmrnYw6eryF6azA5zyWT/va66sqrap/BYq/hSAI
 2qbs7cJ2Pt8GNanst9RI7a+YQp/Dk34AfXpWSsG6t9jDHA8muSGm/OXKoN+GRX03KkES
 d/bzz5trG0anu5HGOnLKyV4UDiYsWXExp446zicCut2iT8AEw5inU/4GSPiZ4nCM5HBg
 kylwj2VRYvpEILuPNvhgCcCCe5M+2siARoyebNuhsu51JJhZab8UOG4HM9HNElot9+Yv
 VHXYgi5qAhGPJd4+i737+NmDLM8V1JvlCsi0vo04N0Eo3oiemjodIj4d+bH6m+cfDnfn
 VR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737031264; x=1737636064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHr/thHl0Pqp9/aPVplGb+KVLdIqWX3rtBZC0y7+oOI=;
 b=tvRN/7GkiMNlrog8ZFYZTzTulWe8d/Kz3J1qFpowky9RQdoCFmtbDaTAabNQsZY2uV
 SSP+/tUTSGrOBTTV9JVC16FcGuVD5XiHCofn+DMzMnWtTW0ZGJ3qHQMuxb2CX7E4G8jY
 XCP9makcmnlWFUpJaA7qdds08KKbUoIbmy/1ngkjDOptzM1mbAzkcIUAbEOKLU2gWKR5
 8H3M6ZjsWlZy/o4UCLqsFWtivkxqXWFKdhSlPu7WeEmRuAabsDscYwWCUkyW5OW4ZS8u
 yomty00tc9XrVtWzxgEGUZETc70WeinP4rIuBAA/Qx6lbuYbYkaA1UFsijL1TCUKm5dT
 mPvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjBfi0nFEQWlhEo5eYI7ZhJorBEYz8yc+F8KxrzXbmYVJ759Pnt119WjNe6Qz13DNNL9uw3DaBIw==@nongnu.org
X-Gm-Message-State: AOJu0YyzNmAHIqVq+L28OifC8LVnOxVx8KgQ8U9P6VndbA+hx4tMhCOZ
 1FmgLs3pCCQjHDAvnd+4Kg801aIYWSvz0V466Rl+FrbR/+Pn97orbRlNbD6kkSw=
X-Gm-Gg: ASbGncu4DQTujqSCJ4t/QIr++VemYnuFd2xGwDXhZgSW81hiPonIf8G9lU2786a1XBP
 MdZJnnsicxPz1I81BEhVWSzTczdgaDyCesY+0F+1KTRILjA0wYvAf+PcIIYxB6/zEyKz95XCJUL
 Qa/6qFclG/8d+ofLxecuZIs846tE9uiQPi3XHzBztmWSkn3P7gNzwwPqPz/exb1goDdNyTWd4mz
 He6VmZPijD50CSQXE5GdzKcQTd4sYNEk1VhVVAF/NnEV/UNRrkrg5sAfFoY2Bak2MfdLTw=
X-Received: by 2002:a05:6808:1449:b0:3e6:6097:847d with SMTP id
 5614622812f47-3ef2ebf8a75mr22500109b6e.7.1737031264619; 
 Thu, 16 Jan 2025 04:41:04 -0800 (PST)
Received: from [192.168.68.110] ([191.202.238.10])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f037654176sm5762191b6e.14.2025.01.16.04.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 04:41:03 -0800 (PST)
Message-ID: <423806dd-34f3-4d78-ae69-688f965c92e8@ventanamicro.com>
Date: Thu, 16 Jan 2025 09:40:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/6] hw/riscv/riscv-iommu: Acquire device IDs
 dynamically
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
References: <20241216004857.9367-1-jason.chien@sifive.com>
 <20241216004857.9367-6-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241216004857.9367-6-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-TUID: I7KGkOopQ9uJ



On 12/15/24 9:48 PM, Jason Chien wrote:
> When all memory transactions from a PCIe host write to the same IOMMU
> memory region, we need to distinguish the source device dynamically.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

I'm not sure whether this should be squashed in patch 4 but the code LGTM,
so either way:


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index f5d53a36b2..e4b7008306 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -48,6 +48,7 @@ struct RISCVIOMMUSpace {
>       RISCVIOMMUState *iommu;     /* Managing IOMMU device state */
>       uint32_t devid;             /* Requester identifier, AKA device_id */
>       bool notifier;              /* IOMMU unmap notifier enabled */
> +    bool dynamic_devid;         /* Acquiring device_id dynamically */
>       QLIST_ENTRY(RISCVIOMMUSpace) list;
>   };
>   
> @@ -1184,7 +1185,8 @@ static void riscv_iommu_ctx_put(RISCVIOMMUState *s, void *ref)
>   }
>   
>   /* Find or allocate address space for a given device */
> -static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
> +static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid,
> +                                       bool dynamic)
>   {
>       RISCVIOMMUSpace *as;
>   
> @@ -1203,6 +1205,7 @@ static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
>   
>           as->iommu = s;
>           as->devid = devid;
> +        as->dynamic_devid = dynamic;
>   
>           snprintf(name, sizeof(name), "riscv-iommu-%04x:%02x.%d-iova",
>               PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid), PCI_FUNC(as->devid));
> @@ -2415,7 +2418,8 @@ static AddressSpace *riscv_iommu_find_as(PCIBus *bus, void *opaque, int devfn)
>   
>       /* Find first matching IOMMU */
>       while (s != NULL && as == NULL) {
> -        as = riscv_iommu_space(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
> +        as = riscv_iommu_space(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn),
> +                               false);
>           s = s->iommus.le_next;
>       }
>   
> @@ -2438,11 +2442,10 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
>           pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
>       } else if (bus->iommu_ops && bus->iommu_ops->set_memory_region) {
>           /*
> -         * TODO:
>            * All memory transactions of this bus will be directed to this AS.
>            * We need to distinguish the source device dynamically.
>            */
> -        AddressSpace *as = riscv_iommu_space(iommu, 0);
> +        AddressSpace *as = riscv_iommu_space(iommu, 0, true);
>           pci_setup_iommu_downstream_mem(bus, as->root);
>       } else {
>           error_setg(errp, "can't register secondary IOMMU for PCI bus #%d",
> @@ -2453,6 +2456,12 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
>   static int riscv_iommu_memory_region_index(IOMMUMemoryRegion *iommu_mr,
>       MemTxAttrs attrs)
>   {
> +    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
> +
> +    if (as->dynamic_devid) {
> +        as->devid = attrs.requester_id;
> +    }
> +
>       return attrs.unspecified ? RISCV_IOMMU_NOPROCID : (int)attrs.pid;
>   }
>   

