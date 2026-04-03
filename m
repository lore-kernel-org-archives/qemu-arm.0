Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BCFE88D6A
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 21:53:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8mS3-0005Ie-0m; Fri, 03 Apr 2026 17:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8mS0-00055S-SU
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 17:53:13 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8mRz-0006r7-CX
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 17:53:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-35d90833cacso1350127a91.2
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775253189; x=1775857989; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oyqNi/Uf+NyuGj4uDxMxhkbq8AG4iX7BGkiZVYrqDTU=;
 b=gzN0ygfr17toNlMbZ/1dh22nt4ZeyqDBlt3c8qSpp65NYdpIANmO+RarbeRCYXwdCP
 3ZQ4t7GWkhLfh8I8YdO9RfHFVd8tvIBlodj0MFqYE4XeUClwx0k2sHMsL+7ibEFS54NU
 b8cixU8lYVsL/NH+M37YEk13lwK8RB/al+5L7Usz0LSxLLRUUPnSDzoZ9ki8noDoYhhS
 P6Ch6+JoV/fLRsDT5uLUxgEDWLDaM1yocJzh7yGBoh39ow3C3pqCH4/XGkfVZuHgkGoh
 CsWo3P7X113Wec15DLRrKbibSr7nQmcCegLP9AMrw9clGeusBng/A9wckil+RcTyzGqn
 bo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775253189; x=1775857989;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oyqNi/Uf+NyuGj4uDxMxhkbq8AG4iX7BGkiZVYrqDTU=;
 b=QP9pB4RBTLIYfpZg+yBw5Dfz1R1c8ANQ5uqa8czfrWoUL0tYDDvEJKdNkKZKwvmsZf
 wyD7BBivabb05uxrczNKzwLMpavPCr8fig9ymT4I2HAsll8oxlixiOrjJllC/h0zs29J
 uX6SiaYGI/9O3WCGRY7CHWN1CWtOWHFE0QBx0a60U2cLOy98SRON1OoKeThrYVIZabZ2
 B4VIqNTxTgl8UTEO+mi/nDhsmoSm/JIoSBx0zRknRyb89M6UGSdVsV1m4xc8OxKGgHkJ
 n7ZXxpeUgYXswlmdFBgzoWE5TaVe63uNRQI9w7lM3+IpeFxG+uzk6kaa+JLFpXhgO68z
 oIJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7BS6/gR+1/RKdNw5X5a6FP81mMW0JtET1w8Xk0oHQf4m0G1Kgr5wwBqZWtYPCVWvTpxl7GVd1UQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxl7kW/Syw2nz4fl2WpJ0CRIRv0Okp6lNsGiowtc5JlsXRAIzi2
 DMShfDwoDOnXQv9R9OR8Lv7usXxMtDj10e+akqWRsAEx+wlHkXBMAmx6FcW2CORGsBc=
X-Gm-Gg: AeBDies7ZUD7V18TokOir4J0F7mY8vn7msGiksimHNZZsCsu1j24qGHjxMNL+MvNm6H
 n1adCXkt5PUu8ctlTeV2kkFC0KHIJFonfAXlQV/Yk0ORYKxoBMlclIcTDh0fAlkI7ygb4fEkRXM
 MJH2X7wq9pCAiQ17HIwnVukrdtCLAI8ob+4lHJJ2/I5tyXyqaPsTyQNvJr1ZCrudJ5bpRHsU7md
 ZWx32BaBoyuPzItTYWXDooYCtB8DyZEXk2GtVrympLwmY1Od7zVz0mGEtjQay7H3T2DOQMM+o6B
 jWc43BD6TpZwivagf6lit9mGMir2RmJC2NEercGOtqQC3aZwlrn/UoX/UlcMmLUoGEFX7KF/WlA
 c/oqd5ep/+nckz72ubBuenKJVQP0gm8n45Aom5LnFxv49RHMMoOaTYO4peoTcP5g504pES2YEUV
 kTNwwEUGyQrLNu266C54dihll+kq79Sxr4+0AGYIwgZKf6zAuhwwjvl14YtdAi/ul1haE=
X-Received: by 2002:a17:90b:4c8b:b0:35d:a2d3:5c44 with SMTP id
 98e67ed59e1d1-35de69d5567mr3818669a91.28.1775253189282; 
 Fri, 03 Apr 2026 14:53:09 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe9709b8sm11043320a91.16.2026.04.03.14.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 14:53:08 -0700 (PDT)
Message-ID: <6af2abbe-2626-4401-b446-6a2f603cf1c2@linaro.org>
Date: Sat, 4 Apr 2026 07:53:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: cpu: add HCR_E2H on reset for EL2 + !E2H0
To: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260401220720.19555-1-mohamed@unpredictable.fr>
 <CAFEAcA8qchsEganwrejiqoWabUd_BmNfnS0AXzWR+tT61OsjyQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8qchsEganwrejiqoWabUd_BmNfnS0AXzWR+tT61OsjyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/2/26 21:17, Peter Maydell wrote:
> On Wed, 1 Apr 2026 at 23:07, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>>
>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> This could use some rationale in the commit message:
> why do we need it, what goes wrong, etc.

Indeed.  I would expect this to be handled via hcr_reset and
a2834b853d9 ("target/arm: implement FEAT_E2H0")

Specifically,

+        /* Strictly E2H is RES1 unless FEAT_E2H0 relaxes the requirement */
+        if (!cpu_isar_feature(aa64_e2h0, cpu)) {
+            value |= HCR_E2H;
+        }


r~


> 
>> ---
>>   target/arm/cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index ccc47c8a9a..5ffb1e3096 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -685,6 +685,10 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
>>           }
>>       }
>>
>> +    if (have_el2 && !cpu_isar_feature(aa64_e2h0, cpu)) {
>> +        env->cp15.hcr_el2 |= HCR_E2H;
>> +    }
>> +
>>       /* Set the CPU to the desired state */
>>       if (env->aarch64) {
>>           env->pstate = aarch64_pstate_mode(target_el, true);
>> --
>> 2.50.1 (Apple Git-155)
> 
> thanks
> -- PMM
> 


