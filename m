Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2029855lff;
        Thu, 19 Dec 2019 02:31:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUS/18ZMsHVX2nEZJE1BeNLU7fQ+YJJz0XiFYyn0oP9DbldAXeOLfKWaUaLOo++WPfl/pT
X-Received: by 2002:a37:b946:: with SMTP id j67mr7071670qkf.35.1576751499465;
        Thu, 19 Dec 2019 02:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576751499; cv=none;
        d=google.com; s=arc-20160816;
        b=f4YLUicldwsHGdmwPbFpyp+zPQh6IaB+ySkfpGaajM+n7s0QkKun5POipWBMMx/6sM
         b4gy9b62wQi5hgow7OJE9SOVbifOvC7Rt7/sZzgrcNKHUM9wJtC5cwgcEGGJXUANMVmS
         F7vUDZOi6remqvnb9gdoISaHes1dP0y6iMWR1ZhfAzXKuVkmbNaFL2xSyCfQHIZMa+i1
         ksG36jRfwVykEAiXn4UAaSj4bygXY7lmZSEcwf/5oTV0DamwYra/rhYqEil8TS2OqNoP
         tvUnWW9aChCeqttGSDHvbUXkXQ4zSRqV5+SIF2J4dprVkjwJewlUgAoe6AVSJBxJQrEv
         1ioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gf2YGeZfVn/qtENW1rrykbXMg9iGRIwEYDRSt4RketE=;
        b=rmE+Q0BkEXMwf6Gl5DBQLcSJPfE3j5cO189TPuTFRU7C8/FXpJ3NLZAXqd1ro4rjfC
         +o77gvt98TrKfIn2pm1ryxK+Kl/erX/zMypPp6LruJiS7A2r6DK39nRPh68nz853t0ic
         KiVcl91mlg5TzHDab99z7DP8SbL9j5PpUbHLv66zbBNGA07UcuviPHFX7Gfp5XfhCTbL
         sfxjd+3njVgVluzMNUoJrNWvccOP3bo7rOHCMvklftQLe9A+1p/3qQV3h3Oj3kPVCTbS
         MynBHHhMj50j5/2IlTTvQHutBdmQFMzjhyq6ikBjfJAZBBlocHchO1Y+abdzRpaot5O8
         Pz1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FhpBGbTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27si3044128qtm.363.2019.12.19.02.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 02:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FhpBGbTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iht5m-0005vw-Ud
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 05:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iht5R-0005uI-Bl
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 05:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iht5Q-000061-AA
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 05:31:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43889
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iht5O-0008VJ-8e
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 05:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576751473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf2YGeZfVn/qtENW1rrykbXMg9iGRIwEYDRSt4RketE=;
 b=FhpBGbTHQ6IlFiL7j0RNekZbW/ZP7L6lTmJJfZ65g/2WlZvNZzG+vTCojjEpgTP4jmUlOr
 zUXPj/cpK1/+DbGCbH1nD0XxQjEu7PFg4nCva4XXakEHSdScZTzE+jpVQFKM12Y7uT+T/x
 UrILrauP5g2+VM/7kjVydcFKwMQefnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-KaY59EmoPbCKxOBAcFMz2w-1; Thu, 19 Dec 2019 05:31:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68FBA18557C0;
 Thu, 19 Dec 2019 10:31:08 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC4269AE2;
 Thu, 19 Dec 2019 10:31:02 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 02/20] virtio-iommu: Add skeleton
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-3-eric.auger@redhat.com>
 <20191210163155.GA277340@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c7baf4cd-2a5f-fd10-e195-95b1232b3bcf@redhat.com>
Date: Thu, 19 Dec 2019 11:31:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191210163155.GA277340@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: KaY59EmoPbCKxOBAcFMz2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnhoVIeAnsYq

Hi Jean,

On 12/10/19 5:31 PM, Jean-Philippe Brucker wrote:
> Hi Eric,
> 
> On Fri, Nov 22, 2019 at 07:29:25PM +0100, Eric Auger wrote:
>> +typedef struct VirtIOIOMMU {
>> +    VirtIODevice parent_obj;
>> +    VirtQueue *req_vq;
>> +    VirtQueue *event_vq;
>> +    struct virtio_iommu_config config;
>> +    uint64_t features;
>> +    uint64_t acked_features;
> 
> We already have guest_features in the parent object.
That's correct. I also removed the set_features() specific
implementation as I can rely on the default one.
> 
>> +    GHashTable *as_by_busptr;
>> +    IOMMUPciBus *as_by_bus_num[IOMMU_PCI_BUS_MAX];
> 
> Doesn't seem used anymore.
removed
> 
> Thanks,
> Jean
> 
>> +    PCIBus *primary_bus;
>> +    GTree *domains;
>> +    QemuMutex mutex;
>> +    GTree *endpoints;
>> +} VirtIOIOMMU;
>> +
>> +#endif
>> -- 
>> 2.20.1
>>
>>
> 
Thanks

Eric

