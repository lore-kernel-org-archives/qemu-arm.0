Received: by 10.223.172.38 with SMTP id v35csp1114127wrc;
        Wed, 13 Sep 2017 07:30:52 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAKj2aYOvB8LOJDlK8dRXnN+Qq5ae6w1zTGu2DqwrE5gSKD82b+Wtf1XiBOVmYth/sG9Gfp
X-Received: by 10.55.201.155 with SMTP id m27mr25869011qkl.57.1505313052011;
        Wed, 13 Sep 2017 07:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505313052; cv=none;
        d=google.com; s=arc-20160816;
        b=FWtnvKKyP3Jk5rNG7Ur2MuFcb9RvZU+ESvIS6VgM/kxQOvn94m/F2h/CNcK6ptxqw4
         g4+czi6YMalJqVL/rr9vnCNrqe4nCCo8/SKE3BohC4WoUSCiTXZOavORxLMeszFFKW4r
         uQsXubTF0W8KG5oHH017LxdWKBzBW5I9cxyKRv0VXBQQsi+h4Y4GM36dmQRFjo2bLuQK
         JtHZQZ+ozbqiUP4jx60QrzZQxjtl9mvqDaHvWqAw00UoGtr/p88kRtrpcORGme1rUoGi
         7xQjQ3U7aTGbwNJ9DPfK0itF/YK3Fk4f1ne+6yYvs/M1v9jKN/brAFDcDgTChl8f/2Xw
         L7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=xS89dB09gvC2RmZ/FVxz1x64xTQotdMWDKW/MSDpcmA=;
        b=iRM5W9UJFPNKdJ7mpmIBHe1w2i9RsPki8pzAbrg5YPieYZqpOHQkiioJB4WUF4U0RD
         FWfhl+Omzn/5O6AHT636Zha4VtbqfzXGnouLjjvblcv+v0mOoVlHQ6o3bQgPB+ZSDnz7
         PUQAXbzmoOfxYCmzQVd6d1ZIeFe0j0aGEtxz5pqV7MmyXECyz4q5f6ax2V+ljD1dPdFa
         aYaqE7Jzx5vqQWeuPoA/cNvkwKbcea7K6BX90RyJWGSqHR0TJ33aeUw6zSkWbgNC4Kid
         axgzsd0sKoo5nqa8VTJZZk7Wqy7wb1mq+nJp6zFmir5wzskN3qXJ35NjkfFkCntKgs3l
         jEtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o132si13861690qka.488.2017.09.13.07.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8gj-0004ml-MZ
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:30:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8gS-0004gQ-AN
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8gM-00031K-Nq
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:30:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27961)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds8gM-0002zY-Hz; Wed, 13 Sep 2017 10:30:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E656A710;
	Wed, 13 Sep 2017 14:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8E656A710
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.49] (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F5D077D69;
	Wed, 13 Sep 2017 14:30:21 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>
References: <20170913142036.2469-1-lvivier@redhat.com>
	<20170913142036.2469-4-lvivier@redhat.com>
	<20170913162709.3933352d.cohuck@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <32c345ab-ce02-fe29-1587-db863fb21209@redhat.com>
Date: Wed, 13 Sep 2017 16:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170913162709.3933352d.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Sep 2017 14:30:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 3/4] dump: do not dump non-existent guest
 memory
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
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTioXNHIk8pu

On 13/09/2017 16:27, Cornelia Huck wrote:
> On Wed, 13 Sep 2017 16:20:35 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> It does not really make sense to dump memory that is not there.
>>
>> Moreover, that fixes a segmentation fault when calling dump-guest-memory
>> with no filter for a machine with no memory defined.
>>
>> New behaviour is:
>>
>> (qemu) dump-guest-memory /dev/null
>> dump: no guest memory to dump
>> (qemu) dump-guest-memory /dev/null 0 4096
>> dump: no guest memory to dump
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Tested-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> ---
>>  dump.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
> 
> You need to supply your s-o-b as well, no?
> 

I was wondering... theoretically, yes, so:

Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Thanks,
Laurent
