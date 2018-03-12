Received: by 10.28.91.67 with SMTP id p64csp857158wmb;
        Mon, 12 Mar 2018 07:54:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsrWGc5qunbRTYCUptlO5rhrKhnUGsXuwPzesfc+6YCxPMlJtvUQ/3RVribebmkkHoQoWF0
X-Received: by 10.129.210.9 with SMTP id x9mr4943194ywi.54.1520866484233;
        Mon, 12 Mar 2018 07:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520866484; cv=none;
        d=google.com; s=arc-20160816;
        b=eBlgdQvNKt+VBIBmxVdOci6IKEKlBRsVTCkY5yRibICCEQEIL7y4G43dK0ebDHGwVR
         baqdRRMmXxSef8LPwAYaUjevKn3JAWchsXeIXZ+rzqchzTsFpYAadN2weTYkXMr9nyTg
         IXMaPZDOpyF9NA8pViWGUvVINArXLK49r03Scern1qBGKRo+EOJ41BYCP0dJ35NfhbzS
         63m+o7w9p4WxAGieykvnf6uGUv4XGxs5km/Vqh3csvbDbJQARc1qR5obuG5ZvpvM8oyI
         v2sRW1pJcMx03NReToK2Smgvq0kyJJAmNj06WHtBUOtwEWKAkdwpWFGrvp/kvqm1dbEZ
         JssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lqDMpug3iQDwbECmjYTb5AxM1c/R0ngUyuvlLvTraYY=;
        b=QnrUco6fGNLY++8ji79sxNT5prlmiSmf64dgc6dfoRcZmojCxQLl7pfV4FRRuQrVKx
         O57Jdfrs3MN0NKNcsmFFhD4/HiBhbR0T5nf+NnPbtmapMaNtnpdn3gaSBwH5BcJGaKhM
         ZIMpnSM3Lm8C2VxqWJFPkUwDyA3vC+vR3/XOEHTt50SlYrd9PbXnnTg3IXIHic+AHHJQ
         wkZEAJWMVVU9FHvDWVlZy249jA31Pqaz4mS/GMyUq9+ksynh4Xhfk3mv+6Rn2PivP3Si
         FZB8Uv40QxEU0Pv4hzvN5nfJ6yUYpsAlA3eSQwUx5tJ1Z1NwlRwS8DYxVhDWr8zrMJcE
         Lrdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YJ1OcylL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si1300486ywl.92.2018.03.12.07.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 07:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YJ1OcylL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evOqZ-0007dW-I0
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 10:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger.pro@gmail.com>) id 1evL5U-0008RA-O8
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger.pro@gmail.com>) id 1evL5T-0005Oi-TN
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:53:52 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:38425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <eric.auger.pro@gmail.com>)
	id 1evL5P-0005F4-GU; Mon, 12 Mar 2018 06:53:47 -0400
Received: by mail-wm0-x244.google.com with SMTP id z9so15119712wmb.3;
	Mon, 12 Mar 2018 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=lqDMpug3iQDwbECmjYTb5AxM1c/R0ngUyuvlLvTraYY=;
	b=YJ1OcylLJeekmxCeKWtRI3NR4fhSCNXdIfs5vVIlDET7+NyNvNK7elUDh98KWdrlTv
	O9FheLgDM8G2+9iRj5LqWvszLYTAKBx98GyoOhu3KA8UkWgDt3xle8R/J4/1A7r9kQbR
	YVSHnN3Xc3sXIYmvHLH9OilLfAFaIYVhr3Rl2DZWn+pWs/xlzsknIfKfKNEM4oI7YYlP
	EFOLxiNCLA2i59hNQtM6lJuzzYr/R/1S/6EMTyNr3Hrk3EmE0dIS+NXSt0F0U9qXQhQu
	4vPjwFuLzKu06wSBsgqZFoffFKsO411rGvksaz4t6lC3KpBRMM59oKpjPzPW8i4RCbGx
	csRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=lqDMpug3iQDwbECmjYTb5AxM1c/R0ngUyuvlLvTraYY=;
	b=Z4xVn2PYA7QXXA/BWayLsj4yaARiEH3zWa3jXv91XQTTXVjOVFMQLX0BYLpzy7v0y/
	w+0Jvf8vM35wm81x0bbhNFN1STT652Hu71ZIQ8d3ODi4uYf5368sZmwSTRANmus4ZS3t
	2+JTzhKHdhWZDhe6VAy55JERnr3zM2wFeUSEFM11dFjrn71A19Y+OFRNGqf1VNj5TQvZ
	w0XsDcvdvBfn07pAtzgc/CsnA33P14POaGahG34+X2hhrx3q9BMUFn9YBT5B/wBf8ocq
	S8/daSFR8C9xlrmmzQwyJIZ3Y809EyK5Z2GS7go16VYNR8S7ooMZ6M+eO5ajCybTqWK4
	5z1w==
X-Gm-Message-State: AElRT7G4aFy4pXUAJbyngCGzoeoN/1wC15cZY2zuJVS5G6LSlCc0qXoz
	bqfkTCkeYSnahYiDajZ1WFU=
X-Received: by 10.28.166.201 with SMTP id p192mr4800951wme.132.1520852026202; 
	Mon, 12 Mar 2018 03:53:46 -0700 (PDT)
Received: from localhost.localdomain (weg38-3-78-232-41-119.fbx.proxad.net.
	[78.232.41.119]) by smtp.gmail.com with ESMTPSA id
	k130sm8385224wmg.9.2018.03.12.03.53.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 03:53:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Auger Eric <eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
	<a35ca106-b405-8c07-95b6-ff65f324fae4@redhat.com>
	<CAFEAcA-08=3jyf1fpdD6AumJmbL=64iLOpoySVCfot7CXiD4Og@mail.gmail.com>
From: Eric Auger <eric.auger.pro@gmail.com>
Message-ID: <8ecafc78-5ea0-5d83-41d4-0b9b95bcdf21@gmail.com>
Date: Mon, 12 Mar 2018 11:53:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-08=3jyf1fpdD6AumJmbL=64iLOpoySVCfot7CXiD4Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
X-Mailman-Approved-At: Mon, 12 Mar 2018 10:54:30 -0400
Subject: Re: [Qemu-arm] [PATCH v9 10/14] hw/arm/smmuv3: Abort on vfio or
 vhost case
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tdp6P94eK1td

Hi Peter,

On 09/03/18 18:59, Peter Maydell wrote:
> On 9 March 2018 at 17:53, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>> On 08/03/18 20:06, Peter Maydell wrote:
>>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>> At the moment, the SMMUv3 does not support notification on
>>>> TLB invalidation. So let's abort as soon as such notifier gets
>>>> enabled.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  hw/arm/smmuv3.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>> index 384393f..5efe933 100644
>>>> --- a/hw/arm/smmuv3.c
>>>> +++ b/hw/arm/smmuv3.c
>>>> @@ -1074,12 +1074,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>>>>      dc->realize = smmu_realize;
>>>>  }
>>>>
>>>> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>>> +                                       IOMMUNotifierFlag old,
>>>> +                                       IOMMUNotifierFlag new)
>>>> +{
>>>> +    if (old == IOMMU_NOTIFIER_NONE) {
>>>> +        error_setg(&error_fatal,
>>>> +                   "SMMUV3: vhost and vfio notifiers not yet supported");
>>>> +    }
>>>> +}
>>>
>>> Is this triggerable by the guest, or by the user on the command
>>> line, or only by a bug in the board or other QEMU code?
>> by the user on the command line.
> 
> OK. Do they get this error immediately on startup, or only later
> in execution? (If the latter, is it possible to make the error
> happen earlier?)
later in execution. We also have to handle the case where such device is
hot-plugged. At best if could be done on smmu_find_add_as() by checking
the type of attached device but this wouldn't happen much earlier. By
the way we will soon support vhost and we will just rule out vfio
integration by detecting map notifiers.

Thanks

Eric
> 
> thanks
> -- PMM
> 
