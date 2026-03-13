Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137D3106FD87
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 06:23:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0vuh-0003Gt-JG; Fri, 13 Mar 2026 02:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0vuX-0002vZ-AM
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 02:22:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0vuV-000703-G9
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 02:22:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso11105635e9.2
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773382930; x=1773987730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpiPIh949j7rh0EKU/SScuFwcnqyZb3HhjpDykwaXbU=;
 b=yojqZX9myF43eZbTiTfEigLx2CCQScEKwsNY01leEMixz73EXA8Kn6n20/Tq9hFl4Y
 KyrADUgXX2tYSranE5Svlwj+YNjl91OSVlTzsI35SRNAzD7tiCp9F1D4OQKU+ur1tR44
 B1G6fnXt6cHhutvO+J7eAN0IEVf4DopIKaQO01JtJKSzIWWhyTAQ8fxiMqg+1z00kfdF
 8a7DqxtH5iNWm8DVSWz+UP1aL99+7p04+s1y7CfEiEhVUStAWleehqrhpRdmzj00TLuZ
 pvs0aahVAGgNkIywu+oOz7dlvV4cpDw0N/QwG8khRhdwO6vuFIRcxiy+jf8Tqsn4NbSP
 tDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773382930; x=1773987730;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpiPIh949j7rh0EKU/SScuFwcnqyZb3HhjpDykwaXbU=;
 b=CA0ydic7Pj7o2i0eBK/MawXeOn4h4Wuk9wwa6ADPUsCglLzkV/JjNmmAD1Tv6lAoap
 +zJ0AcEbCiIjKq9Y8DbFLEtf+qQr739PBAX4r+KA6TG5JiQD8tRI44BwdAy5O3Tzf0TM
 TQxUZc+fMRmsFOqqOiwEyU4YxeeOLILVwuUIVwdRjly1cAjjB7ghpJsrQGmzJMKw/d+f
 FLzNnl/F2VaJRtB7aIEUuy2ewPxhNBqusp27S195EXNlcaQMfU3qEXTeAuLI1D313Lq5
 sUm85eL/cUDRNifvTSaCGoWxb5SAjQTt8VMOgUBVFIT+z1PQQADMNEEGNp+gR1rm4cio
 chUg==
X-Gm-Message-State: AOJu0Yw4Cqil3kN7pkr7BVE/HXVgnumZpzXMgeC5KsjzazzbvI7oAurX
 SRL6+TOvGmE3qQTLPEy2khCdoaWpfjPbf4NqXXgFmMdlRJS97fHiM/mF/A6wNmGpukA=
X-Gm-Gg: ATEYQzy1d2PQ9ivQCmSzScm5Ic6OlGG65bVpensSJ9eX55KuTkx/nw3ea6ga+yfEUiB
 Squm+v9qHWwTPEJyvcCPOTiJtLmU7Hmem++Ssj1D1hw1lpltRLuNbqwnTOWzr6QYAohXIbXyOWG
 pXqrapKYnsfXu3H3CTrWdj/Zta4OR1Donk4tdl17vhtnH1wOjUNhDDEeXE67WpUD6vRVyqjDYLG
 i+rLab2VRK5gj5YDghh4Z8SeaLJW6Es0vtQf36zn1D5g2TyS+UM+GZOACvUtz8oEdRQZ+QtWiHM
 tOFy0JJ3T4+ck32ZTGZkZgKR3TTD2JlXihmVQJcgIPIuP4mMRsJcqGX9kAw6PqA+VPF7LTx5KcD
 1EVXf82aw9p24enXUQY+uVpVi/BxwxdBSERzDOQNBSzKvI9tHsiKI2R/yWtAeDk9Nca1vhSHF/D
 CbyLxUJAgb4D+sAOB7+MRvj2X4NzmeCS/QbdlXFg+mlbZeeS/tPiNGMAnGMOGIRDPS1c1rZJU=
X-Received: by 2002:a05:600c:4f8f:b0:485:345b:ccb7 with SMTP id
 5b1f17b1804b1-4855671028emr29959475e9.34.1773382929781; 
 Thu, 12 Mar 2026 23:22:09 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48557a74228sm12666225e9.18.2026.03.12.23.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 23:22:09 -0700 (PDT)
Message-ID: <e3901066-2a82-4419-af77-528a05a7c5d1@linaro.org>
Date: Fri, 13 Mar 2026 07:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm/cpu.h: restrict cpu-defs.h to target
 specific code
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
 <20260312224702.1608408-2-pierrick.bouvier@linaro.org>
 <719ac842-22be-4617-8b87-02424f2b9ea5@linaro.org>
 <a0b3440a-6fde-44d6-95fd-88a04038cd41@linaro.org>
In-Reply-To: <a0b3440a-6fde-44d6-95fd-88a04038cd41@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 13/3/26 04:58, Philippe Mathieu-Daudé wrote:
> On 13/3/26 04:48, Philippe Mathieu-Daudé wrote:
>> On 12/3/26 23:47, Pierrick Bouvier wrote:
>>> Allow to use this header from common code, which we do in next commit.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>   target/arm/cpu.h | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index 657ff4ab20b..b8042f65bb4 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -25,7 +25,9 @@
>>>   #include "hw/core/registerfields.h"
>>>   #include "cpu-qom.h"
>>>   #include "exec/cpu-common.h"
>>> +#ifdef COMPILING_PER_TARGET
>>>   #include "exec/cpu-defs.h"
>>> +#endif
>>
>> Since there are no other uses of COMPILING_PER_TARGET in this
>> header, this clearly mean "exec/cpu-defs.h" isn't required here
>> at all but elsewhere:
>>
>> -- >8 --
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 657ff4ab20b..445d5a8a31d 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -25,7 +25,6 @@
>>   #include "hw/core/registerfields.h"
>>   #include "cpu-qom.h"
>>   #include "exec/cpu-common.h"
>> -#include "exec/cpu-defs.h"
>>   #include "exec/cpu-interrupt.h"
>>   #include "exec/gdbstub.h"
>>   #include "exec/page-protection.h"
>> diff --git a/include/exec/helper-head.h.inc b/include/exec/helper- 
>> head.h.inc
>> index 5b248fd7138..5603c9941a7 100644
>> --- a/include/exec/helper-head.h.inc
>> +++ b/include/exec/helper-head.h.inc
>> @@ -46,6 +46,7 @@
>>   #define dh_ctype(t) dh_ctype_##t
>>
>>   #ifdef COMPILING_PER_TARGET
>> +# include "exec/cpu-defs.h"
>>   # ifdef TARGET_LONG_BITS
>>   #  if TARGET_LONG_BITS == 32
>>   #   define dh_alias_tl i32
>> ---
> 
> I'll post patches for this.

Posted as series v2:
https://lore.kernel.org/qemu-devel/20260313062055.2188-1-philmd@linaro.org/

