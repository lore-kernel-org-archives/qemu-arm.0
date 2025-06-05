Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp14847njc;
        Wed, 4 Jun 2025 22:12:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5QitHjoUrvMWtBKdWF6j9xIp61ZY+bmLKWcjgd5wknNmbYLdc+1meOk8v+CQ7TYmHYlRV0GMjRNaCBA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0WYbYoQ/Q5w1Ly/f9ddwg8ErvY0ag/CAq0uGSs7Vu35qynXszzI3S+hruRs7Mq3VQGL+x
X-Received: by 2002:a05:620a:2608:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d21988b6dfmr876444485a.18.1749100339954;
        Wed, 04 Jun 2025 22:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749100339; cv=none;
        d=google.com; s=arc-20240605;
        b=HCd8/Ajl76NZ+OrKEEHz1YWzsIW0rnHZVKOYpzoMwWXcchg6Gcj/ZPJAunIJNCbj3a
         W4BRF9yrQM0I24zxPvlKNlDuBESePpXLqpUwjW9X6tRhIvoXaSDtJG16ZpNtZ+QN+e5L
         B1HoQPysF4/PHT6pGrbBiD1V1Sf/UpcEkcne24NC4PJ36j8eEvsQs2Dg4tvkq0aTXNKY
         q6n0H3geKJrIqiQh40MyCADVlgeJKaP1NNMdtzWMjb8NtoiPBE74Pt9thhYGHdealIQC
         uKYFDj8qDZ8jGl41V/TFjc3fOPtO1ZiOCkPpG/WYp825s1Rw/yJ9zY+TKwA6zscB909u
         S2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b7H6tai2vwhMMTZPKeAKNG0qd+0DBDEG1dLIPfX5fos=;
        fh=pBmY7QrQkR9LcRwTp/ULjeyIFk+/q5hrbwZKQvmrzaY=;
        b=iPVWic1zci8SwiR3sU4n6sG8Yp+eoq42mVKL6PrIRNfxmPoGBiL4gjX+cEcKM/+A30
         zoN7+YV4kpCwE8Qcr/XZUweL9/mgtt6YfMit3h1kKKe/SzGbYGxLL8oT2I+C9QqwIn62
         5LiEbm7XEVNO2zxHTZ/CjXMhxi362P/98/cBCjOLqXzxZ1s6nxalENk1GHaHjTmyMKLS
         +FhVLHz3Nb4w3Y5XluJ6VufKY1drN4CgTuVU+t8KzQlbgYMVh3cr8KMIIISiOrTyu3XD
         wQi9mJJbmO7zV2QY6Anlnk8km4kIa9IR51pcG+Au107CstLQ/Vma0iLPKyACn5D3pjlv
         qRSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zZF8U8R4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6e8d64asi175030586d6.329.2025.06.04.22.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 22:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zZF8U8R4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN2tb-0004TA-PV; Thu, 05 Jun 2025 01:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uN2tS-0004SN-28
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 01:11:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uN2tQ-0002NC-AE
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 01:11:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so3875205e9.1
 for <qemu-arm@nongnu.org>; Wed, 04 Jun 2025 22:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749100314; x=1749705114; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7H6tai2vwhMMTZPKeAKNG0qd+0DBDEG1dLIPfX5fos=;
 b=zZF8U8R44x0WwFu8fqRYRM0g1dkSG0+/47/nFfnpPNFc2F+GhU9BottgXVmhYwBNBZ
 A5Bxwu3odViUAcb3hMc0HCMRMMZ4tk/fsXe0guscu0d9N+YVIKXOKKwI+gPpHKIjzYRE
 KmoAARTrlxzhVckw5sHUbpQ4McAFaYygQNJxVWh/DLeal5MCOcQlAAsIHcR4Vlsi8mUI
 LFAQeZOYCpGi8a1liOEWVVBMf3U6oP+066hEASHeugqRXe7L5XRni4WidUmqSdkqWwy/
 3R29bhNogYtKip5FD6viyejmIVz7VkfLjQRJI6HazRN5kz98U5CRqUwYZWt0HKyo70VP
 Kpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749100314; x=1749705114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b7H6tai2vwhMMTZPKeAKNG0qd+0DBDEG1dLIPfX5fos=;
 b=HEMaW2oovPw1msPjL0Ky51eyNx5nWaXck9Tg0stm/fRijkw2kdueysV0nTVDqnMuwB
 hEjfJdAlPhDAspl/n0Wo0W0+Wb8Buq9cHwXPnoXtJCJ32SCSs4ZJfOsqy4lXMhzy9vKt
 3sBn7ssiB+inYzRE9wuzabutCIJ4U8zRmqcXDlTCetzJ7glDladAo4myMrJp2Z2Esa/l
 ZBD9VnIo7UpjC+QoliBMKyVNw1/kM8k8Q/q/gyZ5rniSE/idIN6ODGd9XwWsN55EE0ut
 s+i9CPDX06k/DP4tX4APgCkCyuBt5mAREAEU+S0rGPqMcovrKwfKPY/2Y873w/lEoqhO
 Y/dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLhKYY8MkbsjyM5wJE38rnUBMH2X/FgRJvBa3s85nkbYOsfjamnRyNBKRYoMGAygylvGkhgQavCQ==@nongnu.org
X-Gm-Message-State: AOJu0YxwTCzmpGk2Fq33Lh4IVMclnvkAc1i55ujE90W9sNuN3d6dQVvC
 mfpTADL1Ei6WxYuI6YnjJEQZ6u5gz7kq/VOC7GuxbP5L1Eh9lqR2x36APTGq6kAPcF8=
X-Gm-Gg: ASbGncvz/DwPew9YKq/Uw0+Ir5ybd5gdKhrE01KOAMEUTOS8IEJZYWqQdgaSm930sbU
 HXHOIo9h4Tenvd53T76IrdHgdgA/3Rcy0meONRpsvDyeUsushccdVD3wgqmmU0clOEew2Q/0MWO
 O8KQ33v19U0iHbUQHdGNlHFWdczpICtXe5yhq9vT5yHeiTo1E/egqXz+4JurldqIyDd8ML93Sfy
 Zyh5rmF/s3lzHlTYPpGV8JGWHVvobD/NyDxeyqXBQJnjxduj//vDWFtLhQmvHrN/vW7WUupdXqX
 pkZxTe22PcHvyk+uV5naASRjtIxqRxgXmkH7L0QYGCzwSKmh3Kh8F90O6X6Ii1WtvlYk05U7GO9
 Aqie2V9abm2dlmYNTuO2wwoPmKbRt8A==
X-Received: by 2002:a05:600c:b96:b0:441:d43d:4f68 with SMTP id
 5b1f17b1804b1-451f0f4f1c5mr47350685e9.15.1749100314574; 
 Wed, 04 Jun 2025 22:11:54 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f97f797bsm12009995e9.1.2025.06.04.22.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 22:11:54 -0700 (PDT)
Message-ID: <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
Date: Thu, 5 Jun 2025 07:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ramfb: Add property to control if load the romfile
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org
Cc: Eric Auger <eauger@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250605030351.2056571-1-shahuang@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250605030351.2056571-1-shahuang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: kpAboj6nPxKW

Hi Shaoqin,

On 5/6/25 05:03, Shaoqin Huang wrote:
> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
> the x86 need the vgabios-ramfb.bin, this can cause that when use the
> release package on arm64 it can't find the vgabios-ramfb.bin.
> 
> So add a new property ramfb-romfile in both ramfb and vfio_pci device,
> because the vfio display also use the ramfb_setup() to load the
> vgabios-ramfb.bin file.
> 
> After have this property, the machine type can set the compatibility to
> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   hw/display/ramfb-standalone.c | 4 +++-
>   hw/display/ramfb-stubs.c      | 2 +-
>   hw/display/ramfb.c            | 6 ++++--
>   hw/vfio/display.c             | 4 ++--
>   hw/vfio/pci.c                 | 1 +
>   hw/vfio/pci.h                 | 1 +
>   include/hw/display/ramfb.h    | 2 +-
>   7 files changed, 13 insertions(+), 7 deletions(-)

Simpler to directly pass the ROM path instead of using a boolean,
so board (or CLI) could pass path to non-x86 rom.

> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7f1532fbed..bfdf365978 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>   
>   static const Property vfio_pci_dev_nohotplug_properties[] = {
>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
> +    DEFINE_PROP_BOOL("ramfb-romfile", VFIOPCIDevice, ramfb_romfile, true),

         DEFINE_PROP_STRING("rom-path", ...);

>       DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>                               ON_OFF_AUTO_AUTO),
>   };
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index d94ecaba68..d567de8f10 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -177,6 +177,7 @@ struct VFIOPCIDevice {
>       bool no_kvm_ioeventfd;
>       bool no_vfio_ioeventfd;
>       bool enable_ramfb;
> +    bool ramfb_romfile;

         char *rompath;

>       OnOffAuto ramfb_migrate;
>       bool defer_kvm_irq_routing;
>       bool clear_parent_atomics_on_exit;
> diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
> index a7e0019144..172aa6dc89 100644
> --- a/include/hw/display/ramfb.h
> +++ b/include/hw/display/ramfb.h
> @@ -6,7 +6,7 @@
>   /* ramfb.c */
>   typedef struct RAMFBState RAMFBState;
>   void ramfb_display_update(QemuConsole *con, RAMFBState *s);
> -RAMFBState *ramfb_setup(Error **errp);
> +RAMFBState *ramfb_setup(bool romfile, Error **errp);

   RAMFBState *ramfb_setup(char *rompath, Error **errp);

>   
>   extern const VMStateDescription ramfb_vmstate;
>   

