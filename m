Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp912216njc;
        Thu, 13 Mar 2025 05:45:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3w2uAIghjOCjyiU6+LmTUukDd7tTX/kxztb+yn9eMZQI/kPrP0uuF7yA179KxxAA5IuehqqChq/GtIA==@linaro.org
X-Google-Smtp-Source: AGHT+IEUJgooIwKUYBT0NlSH3xYxECc7bbW6TmEEu/Ippm1ZpCWEXSRRJwiTlSiSroCSYDQF+Wfa
X-Received: by 2002:a05:622a:438a:b0:476:b7cf:4d42 with SMTP id d75a77b69052e-476b7cf50cfmr40056071cf.27.1741869911467;
        Thu, 13 Mar 2025 05:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741869911; cv=none;
        d=google.com; s=arc-20240605;
        b=AbufxybFlvT77tTWGKRP2kQxbh2kxtpocwlGucFPtE1b4R8pxnkHFlOK8Yzv33+h64
         sBfXp49tzJELEiT71ZnuDrtAv7PNWg2edkIyh/4/nvQH4hf/1R1gATgz4m5kGJiqi+Sc
         a3znxIIW5bvHKnBjV//Z6fV79iElCACsNcqPdvvKQIo/ghLN5GcTt2NXDgCQ0K42wJmu
         JH8x60MX3ct11E3qc9R0TUNiGdSvKYtMXS4Lc3zMiOTdf/HbtWfL0gt/P6QP4n24SPne
         fyFKXKnKbZP5ERHDcixM8VZ8WcOsTeUNM+8mgdmoEHAg1jVX2M3HuigtV2hGw5FdWAxh
         +1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D6feM5Xy+zarRq9YhH8FI7IPuKUW/t+Or20kqkXx3d8=;
        fh=GNzchdwjKQ9GMPtT48yeq6gGE5nN46O/reQiUVphTjs=;
        b=PFU8HeivXSNODOFELz7OvgQi21ILeX5hZr2klAIOTP0OrLqnJDsXZ7qriP+axNPhQE
         hvmEurikJAC6KGg/c4AopF1E7ZPiNgNJitetoWbGiGD2U/k6Acm2/QO3Av5kUQ4zBC8f
         8Ls+Gy7HjpsUronUyATEPSFZm3NIVnKVrM4KwSKEEJWnEXjU6fj7tuV7pLXhYlZilWo2
         NO22c93jChgF89rbu/8tfluOr6bDRhHhUUkqmUYf1O5MYqq8Tvg2/CoWiUsaPcB1tQGT
         I07s6lDy8U+HPJyHV3cTfinL8qSeUBO/UMVkXCJrCk3o3aGzc7k1O7bYGKtbHF6IzYl+
         fhuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jLmZUqyk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb615061si16195531cf.133.2025.03.13.05.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 05:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jLmZUqyk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tshvo-0003cH-9l; Thu, 13 Mar 2025 08:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshvn-0003bg-2G
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 08:44:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshvk-0003m3-4n
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 08:44:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so2010966a91.0
 for <qemu-arm@nongnu.org>; Thu, 13 Mar 2025 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741869894; x=1742474694; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D6feM5Xy+zarRq9YhH8FI7IPuKUW/t+Or20kqkXx3d8=;
 b=jLmZUqykW51Ha6Bnqnpcg0C90p1j8gsZlpnWO+PaNEHG1/HY9iYqduAt24ODYjSh42
 l2ylgGm6Fz9LAc1sNhqcyA+pYiHAO9hHgZYAosL/eRrrb+jDxLFhR/2JAyAFALp4AsHd
 QDdVAfa1r1Kb0lAWMyb/o5Tog60l0Cdwwxgp3hsWgQ+XU4Ew17RFQyEfE8Tfm9NxijUW
 S2I/KhU1CrAEJA87iCxLBbF5viUgU4NGHyNrkPrRGRoWIx8KwmrMJ+uaEXaQyjxQHAQJ
 9H9QzeQlDnqKcG4YMu3Z5EOr7rnSgKEoMr5rzf8m9C+uV3GIBXpXYP8bpG/6RWhT1N5D
 Ne6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741869894; x=1742474694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6feM5Xy+zarRq9YhH8FI7IPuKUW/t+Or20kqkXx3d8=;
 b=X104vymirrJnZkCsjso368AWxFibwcMO9BPBrfDjkq9flJHl1QCB7+t9itMgpvO5rn
 CR4ZlEChM8qf7A2JOqjumq8bFthOu84F17cIrSocVBju6xTv5L1QWygksj4GxYtdJKhy
 j30s5OSjjCUEs5b1oHcPZxtN6OePDcG+kKhe90fMV8Cpiw4oJ81RHQAUAB/+KBox0RZA
 xxDX2R5fiSIKEZGK7rVkno6CqjKD3PZ+D2zeVihPqrEdaDhwC9Sa9/zYZE0lRxeM9Ehx
 nlvYqI658hix/eXbC4M+OjqRL2nuekBMtM52w4vQy4HmXlDa2yW5yqF4gQU4OKcBB0TP
 EFSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+CPcYpNdiwiro0d6v3yKqQcMMAlvGQlm27H8UT7XAXvcvHHgJBTInXelzIDrBMJgZ18zLKNU29g==@nongnu.org
X-Gm-Message-State: AOJu0YwrBK/FoqZyKx8SNa1e8NFrI2xLCXfLCO82g2czXliHQcXEUtQ9
 XOrN0/v9WMWy8DaebYO09x3NMoUp9XyycwbAR6iWJKPW2K4LMffyNgbbo15XGEE=
X-Gm-Gg: ASbGnctKWFmL7nQbF/7wfEYGtnJnNxAXIg9qB3xK0jNRV5PH4mJMk1ch4y4zsyZi6mH
 abR/DLcflFYMS0sB5g854tpBO78zMNucopyxzUcK1ROik/8lZpHTaXJ+OvlaWAq6qsPqxFmFZp9
 bdtsJdfw7qydSb9TKMMjS8Lx9SVfGYib3CKZO95DJr7xSeJVZ2RIqc0UyNW5pOUopQ8B1UAgiXa
 knlRMGRAD2u7FNljnUV3kNIVeWtmFWDug54xXgdObKQK7Zr2R7UUrBOpYx7ATh0mezdutl0MfZf
 VU3+nKTOB2keJ6ETf2M5f3HyFdLYhYiuOGng7+EFuCJl9VpiZ5XcO4epmxM=
X-Received: by 2002:a05:6a21:1519:b0:1f5:7280:1cdb with SMTP id
 adf61e73a8af0-1f572802b7amr25495560637.16.1741869894263; 
 Thu, 13 Mar 2025 05:44:54 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea95651sm1162523a12.73.2025.03.13.05.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:44:53 -0700 (PDT)
Message-ID: <f08a8ad9-186a-4983-9c7e-3976668ae8fd@ventanamicro.com>
Date: Thu, 13 Mar 2025 09:44:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/riscv/riscv-iommu: Connect the IOMMU with PCI
 hosts that have ATUs
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
References: <20250307203952.13871-1-jason.chien@sifive.com>
 <20250307203952.13871-5-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250307203952.13871-5-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
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
X-TUID: yPKcOcNJWpWM



On 3/7/25 5:39 PM, Jason Chien wrote:
> When the IOMMU detects that bus->iommu_ops has been registered, indicating
> the presence of an ATU, it sets the bus's downstream memory region to ensure
> transactions are directed to the IOMMU.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/riscv-iommu.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index d46beb2d64..9701fe3831 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2628,11 +2628,16 @@ static const PCIIOMMUOps riscv_iommu_ops = {
>   void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
>           Error **errp)
>   {
> -    if (bus->iommu_ops &&
> -        bus->iommu_ops->get_address_space == riscv_iommu_find_as) {
> -        /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
> -        RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
> -        QLIST_INSERT_AFTER(last, iommu, iommus);
> +    if (bus->iommu_ops) {
> +        if (bus->iommu_ops->get_address_space == riscv_iommu_find_as) {
> +            /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
> +            RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
> +            QLIST_INSERT_AFTER(last, iommu, iommus);
> +        } else {
> +            /* The bus has an ATU. Set its downsteam memory region. */
> +            AddressSpace *as = riscv_iommu_space(iommu, 0);
> +            pci_setup_iommu_downstream_mr(bus, as->root);
> +        }
>       } else if (!bus->iommu_ops && !bus->iommu_opaque) {
>           pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
>       } else {

