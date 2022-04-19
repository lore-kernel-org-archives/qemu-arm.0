Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2261301lfk;
        Tue, 19 Apr 2022 02:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqef6VZlI/saS8UWEomjRC+MRZXbzdWcv9Otf4KDQTRno4U+iTzjTe/4ogcm4xNl1xw2/j
X-Received: by 2002:adf:fa84:0:b0:207:aae5:618f with SMTP id h4-20020adffa84000000b00207aae5618fmr11153243wrr.548.1650359479935;
        Tue, 19 Apr 2022 02:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650359479; cv=none;
        d=google.com; s=arc-20160816;
        b=j253XN1VUkg5pxvwt54cOGZPNYlOwDM7N6oNqHoMGxIZ+umtAuuJx2pMOjmQp09Qss
         UJoI4jhj/TbgJfb/QqlNW+gxauaIKDARJ/CrG/j2gRAqno/SZJwS6TanrXgy8X9PoMQ2
         eB4GD5jNgwViP9xHq/lr/Jv9An/t0Jo956hMMjmW3QwPc2bjKu/3FYLCwyRawHsYH1qN
         jlaf1ESVHMQYpljam1R7GYIQ2VME7XI5XgxuMYMTg/8S5d0n5ZxEGfwWFkpUvlAZ95VP
         HjUv4DQkkxcmuPISQYTcLWQ+yb/Iu8us3BuDJG2e3h4gFi+BwRvLNlAM3p8bADxNFgsF
         n1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ST+lmAisDHRsCUDH1ysmZh88/xICcO+12Uu5E/D4wkQ=;
        b=UymbfokidtJBn7yINnDbMgXdHIIuBHfFEoy/RsjgFIJPzG4h/hNz6VqQAqx9iFJZXE
         YO0gnYObJuDkxqd9wrdX3bYyOdQx09MjFK5MwTASWJMimWdCqcO4lxlQmWlQR0XLULqH
         ZQ41yckYmd6kl13awAsvxResw5GIttPYqIg9kh0XDsbUT7P1cNYrEaRcn/1w952oKUfU
         6JED4TI/R2NuZKA+rW3ia3hqxmZGc3B4vCUYROsoZvdgmCyjifJHAHkLmTfPvAIKbVTK
         wZNPvpub1L8ZBaRzBJn4dSVnswWCDn3u9I4R+AbWbji5BvZLCfkkD5c0UJ2mJKlCaqFK
         jL0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=Ds7q8B9+;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id c186-20020a1c35c3000000b0038ebf44b62asi1227044wma.111.2022.04.19.02.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 02:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=Ds7q8B9+;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [192.168.13.13] (unknown [195.68.53.70])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 9BF182077D;
	Tue, 19 Apr 2022 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1650359478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ST+lmAisDHRsCUDH1ysmZh88/xICcO+12Uu5E/D4wkQ=;
	b=Ds7q8B9+ecNGd5U9Ywk9QiF7mQeocVOq5uxdc3Op4esudzRf3LqHNJw8IzhjQ69XaRYyp2
	7H02xulzm6oBb76f09cwnMRYqBq+jssl5uoIuhwDDnFPH8XAQ4qB3xNhyroSfawTDK3A99
	4VpG+qaemphypzkG1PXW80D2BN1QhDg=
Message-ID: <ad7c2dc1-9b4b-cd60-840b-075634272e5f@greensocs.com>
Date: Tue, 19 Apr 2022 11:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 02/18] hw/cpu/cpus: introduce _cpus_ device
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-3-damien.hedde@greensocs.com>
 <2ded9132-c2b5-c428-6554-98c71b50e8bb@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <2ded9132-c2b5-c428-6554-98c71b50e8bb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Yeqr4CKMI8Sr



On 4/16/22 19:52, Philippe Mathieu-Daudé wrote:
> On 30/3/22 14:56, Damien Hedde wrote:
>> This object will be a _cpu-cluster_ generalization and
>> is meant to allow create cpus of the same type.
>>
>> The main goal is that this object, on contrary to _cpu-cluster-_,
>> can be used to dynamically create cpus: it does not rely on
>> external code to populate the object with cpus.
>>
>> Allowing the user to create a cpu cluster and each _cpu_
>> separately would be hard because of the following reasons:
>> + cpu reset need to be handled
>> + instantiation and realize of cpu-cluster and the cpus
>>    are interleaved
>> + cpu cluster must contains only identical cpus and it seems
>>    difficult to check that at runtime.
>> Therefore we add a new type solving all this constraints.
>>
>> _cpu-cluster_ will be updated to inherit from this class
>> in following commits.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>   include/hw/cpu/cpus.h |  71 +++++++++++++++++++++++
>>   hw/cpu/cpus.c         | 127 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/cpu/meson.build    |   2 +-
>>   3 files changed, 199 insertions(+), 1 deletion(-)
>>   create mode 100644 include/hw/cpu/cpus.h
>>   create mode 100644 hw/cpu/cpus.c
>>
>> diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
>> new file mode 100644
>> index 0000000000..c65f568ef8
>> --- /dev/null
>> +++ b/include/hw/cpu/cpus.h
>> @@ -0,0 +1,71 @@
>> +/*
>> + * QEMU CPUs type
>> + *
>> + * Copyright (c) 2022 GreenSocs
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef HW_CPU_CPUS_H
>> +#define HW_CPU_CPUS_H
>> +
>> +#include "qemu/typedefs.h"
>> +#include "hw/qdev-core.h"
>> +#include "qom/object.h"
>> +
>> +/*
>> + * This object represent several CPUs which are all identical.
> 
> Typo "represents".
> 
>> + *
>> + * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 
>> CPUs in an
>> + * Arm big.LITTLE system) they should be in different groups. If the 
>> CPUs do
>> + * not have the same view of memory (for example the main CPU and a 
>> management
>> + * controller processor) they should be in different groups.
> 
> This description calls for a clearer CpusGroupState name instead
> of CpusState (which confuses me with CPUState). Alternatively
> CpusArrayState.

Your are right, I'll add the "group" suffix.

Thanks,
Damien
