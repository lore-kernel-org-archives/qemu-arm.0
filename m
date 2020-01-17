Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9777981lff;
        Fri, 17 Jan 2020 05:07:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9bg4wLo4rmkS1436RMTUGJz5hU/mQjbqvIDHsJMt7rau2OcW0Yceq6AbprOnmDWKgC+qm
X-Received: by 2002:a05:6214:1874:: with SMTP id eh20mr7779958qvb.122.1579266478693;
        Fri, 17 Jan 2020 05:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579266478; cv=none;
        d=google.com; s=arc-20160816;
        b=G13ALYYC6b+GUOfZC10NB/ljrKIkGqLSYd2VAs6JU6WPiUiW2ayAGhQ4/hq1tRzGsD
         iESyI2hhfKtGV1KdQS7MGBKymLVWQ+E4wmp2OYWGZP9zgn9rCGRexGQGolPbrotHJll3
         YRhhbXzhubazVRzlgaKAcWuVQHDTCtV2rxPiZXJROaMZNYy93gnCUkuXhkES/nVkoOMm
         JHAQrG0iT+Ld534MOi4Wp50bjb6NUsPVD5oHrutl9h3mVcVhdFNfdcMRBFbDldamkqr+
         4jGn29/KSccZCHbUZKQY1puN7xJ3ESc+mlnjm8s5cmcu1yKal36aoEfhtXe06wlnP3tN
         tWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=146OOkWpkacaps27rv8fN6FCDTAn5cxxczZuAMRntV8=;
        b=Yx1DuyPn4R5fMg+GSgMS93pXnRSyNcBHNBJUDcfEjlQA967FW1P9tmFs/ubYrn2gth
         X369G7Z9m4jTvNzECgaow8C4QZsSGOiOQId1fgZFzkUT6/go3WxoJ60YommiUrR+MGVn
         +H/Nuu4Qz/QwxyR+Cx/csZd51LjWKBm2xVXSKSMR/L5ypWUUPc+ZnJPADJaDwPKqh8CY
         F4YGUlxaN9nhIuJ0dO4zPA6668CKKeFcZwdDqX1J5vcgci6Ir5oz0EYy9Lz8IPIKHbq7
         mLV/qM+hc3fz/OZvkoN6NT7hRNRPNDYecsV3QDqvskkzfro1I1KdFyHW2ZwgCR6Ka6pm
         qHbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WF0SaRyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z41si14147138qtb.134.2020.01.17.05.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:07:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WF0SaRyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRLy-0006ZX-0K
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isRLo-0006Xz-1J
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:07:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isRLj-0000dK-38
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:07:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37850
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isRLi-0000cw-W3
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579266462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=146OOkWpkacaps27rv8fN6FCDTAn5cxxczZuAMRntV8=;
 b=WF0SaRyYabhPGIIFxisB6ZLz4gij1eZQ/GqmIwzbFWAfIlgujF6axu01Hh2VhNY5VhMApA
 a8fmLuwUVUHqhYTVDW3uxGT0ROv2AsnxIeIFfa7fGLgp2dPjO4FL1vcpsXya05PpbjXP/3
 L6pAaysmAyDw+ZUo9y5/+Thjd8lwONI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-j4gsxvO5M825CR7-nq1qtg-1; Fri, 17 Jan 2020 08:07:41 -0500
Received: by mail-wr1-f70.google.com with SMTP id y7so10548321wrm.3
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6HLqVPHHaxyzj153UpuxS6ANVUElNpE304p19yqgEE=;
 b=DyfSaFJCK7e5zTfp+6LDoK28i9kMd7oMPd6ikX9acK4wNjJgH6j0UAg69WVWIPl2mA
 PCOF/NL7GNKezTzZWmejxfW0K1VC62jQQUm/kPl+jeUdu/Y+bckLJyNQdXm9rl7eGmTC
 VLe2hgLD8CaHqpEHsMCMCJ4r8nmeYNNNN+gK1TEfxUML2XCl2wd3FA/g+RoKMoqCLNJI
 URnPHFYdxnyn8VtZJUM2XHd40lV9vL82KtPbqZMLtwz6s/mk9gIZ+2Pb5zBWpwtcwqgk
 AtrMeJ4R7goUMoRCn0FaSvozB4DHsdiJagaVfn3N+QrAcKuegeJ2m0DXRSv3ab5BOIYb
 MQYg==
X-Gm-Message-State: APjAAAXPraXeYRCOueUtlOPUPEgGDpJ3lYYwDSUR4icMEzjdmpaP1WJx
 BnBSjKMjB7UFhby0iCyXIy6T31amYKi5o0bESfuOs+AN32DBICIe6EIonTeQSyARatL8z5dHb2o
 n1M8RrPTI4bPM
X-Received: by 2002:adf:e550:: with SMTP id z16mr2918633wrm.315.1579266460124; 
 Fri, 17 Jan 2020 05:07:40 -0800 (PST)
X-Received: by 2002:adf:e550:: with SMTP id z16mr2918609wrm.315.1579266459796; 
 Fri, 17 Jan 2020 05:07:39 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id x10sm33845194wrp.58.2020.01.17.05.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2020 05:07:38 -0800 (PST)
Subject: Re: [PATCH v3 18/86] arm:kzm: drop RAM size fixup
To: Igor Mammedov <imammedo@redhat.com>
References: <87sgkgv6dh.wl-Peter.Chubb@data61.csiro.au>
 <1579195564-95459-1-git-send-email-imammedo@redhat.com>
 <dc8d8594-0bf8-e6c2-9ce8-94bf5361bca3@redhat.com>
 <20200117105033.6801593a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <02ebfedd-854c-5500-f167-91918850435f@redhat.com>
Date: Fri, 17 Jan 2020 14:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200117105033.6801593a@redhat.com>
Content-Language: en-US
X-MC-Unique: j4gsxvO5M825CR7-nq1qtg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter.Chubb@data61.csiro.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 37DhMzoia9ui

On 1/17/20 10:50 AM, Igor Mammedov wrote:
> On Thu, 16 Jan 2020 19:22:08 +0100
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
>=20
>> On 1/16/20 6:26 PM, Igor Mammedov wrote:
>>> If the user provided too large a RAM size, the code used to
>>> complain and trim it to the max size.  Now tht RAM is allocated by
>>> generic code, that's no longer possible, so generate an error and
>>> exit instead.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> v3:
>>>    * rephrase commit message in nicer way
>>>      ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro=
.au>)
>>>    * reword error message and use size_to_str() to pretty print suggest=
ed size
>>>      ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro=
.au>)
>>>
>>> CC: peter.chubb@nicta.com.au
>>> CC: peter.maydell@linaro.org
>>> CC: qemu-arm@nongnu.org
>>> ---
>>>    hw/arm/kzm.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
>>> index 1d5ef28..94cbac1 100644
>>> --- a/hw/arm/kzm.c
>>> +++ b/hw/arm/kzm.c
>>> @@ -25,6 +25,7 @@
>>>    #include "hw/char/serial.h"
>>>    #include "sysemu/qtest.h"
>>>    #include "sysemu/sysemu.h"
>>> +#include "qemu/cutils.h"
>>>   =20
>>>    /* Memory map for Kzm Emulation Baseboard:
>>>     * 0x00000000-0x7fffffff See i.MX31 SOC for support
>>> @@ -78,10 +79,10 @@ static void kzm_init(MachineState *machine)
>>>   =20
>>>        /* Check the amount of memory is compatible with the SOC */
>>>        if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM=
1_SIZE)) {
>>> -        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
>>> -                    "reduced to %x", machine->ram_size,
>>> -                    FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE);
>>> -        machine->ram_size =3D FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1=
_SIZE;
>>> +        char *sz =3D size_to_str(FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDR=
AM1_SIZE);
>>> +        error_report("RAM size more than %s is not supported", sz);
>>
>> Yay! Can you use this pattern the other patches too?
>=20
> I plan to, as it's much neater and I can avoid adding RAM_ADDR_FMT
>=20
> Would your acks still stand or should I drop your Reviewed-bys
> on changed in such way patches?

Yes please keep my Reviewed-by tag in the other patches too.

>> You might want to add:
>>
>> #define FSL_IMX31_SDRAM_SIZE_MAX \
>>     (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE)
>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>
>>> +        g_free(sz);
>>> +        exit(EXIT_FAILURE);
>>>        }
>>>   =20
>>>        memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
>>>   =20
>>
>=20

