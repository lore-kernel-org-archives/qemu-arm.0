Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp737966wrt;
        Tue, 25 Sep 2018 07:23:31 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61CCXGtFSxFilsIE3+UOVXXaI9WTgwEBPtH5jcaKvxJJEGHRrYoGKzh2FbL8ZTimuzEupfx
X-Received: by 2002:a0c:af2f:: with SMTP id i44-v6mr953253qvc.105.1537885411009;
        Tue, 25 Sep 2018 07:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537885411; cv=none;
        d=google.com; s=arc-20160816;
        b=J86O8+m7h+YNc59yQ9R/XTjr/fCruGpsmCNnl93njUn8bfxSzD3NuFAMiwYiTR5nLt
         /pUloOjGp42e1XpPa2+G+WdzAhwQ12lTP8G1osNMmf3I3fxM1xQ7Kihxi2XQ2vSybNv2
         wX6Ha9aXiwfYK98v7S81dTV3ALP3a53lbdqsVqiyH04i1OYgDkMSKMGB76b1HkmvMDrN
         GG1i8r0QBYBZU5GlQ5MEe3vU0f3qhoZ2d3shQoqiiwD4QZwuZM8RGitWMm5C1YvrCa/R
         IKb8ZrYQJg+JSVCtfTitmc1CyhetEa7rAPQohyr6pjUBdCz/0RqxxdJVWotnwYzbeSSw
         785Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=B8D+5E1xgNvxz4HWxMqGYNzjoYThg0KVI2uP0sOXuOo=;
        b=iowfvZJH16LSw3aF5viBy3pm1rW41urKR+uxhExbCsKPrdFM0PcAVFvwz4gxrkJRY9
         /di1PGPTtzK4lMjdFkU4abEX0bICr55C5vx6Ibpap6Upb2a/rgTCVKqIIRI01jhTkiSi
         CkZpnZuJkyRt0zl1Kgipycmt+mrk8YXFkaB1aICHH0jDIaNnOQJjLeWoZ2i16mCP9+hJ
         sqqI/fK/iOZgE7vDUO8YhUD/BdecKphkf6G4P03HozB8vDboFhiGnA9I8fRo+mTX8AJ3
         hgR+ftYmWW+6mb+Fd1LX+smdJfDSnn0xkUOJ6MbPD9O7Aai3hsGVNg5R+7mE1xv/Z1kd
         sCMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i11-v6si1981949qvb.29.2018.09.25.07.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4oFO-0000H8-2y
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:23:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g4o94-00033S-90
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g4o8z-0007NS-5K
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:16:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23211)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g4o8y-0007K5-Ri; Tue, 25 Sep 2018 10:16:53 -0400
Received: from smtp.corp.redhat.com (int-mx12.intmail.prod.int.phx2.redhat.com
	[10.5.11.27])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59EDC3001978;
	Tue, 25 Sep 2018 14:16:45 +0000 (UTC)
Received: from [10.36.117.210] (ovpn-117-210.ams2.redhat.com [10.36.117.210])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 250E9D6EE4;
	Tue, 25 Sep 2018 14:16:43 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921070138.10114-1-eric.auger@redhat.com>
	<20180921070138.10114-2-eric.auger@redhat.com>
	<CAFEAcA9vHnCrw7mX=_TTvhBjpE-58dZCX8zPOVpCBNeHya-p6w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <839d47bb-16ac-8ad8-44c5-5ab86346ca94@redhat.com>
Date: Tue, 25 Sep 2018 16:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vHnCrw7mX=_TTvhBjpE-58dZCX8zPOVpCBNeHya-p6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 25 Sep 2018 14:16:45 +0000 (UTC)
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
X-TUID: zAQRrildiUNx

Hi Peter,

On 9/25/18 4:09 PM, Peter Maydell wrote:
> On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
>> At the point smmu_find_add_as() gets called, the bus number might
>> not be computed. Let's change the name of IOMMU memory region and
>> just use the devfn and an incrementing index.
>>
>> The name only is used for debug.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmu-common.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 55c75d65d2..3f55cfd193 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -311,6 +311,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>>      SMMUState *s = opaque;
>>      SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
>>      SMMUDevice *sdev;
>> +    static uint index;
> 
> "uint" isn't a standard type (and causes a build failure on
> at least one of my build systems). Did you mean "unsigned int" ?
Hum yes, I did. Shall I repost or do you fix it directly?

Thanks

Eric
> 
> thanks
> -- PMM
> 
