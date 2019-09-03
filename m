Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp379299wrp;
        Tue, 3 Sep 2019 05:24:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0W4tboqPeT2BC+AWl3AFP7gxzLVZOslqQL/ni7U3c+6vandWryOpEDuFIR9+DW8kai683
X-Received: by 2002:ac8:2d09:: with SMTP id n9mr9351456qta.10.1567513445941;
        Tue, 03 Sep 2019 05:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567513445; cv=none;
        d=google.com; s=arc-20160816;
        b=TWC4Da3X3dJ1e+xwSBpEDCzTZ783clZgPZed/9SZZ5PG6SYsaLZPLRnurujzKs91Id
         GR0+ykOZTegmpFK76pfbF4GNvtA2yWWZlDbX84i9zXBTyhiR8Do6gn0LqoG52JLcjcUy
         HuLQqXXNuPWdMCtZsLg6bbfkbhTkuaA9z2opWmsq/TRq32r/tW+HvL6YYx5qFXdh/GRm
         6iHWF8yFDE5G1CqzYVjzIWOWkd9Le8jw5lUUwkYHuTsW3Fy7Iahbre9HxFx9f8AMOtrT
         Ncnt12q5fxKZjDaZOZhKqcZs4do4oytKXXgns7R4ly3zppEnP0TTY888NaK5hn0LM7rQ
         kSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hSQu4YVtTb5TKfICtcxqJbjuokJGQk3sjmWRNefNymY=;
        b=VVbeuEaVnYOi4yg1h3jLA5uwH1TnrIRXhsbQc1OcIKTACkZgUAZ4x30hsHtgsxYTvw
         OIGPOBg1lYUqnZP6zsHMsVjjmnxMlz9fpvEbE42RKLu9sOxVeTFAyMtoFO2FUQNtYXW7
         hQDXMSsyOGa5wF+3jp3Bucoqe/CKULExmXY79h7qHKResgcY7pdNvEd5ez4104U/RrCl
         K+m39DOF6KIbKBKjbZ9OB5hsMNfbsEy9IP+jrfwp8vEYXrDNS1lqaHB537AvRA563cAY
         ChSaMemm2t+nD3RPA5RQZNljGn3jw2AF5NbmQqgrd7ATPEGv4Z5qX8Xyu86P50ngBYRd
         lcPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si6131896qto.208.2019.09.03.05.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 05:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i57qv-0000BG-D2
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 08:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i57qn-0000B8-NN
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 08:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i57ql-0007lU-5v
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 08:23:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i57qk-0007lC-W3; Tue, 03 Sep 2019 08:23:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A566FC057F88;
 Tue,  3 Sep 2019 12:23:53 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0D25D6B7;
 Tue,  3 Sep 2019 12:23:43 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-11-eric.auger@redhat.com>
 <20190819120815.GD13560@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <96d99b72-0b6b-f9f5-e62a-03e1edf62d11@redhat.com>
Date: Tue, 3 Sep 2019 14:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190819120815.GD13560@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 03 Sep 2019 12:23:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 10/15] virtio-iommu: Implement
 probe request
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMaONJAR7j15

Hi Peter,

On 8/19/19 2:08 PM, Peter Xu wrote:
> On Tue, Jul 30, 2019 at 07:21:32PM +0200, Eric Auger wrote:
> 
> [...]
> 
>> +/* Fill the properties[] buffer with properties of type @type */
>> +static int virtio_iommu_fill_property(int type,
>> +                                      viommu_property_buffer *bufstate)
>> +{
>> +    int ret = -ENOSPC;
>> +
>> +    if (bufstate->filled + sizeof(struct virtio_iommu_probe_property)
>> +            >= VIOMMU_PROBE_SIZE) {
>> +        /* no space left for the header */
>> +        bufstate->error = true;
>> +        goto out;
>> +    }
>> +
>> +    switch (type) {
>> +    case VIRTIO_IOMMU_PROBE_T_NONE:
>> +        ret = virtio_iommu_fill_none_prop(bufstate);
>> +        break;
>> +    case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
>> +    {
>> +        viommu_endpoint *ep = bufstate->endpoint;
>> +
>> +        g_tree_foreach(ep->reserved_regions,
>> +                       virtio_iommu_fill_resv_mem_prop,
>> +                       bufstate);
>> +        if (!bufstate->error) {
>> +            ret = 0;
>> +        }
>> +        break;
>> +    }
>> +    default:
>> +        ret = -ENOENT;
>> +        break;
>> +    }
>> +out:
>> +    if (ret) {
>> +        error_report("%s property of type=%d could not be filled (%d),"
>> +                     " remaining size = 0x%lx",
>> +                     __func__, type, ret, bufstate->filled);
> 
> Nit: If this can really be triggered then we might still change it to
> error_report_once()?  If it's not (which it seems to), maybe assert
> directly?
I put error_report_once() at the moment. The reserved regions may be
passed through cfg or device properties. I think it may happen that
their size get larger than the size set in the device config.


> 
> Other than that it looks good to me:
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thank you for the review!

Best Regards

Eric
> 
> Regards,
> 
