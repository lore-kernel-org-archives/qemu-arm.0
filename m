Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419DFC87FDA
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 20:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukU6F-0004iI-Vf; Fri, 08 Aug 2025 16:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukU6D-0004gh-OB
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 16:54:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukU6B-0004dH-8g
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 16:54:01 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459e794b331so16288795e9.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 13:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754686435; x=1755291235; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dK1mSePuzQi5vFMqq3zLVnNB9mgHDPjX169GJFS95+w=;
 b=tK16qAWTdEXT8H2S+4rvIl61F+ha/sEprxZX5vTiJBYkOvTTxv5Vjl62H7PKuckxVP
 saRxDACdmUJ1N4Y/Cya7jU2S41HJlbwOQcjlArpG7nOi7VtaWMyFdfgO42KqVbJ7yJMI
 x8tBoM+PfcO7Apy4t0TTQnxjXP6KP+tcITRPQVkITQbrOxU8ApoVCjQmA1DsDD3/ABg+
 fWHU90NCX3TSJiW/veQ5dLJOFv9itrAv+ERCNdO+Yvu0PHvlHHo2WNX0ydOlZNPAo+rY
 bkWivREBTzfW+1yxYmuH8pHWVcxKc9hO71sKYyp2+AGmNkmmBy/8xvR6fcvoGaGCuriR
 DEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754686435; x=1755291235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dK1mSePuzQi5vFMqq3zLVnNB9mgHDPjX169GJFS95+w=;
 b=Jfm5hlyY9+8X12ljiDFAmu+zucinDC69wr9O7UzKgVIBygShkvLfKTvNfShpWOBIY5
 Bd4LZGXoCLuLeMn4XC/K+8u7fC+mc3I6PMpe0fFJ07r2DdKZ25Rp2wFx289SFYePHIry
 ccuqgsLC3BzDhvZc46t2Crh1F9qEnIJxye3jXUgKiYkZe6O/m4i7DBmcXA/gKiYUohU+
 F21xUdRS1YD03TqjLPJouAH52WfgIx29EMJo3a4bCw6TkoqGpqOfaFzWlCtBhYK8/aOV
 01JGHQiATUs4LnS33+Y8i7JDQZ6KNLNB5Giy0Kuy+7Yfj8/Seq98WzYxIjzcx1LkmUIk
 8vcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW40Va2RvOq66EgtxvKB0E/WIsDks090LsdndOOoJiBkyrLt1uKICPjXGCGRXvr6A/2lSKdr31EKw==@nongnu.org
X-Gm-Message-State: AOJu0YzZomevreooMe/OV29L+3tn9OxkL9BLh4c21y/qwIHx6b45Qj60
 N42qPstYwHU2FZxFWKWVxdtBW5a6wMWP3itWJuofNCtMQl6+57PKoXNEGYkoMqazoB0=
X-Gm-Gg: ASbGnctt+sZth4pQII32Pi4k4AGcrfBHL8U1CzK/+Am9miwRPPZ8JWQ0IzYmm/S1wsG
 b3gVfZz4MMdCa83k9pfECrrUxhJAYBdwXIwgJKGfeWolki0Yu8L394BJ5dCW6lG4DepnrgiP8vA
 YkaCZE9R+Wd2z+E8q7PFz615psg9zXwoNt5E8FnsnkwqH77gNKp76ukVnN0fAD06wGqKcrn0AEj
 d1yITtrSMxJi4Y3DA6hZRyCBssPI8fa+5IVTKUYWkyIgxHHxzO8rwkE3VtB4E4Td+2bKGZWL+P3
 bn4xyZrV2lUq9CU1fAtTUMTSDxm3TeOHs/l66kkeqi0yjEMdxUC830xF+hGNAAIhKJPlgdGiRJ/
 dv9FnY7EqPtCyqNhx/K61YDFbguQdMTKMK2UNmllEgzBZIQeP6GktdaxaeA88BguGow==
X-Google-Smtp-Source: AGHT+IGiYtqWUPDxeDAm9Y6dGkC4VVcGlK6VCEt81E2pwWSu8bvoptIBPZAuLKCfYRojSMyIyX0oFA==
X-Received: by 2002:a05:600c:c493:b0:453:66f:b96e with SMTP id
 5b1f17b1804b1-459faf4758bmr15864755e9.11.1754686434800; 
 Fri, 08 Aug 2025 13:53:54 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ececdsm141719175e9.1.2025.08.08.13.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 13:53:54 -0700 (PDT)
Message-ID: <cf8eeadb-fd6b-4d39-bcf7-4db9745f736a@linaro.org>
Date: Fri, 8 Aug 2025 22:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/18] target/arm: cpu: mark WHPX as supporting PSCI 1.1
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250808065419.47415-1-mohamed@unpredictable.fr>
 <20250808065419.47415-12-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250808065419.47415-12-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 8/8/25 08:54, Mohamed Mediouni wrote:
> Hyper-V supports PSCI 1.3, and that implementation is exposed through
> WHPX.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e2b2337399..3b69c9786a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,6 +23,7 @@
>   #include "qemu/timer.h"
>   #include "qemu/log.h"
>   #include "exec/page-vary.h"
> +#include "system/whpx.h"
>   #include "target/arm/idau.h"
>   #include "qemu/module.h"
>   #include "qapi/error.h"
> @@ -1496,7 +1497,7 @@ static void arm_cpu_initfn(Object *obj)
>       cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
>       cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
>   
> -    if (tcg_enabled() || hvf_enabled()) {
> +    if (tcg_enabled() || hvf_enabled() || whpx_enabled()) {
>           /* TCG and HVF implement PSCI 1.1 */

(Update comment, or simply remove it?)

>           cpu->psci_version = QEMU_PSCI_VERSION_1_1;

Maybe we could implement SYSTEM_RESET2, SYSTEM_OFF2 and MEM_PROTECT*
and bump to QEMU_PSCI_VERSION_1_3. Or add UNIMP stubs and here
directly start with:

        } else if (whpx_enabled()) {
            cpu->psci_version = QEMU_PSCI_VERSION_1_3;

>       }


