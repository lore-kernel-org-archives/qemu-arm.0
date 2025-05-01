Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp409518njj;
        Thu, 1 May 2025 12:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3fPrME7qMwnXTGYgCI5YbegZq0SyJ+keotxrqPCA161R75mJMHR5J2HmMr7WK3HW5IxnzuV+9gMg9Hw==@linaro.org
X-Google-Smtp-Source: AGHT+IF5FezhzW5E8jcJ3+8lKUjckRAn4t63oIn7YfTfVl3muhcxjvAhjJKWzRO29PPq2BGFf49C
X-Received: by 2002:a05:622a:1f16:b0:476:b4c9:f4bc with SMTP id d75a77b69052e-48c330bf3camr275721cf.46.1746126184875;
        Thu, 01 May 2025 12:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746126184; cv=none;
        d=google.com; s=arc-20240605;
        b=CR0yCay3YlNjE31axuNDEfagVPEOiBuZMmAJP6J0PBtu3LKAMjv4IvUJv+GJqorqga
         NIB1QMWLy17E/x0tg5mJlZNIOX+IVGHXIPOjn/pZ36pQ6bADCdntkICxKlnXcThxkgba
         z/WD87bonwHwq8io8XnjwW70e/Rhc0TFn/lw8dtOI3aN3dAyc/WgwtsBULpyW9M05kTE
         vjx/xJ6gbSDrq+uHTr3Abv2t9hvXeCmLq6sBFLVKi2ivapPi4lc5bq5kiFZUTyx+BZzw
         d6ZFrhwYQGkwIycnZ93DCbYAmIYP3qJu/INX/YmC3Rqzb0h463BbSzgLGYje2lrVK4Aw
         ZqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XgcGSZOdA5PkQNmUlsgmbprxhpBnjZCzinx8Cu5Y0dA=;
        fh=afWlF3vANfhd/RZPPgFBIpxHVr6GghsCMfs6oVFKe0U=;
        b=MkhYl4yzyr2V8FFg9dixU5pvJSkG5MU/pZylr+WYhACWgGC+otJrFQlWPUPawCxURA
         mKkDG4z3RofIiZS2BdBqXmvP8tm+sl8LZyn5ZV/T6MUK2whQ2sdnzWXV8seLr3IHgAZr
         Ir9gvqrRTvrlZESXZJhCBJwHBvqS9tWqQkLEts5DcZ4Me3h4RWKgWVuU1YldLpnROOfZ
         1okbglD5NN9NAriHlxlkWQtAHw9UzbQnm5K04XwmmmbCk2YZqldLt80KFrBI9bSMbAcz
         W1zvMlSggNtnuVEzjlFioGrxuE7DkyMeJEGsi8SxXsn41eN577rtroTNEhp4VV2cmOmL
         0NKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iX/606hi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b987243ddsi11615531cf.402.2025.05.01.12.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 12:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iX/606hi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAZBG-000886-R9; Thu, 01 May 2025 15:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZBC-000876-Gy
 for qemu-arm@nongnu.org; Thu, 01 May 2025 15:02:42 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZBA-0004Jn-E5
 for qemu-arm@nongnu.org; Thu, 01 May 2025 15:02:42 -0400
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-85e1b1f08a5so40454739f.2
 for <qemu-arm@nongnu.org>; Thu, 01 May 2025 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746126157; x=1746730957; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XgcGSZOdA5PkQNmUlsgmbprxhpBnjZCzinx8Cu5Y0dA=;
 b=iX/606hi/q33Suy9sRp7bpGAixLhSVfiK4884poJvilOZMwQ2yA2KzbS8408Ef1Jxy
 JdU/jhNUA4qCa9XPKr53uSJp3FolC4KnWmy7i0dfdMgmVjrkdoTnQ8pmoTmGLSe/pmT8
 jaElCh47J5BdjGu8VPxMq/op83m6wThIe5T9nz33ToZ6IIoN85VKCic+1/iUUFy2Amn9
 Rnyg19FfPzqNYbwQHg32zNgab0BvSYQ7zF9p+0u48EVQ+rQ7AYIvVQK8mJG5RLBsGJLO
 MNShgMrUmXCZIGklTEEchXnKtWex6jExzLE4aKD9VWAaYz+4QoGbKx1luCuLyzOYnGHV
 rslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746126157; x=1746730957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XgcGSZOdA5PkQNmUlsgmbprxhpBnjZCzinx8Cu5Y0dA=;
 b=cal49MdGzAwdbNLFyMGh5wCdOwEVcRRHwNoOEPBNakhVnHjLL4Lyb+3u8c8q1uZdFE
 P7TAw74pNcOXYLL/bh5cI3jl9kYWgHBtleybgPua/Hyef+3L5ccYRdZHinGonHsdgCzw
 bRASdqEwB4kf4bsWwI70vIs8cGtqPpstfU/igG7OvcWLyRVFjQndIVsz3CFEya3q/KOf
 3mvapeyjmuv8BeVu2xdQ4+vpoHeiP4ZzeWjvw9WTeSdmGJ7IRU2kQRkcdRymNp9L4ATz
 x2qE5Xd9B3rxxUknQtYy3jVcENBNalfkK/pQW0sdM1ACu6fCluholsaufh0W36tAUZ2M
 NRoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOMs8HdHcNqzBg38zwe9vCl92se+hDERm7VFhbqCg3yDtymGzXr2Q9WswU7u0xxU+FFZM3dKt/Rg==@nongnu.org
X-Gm-Message-State: AOJu0YzGcpm8BuHvec0nIUUZ+Aa6bW+QKFJOdBQSLj5T79Wgeeg5jU/x
 rEbnMRENNfTmMfnqa8LVElM6KtnV+NMqtYHBsntVBVkQrbAleIF9T/urSKUHt7Y=
X-Gm-Gg: ASbGncvUlhr149qkMbJ/rprzCbiQBXW6A8U5xhBqZrFDQSnbnp9sgYMFLa6eSgkFUR1
 sGqKU8St1meEx71hv/t3/hKzGfOf9xKSPdgVfNs+AN7rQVtvF+NfmdIb5MEVMDq23EkS76fDnxv
 ssPhgby1uoZloFTUa56ZXr6YebkULyuIRuBOiNexHPCnaPIitB+c8cb6tExKySCf6FA93WyXrZV
 7vDJN37R1OHxAQRzc2FkeimNkaofcY1kBKNWnFVKhYilTODrdd8SleKz3moFRKp7tw3LeweoNnU
 INZ15t1ODJM6ROGco+VfztfGSw3qRzSXqvEn+BRqGNt5Phknw3OEchupAfc1PfwhwDxjAH78/Qy
 I9X5BY39/QayIlA==
X-Received: by 2002:a05:6e02:188c:b0:3d9:6d6c:72be with SMTP id
 e9e14a558f8ab-3d97c15cfc8mr440065ab.3.1746126157361; 
 Thu, 01 May 2025 12:02:37 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975f6dd89sm2664605ab.66.2025.05.01.12.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 12:02:36 -0700 (PDT)
Message-ID: <e7088647-aa76-4f64-b443-0ca354df8f24@linaro.org>
Date: Thu, 1 May 2025 21:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/pci-host/designware: Remove unused include
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20250501183445.2389-1-shentey@gmail.com>
 <20250501183445.2389-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501183445.2389-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=philmd@linaro.org; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: m2KP7RHj8C1I

On 1/5/25 20:34, Bernhard Beschow wrote:
> The DEFINE_TYPES() macro doesn't need the qemu/module.h include.
> 
> Fixes: 13a07eb146c8 ("hw/pci-host/designware: Declare CPU QOM types using
> DEFINE_TYPES() macro")

The 'Fixes:' tag is for bug being fixed. Here I suggest:

   Since commit 13a07eb146c8 ("hw/pci-host/designware: Declare CPU QOM
   types using DEFINE_TYPES() macro") which removed the type_init() use,
   we don't need to include "qemu/module.h" anymore.

(I can do the update when applying if you agree).

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/pci-host/designware.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 183f838392..b4bff14579 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -20,7 +20,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
> -#include "qemu/module.h"
>   #include "qemu/log.h"
>   #include "qemu/bitops.h"
>   #include "hw/pci/msi.h"

$ git grep -L type_init $(git grep -l qemu/module.h hw) | wc -l
       50

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

