Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1CFCCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:01:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrNZ-0006Sg-RN; Mon, 03 Nov 2025 05:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrNE-0006Es-FM
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:01:24 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrN7-0000CQ-Lu
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:01:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47112a73785so27526425e9.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164064; x=1762768864; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kl5CXLdAL/xqXFH3epvzOr7vezIqO4z+rwiM1uOlVMI=;
 b=FCgWkMTCG8zpcIJZtPjl5NF9epiNqDtmhNncAhKL7mVvYZHWGDgaJGchSQdMwLdOrq
 jH+Lmq8jPq/FLSDk3zAx32Cn7gadUCHohR5gt9yUzx7+syxWh5gL//ImmShaU+ODI/3+
 6jkexYu6dUQISlk5CEnB6jZkWQfyWktKZ6H6BvOyvVZqXXDYAqcjRVPYuSS3zTLcDk87
 a6swzH1E9QtlP4FAVtusdW83MQI31FPiiSgUOCt4AvWjhPIcd2XFLy5cj5kfltZwLtPJ
 oWSnHfNUM8PH3b4lcQIkONcLtIW4j68DUruAGywaj+/epOXN/1mk/16xVrAWl6ixiwmB
 sx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164064; x=1762768864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl5CXLdAL/xqXFH3epvzOr7vezIqO4z+rwiM1uOlVMI=;
 b=qKnwVETJvL0VW6a5IpWVSdtSaSkwWJ5+GZS13HmGW1CMRucqcn1BP4p1pcVYz/PmKZ
 fwi+CPjjx7G1x/3maxDhD0ud/ST/Qrnb8tMBo7Nc4JBiFnhiCsNlPrSNa+iECV8T/75K
 LrGfVMSymOveUtbW1ZARDj38gqJyCIlzdhYX8XI5wT4mQTsgbsUCXUnlZC5R2pkeBgUy
 O3cDf2WLjAo+6eZhtM4WjzgVdkF50aUqmZNfkK5n8P2zsta79yjWerrK89g81Onu7HzM
 spRp31ukJMx3fNp5DcOfLXtmEUdvdawZAA6iLRy09dGtBDsZwDzYk+ybPsoKh2bcQ+Tb
 fBFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSkE2kGokxulvYlk/toaFoG2PKXwoK+RCz/tsAZR4ow85S871FTe25QvrPFeOkGpQvoxCcSA6K6g==@nongnu.org
X-Gm-Message-State: AOJu0YxQj8YL1mbUujRvBUaadvDDXqiQE23pV6IjhkhsHW7fIoAAaRWD
 VzIpjEKIqQvd4Gu9sqpE7d6aZO2M7Cn0RJ8Qo6WHrbCC/X2ihqqIOmGB9OnAbC5xFzI=
X-Gm-Gg: ASbGncv1fvyxZCSYaY4pr6WeJHFypb9GFIZWCJ6xMrdisD2AgX9GakMjUuB/6Pna2+M
 ss3LG1QDrd+xI8OlL9/M/uzHAWyPnvH5f50SND9KbcuilLZ54yF1O8nr0L8VY9jO8vvGcF9QfUP
 CYKqBdwqQkqW5/FHuYxwUsPm9JETvJgBRXzmAki54VdzcbWz6bN9I4w4ZnPLnDjVm23RaQravh/
 9ptkEklij2V4UQYqHBDIGD2piVvM+FVDSosXGM4n2rGTnYBmlTkSHklWKNarijvEhsAgqvy852C
 rP8aaxsl2kJvy2buXQiDhgq1EwH6lRjiqtELOMCIlddjRiVrPBhInDvB+t35LQsOQ8qyPx3ZUd1
 0sqNk9imqadHDWORuqLs3R+TnyqAjzP9ZNmCbkowHSd+KplA2JAZrNWs9tFGxI3RCt00FXmyUbs
 R3AN0Q1fKp4NTrHj+IELGhyYSX78X+X0F3fG78U4HzY1XXxwOZicIj+j1+jtEHOqBaY+Y=
X-Google-Smtp-Source: AGHT+IHf3gaH7cg6Vgv5W7BpemQOktNTCFqG/aPa3ew8SZl1mCIJLTCT6nQHQAF2KWFTXY2NJDvjhA==
X-Received: by 2002:a05:600c:19d1:b0:471:1b25:fa00 with SMTP id
 5b1f17b1804b1-477308a89admr107658495e9.36.1762164064277; 
 Mon, 03 Nov 2025 02:01:04 -0800 (PST)
Received: from [172.18.178.65] (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fbc32d9sm85791255e9.1.2025.11.03.02.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 02:01:03 -0800 (PST)
Message-ID: <a1c07274-caf1-4aab-ae3b-ae8bc8ac5af1@linaro.org>
Date: Mon, 3 Nov 2025 11:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/59] target/i386/hvf: Use host page alignment in
 ept_emulation_fault()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-34-philmd@linaro.org>
 <CAFEAcA9bTmusgWLvzgPW1Fh1Pzvo2rD6+2Qbw1TahrRybyT7Hw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9bTmusgWLvzgPW1Fh1Pzvo2rD6+2Qbw1TahrRybyT7Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 28/10/25 12:28, Peter Maydell wrote:
> On Tue, 28 Oct 2025 at 06:06, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/i386/hvf/hvf.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
>> index 16febbac48f..c0b2352b988 100644
>> --- a/target/i386/hvf/hvf.c
>> +++ b/target/i386/hvf/hvf.c
>> @@ -76,7 +76,7 @@
>>   #include "qemu/main-loop.h"
>>   #include "qemu/accel.h"
>>   #include "target/i386/cpu.h"
>> -#include "exec/target_page.h"
>> +#include "exec/cpu-common.h"
>>
>>   static Error *invtsc_mig_blocker;
>>
>> @@ -137,9 +137,9 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
>>
>>       if (write && slot) {
>>           if (slot->flags & HVF_SLOT_LOG) {
>> -            uint64_t dirty_page_start = gpa & ~(TARGET_PAGE_SIZE - 1u);
>> +            uint64_t dirty_page_start = gpa & qemu_real_host_page_mask();
>>               memory_region_set_dirty(slot->region, gpa - slot->start, 1);
>> -            hv_vm_protect(dirty_page_start, TARGET_PAGE_SIZE,
>> +            hv_vm_protect(dirty_page_start, qemu_real_host_page_size(),
>>                             HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
>>           }
>>       }
> 
> I guess we're guaranteed that the host page and TARGET_PAGE_SIZE
> are the same thing here (so it doesn't matter that we put
> the assert in first and then fix this) ?

Yes, but clearer to re-order before previous patch to avoid
any doubt.

> 
> On that assumption
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

