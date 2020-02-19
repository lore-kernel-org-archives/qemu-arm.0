Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp116292lfp;
        Tue, 18 Feb 2020 21:35:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8Lraxim8HbhPgxz5KlJQOC7RsTRiUEQc4RxXkCagHVidN4c5h9iCoWh/V73hm8ocZ23u3
X-Received: by 2002:ac8:3946:: with SMTP id t6mr20633144qtb.278.1582090515168;
        Tue, 18 Feb 2020 21:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582090515; cv=none;
        d=google.com; s=arc-20160816;
        b=vcO1jdZM0Kfib8uBqPFItN1k6Oo4Y0lQirJQAPyxFbROoxYPRH/g0VijYpsQ7CC6MC
         ftCiJ9a7TWmIJxn+N125bfg3ANQEj/bS1aGVszKfV4vShTCYAA1CwNAupTcHxA80stYt
         OFNswkvihdyfAndkS65P6KDMtirj8tQnc3hxj8NIun+4fad3yO9Hn4ZjE8BNugyECT87
         +DVL0qSDmECf8LU9krLaTLY1pYmhHqw+I/w7BSSzTW4tUMCT0CA1kjM880r48S/f8yeZ
         2n8fxx9Cqba6Iz7OmWfdRbrC71BIUqh6p8BhWbhphe2m2s+ur2sRWtHtdOoi5LCMibcw
         XN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=xLxKApsG4vMQpqzfXjN96qancBWh9UzikOhwU2z/v2Q=;
        b=zq3HfGs5Wbx5ZoN0Y1XMKudtXtE9ToDTmcLe+OiLZTwk4oqXcdNMleaCRjOZFArE6X
         6yBpNFFof4k5wq7aKdqIFBuEDzDuL1xMdhR1LfNJAunCS6OFjQ9VQZSSVaNLOvnDEiaj
         8IVunUCartm/qP7ToZPIWL7/bFRnrTM+ZiCOLKVtiZtQPBfkWUI2zYyTvHnZbG+nOzPO
         LdyxNWheVrgnjuu1pG9IJW+wuE8wDBlfm3mzpsqN84R65r4a/XtbFgrtQXl5VvVZFB9d
         YebHg4Qez0fOUkUiPMlXfKlrF0NnVNiroJbeW54G/OOPm8cBkvoXUKAqYeGcV6Q2YgaL
         Yehg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si397661qkc.260.2020.02.18.21.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 21:35:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4I0w-00038r-Jo
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 00:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I0k-00038D-Dt
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 00:35:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I0j-00051V-7i
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 00:35:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3238 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j4I0i-00050U-Rq; Wed, 19 Feb 2020 00:35:01 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B7D60F4648193DD5A081;
 Wed, 19 Feb 2020 13:34:57 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 19 Feb 2020 13:34:48 +0800
Subject: Re: [PATCH] migration/throttle: Make throttle slower at tail stage
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <20200214032700.25011-1-zhukeqian1@huawei.com>
 <d46149e5-8d8f-d3b8-91ec-145c102cffb7@redhat.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <23e77c02-a2de-817c-040b-449e35555689@huawei.com>
Date: Wed, 19 Feb 2020 13:34:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <d46149e5-8d8f-d3b8-91ec-145c102cffb7@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
X-TUID: OAFzVkkVFLGO



On 2020/2/14 19:46, Eric Blake wrote:
> On 2/13/20 9:27 PM, Keqian Zhu wrote:
>> At the tail stage of throttle, VM is very sensitive to
>> CPU percentage. We just throttle 30% of remaining CPU
>> when throttle is more than 80 percentage.
>>
>> This doesn't conflict with cpu_throttle_increment.
>>
>> This may make migration time longer, and is disabled
>> by default.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
> 
>> +++ b/qapi/migration.json
>> @@ -532,6 +532,12 @@
>>   #                          auto-converge detects that migration is not making
>>   #                          progress. The default value is 10. (Since 2.7)
>>   #
>> +# @cpu-throttle-tailslow: Make throttle slower at tail stage
>> +#                         At the tail stage of throttle, VM is very sensitive to
>> +#                         CPU percentage. We just throttle 30% of remaining CPU
>> +#                         when throttle is more than 80 percentage. The default
>> +#                         value is false. (Since 4.1)
> 
> The next release is 5.0, not 4.1.
Thanks for reminding me.
> 
Thanks,
Keqian


