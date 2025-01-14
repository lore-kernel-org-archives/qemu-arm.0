Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2410924njn;
        Tue, 14 Jan 2025 05:35:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxPq33LUHUbP0zrJw/UeqOy/ARqpDHOL3tI7hFJMCwIiFYwH/doaakqbv3psGvb0MjpnnGNs/t50w1Hw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZXXeEl/+/5xtekXMtGAHR4yjJ9P5yMnj5lCNrhbS8ALTVqqabHAr7EhDuXdEtwTIDI/MX
X-Received: by 2002:a05:622a:1999:b0:46c:7737:c51c with SMTP id d75a77b69052e-46c7737ca3emr395584181cf.20.1736861700915;
        Tue, 14 Jan 2025 05:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736861700; cv=none;
        d=google.com; s=arc-20240605;
        b=WJe0xHUjOIRHVTegJxPCwoEywmpB1hSF//Lupyf1/02eBRrAaMdoMbZ2iGm/d9D/wC
         tMFYeQzTZSrq5kLYgqjIUhsr7mshmuS+Y31uYNzwyy/I3NanbbfHEhPGJP6KgkNX4+B5
         5CX7jTtO2+kI/lNHU17gB5X1pu2sl5S7HWxBG/iufGISP27zqz+t+zxRtMBupwefKd3k
         VzKpeFVRud8bOJtWiYzPVUBH2lkjKpGr7xze6dz3tqCrKVU4JwmWFjmBrBt6b4HIgfxU
         +nlg3HpD7fi9USWXPppSF8hq4wONwkYVnLeCd/SWhjhfOFhgtHzbHxHnb4yYVBDht3RL
         RcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=OffJjBdXql451CcVEgj84gO5ioKPxRaqGL4X58UaYXk=;
        fh=8Sm7VwmqLaEQiCkRXsX7cqZy9SDnJisml2gbEXJPfbs=;
        b=FzfsCKhmJpGmeD8LmEhZH82j0I9ms6iNidha1RB8m2rcKTrQS8payuAe2BS1q5l3qM
         FXDF00SfnCOqVzBIMbG4vD0hM2CGI2G3/IrbQ9gdss0QruXpbTI5HTF3luSXOomCQvc5
         VUK8Mu250+j1GTaKXZJmBNzO198H6UjtF5h7Vd+l+FOnlFco41l5n7usbyqr8R0CHqf4
         oXiJDHHFOpUxssfMPqSN5r8B0sc6c6uy5MvPJuy3IHX7t+blF85Dg3hPtItdgc0xyAly
         mTiA1pCvPWdMzisko5YtoFsb7YVrwoH93iJVyorQKsYfLKOCaUJbG08u8t0q/9UCdIu+
         /CdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=XnVcqFH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87331368si113241681cf.24.2025.01.14.05.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 05:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=XnVcqFH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXh4E-0005Lc-It; Tue, 14 Jan 2025 08:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1tXh43-0005KB-JR
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 08:34:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1tXh41-0006mJ-AH
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 08:34:39 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2165448243fso117217785ad.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2025 05:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736861674; x=1737466474;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OffJjBdXql451CcVEgj84gO5ioKPxRaqGL4X58UaYXk=;
 b=XnVcqFH317G1iRpomg6Vrl4/ZjwwS117Q8q0iJKtNu9NLwN3HYAWHmmZIefvin5sVv
 AIuK6tA4YGcDUrsC/H0iPEMUr88xbvoVe+y/vGmEQ3YLTPeRx7dYrVesb4f+6fFOVQ3s
 BpMSmIjUZ7BYDYk3yjzMxbO+2IkttbmJowzHB+ZUyr1FyXGL8uFTqNCP1X0w/K3jmp3c
 BrIkDYfPwhZJFhFER3rrNUbkKVWZ7V6P45pymKCIowRNYZdKxRNkgmerc/F7GDGPABmJ
 lXrqQJ7y/10uNCE8TkgJ9rNdiY2akH3AZEQOjcjY5Cc4lWDMC/PBm/MqQYrAIOabMaTB
 oiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736861674; x=1737466474;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OffJjBdXql451CcVEgj84gO5ioKPxRaqGL4X58UaYXk=;
 b=C9bFVYYv7umKRK2x+pU3tGtqAK/6cLMCMzkCENEEHrW9EckKCFl2EDTJRBmSoxyjdj
 tRwW9GiwQ9oVzjxC7oTDmI6d9oSgHcIGD/TbDC67/kN8yNyrZ0SzKpBwsP0xXmQIbxt8
 SrtMvQKglqgSE2hUPFyHAfp6T4Oq2JS4/oPGXak/6NK/m1Hp+BxJUGypTLbFbZk4+bVJ
 lsEfsnMIbHrQTDmWUnH12ZvEvROeF1KqB8SkVrw9hnTQESIUN2dthQ9W9HKCfqKAMuA6
 fB7J3jqFmzqW9RsR5H5fXuTsX5hR/8q384aAlgr+9T6Wfky15gJHtWGlSRkuATbj3i58
 wxMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc/wHMB5eKgwF8C6SWSqPPc5kPIk3EAyLnpR1gRguk3YIcBpt50Ilzzrtpi1xCO2we8nbAs+gQaw==@nongnu.org
X-Gm-Message-State: AOJu0YylLUpuBZFe/Karbg32ed7I67mba01uMqQIPx9MI24hGgwA3D2a
 TgVIcEjT4upyXzwMK2hvm8I7eKUwCE260g1UFHBbxVm3TglaChrP5pBM+23jAzM=
X-Gm-Gg: ASbGncvOltY4wZkrCyoOIoPKh9ogpG6CjRHPuT9cTCezU56Hk0pkoRH4AA6LrNveVqH
 tEMFRyBkL5CyHJIF0mBU5bjZBZmzmBm3puYic1N/JECcdd6p8btizYRG/5xzl6GCQiI9229PK07
 z4zx7/WpXHsWHtt4wyuatOMIRF4awz1IHaujMaD8A6O7zJqSF6z9bgocjisaSGzw6BOntRNV6HG
 B2APgyCAAABu6kVd3wb4lTNnxC4X+XGPPUnIVHNSw47/i9UNGQlPGwP97uW
X-Received: by 2002:a05:6a21:789a:b0:1e1:9bea:659e with SMTP id
 adf61e73a8af0-1e88d3612e6mr46712901637.35.1736861673915; 
 Tue, 14 Jan 2025 05:34:33 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:4641:6dae:60a7:e5ab])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4056ac6fsm7611875b3a.68.2025.01.14.05.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 05:34:33 -0800 (PST)
Date: Tue, 14 Jan 2025 07:34:26 -0600
From: Corey Minyard <corey@minyard.net>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 11/13] hw/i2c/imx_i2c: Convert DPRINTF() to trace events
Message-ID: <Z4Zn4oGoIdmiVTEI@mail.minyard.net>
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-12-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250111183711.2338-12-shentey@gmail.com>
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=corey@minyard.net; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: corey@minyard.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vA0eq1b7mxyC

On Sat, Jan 11, 2025 at 07:37:09PM +0100, Bernhard Beschow wrote:
> Also print the QOM canonical path when tracing which allows for distinguishing
> the many instances a typical i.MX SoC has.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

This seems reasonable.

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/imx_i2c.c    | 21 +++++----------------
>  hw/i2c/trace-events |  5 +++++
>  2 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index c565fd5b8a..d62213b9e0 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -25,18 +25,7 @@
>  #include "hw/i2c/i2c.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> -
> -#ifndef DEBUG_IMX_I2C
> -#define DEBUG_IMX_I2C 0
> -#endif
> -
> -#define DPRINTF(fmt, args...) \
> -    do { \
> -        if (DEBUG_IMX_I2C) { \
> -            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_I2C, \
> -                                             __func__, ##args); \
> -        } \
> -    } while (0)
> +#include "trace.h"
>  
>  static const char *imx_i2c_get_regname(unsigned offset)
>  {
> @@ -152,8 +141,8 @@ static uint64_t imx_i2c_read(void *opaque, hwaddr offset,
>          break;
>      }
>  
> -    DPRINTF("read %s [0x%" HWADDR_PRIx "] -> 0x%02x\n",
> -            imx_i2c_get_regname(offset), offset, value);
> +    trace_imx_i2c_read(DEVICE(s)->canonical_path, imx_i2c_get_regname(offset),
> +                       offset, value);
>  
>      return (uint64_t)value;
>  }
> @@ -163,8 +152,8 @@ static void imx_i2c_write(void *opaque, hwaddr offset,
>  {
>      IMXI2CState *s = IMX_I2C(opaque);
>  
> -    DPRINTF("write %s [0x%" HWADDR_PRIx "] <- 0x%02x\n",
> -            imx_i2c_get_regname(offset), offset, (int)value);
> +    trace_imx_i2c_read(DEVICE(s)->canonical_path, imx_i2c_get_regname(offset),
> +                       offset, value);
>  
>      value &= 0xff;
>  
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index f708a7ace1..1ad0e95c0e 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -56,3 +56,8 @@ npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s
>  
>  pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
>  pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
> +
> +# imx_i2c.c
> +
> +imx_i2c_read(const char *id, const char *reg, uint64_t ofs, uint64_t value) "%s:[%s (0x%" PRIx64 ")] -> 0x%02" PRIx64
> +imx_i2c_write(const char *id, const char *reg, uint64_t ofs, uint64_t value) "%s:[%s (0x%" PRIx64 ")] <- 0x%02" PRIx64
> -- 
> 2.48.0
> 
> 
