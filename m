Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp677309ejb;
        Fri, 7 Apr 2023 21:22:26 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:1a1:f0cb:1055 with SMTP id b16-20020a170903229000b001a1f0cb1055mr5627921plh.28.1680927745847;
        Fri, 07 Apr 2023 21:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680927745; cv=none;
        d=google.com; s=arc-20160816;
        b=QowNDQ0GUT/0tnycesAwLqecU45iMkAvG+vwHVHDdcKoqqrb72YPVMo7LtFyfUJndT
         VUo0cWPMmH/eE0xjSeNfVqTNyYU20olmgcJ3xXeE1RYIa1IDwZfN7Hb5GxVvfEpIRdxZ
         j/NAYkVMbuGnmvKJR+cmoec3twTABQoxpY18soGrmzROqg6laqOZegh6xjSdwoUwufvz
         PrkPqWlO3WHkeBxFWUFpH9RgQvhTU3vmc4AMqiOXBOewyXYDLpvpkmsmBiaflsRmupR4
         kSSV37OsbZQNgKkAsYnXCDMyvc6YWpDKvcTklRAcw92dQuvE61c3d4ihDnFeJohfXnOu
         h8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3XA7xu7b05KgVtUtSLaFSgkNI9Huml9S1qbjZOV/CIM=;
        b=VrV8OPOMuZZYr6avWkCn9bbTN4n9QZVe2ixx3LTWR6WNf71SMxkb7zE7L/MiEJL1qf
         iZ8KGMYmc96LsooI2xULxLnTh7FWzN6IFnL70nHDVNsKZYIp/gN096JjbRKl9WOzLA2O
         18Uc1P8CYT/ZGEerbFjOxG+7AgqTav+p92rc4G26b7pVzlE00QrLnGcdPIW3yFPFqM7q
         flmgVlnWaLdmB739ssuLJyt54ayz5wDZ4FnLwFmiERvQLXjJmLsOKHu+FOH0b32uZVZ+
         A8LmssxJRGHrskIwsJh8xVb046GkKsmUXhCaAZmotcTVHbNrXL92dnVFzI5s6LdIc68B
         B/mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7AGaQS8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u9-20020a17090341c900b001991e596852sor2356477ple.173.2023.04.07.21.22.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7AGaQS8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680927745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XA7xu7b05KgVtUtSLaFSgkNI9Huml9S1qbjZOV/CIM=;
        b=A7AGaQS8AbhPZNUGaFRYZb7iEGObdhqjJ974H7//mCKlXrIg4OfqiRIcLdRBxjVvsQ
         V/PC2nHH1tjANBFhCUrhQphDxJsayHejY59urWvCAzvJULXR7k2rEBd4LLApbpSfcffa
         M3c8+w30vxLQcPAz2mYTDSlVm5EuIAOQV2SEJU5gewelFxp3kgxbnIcS+41B4xxkDx4R
         g6khRJK4GaDk3S7SHTMoQGcWpUBhe5Y+EWVjJPyhfHZe5J7lTuORb5onupkUjGObjLqU
         Ydr4smfjNYVBosDNqTGxlP67sc/c/W3g72Uh9CQKwIFlkUDjDKwKP/m2crmREuyCZFk/
         nkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680927745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XA7xu7b05KgVtUtSLaFSgkNI9Huml9S1qbjZOV/CIM=;
        b=z11PuDBa+DIjJWUrZFNWc8hpmmqy7zY+41Q5vMcP/vpKutdYFSMBMMV31xIwASgi91
         vG1DEJhiCKbqBGaYR5htRoW6ZC0I/7Awx3KIqdRp+cqBG37Tsls1Nrj6qTPJcvsrRd4+
         1czlVIh4R9qxYSqa1/zJWEQQehCW6PpCQTpq3mnJlEjAp2x+lwmn6qDrHEmcktzKxtuB
         KQIj/40mfjWwivpZc4jBZ48n8QOygZtoUnkj/aUQ7yOI/oOWP6jLn2wsGswIVAj33KlM
         ZB/D3DPDQ2TwlVuT7hhUBujoecAUTY2ycQqg8kLMKbLhC6UWqKuUqe8Jc26pbCqrtboX
         ouNA==
X-Gm-Message-State: AAQBX9f84smQsKFI7eYxSHm98CKka6FuaSvnjkQCC+iMu9yVVeEQtR8u
	oP2YV3bOCacGaVd6cQbFZfHqPIp0
X-Google-Smtp-Source: AKy350ZvPzfE+y1QUhk2IBKWNvy8QImEs21aIMlCoaYiiwpGFf/8mac80Q8PkAy37yOwVjV6IBpT/Q==
X-Received: by 2002:a05:6a20:c12f:b0:d8:f082:437e with SMTP id bh47-20020a056a20c12f00b000d8f082437emr3896972pzb.12.1680927745360;
        Fri, 07 Apr 2023 21:22:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b00571cdbd0771sm3781871pfn.102.2023.04.07.21.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:22:24 -0700 (PDT)
Message-ID: <f56d8333-2cb1-b612-ba7a-9acdceb62cc8@linaro.org>
Date: Fri, 7 Apr 2023 21:22:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/10] hw/intc/arm_gic: Un-inline GIC*/ITS class_name()
 helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2r3OL4Fa7tvr

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> "kvm_arm.h" contains external and internal prototype declarations.
> Files under the hw/ directory should only access the KVM external
> API.
> 
> In order to avoid machine / device models to include "kvm_arm.h"
> simply to get the QOM GIC/ITS class name, un-inline each class
> name getter to the proper device model file.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/intc/arm_gic.h              |  2 ++
>   include/hw/intc/arm_gicv3_common.h     | 10 ++++++
>   include/hw/intc/arm_gicv3_its_common.h |  9 ++++++
>   target/arm/kvm_arm.h                   | 45 --------------------------
>   hw/arm/virt-acpi-build.c               |  2 +-
>   hw/arm/virt.c                          |  1 +
>   hw/intc/arm_gic_common.c               |  7 ++++
>   hw/intc/arm_gicv3_common.c             | 14 ++++++++
>   hw/intc/arm_gicv3_its_common.c         | 12 +++++++
>   9 files changed, 56 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
