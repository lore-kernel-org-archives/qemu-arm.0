Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7075DCAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun, 28 Sep 2025 13:21:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v2rKE-0004cv-Pd; Sun, 28 Sep 2025 09:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v2rJW-0004TZ-Of
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 09:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v2rJH-0004EH-DG
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 09:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759065556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAqwSmfHBXCQKtyfCBf4IYw50EZzx3/5hV3zFjgb8ZY=;
 b=YvA7//uo27pnrb+zQ2nHsW7SQi7Euevy53cJl9JSb09rIoyH8+weeS22qmJgiXZFIoD300
 mtBdgxHtXzSyJ32QYok7u1pv58e4IgEctLxyk8RghyXwFeTxq3/YhwTzV0+svMVZeP06cq
 d/psuLddDFTrxX136DKNzbrASqw4ChY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-DJycrZeGOw6mLCakcVSv9g-1; Sun, 28 Sep 2025 09:19:14 -0400
X-MC-Unique: DJycrZeGOw6mLCakcVSv9g-1
X-Mimecast-MFC-AGG-ID: DJycrZeGOw6mLCakcVSv9g_1759065552
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ee888281c3so4356608f8f.3
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 06:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759065551; x=1759670351;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TAqwSmfHBXCQKtyfCBf4IYw50EZzx3/5hV3zFjgb8ZY=;
 b=CDGO946xEEPlMb67qYi2ydwZ0MLHXWIOMwJLpyJoZaY9Xm87ZPqMCRWqCDgAJgS9VT
 yqPwWjwgFMezNleuOHH4Aa5rNpwtJ/qTlbtf5G6H8AUG+EBQ50iF1RNN2QKFLdPQxgdg
 hXGFfRjm8SFgckWk6tCl6pMGTpV4c6qPIs/nLSxT8z8oJ2CazIMTwqDjJpb7un7dOhwV
 Xq7z+IHHx/mf668p/ySmLU87lotOzI2792/v8RDdQmjvyD7KvO//CXlnu/Uu+AxAj20p
 n7GABEtKSLbWMVbDceLCiHlouPAtoLqc36UmGG1QKCCiXjXevgsb4UFnqfCw1I3xs6/3
 0VZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6+qiNMQnsZfqntul69DtT3oqpw1B0xEPxckDdjdnAsMYgNYc8ne/B6NsIvUdcOp0r1xCxTa+GHg==@nongnu.org
X-Gm-Message-State: AOJu0YzNY2ts08ab6zX4YXci7VCxK1xqu8smb58QKQi7wS/WXcIn8qmz
 bBgdblLyc97YJplTBbVrVev+j4WQBJvU1z4zVca4IUNQqlfXNO95HticUdHg6Z7t8uDtmQ4cTid
 kWY/L4kyXOcjXRudSZm8WBuOSd+NeCekNGjiaiH1/ekWZmE//F3oQaA==
X-Gm-Gg: ASbGncuO/y1atW1RUijI+jhUhSMjD20PmwH5PYRhqjpHHnW3FfVgks8lKMlJ8rTv7mo
 WlzCAQf6+I0mPIOoIxPIWDSnKp+sza2jWQlAyLIGEfvlfZ12kAg0c5thpAqj2UTDSs73xi6rCJG
 QtduVkGyba1XVnXbe2C839qAEQz+FOmOvfQBFjq+UgMOyhWoo6FMcsC+gz1VYMaOPDz0eooJvaV
 Yi7KtD7OWNQNsH/RZHCjosMihPSkQ0dP73LpOVEi5RnEaX3veXZIFNg/+EHV0vDrA4b8Y0vjb3G
 vVdL0JCaL76R0GgIQb/LmJx8+8n1fdd7sMk5GSSKOWwsVnNvqzyDQekOaBgtAueD2ZhjaE34m/S
 S8sXEQ0tLPjc=
X-Received: by 2002:a05:600c:458b:b0:46c:d476:52f3 with SMTP id
 5b1f17b1804b1-46e32f091fdmr114399925e9.26.1759065550999; 
 Sun, 28 Sep 2025 06:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzagfj82DdPBo9czEhy9ReoeVz+LtXdBCVtmZZgMU1iGpxlnKo/+gkHTgnwW0AgjH4+b6v+Q==
X-Received: by 2002:a05:600c:458b:b0:46c:d476:52f3 with SMTP id
 5b1f17b1804b1-46e32f091fdmr114399715e9.26.1759065550537; 
 Sun, 28 Sep 2025 06:19:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f62sm189310565e9.15.2025.09.28.06.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 06:19:09 -0700 (PDT)
Message-ID: <00e430fc-6c63-46b5-97f8-9c70388c910b@redhat.com>
Date: Sun, 28 Sep 2025 15:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] refactor: Move ARMSecuritySpace to a common
 header
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>, pierrick.bouvier@linaro.org,
 philmd@linaro.org, jean-philippe@linaro.org, smostafa@google.com
References: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
 <20250925162618.191242-5-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250925162618.191242-5-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DClwr3Gs_4YwEvID-Qz1ZyMt4slurnJcWTlxjMkvbek_1759065552
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Tao,

On 9/25/25 6:26 PM, Tao Tang wrote:
> The ARMSecuritySpace enum and its related helpers were defined in the
> target-specific header target/arm/cpu.h. This prevented common,
> target-agnostic code like the SMMU model from using these definitions
> without triggering "cpu.h included from common code" errors.
>
> To resolve this, this commit introduces a new, lightweight header,
> include/hw/arm/arm-security.h, which is safe for inclusion by common
> code.
>
> The following changes were made:
>
> - The ARMSecuritySpace enum and the arm_space_is_secure() and
> arm_secure_to_space() helpers have been moved from target/arm/cpu.h
> to the new hw/arm/arm-security.h header.
>
> - Headers for common devices like the SMMU (smmu-common.h) have been
> updated to include the new lightweight header instead of cpu.h.
above is not done in that patch.
>
> This refactoring decouples the security state definitions from the core
> CPU implementation, allowing common hardware models to correctly handle
> security states without pulling in heavyweight, target-specific headers.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks

Eric
> ---
>  include/hw/arm/arm-security.h | 54 +++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h              | 25 +---------------
>  2 files changed, 55 insertions(+), 24 deletions(-)
>  create mode 100644 include/hw/arm/arm-security.h
>
> diff --git a/include/hw/arm/arm-security.h b/include/hw/arm/arm-security.h
> new file mode 100644
> index 0000000000..9664c0f95e
> --- /dev/null
> +++ b/include/hw/arm/arm-security.h
> @@ -0,0 +1,54 @@
> +/*
> + * ARM security space helpers
> + *
> + * Provide ARMSecuritySpace and helpers for code that is not tied to CPU.
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_ARM_ARM_SECURITY_H
> +#define HW_ARM_ARM_SECURITY_H
> +
> +#include <stdbool.h>
> +
> +/*
> + * ARM v9 security states.
> + * The ordering of the enumeration corresponds to the low 2 bits
> + * of the GPI value, and (except for Root) the concat of NSE:NS.
> + */
> +
> + typedef enum ARMSecuritySpace {
> +    ARMSS_Secure     = 0,
> +    ARMSS_NonSecure  = 1,
> +    ARMSS_Root       = 2,
> +    ARMSS_Realm      = 3,
> +} ARMSecuritySpace;
> +
> +/* Return true if @space is secure, in the pre-v9 sense. */
> +static inline bool arm_space_is_secure(ARMSecuritySpace space)
> +{
> +    return space == ARMSS_Secure || space == ARMSS_Root;
> +}
> +
> +/* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
> +static inline ARMSecuritySpace arm_secure_to_space(bool secure)
> +{
> +    return secure ? ARMSS_Secure : ARMSS_NonSecure;
> +}
> +
> +#endif /* HW_ARM_ARM_SECURITY_H */
> +
> +
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1c0deb723d..2ff9343d0b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -31,6 +31,7 @@
>  #include "exec/page-protection.h"
>  #include "qapi/qapi-types-common.h"
>  #include "target/arm/multiprocessing.h"
> +#include "hw/arm/arm-security.h"
>  #include "target/arm/gtimer.h"
>  #include "target/arm/cpu-sysregs.h"
>  
> @@ -2477,30 +2478,6 @@ static inline int arm_feature(CPUARMState *env, int feature)
>  
>  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
>  
> -/*
> - * ARM v9 security states.
> - * The ordering of the enumeration corresponds to the low 2 bits
> - * of the GPI value, and (except for Root) the concat of NSE:NS.
> - */
> -
> -typedef enum ARMSecuritySpace {
> -    ARMSS_Secure     = 0,
> -    ARMSS_NonSecure  = 1,
> -    ARMSS_Root       = 2,
> -    ARMSS_Realm      = 3,
> -} ARMSecuritySpace;
> -
> -/* Return true if @space is secure, in the pre-v9 sense. */
> -static inline bool arm_space_is_secure(ARMSecuritySpace space)
> -{
> -    return space == ARMSS_Secure || space == ARMSS_Root;
> -}
> -
> -/* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
> -static inline ARMSecuritySpace arm_secure_to_space(bool secure)
> -{
> -    return secure ? ARMSS_Secure : ARMSS_NonSecure;
> -}
>  
>  #if !defined(CONFIG_USER_ONLY)
>  /**


