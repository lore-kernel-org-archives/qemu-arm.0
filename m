Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1088575ejb;
        Thu, 7 Mar 2024 03:55:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlVRLFXFAfFHvvMXZTsYh2oWq5urVTLmc/035liqVa2vcp8ji8AZF4Q2jHLnOqC6bvWFpz6TuJP9KaWQeKULWP+S2BUKZ8
X-Received: by 2002:a05:600c:3509:b0:412:ebce:aa81 with SMTP id h9-20020a05600c350900b00412ebceaa81mr5872457wmq.23.1709812551631;
        Thu, 07 Mar 2024 03:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709812551; cv=none;
        d=google.com; s=arc-20160816;
        b=OKbzbYXigZltS5oawbKDe+19KrG4ODQFL5Q3yzTPndC05D6YkgitZkM/7tbBjXLMBP
         fgqXH/WAsCnXKJRvqd7edivo1JUMyB7yGC59baaaX++TuLOr6xv3F/q+y3/WKQNr2spR
         3N86Hu8zayiIRF95DweI+aETnyixwZt+lbsP0YpZYWcBGK+EG5SQAu3Hai4OIosycZs7
         44b65edIXB26qOcaAyqLbxXag9cIibhbgxp8M1AmIb1Zx/ymoSOos2z0qJZfuA9F+tie
         PMLEAeaxTDrjVJVGNGI/c+kw9EkKxFgkffXJ98JbMH1s0Rp2zgYw36xu9Hq91L4ScmZV
         NpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=S2WmJe5+VMgo3q0Y6DtKVBoMQYi4KEJJ63YECSnGdAI=;
        fh=4qqVrL1irEUDbfX1+gPJnpkET4KtklmzRqLoyoWcOGM=;
        b=UJUeSrqrZ8tP0EqXPBfEy70DDyR20vXu/ZKblSjGIHC/R51bs7H2fI95CJjZfWSEJq
         w15/vje60B9WQnrBgYLbH1AdFnTjKlRWArTP73zKerlJ36E9Z0b9o3X8/GmOZ3VpIA8l
         ya8z8EeTLWxVrrtXk1POVur757DYUFjYUPWb1yAYsC1JByDcnykKGHt+9kDwn70Iox0g
         eYuCYN0YTTTzG6KaOYtbYv++hnAMEoWlgAEIiQ2R5qE69xJs89REy9DG7Jgd/mUUnXa0
         46jXFLQWl+vNjnUv8ushnRpqFIrQ2RJZvka3SP0kARmkleF/t3rSHeak92EjadWVo4ZA
         EqrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=odznCFAa;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m28-20020a05600c091c00b00412f81f6412sor1002640wmp.8.2024.03.07.03.55.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 03:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=odznCFAa;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812551; x=1710417351; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S2WmJe5+VMgo3q0Y6DtKVBoMQYi4KEJJ63YECSnGdAI=;
        b=odznCFAacXR99IBLymobDxwbemeGWkiAVso2ugZSFGa87WhPIWGdq8roshHooGT48j
         p3GwC9gRvfDBiPm46ODqyMdbacMXwJLhfw3Q62Uh111sSjPyHL5CEabae2PDTL/AcehD
         ZJ2dt4dtIBjjFIhqwrmeS3n0JAAgl+dHarGRiOqsLyZ5vVeo1egqey2MgIiOSKwGRgZn
         oo4WhKSa1ay6PG5zRxeWfO5YTPkJ5IVdD44C/3EyyhqQ8CmD6kro0i7Dbry2WCrqEWxK
         64OggowM/JOVqmS3sJA3+WsSfmXDpczfAlkKTGhOFNxtMFKJb664S+MjhlG8J5czIRr+
         3zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812551; x=1710417351;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2WmJe5+VMgo3q0Y6DtKVBoMQYi4KEJJ63YECSnGdAI=;
        b=DAsM37kREpSqP6vMwDRxB9I7XAs/okFpHZr+3Cm2aQj+PkImwmukfe/Rbf614fIsTN
         qFJAAX/Fns8GHQ3AFRwZzLF1lwBTrNxkQjAIFrZDDIuuGwjtzYgKFzG+Ah9gRTr/TLb/
         2mpKMa7kGYF3sTR8szaOkykl8fG11dBOA3kYDq/00rNH8cYffwNeLkHLEboa82hTx9L9
         Rde+GYyI+jbgtCyuO8uhwgpxrHT1NTXtD2D0ArttTvVxVq4KXV1K/8t1MgfVqw5F+1G9
         gl97yZYtbyCNWmkPKvX2tqB4SZot6oHN57Crg/PnIfmPH9mZe5ILH1yB6iFuzIklHw7o
         Qwfw==
X-Forwarded-Encrypted: i=1; AJvYcCUAykoXJvWP3HAwpu1Y7kZv/dRGUjcP1/BQPNWuMNAV0ar0+/QEU7SPIZ9gmZsBB7N5xVrUpSaVw9s3A1loNLrCrqdmKyu5
X-Gm-Message-State: AOJu0Yw3bkHAa649MSz6dWp/LLOSkbs/DFrkmRdjdwWc8u5LYmU1YJhO
	cCmAZeYmgcjKmwcYIE+z4rBUtJ9wCdcWwN+4LdQjPNtkWDo/tfkiuUqBhILYwk3WPA==
X-Google-Smtp-Source: AGHT+IGSeoRtR4+ZIJLregRqLFeBUzAzoogr8Ud+254lhRno0eax5sWI6+KhquUo7luhLcS/qDwyrg==
X-Received: by 2002:a05:600c:5247:b0:412:9dd0:f7e7 with SMTP id fc7-20020a05600c524700b004129dd0f7e7mr13265305wmb.22.1709812551075;
        Thu, 07 Mar 2024 03:55:51 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr. [109.242.224.101])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c35cb00b004127057d6b9sm2517388wmq.35.2024.03.07.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:55:50 -0800 (PST)
Date: Thu, 07 Mar 2024 13:54:35 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Bcc: 
Subject: Re: [PATCH-for-9.0 4/9] hw/xen/hvm: Expose xen_memory_listener declaration
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-5-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-5-philmd@linaro.org>
Message-ID: <9z7t0.nx533lxsltko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: MONS2Pre1ntO

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>There can only be a single xen_memory_listener definition
>in a qemu-system binary.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/hw/xen/xen-hvm-common.h | 1 +
> hw/arm/xen_arm.c                | 2 +-
> hw/i386/xen/xen-hvm.c           | 2 +-
> 3 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
>index 83ed16f425..0fed15ed04 100644
>--- a/include/hw/xen/xen-hvm-common.h
>+++ b/include/hw/xen/xen-hvm-common.h
>@@ -18,6 +18,7 @@
> extern MemoryRegion xen_memory;
> extern MemoryListener xen_io_listener;
> extern DeviceListener xen_device_listener;
>+extern const MemoryListener xen_memory_listener;
> 
> //#define DEBUG_XEN_HVM
> 
>diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>index b478d74ea0..39dcd74d07 100644
>--- a/hw/arm/xen_arm.c
>+++ b/hw/arm/xen_arm.c
>@@ -38,7 +38,7 @@
> #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> 
>-static const MemoryListener xen_memory_listener = {
>+const MemoryListener xen_memory_listener = {
>     .region_add = xen_region_add,
>     .region_del = xen_region_del,
>     .log_start = NULL,
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index b64204ea94..a65a96f0de 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -469,7 +469,7 @@ static void xen_log_global_stop(MemoryListener *listener)
>     xen_in_migration = false;
> }
> 
>-static const MemoryListener xen_memory_listener = {
>+const MemoryListener xen_memory_listener = {
>     .name = "xen-memory",
>     .region_add = xen_region_add,
>     .region_del = xen_region_del,
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
