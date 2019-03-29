Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1840252wrx;
        Fri, 29 Mar 2019 06:04:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHztak89UD/ilsPmrcpr/9sANmUdH+kvUhlglT6f8Oj2s9+xpeCCpSWTxZEDiPDgHzDOpN
X-Received: by 2002:a6b:d307:: with SMTP id s7mr3161029iob.81.1553864692897;
        Fri, 29 Mar 2019 06:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553864692; cv=none;
        d=google.com; s=arc-20160816;
        b=ghCxNrHHM+U6g5Zne6uWVUmW8sYr/yDdcxAJckwLGgAH547Oeq+XKcSrpBtzh8VXf7
         n0dNFvIlYyLaCmN1eM5d/Ag2AEHnpIzPy47uld61uyBmOT73HVg5N6SI3M/n6tqHfrl/
         1NZ1GgU6fDc1bPe/efEzMxTxBp4k28LS9sibzmS/ZpiypYaSriDtofkuTocp9QNtdTX+
         r5t+8UFA1AeSj7hIr/JbFz182wOWwx3L8SsFvVgjx8egmDYRmPssEyhisraRPyxKxXoQ
         WV7RKMijbdPJLnN7wWV4/j8xsA9bqaEGUscL1AQLZIUjNORF14UWx88K252LmFzb/kxc
         VQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=Wf3WZJMwQeRNDnoY+3YvjD22s0umpknghCF07o00sBA=;
        b=XNQEKsqtTS1eePjUv31dNrFFtkXcrenfX08U9VXOgSh33MCdDl70JDdbre9OjnWMZ5
         x9dLSwgE8xveOVsv9PWXb+VAUF4sAWjosWq+51VkJ+oHClPKvdUGRrCgs34L542GfEGO
         OwE8cp9sncOyR7Ywbo2YPdqLRZEutXPjfUUkSjpd4CePiuZBgKUQHkL1afqzWWlJvHBG
         G2NOE0VPJRAbmv98tiABpCt94LGgwWc82oOBD5EmTcaJFsQFbcE/TPxLa6sgm0i7bGOm
         K368QNEHVYItlEWAX3Z4kDEXD7MaFXvxWQN+nUWi76MZfxo7CrwdS+65axTbuUgj4qLU
         mBXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si945614jae.111.2019.03.29.06.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rBk-0006Pu-7f
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:04:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1h9rBb-0006MV-F8
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1h9rBa-0001U4-BT
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:04:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>)
	id 1h9rBa-0001To-1z; Fri, 29 Mar 2019 09:04:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2324F30718DD;
	Fri, 29 Mar 2019 13:04:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-118.rdu2.redhat.com
	[10.10.122.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E24660852;
	Fri, 29 Mar 2019 13:04:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190328152944.3199-1-peter.maydell@linaro.org>
	<4eb279f0-be5a-6250-678d-bec430d8473b@redhat.com>
	<CAFEAcA8S+fo--kRVyDe=rO21Md8ypxCfcVaq5w4iosgM=H7nNg@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <82c97f5e-e92a-7e8c-9754-c9eebc94e6d7@redhat.com>
Date: Fri, 29 Mar 2019 10:04:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8S+fo--kRVyDe=rO21Md8ypxCfcVaq5w4iosgM=H7nNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 29 Mar 2019 13:04:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 for-4.1] hw/arm/raspi:
 Diagnose requests for too much RAM
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wirH3eGJn2Pb


On 03/29/2019 06:20 AM, Peter Maydell wrote:
> On Thu, 28 Mar 2019 at 21:29, Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
>>
>> On 03/28/2019 12:29 PM, Peter Maydell wrote:
>>> The Raspberry Pi boards have a physical memory map which does
>>> not allow for more than 1GB of RAM. Currently if the user tries
>>> to ask for more then we fail in a confusing way:
>>>
>>> $ qemu-system-aarch64 --machine raspi3 -m 8G
>>> Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
>>> qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
>>> Aborted (core dumped)
>>>
>>> Catch this earlier and diagnose it with a more friendly message:
>>> $ qemu-system-aarch64 --machine raspi3 -m 8G
>>> qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB
>>>
>>> Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> Changes v1->v2: use '>', not '>='...
>>>
>>>    hw/arm/raspi.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>>> index 66899c28dc1..fe2bb511b98 100644
>>> --- a/hw/arm/raspi.c
>>> +++ b/hw/arm/raspi.c
>>> @@ -12,6 +12,7 @@
>>>     */
>>>
>>>    #include "qemu/osdep.h"
>>> +#include "qemu/units.h"
>>>    #include "qapi/error.h"
>>>    #include "qemu-common.h"
>>>    #include "cpu.h"
>>> @@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int version)
>>>        BusState *bus;
>>>        DeviceState *carddev;
>>>
>>> +    if (machine->ram_size > 1 * GiB) {
>>> +        error_report("Requested ram size is too large for this machine: "
>>> +                     "maximum is 1GB");
>> 1GB vs 1GiB... maybe the message should display "GiB" to avoid any
>> confusion?
> I don't know why we call our #defined constant GiB -- to me
> the unit is GB and I think printing anything else in user
> messages is weird.

Ok, I find it weird as well. But I slightly remember that discussion 
before so I thought in raising it here too.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> thanks
> -- PMM
>

