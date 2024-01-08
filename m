Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2243778ejo;
        Mon, 8 Jan 2024 04:20:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgjZ9c7xrQdDOE8UNEDCoXjbP3yDTvguTph6FPLmpDu/OFhgDxXZcw1GkzkNPLjSnLJAd0
X-Received: by 2002:ad4:5c4b:0:b0:67f:4cf9:c9f6 with SMTP id a11-20020ad45c4b000000b0067f4cf9c9f6mr5173188qva.50.1704716444253;
        Mon, 08 Jan 2024 04:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704716444; cv=none;
        d=google.com; s=arc-20160816;
        b=t1XLQcWJQMrHbTVvk/WfRkajBeNImazRhHn5+2lGov4zuwEL0osXz+HYcb3fas/UDc
         I4C2twThCvG1WRKqU94mdz4TfLJSXP+df/epH9b9WQLLam2Gm5PiUWlcMiE2AXEERzyC
         Jt7Tqs4Q7oqYRWbc1vWzVN4KsFM4mFxpT2Uo0mhOD04wFdy+YS7sRxGhkPK4TE9vRrLO
         /xqC8R1KXb7t+XjVO65RE8taOKpcW6HrlahgfdY/j/5RWEMICdxC+XM6/dgwE9SrQR5U
         2edikI4mf1CrHAyNyuxi0YM32e+P8EeYloZBc/k74vcK/zbtjJer1F1DPcuZwm6/ixhu
         wUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Yjv7QhUyk1DBe4G4f2saIb5DXmOwx/nc3h5PoIHWUzc=;
        fh=2xjF/0vtNSXGM/zoD9/NS2VHW+5O180/7nfODC0VRXs=;
        b=MKjOTo4+mHtYDI6u3NxlQY9vTP+c+jDgYUzasdl+EkE1g68e6B5+DKXiY3Nw7eiqvC
         FcscbJZg/z+xoRV7gyBsyc0ioMOfR0tSjCB7A5nIxmRXbQrI/EOFCQ6WcdoRe34syX5C
         brC4HzIXqWb56VPVQpXU96qlw4fNfwmy6ri69rOY7IgYENpF3BzJsmbO7qsb+NeRWBFx
         PqylsGTq++e3aFNONoURQ4kfpHiEsJZ7NkpdzCkBa/nyLAMoOtTJI8gZIp4CskBFTqnv
         cUrXUPKoWdb6DROpbeiue3uSygORk5WWK5wWXWyfe6saHpeiIc+D9KPnSuaOfjKdFHHW
         ethQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X4RAZyrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a0cf387000000b0067f69b6e7b1si7879674qvk.558.2024.01.08.04.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 04:20:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X4RAZyrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMocN-000205-RB; Mon, 08 Jan 2024 07:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMocL-0001zK-5T
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:20:33 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMoc4-0005r4-Nr
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:20:32 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d8902da73so16195905e9.2
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 04:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704716412; x=1705321212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yjv7QhUyk1DBe4G4f2saIb5DXmOwx/nc3h5PoIHWUzc=;
 b=X4RAZyrI1AuPGgUktPFKKQJB2xQ8XFh86hp5+u6469pOhAKxIaxN3MqpEMgtPudUVq
 oxlp3CGeJBv0mhsxdqxtBZdrQeGV0HL2LQ5kiN0zTDJXgQtFQADrpmN0wP2ceed8iETv
 pqwB1w+v/AJhw5/voCXXEn94Z2Yuhp6wfsZ76qyb0YCrswTZ6F6q6qJCRyy4I4cPaODh
 IURrJ+JQ0cwrHBRqvdS8hHUK3tvaZ2eZEi5iCODlzW8kD4JdSkEDt0rjFMnLvUDPHXtn
 BFNj+IsTyB8fJNpZGdg3RZFcFhA+ahMTlM0l4wc5kjZN8l3mIbHMLIa2XwvZeNQbz0Fz
 fjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704716412; x=1705321212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yjv7QhUyk1DBe4G4f2saIb5DXmOwx/nc3h5PoIHWUzc=;
 b=UpYWphLAoQ2BTjRfBRm9Ib2wCwtjageEMzh4fHf9hUj5eGjUy3yPFy5/bFF5WUwVHR
 G6VvZdVlTJW6l9ja8rte2QUucfee3L34jT4WafZxRmlhJ3kgEVWRt8Z5c4bYoWNejzEa
 bpG4u8glqJxNOL0bPmIsZDtQKjwMG7VAJc2P4ZXe59TvRwWqN6vHKbSF5I1oJJfoWwi4
 R/JrROoGGD7v9BudTGaLT6Cqaum1z2eGF21PytWCre5hSbVjvrZH5DN9UYJrxxX248A1
 m+/jZnDF/aXE2wg2ezeNw2o7QS5ZF+AaQnFgycfTrQbGtUyBTFJ85hbYYkPwckWY103E
 K0cg==
X-Gm-Message-State: AOJu0YxxGkYnvoMycm7ErGITI204zQBQm4HBind4w+qcuLS4BQMVwUU7
 3mhAs5rGE4NTE/DFmxioaA3m1+Gr3ro61Q==
X-Received: by 2002:a05:600c:4fd1:b0:40e:3b47:eb71 with SMTP id
 o17-20020a05600c4fd100b0040e3b47eb71mr1962566wmq.73.1704716411804; 
 Mon, 08 Jan 2024 04:20:11 -0800 (PST)
Received: from [192.168.1.102] ([176.176.175.62])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c4e8900b0040e3bdff98asm8825124wmq.23.2024.01.08.04.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 04:20:11 -0800 (PST)
Message-ID: <f030dc08-f010-43dd-9aaf-e9b8048a8e43@linaro.org>
Date: Mon, 8 Jan 2024 13:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: add PCIe to Freescale i.MX6
Content-Language: en-US
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20240107165702.47819-1-n.ostrenkov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240107165702.47819-1-n.ostrenkov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Xnehp9JX/xWT

Hi Nikita,

On 7/1/24 17:57, Nikita Ostrenkov wrote:
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>   hw/arm/Kconfig            |  3 +++
>   hw/arm/fsl-imx6.c         | 25 ++++++++++++++++++++++
>   include/hw/arm/fsl-imx6.h | 44 ++++++++++++++++++++-------------------
>   3 files changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 660f49db49..575bb68c76 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -530,13 +530,16 @@ config FSL_IMX31
>   
>   config FSL_IMX6
>       bool
> +    imply PCI_DEVICES

This should be PCIE_DEVICES.

>       imply I2C_DEVICES
>       select A9MPCORE
> +    select PCI

Incorrect, should be PCI_EXPRESS, but this is already
(indirectly) selected by PCI_EXPRESS_DESIGNWARE which
you select below, so not needed.

>       select IMX
>       select IMX_FEC
>       select IMX_I2C
>       select IMX_USBPHY
>       select WDT_IMX2
> +    select PCI_EXPRESS_DESIGNWARE
>       select SDHCI
