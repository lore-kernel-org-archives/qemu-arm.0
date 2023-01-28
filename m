Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1520147ejc;
        Fri, 27 Jan 2023 16:03:33 -0800 (PST)
X-Received: by 2002:a05:600c:3ba5:b0:3cf:7925:7a3 with SMTP id n37-20020a05600c3ba500b003cf792507a3mr41572189wms.24.1674864213357;
        Fri, 27 Jan 2023 16:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674864213; cv=none;
        d=google.com; s=arc-20160816;
        b=YG6zXXU8vOo9AX5LSxr3l4DP1y7yfbxnmF5L+5mdbxPSVvzLBb8K5aKwEyzf6D1swv
         6yYOKGUD66Z83r1dX1nruWpv9Wvc+yv6SQyXtAQ75PIPcF0COozNRARP9jrAei//B/h+
         Ejh74kUZRhDSA/I02QrxJP66Z8KZn+dlpRuDOjl3Q459/HtXk7K5kXdaWn/IDkzzNZCm
         u9aVHrO5o/n3UyZ8z6v9aVACcyXx87ksCRZeE4mR2PWvqbvARDdBDi9E5ZyrWjke3UDa
         pOLbz/beJqtWBpWFM79aSHfyZxZjzoM0yAYsC8ELGAhuU265i+XMsoAlaA5xcx7isdLz
         2+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2/jUNKjA6fOoQ6tzXSBdPybO4wT1XtuZDU7H9KaMbUI=;
        b=bsLKWiC0RizNKXjH7879WBLO8EKE+Zm25iSWBT4JAvYlIF5ndaLyxVfJvsca+8q5r2
         JAt/f2JHkbXfJwlNQZxmgj7JkfewGu081OngwbBQKxhjiU4KmTDv779g2Tc1ZzSbLPBc
         UC+xWo0kJ7QjA048VRdwV+BYyStTu2eR0zrGhFPseIJ0rX8nYwEloJm+db0eYzR1H55N
         vXdhb8l9KBQ4QpR3Y8EabRqs6bADki7faJUl2xjjr5WA2pL+OCfg8kQNrVqROICcmU52
         p9duebD9G5Iip3fC80c8MW0YBOPniCYW/P9ML45acIJbiGwVxswN8VZC4FU7pPxdSFyz
         p2JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eS8rEpW/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p1-20020a7bcde1000000b003dc3d9c81d3sor871687wmj.27.2023.01.27.16.03.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eS8rEpW/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/jUNKjA6fOoQ6tzXSBdPybO4wT1XtuZDU7H9KaMbUI=;
        b=eS8rEpW/tI2iYWCQBIEsvdtJkTgaE8jeOhUIOD6o98gd27mgFhYeyaxKoa7GZVF9e7
         30m90gQrDvkJffv/jCQLf9eKXqKLIEn0JzKsYX0uC0AH/gH6/pX5+uLuuBPpp1rRFyxY
         3E/Z7zbWUbSQ39s1DOoTGLcnMQwnXaGlCa29dqoZD7xnOSr9O/0AbRB/mIEPw+Kq49B1
         1efS9KnRQ3+lYWSwscsfmzDl1DkU7/z5SuQLY1OhdfGLRei2Vz55c5qhVr7Pcoh4Hu4k
         k92fEbMYcSn2vjkjsCBM1ikjX8yMu2lTtc+hpVjyQ/za0BeUJf1O0XncoMwZJgbuWYvn
         CFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/jUNKjA6fOoQ6tzXSBdPybO4wT1XtuZDU7H9KaMbUI=;
        b=7owXm0v6JtXM90yls/m1sYF5YRJFdFvFVSVRU9jKCMSndGkUr8Iart7xqgSCZJgsoN
         9Qr+YIUsJEMb62mOHaqKZj6SRi8Y2XVIAniqef1AnL4RVqqQdT24AdrHgFrmzIHV/qhi
         zgRhu37cUnFpOOauHLG2xeSeKE2ZEDyxlM28APToIn5vy8kuvBhaL+MZopvdes1T4vgQ
         /sgVDWhdytBRssoXLuVegv8fu0M+eoUMtnowfuN08zJ+JqhO4jvYZqT2UhSToJXGNtPO
         Qx/6t7OqPmuj5Cx9YgL8Bo6Zuu7MTVMVmUxiNsmZFQhnig6IOP6S6L2kaA0RMxyaXA3C
         i9RQ==
X-Gm-Message-State: AO0yUKVdyO/j6vNQOyKAExgTSLdnxblXKa0W3MXmhuhP4YBtgPZ521as
	RUINrecuULMe2dDSqymQSHGshDsX
X-Google-Smtp-Source: AK7set8IR82fJWon6NMTsxeey5gM6TNPR0zEluD4EZhtx1CKBFfeaEsU4p/UPSndTa8CPKvRuR+rrg==
X-Received: by 2002:a05:600c:5124:b0:3dc:45a6:ee4e with SMTP id o36-20020a05600c512400b003dc45a6ee4emr953570wms.25.1674864213059;
        Fri, 27 Jan 2023 16:03:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.14.77])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003dc1300eab0sm10193732wmq.33.2023.01.27.16.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:03:32 -0800 (PST)
Message-ID: <9e8629c6-bafc-08c9-7092-d9b7dffda6eb@linaro.org>
Date: Sat, 28 Jan 2023 01:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 02/16] target/arm: Add confidential guest support
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-3-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230127150727.612594-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: i2cCOS4g3fHa

On 27/1/23 16:07, Jean-Philippe Brucker wrote:
> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> support the Arm Realm Management Extension (RME). It is instantiated by
> passing on the command-line:
> 
>    -M virt,confidential-guest-support=<id>
>    -object guest-rme,id=<id>[,options...]
> 
> This is only the skeleton. Support will be added in following patches.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   docs/system/confidential-guest-support.rst |  1 +
>   qapi/qom.json                              |  3 +-
>   target/arm/kvm-rme.c                       | 48 ++++++++++++++++++++++
>   target/arm/meson.build                     |  7 +++-
>   4 files changed, 57 insertions(+), 2 deletions(-)
>   create mode 100644 target/arm/kvm-rme.c

> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> new file mode 100644
> index 0000000000..22aa3dc712
> --- /dev/null
> +++ b/target/arm/kvm-rme.c
> @@ -0,0 +1,48 @@
> +/*
> + * QEMU Arm RME support
> + *
> + * Copyright Linaro 2022
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/confidential-guest-support.h"
> +#include "hw/boards.h"
> +#include "hw/core/cpu.h"
> +#include "kvm_arm.h"
> +#include "migration/blocker.h"
> +#include "qapi/error.h"
> +#include "qom/object_interfaces.h"
> +#include "sysemu/kvm.h"
> +#include "sysemu/runstate.h"
> +
> +#define TYPE_RME_GUEST "rme-guest"
> +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> +
> +typedef struct RmeGuest RmeGuest;

OBJECT_DECLARE_SIMPLE_TYPE() already forward-declares RmeGuest,
otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
