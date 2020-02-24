Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4498419lfg;
        Sun, 23 Feb 2020 17:12:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwY1tU1yuPOBk0UTmQnvs5frPIyt6njNnwsuQMzAVDzQOz//QemfHo8u8MDgEyLxsTWS9Wj
X-Received: by 2002:ae9:e518:: with SMTP id w24mr45585932qkf.236.1582506749712;
        Sun, 23 Feb 2020 17:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582506749; cv=none;
        d=google.com; s=arc-20160816;
        b=ULgYyvAR7UXrURglR1K4+2CI+gjHywICLJCD11DPaNLUPcXSMDJk+GS7fjpjJsX9+q
         MOs5XtqUrEyQkPtJFaPDhXGY/B+o4qWuzGaIdRTjUD4TDVImUDRXr03F+FVMjhrt2qTt
         tW9/TzSaTdBSd3v9Hw5e6kISYISNzyix+rYXOkJ2dSEnKhKDZykKHiB+PdUJ+00EJHAb
         IiZxu1IczVFk/qmB1z5+F+XjR057N7Thx8raYcPfg4NJdZhhiBbGOknHjvUmvXUbsXrz
         X5F6U5LSDZHMemNYCIxID8jEFAT6q4gw9fqCGaeiG/w8TuWckl313Jeppc7drIDFuLvr
         G7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=QpQ6BA7QLYCQqFjsLVnSNF2UY6HFjt4LZ4pEQ+frYCw=;
        b=rqxk+ZsUU8sMNtHS/xFDpj/OZGt+YtLW67b8BXt23ugL5Iar+lRRXgZMLEMwXRMl7d
         Ih33lHh7mN8COpZ3+G8JbxhEtiYZxGMETidfARfPenZTcchKSEhBjSVSob1e0sl3dGAH
         lVZw3/NuN4PP/q6urpZFCbBXeJ6SDqakQncs4I5sH2gBAtZ6xEl1/zgZlTQdozdlN/z3
         WG4Gsrjlujo3KAmivWGdiEenkEEL84W99SbnpTpULBuF5OcxfTaCn25fi3MMljc8f2lk
         xiFigkWuzeqe2b/SLHNx2XpEYSrCJBhLBrEToQirL8kPCugnGIQWNLxYemaCDt6MStS8
         C/Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si4988420qtg.79.2020.02.23.17.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 17:12:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j62IP-0008UE-5O
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 20:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j62IH-0008U6-5v
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 20:12:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j62IF-0008WR-Ka
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 20:12:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:54138 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j62IE-0008Pe-2R; Sun, 23 Feb 2020 20:12:18 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8A27BEAEE350FBB22DA4;
 Mon, 24 Feb 2020 09:12:09 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 24 Feb 2020 09:11:44 +0800
Subject: Re: [PATCH] migration/throttle: Add throttle-trig-thres migration
 parameter
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <20200221025727.63808-1-zhukeqian1@huawei.com>
 <2db47b97-729f-4ccb-dab2-585771acc2fe@redhat.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <96ff3eed-2baf-9ea4-99cd-9d8b8884ae78@huawei.com>
Date: Mon, 24 Feb 2020 09:11:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <2db47b97-729f-4ccb-dab2-585771acc2fe@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mxOOiq1QbbAH

Hi, Eric

On 2020/2/21 22:14, Eric Blake wrote:
> On 2/20/20 8:57 PM, Keqian Zhu wrote:
>> Currently, if the bytes_dirty_period is more than the 50% of
>> bytes_xfer_period, we start or increase throttling.
>>
>> If we make this percentage higher, then we can tolerate higher
>> dirty rate during migration, which means less impact on guest.
>> The side effect of higher percentage is longer migration time.
>>
>> We can configure this parameter to switch between migration time
>> firt or guest performance first. The default value is 50.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> ---
> 
>> +++ b/qapi/migration.json
>> @@ -524,6 +524,10 @@
>>   #                      compression, so set the decompress-threads to the number about 1/4
>>   #                      of compress-threads is adequate.
>>   #
>> +# @throttle-trig-thres: The ratio of bytes_dirty_period and bytes_xfer_period to
>> +#                       trigger throttling. It is expressed as percentage. The
>> +#                       default value is 50. (Since 5.0)
>> +#
> 
> Abbreviating feels odd; can you please spell this out as throttle-trigger-threshold?
OK, I will use full name in v2.
> 
> Can the threshold exceed 100%?
If the threshold exceed 100% and the dirty rate is between 100% and threshold, then throttling
will not be started, so the migration will not converge and last an uncertain time until the workload
in guest is down by itself. So I think that the threshold exceed 100% maybe not suitable :).
> 

Thanks.
Keqian

