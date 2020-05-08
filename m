Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2668204lfb;
        Thu, 7 May 2020 23:23:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKXqy7EPjFqcDawJaGk8xP0WtwNjiN90Fa/vdNyn7ovuER5FJUg/BMaTUTeunzEp3qxmepQ
X-Received: by 2002:a37:aac5:: with SMTP id t188mr1125723qke.393.1588919021730;
        Thu, 07 May 2020 23:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588919021; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPv/J7LZi7r7y7BSllg7YxJ24kGr4mpOHI6VN1rryHhNcYfe1z2XlFU42Muz5epX0F
         BAa1m8+iDIhpp29d9ekbJGM01kqFmY5Z7YSgfM6ZcSF9ff00hjjSiOrJ+C9Blokh2mnD
         eHITL7RBq2se0HljlCJKSfiPIyWggFqS7Yo0HnPyLX77ZteLzxIGLv3Y5bOb0gxH2f1P
         w6U2YInLpg+aNRJFMT2db1pif+bxuTQPW09YPJzZdI5MFC2oFUyMtK+nOPYkNtBNTE/7
         DYCN9TxbMsS4ROfK40sLwDspb830qoTL8y0bzkh+b7Oi5IByLbSnrZYIMaGsF6l5gMEq
         E5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Cjun3HwpR/dUSbWnUEI21S4uVYYDWlYjfR9wcTEeDds=;
        b=KE1LJZObgHa68SODNTZ44KMTfPg4kiklCoxgsdnMYDTONwRLy29wx5OFb3wSQK+56Q
         7FfzbNluSGcPU9i8K9U5cT0VR6ZTFwNcAEcVlM3jEb89MBq63DYe9p9Tsj8BuNnb1E+P
         6gIIwDNerrocRzBkm/+8w0F6cODNuiv7ZENjm/+CNfuhLox4PUvLLvqTGgwwvDbUv+rc
         6tBvKiUs5XPWJdexReci1JxGMfWQ6xyheQokzb2v4nWc4h9Bco0uK3ImhIMcDsXLtS2f
         gzxgsigtCsImN3MIzESwtAw38+8tWFnhFyhhApDtgNfxOHJWVns8TCyjcFnT9kpseu/z
         1Szg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M6hSB3A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w14si660133qvl.38.2020.05.07.23.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M6hSB3A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwQ9-0004XC-54
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWwQ2-0004Wx-JP
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:23:34 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37311
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWwQ0-00077l-T6
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cjun3HwpR/dUSbWnUEI21S4uVYYDWlYjfR9wcTEeDds=;
 b=M6hSB3A7Ps6bxPyADdbtAo/rf1T9Cko/6qEBHf6tFXXiUU+SA4YCq8I1cjmLotJGYkWLm/
 vVHjqkVP7PMmWt7SLna8iBjsfg+wp3Ht/oFL3ag7R3fPInFqPqXBT+CEHsqMMB6kTEWhoK
 ch1vcjfRoCCHouAHdyYumKnw3UkpzVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-duFAobKdP7WjlGN8mh0-tw-1; Fri, 08 May 2020 02:23:29 -0400
X-MC-Unique: duFAobKdP7WjlGN8mh0-tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A59800687;
 Fri,  8 May 2020 06:23:27 +0000 (UTC)
Received: from [10.36.114.214] (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE91A1C933;
 Fri,  8 May 2020 06:23:19 +0000 (UTC)
Subject: Re: [PATCH 2/5] virtio-iommu: Implement RESV_MEM probe request
To: Peter Xu <peterx@redhat.com>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-3-eric.auger@redhat.com>
 <20200507194032.GL228260@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4d9c0131-7a88-3c6d-5c0c-9f19662fec2d@redhat.com>
Date: Fri, 8 May 2020 08:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200507194032.GL228260@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nqjvbQgoJ6et

Hi Peter,
On 5/7/20 9:40 PM, Peter Xu wrote:
> Hi, Eric,
> 
> On Thu, May 07, 2020 at 04:31:58PM +0200, Eric Auger wrote:
> 
> [...]
> 
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
> 
> I think we can't move this unlock to here because otherwise "goto out" could
> potentially try to unlock it without locked first.  Thanks,
You're right. I will revisit that.

Thanks!

Eric
> 
>> +        virtqueue_push(vq, elem, sz);
>>          virtio_notify(vdev, vq);
>>          g_free(elem);
>>      }
> 

