Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3716292njn;
        Thu, 16 Jan 2025 04:40:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbxJD5jgBtoDtrsGEX8s0Vr1j9mlMNKo6rYIdJpsa1HCL+XDjk/nM067XsMx5umUxCPR4K7e0W0hcecg==@linaro.org
X-Google-Smtp-Source: AGHT+IG80GmsNZnhkJ01SdCCLJk7vwv0nQD5KRXC03BB23+Ta+65OrQPmkd6biMlbclVH+LPchKl
X-Received: by 2002:a05:600c:4ecd:b0:434:f335:83b with SMTP id 5b1f17b1804b1-436e269723emr335592385e9.5.1737031235491;
        Thu, 16 Jan 2025 04:40:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737031235; cv=none;
        d=google.com; s=arc-20240605;
        b=BnApajRN7lpY3qZqQ31wrOZQ/1PLK99NKuUFThmikMKOilywOolbpVTia7Py9bWUib
         511cR4Ccu8uNIkdJrY4jbeoj5MrI1IGfxp8q323wIM22OxSOfFzVV2iJcf0K7/xrhJoI
         Q6EiNl/JSkShKIYgRu7KgWqa/cmdwdbKKf+Qa73Qk0BOKfv8fC0BBw3/r565Ll2fYFeI
         vLO6qLNcZEamyqXXZyVERj5ymbwaPA22v8erssp0GRFq3RpME6EAVkggHeVsNU58LJJT
         KTe+LWlRip1WfqHpPL+uen8JqntuwRAI0K8sG92MOG4DR7c2NClx8gPOxCEdVj+apWL8
         1RTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/xLMPzQyXvXz+ptTxrogISCmzpKSoUCycg6DigtV/0s=;
        fh=yahazno5XsneExjr4jvCE2tCEMydHnurEh7jAVjEj0w=;
        b=jE5/VTbi9Ue0hIwLxWYvbm81nRd5stvDiNWM7k0NMyI7wh6uJ114rsEfkJdclhqUfy
         k5692oHrBsNU7Fb4DJs6Vp0VcshFRAmSxcBrZTC4PFz6NN+uU/cEoilUYdQ3plxgBvse
         21ygWTRjvg8GE8c9waYdv3B8YxQ8RKMeHelf0mhlRc3M+vYr1xOjYa44JNRMC34t4EEt
         d0qWa4sKHIDDxSM4dGEzf+IWzjrh0sGiaITPhG6B8waIljDu6ywmjBKmk+8Mt5vW67k5
         w1RIRQgghcddDtUFfZ78komePD04fYtFPVfHjxAl2m/B0+/fhE9aXTFA0GQ7UxD6yx8j
         WP6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ih6OsqVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38a8e4c7f4asi11569809f8f.282.2025.01.16.04.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 04:40:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ih6OsqVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYPAW-0008O3-1l; Thu, 16 Jan 2025 07:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYPAS-0008Kz-7Q
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 07:40:12 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tYPAP-0003Yb-Va
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 07:40:11 -0500
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3eba583fbe8so303185b6e.3
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737031208; x=1737636008; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/xLMPzQyXvXz+ptTxrogISCmzpKSoUCycg6DigtV/0s=;
 b=Ih6OsqVLijThMMeKqBqvoIduxeNNg1NYkMmceViPMTRPVk2HbOGRzH/pwMbKResTVc
 R5v6p1l/8fsKaI8vr50oT6lnnyaDj/+sDcpSTU3s+ewuXDBUkbSknkUuYMcf8TEaFQk8
 DdvrOmXKTZPoYs0GxxcbvBNPpHCzKyuA4UlkKwEIEU91V72VslvMVMs8NWP0H9KdLCWd
 f1R4SmbnH2udhdvqory77IHesp8h4S7hDR5w1exB2V/2dxCGbM6quv1a3FehmtJp9kkM
 r/COJDwQ4zZKnccjDLzEtE+7Vqhl9r7AAoeJ17sfL2rSG65PSL2pXHja891xzGpeEf/O
 5EhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737031208; x=1737636008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/xLMPzQyXvXz+ptTxrogISCmzpKSoUCycg6DigtV/0s=;
 b=DOYiurpRrREHUkfA9d8OLzAOudst+z5drjsSWPuE2tNyKN4w8eKLREIDNk31rEnioh
 DE2FIEPhD8D2AIW2um72oAytjyvYXelvSsW7adY7sao018VD9x4VUBrmNMuqg8FKuMfg
 //CO3HmyDXJEUO/6MHv3smVlj98qO+kbMMce9We5mnrr+ddOhmHI5uPBcdOWwgCiZUgP
 yrbWNF0ECloIxZ4GbI3xnmRxuq6fQIP12GWDC8efYAj0w9vS8L3pDkfWaC3k4lsCcebU
 NsLHdxI7DyD0Mln3QXKamT+JSIU5yKxL3Ibru9hs5UTs0HkHAutBbda84HYDVQ28sR5C
 IiIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZsesmS0iLRMDbpgms1sQMRYS6G2ODQ6LNYiIUY3SAxzlK1t/3KaOMhn+bppNY14Dsgznw+s57jg==@nongnu.org
X-Gm-Message-State: AOJu0YxY2fcs2lK5NAM9PTIhWSNsgFNxZVkZBtvoXdUyoq261/JNGCMy
 zF+1qDayY3VIH3AK3fI6r7oJWkPRL4qvOp8a66c/7+ZnbXctoJ8PcaaFOapCtfc=
X-Gm-Gg: ASbGncugoPZIGL8AgC0y614pS0P95j2Fi6MA4SavV9UV1QBGzyerXHj+PMRwvjvksT5
 kNRnRpxkupCh4/AiY7EQ1SIZoFpd7snXmXwl/dym6hS4z3QkqvLz4cIVchukpcKnfSUThenKOjX
 tpahuUrwb6aqMUS7vr+uqSek5wdA8HbNBFPSUwn8G+R5TtgPc6oQgxRuWQti6h0rlvajKUq5lbf
 CANFaFUrWrs+TZEF9R8QAc4ZFff19cu7zqmuLfS09A9fygv5zRWr+4X/CePdWG17KI7pXs=
X-Received: by 2002:a05:6808:3a18:b0:3ea:6415:c44 with SMTP id
 5614622812f47-3ef2ec6c3bdmr24815637b6e.8.1737031208342; 
 Thu, 16 Jan 2025 04:40:08 -0800 (PST)
Received: from [192.168.68.110] ([191.202.238.10])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f03769a5aesm5759635b6e.28.2025.01.16.04.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 04:40:07 -0800 (PST)
Message-ID: <60002f0e-559b-4c00-92b2-a1e5928b20ea@ventanamicro.com>
Date: Thu, 16 Jan 2025 09:40:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/6] hw/riscv/riscv-iommu: Allow PCI hosts with
 iommu_ops registered connecting to the IOMMU
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
 <20241216004857.9367-5-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241216004857.9367-5-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-TUID: sWpGG1k+FK+D



On 12/15/24 9:48 PM, Jason Chien wrote:
> pci_setup_iommu_downstream_mem() is called to set the downstream memory
> region of the PCIe devices.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/riscv-iommu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index e9a0775d6e..f5d53a36b2 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2436,6 +2436,14 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
>           QLIST_INSERT_AFTER(last, iommu, iommus);
>       } else if (!bus->iommu_ops && !bus->iommu_opaque) {
>           pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
> +    } else if (bus->iommu_ops && bus->iommu_ops->set_memory_region) {
> +        /*
> +         * TODO:
> +         * All memory transactions of this bus will be directed to this AS.
> +         * We need to distinguish the source device dynamically.
> +         */
> +        AddressSpace *as = riscv_iommu_space(iommu, 0);
> +        pci_setup_iommu_downstream_mem(bus, as->root);
>       } else {
>           error_setg(errp, "can't register secondary IOMMU for PCI bus #%d",
>               pci_bus_num(bus));

