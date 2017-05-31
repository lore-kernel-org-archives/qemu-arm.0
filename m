Received: by 10.25.0.6 with SMTP id 6csp190949lfa;
        Wed, 31 May 2017 00:08:16 -0700 (PDT)
X-Received: by 10.237.36.251 with SMTP id u56mr26801189qtc.154.1496214496096;
        Wed, 31 May 2017 00:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496214496; cv=none;
        d=google.com; s=arc-20160816;
        b=GoW7GV7dsXfJy5y3qPtqXNdQjQcrLLryaOt+hTLIP9wIjTdF79J+voHBjX9E9F3935
         XzbhGLbDCvaAHIofOHS8ko0LibtwJaTywaoOFzJcWr3TEZwLw8Dg82lh9rDpYZQEjzKS
         7YOTvRvth0jDBXIrLbYbbQCXvF9QbmV6zopsnIjszvX4ouE0+2ai7Z1QgbW08TihWOn7
         q58u+KHwA3nDcmZlchjsBMkc55g6XFYOK5xoZjgBG9MgyFQK1+b8DkRiRCvxkEVkuj13
         +O5kZrO5d4OYIMnWgD8UBN08Z386jBTFJ9cP/pbe8BaMxl15p+BDjVWJVsopMtgKGPST
         diYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=CQ27S51T7HkiJ/G7wD2Md/T4lAmTKSjZkRVKlAgDUbc=;
        b=IUynz8S9T48rs8BoVtF5UpDWMv4Sb1iXjb3o1xibQNU09bzwOWqqRfzy79CcUazQly
         b0QvmEYknUp4Hq+Tkzcebki+rs2dcamhZiYCRqr83/LTi7jd5h/YM+2G6oX+dPyxyaBb
         juDyyHsIxyD1hzbwLAkt8oGqDualt3jaQbDgDeEhoagczYFXXdLzYnBM/OWTvGymjv2/
         dCIyTXQR0rLRmmuxg7oeLLVaI6Y0IiGJusyNmt3V5cYHw1HRS9zL6/o6lnBmDQr2JLTS
         HVZHkiXx4pDno9gy4WnkYKK96Wiw4mpAAMmhr9g/cJ/0WxEH+n/C67PhPJJJLdlrSQCK
         Cf3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10si15591162qth.309.2017.05.31.00.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 00:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFxjp-0007Z9-Fl
	for alex.bennee@linaro.org; Wed, 31 May 2017 03:08:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxjj-0007Ws-D2
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxje-0005Ln-I9
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:08:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dFxje-0005KT-9T; Wed, 31 May 2017 03:08:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ACD361D07;
	Wed, 31 May 2017 07:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4ACD361D07
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4ACD361D07
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F39E183CB;
	Wed, 31 May 2017 07:07:58 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<1494697399-352-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9P=k88CFwUHeAg=oxsDpY72OTUc=+iyffM9dP5=tzRKg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fb9d6e76-2681-76cc-1f99-c70d5cfbcebf@redhat.com>
Date: Wed, 31 May 2017 09:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9P=k88CFwUHeAg=oxsDpY72OTUc=+iyffM9dP5=tzRKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 31 May 2017 07:08:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 2/5] hw/arm/smmuv3: smmuv3 emulation model
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+82nPfpRvQY

Hi Peter,
On 30/05/2017 18:01, Peter Maydell wrote:
> On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> Introduces the SMMUv3 derived model. This is based on
>> System MMUv3 specification (v17).
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v3 -> v4
>> - smmu_irq_update
>> - fix hash key allocation
>> - set smmu_iommu_ops
>> - set SMMU_REG_CR0,
>> - smmuv3_translate: ret.perm not set in bypass mode
>> - use trace events
>> - renamed STM2U64 into L1STD_L2PTR and STMSPAN into L1STD_SPAN
>> - rework smmu_find_ste
>> - fix tg2granule in TT0/0b10 corresponds to 16kB
>>
>> v2 -> v3:
>> - move creation of include/hw/arm/smmuv3.h to this patch to fix compil issue
>> - compilation allowed
>> - fix sbus allocation in smmu_init_pci_iommu
>> - restructure code into headers
>> - misc cleanups
>> ---
>>  hw/arm/Makefile.objs     |    2 +-
>>  hw/arm/smmuv3-internal.h |  603 ++++++++++++++++++++++++
>>  hw/arm/smmuv3.c          | 1134 ++++++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/trace-events      |   32 ++
>>  include/hw/arm/smmuv3.h  |   87 ++++
>>  5 files changed, 1857 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/smmuv3-internal.h
>>  create mode 100644 hw/arm/smmuv3.c
>>  create mode 100644 include/hw/arm/smmuv3.h
> 
> This is a bit of a big patch for review for my taste -- are
> there some easy splits into multiple patches possible?

Yes I fully understand. I will try to split it to ease the review. Maybe
I first need to reach a decent level of functionality first and then
split it.
> 
>> +typedef struct SMMUQueue {
>> +     hwaddr base;
>> +     uint32_t prod;
>> +     uint32_t cons;
>> +     union {
>> +          struct {
>> +               uint8_t prod:1;
>> +               uint8_t cons:1;
>> +          };
>> +          uint8_t unused;
>> +     } wrap;
> 
> Use of bitfields here seems a bit odd but I haven't
> looked at the code really.

OK. I will further look at this part.

Thanks

Eric
> 
> thanks
> -- PMM
> 
