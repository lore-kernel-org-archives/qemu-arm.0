Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp106923wrp;
        Thu, 3 Oct 2019 03:55:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4nrEQ0QQFhCVjzfPNVCoOLtQew9ZJqFJzRrDWjHblt3F6VgYJIG97gN60N64R0yrLo/al
X-Received: by 2002:a37:dc04:: with SMTP id v4mr3673264qki.51.1570100159750;
        Thu, 03 Oct 2019 03:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570100159; cv=none;
        d=google.com; s=arc-20160816;
        b=v18dGFBouW3JMfIXIowO1S+jX86RH1OFmsHLLeUo97nMQgrzEQtGpRR9H1nhk2u/W2
         m9Ag7PWkpmIqQWsyKU6nyNDcnK/yUWd5lODw6ixO5QqKCqGZZQJpf1IM4etgI1C3NZGz
         mpImnSq9NQg/5H2P84qHtvu7I+eC1AlVTM1hur1gmOd4kdVH6115V5Y8Ng42/mKGkhcM
         NYZyn2iP/NLKumhl7KOBS9mccX1L8Ay4kJHm2kmmxSWZVYnMFzdYMngoh9bzrU60OolS
         SBDZJ9+/3nwXtKTSjDeNGSpe8/e6Tf3KZnAU4A5vbRXbBZZL7P8phU2LEQ7J8c5mN2Lz
         RlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=D0VO8zsIIhzlrlpCpQI1XFgYw1dGm4punaRuFjgVlqQ=;
        b=u3d7i3NyWLbZ7NiC73FjMfKL0wO5v6rtSl0hX1RtzHA5uiF2VbgxIuAvTEjoWfSw7c
         WNdiv6yx0L1z6FoiEWqudaYvSWwJYJCFEMxsCEZGzQ+1RE2t3508iha8Bb49ClyEq3kp
         f9bShmVhwjy9nm1M5PO8Trfsfh6tlEPgmWRARZLEfIzBtfxJ5L/D1vH8rXKVgrtNfwBL
         d6VHbO8yr/4b+VGgweshpgKjqvXItDvQjYOl2d3r/yTBaxEGHBlpneQ4+SSD7d7K1K+q
         kljdhqG4NILh/6bNUf1nZY3DZySeOKGuM0rUR6v0Q7UrfSJh4uAeCUNRBAGchipBKSzM
         qhAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si2164943qtb.5.2019.10.03.03.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 03:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFym7-000090-6B
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 06:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iFyld-00008W-RF
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 06:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iFylb-0000je-Dh
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 06:55:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iFylb-0000j5-1T
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 06:55:27 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EAA1887648
 for <qemu-arm@nongnu.org>; Thu,  3 Oct 2019 10:55:25 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id r187so2662043wme.0
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2019 03:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YyjoSAkKKcGPpRZ2A6DWybBIf2MKlZgCm7Qq/j/nfMQ=;
 b=nPa1vSLvixYOp0fg/302j0Lw1/ddfn3zL/SX93C8PjKZIWrNlG5aCoD34Eq/cEKcD3
 RqOPzQc0PbDrdRBJb7q5NZ90W44fyBjWMgS9bWUv/jcsclPfy73PmPi7Xes7vVdpoUrd
 IW29BZgENtJ9sjL3TiAJNIxuQfDZVYyR1YOnTPt6Z2zAVNnmaaijgOU0smlFtDMQ8893
 Hqpgi2cyt73FWq6jzv+63pVAAbXJn6UtzIPAO4Qd+w6pdcxQrv5eb7QLRfflZzpy4jLB
 1O1UqpFCOIsQlgHkFI+1AfBKvf2yYZvu27lWuY4lLvJoXyl6e+wdirsZ08T6QIPyN3Hm
 Y9Gw==
X-Gm-Message-State: APjAAAUmda3j9cC3cwYzYD0HFXk12lm38zPJaM68BeBDXxPj+y5DuTfH
 6DvvGv86H0cBHfdmkarg3TZqlRGhV3wq7oZcrBXfrDbSkr7qhLuxVCU6593AzEMDDTOvF95eZlx
 tzRmgHjnhqF9Q
X-Received: by 2002:adf:8444:: with SMTP id 62mr6497623wrf.202.1570100124606; 
 Thu, 03 Oct 2019 03:55:24 -0700 (PDT)
X-Received: by 2002:adf:8444:: with SMTP id 62mr6497582wrf.202.1570100124328; 
 Thu, 03 Oct 2019 03:55:24 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id h10sm2534347wrq.95.2019.10.03.03.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2019 03:55:23 -0700 (PDT)
Subject: Re: [PATCH 11/13] hw: Move Aspeed RTC from hw/timer/ to hw/rtc/
 subdirectory
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-12-philmd@redhat.com>
 <20ec7d30-a8da-9e11-acfc-b8d773a5527d@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <29282e84-e8f9-feda-21a4-d8dd202a5638@redhat.com>
Date: Thu, 3 Oct 2019 12:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20ec7d30-a8da-9e11-acfc-b8d773a5527d@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g++bGcHXGU1V

On 9/16/19 7:21 PM, C=C3=A9dric Le Goater wrote:
> On 16/09/2019 17:48, Philippe Mathieu-Daud=C3=A9 wrote:
>> Move RTC devices under the hw/rtc/ subdirectory.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> I suppose the removal of the header files in "aspeed_rtc.h" is OK.

They are not used. It is probably cleaner to do this change in a=20
separate patch.

>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks!

[...]
>> diff --git a/include/hw/timer/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc=
.h
>> similarity index 92%
>> rename from include/hw/timer/aspeed_rtc.h
>> rename to include/hw/rtc/aspeed_rtc.h
>> index 15ba42912b..156c8faee3 100644
>> --- a/include/hw/timer/aspeed_rtc.h
>> +++ b/include/hw/rtc/aspeed_rtc.h
>> @@ -8,9 +8,6 @@
>>   #ifndef ASPEED_RTC_H
>>   #define ASPEED_RTC_H
>>  =20
>> -#include <stdint.h>
>> -
>> -#include "hw/irq.h"
>>   #include "hw/sysbus.h"
>>  =20
>>   typedef struct AspeedRtcState {
>>
