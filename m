Received: by 10.223.172.38 with SMTP id v35csp1008356wrc;
        Wed, 13 Sep 2017 05:51:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAbqEzwIV+IZ30pfsUAoPHUwN8E5i9pK6Vu0Fo4Bh6tQrHaz5i4BQl9F4BtS/tBqz6k785Z
X-Received: by 10.55.87.135 with SMTP id l129mr23566162qkb.282.1505307101064;
        Wed, 13 Sep 2017 05:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505307101; cv=none;
        d=google.com; s=arc-20160816;
        b=byL7x99a38BGkMXOqQb+3AzHwdX27xJFn2j/LLrwlM8s8EWcL6cvj1dgCdQwuhaxbG
         V2XJt2IVKeTBa3iyAu+GAEtZY74ofT+ZehIxAB+xx9OYLl80TcDdsEht43k+YRLxuhxR
         RiHk9vyLdKNOzkNNN/3Jq8Vvdw3Wv57uq2VCk/1wrpsCNjy+qJN+Fy2SEBvgWdUY0VRv
         +yH/pFc9kX2Kjfwj4UGPMhB0e4ylDqqqJRtjAn9gYtQCz+M4Zyht+BKTnOyCvUVYqG/L
         kBoX0TUu/EORS44JNJoTunG9y9MDnAEYhKJmLV9vidsBjt/Y0GARB0S1gp55RSFWkWWi
         rZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=RbPnS04W8VlI0qdWlyiQyEWGhognxSz/ZD6at4/B1W8=;
        b=jSUl0zcaJZRsWEvI4CNWrRgvyoLZcOZBqq4GKPmf5Gqux48hDzvsvbjuHivb1d7Pt1
         zCfjKPcLIW/5wPSr+rp0XQ6zN5l/26Auek4eME/fvz0ENS03I+2l0okXo2WBi3AG1wik
         JoHjFNJp9dHb0dIQ1Fj8LBXaRHRbdL4RHZdfL7KzHbcIC8XdEDWINV4HohND1PCKo5n/
         j+MSbi/rwjXjHc/OGkPgbGmiFh17bj4846m10HHOm7SE46Dsi0JDHMsrBUJX9MNwrnmi
         vJWPMiAVN63ZS30kFcdogx1BYK3YUGzr07oEUIJchNlzf+O+3PtzGlX6ca91DQKaMj/h
         obpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h30si2392614qta.91.2017.09.13.05.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 05:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds78k-0001TH-VO
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 08:51:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds77B-0008U0-FQ
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds777-00064M-GX
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:50:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds777-00062X-8C; Wed, 13 Sep 2017 08:49:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 776BB5D4;
	Wed, 13 Sep 2017 12:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 776BB5D4
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.239] (ovpn-116-239.ams2.redhat.com [10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4520160C53;
	Wed, 13 Sep 2017 12:49:53 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box> <20170913124456.GB2096@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <770fc286-a566-920a-9aba-16c3b5264806@redhat.com>
Date: Wed, 13 Sep 2017 14:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170913124456.GB2096@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Sep 2017 12:49:55 +0000 (UTC)
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
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ANOhr9YpaC3k

On 13/09/2017 14:44, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
>> On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
>>> Running QEMU with
>>>     qemu-system-ppc64 -M none -nographic -m 256
>>> and executing
>>>     dump-guest-memory /dev/null 0 8192
>>> results in segfault
>>>
>>> Fix by checking if we have CPU, and exit with
>>> error if there is no CPU:
>>>
>>>     (qemu) dump-guest-memory /dev/null
>>>     this feature or command is not currently supported
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>
>> Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
>> of the series though.
> 
> I can take the whole set through HMP.

Could you update the comment in last patch as asked by Cornelia?
(PATCH v3 3/3] tests/hmp: test "none" machine with memory)

Thanks,
Laurent

> 
> Dave
> 
>>> ---
>>>  target/ppc/arch_dump.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
>>> index 8e9397aa58..95b9ab6f29 100644
>>> --- a/target/ppc/arch_dump.c
>>> +++ b/target/ppc/arch_dump.c
>>> @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
>>>  int cpu_get_dump_info(ArchDumpInfo *info,
>>>                        const struct GuestPhysBlockList *guest_phys_blocks)
>>>  {
>>> -    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
>>> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>>> +    PowerPCCPU *cpu;
>>> +    PowerPCCPUClass *pcc;
>>> +
>>> +    if (first_cpu == NULL) {
>>> +        return -1;
>>> +    }
>>> +
>>> +    cpu = POWERPC_CPU(first_cpu);
>>> +    pcc = POWERPC_CPU_GET_CLASS(cpu);
>>>  
>>>      info->d_machine = PPC_ELF_MACHINE;
>>>      info->d_class = ELFCLASS;
>>
>> -- 
>> David Gibson			| I'll have my music baroque, and my code
>> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
>> 				| _way_ _around_!
>> http://www.ozlabs.org/~dgibson
> 
> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

