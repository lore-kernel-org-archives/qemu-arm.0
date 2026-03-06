Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC98F0180E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:13:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyREw-0004VS-EX; Fri, 06 Mar 2026 04:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyREr-0004R9-83
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:12:53 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyREp-00083x-I0
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:12:52 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so9421159d50.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772788370; cv=none;
 d=google.com; s=arc-20240605;
 b=NaOBX9ERFWG9NPTzJYkkKpPx/Hcu4duh0jzXe+qY9sqopYfZDAaD5eKN9SQbvigk2G
 ui/qIcmdoZDn11EJ0PYFQ0iYgtseDTuQP5EDx/Nez1flc5N6MB3E33o/jZDQzn+n2rqC
 dBWda4Ttif5R5/TDSDkoQTH+hPwlIBLiW/T8ohx9qGUVrcwVA4U4oZ981u1/j7I2zOdx
 Pf7ZB8pDx6T7ZNfQtHhhGV2AYvmcm8Qf09P3rYvCiPoS6lSxSiSDA6d4JXqFbtiHaPnW
 JLCFJDlfN/cGPhzVxoXVneZf/kJlAgKosU5FDOPBPAWK/yJa6C7lJ3mIZaBFjgA9GJpy
 etjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tKLJ5+fiyUnNHmV9IryplIWI4j0jIDkQvWn3V9Nn/ZU=;
 fh=KmeOpIKiT0nTNVMoZr09GQRxsHt0uhdIA6einzfgXPg=;
 b=L/WFejRdjmTMcqy9XhSe10BdpDPAzkPaM/iRz2d1mHSNfl81mczS7soy+BCHbHHfMN
 NcL8peh5w42zxNmADeOdSXpEtmcDrL1++GsDXeS4gO4CoaYCYHIHFXl8/zfc0GybBeEc
 ZVG+onETqbQ9LVWmZ3ADvORby66bZ2WHyvxK1yBmEK/3OHIulQIgzH9+D4oD16oC7TLD
 QORL+AE8aNkm32bY+1aoQh041XrpTNAoVS2+TbTLVJVWsat6AAcjE9+I3Sd50uNg64Hy
 K20oxfj4m97pcG1DIxwyGCO6tnyxHdMo+OHTC6kmVleC9YhhOs4maPqmJTFpto3m6jGL
 KxTA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772788370; x=1773393170; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tKLJ5+fiyUnNHmV9IryplIWI4j0jIDkQvWn3V9Nn/ZU=;
 b=nYYWU10GtKchy9nMp20fN+hRdV0WTeTJhNPl/yurtC6PqE+f5aGpoX6qRSwRiKQbGw
 vK0Q+rB9b/rpu1M08mXsAABIh5+CKHir0BsMMHTE9U/z4vHGJ2uJcyleEINKDIwKl6mX
 RguGSR/+Zy1Wt9DZKZ2sYUVAS9I8MBq1jwGR+erXe0qzJRBK2/O+VKiHEaN5+EmK+hRq
 kQpcaQ0KfOVVRlkPjUk6wesN2VsWaP5xjD/TYTWF6L0DxyTHomIUVDijQy8XmeuSHHce
 S7Z6phT2y/pm5U2Txy+7NXoqyVcL2Dpj5uBSqb0m7E7TBnw4g/MGFTpn398bABqucJr7
 6N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772788370; x=1773393170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKLJ5+fiyUnNHmV9IryplIWI4j0jIDkQvWn3V9Nn/ZU=;
 b=N7qFVVrA2xuTQL1u4hGim6zf6xgb24iS42bYHEwVKEoyFC8A2ed/nkouTwNFzeP6Cd
 IdbV1i4+MjMSGlr2uZjwFdYW8eSLs7j7xoF8kACCbOiFNhYVSg1wV6svaYb/xzdzoqqG
 /9DVnxVclu6AsQcD+npUEIloA+VgYZPCBV5pFKLTsu/NnJotrIWxFwAkeFGOidYeW+JS
 GhlbrzASpHnjgjkCg1I9lqSbGep6EcwCmGAxDkx5Cj3PdFQgnghWjUzfmGUdOzHzFAUi
 iyNOTQeyBJHy99vl0o3x+Tu+tZoKahj5oWkZVqGZD5eBY5chy3xYikmX/SFgY6BYZXk+
 KyVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTknuSIAEpGaKA5G0q55u3W2uuxJ5yuFDMXNnZOYGirvdqUfnNtvQwTNB7jdzzFv7sxkiFtryiCQ==@nongnu.org
X-Gm-Message-State: AOJu0YwUW/HY1eZWR4Aa4koZDYFVwiIBGGfu8SMtJVJ3tlwH3ZV1qvBW
 9PekDzElC8Jkhl+uYIifs9VJBuIHGHQehr5pKViLac9FrrTk0FvHLvyH0qW9IiXdQl0+SYScdvE
 saTeqxKvEWtz3Z5i1vf8/3YvzWbT9Bs04p7iNdxLL1g==
X-Gm-Gg: ATEYQzzJD7DUBI6gPVgzK2+m13CjMRbA8tL5pdfH2fYu1jL6I8kx9J/qcOpedXzPL+3
 EjbtsWjB5NWGZeWMFcjh/7fPeWV4gkbzAZj+lm6tfcRiiaZbIIFMc1CTkoBR8uWxzT4X33nA1Sl
 I4/fCPR/vf0wvZMNuatb/U9OTOTWEjyPChrIxngtFWHoPkJRe2Xt51z+D6EmKWw0uO2sicUTKvu
 o47Z7mKW8MeoL6rSaa0SSGBfL1Xux6nbdchUDufPZ3J97fAlN/YxClmM17p9zg2YkVWtk6v1SkA
 56OE/PtCryG2sC33ak+FDjPOho6YUCjTTuoENVkANNS2ENEe1oXrM3jnxcnZb3LTqlo=
X-Received: by 2002:a05:690e:128d:b0:64a:e62c:16d0 with SMTP id
 956f58d0204a3-64d0715a088mr4764121d50.25.1772788370232; Fri, 06 Mar 2026
 01:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20260306083113.74177-1-mohamed@unpredictable.fr>
 <20260306083113.74177-2-mohamed@unpredictable.fr>
In-Reply-To: <20260306083113.74177-2-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:12:39 +0000
X-Gm-Features: AaiRm51dYvL5TEy2KcesCOtpGU6nJApG51IQ10CD9Z3R0p8zbYDeO3F_ZSE0Hps
Message-ID: <CAFEAcA8CpS4_HdTRQmPO+1k4ZktRifB2HcObNdWkTS-ANqZtmg@mail.gmail.com>
Subject: Re: [PATCH v14 01/19] hw/arm: virt: remove hvf_arm.h include
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 6 Mar 2026 at 08:31, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Having that include breaks the build for Linux after inclusion of SME support.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  hw/arm/virt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cab2e21e8a..7456614d05 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -71,7 +71,6 @@
>  #include "hw/intc/arm_gicv3_its_common.h"
>  #include "hw/core/irq.h"
>  #include "kvm_arm.h"
> -#include "hvf_arm.h"
>  #include "whpx_arm.h"
>  #include "hw/firmware/smbios.h"
>  #include "qapi/visitor.h"
> --

Regardless of what we want to do about the compile failure, if
we don't need to include this header we should drop the include, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

