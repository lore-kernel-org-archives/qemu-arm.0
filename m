Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C06CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 08:23:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ67l-0004YM-6j; Wed, 12 Nov 2025 03:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ66h-00040m-IM
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 03:21:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ66g-0007nl-0m
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 03:21:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so2673785e9.2
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 00:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762935692; x=1763540492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qH8ciBPiYP4qTrr6MlWxogBRhrjrYItQMLpGGH6YH/Y=;
 b=Sn/EqrYQJL7KA6fmpS4zGW/twAP1TIOlgxGkuG7YdmuX+xRbxgcgPz8NCzgfvVwdFc
 X2t2mYmZThkcvKulPIwrryEwZonYLEnfSEy4fPkL/+OX3twlkSdDpTbBecz4ZGVwCtiR
 OkxX/HfOiRYwaHVJzfJ6/KRJg9BZhMS4D8fzWaq82Cg70qI/le3USPKA3LmlDgyL/QdK
 SPUBVMccs8HpSGNlsnMhDEnGDb8z/NtkML+/PZ192lnaG8Q17Z2G+sfu3o8rDq2/KlpL
 MbfF//dJdiEWUX2QsfHOzyFiCTCshIWoHSGVNE41Lx0sOvNkDZ0nA0vva5lZeiAbG6yq
 9xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762935692; x=1763540492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qH8ciBPiYP4qTrr6MlWxogBRhrjrYItQMLpGGH6YH/Y=;
 b=aVrWYI3mU167AfouFoNDdtKtN6yMMrwguYf7ApCnvDDZHTi9XOkGeCDWkkEx7y6lkM
 Q95Bf6Sr31EliVmKLtA90AMnNl3xa9M2n5yS3Bw8oZ5+7OHMUkPYNdiZx1G8MeartTZI
 PiS5tI97PnFh4rcady2Cm3HHQ1tvjF52hHipGpauuwXeHwbuRZEaa5lzZodAp1nsTsEM
 2W55SqQkcI8eJlrkC4yRS52ivJrgGOYBUQ1eYQhgUEN2V/FWhZWwKn+dVwYC3MEIktgK
 hLS0xP1rYSTdfhbffViyttLBEjGeaxdbghNsUkjZW3mOFkr/8Pgo2+M/ZkN7SGfilHwI
 BmmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/rjlzPBS1tZB2aS9sSThVArTNV+B8dflc+L5hxt0T4ahcPEoVqG4SX+kukSWi96tJtHZ6VLYqgA==@nongnu.org
X-Gm-Message-State: AOJu0YxUGYEws+8mkB3QAp6uKXsdVtMKLvaKSgISPYHSvK44aTVjR518
 ZYI9uAsDPHFwPczZhzLACyWzblADuzhyOgiAvaMNNoPvYYRi+AbflI6/OYSCXn95keg=
X-Gm-Gg: ASbGnctetayo460EOovUJIyjkAGuzsMX/9gqCUQf4PdGMWEn7YeHaalz6a4DWbxUquJ
 CImtK5ibOablIVgxigt4nUxNARXqBLwDxhvD1ACMgM6Raa+NcMxrXj72CE3565IVhCtu44BuDhc
 NwlV3RZQNCpWDN7oNWfCWLuBLs7JA6RWHZrCBZKNxl2Ydv3kdQqfkWm38O8TyEfM8/lc1JhUmnZ
 lg550rx4Iz0ef4kN3OoLb5J1GLrwM2V3wj08AGs9kLXU950Pnz1pJW8GihaBtobozc4WqVZvVzU
 1lUqAWJwilQekDLrJYGSrM1cDbMgkhR6aZjQGyLov4XRiPvLz53DM7CKyxRE5czgJac63Wu7A03
 4PZ/sv5vFYAbe5hK4btoJusyJT3HElj4Ic+3ZBLva1kCiVipdj2oKxlsre3pWRY7N2B8TO5oUBk
 EtnHl6VLOLUCdAiU9qk+E7wzW3MEPGXy4ZbrEyc0H5Ers=
X-Google-Smtp-Source: AGHT+IEwYyOPzWvvsyZ9DfQBUPVAoUbXt4aj9HlMYrl5w7n4+sSw3BCoX29cOGNINjkVE1x10f+4gA==
X-Received: by 2002:a05:600c:3546:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-47787070774mr19154345e9.2.1762935692249; 
 Wed, 12 Nov 2025 00:21:32 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b316775f2sm22565926f8f.16.2025.11.12.00.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 00:21:31 -0800 (PST)
Message-ID: <26e9622f-2390-4a30-9c63-2374a1068093@linaro.org>
Date: Wed, 12 Nov 2025 09:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/19] config/target: Implement per-binary TargetInfo
 structure (ARM, AARCH64)
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Luc Michel <luc.michel@amd.com>, Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
References: <20251021205741.57109-1-philmd@linaro.org>
 <20251021205741.57109-7-philmd@linaro.org>
 <CAJy5ezqRdrpLvN5T_hZ2ec2FzQfQJvd+Osa9TpcFrOg=v8QW+Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJy5ezqRdrpLvN5T_hZ2ec2FzQfQJvd+Osa9TpcFrOg=v8QW+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Hi Edgar,

On 11/11/25 22:28, Edgar E. Iglesias wrote:
> On Tue, Oct 21, 2025 at 2:59 PM Philippe Mathieu-Daudé 
> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>     Implement the TargetInfo structure for qemu-system-arm
>     and qemu-system-aarch64 binaries.
> 
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org
>     <mailto:philmd@linaro.org>>
>     Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org
>     <mailto:pierrick.bouvier@linaro.org>>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
> 
> 
> 
> Hi Phil!
> 
> Trying to run xenpvh guests with latest QEMU but running into trouble, 
> the xenpvh does get built into qemu-system-aarch64 any more.
> Bisecting pointed me to this patch.
> 
> To reproduce --enable-xen, and see if xenpvh shows up in -M \? or not.
> 
> Any ideas?

Oops, sorry for that :/

I suppose I missed the following in commit 38c5ab40031 ("hw/arm: Filter
machine types for qemu-system-arm/aarch64 binaries"):

-- >8 --
diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 1a9eeb01c8e..86a02966161 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -12,2 +12,3 @@
  #include "hw/xen/xen-pvh-common.h"
+#include "hw/arm/machines-qom.h"

@@ -97,2 +98,3 @@ static const TypeInfo xen_arm_machine_type = {
      .instance_init = xen_arm_instance_init,
+    .interfaces = arm_aarch64_machine_interfaces,
  };
---

I don't have a handy Aarch64 machine with Xen anymore, I'll see
tomorrow if I can get access to one. Do you mind testing this hunk
meanwhile?

Thanks,

Phil.

