Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2197736njb;
        Mon, 7 Oct 2024 14:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrG/jXxZ95ombt8C+0grTm6JhuDCN4SBd8TnkWnHS2onje1YkPThL2t6E7Dxg8LbT+qUfzqzWnUBVPZw==@linaro.org
X-Google-Smtp-Source: AGHT+IE5+KMegbFbl/UMaC08iwWSI3xkVAIIYSEFbhsaXAmbPA8wv7sF/TI/euc0CTf7zdXheQhc
X-Received: by 2002:ac8:5d42:0:b0:45d:5785:e388 with SMTP id d75a77b69052e-45d9ba4bb34mr219183061cf.17.1728335614092;
        Mon, 07 Oct 2024 14:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335614; cv=none;
        d=google.com; s=arc-20240605;
        b=SHNNRp3EHP+OPzQ/sRDfzygQF6K2vpkqDa9Esfrp85k2OCFkg8nfaK0xcp4FevFoCn
         lg8k8sMCq9K15SlNeK0cB0BNZmjtBqGBKl2UpHxIIeidMlkLYekxRWz4ty58CyxMHeiD
         tzcOKzGTcapA1QFmHy6u0AlzEa3kqUoy3xBovJ3MCRR7QcjzemtN1amOZlQ7upuuGQR3
         4KnF6A1fF7TZeQDuHVveYH7KBeBiXno/DGvCLaRugg5krDX9jMP+pVPJNpNLa+M7DU7b
         pfEAVMshkJb4bLH8w13fOCkkJGvBwWOMqSnl8C4uKqSWQUg7gBBCajkX3/22SJKLMgZ6
         A9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=r/bJEglI2GQMK/HVXY2j7Vewahl+B7/H5ox3hZJZE5s=;
        fh=9s/iLSSjJDkD5hM5ItBW0wahjQ94W2iH0B7jGd4xXG0=;
        b=DkTEjnzPMyCD094dFmCNepj0o2dCwSwAMGJlXPCmbiWKH6d72hku3a0uKJW8gtwPr2
         yCyoDxGpAhxISMWVj1NihHxnE5HGy9+t5Y8IAQSEWtfh6+GcnA35pKMkQEUM8ydOuSKC
         gD2q4zuikUT96kGhaIc/eS/fg6rWKg/igYC3xmW7U3qH9YVLf2wiL8oS2+NTcM3R5ww6
         nWeLWgpSrloWmFgxiTRqOBpR+kgJE2f6qC4JphimdGEmYV9ZytCxmboOtIO2pK1Y5wEK
         Y0FnC9RGtMw1Vz0GuBK0wp1LvO5Oz3F2C1bNhqxd9E/ruAp0THm6baYjlLl8+I6tLYFC
         WpuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ni6i0+Jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da75e2651si72504121cf.376.2024.10.07.14.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 14:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ni6i0+Jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxv2p-00044P-0C; Mon, 07 Oct 2024 17:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sxv2n-000442-1Z
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 17:13:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sxv2l-0000UQ-KA
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 17:13:28 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20b64584fd4so46452705ad.1
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728335606; x=1728940406; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/bJEglI2GQMK/HVXY2j7Vewahl+B7/H5ox3hZJZE5s=;
 b=Ni6i0+JfsK7E6u1EikbVkVlfdlbDSqsIDMGOjjtUlmBHd9CS7z8NlvgzKKUPUUGAjn
 YuD0JZs7/PhTGplHtCOH/c8G6tCnV+IR+EwBg9Zn9zAPwRGWp+HbEjAwIR+4Ht0N29YA
 XJkSn1H8VkapBB+pWfRtm8DIt7IenPEUQJCSXs+ehj7DaUlvKgoIQT9Q/GzvRWfr+97Q
 X7mTbCG+Tvjvgpgo9OlsnTg8UEVZjHYwXYSgst4Ss7cE7bdkm1VriJRocBVVLe08toS1
 HqI7Yr9gchRljlv1HQL0gjaNcnrRx9FvEBaOcYCyJWxif5n6fex5MC1ic50gh3YtLPQI
 72JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728335606; x=1728940406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/bJEglI2GQMK/HVXY2j7Vewahl+B7/H5ox3hZJZE5s=;
 b=xOiVX3Wvw6XsctVh+PIshYrXb+HW4O8Vex3EKk0R+Vtt+tMJIpXffjF9w5b0Qru9IX
 GZD2oJukdSRMywdJKt7KZ/7gNWCe4yMqIhMJL8PqkgYe0fXCtbdwlGDrERptnJSNK3hG
 SUn2D+d8NWGl+jRkkwb1lvLxWtVhG6k9CvVSZC79zuLnVhwMLUh41VZdW6vIGkwRXTDk
 8QBbf5mWbXMpu5DEo0p1lNYmojQdIfMYYxZZhAFq5NQmwmimFAZqrp5rbgPVNg0gnLs1
 HGl5MkxgTUREeDjUn4fzoNesUlwJstnx7x8G+Oh6FqeoynoCESmjFRCmdeVBjY8rF098
 Uv4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW9SvLsW+eEh+o80Q0qp6VmqjJYTzDlg2/MOumU9z5ORQcTUqI9IDmLw03j2CWH2COv+gKpmkBJA==@nongnu.org
X-Gm-Message-State: AOJu0YwF8syTn3GebUYEwP/H2pUxCPgcMKaUsFPLWYseVLbJCj2857JD
 XSp1vbFlZJ4tl8GwIl+o1n5ckOQKA6gp43XsCL9+4Qi6+33Sf2dusCCoCI+122Q=
X-Received: by 2002:a17:903:1cd:b0:207:15f9:484a with SMTP id
 d9443c01a7336-20bfe061a46mr167915935ad.15.1728335605849; 
 Mon, 07 Oct 2024 14:13:25 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c13988d0bsm43574295ad.262.2024.10.07.14.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 14:13:25 -0700 (PDT)
Message-ID: <d094728d-a7bd-4e16-b3c1-82065ca9bf08@linaro.org>
Date: Mon, 7 Oct 2024 18:13:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hw/ppc/e500: Reuse TYPE_GPIO_PWR
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241005100228.28094-1-shentey@gmail.com>
 <20241005100228.28094-3-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005100228.28094-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: TLn87Mpt6plv

On 5/10/24 07:02, Bernhard Beschow wrote:
> Taking inspiration from the ARM virt machine, port away from
> qemu_allocate_irq() by reusing TYPE_GPIO_PWR.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c  | 16 ++++------------
>   hw/ppc/Kconfig |  1 +
>   2 files changed, 5 insertions(+), 12 deletions(-)


> @@ -892,13 +890,6 @@ static DeviceState *ppce500_init_mpic(PPCE500MachineState *pms,
>       return dev;
>   }
>   
> -static void ppce500_power_off(void *opaque, int line, int on)
> -{
> -    if (on) {
> -        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> -    }
> -}
> -
>   void ppce500_init(MachineState *machine)
>   {
>       MemoryRegion *address_space_mem = get_system_memory();
> @@ -1086,7 +1077,7 @@ void ppce500_init(MachineState *machine)
>       sysbus_create_simple("e500-spin", pmc->spin_base, NULL);
>   
>       if (pmc->has_mpc8xxx_gpio) {
> -        qemu_irq poweroff_irq;
> +        DeviceState *gpio_pwr_dev;

Can we keep a reference in PPCE500MachineState?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   
>           dev = qdev_new("mpc8xxx_gpio");
>           s = SYS_BUS_DEVICE(dev);
> @@ -1096,8 +1087,9 @@ void ppce500_init(MachineState *machine)
>                                       sysbus_mmio_get_region(s, 0));
>   
>           /* Power Off GPIO at Pin 0 */
> -        poweroff_irq = qemu_allocate_irq(ppce500_power_off, NULL, 0);
> -        qdev_connect_gpio_out(dev, 0, poweroff_irq);
> +        gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
> +        qdev_connect_gpio_out(dev, 0, qdev_get_gpio_in_named(gpio_pwr_dev,
> +                                                             "shutdown", 0));
>       }
