Received: by 10.223.172.38 with SMTP id v35csp1574705wrc;
        Tue, 5 Sep 2017 08:49:09 -0700 (PDT)
X-Received: by 10.55.18.207 with SMTP id 76mr6329874qks.245.1504626549777;
        Tue, 05 Sep 2017 08:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504626549; cv=none;
        d=google.com; s=arc-20160816;
        b=XgS+Is5CSMZATo+NcqkyuUOt6e1Xzv6Y0MC39WpeI+2dNFSTDtnFsB/DoFQ2mHyWqX
         TGBuDTC40uTBWqQYWRoIS47Dt0o1BJPxX1B6W3wG8BiOq8f6daulkHHhhTE7Gp6Liyzm
         36gVwf7uK0ZbLZikZPHBZ9bq2lAC4LWzOsheAg+fdsv0ZritDzsRE+AQcxaiXa60dAth
         jLD/2VnDJnWcwmpRptvMgtXVLIeRvtyEZI4bYJ/NafLThZqwCoFt/nI3mEoCOGcOU7QL
         YoD6dgBuAfwPK4LQmw+wqNwWzVoWxv6mkDht3c+TgpGMin1sLs8bFDZlyjUx8w5+CjAP
         ecDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ngD7UpjZ7RgCi4hSgtVlfTwVFZ1302o8jLgCnKCKmS0=;
        b=JbG+hIyzycP2ByxoE8XlO3g1DZRbodct22aTW3LJUpDdLNq4BRz4ZCwZL8BLZsIObe
         wJd9PPmVUWsgtW1LqBB5E1NGSGhYa4LHsWH1DOGHGX6ijRHV1sKWqAXiRTMo0+9LwSaq
         PFKX+vQgLPgfHYPF+R0pDJOn/Kc0/8MjucZc10OipKTAtlNYcbD8+H6rFB2bHGPiyqqL
         FM+X1GQf1AF8q6fH2qFmZUKw8BtsFmDTFg03hTrK9GZmmZcCa3nkgGgSyMxZvz+MVzTn
         qsv755cRV5Qd/DKC2uxIvmSRocJe7Zp8dpvGvDGrPkUTB4xHHshNDXZs5NGSm6Eav8SE
         mNng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G5oa3Jaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m101si716792qkh.312.2017.09.05.08.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 08:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G5oa3Jaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpG67-0006w6-Dj
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 11:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpG5y-0006tq-01
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:49:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpG5t-0007qA-CJ
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:48:58 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:37926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpG5t-0007oU-6J
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:48:53 -0400
Received: by mail-wr0-x22a.google.com with SMTP id 108so9565877wra.5
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ngD7UpjZ7RgCi4hSgtVlfTwVFZ1302o8jLgCnKCKmS0=;
	b=G5oa3JaaDoNnhjerJnfKjnv5fwIEgSSlRdycyaJK59+Gq/IyEYSoHPRxB/nWAVwlLt
	cBH9mmAzVk8eJGdmDSa4W8iYWnrvhTyuAaqB6SeuBn+IHCVHNMPTuaTvGsQJQyUOnXdh
	iIWZTNGfFzxjh4LCV8okRSt7WnwH4bt7IOQL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ngD7UpjZ7RgCi4hSgtVlfTwVFZ1302o8jLgCnKCKmS0=;
	b=eqoB5gUt3WBqmdo9UlbtrTTbQKaXCotFh+AFSYXp+lUrZ+0Dd4oflRW4YH/e2x6Jiz
	SR6Ve0Kc55iBXPhDONQRT5JkAW9zIiw0rABGoZaxdxOJYZ7lgZDuj9+P5GYxwag1UjOk
	beY0GSgR90FyfC9OJ00wlWB9gmctfmqBkoimvCUcGJqDFQeth0DRFYy843UYjOxTJYgG
	9oaYJK7xZhmfybM5s2VxRicaF6pV1l6XjMkXXAB9cU0ulbSkHhE2VymSVRL/C40519ju
	aTSBrbxSCOtIZhWlTR15MqEECPdFUnDR5BKte3DLPijy5dp8AzSYTOnvPR/kFP46mj7x
	aYPQ==
X-Gm-Message-State: AHPjjUjuIIDtw6G1riHsjd2J6ROHMAQ9sd5Mklq19CnOSYoZTFrAWgWI
	edrJ0zcREjApyFJi2JUQbZJbqsujwevC
X-Google-Smtp-Source: ADKCNb51Tzozv/JYl7frpVKczE38ZB+q1S64R7mQBG1BD4EFCzbuNGAUoJsiQ/eotJCTvM90dXpzHRSkd9r8xgE62wY=
X-Received: by 10.223.145.41 with SMTP id j38mr2556697wrj.314.1504626532095;
	Tue, 05 Sep 2017 08:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 08:48:31 -0700 (PDT)
In-Reply-To: <95775774-64e8-0008-5e8e-2fb05e1aba40@redhat.com>
References: <1503416789-32080-1-git-send-email-thuth@redhat.com>
	<20170823172118.GQ19998@localhost.localdomain>
	<CAFEAcA-DoQtTwCBFq-_JKPRMxcGq8-2QNnEJBu9STxtPWkB0bw@mail.gmail.com>
	<20170823180037.GU19998@localhost.localdomain>
	<95775774-64e8-0008-5e8e-2fb05e1aba40@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 16:48:31 +0100
Message-ID: <CAFEAcA870jZr_Vk3+szcZXt77wfM0_bZ3voDNE9r2bAaojcFFQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	qemu-stable <qemu-stable@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RqSgktgHHTVW

On 5 September 2017 at 14:57, Thomas Huth <thuth@redhat.com> wrote:
> On 23.08.2017 20:00, Eduardo Habkost wrote:
>> On Wed, Aug 23, 2017 at 06:51:28PM +0100, Peter Maydell wrote:
>>> On 23 August 2017 at 18:21, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>> On Tue, Aug 22, 2017 at 05:46:29PM +0200, Thomas Huth wrote:
>>>>> QEMU currently exits unexpectedly when the user accidentially
>>>>> tries to do something like this:
>>>>>
>>>>> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
>>>>> QEMU 2.9.93 monitor - type 'help' for more information
>>>>> (qemu) device_add allwinner-a10
>>>>> Unsupported NIC model: smc91c111
>>>>>
>>>>> Exiting just due to a "device_add" should not happen. Looking closer
>>>>> at the the realize and instance_init function of this device also
>>>>> reveals that it is using serial_hds and nd_table directly there, so
>>>>> this device is clearly not creatable by the user and should be marked
>>>>> accordingly.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>  hw/arm/allwinner-a10.c    | 2 ++
>>>>>  scripts/device-crash-test | 1 -
>>>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>>>>> index f62a9a3..43a3f01 100644
>>>>> --- a/hw/arm/allwinner-a10.c
>>>>> +++ b/hw/arm/allwinner-a10.c
>>>>> @@ -118,6 +118,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
>>>>>      DeviceClass *dc = DEVICE_CLASS(oc);
>>>>>
>>>>>      dc->realize = aw_a10_realize;
>>>>> +    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
>>>>> +    dc->user_creatable = false;
>>>>
>>>> I assume this patch will be replaced by one changing TYPE_DEVICE
>>>> to default to user_creatable=false, based on the replies to the
>>>> hw/misc/auxbus.c patch?
>>>
>>> user-creatable and hotplug are different things -- most
>>> devices are user-creatable, many fewer are hotpluggable.
>>> So the tradeoff for the default doesn't *necessarily* go
>>> the same way.
>>
>> You're right, I mixed things up when reading this patch.
>>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> Peter, looking at your last PULL request, it looks like this felt
> through the cracks. Could you please pick it up for the next one?

Oops, yes it did. Applied to target-arm.next, thanks.

-- PMM
