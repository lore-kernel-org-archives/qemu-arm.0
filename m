Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2583961lff;
        Thu, 19 Dec 2019 10:31:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqztsU6C7yQ+jrNeq3Z2Pkumdebz14dEdeJ4K5SLN0Qp+t57E+OU5yrBtu60ifFq6g9now/3
X-Received: by 2002:a9d:4d99:: with SMTP id u25mr9800079otk.56.1576780307731;
        Thu, 19 Dec 2019 10:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576780307; cv=none;
        d=google.com; s=arc-20160816;
        b=s2pKj20z1ntNXKCa4CrVHQXK5yl/lbg2odMDqDuJdX6BLvwyU35wiRJvF7yyXCyAy9
         zKqilqvx+aq+3QBunMcbuPsZDgkb2WAEExlpcSlXy2VV0Ry3H/6r/TTzdigqZxkMaZTi
         h/k9qDSmdKKZxq9Bfb6yXAQKYq5NHMZ8SGz+gpqSNqf+kEoYJu+gwuLAnKupVoQjKDV1
         ZOFmOZYP7VDL/VbGXLqdb5exWXbowjN3Mtr7M34wJUIE867BzZ8prYP8wPrktzkU2z16
         epGVzWqYaNvByK6YKMUSA4mpqchY/TEoscKd9oUtA7OKdzJSgdk344Ikv4+1MJbnSYgZ
         r03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L9FWGWBUkF9tQ616rpbMJG8NkogpoEn8oAXnWBtYw1A=;
        b=FihbyFP39rjaOkvZPjcrjeLZjUoorbIJnKAUKIrifzUQ0cHkqdhpFdgZe1HumszvTm
         Pizol/82G1pNclhKGBEuE61tD5JBVw5xRb3XKWMNh2mDYqJhb6QZJpzp0yeEBV5UCHtt
         LhdLqpnh6l8yvPQ6a5y02WwgADAftVjxWSCKB+xeKNm7+ZHTbN3Dx+GVTPEvxWMJFk6j
         dkBKv32U4mAUlSVIBr9KcRkTN5ORfsGxRyMohi5IyH/xXzmvdlj+lsA5V/ipp/1zxvmC
         77Tf3fWTrzELIg/xHOjZd9kS6ufvr6fyu8ZRZiYgb9pbbcGZ0jkl33TjoCAx6ReJbuMz
         ZJNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Laf8Y/eh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q189si3440392oib.179.2019.12.19.10.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 10:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Laf8Y/eh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii0aQ-0006na-Tn
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 13:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ii0aB-0006nN-7I
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 13:31:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ii0a7-0007nt-6k
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 13:31:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31967
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ii0a5-0007kc-G9
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 13:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576780284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9FWGWBUkF9tQ616rpbMJG8NkogpoEn8oAXnWBtYw1A=;
 b=Laf8Y/ehnldXarz2/eDStd39h2f//hiKD1Py7GDUCOneN5/FflwFKvDoFAtXiNTooWWiYx
 xc4Mx38K1RTMueowc7MiCCR9Y4lL9Kz+HlmFzRLkXi6lOSOvhVLgaKLbYLLu57l4h/VDeh
 xIDABnkW6qhNWHo5zWxGc8+RPZgqNcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-z_A4zvb8OBGejzTjLIywcQ-1; Thu, 19 Dec 2019 13:31:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D572800D48;
 Thu, 19 Dec 2019 18:31:21 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E833E5C1B0;
 Thu, 19 Dec 2019 18:31:10 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 05/20] virtio-iommu: Endpoint and domains
 structs and helpers
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-6-eric.auger@redhat.com>
 <20191210163716.GD277340@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <28597404-b9ac-8c16-e9e8-ad5793f2f5a3@redhat.com>
Date: Thu, 19 Dec 2019 19:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191210163716.GD277340@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: z_A4zvb8OBGejzTjLIywcQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jdl+d5bhinPc

Hi Jean,

On 12/10/19 5:37 PM, Jean-Philippe Brucker wrote:
> On Fri, Nov 22, 2019 at 07:29:28PM +0100, Eric Auger wrote:
>> +typedef struct viommu_domain {
>> +    uint32_t id;
>> +    GTree *mappings;
>> +    QLIST_HEAD(, viommu_endpoint) endpoint_list;
>> +} viommu_domain;
>> +
>> +typedef struct viommu_endpoint {
>> +    uint32_t id;
>> +    viommu_domain *domain;
>> +    QLIST_ENTRY(viommu_endpoint) next;
>> +} viommu_endpoint;
> 
> There might be a way to merge viommu_endpoint and the IOMMUDevice
> structure introduced in patch 4, since they both represent one endpoint.
> Maybe virtio_iommu_find_add_pci_as() could add the IOMMUDevice to
> s->endpoints, and IOMMUDevice could store the endpoint ID rather than bus
> and devfn.

On PCI bus enumeration we locally store the PCI bus hierarchy under the
form of GHashTable of IOMMUDevice indexed by iommu_pci_bus pointer.
Those are all the devices attached to the downstream buses. We also use
an array of iommu pci bus pointers indexed by bus number that is lazily
populated due to the fact, at enumeration time we do know the bus number
yet. As you pointed, I haven't used the array of iommu pci bus pointers
indexed by bus number in this series and I should actually. Currently I
am not checking on attach that the sid effectively corresponds to a sid
protected by this iommu. I will add this in my next version. The above
structures are used in intel_iommu and smmu code as well and I think
eventually this may be factorized a common base class..

on the other hand the gtree of viommu_endpoint - soon renamed in
CamelCase form ;-) - corresponds to the EPs that are actually attached
to any domain. It is indexed by sid and not by bus pointer. This is more
adapted to the virtio-iommu case.

So, despite your suggestion, I am tempted to keep the different
structures as the first ones are common to all iommu emulation code and
the last is adapted to the virtio-iommu operations.

Thoughts?

Eric

> 
>> +typedef struct viommu_interval {
>> +    uint64_t low;
>> +    uint64_t high;
>> +} viommu_interval;
> 
> I guess these should be named in CamelCase? Although if we're allowed to
> choose my vote goes to underscores :)
> 
> Thanks,
> Jean
> 

