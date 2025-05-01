Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp447713njj;
        Thu, 1 May 2025 13:21:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUZZwUXeKQ9JhutlBOWstSXxqZt8c/rGzwA/IDHafrrdkpm2do0MXI1vjs/sMGXNOd9gKaO4zEYZQnIA==@linaro.org
X-Google-Smtp-Source: AGHT+IG1uxyLEanQltvvgs5Z5zcgL3d/gR2O74W5cHRxikbJRdN0+8GuT3qB5KwhbZnyTDwN6dKA
X-Received: by 2002:a05:622a:5c08:b0:479:1a3f:f1f0 with SMTP id d75a77b69052e-48c32dbc6d3mr4563551cf.41.1746130906281;
        Thu, 01 May 2025 13:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746130906; cv=none;
        d=google.com; s=arc-20240605;
        b=hS5Kgl+sePL2P1I36sZcQdiZNlw9S4JiAbPR6wkHL0+pp3eq/KQemrE8qCOlSI8rDF
         E/dA4PpRrPAR4eNJ1Rjs/Tiwx6P0gn7SBrbz9goMi+ehPYpD0KknVLIn8qD7EwbjMCe0
         VIdl5l2MxTfFT/As91eFdHxpJnWz6uiHiluQajKm7aOKKA2ALnIyJDMNOrgUQKpSF3/N
         3HNuqXI2qKBB2hSqUGAextq6OP8EvFpAO42pLWQ/mHCeDmlqlckqDsvGZu8DHPIpGnl/
         ThbJaMJ7tD0hto3zm2T4RpFss+IQz71nTAuGK8faPsZmDHVG7aGrpZt15nIboTu86Uso
         XiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=ELbqmQee11YInH60qOtr3t5orOvV8gTMRlmShtveDZk=;
        fh=4P/+BiIUYBHUnfU5UTqy9u8ANu4fMVKCeqk3fh95OiA=;
        b=XLOF5Izx/VQ2h8CSO7S5ZaI1xrHFEFLKCtiw0TVmnXT1C89eEcR4RMlPm7B/MnLRG9
         OuTmQQaXaxR0QGT5wC9kQBIpRhJKTtNZ5kFjTLeTShjhjLjQiUwQxjxUCkMwvmL8Vd+i
         o/pxjdCwmQEQpyIlcrzdwK6z15PoJrAos46X0MBSRridKNCgE/u/IoACsTwxKZNceIzj
         MjUixXeLyRpwlK/ueeQ8PSg2yUt45ntf55OGsYda3B8r7BfhU/bhtop4iORABIK7od3V
         MueFHckMKag70nunO6gjibjrou4IvwqzkhEKT40fHAIbN+g5dLutB1Ut4y6+OXPBHb7j
         MQkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b987279e6si13814641cf.435.2025.05.01.13.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 13:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAaPc-0002OB-Ga; Thu, 01 May 2025 16:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uAaPX-0002MG-JE; Thu, 01 May 2025 16:21:36 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uAaPU-0007uo-W6; Thu, 01 May 2025 16:21:35 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C1A5655D25C;
 Thu, 01 May 2025 22:21:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id dQ7pYLcRGhRs; Thu,  1 May 2025 22:21:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C48AE55D25A; Thu, 01 May 2025 22:21:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C0732745683;
 Thu, 01 May 2025 22:21:26 +0200 (CEST)
Date: Thu, 1 May 2025 22:21:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 1/3] hw/pci-host/designware: Remove unused include
In-Reply-To: <e7088647-aa76-4f64-b443-0ca354df8f24@linaro.org>
Message-ID: <01dbe30f-5ef7-c76d-59dd-d05bbce2029d@eik.bme.hu>
References: <20250501183445.2389-1-shentey@gmail.com>
 <20250501183445.2389-2-shentey@gmail.com>
 <e7088647-aa76-4f64-b443-0ca354df8f24@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-236068682-1746130886=:40469"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: L2oAlst3iGxI

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-236068682-1746130886=:40469
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 1 May 2025, Philippe Mathieu-Daudé wrote:
> On 1/5/25 20:34, Bernhard Beschow wrote:
>> The DEFINE_TYPES() macro doesn't need the qemu/module.h include.
>> 
>> Fixes: 13a07eb146c8 ("hw/pci-host/designware: Declare CPU QOM types using
>> DEFINE_TYPES() macro")
>
> The 'Fixes:' tag is for bug being fixed. Here I suggest:

Wasn't that Resolves: that's used for bugs or Buglink: and Fixes: to 
refer to commits this fixes up? I thought we used Fixes: like that until 
now.

Regards,
BALATON Zoltan

>  Since commit 13a07eb146c8 ("hw/pci-host/designware: Declare CPU QOM
>  types using DEFINE_TYPES() macro") which removed the type_init() use,
>  we don't need to include "qemu/module.h" anymore.
>
> (I can do the update when applying if you agree).
>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/pci-host/designware.c | 1 -
>>   1 file changed, 1 deletion(-)
>> 
>> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
>> index 183f838392..b4bff14579 100644
>> --- a/hw/pci-host/designware.c
>> +++ b/hw/pci-host/designware.c
>> @@ -20,7 +20,6 @@
>>     #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>> -#include "qemu/module.h"
>>   #include "qemu/log.h"
>>   #include "qemu/bitops.h"
>>   #include "hw/pci/msi.h"
>
> $ git grep -L type_init $(git grep -l qemu/module.h hw) | wc -l
>      50
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>
>
>
--3866299591-236068682-1746130886=:40469--
