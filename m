Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp537889lfp;
        Wed, 29 Jan 2020 05:02:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzeKdVbryzfcdVD6yYWvHfheyevCeRbCnBKeJrO6PAK1qMHheUcfUQLlTmqtXauwJ42Oq+N
X-Received: by 2002:a05:620a:1014:: with SMTP id z20mr26485360qkj.196.1580302952547;
        Wed, 29 Jan 2020 05:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580302952; cv=none;
        d=google.com; s=arc-20160816;
        b=kEXyyxuRDd35Ox6YZYWyfN9x/YcJhrP6ltR9sGOArfrWbYWUMyG7x5zXPQPXbrdApD
         JVKIT3DwqM//S99efbq2xBlexOk8FlT4l0aXbyZ87wzth8skhxhSaTvca24m45n6zzG7
         y7fy56TH2ScCKopFvGtDwTIkqx58DqYUeQO3GFz4tBWusl5j3R/3pfnuOz5B/8dbJPW9
         7sVccVrNRQbrx5m+tcnjBVp5tP+EFagFnc6452pmD5LPSsUXRrBFmxPet6ZqtOxMacsn
         qbKx6oU5W4D/ZddI1oXjvYwQauMX9xxgto+4Ym2qrvKBCXc877dex3IL4VGE/yJsUiBj
         H9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rqC7hRihYW4/WKsPGZQLZNY4R1WN54psz4drXOusWhU=;
        b=hq4T5cMtPiHNdZqZ8/Phlt69Ia2SaGAfqRPo9IEvbd4HcETwhZy3moT7vKAURNC+3L
         uRunhsBboVSUNuAcJ3JuJLYDl5eOgYuxkLMh5NSpHwdT78SVKkIU5+iTkMTRthXYCE4o
         zMEbPws2WPJhjrE7fOK7ASC2j5nDO7djR8Qwq6y6YJ2hiKj3XNByRvD42my1LUuHLx7/
         PzJtXbza1v7sT+O6HqALu2HpX3T7fLN7b1PaOfsmbmy6qx99MjKHSDRzp+SzEBaSnggn
         xOoaxnKSh+VJ/2hHyWSo8KDTBEDcKnfdMsWaStUMi76179/j7HqKBryilki4ZCu4ApNo
         m/tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dG4wWzMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i195si1349878qke.43.2020.01.29.05.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 05:02:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dG4wWzMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwmzH-0007xQ-Sb
	for alex.bennee@linaro.org; Wed, 29 Jan 2020 08:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwmz4-0007t6-Hi
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 08:02:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwmz2-0002hs-Up
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 08:02:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40131
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwmz2-0002h6-Pw
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 08:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580302936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqC7hRihYW4/WKsPGZQLZNY4R1WN54psz4drXOusWhU=;
 b=dG4wWzMZp5QmBHoIQGsmCiCsyrIV/QBpcF1uA5KOPmiUagS/E0doCpRNCtsq9A8dO9BRmF
 4Ct0nRUJy1srBs4S9rnB8J+aYhBNB0+l52xS/sM13ACm/djRmjs8prPs9YkUQZCa5rj9wp
 oO2Rxw/hn0B/38EBCoXIHDS6rYLow8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-UpwoNd5iMO2GL1yx8xWrVA-1; Wed, 29 Jan 2020 08:01:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B3F10054E3;
 Wed, 29 Jan 2020 13:01:57 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E8060C05;
 Wed, 29 Jan 2020 13:01:50 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp test
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
 <6cdba6ae-928d-696b-19b2-f4f81f341f3a@redhat.com>
 <77db9c11b6f248208ce50bb6a267bf16@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ac0f4913-c9b6-d769-70bc-3f2dbb3f157a@redhat.com>
Date: Wed, 29 Jan 2020 14:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <77db9c11b6f248208ce50bb6a267bf16@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: UpwoNd5iMO2GL1yx8xWrVA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YrRDA1VEJ8+F

Hi Shameer,

On 1/29/20 11:35 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Qemu-devel
>> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=huawei.com@nongn
>> u.org] On Behalf Of Auger Eric
>> Sent: 28 January 2020 16:29
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com
>> Cc: peter.maydell@linaro.org; xiaoguangrong.eric@gmail.com;
>> mst@redhat.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
>> <xuwei5@huawei.com>; shannon.zhaosl@gmail.com; lersek@redhat.com
>> Subject: Re: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp
>> test
>>
>> Hi Shameer,
>>
>> On 1/17/20 6:45 PM, Shameer Kolothum wrote:
>>> Since we now have both pc-dimm and nvdimm support, update
>>> test_acpi_virt_tcg_memhp() to include those.
>>>
>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>  tests/data/acpi/virt/NFIT.memhp | 0
>>>  tests/data/acpi/virt/SSDT.memhp | 0
>> Is it normal to have those 2 above void files? I lost track about the
>> process.
> 
> I guess so :). From tests/qtest/bios-tables-test.c,
> 
> /*
>  * How to add or update the tests:
>  * Contributor:
>  * 1. add empty files for new tables, if any, under tests/data/acpi
>  * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
>  * 3. commit the above *before* making changes that affect the tables
>  ...

Thank you for reminding me of the process and doc location
> 
> After reading that again, I am not sure those empty files can be in this
> Patch or not. I can move it to 6/7.

yep, maybe better then to put them in the same patch.
> 
>>>  tests/qtest/bios-tables-test.c  | 9 +++++++--
>>>  3 files changed, 7 insertions(+), 2 deletions(-)
>>>  create mode 100644 tests/data/acpi/virt/NFIT.memhp
>>>  create mode 100644 tests/data/acpi/virt/SSDT.memhp
>>>
>>> diff --git a/tests/data/acpi/virt/NFIT.memhp
>> b/tests/data/acpi/virt/NFIT.memhp
>>> new file mode 100644
>>> index 0000000000..e69de29bb2
>>> diff --git a/tests/data/acpi/virt/SSDT.memhp
>> b/tests/data/acpi/virt/SSDT.memhp
>>> new file mode 100644
>>> index 0000000000..e69de29bb2
>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>> index f1ac2d7e96..695d2e7fac 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -913,12 +913,17 @@ static void test_acpi_virt_tcg_memhp(void)
>>>      };
>>>
>>>      data.variant = ".memhp";
>>> -    test_acpi_one(" -cpu cortex-a57"
>>> +    test_acpi_one(" -machine nvdimm=on"
>> nit: maybe keep the same order as before ...
>>> +                  " -cpu cortex-a57"
>>>                    " -m 256M,slots=3,maxmem=1G"
>> and simply add ,nvdimm=on to above line.
>>>                    " -object memory-backend-ram,id=ram0,size=128M"
>>>                    " -object memory-backend-ram,id=ram1,size=128M"
>>>                    " -numa node,memdev=ram0 -numa
>> node,memdev=ram1"
>>> -                  " -numa dist,src=0,dst=1,val=21",
>>> +                  " -numa dist,src=0,dst=1,val=21"
>>> +                  " -object memory-backend-ram,id=ram2,size=128M"
>>> +                  " -object memory-backend-ram,id=nvm0,size=128M"
>>> +                  " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
>>> +                  " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
>>>                    &data);
>>>
>>>      free_test_data(&data);
>>>
> 
> Ok. Noted.


Thanks

Eric
> 
> Thanks,
> Shameer
> 

