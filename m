Received: by 10.223.172.38 with SMTP id v35csp1454207wrc;
        Tue, 5 Sep 2017 06:58:21 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5C7yJOpLQAKINpHHuyezvlmLnAUUpEnMaI/yEmAPKQ2027J+UydAyzZADh3bCcNeP89jzV
X-Received: by 10.237.33.211 with SMTP id m19mr5173453qtc.272.1504619901073;
        Tue, 05 Sep 2017 06:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504619901; cv=none;
        d=google.com; s=arc-20160816;
        b=QscVhiT02VEEIpsQHgOcKapbgnwzbw71bOG/ci+hiErSeyUTpSwvxM0cSkxNv+wm8V
         vUokkhIXdtxsMbbsjrCwzKqqCVazsLUKc4UIWL+OjEiQ7FQy1d6mC+OyFfwXSQ1urn83
         S6NA2SXfrk9smrJWmsAYXkC5gAbq9Hh0+y3KQMQhgHsuuvmkwI1nfQ8wD/vB7TPsdomu
         70H8Lb63j8N7FskqfsRBS8HOwy1uwQ5QwfdaKAQjZ1cch3RL5pz1tI4JGGdB2nkQPW4S
         nEYxvZWYXDFSdGOyk/h2olTzIo7+VIeP/3amQoQ7yajL3VCsZ5pJyXfoi+qEvfbUCAqv
         NroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=148Y1OFKl04be5wraftOCp7Hr3Z9dnERSvIk6KD1w00=;
        b=gI4+K5Oh42XoDkBMsmrh6OFIhKtPHtgsPsZ3JRvVUJH8ju2S8PynijC//x9MxHfIjI
         MxT2CT7+cbS4c51WETrI+9f+1ou4bn3f2N3LNAVIZl13OidJSVBEepUEiDdobu2Es5UJ
         UmONJLWJElDxE/del4pkZkttiJpU5ogiH4QK9lyf6DCxpWDTCwT4UgLvfdFzZXlbDHC3
         yQuleGF5zlGx9pQ9OCbVQCn/9ZUxvUXdQVhMpcEkvESfMj2nrhozvtWNZrAuMbzJVdWM
         UG2L3DekrZd/lmsynwBRIY57HaWsQVV1B1ogjz4aB/ZXbqVmp3Z40Rzxp4ud6taw6FXg
         3jzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q85si508044qkh.186.2017.09.05.06.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpEMs-000601-OG
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:58:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dpEMk-0005zG-Ud
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:58:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dpEMd-0000Sj-7v
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:58:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dpEMc-0000Rw-Vz; Tue, 05 Sep 2017 09:58:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7A4A44BF6;
	Tue,  5 Sep 2017 13:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A7A4A44BF6
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.114] (ovpn-116-114.ams2.redhat.com [10.36.116.114])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3566B68C;
	Tue,  5 Sep 2017 13:57:59 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503416789-32080-1-git-send-email-thuth@redhat.com>
	<20170823172118.GQ19998@localhost.localdomain>
	<CAFEAcA-DoQtTwCBFq-_JKPRMxcGq8-2QNnEJBu9STxtPWkB0bw@mail.gmail.com>
	<20170823180037.GU19998@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <95775774-64e8-0008-5e8e-2fb05e1aba40@redhat.com>
Date: Tue, 5 Sep 2017 15:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170823180037.GU19998@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Sep 2017 13:58:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/allwinner-a10: Mark the
 allwinner-a10 device with user_creatable = false
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-stable@nongnu.org,
	qemu-arm <qemu-arm@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CLP4NRd+60CP

On 23.08.2017 20:00, Eduardo Habkost wrote:
> On Wed, Aug 23, 2017 at 06:51:28PM +0100, Peter Maydell wrote:
>> On 23 August 2017 at 18:21, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>> On Tue, Aug 22, 2017 at 05:46:29PM +0200, Thomas Huth wrote:
>>>> QEMU currently exits unexpectedly when the user accidentially
>>>> tries to do something like this:
>>>>
>>>> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
>>>> QEMU 2.9.93 monitor - type 'help' for more information
>>>> (qemu) device_add allwinner-a10
>>>> Unsupported NIC model: smc91c111
>>>>
>>>> Exiting just due to a "device_add" should not happen. Looking closer
>>>> at the the realize and instance_init function of this device also
>>>> reveals that it is using serial_hds and nd_table directly there, so
>>>> this device is clearly not creatable by the user and should be marked
>>>> accordingly.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  hw/arm/allwinner-a10.c    | 2 ++
>>>>  scripts/device-crash-test | 1 -
>>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>>>> index f62a9a3..43a3f01 100644
>>>> --- a/hw/arm/allwinner-a10.c
>>>> +++ b/hw/arm/allwinner-a10.c
>>>> @@ -118,6 +118,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
>>>>      DeviceClass *dc = DEVICE_CLASS(oc);
>>>>
>>>>      dc->realize = aw_a10_realize;
>>>> +    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
>>>> +    dc->user_creatable = false;
>>>
>>> I assume this patch will be replaced by one changing TYPE_DEVICE
>>> to default to user_creatable=false, based on the replies to the
>>> hw/misc/auxbus.c patch?
>>
>> user-creatable and hotplug are different things -- most
>> devices are user-creatable, many fewer are hotpluggable.
>> So the tradeoff for the default doesn't *necessarily* go
>> the same way.
> 
> You're right, I mixed things up when reading this patch.
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Peter, looking at your last PULL request, it looks like this felt
through the cracks. Could you please pick it up for the next one?

 Thanks,
  Thomas

