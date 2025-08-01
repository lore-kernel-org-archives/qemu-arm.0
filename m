Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89206C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 03:54:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhgqQ-0006mU-Bh; Thu, 31 Jul 2025 23:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhgqO-0006jl-Hf
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 23:54:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhgqM-0008Gj-IX
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 23:54:08 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b3aa2a0022cso1272874a12.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 20:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754020444; x=1754625244; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AA8gho/6YRVQoMeS73oZsIiDVQKycI7A7Y+em8lGyeY=;
 b=LiJmJv2lwAqU4cvfHKmdW40909YHtROs5dFB2sdAGizeXwKvzUmrnG28sTJimV+Box
 Bk/E01b/upL5HZ+mOJWkDLm2f6hZURP9ZseiY8rO2GJfs44o76IT8vUxxTgd40lvlzcf
 LcEJ2WwelRz5HpO4mGFOElLIvK3RKqCQ3GIi0acIo1krNqfBOOrCYYp3ntGtL/D/9TSL
 wpaJYQEQ3Gcr5UkB2rtfw7ht+sHBRsAuzKsOQv+4xUgrUooXIYb1PAvZoLZm1iHaDysD
 oHZIXz8eHjKgd+/6NBGpb+eDZqOLvrn0P3831yLvxKm8KpEmZRA3sn+Kh5CKpcxnyyHZ
 CERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754020444; x=1754625244;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AA8gho/6YRVQoMeS73oZsIiDVQKycI7A7Y+em8lGyeY=;
 b=ueTPYpwMsY/sz6PTGsgVJT16kc1IpW16HluoCwJp5aHoVKUZYy0lb2sGjmBCpGiofY
 E5+gPCKJkoJ3nk3nqKBOz8wIZyjz4AcCQWH6lvfb2xv32pNpSPu5YHYuugkmHCEkhU7O
 rS84EAgcEoKJTJ3LxjK2/scnDV+o41GhTaQlMuNoIbZAC1Ly6zumBjIIStaqPzlORcYf
 NC4N0jJStXHsm+lOUfiiUAr45L0e09Ue1X3CaCdo1B9PrtkTROD8NjF36sWLPOI2iyIs
 v4rjHrTA1Q17zuzaRYEyIdMPNzfg41MgzGthNDcZqKGHNRt/lLv0m/k/9+d9EC0TRse+
 vdnA==
X-Gm-Message-State: AOJu0YzoJQEakOrweLDKq56UAcCFDlmtihp5c3cWLNMOXSmQ2t1ZvNx2
 tKucnVnq55+MRwOML6oQdxsxxe31UMTgz8Vt+Lc6B5knQaUDPn3eSwTqrHMgEfxv/Qs=
X-Gm-Gg: ASbGncuUxdzUUpTgBXo4XxUnqg/evuvHpUqaZDG28I9OoxVPqW1cunmIF94Lh9dimup
 c2KYt7EcVjBKP8AM4t+LDhA0+NDfDIIZZMVFkItrOun61xS+eks5pz3DCdeapvHulvomoGTPfL7
 fnQfyNjDLG67Y6UEIQ8qYSIh5DYus8USirh77gR2YCxrs3b+QwYii1TDo4F4daQ2GRt7JHduzL2
 D6N2VGM6PfSTUwE1AzLW5h8bq/p3+CHYcDJGNXeE77PgAyVdhF4zetApnLQqa8Jsr92MROWr3O7
 2sCr52DrvwhzYzwaOb11Q06EeYcb4CKA4lysIcnmj/Du583ZoHCJ7Z2Aaq+irUmOtmuAXrbS9kP
 urZlMtB/CvSFi0XNCaAs9pQDnYXc7ULGK/2kspluZ
X-Google-Smtp-Source: AGHT+IFEn8ORgcp/BvoBWZW0v5k9AiJMpdy5nv4LdaxNRiLf6vOT3C0KC6fJO6x+/C712SqqdCKotw==
X-Received: by 2002:a05:6300:210b:b0:23d:9dd0:b2e5 with SMTP id
 adf61e73a8af0-23de8226cd0mr1818300637.41.1754020444471; 
 Thu, 31 Jul 2025 20:54:04 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f92bsm2957720b3a.21.2025.07.31.20.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 20:54:04 -0700 (PDT)
Message-ID: <e275dc71-2d48-4b48-9b7f-dae2c8934d64@linaro.org>
Date: Fri, 1 Aug 2025 13:53:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/82] target/arm: Convert regime_is_user from switch to
 table
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-38-richard.henderson@linaro.org>
 <0128c452-8bde-4bdd-b73c-330a7bd619a1@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <0128c452-8bde-4bdd-b73c-330a7bd619a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 07:21, Pierrick Bouvier wrote:
>>   #include "mmuidx-internal.h"
>> -#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
>> +#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK | \
>> +                ((X == 0) << R_MMUIDXINFO_USER_SHIFT))
>>   #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
>>   #define R2     R_MMUIDXINFO_2RANGES_MASK
>>   #define PAN    R_MMUIDXINFO_PAN_MASK
>> +#define USER   R_MMUIDXINFO_USER_MASK
>>   const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
>>       /*
>> @@ -33,7 +35,7 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
>>       [ARMMMUIdx_Stage2_S]        = REL(2),
>>       [ARMMMUIdx_Stage2]          = REL(2),
>> -    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
>> +    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | USER,
>>       [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
>>       [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
> 
> Maybe I missed something, but what about other entries that were initially treated in the 
> switch?
> - ARMMMUIdx_E.0_0
> - ARMMMUIdx_M*User

See the change to EL().

I'm not sure why ARMMMUIdx_Stage1_* is excluded from arm_mmu_idx_to_el(), but I don't 
change that in this patch series.


r~

