Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3975675lfp;
        Mon, 3 Feb 2020 05:52:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHLmWjGU7WhaxjONA/LWzTU+gRorGpB/Z7niMTuH7u4W5ojKdp4pdORm7fPywXTuimH9xS
X-Received: by 2002:ad4:48c6:: with SMTP id v6mr22316041qvx.207.1580737924500;
        Mon, 03 Feb 2020 05:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580737924; cv=none;
        d=google.com; s=arc-20160816;
        b=ExpIKXENUyMkfqO3QWLMNtxz9NSt2vS4rHjTHXgdZbpQHEuolCIGxnAtaEEeucKzzt
         yk8bjTb1KRCNa1GGjaaewU8WZMwMMsVKLjnM8meqKdoDz6JNsuVDcPI/OITChIwTB3uN
         9cKb823AmW8ppgDkGIFi2H1EgNajr5HPuD7+VDBXCsjpKfAUfGXpNcsFCM4vSVkGME85
         Zdnj3oa3cX1AlM3kqLKp3vrfaWl08sPEF/GuW9x5RVRQEfQ2qDJXjMtZ08gR20w5H5vF
         jAvHLMFJSNo1Uc1dhd6A+PvRfnx5lYkuaHGgOgMLns/CF4RZw8+9ysTEXwCzG6CeDxtE
         65kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vq7+63ABVh+qjcCP40+qDZJgt7q7QmAiFOM/ndp/Ma8=;
        b=zfC6nRkOiy2chD2hAsHyrhLscjtkjGLgWt9DVZz8e5XWSK3zErzphah1LMnUarcJ5c
         ewZQxdGNhp1kJ1uxKhDH4cv1Q4kdgo065OOixoY3dn1A3rm4zi8e9vu/fMd780yr0z3F
         VGTrNNO8SyadIesucb63CLyk60GXKTYt1dt7TupSWuu7McYRfxLzBmZvujgiq74JhHAy
         gOhiI39Tv/OIERTn2z8ttKv7/EE1w1a0aeko1Rh5kf+0WUDsBkfHJRl3dkGJfzhDDDY+
         cki7SnkGLNX5inx9+Dix6tO9q2Unk9vpJyKd3PinOMObGZ4PdfIML4+5ESvXFcNjP86W
         d/Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KAfz4ZV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si11785911qvx.2.2020.02.03.05.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KAfz4ZV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyc8y-0004O6-09
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iyc8p-0004Mi-Q8
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:51:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iyc8o-0004Zf-Na
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:51:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40081
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iyc8o-0004Z2-KS
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580737914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vq7+63ABVh+qjcCP40+qDZJgt7q7QmAiFOM/ndp/Ma8=;
 b=KAfz4ZV4J/04Hn6Z/xYwR3dU524CQJ5SFiD8d2sqSELVNvJ71Yywbs4EtkoJ6iWpTIgRgH
 qKcatetEnhknB8V79RwSvAKZVIXFgyIFTkFkAzNaePyyT4FPfTX6PBv64qB/dw1z562cEF
 pvF24zIpCSTvmqAVOMm4d17cJElkf9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-1RA_fjTqOvamAnaCFdUvJA-1; Mon, 03 Feb 2020 08:51:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23E0C1005502;
 Mon,  3 Feb 2020 13:51:51 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA83C8E9E5;
 Mon,  3 Feb 2020 13:51:40 +0000 (UTC)
Subject: Re: [PATCH v13 00/10] VIRTIO-IOMMU device
To: Peter Xu <peterx@redhat.com>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <158548eb-8337-aea0-25da-bb7729bf925e@redhat.com>
 <20200203134954.GB155875@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <08c5cf5a-18b6-d001-c470-709ec2190730@redhat.com>
Date: Mon, 3 Feb 2020 14:51:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200203134954.GB155875@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 1RA_fjTqOvamAnaCFdUvJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EcwcyXTpCYb8

Hi Peter,

On 2/3/20 2:49 PM, Peter Xu wrote:
> On Mon, Feb 03, 2020 at 01:58:04PM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 1/25/20 6:19 PM, Eric Auger wrote:
>>> This series implements the QEMU virtio-iommu device.
>>>
>>> This matches the v0.12 spec (voted) and the corresponding
>>> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
>>> are resolved for DT integration. The virtio-iommu can be
>>> instantiated in ARM virt using "-device virtio-iommu-pci".
>>>
>>> Non DT mode is not yet supported as it has non resolved kernel
>>> dependencies [1].
>>>
>>> This feature targets 5.0.
>> If possible I would like to make this feature upstream in 5.0. Do you
>> guys have other comments/objections?
> 
> Hi, Eric, Sorry that I forgot to read the series after a long PTO.
> 
> I'll do it today.
No worries ;-)

Thank you in advance

Eric
> 

