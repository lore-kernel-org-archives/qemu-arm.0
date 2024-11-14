Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp544234njc;
        Thu, 14 Nov 2024 12:49:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeCOlqMIwaSV4+/Qt6EJCI25J+KC453HmiW0RXW0XzgqiOiOJyWBfC7LFe/t6XNQuCJz4o55q3zagwnA==@linaro.org
X-Received: by 2002:a17:90b:1bc8:b0:2e2:ada8:2986 with SMTP id 98e67ed59e1d1-2ea14eef37amr701947a91.16.1731617386555;
        Thu, 14 Nov 2024 12:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731617386; cv=none;
        d=google.com; s=arc-20240605;
        b=hgxHMSL5elAnt6tmJ36ZQfGi0x4vEGfhoDXlvINP5F8ayMPkLHxNVD3xEtPmjdQrXE
         BbVLE5n7jN1Ats/rOCH/6IkliW8USmBegQp4bQH5SX5tcHVUIDt0c3F5p9dp5l3WKEAl
         ZsGS+vSP60BNNwYEIOOWgBVQtiz987A+MqB0naT38LiNrf34JKTpOMl04+uHq3TycHum
         35DIJKiumqZF6sAO8Zz3tBm7wUQs/gnlijK4VuvtwxJ4UJTAL+CnGf450QOxlXTiwcsV
         t/klh7loAjBQWU99DnOTA8h1U1HejYGrblq59m6LazG5aO5+82B4RVA/gf8Rlk4U93f4
         djdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lJUD9uM5PxKptuVyfms2yHOSK2OiJKniu5sJIcGJ8Bs=;
        fh=w/q/aLzflpJktLqSPiADggr0wKKt2kJGVxODd2o/OvU=;
        b=Tw4uMhiFyMOhD0vfuDG9+6prV8jJfaT8XFORGjxoQEufRUaX77cFuCL1H5pCbCmmnq
         XYMsu59wds2hNtt1dDmactbZe5KvtO4cBeC6CjdQWinsefE6BX/+SZtEZUJoX1rvoNRd
         1kGNC6rCoMNTJczTQ8hI9hUTC/vMU92VrQ++XxT9yB7NPJFpX3ypnjVn5VtxSBQFEVkt
         jDbq2W4Cfk4k7KxEPNElgf2CPOLKgXqFFkRdytttaE/05WqELvLmCiJQsUwFo1vM0GLO
         vyn2Uni16nU/DoTUK+yg4sWen1CrgyGQS26wc38PHfpj1J0e0C5XtdHzGQF6MB3IeUkN
         yzAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EH/goMRh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea15c2c8c2sor22015a91.0.2024.11.14.12.49.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 12:49:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EH/goMRh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731617386; x=1732222186; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJUD9uM5PxKptuVyfms2yHOSK2OiJKniu5sJIcGJ8Bs=;
        b=EH/goMRhN0RTankdpz7P/zUmSf5a0TRyagxhjvs6qz2e1XrHcgjwJrRfMadH+RzsdH
         oZd/WnQA59B+KA0ATQ9U1RZ3LSzNXCkf0yUxl/5fKNKemwxYazr1W3GpGNREd4Dsj7pp
         MWT4CA5UQKQct7ZfFlPHzkIbbkpSeuBqJiZedVojsorxt6aTKRd0YUs/6XhlvGzBuFcJ
         UulfgLbgrONrdPm7fHWOWfyjoNzGLaep5CPepAI3FFS5T5c0yNDkHv4ny2quKV0cm/f1
         Wss6XQbhEGIRlhrtkR0qVTbZoLDhilfVH2GXpJU2GIwUYlmQ4zIeFB0pYqGKcb988sRd
         J9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731617386; x=1732222186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJUD9uM5PxKptuVyfms2yHOSK2OiJKniu5sJIcGJ8Bs=;
        b=w8Q8WvYw3dERd7NqN1AO2NiHU+iEn7CvAp+ytRUxCio63077K0CKX3jCcH+b6v1frd
         ioLLv32bOV5qVCkcNPUL2GAm+7qGGNjvzqBwEzqNh8o2VSK80u6vLa17nfzNpE1EwLNb
         xVasebUwLgzE4echNJzVi+0dAP++Med7LQJLa1w7riVss8A79w21i5GDcMy+JHfqmYCu
         9R3ta24NhO0FL7TuzFcXR64l48zQ3vDsYttqEiGmLi460ppYBdnzZFK5S0acWAgsVrp/
         TEumOfCBdDFpKAfOCWEB5yCUleai/6yoSGFKPe8OCZcx5oyKYOWaTbefjXAekWo38UN/
         L1cg==
X-Forwarded-Encrypted: i=1; AJvYcCUWJZ/G/Vm7zItdXKDjvzMrN9OqhwVWF5QH6yeqeXu0edoiJiBN4hr5y2yVXdexdkI6ZGqxlcz4t99AXQ==@linaro.org
X-Gm-Message-State: AOJu0Yyg/Jcv0NIczRQvX+4ppJfdEkP5xeJXgp8TPh4IXDmOWrLXvPH7
	K/EnYbJ1m9PlKIUzFO80Dsr95MBesEL1oGNgyfYvb799Q9MppljWKT9xz6F4CBeQmw==
X-Google-Smtp-Source: AGHT+IH2rDc3YgY30ffUov9J2rcLzG333Y6x/mq7BzZ40lFfXo/a+HwYk+K6wda8MTcdzp3r4dC6ag==
X-Received: by 2002:a17:90b:5292:b0:2e2:bdaa:baad with SMTP id 98e67ed59e1d1-2ea14e1c2d6mr867046a91.7.1731617386107;
        Thu, 14 Nov 2024 12:49:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f4b191sm1595087a91.27.2024.11.14.12.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 12:49:45 -0800 (PST)
Message-ID: <6dfe7a0c-af7f-4de6-a8e5-a6b9a0d8edc7@linaro.org>
Date: Thu, 14 Nov 2024 12:49:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] exec: Move 'ram_addr.h' header under sysemu/
 namespace
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-25-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 41HZrsUL/zSC

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> "ram_addr.h" contains declarations specific to system emulation,
> move it under the sysemu/ directory to clarify the API namespace.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS                         | 2 +-
>   include/exec/cpu-common.h           | 2 +-
>   include/exec/memory.h               | 2 +-
>   include/exec/translation-block.h    | 2 +-
>   include/sysemu/physmem-target.h     | 2 +-
>   include/{exec => sysemu}/ram_addr.h | 0
>   accel/kvm/kvm-all.c                 | 2 +-
>   accel/tcg/cputlb.c                  | 2 +-
>   accel/tcg/translate-all.c           | 2 +-
>   hw/ppc/spapr.c                      | 2 +-
>   hw/ppc/spapr_caps.c                 | 2 +-
>   hw/ppc/spapr_pci.c                  | 2 +-
>   hw/remote/memory.c                  | 2 +-
>   hw/remote/proxy-memory-listener.c   | 2 +-
>   hw/s390x/s390-stattrib-kvm.c        | 2 +-
>   hw/s390x/s390-stattrib.c            | 2 +-
>   hw/s390x/s390-virtio-ccw.c          | 2 +-
>   hw/vfio/common.c                    | 2 +-
>   hw/vfio/container.c                 | 2 +-
>   hw/vfio/iommufd.c                   | 2 +-
>   hw/vfio/migration.c                 | 2 +-
>   hw/vfio/spapr.c                     | 2 +-
>   hw/virtio/virtio-mem.c              | 2 +-
>   migration/ram.c                     | 2 +-
>   plugins/api.c                       | 2 +-
>   system/memory.c                     | 2 +-
>   system/physmem.c                    | 2 +-
>   target/arm/tcg/mte_helper.c         | 2 +-
>   target/ppc/kvm.c                    | 2 +-
>   target/s390x/kvm/kvm.c              | 2 +-
>   30 files changed, 29 insertions(+), 29 deletions(-)
>   rename include/{exec => sysemu}/ram_addr.h (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
