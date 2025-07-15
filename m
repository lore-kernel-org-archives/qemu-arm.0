Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A949EC83F1D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 07:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubZu5-000364-E8; Tue, 15 Jul 2025 03:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubZpS-0000vE-Cj
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 03:11:56 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubZpQ-0007TM-Dq
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 03:11:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so2895105f8f.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752563509; x=1753168309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=soLuh7uzjqz1LeLKlFTtKgHcxIuT3Hs89rPzmWxa8UE=;
 b=cpeESc7FTXraw49FaKVfm/e+TvMMdafxW11X7cdB36FDjbANQzai+O9YxLQtmJt5QB
 8G+MkrvAD89RugTYmd09mjWePnTRzilrQpJjA3UOdLjnpv5eAJSNmtC+yEL21xHbUeVm
 I/JWmMJOA+lYT/94HX8qgSlkBrhJro3XUw1k1d1Or6Q6C/qMTYWtiMAOkYIPwNMYDZTT
 hz3fy8QK/PovERiZFW2z6QB9Dj9473MQjdNhEyqw/xDk7vBmzPtpHEcWG8SQU1LHFHbP
 exkp8zDYhyw4mX/IW7p00VVM1KGGc2In/fxeeyLrtWq9k68nFJtNML48vNXYf2KM15vn
 B6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752563509; x=1753168309;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=soLuh7uzjqz1LeLKlFTtKgHcxIuT3Hs89rPzmWxa8UE=;
 b=IeuFqopzaPnUFPDa/SQUYvm9PzdDdForFyhCPYP/Z+palHI1NAkUv8Ki7LM3M61LFC
 0O5pfd5GCm6DkleXFsmPQHiDc+PAv6feFpmclNJIzpx9hBeeJgjCgXW1oX6nT8H61GGA
 Y9DRlXv1hpQHx2UbnrWD4WBXQ9lZgk6M8I3eO/WzyLBSMP5ls4Q1rVTaFrNmhaFPeW3D
 7SrgHutL/HbFzlNjP4mpNS5M3fUYHxAZmGYYaLJ/4tVQDZdnP+Ep7jV9g1F8B19m8Eza
 Szb0apgY56fJ7RTZTFuIBrFJCXlDe29J32ymHvrAwUbZqHeQgE88OyHrpKfWHIqLPO0+
 9Mlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/x294ypyy4Id35WYfody21qbBpafNc2JKUEdQPp+AtXTkh3K0XT4I0i+v+BmDGIPE4ekdQ9jcXQ==@nongnu.org
X-Gm-Message-State: AOJu0YzJPM/ncZonDRkwrj92MaQBawiwv7mexQYBYzGMElxUdCSQVtkv
 NliD9qEFLB342xFp+KDfvq7coHeAQXVbGOG//Xyc83YKRinD1LL3q4mNM7FVHxpr+TQ=
X-Gm-Gg: ASbGnctxG0Mhql83MSY49D9gloMX32pnU4fjNsHy4tsnRBKnNSJDQygmzL9Up/2wj53
 3FyzHfWDbLYZwcXdBgBMvVKXkCSogJN4sN5jaP9OsyyssI1OUbtv2d5MdCmwy643LQNbLIKF45A
 LufSnyEnuRxZqEDsld+GgITXJ72OIJoZYFX3FhGBZ3jHuIr0G0BWEO0xlSqzoxyP8KFsn3CIvLU
 HjNAlAycXrxqAXLxg9qTW/nIbENenYcjkMVpNIMLB1Tv96fYeqeu9gpW4OU3iX1mZ6QSDM8VHk7
 7m+Q+95bp3QUC7fAZy6M+EaIB6h6Rg09qHxBOEdTLj7cVDlaDNz79w53ZaG6u0+Ow8bPIBfcGU0
 eI8ryRWdUojZQ4ipN02kLYoQFcQn5ygXAHUec8uDa2oVBqOEZykgQ7C4wz6T2IcBKU4YW140=
X-Google-Smtp-Source: AGHT+IHFyCzYH+0DxLsUP/xPrOFlK5HgT3QiKPgOueBoXHrHvXU68nzU5nEMixuadqWMODzTwaQyAA==
X-Received: by 2002:a05:6000:290b:b0:3b3:9c75:acc6 with SMTP id
 ffacd0b85a97d-3b5f359d08dmr11783752f8f.59.1752563508693; 
 Tue, 15 Jul 2025 00:11:48 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1647sm14215422f8f.1.2025.07.15.00.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 00:11:48 -0700 (PDT)
Message-ID: <7a40eccd-d77b-4071-b498-bb998149a069@linaro.org>
Date: Tue, 15 Jul 2025 09:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
To: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
 <ae482293-80a0-4b94-9c34-4a8d5ce18b49@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ae482293-80a0-4b94-9c34-4a8d5ce18b49@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 14/5/25 07:11, Xiaoyao Li wrote:
> On 5/14/2025 1:17 AM, Philippe Mathieu-Daudé wrote:
>> As each target declares the same prototypes, we can
>> use a single header, removing the TARGET_XXX uses.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ...
>> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
>> index 4b26bcff7a5..1a9eeb01c8e 100644
>> --- a/hw/arm/xen-pvh.c
>> +++ b/hw/arm/xen-pvh.c
>> @@ -10,7 +10,6 @@
>>   #include "hw/boards.h"
>>   #include "system/system.h"
>>   #include "hw/xen/xen-pvh-common.h"
>> -#include "hw/xen/arch_hvm.h"
>>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> 
> This chunk seems unrelated.

I'll split in 2 patches, thanks.

