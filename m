Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2864009eje;
        Wed, 12 Jul 2023 13:19:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE7E9S/nBANLaSyC4yI0kJRHSDoVWnjDpK+swCBIDgPbJujfNOBkHg0GpDUXkavvM3TmQsH
X-Received: by 2002:a05:622a:14c9:b0:403:cbe8:13f8 with SMTP id u9-20020a05622a14c900b00403cbe813f8mr1058737qtx.12.1689193163681;
        Wed, 12 Jul 2023 13:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689193163; cv=none;
        d=google.com; s=arc-20160816;
        b=dy7rK3F5RA5J6BUVmBKhlSRfrBiqAyJxR5iB6lND//jNN1M09x5/PrUR+0qAMCgVJg
         YKNf2AFalM5TIWo4QfgmSkhRLSLga28gTnjL/cWbKJ8PYsynrHh8lHkHUlfRcTvqY+XY
         Eql2us+PW03OltIf0nthoGjT/zE5Vx9VWEvoiF4A+l6/wn8plrAYBER2KFyiSb1gh/El
         ytt333XYqVz2XMDeCkDO3AMVIjHokbSlyfL6OHhlrCMAbLqfTxmwwpCHfNFD+wWkY/UH
         6RIsjV+Wrgg769pJc1x0SF8QKUIUaEj3Duf4QLZprcBGQXOFUCu99iYsiQY1VXparLjx
         UxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pCdyffSB1FqsQckbymkIKQDwVd/IodO3mw5qNKITyEA=;
        fh=NddmdC0H7Yvd15BYzKWOWZBS0FBdcJ9zE0BWGJ3GxJc=;
        b=DK1tE+IevWPQ4uau50VVkRd2wQEyDpg59lFze8LVo7/d/KjTEUcPix+/C66uNYhU0s
         thsOT1KmzmvN+2+vvKn1dunXitPYF0zYVOlnjLB7NovNNzicThB+q/fuk+MwYKsOihOF
         a41fAmZhAnh+9HpZUuiFC5D0T73P3IpBcGUpw2cLF5Pcfk/zmnTLiDIYBb9dq+bYswHT
         Gsw1esJA4BZ2FdGNq0rQ0MftEu7tQ/Szq5VM+Yvoohnzs65Y956b2VSWfqKg0jLHjwYY
         fD+GyyANviffO/jSYYSdNoEiXA1Fgn/ZosKezsTCf/IgeWOpftkJXf3AxQiv4yKra8h6
         5vJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=SvqTgI3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85705000000b004031b235567si2107949qtw.16.2023.07.12.13.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 13:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=SvqTgI3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJgId-0000df-DO; Wed, 12 Jul 2023 16:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgIY-0000d0-PG
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 16:18:54 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgIV-0004Al-Vo
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 16:18:54 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3909756b8b1so4060628b6e.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689193130; x=1691785130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pCdyffSB1FqsQckbymkIKQDwVd/IodO3mw5qNKITyEA=;
 b=SvqTgI3OgPwXQsxQpvLWKVnEZZP74I4QbfN7BpiXG0zJTpr+6GldvS9lRKv7eUMwer
 dM+gykCI3Iqf/JTGXvMAZ7H4Inv4T6SAaka0iFg6T9y1yVprTe3n0HErOR/ccQ12IZV4
 IqpSvEId4uKHdjodO/q9xREMQUyT5ZJxYyPfCk3T1OUqHVSzWDRLQElqAgwMg2WI+bWk
 AN0Ae6vps04W4SGtMJ0OqRqY2MyToZSKrweC+mtMHMqkkRjMYUB5LMtALkX5OU54mFvR
 ujIvs5LC3dzCKGis3sVDZxmd/sfV9blAKvUB8+amXdoYLtevo+wlKZkwgGKApb+UkLc5
 dv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689193130; x=1691785130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pCdyffSB1FqsQckbymkIKQDwVd/IodO3mw5qNKITyEA=;
 b=f8x2cwWZb7b9Azz7wzPDjullFDDvz1Z0N0vtOxnRP9VDYvMDmyOx5ksfykHMOyD0kI
 IRM4B9uXbr8Y8RF2EkODy3UiRgkTbRqw6SJGNCuSM/bKuXYLi5c/Kh0SV46AFHS5f5mF
 dLVZfv9SEFOM8yQB2BKz6TuwI7K1zbw6P5P2YF7w8tgatMJFGsT+QBMnM8P/FNcnlnBy
 hI77cDAO1oPJjKSH5H8vOKU5plZVtltn3dEbxW1dvfOnPByVkQ6z5FbTWARpAcHaJNpF
 I/RgwsW/YAWVVEjkEj64QTAHah7B02HBuwQYsMq8wFOpQNv+KimErGCiP6HsxqxVxJcz
 QODw==
X-Gm-Message-State: ABy/qLZAYFPPLdBg4odukQLKNPj8r4pVdGL1kOPS5tFGoxM6O/9Xrwqg
 B3TQOe6wq6pz/9zd4hsssJZ3lnzcE6eARpN2I6I=
X-Received: by 2002:a54:4618:0:b0:3a3:9ae0:efe1 with SMTP id
 p24-20020a544618000000b003a39ae0efe1mr13570297oip.6.1689193130656; 
 Wed, 12 Jul 2023 13:18:50 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 d5-20020a05680813c500b003a409a977c0sm2293519oiw.4.2023.07.12.13.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 13:18:50 -0700 (PDT)
Message-ID: <d7376261-7af8-aa42-8eb3-6af3f58f32a8@ventanamicro.com>
Date: Wed, 12 Jul 2023 17:18:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/10] hw/riscv: virt: Add PCI bus reference in
 RISCVVirtState
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-3-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-3-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.11,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: G8AC+SWT9Vzr



On 7/12/23 13:39, Sunil V L wrote:
> The PCI bus information is needed in RISCVVirtState so that other
> files like virt-acpi-build.c can make use of it. Add new field in
> RISCVVirtState so that ACPI code can use it.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>   hw/riscv/virt.c         | 6 ++++--
>   include/hw/riscv/virt.h | 1 +
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..46d3341113 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1073,7 +1073,8 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>                                             hwaddr high_mmio_base,
>                                             hwaddr high_mmio_size,
>                                             hwaddr pio_base,
> -                                          DeviceState *irqchip)
> +                                          DeviceState *irqchip,
> +                                          RISCVVirtState *s)
>   {
>       DeviceState *dev;
>       MemoryRegion *ecam_alias, *ecam_reg;
> @@ -1113,6 +1114,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>           gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>       }
>   
> +    s->bus = PCI_HOST_BRIDGE(dev)->bus;
>       return dev;
>   }
>   
> @@ -1502,7 +1504,7 @@ static void virt_machine_init(MachineState *machine)
>                      virt_high_pcie_memmap.base,
>                      virt_high_pcie_memmap.size,
>                      memmap[VIRT_PCIE_PIO].base,
> -                   pcie_irqchip);
> +                   pcie_irqchip, s);

I wonder whether we could use 's' inside gpex_pcie_init() to avoid passing all
this memmap stuff to the function. It seems that most, if not all these values,
can be derived from s->memmap[]. A work for another day perhaps.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   
>       create_platform_bus(s, mmio_irqchip);
>   
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..4ef1f660ab 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -60,6 +60,7 @@ struct RISCVVirtState {
>       char *oem_table_id;
>       OnOffAuto acpi;
>       const MemMapEntry *memmap;
> +    PCIBus *bus;
>   };
>   
>   enum {
