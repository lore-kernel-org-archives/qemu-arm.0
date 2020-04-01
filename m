Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp26794lfi;
        Tue, 31 Mar 2020 18:27:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuxQKxvRTwJcmcOG4vuV1hGE7Bhq33Hi6K7mCE/o90uMyvlZ97cqCT7Tjw7ttjgrIb65a1i
X-Received: by 2002:a37:8046:: with SMTP id b67mr7831968qkd.207.1585704464684;
        Tue, 31 Mar 2020 18:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585704464; cv=none;
        d=google.com; s=arc-20160816;
        b=ZulAAaUWaup0M53rmQUFF7hpq801rB0VCRIlRgkCSDVKPrmQ2j+jH8pfVZhYvy44wM
         pkERHF7yC193wyNPhYBzoyh6cZxRcQDa7ira5rRPXxDu5+wunjMDaoImpFmLLWXq88xG
         B95ztZh0ReNZmu0k1XsVvmLv6QzugNbpTgmyswyd2yw3n7Sy18LLom0zCLXWzIS4rNzW
         YABo8CEAPJJ6oZMmiqNms3UYnsaZKZ8eJ4YAVpnNqVb1S0IZmhZzLLsg1fwPI4oD846O
         w1LfTQ1rV903rklVDQ9vT/K1tOw/pGuFwrt+akAjVsM7I4/nUReFucDcW3Q2/CNPVx6D
         DpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=ItMnk1sVvOah/z8ZYbgIPe4wn65oWE4bgeMY+Exb5mc=;
        b=twVr/HrHsYO8m8aIvCsXhKx8v170cFGhkH2nvju4ckMiT8bCumFqwHumvbA3/nWFRF
         iWKWS7ifoWw0QEaaPJD300qdkBiUT2M73a4fTQ8Q5ENP9Ar7oeKzYa8nLLUotW72iIBa
         AyLDZryLWU8Zzh20AQd1WjyV2bpguDzFkJN2NAigharwliiTv8CS7x2mDjmf9b2RXqvU
         FkSOZxoHQ6fosj+q2TLYMbhG/ROB77Tkr+8C8/56X7ZEo8gHfJBC9ymAyDkDktnb6pJA
         ET5znaVJvpJ7qAjl5w9nswrdUBpQtMzWOml3beNHtFcZbwq93jIFDj4BotgW2wHCXQuk
         S4UA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w61si370020qtd.214.2020.03.31.18.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 18:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJSAS-0005Us-4v
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 21:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jJSAH-0005TA-Hn
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 21:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jJSAG-0000Gu-55
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 21:27:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3221 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jJSAF-0008Km-QM; Tue, 31 Mar 2020 21:27:32 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1F72338BC5638744CD24;
 Wed,  1 Apr 2020 09:27:26 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 1 Apr 2020 09:27:17 +0800
Subject: Re: [PATCH v2] migration/throttle: Add cpu-throttle-tailslow
 migration parameter
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <20200316042935.28306-1-zhukeqian1@huawei.com>
 <144483ff-e10d-e1b5-0c60-609b4da9c217@redhat.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <21b7be8f-fd42-e585-2955-fc810c39aaee@huawei.com>
Date: Wed, 1 Apr 2020 09:27:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <144483ff-e10d-e1b5-0c60-609b4da9c217@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
X-TUID: jHMZKKbl9UfJ

Hi Eric,

On 2020/3/31 23:03, Eric Blake wrote:
> On 3/15/20 11:29 PM, Keqian Zhu wrote:
>> At the tail stage of throttling, the Guest is very sensitive to
>> CPU percentage while the @cpu-throttle-increment is excessive
>> usually at tail stage.
>>
>> If this parameter is true, we will compute the ideal CPU percentage
>> used by the Guest, which may exactly makes dirty rate to be dirty
>> rate threshold. Then we will choose a smaller throttle increment
>> between the one specified by @cpu-throttle-increment and the one
>> generated by ideal CPU percentage.
>>
>> Therefore, it is compatible to traditional throttling, meanwhile
>> the throttle increment won't be excessive at tail stage. This may
>> make migration time longer, and is disabled by default.
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
>> @@ -552,6 +552,21 @@
>>   #                          auto-converge detects that migration is not making
>>   #                          progress. The default value is 10. (Since 2.7)
>>   #
>> +# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
>> +#                         At the tail stage of throttling, the Guest is very
>> +#                         sensitive to CPU percentage while the @cpu-throttle
>> +#                         -increment is excessive usually at tail stage.
>> +#                         If this parameter is true, we will compute the ideal
>> +#                         CPU percentage used by the Guest, which may exactly
>> +#                         makes dirty rate to be dirty rate threshold. Then we
> 
> Grammar is off here, but I don't know if you meant "which may exactly make the dirty rate match the dirty rate threshold" or something else.
> 
yep, this is what I want to express. I will correct it in v3. Thanks.
>> +#                         will choose a smaller throttle increment between the
>> +#                         one specified by @cpu-throttle-increment and the one
>> +#                         generated by ideal CPU percentage.
>> +#                         Therefore, it is compatible to traditional throttling,
>> +#                         meanwhile the throttle increment won't be excessive
>> +#                         at tail stage.
>> +#                         The default value is false. (Since 5.0)
> 
> Is this a bug-fix that must make it into 5.0?  It seems more like a feature addition, at which point listing it for 5.1 is probably a better idea.
> 
Thanks for figuring it out.
This patch is sent out when v5.0 is not released.
I will correct it in v3.

Thanks,
Keqian

