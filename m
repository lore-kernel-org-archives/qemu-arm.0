Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp386492ejs;
        Tue, 9 Jan 2024 05:36:15 -0800 (PST)
X-Received: by 2002:a05:600c:45c4:b0:40e:498f:25a1 with SMTP id s4-20020a05600c45c400b0040e498f25a1mr1168831wmo.124.1704807375635;
        Tue, 09 Jan 2024 05:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704807375; cv=none;
        d=google.com; s=arc-20160816;
        b=eOHqlLUhXIkfoGg5fCNKxKNvrWaKwyJvKCw9NoqwVBAR490gXzO32ThoIa59whkT5J
         pVRVNSmnOHpKBRwLZNkQtQJZku+oOXRhbVDOvamgSyXr3/8CEXvSdiHFXkmyYmfgrVV1
         j1yEkhNlVbMauUJvojw4gDUPnDLpIb/vNVYRwcyzdqg3OO9ObQ9caxH/wTvxcxWRpF83
         0U1UgWY+bqbtcYFS9fbnqRXh8Z4RlAe31ANaAVo147woVkJdFJbnzscz0e9LdenBbECO
         uEg4SRzP7FLL3HoGBN7a8jvfyeX1mVfCh7VHrsaiIvNUM0SHtyHhqCBSSxEJ7FnZ1er+
         SWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BHC2kUTrpWJtNveirkWhsXgIu86cSKpU/ODpGiqaIjs=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=zrq71kusle1otGVVjSCLh5RxIzhKnZodPs+lSMjlBfa8bfC2COzeV5BWEC+sxTsn1v
         OI8cpYE/uOSNew/tT1bkzBNPS0SBEfIIH00LrLTr/gmuapNC/v5O2PCohvndJYVJLm2x
         8n1uIGYo7jM8A3hR96UWFZwuKeUoh4St94K9l01mFmLrvAMBvPp1Fvv0Vk02w2NYNPRz
         +azCumRpZbvDiNlWGPd11YylvvwI+NWuxFIdz7Bq4RMyUbqtMI5YPOfFSMWffIgnXjS8
         AjLlDEnsGZbm5MTLympA3bqQn2JGSmdoUiVew2Vziuohnu5VU9VvPwV4Te073y56gVg6
         /Fkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRez5T+P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10-20020a7bc7ca000000b0040d1e4338e9sor615355wmk.11.2024.01.09.05.36.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 05:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRez5T+P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704807375; x=1705412175; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHC2kUTrpWJtNveirkWhsXgIu86cSKpU/ODpGiqaIjs=;
        b=dRez5T+Pyl58ch1eCSjTvraH9mJujUx9PjHpEzxM8V+h10xKI9EZR9v8GlyLCUd33n
         r1M4EFnQq9NoDPKyzjh5imftfpxbmxOj1mBbjWBkw3pZVWxkHex/1Xkn/MfxyacrU8L+
         TplUsPa3CWdk2RW2IqddlXnHQALzuyZIVNuiGAsyOFvkc3MZCCh7eQD8aTqdRYuyb68k
         9/76K2rh95farewr0Y0HVUpc5MUvcNZ7D48GcSPRqUf4PJvhmTokPhEbR3d+tsUjt2Gu
         hZHUXvfH4STj5/we/oDfPHSgRfTF7eliOmQOxXAPA6gWcYChKkejxY5SGK2bKtmmZ3ov
         kJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704807375; x=1705412175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHC2kUTrpWJtNveirkWhsXgIu86cSKpU/ODpGiqaIjs=;
        b=Ei2VNTuxmtPNVQ6Pop3g9Ux1huOx1Q2h58tg1CbGROI8xZeRvXjvvRhPvAb9gnH2d2
         XXrw24rwPSRkpkiOy4vlZb3L90/Qp8NuGLYKn1kZ0im1UlKGMCa+blpABIoLo/pHQPy9
         3I51c1x/99gEkZlVMjpZ7IpAn7rw9Fvb9/wEdSFxOlmaCbPlU5bRUK8b+rpIw69gXRli
         KQ7fYVCAXtq3GhqtMg+1fumz6PXUX0BSjQaRt3KQasFlBHiSqSYeBNt8HjTI//FXYLCW
         qeuxgZGW84qs+98zlIJdR+stQ2Eqa4D0RBtQlL6gXjtOt3LUHH07UhcSDXDD/gCDcn00
         2OWA==
X-Gm-Message-State: AOJu0YyFz2t2nQCGSYghEe8NPsFI/d/fK6Ld2nWjK6C+Dy4JvfPVDLfh
	vmglEaIuBgL2Dswar0yg0IZuxpw4mKOTnpI5
X-Google-Smtp-Source: AGHT+IH7yj31/loIT+7tYmw3gewwKIbySeRmVS4Sa3VhOiWKFc39eFO4qMdYcn4tKQ3u0/8DGwJcXw==
X-Received: by 2002:a05:600c:ca:b0:40e:4710:b33a with SMTP id u10-20020a05600c00ca00b0040e4710b33amr1491441wmm.45.1704807375098;
        Tue, 09 Jan 2024 05:36:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c314400b0040d7c3d5454sm14756870wmo.3.2024.01.09.05.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 05:36:14 -0800 (PST)
Message-ID: <282dc91e-0f56-4a74-9110-ea4824e6d61d@linaro.org>
Date: Tue, 9 Jan 2024 14:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/PATCH v1 07/11] gunyah: Specify device-tree location
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
 <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xIQapKJFQ94J

On 9/1/24 10:00, Srivatsa Vaddagiri wrote:
> Specify the location of device-tree and its size, as Gunyah requires the
> device-tree to be parsed before VM can begin its execution.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   MAINTAINERS               |  1 +
>   accel/stubs/gunyah-stub.c |  5 +++++
>   hw/arm/virt.c             |  6 ++++++
>   include/sysemu/gunyah.h   |  2 ++
>   target/arm/gunyah.c       | 45 +++++++++++++++++++++++++++++++++++++++
>   target/arm/meson.build    |  3 +++
>   6 files changed, 62 insertions(+)
>   create mode 100644 target/arm/gunyah.c


> diff --git a/target/arm/gunyah.c b/target/arm/gunyah.c
> new file mode 100644
> index 0000000000..73c1c2a88a
> --- /dev/null
> +++ b/target/arm/gunyah.c
> @@ -0,0 +1,45 @@
> +/*
> + * QEMU Gunyah hypervisor support
> + *
> + * Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/gunyah.h"
> +#include "sysemu/gunyah_int.h"
> +#include "linux-headers/linux/gunyah.h"
I'm getting on macOS:

In file included from ../../target/arm/gunyah.c:13:
linux-headers/linux/gunyah.h:13:10: fatal error: 'linux/types.h' file 
not found
#include <linux/types.h>
          ^~~~~~~~~~~~~~~
1 error generated.

Maybe we need the following change?

-- >8 --
diff --git a/meson.build b/meson.build
index 6ded60063e..fb20ca04d1 100644
--- a/meson.build
+++ b/meson.build
@@ -712,5 +712,5 @@ endif

  gunyah = not_found
-if get_option('gunyah').allowed()
+if get_option('gunyah').allowed() and host_os == 'linux'
      accelerators += 'CONFIG_GUNYAH'
  endif
---
