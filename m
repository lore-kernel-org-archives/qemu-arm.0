Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp27656njc;
        Wed, 13 Nov 2024 17:17:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVE42k3zsf8LnAoe/dAwNWJvOB1fTC+ESwvgyHugwF0yFvlyWYHJjSHK9q9HDF57qTMEflQYnWxhhfP/Q==@linaro.org
X-Received: by 2002:a05:600c:46c8:b0:431:51e5:22fb with SMTP id 5b1f17b1804b1-432d4aaf30fmr47465915e9.14.1731547055824;
        Wed, 13 Nov 2024 17:17:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731547055; cv=none;
        d=google.com; s=arc-20240605;
        b=h/PskuDV30owW1spyVJM2pIL1OLwaQHRFdgekDzjf+NrAnfWd7ha6RX0DeKao7KCrz
         i2/iCfPYXynIwJgp4qSx5LIhOnIbO3ASA9C/K2YZgvOAeQtMJOHC00JTVzg0+oO1J4le
         oHpw5mW0N6vufBc/arOYx/DohcoxUIDkCSaPD0r7kqN6XZ7yLeQXaf2+9Gm0jDN/TPHe
         Q2caIXZ06WfXva0lpRsisoBqUDT7/KpMQKKkFPcXj1+Hc+RfHAw97CxzXEun7mGzLjkD
         BXgQMWnGsfrNto5vhVK19psInROCVNbaN1+Sqest/rL8agMWXR1I6L+z6lHAhrgecJ/9
         Vhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u3uSBRj3NjQFOQXu1E+xnMnaxOkusZRMjmX2g75QHhc=;
        fh=KTWa+Fl9FkFNEUaQ/NEkjgQIsSvO6AGWMGgkeGqtO2o=;
        b=LRzhhSAh2Bv1zIyXZMrDMn5EbM4n4wbfhCoN/jO7YGP3/c8PlvyqfZn1HWhhFgoZER
         7ZCDyRTj/7I0uoFAfajbfCkdng8U157xkv45Sf0e2o65V+tNsWx6+B8GBsjFefO8HVyx
         XBV/azQ5jn8tnLlyTVOCXaeQBkcpftpb0wxFi+Ljb8v1f9s4BlMWE27KOr9aJ28AfWec
         m+NIOmKu+vepX5kxfPSkUgSJVY9kqNO6eSbPu7J01MCHHaoqQHOLOpcdyMfEQxvGdn8x
         3fPhrqoYlNNgsLsnbxvOPcWpTGdviMK7rHENkdCduIYA28d9BxPQs9XTtpwiHTP7HZhO
         TYrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yk1i7LLK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b4940esor60923465e9.1.2024.11.13.17.17.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:17:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yk1i7LLK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731547055; x=1732151855; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3uSBRj3NjQFOQXu1E+xnMnaxOkusZRMjmX2g75QHhc=;
        b=Yk1i7LLKoyCvTXtwRUn4GmipfVICGwJp4/BHOowIJuZFgwRqTkIcu34LLM2iWZeLLJ
         oj7kJHH2rrcNMIpp/LkbRLpj75CxhjPvDyWIjMRP7AX9tBtsX08BTI2b219YtSWF22L1
         yRmLTZIbKuOzGglS5CamzWI6effQkcNTSynmWoGv58F9tifgXIuOwYFHFce15POGSbfo
         BlJJ0l+0JXfve/ZprdgTYZmHeU6ZZ/W2l8BQKQET2UChKKw/ygI8FMVanqCG2AdTirsp
         dQRANiPSXS0wu2hf1ClJzB1+Cq4jNB2lHJJ65NaSlho8edYk/EiqTi9ituGlezFe/B7m
         Fr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731547055; x=1732151855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3uSBRj3NjQFOQXu1E+xnMnaxOkusZRMjmX2g75QHhc=;
        b=csxvacWQRLEiKpZ+14XWjw6W+2X4k3J7KmEFFAHTWG7WXMS3WTpX4dQ5oQVHxD/nE3
         q+UGAdNxw7/rTdMPrtwMHYKzbcSFQctmSX3eLQ9XEITEuWSw+4X8jD7ipvXzBnJJDuxY
         JYwCJ9tWFbnR0rPiNpwUiVCV3YnE0LMYHh5TmD79AuuzVT9gvnZGdkAJZPiKb8Q91y53
         T09liNDEQSQua5h0nrXRSE1UAQIvSMgU5FXfuD1ZeoszfbmrnXJlg6BPv4g07xnspgkc
         2dWbhOYF7EArFkoaakSEmtA9TnhngVXoUBcRGAXtrIG+jAJHEKSDIOOfFFc0OV2Wf5QR
         gSUw==
X-Forwarded-Encrypted: i=1; AJvYcCUNWlNNnwrJGhjhcmEsoEb0PBoz0HPmzN2BbtDBlP9lOWcsu0EbBs1j5kdrB8xYe3bfbiE+IRt61OfF8w==@linaro.org
X-Gm-Message-State: AOJu0Yx4U7k+oeB5N0dZZ94NaqC+iEwv19KwqkJZOjkFXMhnasGyDoNI
	6+BH5Nh9Mi34zoUR5tJnzwvxfUf7BnqL4wqvLgXXuHQk0rsgT4G8YxAC4dUEJbiVMw==
X-Google-Smtp-Source: AGHT+IE+cc6HJ3dgm5075H6eDzH6RJj2mGnuwlfaEBLP01j9ZnW1Z2AY2ich2HKhG+Hgy0Xx93oFZg==
X-Received: by 2002:a05:600c:4e14:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-432d4ad33ffmr43842555e9.25.1731547055220;
        Wed, 13 Nov 2024 17:17:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.126] ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298c97sm4715215e9.40.2024.11.13.17.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 17:17:34 -0800 (PST)
Message-ID: <05f475fb-e52c-4f8a-a4cb-7cc9ea76229a@linaro.org>
Date: Thu, 14 Nov 2024 02:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] exec: Extract CPU physical memory API to
 'sysemu/physmem-target.h'
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-22-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241114011310.3615-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lqmaZEpebu0B

On 14/11/24 01:13, Philippe Mathieu-Daudé wrote:
> In order to keep "exec/ram_addr.h" focused on (target
> agnostic) methods related to the ram_addr_t type, move
> all (target specific) CPU physical memory API to a new
> "sysemu/physmem-target.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                       |   1 +
>   include/exec/ram_addr.h           | 483 +---------------------------
>   include/sysemu/physmem-target.h   | 506 ++++++++++++++++++++++++++++++

...

> diff --git a/include/sysemu/physmem-target.h b/include/sysemu/physmem-target.h
> new file mode 100644
> index 0000000000..b30c42da60
> --- /dev/null
> +++ b/include/sysemu/physmem-target.h
> @@ -0,0 +1,506 @@
> +/*
> + * Declarations for cpu physical memory functions
> + *
> + * Copyright 2011 Red Hat, Inc. and/or its affiliates
> + *
> + * Authors:
> + *  Avi Kivity <avi@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +/*
> + * This header is for use by exec.c and memory.c ONLY.  Do not include it.
> + * The functions declared here will be removed soon.
> + */
> +
> +#ifndef RAM_ADDR_TARGET_H
> +#define RAM_ADDR_TARGET_H

PHYSMEM_TARGET_H.

> +
> +#include "cpu.h"
> +#include "sysemu/xen.h"
> +#include "sysemu/tcg.h"
> +#include "exec/cputlb.h"
> +#include "exec/ram_addr.h"
> +#include "exec/ramlist.h"
> +#include "exec/ramblock.h"
> +#include "qemu/rcu.h"
