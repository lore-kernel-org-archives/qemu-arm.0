Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp177090lfb;
        Fri, 8 May 2020 07:02:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypJl7DZt2EN61DA62E/l/jfjV6AXO7RobLBG453FBlWeENhfwsnag6/QDB9JIXZVZwSyvnQn
X-Received: by 2002:ac8:2a76:: with SMTP id l51mr3071406qtl.81.1588946566503;
        Fri, 08 May 2020 07:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588946566; cv=none;
        d=google.com; s=arc-20160816;
        b=ae6LTdugmej1r4GDo+ctYJpkq2yW8zm8dSuDywwov7/kfgzOoSJD0isqK6ORKhBFTU
         sWpzbO62kl7NkSDmWIqd3U/dGP/mNfK5ZjptSG05pVwbfKiLOQRS/pUFSn+09u8MWsyG
         y6GpX/xbb8RSUc6Mbd86mY9iJMWCHl3FlkLpyMBXXd8c4oRSuA/nwOJzzZbT9veEd9Kj
         SJnIwJRHkTmfW2mNKU7CMb7ApUx4vuc1r7FDowQ4vKhWpKu+EQLapj4YtNkpFKVZD95W
         Tbs0z/l9XC0z2XYeHFdM6idOEELrHQRrK9KuNUH1rZbre3A8c6nqP6u78XIDVCSrPTfw
         m9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=D4WUVpJaNktKm8yiSVR8Ag5EHn1iBp68/krnD+2KPcg=;
        b=KU6SzdQUbnzZ8a4aliEEnUc7fTTJWdHdxwTa2/jDBcGR1q1N/i1b4sKZSlfff3YoQT
         Q+bCJ6QrrxZ+6BsQqMgn6+nCBgHKM3CE2ZLiU0T06vX+JDsuaTM5LHmSPonEY0FsNQR8
         ZgLBnMqZznI6By41JKkr6267384QD9inhJImxkGvyKBk6MRqdy7b7yGqJXavOX7SlE9a
         XtLvY0BElPu1Sw/rjT6M8JOvAtO1v9jvYtLkRUfpntlp66cVXpFeHGPO/hT8bpOMgU7d
         rYBZQHVIA4isJ4obRcRel/mIWqtgaBfkboE5EKa3QSBFReOTp1PojDD9TV+WDlqn/fMf
         ZZpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KKv4A3YJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 138si1073210qkm.228.2020.05.08.07.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 07:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KKv4A3YJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX3aP-0002VN-O0
	for alex.bennee@linaro.org; Fri, 08 May 2020 10:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jX3aB-0002UM-Fh
 for qemu-arm@nongnu.org; Fri, 08 May 2020 10:02:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34190
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jX3a7-0000Mk-OS
 for qemu-arm@nongnu.org; Fri, 08 May 2020 10:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588946545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4WUVpJaNktKm8yiSVR8Ag5EHn1iBp68/krnD+2KPcg=;
 b=KKv4A3YJS5OcJCWO9tbSXQqHYymP4a/KCIh7Fa1Uxo0gNKd3i11IYUwMzl3+pZIxHrI+Lm
 wMoaCEa4BvrxIvewTANVQphp3X5g6yshAgwHYZQR5K0MD1CBmA0ua3Mjy1NgFPMjXJroEF
 6Ym9uHR5aagg11fZrAiV2fNi6VKx3c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-uExnF8TWPnu2MwiThRQbEg-1; Fri, 08 May 2020 10:02:24 -0400
X-MC-Unique: uExnF8TWPnu2MwiThRQbEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9AAF107ACF4;
 Fri,  8 May 2020 14:02:22 +0000 (UTC)
Received: from [10.36.114.214] (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2DE6707DE;
 Fri,  8 May 2020 14:02:04 +0000 (UTC)
Subject: Re: [PATCH 2/5] virtio-iommu: Implement RESV_MEM probe request
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-3-eric.auger@redhat.com>
 <20200508092605.GB1770804@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <583efffc-8dbb-6217-a596-2ee8d56892d7@redhat.com>
Date: Fri, 8 May 2020 16:02:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200508092605.GB1770804@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-TUID: sq7NCC2REAOf

Hi Jean,
On 5/8/20 11:26 AM, Jean-Philippe Brucker wrote:
> On Thu, May 07, 2020 at 04:31:58PM +0200, Eric Auger wrote:
>> +static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
>> +                                               uint8_t *buf, size_t free)
>> +{
>> +    struct virtio_iommu_probe_resv_mem prop = {};
>> +    size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
>> +    int i;
>> +
>> +    total = size * s->nb_reserved_regions;
>> +
>> +    if (total > free) {
>> +        return -ENOSPC;
>> +    }
>> +
>> +    for (i = 0; i < s->nb_reserved_regions; i++) {
>> +        prop.head.type = VIRTIO_IOMMU_PROBE_T_RESV_MEM;
> 
> cpu_to_le16
> 
>> +        prop.head.length = cpu_to_le64(length);
> 
> same here
> 
>> +        prop.subtype = cpu_to_le64(s->reserved_regions[i].type);
> 
> and subtype is a byte

All fixed. Thanks for spotting this.
> 
>> +        prop.start = cpu_to_le64(s->reserved_regions[i].low);
>> +        prop.end = cpu_to_le64(s->reserved_regions[i].high);
>> +
>> +        memcpy(buf, &prop, size);
>> +
>> +        trace_virtio_iommu_fill_resv_property(ep, prop.subtype,
>> +                                              prop.start, prop.end);
>> +        buf += size;
>> +    }
>> +    return total;
>> +}
>> +
>> +/**
>> + * virtio_iommu_probe - Fill the probe request buffer with
>> + * the properties the device is able to return and add a NONE
>> + * property at the end.
>> + */
>> +static int virtio_iommu_probe(VirtIOIOMMU *s,
>> +                              struct virtio_iommu_req_probe *req,
>> +                              uint8_t *buf)
>> +{
>> +    uint32_t ep_id = le32_to_cpu(req->endpoint);
> 
> I think we should check that the endpoint ID is sane even if we're not
> using it at the moment (it is a SHOULD in the spec, and the page size mask
> patch will need the ep anyway).
OK
> 
>> +    struct virtio_iommu_probe_property last = {};
>> +    size_t free = VIOMMU_PROBE_SIZE - sizeof(last);
> 
> last isn't needed, you can fill the whole probe buffer with valid
> properties
yep. This is a reminder from none prop.
> 
>> +    ssize_t count;
>> +
>> +    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
>> +    if (count < 0) {
>> +            return VIRTIO_IOMMU_S_INVAL;
> 
> indentation?
yes.

Thank you for the review

Eric
> 
> Thanks,
> Jean
> 
>> +    }
>> +    buf += count;
>> +    free -= count;
>> +
>> +    /* Fill the rest with zeroes */
>> +    memset(buf, 0, free);
>> +
>> +    return VIRTIO_IOMMU_S_OK;
>> +}
>> +
>>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>>                                     unsigned int iov_cnt,
>>                                     void *req, size_t req_sz)
>> @@ -407,6 +464,17 @@ virtio_iommu_handle_req(detach)
>>  virtio_iommu_handle_req(map)
>>  virtio_iommu_handle_req(unmap)
>>  
>> +static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
>> +                                     struct iovec *iov,
>> +                                     unsigned int iov_cnt,
>> +                                     uint8_t *buf)
>> +{
>> +    struct virtio_iommu_req_probe req;
>> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
>> +
>> +    return ret ? ret : virtio_iommu_probe(s, &req, buf);
>> +}
>> +
>>  static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>>  {
>>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>> @@ -452,17 +520,33 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>>          case VIRTIO_IOMMU_T_UNMAP:
>>              tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
>>              break;
>> +        case VIRTIO_IOMMU_T_PROBE:
>> +        {
>> +            struct virtio_iommu_req_tail *ptail;
>> +            uint8_t *buf = g_malloc0(s->config.probe_size + sizeof(tail));
>> +
>> +            ptail = (struct virtio_iommu_req_tail *)
>> +                        (buf + s->config.probe_size);
>> +            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
>> +
>> +            sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>> +                              buf, s->config.probe_size + sizeof(tail));
>> +            g_free(buf);
>> +            assert(sz == s->config.probe_size + sizeof(tail));
>> +            goto push;
>> +        }
>>          default:
>>              tail.status = VIRTIO_IOMMU_S_UNSUPP;
>>          }
>> -        qemu_mutex_unlock(&s->mutex);
>>  
>>  out:
>>          sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>>                            &tail, sizeof(tail));
>>          assert(sz == sizeof(tail));
>>  
>> -        virtqueue_push(vq, elem, sizeof(tail));
>> +push:
>> +        qemu_mutex_unlock(&s->mutex);
>> +        virtqueue_push(vq, elem, sz);
>>          virtio_notify(vdev, vq);
>>          g_free(elem);
>>      }
>> @@ -667,6 +751,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>      s->config.page_size_mask = TARGET_PAGE_MASK;
>>      s->config.input_range.end = -1UL;
>>      s->config.domain_range.end = 32;
>> +    s->config.probe_size = VIOMMU_PROBE_SIZE;
>>  
>>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
>>      virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
>> @@ -676,6 +761,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>>  
>>      qemu_mutex_init(&s->mutex);
>>  
>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>> index e83500bee9..5550475691 100644
>> --- a/hw/virtio/trace-events
>> +++ b/hw/virtio/trace-events
>> @@ -73,3 +73,4 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
>>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>>  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>>  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
>> +virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end) "dev= %d, type=%d start=0x%"PRIx64" end=0x%"PRIx64
>> -- 
>> 2.20.1
>>
> 

