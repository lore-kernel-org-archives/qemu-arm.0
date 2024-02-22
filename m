Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp90734eja;
        Wed, 21 Feb 2024 23:57:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPKS1wbQpFyjB2tzG0LRhMEMUu9yjCuABt5UxSrDZGBz5bT/0rOkr01vJy1Z34YnfLo/V6QH/5ZCIwQGtoZWXAzEeFOTRa
X-Google-Smtp-Source: AGHT+IHYsXJPBPnQCyG4yf8pDqkwsUAMqdreSlyYKbdRXt0SBZR9DmpKHpdpN3gaIB1qe7rLvY+j
X-Received: by 2002:a05:620a:2804:b0:787:8545:80c2 with SMTP id f4-20020a05620a280400b00787854580c2mr4845931qkp.69.1708588642061;
        Wed, 21 Feb 2024 23:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708588642; cv=none;
        d=google.com; s=arc-20160816;
        b=HvNBqStbxZRdbzdlc294n7oYukEEUqw5mQEhJZi7tfGG/zSTpxUSSC8i3Z/k/oEHCa
         TKpcRaXtJnaeCr2t61UcMKLQ6ZkAUVAR1tWymYm1BvfDGRghVncyXGX06S6U9z7sZn7n
         zpo6Fk61wD9sFVc0We8VNUiw60HRD/2h+d3wAt1WqJyWRqq6kgq4mQMm/yl8Ytx7HxHA
         sAGqzQIfo8/WheKXfxQ7N5mLuxjgUXig+0rDQ0ToM9n3Z3AaRfC+RkN6Uojeyjgb0o7L
         B9FCkaYP5xkVv0o0+6MZZBzGEUzOwT3l6Wo95sLE2bDN/zni0H0RDOzeTL9c5UlinGaE
         KT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D17irSf/U4JZXEZRBRyY2WFC9+zjHUToxM5yrrVq2TI=;
        fh=PeI/PhobCw1V7Z1w9bsN+olotAYLeYPnUPw4tZaqxo4=;
        b=RNOHQQJYHFPRO/OQQw3YzIENGNQyXdNcpkWJGnkNb5L2e3ipnDSGOCwCjqpy4jOlhG
         jk+a49PC82PFGCttCMDajz5Wq3NinIZDHfdFiJZKr8WmQAxZTp2Alpi269LCXMopL6Kd
         CUG9tZppgNFHcM5yWJraW1xNPdyhTKSO2nXpF4MKgDKbUsZdrtbUtceuDIzD63XpbhG3
         S12gHeVkvj9CrnKxe36tjMveILn8xHei8Y1pkBrnUn0Z16PqyP5QTc036zMLT6/Gbp9J
         R4YdxwRfYmVBjXORQmPQLKw1BOqdYfr3dFepfPW3+CiflUBDKgc4v3FJVHWhy6ndiZYI
         e/Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCco5Pcd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020a05620a07f900b00785db113c66si12320462qkk.123.2024.02.21.23.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 23:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCco5Pcd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd3xB-0001WG-Hz; Thu, 22 Feb 2024 02:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd3x9-0001VW-Su
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 02:57:11 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd3x6-0005T0-RQ
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 02:57:10 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-412730c6228so10774335e9.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 23:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708588626; x=1709193426; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D17irSf/U4JZXEZRBRyY2WFC9+zjHUToxM5yrrVq2TI=;
 b=OCco5PcdYncicnvallLKaByHMIyPRGNRgHIT4xC2z94TEh2TxeyKJnNtueeIHdBxN2
 Y9FwNwG5sUshHUUGB0BPOG47eIrFhcHKUi5K8SSzpgNUrfvWgoVg2DLWa/aKSmncDGAb
 HDx6paNzgxQeGG+T1Q94aqVdkzDkuLIAveIgI2fYs0cVL/PUp63ZghqXyr5d+2U4oILU
 SzZr5lB0HETh3EQ6KyDZKT3ugsNuHUQBm6qVF5L7p/P28FI70m0ujKiu6cahVeVxAttc
 xqImgy2o1Zd/PSHFA8ohscx2fkWy8KhOGIw1Fiac1EadwSkya2VwDsQ+9i9eeqtnIbM0
 NI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708588626; x=1709193426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D17irSf/U4JZXEZRBRyY2WFC9+zjHUToxM5yrrVq2TI=;
 b=XuXgeZYKDPK1QhDZ3Y6kYSOrlf3Y1XMsT2Dif7zg3BcnQr7yRECS2D2BSYYD4Si3le
 fVK86N5EvZ178by1dTA0qdBSABoi4ZEr5a+5Ihhdzy6fKEJCLjSXFZwjfaZlSMHERYc/
 zMVqrF5VX3GXinOhRekgyKR5rnHvZ5odrl5PmNxAYDYSnrk8n+TW6+adWEcV4rFKVgro
 7rIVMdb4xSk36lM60iZYMVjFWzvOXmSYEmOewL/FrYtYKPHOu5eXSk/w5QADH3f04wui
 nOYxPrOpkTSwbP1gpyUiePVgGBsula/lVOHEQvAPW1tMy9BBRh3uyvNarOqkV95FS9vJ
 WrVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/hgrQN7bCVzCQyF0Z2cx4FNyJtdG+wYkMhgEQYAMvYVux4HT5M3w0gu7NL605/rSsbwHyVm52h3YaQGWBkm9QkA/9
X-Gm-Message-State: AOJu0YxrlGZ1q8LZFFhts1sVesQduAWD95EJTPUnReHBI5Tpr9ioMA8c
 m4z4OLgZ2Kzby7ldzD9uE0buJvdEwdFwZBy7us+HWH+vo/89jI3HXZyAKdphXks=
X-Received: by 2002:a05:600c:1988:b0:412:6dd7:1d44 with SMTP id
 t8-20020a05600c198800b004126dd71d44mr5327431wmq.17.1708588626458; 
 Wed, 21 Feb 2024 23:57:06 -0800 (PST)
Received: from [192.168.184.175] (41.red-95-127-32.staticip.rima-tde.net.
 [95.127.32.41]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b0040ecdd672fasm21184179wmq.13.2024.02.21.23.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 23:57:05 -0800 (PST)
Message-ID: <a1f44a85-b13e-4ab8-aea6-94200637c836@linaro.org>
Date: Thu, 22 Feb 2024 08:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/Kconfig: Fix GIC settings when using
 "--without-default-devices"
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20240221110059.152665-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240221110059.152665-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: WeVuu8eyWeJ6

On 21/2/24 12:00, Thomas Huth wrote:
> When using "--without-default-devices", the ARM_GICV3_TCG and ARM_GIC_KVM
> settings currently get disabled, though the arm virt machine is only of
> very limited use in that case. This also causes the migration-test to
> fail in such builds. Let's make sure that we always keep the GIC switches
> enabled in the --without-default-devices builds, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/intc/Kconfig | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 97d550b06b..2b5b2d2301 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -12,10 +12,6 @@ config IOAPIC
>       bool
>       select I8259
>   
> -config ARM_GIC
> -    bool
> -    select MSI_NONBROKEN
> -
>   config OPENPIC
>       bool
>       select MSI_NONBROKEN
> @@ -25,14 +21,18 @@ config APIC
>       select MSI_NONBROKEN
>       select I8259
>   
> +config ARM_GIC
> +    bool
> +    select ARM_GICV3_TCG if TCG
> +    select ARM_GIC_KVM if KVM

This is odd, we usually 'select' dependencies.

> +    select MSI_NONBROKEN
> +
>   config ARM_GICV3_TCG
>       bool
> -    default y

Don't we want instead:

        default y if TCG

>       depends on ARM_GIC && TCG
>   
>   config ARM_GIC_KVM
>       bool
> -    default y

and:

        default y if KVM

?

>       depends on ARM_GIC && KVM
>   
>   config XICS

