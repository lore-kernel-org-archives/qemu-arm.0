Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp294994ejc;
        Tue, 17 Jan 2023 23:32:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvp2p1hWnlSMzXT2yJnJFRBZhB/TO/gjUTd9d62CyecSICh9zxefUTNu8Nwg0w8AHNitVxd
X-Received: by 2002:ac8:478c:0:b0:3a9:8353:aeeb with SMTP id k12-20020ac8478c000000b003a98353aeebmr7537913qtq.5.1674027150964;
        Tue, 17 Jan 2023 23:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674027150; cv=none;
        d=google.com; s=arc-20160816;
        b=VyuysYcmV/cjAfJyi4gJJRBjZ2ZUWiI1uBnTDY0RjeTajdrmFhUF5kldklAnHuIHxj
         a0oZTVYJtWd7rOt5piqUOfVJ8JL78vE6oH969DLAUOkIjLqWKHuuA2LqoAxt7ohalEHA
         Km6jtxRpRYyJB5W/xq4gun0I8IJv/auedM0hrRgLpH9/xtae3/0n9PjaMTqcatQD37Pl
         y2HMW9O11DIbodF16WHgrQIjlm8wtATPeosyTcWPHnPpByNK0r+wRKVaQCNRup4Hzzo0
         EDg/fVHiukytG5k8VkwTFu6Di4yPdZBT+PuC1bl5YcZPOU1JVNZm9Xo30oinCV4e5Pr9
         lgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=djLr3+auGCHV7KVpdtS322QwAjPv5mqVJtDLsxuFtfg=;
        b=0a98Qx44cdmPEu40/XVfFaHrvDwwL5hH6XSYPw7uUAyPDB+vSS89+Gf+ToNxHky9xm
         lWb0HMFBczHIwYmpkduwkg14JmdlgcEYZ9K3Tlk4pDUcVjsqLUcsEA/NtTis2EJSZh/i
         KHV5gFmCjMKABaGJ5NgCWE5I3PfhReUV6TT1E4LjpTAPntDlX6P/4OIQ2qV4gzDds2rZ
         feZ2xJkZzVMEDdPVy1Rs0kUaVGmIPW1qe+Wai27EZ98qUGUB+nHnyCvROpu2aH2XFN7J
         BSxfmdWgupBVjMlvh/o9dpg+SWVxacGdg2dc2WiovBzO0ZdLekSR5iv0dp0jrUiWc9kd
         0arw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fu18-20020a05622a5d9200b003af9d375569si13504917qtb.415.2023.01.17.23.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 23:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pI2vk-00060g-U7; Wed, 18 Jan 2023 02:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI2vj-00060T-Bg
 for qemu-arm@nongnu.org; Wed, 18 Jan 2023 02:32:19 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI2vg-0007RA-Td
 for qemu-arm@nongnu.org; Wed, 18 Jan 2023 02:32:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C80C02DC19;
 Wed, 18 Jan 2023 07:32:09 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 18 Jan
 2023 08:32:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003def26aa8-e925-4896-860c-4fe341cf2018,
 B02C0E203F6A6AD140F658F33EDEBE178EEACDD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8646a560-dd95-6cdb-1f7b-3d344ee744f7@kaod.org>
Date: Wed, 18 Jan 2023 08:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix
 definitions
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal
 <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-5-philmd@linaro.org>
 <CACPK8XcdKGvQGOeBKQXRhYVZKO5k8jCv_1syNbZr8YPufaSjLg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XcdKGvQGOeBKQXRhYVZKO5k8jCv_1syNbZr8YPufaSjLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9581ea07-3d5d-46d6-964c-6e5f2039a020
X-Ovh-Tracer-Id: 11563273520002730884
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtg
 hhrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehfsgdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r5BlKcsb7t0E

On 1/18/23 07:53, Joel Stanley wrote:
> On Fri, 30 Dec 2022 at 11:35, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> IEC binary prefixes ease code review: the unit is explicit.
> 
> I strongly prefer the existing code; it tells you the size without
> having to do maths.

you mean that it matches better with the address space representation
in the code and the 'info mtree' output ? If so, I agree. We can keep
this patch out, it is not fundamental.

The hex representation of values has its advantages compared to the
macros because hex is generally what you get in debug outputs and
it is easier to compare and manipulate.  Some Linux dev feel the
same.

C.

> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>> ---
>>   hw/arm/aspeed_ast10x0.c | 3 ++-
>>   hw/arm/aspeed_ast2600.c | 3 ++-
>>   hw/arm/aspeed_soc.c     | 4 ++--
>>   3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
>> index 122b3fd3f3..3500294df7 100644
>> --- a/hw/arm/aspeed_ast10x0.c
>> +++ b/hw/arm/aspeed_ast10x0.c
>> @@ -10,6 +10,7 @@
>>    */
>>
>>   #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>   #include "qapi/error.h"
>>   #include "exec/address-spaces.h"
>>   #include "sysemu/sysemu.h"
>> @@ -348,7 +349,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>>       sc->name = "ast1030-a1";
>>       sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
>>       sc->silicon_rev = AST1030_A1_SILICON_REV;
>> -    sc->sram_size = 0xc0000;
>> +    sc->sram_size = 768 * KiB;
>>       sc->spis_num = 2;
>>       sc->ehcis_num = 0;
>>       sc->wdts_num = 4;
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index a79e05ddbd..72df72a540 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -8,6 +8,7 @@
>>    */
>>
>>   #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>   #include "qapi/error.h"
>>   #include "hw/misc/unimp.h"
>>   #include "hw/arm/aspeed_soc.h"
>> @@ -619,7 +620,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>>       sc->name         = "ast2600-a3";
>>       sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>>       sc->silicon_rev  = AST2600_A3_SILICON_REV;
>> -    sc->sram_size    = 0x16400;
>> +    sc->sram_size    = 89 * KiB;
>>       sc->spis_num     = 2;
>>       sc->ehcis_num    = 2;
>>       sc->wdts_num     = 4;
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index 2c0924d311..677342c9ed 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -517,7 +517,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>>       sc->name         = "ast2400-a1";
>>       sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
>>       sc->silicon_rev  = AST2400_A1_SILICON_REV;
>> -    sc->sram_size    = 0x8000;
>> +    sc->sram_size    = 32 * KiB;
>>       sc->spis_num     = 1;
>>       sc->ehcis_num    = 1;
>>       sc->wdts_num     = 2;
>> @@ -544,7 +544,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>>       sc->name         = "ast2500-a1";
>>       sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
>>       sc->silicon_rev  = AST2500_A1_SILICON_REV;
>> -    sc->sram_size    = 0x9000;
>> +    sc->sram_size    = 36 * KiB;
>>       sc->spis_num     = 2;
>>       sc->ehcis_num    = 2;
>>       sc->wdts_num     = 3;
>> --
>> 2.38.1
>>

