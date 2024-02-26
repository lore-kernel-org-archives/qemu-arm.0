Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2163129ejf;
        Mon, 26 Feb 2024 08:29:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVifghH9daCIiJUTR1mX6EIQj82rPiuQmfukMg96R7Ut4bB/AX/eSKRXp+PzDfUhAJ6PEhwTd1MXHnk/mvK7wWB9024rSM
X-Google-Smtp-Source: AGHT+IEyE934Nq2EljIgZtLp8UP/wXxZWJF6QTUJpofoxrN+W+0imcomxSxHTnrAQQsOLfGvGVg0
X-Received: by 2002:a05:620a:190e:b0:787:bc8b:e9b9 with SMTP id bj14-20020a05620a190e00b00787bc8be9b9mr15117659qkb.9.1708964944374;
        Mon, 26 Feb 2024 08:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964944; cv=none;
        d=google.com; s=arc-20160816;
        b=u0SLumVLbyVnhP/xcXsnPjmNHqcahvT5qyBIYJaK7DOMFQqg5H8UDMTOol+wQMScRk
         fHmxI2oytMD+BVVsRVLLOyW/90BHkZnPkDGVDvJt7HxiORgZBFgRowwn0PcXTi/59ZIe
         DRrrnx3seqwyTqVegn0wMvPxszjuqCkLa+xehHyEo7TGjey4Xu4bMzueRx4ioWaJ6U5H
         RRfafm7eVTmb+/LP4VA2Z4Z2PKWdyrr+iSdZTbutDFiB2fE7/uWNtUdspRViZ0xsITeR
         6U/h2dWUChq4BQck9CTIFDZX42Vy8kBXxTPZ9zwCgOMbhaQSVULAgHtZAK/0dMCWsbPp
         LJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oEkng3ZE/vlKyJr1xJbRI5B7Go9cYFsY9HcbjAsbMbY=;
        fh=a6ZjIQ8PNkaC0gRXEJ4TeoLjXf/L8APNFuxSQf+LsqA=;
        b=IaXrUtQURULRex2ZuKACM0vBy1oNDsrPQfpkDVhb6GTLPxqlb2C2swqKCIGO/QjimI
         8cnO0LUT+goqiu7W1R3WEDZ+zJBKfxr2s/YQ6rukWe5zWWkMS4MAXVwthxvdBIDn84AC
         nTSCc/7oSjhQcdqfScbYTK0o77j8SxndAtMKNg1I00bIoGTwZ7TOtYn393jttvA+ey7Z
         aqXIHnGytwfDXTT0OwJtXw3WV/iVTxIg4vdP2a4aq18q5NkBKl3RKc17JQAS5SdnoKdS
         4nexHdjKb9b55xxqG/yoca6Nv33L6xPIPb6KNrvflb7rhCxsWrvpijyM1lLpqNa0Y+Ay
         6PmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjGj1qNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a11a800b00787a81545a0si5186442qkk.80.2024.02.26.08.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjGj1qNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redqa-0001W7-QL; Mon, 26 Feb 2024 11:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1redqY-0001UE-SC
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:28:54 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1redqX-0002UV-0G
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:28:54 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so4261368a12.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964931; x=1709569731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oEkng3ZE/vlKyJr1xJbRI5B7Go9cYFsY9HcbjAsbMbY=;
 b=SjGj1qNs2ScTSqDbNlp4sIeHbrkSAui31wWSOSWwsPVtpb061l9jzSB7Y5m8HTcfdT
 iEr8Oau+wbtFtMdF050e8WPkTNJcc79a4CjuwGNTV7HFYSLytlXzCMP/Gm4yZXhfHaaI
 4vSq5SRwOXkBH9aJ8VGOBY8OPKpLnOZLOLRFyv7ksbKDrdx2UYQojV0yJqmNeYpOek0I
 Ly4Yf0oPAw50FEjmS0nL2HYhs3xBE3WtvF6blBWOEHfZSuyGtv395rtCOQpUqSFPmAEt
 6eBNgCfgY2DQBfpjc8QgRfevDBlWmUG8vFZl42BMm4Tzk0mNQdsuBA7PmTkQAIDoqyjG
 fRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964931; x=1709569731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oEkng3ZE/vlKyJr1xJbRI5B7Go9cYFsY9HcbjAsbMbY=;
 b=FmRriSGhzXnByN+KqEqbwwtXLm+CSmRH8/MjIY6msS+/Z30FD4nPKyuQk9pO59cyt/
 wYFZVQdaENHxJ5ZwiHfvwN6HdXQkE44J3ZEcE4zYUYAKUB6N1quY1oroCfFurFHI9XxA
 sHkOc6ePG9BzL6laa15mHHUIDQKZ1ZvZ6LuM7Nh7BMrGxIOZjTIJlseM5W1yU58CMYPM
 LK3e2st1im68h4VB/yGYYnA/Ca0mdwG4PApVSigNAQSYSbu4O7yBDQKLL6+Z0npYGCSr
 8Oy5mMZXjZClUUaAmYzm8Yn4PL2glhQe2j/F42w/NGLnogg4uqUyfb+8NNcR8YYRtu7S
 3+Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+1u7n+dgPNhHJPAZCJZ9OSlG5vGWgYm8TuWCeB6EQTjDewKnMgZ9cQhzhgppM/mHn3UDwrKRsn8KE8kpZxm3LtB6n
X-Gm-Message-State: AOJu0YxE8o/YH++Ba7QpPBG44Zq7Thm+xrrIk1vEmuqyR8AZzKT9Nr1a
 ooSW0XkM6Xm+T8a4IwYz2mS68yBPw/96IFYSDQl/TOsgcOjVxd2Ba9jZvp0nvPI=
X-Received: by 2002:aa7:d14e:0:b0:566:1683:6370 with SMTP id
 r14-20020aa7d14e000000b0056616836370mr1113277edo.19.1708964931349; 
 Mon, 26 Feb 2024 08:28:51 -0800 (PST)
Received: from [192.168.69.100] ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 bo13-20020a0564020b2d00b005658186279csm2431258edb.18.2024.02.26.08.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:28:50 -0800 (PST)
Message-ID: <c1462a44-a5a0-46b6-8312-7cd1a7962718@linaro.org>
Date: Mon, 26 Feb 2024 17:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/41] Add BCM2838 PCIE host
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-15-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226000259.2752893-15-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: DEH+zWYP8icz

Hi Sergey,

On 26/2/24 01:02, Sergey Kambalin wrote:
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>   hw/arm/bcm2838_pcie.c         | 217 +++++++++++++++++++++++++++++++++-
>   hw/arm/trace-events           |   4 +
>   include/hw/arm/bcm2838_pcie.h |  22 ++++
>   3 files changed, 241 insertions(+), 2 deletions(-)


> +static void bcm2838_pcie_host_realize(DeviceState *dev, Error **errp)
> +{
> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> +    BCM2838PcieHostState *s = BCM2838_PCIE_HOST(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    int i;
> +
> +    memory_region_init_io(&s->cfg_regs, OBJECT(s), &bcm2838_pcie_host_ops, s,
> +                          "bcm2838_pcie_cfg_regs", BCM2838_PCIE_REGS_SIZE);
> +    sysbus_init_mmio(sbd, &s->cfg_regs);
> +
> +    /*
> +     * The MemoryRegions io_mmio and io_ioport that we pass to
> +     * pci_register_root_bus() are not the same as the MemoryRegions
> +     * io_mmio_window and io_ioport_window that we expose as SysBus MRs.
> +     * The difference is in the behavior of accesses to addresses where no PCI
> +     * device has been mapped.
> +     *
> +     * io_mmio and io_ioport are the underlying PCI view of the PCI address
> +     * space, and when a PCI device does a bus master access to a bad address
> +     * this is reported back to it as a transaction failure.
> +     *
> +     * io_mmio_window and io_ioport_window implement "unmapped addresses read as
> +     * -1 and ignore writes"; this is a traditional x86 PC behavior, which is
> +     * not mandated properly by the PCI spec but expected by the majority of
> +     * PCI-using guest software, including Linux.
> +     *
> +     * We implement it in the PCIe host controller, by providing the *_window
> +     * MRs, which are containers with io ops that implement the 'background'
> +     * behavior and which hold the real PCI MRs as sub-regions.
> +     */
> +    memory_region_init(&s->io_mmio, OBJECT(s), "bcm2838_pcie_mmio", UINT64_MAX);
> +    memory_region_init(&s->io_ioport, OBJECT(s), "bcm2838_pcie_ioport",
> +                       64 * 1024);
> +
> +    memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> +                            &unassigned_io_ops, OBJECT(s),
> +                            "bcm2838_pcie_mmio_window", UINT64_MAX);
> +    memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                            &unassigned_io_ops, OBJECT(s),
> +                            "bcm2838_pcie_ioport_window", 64 * 1024);
> +
> +    memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
> +    memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
> +    sysbus_init_mmio(sbd, &s->io_mmio_window);
> +    sysbus_init_mmio(sbd, &s->io_ioport_window);
> +
> +    for (i = 0; i < BCM2838_PCIE_NUM_IRQS; i++) {
> +        sysbus_init_irq(sbd, &s->irq[i]);
> +        s->irq_num[i] = -1;
> +    }
> +
> +    pci->bus = pci_register_root_bus(dev, "pcie.0", bcm2838_pcie_host_set_irq,
> +                                     bcm2838_pcie_host_map_irq, s, &s->io_mmio,
> +                                     &s->io_ioport, 0, BCM2838_PCIE_NUM_IRQS,
> +                                     TYPE_PCIE_BUS);
> +    pci_bus_set_route_irq_fn(pci->bus, bcm2838_pcie_host_route_intx_pin_to_irq);
> +    qdev_realize(DEVICE(&s->root_port), BUS(pci->bus), &error_fatal);
> +}

Something is odd:

(qemu) info mtree
...
address-space: memory
   0000000000000000-ffffffffffffffff (prio 0, i/o): system
...
[DETECTED OVERFLOW!]     0000000600000000-00000005ffffffff (prio 0, 
i/o): bcm2838_pcie_mmio_window
[DETECTED OVERFLOW!]       0000000600000000-00000005ffffffff (prio 0, 
i/o): bcm2838_pcie_mmio
         0000000600000000-0000000600000000 (prio 1, i/o): alias 
pci_bridge_mem @pci_bridge_pci 0000000000000000-0000000000000000
         0000000600000000-0000000600000000 (prio 1, i/o): alias 
pci_bridge_pref_mem @pci_bridge_pci 0000000000000000-0000000000000000

