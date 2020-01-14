Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5224990lff;
        Tue, 14 Jan 2020 00:38:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEJ2cob5Q6oCgFeEaNk+Kiwm695WKvqFcgVZgwKgXoAEEfe5jMdUqQEoSeqJEsTxSXNwwN
X-Received: by 2002:ad4:48c6:: with SMTP id v6mr15346061qvx.207.1578991106777;
        Tue, 14 Jan 2020 00:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578991106; cv=none;
        d=google.com; s=arc-20160816;
        b=SzOo6BoaX3Yi9tw7Ss/oGzjjBhC1zjOY3u/2X2jb51PavSdhu1ucWSCgwLGPbYYVQc
         3DzDam6JbGie+Mtk8TRWd89YSCbx7uuLl/iU1y1frVdeutxv0aRc/HZl6ByHIpKUugRw
         rEjER26lLPH6A0CUZdFcQflmZRUOoDHb3gA+MrjC6UP4OhA8qhZpZuLST3oOdl3Zvcnj
         DGEP1dJni4KL1JDqUF0hW7mmxz8n5nVhj5slbRw/c7zJT6TvtoLJqvpQiVYpY1VmGtWp
         6m2hAr0casLq2dTWSfp5ElCqQwNS3y5Jm/qbxsQ1dgufysywjkCZcjDuwSHX0r39/9v4
         4iNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vAfuzXcORhJGj7N7nwgX3YkYyibtDeg5vqOVloQ0W1I=;
        b=fTkiQj29p3GZPdXheGbgv7ykmnUSA2a39Ao7MGd9uol8C9fLZTXmassvH9HeNneiXS
         BOTh3ekQ0WdfkesqwKRFX09T/eOV0Mws6G8ijuK3ZA9VCNaCEEIEyoL8DPgH5+8wMkBf
         ysi5cnm+CA9m3dtPAofIElBZrJAQZXUwl9EtTteH/yRNHOJYwDSE3EnIz7kAB8jPKNwF
         FdAC/no1SoaduXHQ/oORoN05SEznHuvDefk/qLL13gjtdB84rY+ddcCivQajwGL1kLec
         knshM0lCF/yjzwFWvO6Ccg6TnHCHv/QyZKt3rmMej1tTd7qa1CIkuJQiQuXN3dddQtHr
         dXVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GFrMAqPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h55si8542917qtb.87.2020.01.14.00.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GFrMAqPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irHiT-0003YM-TX
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 03:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1irHiF-0003Ve-VW
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:38:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1irHiE-0001u2-Pa
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:38:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57085
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1irHiE-0001tr-Lb
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 03:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578991089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAfuzXcORhJGj7N7nwgX3YkYyibtDeg5vqOVloQ0W1I=;
 b=GFrMAqPAW6jwE2v+o8VtKXAuUVxuPHVj7oEf9R+v3LtdHsJQ3/WftYLuGof0hMj2rL0ghR
 xl88uNB/qQx6iSH0nrf+6M3N5NIdk8xRDkl0+KGQeU9t3sMQcWBSTv3g1hMNisegxm3DrU
 yZ96Npd/5AfnEzHOeOdAKT0urjXaXjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-QtSltDaUPJa2129SIiahiw-1; Tue, 14 Jan 2020 03:38:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB95107ACC5;
 Tue, 14 Jan 2020 08:38:01 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 757FA5DA32;
 Tue, 14 Jan 2020 08:37:53 +0000 (UTC)
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
To: Peter Xu <peterx@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
 <20200113195344.GA201624@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <779fc8b2-93c1-e3c2-9feb-b2552de2c5d3@redhat.com>
Date: Tue, 14 Jan 2020 09:37:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200113195344.GA201624@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: QtSltDaUPJa2129SIiahiw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LFfvHq068bDe

Hi Peter,

On 1/13/20 8:53 PM, Peter Xu wrote:
> On Thu, Jan 09, 2020 at 03:43:10PM +0100, Eric Auger wrote:
>> Implement a callback called on PCI bus enumeration that
>> initializes for a given device on the bus hierarchy
>> an IOMMU memory region. The PCI bus hierarchy is stored
>> locally in IOMMUPciBus and IOMMUDevice objects.
>>
>> At the time of the enumeration, the bus number may not be
>> computed yet.
>>
>> So operations that will need to retrieve the IOMMUdevice
>> and its IOMMU memory region from the bus number and devfn,
>> once the bus number is garanteed to be frozen,
>> use an array of IOMMUPciBus, lazily populated.
>>
>> virtio_iommu_mr() is the top helper that allows to retrieve
>> the IOMMU memory region from the requester ID.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v11 -> v12:
>> - add the iommu_find_iommu_pcibus() mechanics. Without it,
>>   when attaching t device to a domain we could not check
>>   the device is effectively protected by this IOMMU
> 
> Sorry I probably lost the context again after read the previous
> version...  Could you hint me what does this used for?
In v11 Jean pointed out that as_by_bus_num was not used in my series. I
first planned to remove it and then noticed that it could be useful to
test on "attach" whether the RID of the device effectively corresponds
to a device protected by the IOMMU and in the negative, return an error.

In https://patchwork.kernel.org/patch/11258269/#23067995

This is the same mechanics used in intel_iommu/smmu.


> 
> In all cases, I see that virtio_iommu_mr() is introduced but not used.
> Would be good to put it into the patch where it's firstly used.
OK fair enough, I will put the helper in the same patch as the user as
you have requested that since the beginning ;-) The resulting patch may
be huge. Just hope nobody will request me to split it back ;-)

Thanks

Eric
> 
> Thanks,
> 

