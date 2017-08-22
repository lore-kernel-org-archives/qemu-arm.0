Received: by 10.223.188.70 with SMTP id a6csp5040662wrh;
        Tue, 22 Aug 2017 07:50:59 -0700 (PDT)
X-Received: by 10.55.22.169 with SMTP id 41mr1357992qkw.131.1503413459354;
        Tue, 22 Aug 2017 07:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503413459; cv=none;
        d=google.com; s=arc-20160816;
        b=GsrZP+m/Nv9hN4fG+zl/eELtvGjrP7+7ZvXKLGjAt/14eFb6As0e1skABXYOXnEshZ
         ssxFB+NEeL2x1LyyBvr1AuVK4SfykrVL5Xe3EfDcs8FSteCN6c9x8xMmHu8ZB20rloHL
         0VojGGRMcJwiw1cJItZG3/5cGPyBhL6A598pK58w8pho0eUbL5633aREuyseKuoFstiB
         NZ8IObuCBkBElcQCHJC310TpzMT35PdH4u159iI+X/+pIq/P49dZF9U4bZVmINtlzxmB
         LzNQikHcvIHHWE61tP7FQJv1eXW6tqxq140e/8B86ORhSDaRc9fYKrhUUhr0wQTANg16
         8GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=zTR2FtBvespCY8a42YpROD3QICvtsqV4qrngQfQvnOY=;
        b=c9gHO32tmRVk0rtgLITmPyFlkH7GS1732mc54Fo/GXbAUoMh+5u+eqRAPrXC23Fbc5
         6UvTfa839qj96fLQdCR7oESYo1E17tdbSbx0kJjWY/M/LcSwPWSgN+tYwftUXwJWV/KC
         XR4tuztJzaqQKQoMR52bOMZfZHqtATv2n/JEOot4ld4EPTywufQ1n2DYIXevZkv2SBPr
         tvKNcJpiDrkzN1ZdSc/smul3DvRKURcTNnYQSGymVAjUbpdKShXND695zNbmyPwRNJAu
         7+kMBKGABz3w8+6pnxTcXPP5/40h2l3+Y5axut2fp4eO3ZyTNxFJH0VOQAwxIHwLJOU7
         ue5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si11777945qkf.445.2017.08.22.07.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 07:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAW8-00067Q-Vc
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 10:50:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk9ns-0001iw-RF
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk9nn-0000hp-4D
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:05:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dk9nm-0000gV-UM; Tue, 22 Aug 2017 10:05:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58C1D7E45A;
	Tue, 22 Aug 2017 14:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 58C1D7E45A
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4633986E9B;
	Tue, 22 Aug 2017 14:05:04 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503407712-9894-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-V1igN7Sz3SusczcPadtZC-z4fyw-pvPggGT5VFFMvRA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8fb75274-09a6-dbd3-5dba-1069d790b689@redhat.com>
Date: Tue, 22 Aug 2017 16:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-V1igN7Sz3SusczcPadtZC-z4fyw-pvPggGT5VFFMvRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 22 Aug 2017 14:05:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/digic: Mark device with
 user_creatable = false
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
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XIC2439MiAyg

On 22.08.2017 15:52, Peter Maydell wrote:
> On 22 August 2017 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
>> QEMU currently hangs completely when the user is trying to do a
>> "device_add digic" on an unrelated ARM machine like integratorcp.
>> Looks like this device is not meant to be hot-pluggable at all, so
>> let's simply mark it with "user_creatable = false" to avoid the hang.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/digic.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
>> index 94f3263..208dfb3 100644
>> --- a/hw/arm/digic.c
>> +++ b/hw/arm/digic.c
>> @@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, void *data)
>>      DeviceClass *dc = DEVICE_CLASS(oc);
>>
>>      dc->realize = digic_realize;
>> +    /* Reason: Hangs QEMU when trying to device_add this directly */
>> +    dc->user_creatable = false;
>>  }
> 
> Maybe "uses serial_hds[]" is a better reason, or does it hang for
> some other reason?

When I kill the hanging QEMU, the stack trace looks like this:

#0  0x00007ffff13afaff in ppoll () at /lib64/libc.so.6
#1  0x0000555555bb3179 in qemu_poll_ns (__ss=0x0, __timeout=0x7fffffffda60, __nfds=<optimized out>, __fds=<optimized out>)
    at /usr/include/bits/poll2.h:77
#2  0x0000555555bb3179 in qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, timeout=timeout@entry=1000000000)
    at /home/thuth/devel/qemu/util/qemu-timer.c:334
#3  0x0000555555bb3f88 in main_loop_wait (timeout=1000000000) at /home/thuth/devel/qemu/util/main-loop.c:255
#4  0x0000555555bb3f88 in main_loop_wait (nonblocking=nonblocking@entry=0) at /home/thuth/devel/qemu/util/main-loop.c:515
#5  0x000055555578d927 in main () at /home/thuth/devel/qemu/vl.c:1917
#6  0x000055555578d927 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at /home/thuth/devel/qemu/vl.c:4791

I haven't investigated any further, but the usage of serial_hds
in the realize function could certainly be the reason. At least
it certainly is a reason that this device should not be creatable
by the user - so let me send a v2 with the comment changed
accordingly.

 Thomas

