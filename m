Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1954020ejd;
        Thu, 18 Apr 2024 12:29:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBLmual2Iboc/4scDLDRnc4/8ug3KXgymUxOdycQ50LAEY/EEsQlvQTnnpeIP7cUlrs/YUr+TkWld9O5OWCko3+fSJVBf+
X-Received: by 2002:a2e:301a:0:b0:2d7:7bb2:7afc with SMTP id w26-20020a2e301a000000b002d77bb27afcmr2490853ljw.3.1713468585390;
        Thu, 18 Apr 2024 12:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468585; cv=none;
        d=google.com; s=arc-20160816;
        b=aM+hIvS6y/CGaOCv3wiL7m3EXOZFF3Ac+e/sUAnlyuo/nzhitcCL+1yR2CxZwBuENN
         NZADo7mYaoSHm8yO00tzOVe79s/ZsDlh9s7iGps0RHPYSguySJIrxGisqOVVK+2fqj/q
         g0fK4EE6QmK9ao314a3kD3FUDZjdPFimmu1Eo1pzOxAOnz4JzXyuGwpLox6eisYJLGeV
         dJsiO46paBDOsntRiuun9AwvPJ4X85R5/Jc3ObHVhYwolAQOF0cCV4HQC7HQm1qrMgKA
         qHobpICu2bc7eyvwe315ObMuqLYA6fbODKpJb8g2rlTkT+Ueqo8xLPJ+4btxd8HZecu3
         CCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WrEd7aDEDjdvNR6Rc9rGdmrqk6I0VD0LzXzxlDM7bsE=;
        fh=pnGJXZ3su++rSyAZC6SZGGIpNaIAAcflk1rRcHg09Fk=;
        b=kyajpN+7xaQaH3MFijHicDLy4e5XWGzcGCGE78AigrkdS04U99HIb66y/6k+UJWfUZ
         yf/IyYAGsAnOxCEtGttkxvoYSW1skEnNplgiXVQ4wTp+lnZmov/I2NoBltRQkkncRCzC
         EdrfcwggnC8bHrNDy6LSaeY4EUAF6+iYuBsGiPcVspllgtJuJiD8JUOWMBjFTj+3h3l8
         WYvqVFuRrSG7WAx4UhzjDECSt2+9hJqfZ1+pHf9InX8aqPRYMUL9ZUCw6ZPLFbvAQXV+
         53uOW7Hdgr6PV7gBMhK4s/M2p5NP42lf91KO+lwhpqYgJvbW568+H9ewSpJybZe9rwyt
         wkow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtQ1NDYt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 9-20020a2e1309000000b002da9d88ff4csor760745ljt.2.2024.04.18.12.29.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtQ1NDYt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468585; x=1714073385; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrEd7aDEDjdvNR6Rc9rGdmrqk6I0VD0LzXzxlDM7bsE=;
        b=ZtQ1NDYtEY9Xeo8cUMGcZxgH8vgS3yrHw2ncEkMgFCnUnL9wRmkNXv5P4ACFcdEpLE
         QRXF69Q6cFBk2jaAtusFngB7H6ts8rhLSU2XTKtf/2zr4zjpcHgkKacvK2n0lLulcNqm
         7SsX3PPRnpenTpaG3QEWOlK1I2Ydpkh2KH13wwy2dvVpsK/JednpQIjxdGp6Hg9ZMgTq
         0Od+CnKxGlxSBfxBCZQrs61q6LbQoRWy+1tx3auanDGrblfx/YcHAB6RTZ1PaVme2sfe
         DA/p92x731TrFAZng8lifUU1g6qTrg3f1FK2vnmqsPjnCcQDIMvp7NvRlJtiQezkwPyc
         nZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468585; x=1714073385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrEd7aDEDjdvNR6Rc9rGdmrqk6I0VD0LzXzxlDM7bsE=;
        b=ECHzw/OTlEuKLv+OnmtHdlexCbhMsyvvBQlXBm4Am3EPr+ERPLynq8A1mLi5JEkQn7
         elsGDVHfBGi5YGIZ1cMpTwY+EMSwJnshPjkBtyTW+JZq0a18qZWYu7k5FojSYc4OE1sY
         +NZTDnWw8fe9Sq6iCmkiICTCXPRw609T9OLaHvMs520bmu984FL1cCQsP+JIdQHfQP7e
         zERsuwYSJrzJNwO+GvFTnxnekXUIb7OKI1ajFyhh51QzBFdJFa8UikmbZ41NR2R6RAPs
         q7hmp4+ZlqX0ef8NXf7AIqnEgaGsrCWMHy7nXkQ/7O5cwV9beO0I1rjiisPEpjdL4OoZ
         mavw==
X-Forwarded-Encrypted: i=1; AJvYcCVRytHneVN+L2P9VAg56jNH1sw6EZK/6UEIwvKfuEIb2vfEkpHd3v6Mmmn87Q9eBN36cdP/XS1X5pD04csPAhFbBVdkU6wS
X-Gm-Message-State: AOJu0Yx2ysHWCFu3BVHls1tJeDHazHvdHMCQX3otPmPUEMnQtJzcIW+8
	2OgUGddGXDxY6pHf1LBJ72JF2Ew94B0R8+AA9iSFgkkenxHGvF7KKWCzzuIGmOUc7A==
X-Google-Smtp-Source: AGHT+IGPiOT1eC6eUS6iwYRXcHUMAYmSQxpoP9gCPQopDsCgUk5q4iJLyvSqdEZh8CYyR1arTYRm6Q==
X-Received: by 2002:a2e:240c:0:b0:2d8:a82c:9e1e with SMTP id k12-20020a2e240c000000b002d8a82c9e1emr1974267ljk.15.1713468584887;
        Thu, 18 Apr 2024 12:29:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id bc24-20020a056402205800b0057059784823sm1226083edb.29.2024.04.18.12.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 12:29:44 -0700 (PDT)
Message-ID: <09dd8fe2-29ec-4099-9746-70fe8665b3dd@linaro.org>
Date: Thu, 18 Apr 2024 21:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] exec: Declare CPUBreakpoint/CPUWatchpoint type in
 'breakpoint.h' header
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-3-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240418192525.97451-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: izgGJSfoiaRb

On 18/4/24 21:25, Philippe Mathieu-Daudé wrote:
> The CPUBreakpoint and CPUWatchpoint structures are declared
> in "hw/core/cpu.h", which contains declarations related to
> CPUState and CPUClass. Some source files only require the
> BP/WP definitions and don't need to pull in all CPU* API.
> In order to simplify, create a new "exec/breakpoint.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/breakpoint.h | 23 +++++++++++++++++++++++
>   include/hw/core/cpu.h     | 16 +---------------
>   target/arm/internals.h    |  1 +
>   target/ppc/internal.h     |  1 +
>   target/riscv/debug.h      |  2 ++
>   5 files changed, 28 insertions(+), 15 deletions(-)
>   create mode 100644 include/exec/breakpoint.h
> 
> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
> new file mode 100644
> index 0000000000..45038263e3
> --- /dev/null
> +++ b/include/exec/breakpoint.h
> @@ -0,0 +1,23 @@

Oops, forgot:

+/*
+ * QEMU breakpoint & watchpoint definitions
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */

> +#ifndef EXEC_BREAKPOINT_H
> +#define EXEC_BREAKPOINT_H
> +
> +#include "qemu/queue.h"
> +#include "exec/vaddr.h"
> +#include "exec/memattrs.h" //MemTxAttrs

Also forgot to remove that comment.

> +
> +typedef struct CPUBreakpoint {
> +    vaddr pc;
> +    int flags; /* BP_* */
> +    QTAILQ_ENTRY(CPUBreakpoint) entry;
> +} CPUBreakpoint;
> +
> +typedef struct CPUWatchpoint {
> +    vaddr vaddr;
> +    vaddr len;
> +    vaddr hitaddr;
> +    MemTxAttrs hitattrs;
> +    int flags; /* BP_* */
> +    QTAILQ_ENTRY(CPUWatchpoint) entry;
> +} CPUWatchpoint;
> +
> +#endif
