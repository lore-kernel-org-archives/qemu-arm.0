Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1544132lfm;
        Thu, 2 Jul 2020 07:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4VMy2xzKKRq5W5xDps3rDwqR2LIyyap+tiNhuwilp5voxVVtLimT2jsbmDCE8A440eB+s
X-Received: by 2002:a25:6d02:: with SMTP id i2mr53819087ybc.365.1593700782821;
        Thu, 02 Jul 2020 07:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593700782; cv=none;
        d=google.com; s=arc-20160816;
        b=SnfnY2qLsb/kRVz3XgWaXE3Ntt+/g5YDfTzL9E/uy97zM89Du0sBXaEL5aZyp8h09S
         WTV9j+rsNest8yk15zm+0NRQ2ZXsB75jzzhdnxF6BYfIqi8OY3JTtvmjXj9NtxEopdIM
         mW8WWZ1Z3YtYba9RfoJNrZ3IS7Netggjjj5m0usCym3jn7IeaYn7P2VFU5FGuxdR6vGG
         y5/2tqU1vO07THJVNToXevwrVq3uH72FW25UzRCf0BZolXHiI6Nljzd0yds3c9AamYig
         hYocRFFvq8U8miPwc1i+/KECB/lGidtIJVFZAX1J2Uo+70ExJIKDQz3egnN86/Bv2pp7
         Akew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1WuIeeap1mHpTmFAcJT42dujJMnsFtoRuTdFCnKTtd4=;
        b=UuAg6o6NgwwuRgS77tN6yLt6NB+qp/o3KuywfoicsjSfBaPo73mt8Q3D7kRzIvrr+H
         qSBwzMZnktdhIaTL/edXzXuAklQWeQyQ614EDmFapLguUbnY+iBXjNFBJiOgHm8vfkpN
         LPkzrz/n6V1dz/cnYWhnxuUjFf4OaKlrOJl7Q9Z+3LpWhg4LDjxpFIeE3MHKCyTYRsuW
         nhO96esNM+FyZGhjaVyafIkYwyoqJOgqCzNnjYyztZkWu45JNVy6JDo2fcQy4HhoaDMA
         Xcx1/h59PBVVI8s/OEu1q0Pnn06ksoIPZ3qHRBYKSQdyG/x8gGDu9YmxEx2IUr+gNkFq
         eQyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PgBO0JZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si13213012ybt.31.2020.07.02.07.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 07:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PgBO0JZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr0NK-0004RH-80
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 10:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr0ND-0004PL-2l
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 10:39:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25006
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr0NA-0001OX-FZ
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 10:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593700771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WuIeeap1mHpTmFAcJT42dujJMnsFtoRuTdFCnKTtd4=;
 b=PgBO0JZQ/GR3sTg/ZrLJQ48CYdNRC7scZcbPYEIZeQ3FWmVMMX6TF7vXf/OxBPaSV5Re1c
 pGjxHmbd+iCOVJkBR+gT84yYK31+3jnoK7I4z8a3ZKW6Vo5R0IpWBScuwRMcyplRlSCQX3
 brT2Qd7S+beDEnavrWDnAYSPLh9YI+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-s4Wz7ig2PqSS_zDdOCaWIA-1; Thu, 02 Jul 2020 10:39:29 -0400
X-MC-Unique: s4Wz7ig2PqSS_zDdOCaWIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B6E1052508;
 Thu,  2 Jul 2020 14:39:27 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E60907167A;
 Thu,  2 Jul 2020 14:39:18 +0000 (UTC)
Subject: Re: [PATCH RESEND 6/9] hw/arm/smmu-common: Manage IOTLB block entries
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-7-eric.auger@redhat.com>
 <CAFEAcA9FZV=jSk_9aJ_tHy=KLy+YrTFNoiqvCv7BMs0dWrHWFA@mail.gmail.com>
 <db6d92ba-2716-40df-54d3-84fb51ab3ad3@redhat.com>
 <CAFEAcA8ez0ycijFSZrVA3haaoKGho2Q2gQR=cDiiAm7S=-t6OQ@mail.gmail.com>
 <0936903d-109f-c9cf-b40e-767fe7a21dae@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f3b4aba2-bd9a-35f0-b393-4f66e66f62c2@redhat.com>
Date: Thu, 2 Jul 2020 16:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0936903d-109f-c9cf-b40e-767fe7a21dae@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
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
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: STMIowgVLtA4

Hi Peter,

On 6/30/20 6:29 PM, Auger Eric wrote:
> Hi Peter,
> 
> On 6/30/20 5:50 PM, Peter Maydell wrote:
>> On Fri, 26 Jun 2020 at 14:53, Auger Eric <eric.auger@redhat.com> wrote:
>>> On 6/25/20 5:30 PM, Peter Maydell wrote:
>>>> Rather than looping around doing multiple hash table lookups like
>>>> this, why not just avoid including the tg and level in the
>>>> key equality test?
>>>>
>>>> If I understand the range-based-invalidation feature correctly,
>>>> the only time we care about the TG/LVL is if we're processing
>>>> an invalidate-range command that specifies them. But in that
>>>> case there should never be multiple entries in the bs->iotlb
>>>> with the same iova, so we can just check whether the entry
>>>> matches the requested TG/LVL once we've pulled it out of the
>>>> hash table. (Or we could architecturally validly just blow
>>>> it away regardless of requested TG/LVL -- they are only hints,
>>>> not required-to-match.)
>>>
>>> This change could have been done independently on the RIL feature. As we
>>> now put block entries in the IOTLB , when we look for an iova
>>> translation, the IOVA can be mapped using different block sizes or using
>>> page entries. So we start looking at blocks of the bigger size (entry
>>> level) downto the page, for instance 4TB/512MB/64KB. We cannot know
>>> which block and size the address belongs to.
>>
>> Yes, but we wouldn't need to care which TG and LVL the
>> address belongs to if we didn't put them into
>> the key, would we? I'm probably missing something here, but
>> just because the hardware might want to use the hints in
>> the invalidation-command about TG and LVL doesn't inherently
>> mean QEMU is most efficient if it cares about the hints.
> 
> OK I think I understand your point now. It is not necessary to put
> TG/LVL in the key as log as they are in the entry. I will look at this
> implementation ...

Looking further at the implementation, if we don't encode the LVL in the
key (but just encode the block addr), on invalidation, we are not able
to remove the associated entry in one shot, using g_hash_table_remove().
We are obliged to use g_hash_table_foreach_remove and sort out the
entries according to the invalidation parameters.

Putting the TG and LVL in the key allows to do this in one short if
num_pages == 1. See [8/9] hw/arm/smmuv3: Get prepared for range
invalidation, smmu_iotlb_inv_iova() implementation.

So my understanding is it is obviously feasible to get rid of TG/LVL in
the key but may be less optimal when range invalidation gets used by the
guest (most invalidations having num_pages == 1)

Thanks

Eric
> 
> Thanks
> 
> Eric
>>
>> thanks
>> -- PMM
>>
> 
> 

