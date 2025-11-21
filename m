Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52BDCFC504
	for <qemu-arm@archiver.kernel.org>; Sat, 22 Nov 2025 03:57:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vMcyk-0003tn-Gb; Fri, 21 Nov 2025 21:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vMc7V-0005A5-9q
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 20:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vMc5U-0003cM-T9
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 20:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763773596;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4AWTSwJIb2mTpTHKdKaZ8TKE/oZXnCaKopazIhFZeG0=;
 b=NZ1jfHi2GEFXoPOz5xtWIw6X0Zlf/c00tN9ayOkvgGEL5J3PE7b0F+3fbGGpJm+jCrsQon
 p66oI6n9Vx6lBJ0zZI0oGiAO87KrD2W2OMwZn4Va6t7QzZ8/PmZ7ccUIFrKpfQNcQZI2KM
 BKmT4EfQLoX3OweX9KQeiw4oBOKK7V8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-5E5Dp7wSMAadA3SFTuuwiQ-1; Fri, 21 Nov 2025 07:49:40 -0500
X-MC-Unique: 5E5Dp7wSMAadA3SFTuuwiQ-1
X-Mimecast-MFC-AGG-ID: 5E5Dp7wSMAadA3SFTuuwiQ_1763729379
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4775fcf67d8so20452675e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Nov 2025 04:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763729379; x=1764334179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AWTSwJIb2mTpTHKdKaZ8TKE/oZXnCaKopazIhFZeG0=;
 b=Nyhf6hCbQZf9eFn67xem7YS/mSOsQe0/fBq9rvTfSgFHaGvRa/t5vx6aWrCefkKKcx
 Wz4npDFJJ2We0SGOO/Imw2XARTI4GUQWjUwG5DHG9YsnzLsKakr8Jffob/ciBoYlheZE
 GKnSrS5EAnOIVJVIOTwPH2VTS9YBFQZcLRNsR67nPNZ8tQvv+vZrYxlq1ruXe8ZTevO3
 aMitpX1vGIwx8TNPkkjQK/Stx0PkFNGXd7+39WoU+nPbwz+tN5FYdEoxqK7LfJTaYX6J
 6WJpQd0UJe7pZJSdxbdnDf9aB7fvL96GKyLt/xOwbeJkqFfOIWU2Mj1S3PPytcwhCL4z
 mOPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvgX0s1eiG1wZLj7cbjY2nfBZlca9QkijbYQpEK1fgQhwwcqG9hfKQXkpINLw/9mQz7/VP4snR1w==@nongnu.org
X-Gm-Message-State: AOJu0YyqZtPBsyQN8oU5AEenM+OUgcZ7qpRB2XCnPG/ZoEzHUR9lS7Vg
 nOMyYwO2Au6ZeeasbZnBdU94tyMtq/mlq/ecVD6WeaGejXNf/4PLGzDjDN/ZmPdZsaJ3ZHJ/iAX
 ym94IfQWj/WzUbVO545hUfknf6HQYXF90oQ/ZhKdS1kCkmG1YdK3YAQ==
X-Gm-Gg: ASbGnctsXckZY1LA6Z5uFBdA37BZiR4iUyNosG/b5JVnqihK+rlxUCeJvrml7Dlr6V3
 ssv94jvrGl4pZe4uSyDj4EYqVAqM+e/J3IZgtnnTeqQIoMF21Omvyo4v0uC3PkJ0bZAvkaj05Fc
 jllcBoB8DF6DOLylcdxtXj3XWj2zSAwbIw2qqq5DEOIcCbk0AhBElPI6bTYgnm156/FiaqdjNhy
 UCOmsqNqGi+jybMmqkUFRYzFbTLtHVhMYrKiZ+xIy3BGXh5MoxKgP4wxEp2H6eVt1dMcTU8afM8
 XY51Jn56X5wSZl0Syu2a3uZxx3VBqR9+qiCeu/SI7nPrwqZZE7w3gn/9p0u+XzjnSuXdlTDPqDZ
 XanbME9UQEyBSFEEckk1LdW8XDqwhgh7JsXpmadsK+N5SpGPbfGt0eqypXw==
X-Received: by 2002:a05:600c:1381:b0:477:7a95:b971 with SMTP id
 5b1f17b1804b1-477c01f55damr23714385e9.31.1763729378863; 
 Fri, 21 Nov 2025 04:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMqzEtQCUGNWn73XNChdroxtMemXBA2q9fHejmcW/RP3U25rDvaEhDoEU+SEV/hBgNiD0XiA==
X-Received: by 2002:a05:600c:1381:b0:477:7a95:b971 with SMTP id
 5b1f17b1804b1-477c01f55damr23714175e9.31.1763729378354; 
 Fri, 21 Nov 2025 04:49:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9df99d3sm83068815e9.12.2025.11.21.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 04:49:37 -0800 (PST)
Message-ID: <5ba8afd2-676a-4aee-ac9c-b8d0fdf8d826@redhat.com>
Date: Fri, 21 Nov 2025 13:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 04/21] refactor: Move ARMSecuritySpace to a common header
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012150701.4127034-5-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251012150701.4127034-5-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OfF7mE8BLZ9hjsemEZbrwyKJcgtQwVv1DUGMWJ69j5M_1763729379
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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



On 10/12/25 5:06 PM, Tao Tang wrote:
> The ARMSecuritySpace enum and its related helpers were defined in the
> target-specific header target/arm/cpu.h. This prevented common,
> target-agnostic code like the SMMU model from using these definitions
> without triggering "cpu.h included from common code" errors.
>
> To resolve this, this commit introduces a new, lightweight header,
> include/hw/arm/arm-security.h, which is safe for inclusion by common
> code.
>
> The following change was made:
>
> - The ARMSecuritySpace enum and the arm_space_is_secure() and
> arm_secure_to_space() helpers have been moved from target/arm/cpu.h
> to the new hw/arm/arm-security.h header.
>
> This refactoring decouples the security state definitions from the core
> CPU implementation, allowing common hardware models to correctly handle
> security states without pulling in heavyweight, target-specific headers.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
nit: the commit msg prefix is unusual (refactor). I would rename into
target/arm: Move ARMSecuritySpace to a common header

Eric
> Link: https://lists.nongnu.org/archive/html/qemu-arm/2025-09/msg01288.html
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
> index 1d4e13320c..3336d95c6a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -31,6 +31,7 @@
>  #include "exec/page-protection.h"
>  #include "qapi/qapi-types-common.h"
>  #include "target/arm/multiprocessing.h"
> +#include "hw/arm/arm-security.h"
>  #include "target/arm/gtimer.h"
>  #include "target/arm/cpu-sysregs.h"
>  #include "target/arm/mmuidx.h"
> @@ -2098,30 +2099,6 @@ static inline int arm_feature(CPUARMState *env, int feature)
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


