Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp589563wrt;
        Tue, 25 Sep 2018 05:08:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV613t1GjliwXzdbok3MpGRvw4b/9TrFUh/+mjxd+mJDmUmuNjxquj939Evj/vH/94+icpiyT
X-Received: by 2002:a0c:f788:: with SMTP id s8-v6mr487295qvn.192.1537877285572;
        Tue, 25 Sep 2018 05:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537877285; cv=none;
        d=google.com; s=arc-20160816;
        b=LAbgL81nmGEtl6OgYf45NgRiB3sQDyeeuEXCGXC0HcWtaCYZAmedVuYVkdpudIqg1m
         3ljODN9dIFiBYFkzBVl34C0UFN/7PE3W+dCL9vkfWNPbrYTlM9Tb/lTQcbNsuCmPokEv
         COzwNAb2LwAqnisuiK4JA+8K15FH3YJK6PgGhct7PztmfvKcVZJ/UYYUhzbNkGk1LI/d
         Vm6VmR/5n/aM5pFvVZEarqmdp6tvq8Ht17+JFZazeUlhz8g8PM18BCwfUlZy2oOKT8zX
         SRY41lDoFMlC+z0z1Hj8V+cwwLV1gwqYYt1M4M2RHC4AXy8z5v2/6zGzZRDjtl0FQlcO
         Gxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=xxR7sh/hE6wMILXHQ1ImkCV4Xrqwm43LLwb/JVHy44o=;
        b=nUiSa3GELnRtBbz2N2v5K85nnY6Gt+9ATABg85UgcjesSbP+Dbcs28G90T3Q35GvnZ
         cbEIz2Wv7bo4nLMxDdgt18vHYfCBxU7q0khtOPRKevIQgws/yKhM+gs/VPETiS7P3UAg
         RmZLA7bRZoWuDP6HOZ0AAvMqESpSK8t26inpfUgswkTwLGh2YyJ6KpMjp6wRG/CsktOW
         RYbEMShnMzdWyO6DqVgTQB3wcO1pNG0WUbVqqS+1ho76RI0n/1Fsd7aWbkXRKeZkzg3N
         Glk3RxNc/uN8p+dVd+IZWj4ey4vt+tJM02WKP+8jNd7zSeXc7AuTz1cZpxPYrsoatY3O
         /vdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63-v6si872282qku.178.2018.09.25.05.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 05:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4m8L-0003o8-4X
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 08:08:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g4m87-0003nw-Ei
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:07:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g4m82-0003R4-Gj
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:07:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53692)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g4m82-0003Q4-3X; Tue, 25 Sep 2018 08:07:46 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com
	[10.5.11.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 650D9C0270D2;
	Tue, 25 Sep 2018 12:07:44 +0000 (UTC)
Received: from [10.36.117.210] (ovpn-117-210.ams2.redhat.com [10.36.117.210])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F97308BDB3;
	Tue, 25 Sep 2018 12:07:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921070138.10114-1-eric.auger@redhat.com>
	<20180921070138.10114-3-eric.auger@redhat.com>
	<CAFEAcA8nZLRtpb7E4bf_8QNBugerS=9Eja7AV51cfEmhDssXgQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0bbc92e0-be17-8154-985b-69f5d33be343@redhat.com>
Date: Tue, 25 Sep 2018 14:07:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8nZLRtpb7E4bf_8QNBugerS=9Eja7AV51cfEmhDssXgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 25 Sep 2018 12:07:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/smmuv3: fix eventq recording and
 IRQ triggerring
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
X-TUID: 2d20OaxTsgRx

Hi Peter,

On 9/25/18 12:25 PM, Peter Maydell wrote:
> On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
>> The event queue management is broken today. Event records
>> are not properly written as EVT_SET_* macro was not updating
>> the actual event record. Also the event queue interrupt
>> is not correctly triggered.
>>
>> Fixes: bb981004eaf4 ("hw/arm/smmuv3: Event queue recording helper")
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3-internal.h | 26 +++++++++++++-------------
>>  hw/arm/smmuv3.c          |  2 +-
>>  2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index bab25d640e..19540f8f41 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -442,17 +442,17 @@ typedef struct SMMUEventInfo {
>>
>>  #define EVT_Q_OVERFLOW        (1 << 31)
>>
>> -#define EVT_SET_TYPE(x, v)              deposit32((x)->word[0], 0 , 8 , v)
>> -#define EVT_SET_SSV(x, v)               deposit32((x)->word[0], 11, 1 , v)
>> -#define EVT_SET_SSID(x, v)              deposit32((x)->word[0], 12, 20, v)
>> -#define EVT_SET_SID(x, v)               ((x)->word[1] = v)
>> -#define EVT_SET_STAG(x, v)              deposit32((x)->word[2], 0 , 16, v)
>> -#define EVT_SET_STALL(x, v)             deposit32((x)->word[2], 31, 1 , v)
>> -#define EVT_SET_PNU(x, v)               deposit32((x)->word[3], 1 , 1 , v)
>> -#define EVT_SET_IND(x, v)               deposit32((x)->word[3], 2 , 1 , v)
>> -#define EVT_SET_RNW(x, v)               deposit32((x)->word[3], 3 , 1 , v)
>> -#define EVT_SET_S2(x, v)                deposit32((x)->word[3], 7 , 1 , v)
>> -#define EVT_SET_CLASS(x, v)             deposit32((x)->word[3], 8 , 2 , v)
>> +#define EVT_SET_TYPE(x, v)  ((x)->word[0] = deposit32((x)->word[0], 0 , 8 , v))
>> +#define EVT_SET_SSV(x, v)   ((x)->word[0] = deposit32((x)->word[0], 11, 1 , v))
>> +#define EVT_SET_SSID(x, v)  ((x)->word[0] = deposit32((x)->word[0], 12, 20, v))
>> +#define EVT_SET_SID(x, v)   ((x)->word[1] = v)
>> +#define EVT_SET_STAG(x, v)  ((x)->word[2] = deposit32((x)->word[2], 0 , 16, v))
>> +#define EVT_SET_STALL(x, v) ((x)->word[2] = deposit32((x)->word[2], 31, 1 , v))
>> +#define EVT_SET_PNU(x, v)   ((x)->word[3] = deposit32((x)->word[3], 1 , 1 , v))
>> +#define EVT_SET_IND(x, v)   ((x)->word[3] = deposit32((x)->word[3], 2 , 1 , v))
>> +#define EVT_SET_RNW(x, v)   ((x)->word[3] = deposit32((x)->word[3], 3 , 1 , v))
>> +#define EVT_SET_S2(x, v)    ((x)->word[3] = deposit32((x)->word[3], 7 , 1 , v))
>> +#define EVT_SET_CLASS(x, v) ((x)->word[3] = deposit32((x)->word[3], 8 , 2 , v))
> 
> 
> Oops. I'm a bit embarrassed I didn't notice that in code review...
Well I am even more embarrassed than you ;-) Usually there are no
faults. When I got some, mostly due to emulation code bugs, I mostly
focused on QEMU guest_errors logs. I noticed the code was broken when
attempting to report faults from host smmu driver. Sorry for the
inconvenience.

Thanks

Eric
> 
> thanks
> -- PMM
> 
