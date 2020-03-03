Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp153227lfi;
        Tue, 3 Mar 2020 01:41:37 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu8H0nVk7hB/gc14WJH3j1BWlBcA7nNnMufT5fgKUkDRy8eLF+yEXkU29sXfoICgI2u4soX
X-Received: by 2002:a37:9a82:: with SMTP id c124mr3390959qke.434.1583228496861;
        Tue, 03 Mar 2020 01:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583228496; cv=none;
        d=google.com; s=arc-20160816;
        b=QajS3pfSgNkCzuYCEBmTYMQrSx9S4sUASKMrIxBBlBhJoLCym2YnjGTnqFjdEap6UX
         7iJi6rLT7V6ET18/3DNt8bnJwGJUPSN30MSUVOBTtcxHk1iflNn/NPTj4qyLxdXRbdp1
         VncYFIydtghJtPrzOjkyABrpfamGlMN30JAlCqqB/krAC5PmkiS1QeMFrb6OE5JGvxaJ
         UqnSArds9pzNsH5rCysq5/gplM8HZ3HiRt9ahm8g2BYXe73ofe2s8zWJKWUzprZD2zqo
         g8D3VA3N7WwZY4gC6a4gZvlrqJHyP9GLmdIPgIfncjq/SvIw/+BKVANOQkbATQpfm8qd
         EqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0bZsUZX3JwEsEM0cUl/sPAOimjlcxFt+l8FcLrIa9b8=;
        b=pNs1bdB6UtIWkQrvl15I4YUcMs10CRKIXuXOtoPiBjRuuV3HMX6CsuL8rzS5+/eWZP
         3dE3RTs88G3dibjd6BqHMl2+C02HbQu26UBQ1YXUkDbuLGQcDzuaPSN0aW2E6D0zsTFb
         k2z/JLyRqzho1V9yjHGFgxxsC48L5MugqQUXJ6JqZQBk/nho0oqk8frcERf54ih8Vtrf
         aitJQYEDQdn7tWg8lCz1uo/wXngxywQBUUeYk527OI5+AU3Wcj4AQh1u4WNb/ZkeCNMR
         PH9hFCYLCiGsahiHaser/+T7TzA7vjl5v5pPNrK3o68WXBLjse4HsmJM30pL9DZc+PI+
         D3Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=byEq3FOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si7639397qkd.374.2020.03.03.01.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 01:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=byEq3FOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j943U-0002RX-9y
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 04:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j943G-0002Mt-9c
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 04:41:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j943C-00020B-S2
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 04:41:21 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55241
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j943C-0001zs-K2
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 04:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583228477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bZsUZX3JwEsEM0cUl/sPAOimjlcxFt+l8FcLrIa9b8=;
 b=byEq3FOnRMlKHjiER1lBBi9KLRQ21XW1msTZmnvCVifYRSwPMARL6oxaYp2yB33/yoYWXj
 63DoFa3cZgoj/bxJ4V4Pp2VlLNXz8IvA0w3e7gZSfW5YoUK2sihXpP/KJ4YtZbhyWmDh+/
 yoaIpnwRzZrIIITr40Gt8B2B/INOYx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Ybd9wDgCP4-umTW-7IWIyw-1; Tue, 03 Mar 2020 04:41:13 -0500
X-MC-Unique: Ybd9wDgCP4-umTW-7IWIyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A6BB13E2;
 Tue,  3 Mar 2020 09:41:11 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 811668D568;
 Tue,  3 Mar 2020 09:41:01 +0000 (UTC)
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
To: Zhangfei Gao <zhangfei.gao@gmail.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200227111717.GG1645630@redhat.com>
 <431cb39d-833c-6d02-d7b3-02b3e90446e2@redhat.com>
 <CAMj5Bkib3CTzCB02ScueFR84r28LGowF7uxYO8Ygmnj9X7oNOg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fea625f1-b58e-6da6-8e2a-f32fc9391fc8@redhat.com>
Date: Tue, 3 Mar 2020 10:40:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMj5Bkib3CTzCB02ScueFR84r28LGowF7uxYO8Ygmnj9X7oNOg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, kevin.tian@intel.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kenneth-lee-2012@foxmail.com, tnowicki@marvell.com,
 "Michael S. Tsirkin" <mst@redhat.com>, quintela@redhat.com,
 zhangfei.gao@foxmail.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>, jean-philippe@linaro.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l22MPl9xJDnN

Hi Zhangfei,
On 3/3/20 4:23 AM, Zhangfei Gao wrote:
> Hi Eric
>=20
> On Thu, Feb 27, 2020 at 9:50 PM Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Daniel,
>>
>> On 2/27/20 12:17 PM, Daniel P. Berrang=C3=A9 wrote:
>>> On Fri, Feb 14, 2020 at 02:27:35PM +0100, Eric Auger wrote:
>>>> This series implements the QEMU virtio-iommu device.
>>>>
>>>> This matches the v0.12 spec (voted) and the corresponding
>>>> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
>>>> are resolved for DT integration. The virtio-iommu can be
>>>> instantiated in ARM virt using:
>>>>
>>>> "-device virtio-iommu-pci".
>>>
>>> Is there any more documentation besides this ?
>>
>> not yet in qemu.
>>>
>>> I'm wondering on the intended usage of this, and its relation
>>> or pros/cons vs other iommu devices
>>
>> Maybe if you want to catch up on the topic, looking at the very first
>> kernel RFC may be a good starting point. Motivation, pros & cons were
>> discussed in that thread (hey, April 2017!)
>> https://lists.linuxfoundation.org/pipermail/iommu/2017-April/021217.html
>>
>> on ARM we have SMMUv3 emulation. But the VFIO integration is not
>> possible because SMMU does not have any "caching mode" and my nested
>> paging kernel series is blocked. So the only solution to integrate with
>> VFIO is looming virtio-iommu.
>>
>> In general the pros that were put forward are: virtio-iommu is
>> architecture agnostic, removes the burden to accurately model complex
>> device states, driver can support virtualization specific optimizations
>> without being constrained by production driver maintenance. Cons is perf
>> and mem footprint if we do not consider any optimization.
>>
>> You can have a look at
>>
>> http://events17.linuxfoundation.org/sites/events/files/slides/viommu_arm=
.pdf
>>
> Thanks for the patches.
>=20
> Could I ask one question?
> To support vSVA and pasid in guest, which direction you recommend,
> virtio-iommu or vSMMU (your nested paging)
>=20
> Do we still have any obstacles?
you can ask the question but not sure I can answer ;-)

1) SMMUv3 2stage implementation is blocked by Will at kernel level.

Despite this situation I may/can respin as Marvell said they were
interested in this effort. If you are also interested in (I know you
tested it several times and I am grateful to you for that), please reply
to:
[PATCH v9 00/14] SMMUv3 Nested Stage Setup (IOMMU part)
(https://patchwork.kernel.org/cover/11039871/) and say you are
interested in that work so that maintainers are aware there are
potential users.

At the moment I have not supported multiple CDs because it introduced
other dependencies.

2) virtio-iommu

So only virtio-iommu dt boot on machvirt is currently supported. For non
DT, Jean respinned his kernel series
"[PATCH v2 0/3] virtio-iommu on x86 and non-devicetree platforms" as you
may know. However non DT integration still is controversial. Michael is
pushing for putting the binding info the PCI config space. Joerg
yesterday challenged this solution and said he would prefer ACPI
integration. ACPI support depends on ACPI spec update & vote anyway.

To support PASID at virtio-iommu level you also need virtio-iommu API
extensions to be proposed and written + kernel works. So that's a long
road. I will let Jean-Philippe comment on that.

I would just say that Intel is working on nested paging solution with
their emulated intel-iommu. We can help them getting that upstream and
partly benefit from this work.

> Would you mind give some breakdown.
> Jean mentioned PASID still not supported in QEMU.
Do you mean support of multiple CDs in the emulated SMMU? That's a thing
I could implement quite easily. What is more tricky is how to test it.

Thanks

Eric
>=20
> Thanks
>=20

