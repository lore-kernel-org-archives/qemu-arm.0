Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp13239lfm;
        Mon, 6 Jul 2020 07:01:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/oXg66jl7JX+16SZUdHQ8bJG9yEQ0g0kiN6p/J2uLroG9GszdfII0JymCvhgvSBJpf4Bq
X-Received: by 2002:ac8:788:: with SMTP id l8mr49934383qth.177.1594044063902;
        Mon, 06 Jul 2020 07:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594044063; cv=none;
        d=google.com; s=arc-20160816;
        b=p3RtH+T/XDUv4b83LWbNPFhp8MFhK42jrrDdbYh+T6FllSqxZ2p26WZa12WuodzUmm
         tgt450UhXJACnaq+1q6qp/5gBmRZKT4SUoDqmilQa92OpvjTJhCLj/rQGTc1WO/4fkla
         l+RuJCBYqXBJzAbYzdGioGOWAed0zDQgeC/AEmhf67+s9mdScylTEt/Q7vSh1fmL7ae/
         WCjCV0pMkAwTQj9khYGOgo4LelxEHHVPiA3wAnryK60mIVJyWoEnoddDlHmTXy8RteBA
         ivBVpRA27ejACm9oFQmMhuI9aVigjMRXzy+0OjFNxeM7IXxzfrsrMK8LOi+kZKIpVECG
         FIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=81G0ycH4UTsVM4+ms3Tf0r8wfEPaJ5rFCYo7StKevR8=;
        b=NvraY9u/DZxSEcTCfE7KBYEf4VKNyK9cXQqNGRbjRZkkj9eKQvw9E4nwZgDApYYUtG
         HMhin8bE16kUXl0AxGzxAPMMRfUSk15J8xgftBzYsP9ljbBF33mVDPfrAR66aqJiEg7J
         MPZjS0WBhntubiB/KkXt9n1Dw3QcohkaHOhjgOCTn8ENsniJe69LjSHJckZYb+6INlXE
         UN/GtP5kgdjjZ3nSc3DWjVCjPVid2/K2XkV6oGL7I1S9jP+KPJlWZ+mY4KFOah+4PchM
         8GtwgmffF22QyKa782oR3g1bFG8ob5A7muDslYrO5jS4IvfKXsQCO+BDhrse9ACFUG2H
         qvBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ai/kNvjE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si12098413qvx.114.2020.07.06.07.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 07:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ai/kNvjE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsRg7-0008PK-4s
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 10:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jsRfw-0008NT-4M
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 10:00:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51154
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jsRfu-0007DA-GK
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 10:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594044049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81G0ycH4UTsVM4+ms3Tf0r8wfEPaJ5rFCYo7StKevR8=;
 b=ai/kNvjE2G/4C0u4ojmuDp0fanBIuq0PM7sHIdWAgKTE9UjDAM7mFVyRp+F+93NDIxQn6P
 gMcAMJJw5K+Ce7Zcn54AGTT4khF4iWLsTEltvVb14MuYBtdHJ6F3ke9cR8Mt/UcCsq6DWy
 pSFARVYRFZSp3EmvoG+gDBYkEEy1c1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-pJuXUfXxNTa0ZPmSFrw6ZQ-1; Mon, 06 Jul 2020 10:00:45 -0400
X-MC-Unique: pJuXUfXxNTa0ZPmSFrw6ZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756A67BB1;
 Mon,  6 Jul 2020 14:00:43 +0000 (UTC)
Received: from [10.36.113.241] (ovpn-113-241.ams2.redhat.com [10.36.113.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F31B160BEC;
 Mon,  6 Jul 2020 14:00:34 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] hw/arm/smmu: Simplify the IOTLB key format
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-5-eric.auger@redhat.com>
 <CAFEAcA9ipO0x1-7Zu2cm_q+LoKx17D02vsW1=Aks3nHyQzCpaw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <932dca70-37dd-ce23-360b-3903ad5910f9@redhat.com>
Date: Mon, 6 Jul 2020 16:00:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ipO0x1-7Zu2cm_q+LoKx17D02vsW1=Aks3nHyQzCpaw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Will Deacon <will@kernel.org>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSoC4CbZU+Xg

Hi Peter,

On 7/6/20 3:26 PM, Peter Maydell wrote:
> On Thu, 2 Jul 2020 at 16:27, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Instead of using a Jenkins hash function to generate
>> the key let's just use a 64 bit unsigned integer that
>> contains the asid and the 40 upper bits of the iova.
>> A maximum of 52-bit IOVA is supported. This change in the
>> key format also prepares for the addition of new fields
>> in subsequent patches (granule and level).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 7dc8541e8b..5e85e30bdf 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -34,34 +34,17 @@
>>
>>  static guint smmu_iotlb_key_hash(gconstpointer v)
>>  {
>> -    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
>> -    uint32_t a, b, c;
>> -
>> -    /* Jenkins hash */
>> -    a = b = c = JHASH_INITVAL + sizeof(*key);
>> -    a += key->asid;
>> -    b += extract64(key->iova, 0, 32);
>> -    c += extract64(key->iova, 32, 32);
>> -
>> -    __jhash_mix(a, b, c);
>> -    __jhash_final(a, b, c);
>> -
>> -    return c;
>> +    return (guint)*(const uint64_t *)v;
>>  }
> 
> So the hash value is now going to be the lower 32
> bits of the key, which is to say bits [40,12] of the IOVA,
> and won't include the ASID at all. Isn't that going to
> result in more hash collisions than would be ideal?
> 
> I was going to suggest using the glib builtin g_int64_hash()
> instead, but looking at the source that seems to be the
> identical implementation to this one. I guess that's
> intended for cases where an integer key is really a
> random integer, not one where it's got internal structure
> of different bit fields within it being for different
> purposes.

That's something I did not notice. Would you recommend to keep the
Jenkins hash function then? Note the intel iommu also use the hash
function which only covers the gfn.

Thanks

Eric

> 
> thanks
> -- PMM
> 

