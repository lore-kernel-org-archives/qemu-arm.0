Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6897758lff;
        Mon, 23 Dec 2019 01:43:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxvnUwDnOtW56y/0LmT0Y28UI1MzZ66/SdHovARfHJiTFF24L/xUkHqbnF2CNmNKTU2R/y
X-Received: by 2002:a05:6830:1bda:: with SMTP id v26mr30708806ota.314.1577094189118;
        Mon, 23 Dec 2019 01:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577094189; cv=none;
        d=google.com; s=arc-20160816;
        b=sEBJUVPROWGQQ/h9cuhLu+VzWu2yqQ45DA0UoT5Pu66VGk0tN8AW7eWCf+cK6e3GjL
         bZGd6WusUeHl33Z2T+/JZwKTX7WZ37Nahcv/w7cO87Yf4Q/G6PMDyKkJLUlWk/gw1Ean
         ZgPErUaSZ4nuQTZwQNgvI3LYCKw5awk7JD+jkfyshteupKNZsz2fS31kJoKShve3XfUr
         AqlSJfU4aGnC7Do2WT5LoLUuLH+d6N9fs98dKWhqFsKotuhdCc+kRmBwvijhRrmeaFL4
         dbDjZ8H7f4UDPxPILlQIE62HcpLzoqy+Sd0TJdkqfW/BQKzNvDtFX9/oPKcpCuj2rVXK
         Ap2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=p5WFdi2YPr6EXHNmft+uuLWxzpFSEFohSYCFOmJOj0M=;
        b=C5S3G3Y5Muieg00SImhYEKuDz5CMaCiORGSGBIolH8eC9SopvAix++qxJTvPjBxNIH
         17sycO/n1Y3mVExEuXf67vJPoSi6NIoYi9lJcr9DpkL7ESmODNRpRH0d9AEel+ag3Cn8
         7hwWQ/qW3vthuSOUoXbWEajnj8OyDerJZzekXrbrkSD+hHIEdf+POlaiuxYT70ZoAC74
         FQ+Lhg0p8+OgnAHnvEpHWM1iMqwAT5bnISVleaOtvSiVqIJZ5abpy4ghd+9+H3cH03AB
         NNxlR6lo3rTVnfz9zIr7lx/2mwIdnKuMxTwt8c+5PxM6f061rNnkTcTo0+nl7hLu4KvF
         HlAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GG7t1jzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si10179824oto.169.2019.12.23.01.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 01:43:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GG7t1jzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ijKF2-0001Fc-9b
	for alex.bennee@linaro.org; Mon, 23 Dec 2019 04:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ijKEr-0001EW-OD
 for qemu-arm@nongnu.org; Mon, 23 Dec 2019 04:42:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ijKEp-0001fL-Bc
 for qemu-arm@nongnu.org; Mon, 23 Dec 2019 04:42:56 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41213
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ijKEp-0001V9-09
 for qemu-arm@nongnu.org; Mon, 23 Dec 2019 04:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577094173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5WFdi2YPr6EXHNmft+uuLWxzpFSEFohSYCFOmJOj0M=;
 b=GG7t1jzpeBHtxecBK7SQzKw9tdNHimfnoq5n/fIT9X4T+uJnVOpx4GomNdcKfh0+Yx8rhX
 lMFh7MkPN4jT55EiQLX6LxAth1AmDO+3d/cTuXlf+yIAfc9A9ztAbY1NafvWA1ww3Qnm+i
 TeNcA4dFVEuQeFqd14IklBpfLQPXSTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-3yZPyScBOgK4c8ouKzDSjw-1; Mon, 23 Dec 2019 04:42:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6C5184B44D;
 Mon, 23 Dec 2019 09:42:51 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC49360BF1;
 Mon, 23 Dec 2019 09:42:39 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 07/20] virtio-iommu: Implement map/unmap
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-8-eric.auger@redhat.com>
 <20191210164328.GF277340@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <aae1cdeb-523e-99d2-e4ad-e2e07359c2bd@redhat.com>
Date: Mon, 23 Dec 2019 10:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191210164328.GF277340@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3yZPyScBOgK4c8ouKzDSjw-1
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
X-TUID: AieLTI1NSfX2

Hi jean,

On 12/10/19 5:43 PM, Jean-Philippe Brucker wrote:
> On Fri, Nov 22, 2019 at 07:29:30PM +0100, Eric Auger wrote:
>> @@ -238,10 +244,35 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>>      uint64_t virt_start = le64_to_cpu(req->virt_start);
>>      uint64_t virt_end = le64_to_cpu(req->virt_end);
>>      uint32_t flags = le32_to_cpu(req->flags);
>> +    viommu_domain *domain;
>> +    viommu_interval *interval;
>> +    viommu_mapping *mapping;
> 
> Additional checks would be good. Most importantly we need to return
> S_INVAL if we don't recognize a bit in flags (a MUST in the spec). 
Sure

It
> might be good to check that addresses are aligned on the page granule as
> well, and return S_RANGE if they aren't (a SHOULD in the spec), but I
> don't care as much.
with KVM accelerated guest I don't have access to the guest page size,
hence the choice of not checking it.
> 
>> +
>> +    interval = g_malloc0(sizeof(*interval));
>> +
>> +    interval->low = virt_start;
>> +    interval->high = virt_end;
>> +
>> +    domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
>> +    if (!domain) {
>> +        return VIRTIO_IOMMU_S_NOENT;
> 
> Leaks interval, I guess you could allocate it after this block.
Sure

Thanks!

Eric
> 
> Thanks,
> Jean
> 
>> +    }
>> +
>> +    mapping = g_tree_lookup(domain->mappings, (gpointer)interval);
>> +    if (mapping) {
>> +        g_free(interval);
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>>  
>>      trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, flags);
>>  
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    mapping = g_malloc0(sizeof(*mapping));
>> +    mapping->phys_addr = phys_start;
>> +    mapping->flags = flags;
>> +
>> +    g_tree_insert(domain->mappings, interval, mapping);
>> +
>> +    return VIRTIO_IOMMU_S_OK;
> 

