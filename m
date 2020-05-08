Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2757100lfb;
        Fri, 8 May 2020 01:40:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypLDoOY5Ka5zOyZBEbHaAIrEmzks0W4QMPqE8uv1Euc6GX/4ZE5LVFq0ivGneygmxpUZEHWE
X-Received: by 2002:ac8:7096:: with SMTP id y22mr1821528qto.251.1588927236214;
        Fri, 08 May 2020 01:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588927236; cv=none;
        d=google.com; s=arc-20160816;
        b=lPWmUjNiFWqCb0lFhtiCqRrT5nBuWBsvN3VnvNnOcZYYAHgzmQinr9qoaFn1Is3a+u
         7nn5i1gl6YNRwiVIvLZez4cg/dQDV9eq8EMVtTH9NE3y3UruO2i16kRgK4J+4phf65Bk
         GXaXHGJteqBQ9JM+GRtbcOyKUa0K8X1rEvau0wApUR2VTUuDgzw9bcB2QAa3G36t9r7j
         cJSq+lOjoekTj7pDDVTpDeK3YRsST0o9TZySbipXCQK7LezZDaj/GrbLfLOP24EVKKs/
         1Ny9ntzH/XQNiYT26C5czgXHfNVNU5wIsF+EUX97zCgS/ceBsCHnFDwovkeiz5gpIyS0
         /+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=m96N1ub4rqpr7e9ldrA0YZBN9NxfM9Q9/XvkEFY0I+Y=;
        b=DsDBVapZU4euLauQNWfm3hbUrQGQIdb51FFXd/zs8aXvqEccrDOXZZGX+DwGzRZyIz
         VZNUh+ERScQ7CYwDCO/V1FtikWki0O4z7LTt0f62ezHYtVlHe4/KER3soeFcfOnMAc2K
         5OxnKsGvodo0jlxMpETZ/9STNDf93CxmDF6dyDsf0PmuRM+ZNXoWXP5lLG21IPh9W3aa
         2jlkbVRxPzosi+bOU0D7oa2+xsJrHkKcBQOCbQGIiBMnHlqgb04OIGtFUH1xORHdTNZY
         I/QlHFShgO8SfqQPvZh7sQdLDAPnR8gX6LeiaHzCyAZE18Fu8RMjZ7lyDxolRQYH0FpL
         ZNHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZaHaSyF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id r1si793739qvp.65.2020.05.08.01.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 01:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZaHaSyF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWyYd-0000zO-Lm
	for alex.bennee@linaro.org; Fri, 08 May 2020 04:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWyYU-0000xq-Tc
 for qemu-arm@nongnu.org; Fri, 08 May 2020 04:40:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45867
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWyYU-0004eY-0V
 for qemu-arm@nongnu.org; Fri, 08 May 2020 04:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588927225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m96N1ub4rqpr7e9ldrA0YZBN9NxfM9Q9/XvkEFY0I+Y=;
 b=ZaHaSyF816sH423DGof4gmnQFgedcXqMMwJ5iEaJ6TTtpD8bbp77S7MkfTqaRyzmnaTb7l
 kXcVMx8OYxtXpHOOousDIa5JbG/kPIG3lcKuKjvYiQx0pOW13UbDxoN3VdBHAiiYf5NXyE
 eFl/DhPiU07sf2PW6YMnjNXJmYHk9DE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-OCDBLXvQPTadTi9-vnFS-Q-1; Fri, 08 May 2020 04:40:23 -0400
X-MC-Unique: OCDBLXvQPTadTi9-vnFS-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC606100960F;
 Fri,  8 May 2020 08:40:21 +0000 (UTC)
Received: from [10.36.114.214] (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C347B10013BD;
 Fri,  8 May 2020 08:40:13 +0000 (UTC)
Subject: Re: [PATCH 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-6-eric.auger@redhat.com>
 <20200508082126.GA1770804@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9147445d-b87b-1326-b437-012dbd57d33d@redhat.com>
Date: Fri, 8 May 2020 10:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200508082126.GA1770804@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IgG/WI7jvlVW

Hi Jean-Philippe,

On 5/8/20 10:21 AM, Jean-Philippe Brucker wrote:
> On Thu, May 07, 2020 at 04:32:01PM +0200, Eric Auger wrote:
>> At the moment the virtio-iommu translates MSI transactions.
>> This behavior is inherited from ARM SMMU. The virt machine
>> code knows where the guest MSI doorbells are so we can easily
>> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
>> setting the guest will not map MSIs through the IOMMU and those
>> transactions will be simply bypassed. The ITS does MSI translation
>> anyway.
> 
> Makes sense. I think we have to check that the ITS is used before
> declaring the resv region, though. 

When using gicv2m, the guest will see
> this MSI region and deduce that it doesn't need to create a SW mapping for
> MSIs (might be wrong, I haven't tested it yet).

Yes you're right. I think any MSI region hides the SW MSI one. So I will
test the GIC type beforehand.

Also I will extend the series to handle the GICv2M backdoor

To me the problem is similar and the iommu subsystem will map the GICV2M
MSI doorbell as well. From a security pov, there is no difference
inbetween the 2 solutions. Anyway the doorbell is reachable by any
assigned device, would it be mapped or not. And given the GICv2M does
not perform any interrupt translation, an assigned device can trigger
MSIs on another userspace driver.

Thanks

Eric
> 
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 171e6908ec..6a041e97a5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2138,6 +2138,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>  {
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>          virt_memory_pre_plug(hotplug_dev, dev, errp);
>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
>> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>> +        qdev_prop_set_string(dev, "reserved-regions[0]",
>> +                             "0x8090000, 0x809FFFF, 1");
> 
> Maybe worth adding a comment saying this is the GITS_TRANSLATER page?
> 
> Thanks,
> Jean
> 

