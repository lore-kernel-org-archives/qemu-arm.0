Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp337499lfa;
        Thu, 15 Oct 2020 00:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdJuP8LZMTHDcmPDht7LwSa+ZSNdcMM7yXw+iR2iEYd53dNMN7kfvp/4QF7g49nfhdkxAx
X-Received: by 2002:a25:8750:: with SMTP id e16mr3316283ybn.145.1602748285993;
        Thu, 15 Oct 2020 00:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602748285; cv=none;
        d=google.com; s=arc-20160816;
        b=eUtjbKxLQW/HQ883Tfd0Ezmfd3fBplptkU0He3BQHj8khjbuO/UueOTWMmBWF27q/K
         MBZWpXDesjdaoSt96Ji47NyltL3hrFKvxibgJ2SAptwxCb+A/i3bvWmYLUtWHJAkDnOI
         HN7FNW2mFB73mkHjT9EhrV4U76xotMfEjLp+XeL3/FziLfcPCKsBRHArpWdkJ+BxlzYt
         XCXPSSrB/x97oRL34Ebu7Dmqh8thtJFhaahl/GcrSalf58XdeadaazXHvZ1hER7xZbd7
         dk8NnlzoZFsDtNdNg8oA5FIB6xwa6hvH8zBKbPEaE6kcatKn1vHgvxHymeTCTLfV80pM
         LMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EYroMIFTHXddrF2AY2TQtOv+I6pZz8EJgxuHXxDD25s=;
        b=mP/cbNV1B5cLv+AvdYrH+1U3OXQ1ee4aKgVMy5dBDe62q8PN3ok/UO8DdvGyryq7SA
         zmm9W4KPDzUkZ/wXs+kk1k3aKa4YLSxnBAXhCqQkxvsFuQg3mgM61qXrEq0jDdLFG4FO
         Pz7roMYlZbEFRK4RlLyXen4h6/cUCmf9GCKdUvNP0spRXTS73I3j8eGFtH2DmWuMnuKf
         N9HatO4UfXqGhJKJRGESiIMeCdxuWx8gQsTPC2Ld+xKWbb2G0WsNorTT/qEErN6O8jI+
         5BQOgTW5qqg86JsV0K4a55CxM2LkYIZbcdhkJh56NH2YywYBiA4rggOpTkKuYGP+A6EB
         Ijzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GQEOE8ha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21si1847191ybg.455.2020.10.15.00.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 00:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GQEOE8ha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSy2n-0006aH-Bq
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 03:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kSy2b-0006Y0-HL
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 03:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kSy2Y-0008Ae-Lo
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 03:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602748269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYroMIFTHXddrF2AY2TQtOv+I6pZz8EJgxuHXxDD25s=;
 b=GQEOE8ha3TsPG+cKKzyg9Hqc1Sow0yrWLNCJALJGtTQy0fqOadZuX1k8Tq+uYaIFLczlDN
 PCtDdksh4DF+fCooY2mjMvjEqDSBYI0tH+oyzT6pU/I+dndQjeqIF5a1aBNeze9MZNhPgO
 2lwZpHq94lgqkdfwJqs1/7cJyOft0sU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-wcianrR_OFOdqMOgcZJ3-w-1; Thu, 15 Oct 2020 03:51:07 -0400
X-MC-Unique: wcianrR_OFOdqMOgcZJ3-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC7E802B6A;
 Thu, 15 Oct 2020 07:51:05 +0000 (UTC)
Received: from [10.72.13.96] (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD4AA60C07;
 Thu, 15 Oct 2020 07:50:46 +0000 (UTC)
Subject: Re: [PATCH 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200903161446.29615-1-eperezma@redhat.com>
 <20200903161446.29615-6-eperezma@redhat.com>
 <d3e2098d-e150-7f99-a1ee-4a997daf4a5c@redhat.com>
 <CAJaqyWfwGP7_Ex=NhG_po+A1BkN3OCV=+3Vwi8uhLJ_e4UA5NQ@mail.gmail.com>
 <20200928174857.GC59869@xz-x1>
 <20201003082953-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8e55778a-946a-c038-57dc-624e9e034d44@redhat.com>
Date: Thu, 15 Oct 2020 15:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003082953-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-level <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z3Ba24kqFHSt


On 2020/10/4 上午1:38, Michael S. Tsirkin wrote:
> On Mon, Sep 28, 2020 at 01:48:57PM -0400, Peter Xu wrote:
>> On Mon, Sep 28, 2020 at 11:05:01AM +0200, Eugenio Perez Martin wrote:
>>> On Fri, Sep 4, 2020 at 6:34 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> On 2020/9/4 上午12:14, Eugenio Pérez wrote:
>>>>> Device IOTLB invalidations can unmap arbitrary ranges, eiter outside of
>>>>> the memory region or even [0, ~0ULL] for all the space. The assertion
>>>>> could be hit by a guest, and rhel7 guest effectively hit it.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>>> ---
>>>>>    softmmu/memory.c | 13 +++++++++++--
>>>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>> index 8694fc7cf7..e723fcbaa1 100644
>>>>> --- a/softmmu/memory.c
>>>>> +++ b/softmmu/memory.c
>>>>> @@ -1895,6 +1895,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>>>>>    {
>>>>>        IOMMUTLBEntry *entry = &event->entry;
>>>>>        hwaddr entry_end = entry->iova + entry->addr_mask;
>>>>> +    IOMMUTLBEntry tmp = *entry;
>>>>>
>>>>>        if (event->type == IOMMU_NOTIFIER_UNMAP) {
>>>>>            assert(entry->perm == IOMMU_NONE);
>>>>> @@ -1908,10 +1909,18 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>>>>>            return;
>>>>>        }
>>>>>
>>>>> -    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
>>>>> +    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
>>>>> +        /* Crop (iova, addr_mask) to range */
>>>>> +        tmp.iova = MAX(tmp.iova, notifier->start);
>>>>> +        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
>>>>> +        /* Confirm no underflow */
>>>>> +        assert(MIN(entry_end, notifier->end) >= tmp.iova);
>>>>
>>>> It's still not clear to me why we need such assert. Consider
>>>> notifier->end is the possible IOVA range but not possible device IOTLB
>>>> invalidation range (e.g it allows [0, ULLONG_MAX]).
>>>>
>>>> Thanks
>>>>
>>> As far as I understood the device should admit that out of bounds
>>> notifications in that case,
>>> and the assert just makes sure that there was no underflow in
>>> tmp.addr_mask, i.e., that something
>>> very wrong that should never happen in production happened.
>>>
>>> Peter, would you mind to confirm/correct it?
>> I think Jason is right - since we have checked at the entry that the two
>> regions cross over each other:
>>
>>      /*
>>       * Skip the notification if the notification does not overlap
>>       * with registered range.
>>       */
>>      if (notifier->start > entry_end || notifier->end < entry->iova) {
>>          return;
>>      }
>>
>> Then I don't see how this assertion can fail any more.
>>
>> But imho not a big problem either, and it shouldn't hurt to even keep the
>> assertion of above isn't that straightforward.
>>
>>> Is there anything else needed to pull this patch?
>> I didn't post a pull for this only because I shouldn't :) - the plan was that
>> all vt-d patches will still go via Michael's tree, iiuc.  Though at least to me
>> I think this series is acceptable for merging.
> Sure, that's ok.
>
> Eugenio, you sent patch 0 as a response to another series, which
> made me miss the series. Pls don't do that in the future.
>
> Looks like Jason reviewed the series - Jason, is that right? -
> so I'd like his ack if possible.


Right.

Euenio. If it's possible I would prefer to remove the assertion but it's 
ok it you leave it.

And please repost the series.

Thanks


>
>
>> Though it would always be good too if Jason would still like to review it.
>>
>> Jason, what's your opinion?
>>
>> Thanks,
>>
>> -- 
>> Peter Xu
>

