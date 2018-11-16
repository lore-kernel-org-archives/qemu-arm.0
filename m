Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp170506wrw;
        Fri, 16 Nov 2018 01:52:13 -0800 (PST)
X-Google-Smtp-Source: AJdET5eG01+tUU4Fu37/8WBx5Y3UZtg5blTApAEn7j8sajcN9OgwgVLbhLPi1IEys4UoV84lp0pY
X-Received: by 2002:ac8:25f6:: with SMTP id f51mr9727412qtf.129.1542361933184;
        Fri, 16 Nov 2018 01:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542361933; cv=none;
        d=google.com; s=arc-20160816;
        b=ad6WL8kKNSnVDlH6YK6X4zspteI9/T/8HaqA2YbWXu4mhjUrE5Q/cmUeDVLfDXyIQT
         h9kWNxf0B9N3MNUGD3dbj3mnQPLI2kadb/j3dYPGV15dEKA2d7l6qxDr5EJuo66J3TYo
         4QJVg6MiRlHPtBiyQfnpw/BgnkWYWpjKa8De/F9WqQkl7c0pPc/CrFhyCwRi8+fPq6Xd
         7r3X3oeQWvpDiawarF+6PlFhqM3GDGx2FMt2f1+TEaKmk/uVOT1A7TE3DOs3O56/cCh2
         MaM0wH/rNC2ktcN/RO7YVp+Y+MGWkUS3Mwdhjt5z3RhShbXoxyWs/t/utAVuxLJwZHwr
         3+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=hRyesN5NiK3rC6chwsKzYs0xBw44gzQypf63Ew9Odzo=;
        b=k3c5o6f3nsCtjwrjf/6S7xYHtZpB7IcF8hChk+kC4/KbCJ9cVOeWvXC5SN4l0qyyrq
         M83C4Xj42WPdKlGsWdQmSriYV8dglcgKtOUNnBMQplF052k+fjTkHwoMmE6grxBXfiPA
         2TTbhg5pNSLN1F26I7NogDABHY+v+eauYWfd3aLoQIggC+PjTgIolo+U+gTYB+h9d9Ve
         8D+QqEAk5hQKC3Qap0cXIwP+Q1dXa4uD5Q26ZxPdsicUxoFPPT95Uu931VKqAw+ZonnG
         oITqMCp+RQ8pQDxYjrQjcqo0eYs7G28MErT8xj/1sjNbzrxjguCKIXmKEefOljLu7PlP
         LAHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si3573443qtg.188.2018.11.16.01.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNanM-0003mq-OS
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:52:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gNanB-0003lh-GY
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gNan8-0000Q3-Bh
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:52:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gNan8-0000Pn-61; Fri, 16 Nov 2018 04:51:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D1FB3154872;
	Fri, 16 Nov 2018 09:51:56 +0000 (UTC)
Received: from [10.36.116.180] (ovpn-116-180.ams2.redhat.com [10.36.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4037960A9A;
	Fri, 16 Nov 2018 09:51:46 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"mst@redhat.com" <mst@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
	<20181109112957.10067-16-eric.auger@redhat.com>
	<2d6c96ce-9eb5-9347-1a75-4e13c0cea0ec@arm.com>
	<8653586f-404f-5b03-30ba-a0eb3676c107@redhat.com>
Message-ID: <bd60d093-1669-50d2-c718-aa66a65bd358@redhat.com>
Date: Fri, 16 Nov 2018 10:51:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <8653586f-404f-5b03-30ba-a0eb3676c107@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 16 Nov 2018 09:51:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v8 15/18] hw/arm/virt: Add
 virtio-iommu to the virt board
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aajwKaxj95OL

Hi Jean, Bharat,

On 11/14/18 5:41 PM, Auger Eric wrote:
> Hi Jean,
> 
> On 11/14/18 5:01 PM, Jean-Philippe Brucker wrote:
>> On 09/11/2018 11:29, Eric Auger wrote:
>>> +static void create_virtio_iommu(VirtMachineState *vms,
>>> +                                const char *pciehb_nodename, PCIBus *bus)
>>> +{
>>> +    const char compat[] = "virtio,pci-iommu";
>>> +    uint16_t bdf = 0x8; /* 00:01.0 */
>>> +    DeviceState *dev;
>>> +    char *node;
>>> +
>>> +    dev = qdev_create(BUS(bus), TYPE_VIRTIO_IOMMU_PCI);
>>> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
>>
>> For the Arm virt platform, should msi_bypass default to false? Otherwise
>> I don't think pass-through to guest userpace will work.
> That's correct. It's a regression compared to v7. I will fix this soon
> while doing the pc machine integration + resv regions flaws you reported
> in the meantime.

The reported issues related to probe requests are fixed in the following
branch:
https://github.com/eauger/qemu/tree/v3.1.0-rc1-virtio-iommu-v0.8.1

This branch was used to test [PATCH v4 0/7] Add virtio-iommu driver

Thanks

Eric

> 
> Thanks!
> 
> Eric
>>
>> Thanks,
>> Jean
>>
> 
