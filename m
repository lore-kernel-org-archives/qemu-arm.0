Received: by 10.223.159.82 with SMTP id f18csp1757242wrg;
        Fri, 24 Nov 2017 00:17:48 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZhjnNQ27rYxdoAbdARwORJB/VbtI0M1Vn+pQVUiip14/Qu7kBviupDCtXSZYfhgXr7HEu2
X-Received: by 10.129.230.11 with SMTP id u11mr18551016ywl.511.1511511468124;
        Fri, 24 Nov 2017 00:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511511468; cv=none;
        d=google.com; s=arc-20160816;
        b=jCiMm1ChXKh8qpzN/Qzo1BtCPOGK7EsbM59c9VxHZPXYALLZkbRnJ15gd1sJqyq0l3
         UqWlPY2qqDU3MBDKVyGpNE2CDkoXS9abSS3bgSUjq4tigimCDk3WHGGyTPUk0v/ShWg2
         aMzbGXxtA0b4er2whEv6NxMqkJqgk11Fe6YM142ASjq+yuMzKuWGB/J+QeMtyHmRR92g
         nabbcOp5UysN0poRqhNjNcKPzRFH1hX//tQcikOivKN6FuQeF/oUWxWfvVmpmzr5jWnD
         SEbIu5bJnFGSQoA83oiy0nDfC1CPuv3yFI7EEmOj+LtYV+lKfPBU9Udq+s1gBq+irIQi
         onDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Ch9kp2pRA5Mun3INjys0Eno4CmHlSUenpOfRJQv9I9U=;
        b=zgEk6aIic2R8B+eKuSkLF4/57fbKiZDaF/89LYMVCjZfMgMh496A8/4o22cgty/mDV
         1xXPbw+hph17iRbYcD2r6lGFfFCrznF7QaNx4HtdI75FQ02qeVTNQ16EYd9wGeBuCiWk
         /V97lAM6AR77b+fP3F4ZV16pUVpE6jDffTyU10PPYPLGHfKhymrpHz6h56oMBhibL+LJ
         L9Zrm1OynIRuw2JqVBxtDqRrkhT4S/XxM2Z9wmqp+oVIIRbOC+X+dsNNRIPehKTfq3ou
         bJRGlvWEsyK3bRbCo50bxqurk1wMvOjJov1LCMJfChmu6K+YuKPGJRRPbPqjBBXSeBtL
         KLkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n133si4568486ywn.728.2017.11.24.00.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 00:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eI9BD-0001DF-Js
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 03:17:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eI9Ay-0001Af-A8
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 03:17:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eI9Au-0000xE-5D
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 03:17:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eI9At-0000wN-Tg; Fri, 24 Nov 2017 03:17:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDF598210A;
	Fri, 24 Nov 2017 08:17:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE42060A98;
	Fri, 24 Nov 2017 08:17:21 +0000 (UTC)
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
	<1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
	<CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
	<20171123181402.627fd5df.cohuck@redhat.com>
	<f3a550ab-5eff-1c9c-15e0-32ac70a4c2a6@redhat.com>
	<619fb88b-7ab1-a48a-a82c-53c21c691807@de.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fe8157b4-33ae-ff9d-a49b-ace775e575de@redhat.com>
Date: Fri, 24 Nov 2017 09:17:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <619fb88b-7ab1-a48a-a82c-53c21c691807@de.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 24 Nov 2017 08:17:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 0/4] vITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	wanghaibin.wang@huawei.com, wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OYoj3B0YfC7O

Hi,

On 23/11/17 19:01, Christian Borntraeger wrote:
> 
> 
> On 11/23/2017 06:44 PM, Auger Eric wrote:
>> Hi Cornelia, Peter,
>>
>> On 23/11/17 18:14, Cornelia Huck wrote:
>>> On Thu, 23 Nov 2017 17:01:32 +0000
>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>>> On 23 November 2017 at 16:05, Auger Eric <eric.auger@redhat.com> wrote:
>>>>> When using update-linux-headers.sh I get suspicious errors at the end:
>>>>> grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
>>>>> directory
>>>>> sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
>>>>> file or directory
>>>>>
>>>>> and include/standard-headers/asm-s390/virtio-ccw.h deletedch
>>>>>
>>>>> I would prefer having s390 people checking and testing that.  
>>>>
>>>> I think the kvm_virtio.h problem should be fixed by
>>>> http://patchwork.ozlabs.org/patch/838230/
>>>> which removes it from the set of headers the script imports.
>>>>
>>>> Cornelia/Christian -- any idea about the virtio-ccw.h issue ?
>>>>
>>>> thanks
>>>> -- PMM
>>>
>>> I had that commit queued for post-2.11, but I can also send it for 2.11.
>>>
>>> The virtio-ccw.h one looks weird... if I run the script on my s390-next
>>> branch against recent-ish Linux master, I just get the SPDX notice
>>> update for virtio-ccw.h.
>>>
>>
>> http://patchwork.ozlabs.org/patch/838230/ effectively fixes all issues:
>> - no errors anymore and
>> - no deletion of include/standard-headers/asm-s390/virtio-ccw.h anymore,
>> which is consistent with include/standard-headers/asm-s390/virtio-ccw.h.
>>
> 
> I assume the vITS code is post 2.11? If not, we can certainly submit 3 or 4 
> s390 patches (including 838230) for 2.11.

Yes my understanding was this was material for 2.12 as it depends on
v4.15. So I can wait for 838230 and I will re-post this series as a
PATCH then.

Peter, up to you if you are ready to consider taking the 2 first patches
for 2.11, as their dependencies are resolved and they actually would fix
everything along with v4.15 (since the vITS caches are voided on
individual GITS_BASER write). Only the end-user would have the error
report that full reset is not supported by the host kernel, as the reset
IOTCL is not used.

Thanks

Eric
> 
