Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp742408wrt;
        Tue, 25 Sep 2018 07:27:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60sHQCdiDA4Jv+E9S4DFNjsdQ6uyQzlhgmfBRdEmuIhCOD87c2muodHQ1mTr9xqRz07f3xX
X-Received: by 2002:aed:3b97:: with SMTP id r23-v6mr961926qte.77.1537885664976;
        Tue, 25 Sep 2018 07:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537885664; cv=none;
        d=google.com; s=arc-20160816;
        b=09T/dNe15rk2fIhDIilGwrOaTowZ/24OG7MqDE7f5qdCsnA40wNL3UcqhbrfK6RRpf
         NmQt8Jin3AcQ/HtX9GPQzNixmHueMZdE3iCdaGBlabdZ0mlDhHzQvER5yPpcsUNRYjOd
         nUaL/PrM5SwrSK5zPeEzEeHAdavjgIRBgXGN3xXFRqdvYDm1xFDNf1xkI1PPIgl8ROdX
         7afyd2t1PL/cjtfmdG37bcBwHiOTxZxt6N31OW1/LmeLRzqw8RmGyP7n5oXqC87GB/9f
         DAkBsWQcSeYLPSThBthoG3hws2OanTYyoM7JOaAxraBXr1+WNDEUP+racjV1xosY0tym
         bdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=XDsFvK+ruZq5hsK35Jy443tofVPt0bO99IyUFe5m/pI=;
        b=p2bmhgsdpDkUxdsS3M3CqxcuigHkbX6KfRI3g2fElTHQaitLF5sAP20f36YGdEo9Xw
         MzvyMFyE4nq03c+Vv3qvXJrjQvlF3YIyfGA3zAcXCtW4u/t0084OJwtyBLiCA7qnDBjo
         Ijs1qoEjJqyDtgt1jhPBFUi4M5hqDmPX0Ll0QuaXfbud0fCUqviyYIlf1In1Z6y1DJQG
         wz/HKgHHXUm9q4Y9bqZ7zfzwhiDtSBHZ2nGJyIRjXv4QytgxN+jYB6wiwkqrYVdoy6lB
         yxYfJB+pWNQxwAw934527fcSoYsUXxkPllPQR+pYHtJvsa1WpTpsAbAbRw3HZdFmw2Wm
         TPDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t64-v6si177218qkd.18.2018.09.25.07.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4oJT-00036f-Pv
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:27:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g4oI5-0002Fe-60
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:26:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g4oI0-0005e6-39
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:26:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g4oHz-0005VA-MB; Tue, 25 Sep 2018 10:26:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EA9F3002390;
	Tue, 25 Sep 2018 14:26:04 +0000 (UTC)
Received: from [10.36.117.210] (ovpn-117-210.ams2.redhat.com [10.36.117.210])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 427FE5D6A9;
	Tue, 25 Sep 2018 14:26:03 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921070138.10114-1-eric.auger@redhat.com>
	<20180921070138.10114-2-eric.auger@redhat.com>
	<CAFEAcA9vHnCrw7mX=_TTvhBjpE-58dZCX8zPOVpCBNeHya-p6w@mail.gmail.com>
	<839d47bb-16ac-8ad8-44c5-5ab86346ca94@redhat.com>
	<CAFEAcA_b0k4kpfgH-z+EL6rUM5t=w6qMbNoO8oW1aTUwqz+e1A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <346f6610-ac06-0719-1d90-b282f6593465@redhat.com>
Date: Tue, 25 Sep 2018 16:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_b0k4kpfgH-z+EL6rUM5t=w6qMbNoO8oW1aTUwqz+e1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 25 Sep 2018 14:26:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/smmu-common: Fix the name of the
 iommu memory regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbKxSL01udB/

Hi Peter,

On 9/25/18 4:24 PM, Peter Maydell wrote:
> On 25 September 2018 at 15:16, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 9/25/18 4:09 PM, Peter Maydell wrote:
>>> On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
>>>> At the point smmu_find_add_as() gets called, the bus number might
>>>> not be computed. Let's change the name of IOMMU memory region and
>>>> just use the devfn and an incrementing index.
>>>>
>>>> The name only is used for debug.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  hw/arm/smmu-common.c | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>>> index 55c75d65d2..3f55cfd193 100644
>>>> --- a/hw/arm/smmu-common.c
>>>> +++ b/hw/arm/smmu-common.c
>>>> @@ -311,6 +311,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>>>>      SMMUState *s = opaque;
>>>>      SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
>>>>      SMMUDevice *sdev;
>>>> +    static uint index;
>>>
>>> "uint" isn't a standard type (and causes a build failure on
>>> at least one of my build systems). Did you mean "unsigned int" ?
>> Hum yes, I did. Shall I repost or do you fix it directly?
> 
> I've fixed it up in my v2 pull request.

OK thanks!

Eric
> 
> thanks
> -- PMM
> 
