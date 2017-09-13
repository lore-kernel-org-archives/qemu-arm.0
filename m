Received: by 10.223.172.38 with SMTP id v35csp1044210wrc;
        Wed, 13 Sep 2017 06:23:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAOFc5oGEGUkLlxB8qQxMwrXaRrFt2rjunlKsz7ecvh/4b0BGl1Ze13UvicfiBa9ZX6TcQU
X-Received: by 10.237.63.15 with SMTP id p15mr4110725qtf.113.1505309033268;
        Wed, 13 Sep 2017 06:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505309033; cv=none;
        d=google.com; s=arc-20160816;
        b=tVq1fk63INC908O7VHnBFApFlc1ycOeNnNTcXvPcjxI/Q20wXSHzrsAE+Ax+E35eOW
         cLPHvLUzNl6rjzF4YkcbU1QAVbDfCE6qdqHB1J5/dO0iWnH3MoKqrqTcWuoSBA5kD67Q
         L6E2YwjfsPYmCB1b3repr0PHrSvEu2O4RDQ2RrF+UWcWp/tb2rXqQpDcZkkpPOR4AXEo
         6YwaNi+9rmMLCp2kEx58uBSFmfmxn7Z9682sQi7+cMHCiKoP7QfJ87kkBbBkAehR/USz
         dtcoUxdCuJr+oV7oaRaYNiC7eV3ea1T0ZOQDGErr5gwz3CUCHVKfxCB8UqpLTcSFqnkG
         E3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=ZObE4rGorgLY7v2AVssHN/VQ+UQgtb3dkIn1WjtsWCw=;
        b=g0bWFSpC1JF2ETjbUFsohN47Urqm14blFohpI7fo9hUSE9Atpk8Eo0XI/hokfDFBVT
         1KLjIUvnIOW9EqZPsJrxASvRWHgEGFi/wbIXnaBVBKL7PVW6Iu28ck8QuSZzSRcfn/tz
         kKyOusAQvIhS+/XpozIBXkv/CucK7DDebjGfbYXxmUodeky7SIybMn1H/yKOEhEoK9mI
         ZdnQ9T+D7MGI3owLXPk0txxJ4ClqTNMfKx3KQ2fymPo+N/hfeJYWui5h+pVx8qGCn8fy
         3p+9rxCqfzsq8q6jDYyHQaL4iz2CdTdgEL1hPRL/6Ti2x0PE7YmoQysWiZ8rTZuMBGzN
         4zRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si10980655qte.230.2017.09.13.06.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 06:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds7dv-0003Ug-13
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 09:23:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds7dj-0003Rz-IY
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 09:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds7dg-0001cM-Tp
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 09:23:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds7dg-0001c3-NS; Wed, 13 Sep 2017 09:23:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CC2B4E341;
	Wed, 13 Sep 2017 13:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9CC2B4E341
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.239] (ovpn-116-239.ams2.redhat.com [10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 737855C545;
	Wed, 13 Sep 2017 13:23:33 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box> <20170913124456.GB2096@work-vm>
	<770fc286-a566-920a-9aba-16c3b5264806@redhat.com>
	<20170913131948.GD2096@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <5accd02c-f116-22ef-99ef-1ddd9e58fc21@redhat.com>
Date: Wed, 13 Sep 2017 15:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170913131948.GD2096@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 13 Sep 2017 13:23:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xLqWXJfST0++

On 13/09/2017 15:19, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> On 13/09/2017 14:44, Dr. David Alan Gilbert wrote:
>>> * David Gibson (david@gibson.dropbear.id.au) wrote:
>>>> On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
>>>>> Running QEMU with
>>>>>     qemu-system-ppc64 -M none -nographic -m 256
>>>>> and executing
>>>>>     dump-guest-memory /dev/null 0 8192
>>>>> results in segfault
>>>>>
>>>>> Fix by checking if we have CPU, and exit with
>>>>> error if there is no CPU:
>>>>>
>>>>>     (qemu) dump-guest-memory /dev/null
>>>>>     this feature or command is not currently supported
>>>>>
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>
>>>> Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
>>>> of the series though.
>>>
>>> I can take the whole set through HMP.
>>
>> Could you update the comment in last patch as asked by Cornelia?
>> (PATCH v3 3/3] tests/hmp: test "none" machine with memory)
> 
> Sure, do we understand what the error that patchew caught was?

We need the fix from Cornelia, otherwise the new test fails.

Do you want I resend the series including the fix from Cornelia to be
sure patchew works?

Thanks,
Laurent
