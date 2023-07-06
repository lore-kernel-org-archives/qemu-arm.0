Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4357745ejy;
        Thu, 6 Jul 2023 08:12:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGoLnBLEyDDHsDtrHhKyGHSwxNy4z2H9C7mBEr7GFt4nho9TyARNdeP9Ij+xhuV6VzMTi1r
X-Received: by 2002:a05:6358:7e13:b0:134:cb1d:6737 with SMTP id o19-20020a0563587e1300b00134cb1d6737mr2680445rwm.7.1688656333691;
        Thu, 06 Jul 2023 08:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688656333; cv=none;
        d=google.com; s=arc-20160816;
        b=An3w1eA/4IT2hTxvAj3zWjq/R+HRbWvB8x/VXCgvvR5c5gErm6IuUn7wpir2DSVmSE
         6JMUHZUrAeprHY5aAsCCs6kT0wYcegVx7GmnwmCIGxxMx1lduNz/4PEOcWnaoaTvgSWw
         RhdMX5TCZyctGy2DkhHIRkljvUaDtFjGf74tsYqhqm6we7Ie2sYkEDtszDNFJUTsnl2R
         LgpMipCo9s2MWKmJrxC6vYSLNkUxHu2pDJeP1iiRL3KgQGRsvX15nrKZCNv8rfSXE7BA
         E9gc3lb5nXvInxnPpU2qrNrPohCyeM3S/22oT86njqiU4Pgrwi+roSbhHwBRNma3abWQ
         u+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=P2o+bBPYrQi2zofQcS37ItWabYs/Xye/ld739mrMLy0=;
        fh=dMf9d/yT7V9FeJEE2+Yc/hGOtoLFsVE946I5E2mFjN4=;
        b=zUMrDlzOUnEq3AGjIBYfb4uz0vzVywgS0+x/96IowFIvfDInGoNnF7aEELR2H9iqMP
         axotBHatVRvj4AEhrj7IOyGSMIhatj3HbxxYPe6sepl69lcWGHCEbTG9o9CFePOjN9BO
         W+KbEbcrw1P1RiyLDLZTZCFmGR89+WHxN0dP/5aj+j+i7zs1O365elGwmM9m1xYAhzK3
         96lW+hg1EEJhBwSfYWhut6P6gSIy9l3JD1kavK8spsd8+8oiFwLaRPV11f2U6ty9Ayq5
         SSc8pkVT83d8JmKiq7z2n531c8vbRPa15ayL+7Pj9exR26K+BWxUq20rkog/JANFxV24
         uAyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=sRlcQaN9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a0ce40a000000b0063765aa9426si1013005qvl.540.2023.07.06.08.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 08:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=sRlcQaN9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHQeR-0008Sk-FG; Thu, 06 Jul 2023 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>)
 id 1qHQeO-0008SJ-3b; Thu, 06 Jul 2023 11:12:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>)
 id 1qHQeM-0002Qn-4p; Thu, 06 Jul 2023 11:12:07 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-262e66481c4so480301a91.1; 
 Thu, 06 Jul 2023 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688656324; x=1691248324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P2o+bBPYrQi2zofQcS37ItWabYs/Xye/ld739mrMLy0=;
 b=sRlcQaN9SF8dJf7vSD48/DqdeETc5p5iifSOTydt/n00ALc/5WjyaCPAp+h3qo9C+x
 6kbLDEC8K6x3HHQLkdckHnl8JXjz91Xsv2IKCt/M86ojvxgNx5Nb9gbtr9LZgBX4NIOj
 nqGHZjSgNpkJ3I5LcMqIf7S62ULiSpZ0oOX/X9lqurgLfdLQtSepOMwiG4I0q1kzPsED
 R19FTHLNUbyxbtj5gGxkNL90AbGIhj/YJ/QrHyjpX6uzCDow4kDmsald/bYKx2QppX7i
 T7YyF7M35BMz59+zdDZbpR9grW14ENeVQh1uPBaG1XzdcskvadzT+XJxKYpiVV7c63EQ
 ascg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688656324; x=1691248324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P2o+bBPYrQi2zofQcS37ItWabYs/Xye/ld739mrMLy0=;
 b=bT5/olLW/ZClmODoeLJ8ef2hbZ4rw5xaMDNvbX+gvYxxd/hMlTHKWzGy/AVbQ7wwaR
 iahp5QezaHku77ufj3NddYJhhPzS7iQKOzV6ciPN3nV/RDo7Mm7Xu9zDjYWr3OeCv/QA
 gyPCL+EcEegGMbHrF+XionUNf7NppOaxxUqPAUv2w5/CTZOL3HXocG2pleYj2zQSwVLu
 nun9XXMIjv3nrfCAL1GuOe7PCw1LtKZoaxziK5ucUWfcSN86FNXO0vA58iKfopB6Gkhp
 QDPbY0nyky3X41Zf+5p84zWNhTm92YnJLQuORdF61B2YgTtF9mLkbQR01hChjg6grtAk
 SbQg==
X-Gm-Message-State: ABy/qLZSZF8BqJEjQvYUKzygsYm6i9hHFDd25zKpCw8s2NMJ8iN/TrHa
 N6XKDkrNuF7eIcAluo7YGu8=
X-Received: by 2002:a17:90b:3688:b0:261:38ca:3c53 with SMTP id
 mj8-20020a17090b368800b0026138ca3c53mr1589225pjb.13.1688656324313; 
 Thu, 06 Jul 2023 08:12:04 -0700 (PDT)
Received: from [192.168.2.146] ([2a01:111:f100:6000::4134:a26f])
 by smtp.gmail.com with ESMTPSA id
 z92-20020a17090a6d6500b00263dccf96a3sm1545346pjj.54.2023.07.06.08.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:12:03 -0700 (PDT)
Message-ID: <6342572f-8b79-4f72-81e8-053241e6ac6a@gmail.com>
Date: Thu, 6 Jul 2023 23:11:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] hw/arm/virt-acpi-build.c: Add missing header
To: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230706150839.1180137-1-tcx4c70@gmail.com>
Content-Language: en-US
From: Peng Liang <tcx4c70@gmail.com>
In-Reply-To: <20230706150839.1180137-1-tcx4c70@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=tcx4c70@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oi3kTPDKvmTF

I'm not sure whether the error has already been fixed by others or not. 
If so, please just ignore this patch.

On 07/06/2023 23:08, Peng Liang wrote:
> virt-acpi-build.c uses warn_report. However, it doesn't include
> qemu/error-report.h directly, it include qemu/error-report.h via trace.h
> if we enable log trace backend. But if we disable the log trace backend
> (e.g., --enable-trace-backends=nop), then virt-acpi-build.c will not
> include qemu/error-report.h any more and it will lead to build errors.
> Include qemu/error-report.h directly in virt-acpi-build.c to avoid the
> errors.
> 
> Signed-off-by: Peng Liang <tcx4c70@gmail.com>
> ---
>   hw/arm/virt-acpi-build.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 55f2706bc9..44cf9f3312 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -57,6 +57,7 @@
>   #include "migration/vmstate.h"
>   #include "hw/acpi/ghes.h"
>   #include "hw/acpi/viot.h"
> +#include "qemu/error-report.h"
>   
>   #define ARM_SPI_BASE 32
>   
