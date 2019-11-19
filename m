Received: by 2002:a05:6512:6a:0:0:0:0 with SMTP id i10csp261986lfo;
        Mon, 18 Nov 2019 19:19:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxML9eLo04LhPQaz2wZLfcPD4hD8q3L56jKDZ9sLWlfEwjH5wrkQuQ3CQjCmDYYjIfcx6op
X-Received: by 2002:ac8:7085:: with SMTP id y5mr30040409qto.76.1574133544211;
        Mon, 18 Nov 2019 19:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574133544; cv=none;
        d=google.com; s=arc-20160816;
        b=NQ+sKnIslWmtjai1+BlBhT7UbFa4gKurmFdwtdUCPt25Oo06+4IN/JiXeXJX6oXwaC
         4oeM5pP3ABLbivFgeTWIWfRa5teALXZ4beqWuO5gHeiOC0K8z/WpaKCOfZLxfRsVT69g
         g62GuRsJKpARz+s3Oyho4fKQV4uak0NVGSTvXhgXLAyUgBcXZVbVKrnhZ0VGDH9noXos
         cSfRET21TXsJDyxYMZGyGuUsHw71Rs883ffoPUuBVQJvN91UJaETpZxMlCZh2omzh2BI
         mugtBAYcD9rXq79rog2+fAp2wcbkP0G1xBJqml4p0ShMpvVJKc1GeKQu86fRhN5fI1hc
         5GLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=vvMcGjDdsetynpulz+C5xtRnC462Q0Edhz5GlikMy2A=;
        b=MvwCMUMSdv+y9fNHNZXrYLKu1ObqjtxAKmfNBcWKiYbZsAF3be2yiPTDGvwaWnALAp
         6NAJpA0cx+FrYVi6F5rPsRRuNRgh8kSlKIQRBv/ixIx5A8m6Vg6HdpAChF5rLlHF9aWJ
         2qCvnHe2uuzoYPpG/2mbEApOLFVNQMNKifkkgiI2lV1KXNbYrFao42tJPSQaVQ14z43m
         ssyxlY0awLsgMwunPUVio/2do4KAjz8dqd81m/3Yu8/U1xIgyLHiLiqR5n/jsXuYKWsA
         BzEERqmr2VqdPwhg6+nXSo+reH2fsCDzJECLY8orNSvDqh6oiBpCPmhwY+9Lpn6ixTwT
         u7LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si12419397qvb.105.2019.11.18.19.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 19:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWu2h-0006Ty-Hr
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 22:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iWtvu-00079L-0P
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 22:12:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iWtvs-0000Ak-MU
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 22:12:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2266 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iWtvs-0008To-CA; Mon, 18 Nov 2019 22:12:00 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 271B4698BAD516829071;
 Tue, 19 Nov 2019 11:11:53 +0800 (CST)
Received: from [127.0.0.1] (10.120.177.99) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 19 Nov 2019
 11:11:44 +0800
Subject: Re: [Qemu-devel][PATCH] ppc/spapr_events: fix potential NULL pointer
 dereference in rtas_event_log_dequeue
To: David Gibson <david@gibson.dropbear.id.au>
References: <1574041813-35408-1-git-send-email-pannengyuan@huawei.com>
 <20191119025058.GN5582@umbus.fritz.box>
From: pannengyuan <pannengyuan@huawei.com>
Message-ID: <3e289453-cde4-cb9c-882f-88a5a2e78b36@huawei.com>
Date: Tue, 19 Nov 2019 11:11:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119025058.GN5582@umbus.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.120.177.99]
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
Cc: kuhn.chenqun@huawei.com, qemu-arm@nongnu.org, kenny.zhangjun@huawei.com,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W7fqQksn8N50

Thanks for you reply.
I think you are right, I will send a new version later.

On 2019/11/19 10:50, David Gibson wrote:
> On Mon, Nov 18, 2019 at 09:50:13AM +0800, pannengyuan@huawei.com wrote:
>> From: PanNengyuan <pannengyuan@huawei.com>
>>
>> source is being dereferenced before it is null checked, hence there is a
>> potential null pointer dereference.
>>
>> This fixes:
>>         360
>>     CID 68911917: (NULL_RETURNS)
>>         361. dereference: Dereferencing "source", which is known to be
>>         "NULL".
>>         361        if (source->mask & event_mask) {
>>         362            break;
>>         363        }
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
> 
> I don't think this is the right solution.  The only events we ever
> generated are LOG_TYPE_EPOW and LOG_TYPE_HOTPLUG, so in fact source
> should never be NULL.
> 
> I think the correct way to satisfy Coverity here is to have
> rtas_event_log_to_source() do an assert(), rather than returning NULL
> for other event types.
> 
>> ---
>>  hw/ppc/spapr_events.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>> index 0e4c195..febd2ef 100644
>> --- a/hw/ppc/spapr_events.c
>> +++ b/hw/ppc/spapr_events.c
>> @@ -358,7 +358,7 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(SpaprMachineState *spapr,
>>              rtas_event_log_to_source(spapr,
>>                                       spapr_event_log_entry_type(entry));
>>  
>> -        if (source->mask & event_mask) {
>> +        if (source && (source->mask & event_mask)) {
>>              break;
>>          }
>>      }
> 

