Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3721838ejb;
        Tue, 21 Feb 2023 15:44:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+Gv0gjzU4BJs9PqoGCm2bITyF6cmuBuD93K2R5lZMIJNUF6OwKLZr9lcfMxQ6CMg312oR5
X-Received: by 2002:ac8:7fcd:0:b0:3b8:6b71:5d3a with SMTP id b13-20020ac87fcd000000b003b86b715d3amr11725655qtk.38.1677023098595;
        Tue, 21 Feb 2023 15:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677023098; cv=none;
        d=google.com; s=arc-20160816;
        b=t8GHM4tAAZb1Z9lCHNDxV2D6d9a3rSjfcABrt+NQ4TDjgblESQBef5mm8QwflNs/Qm
         WOMRkX6soivzdlI72cWBHm+QTN4aMl7kupsXcXSSO7XFIxxS8UtqiqAh+zKBCGle/0Yd
         A1qhZ/ryRqoKFfP85Nv0vhgaz1JcMdbW2d8VQLMZ9gBCFnEk76s4cdCiqve8eqYCZEdL
         ZpLARCKa3KutABVpMBfk3fCv17uwmYhYOZ4kwWqVYIcWtfgg9Fr0ohax4bH/TZxOQGmK
         mhLludXJlOVe84L6dyERKXUFDMdIhonu5YaIIZzuJu+qQxoO/xwqbJ5rmcNrb15DpDUQ
         Si7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hGwsfs/qYTzcGVEpkcigCqFc6YBAzapWyRdw84gcn6A=;
        b=aQ/fLvbzs6ohTkSG55dPk0HnElgVjHKeYbb1l4fkVaMpfw4MXx2BqsY4P5bTZhZQpn
         7nDSc+QP4b87BLko7f6LnX1xR1tLaxFpMJ0/2AjubR2EhCmNDhTKbY/g/tda7okC8lg4
         /EhVULe2Trh0RsHsIix/bbw/WDxbGAJyXtOmdmmxHXpQP4rkHnx74iInCzsDCsRxWYJi
         tWlm3P7eGRjtl33UpIAqIRKYnY5SUFfIsMO9dipF9kaPfARyaLSV6kRop+nd0gRzJDCP
         vHGAp8SO2agdoZHmwtQcmrnrKhBFWg8me2NWKuQd3HB9zvySg4KqXd6/CIhBZKCc478A
         Vo8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=esKq3OpI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020ac87f07000000b003b9ea8e8163si13450232qtk.731.2023.02.21.15.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=esKq3OpI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcJF-0000WI-JP; Tue, 21 Feb 2023 18:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUcJD-0000TN-Ht
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUcJB-0005sh-PE
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677023069;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGwsfs/qYTzcGVEpkcigCqFc6YBAzapWyRdw84gcn6A=;
 b=esKq3OpIUCAtFT8PMNyGcvPXJ23/14qX04NVqHyGFLrIzdEQ5A2bPk6wZyRksyoY7qfTum
 KiNNGg2x2rp4rOyuGGlZNnDjTFspYqQtlZanYmTlenkx55E0uS09ajGdgbFm3nFga/KutN
 RkmgNrrEVhJmFQ4Ksw6VK5Xtc4PoWMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-9yt8ONU3OCygOx8S_Fyr-A-1; Tue, 21 Feb 2023 18:44:24 -0500
X-MC-Unique: 9yt8ONU3OCygOx8S_Fyr-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A427185A7A4;
 Tue, 21 Feb 2023 23:44:24 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B45EA140EBF4;
 Tue, 21 Feb 2023 23:44:13 +0000 (UTC)
Subject: Re: [PATCH v1 3/6] kvm: Synchronize the backup bitmap in the last
 stage
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-4-gshan@redhat.com> <Y/UDbqyB2N/OWWi5@x1n>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <08c954d7-f4e4-4d63-28fc-50128f4bc2d7@redhat.com>
Date: Wed, 22 Feb 2023 10:44:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y/UDbqyB2N/OWWi5@x1n>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K30z/+cEqSov

On 2/22/23 4:46 AM, Peter Xu wrote:
> On Mon, Feb 13, 2023 at 08:39:22AM +0800, Gavin Shan wrote:
>> In the last stage of live migration or memory slot removal, the
>> backup bitmap needs to be synchronized when it has been enabled.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c      | 11 +++++++++++
>>   include/sysemu/kvm_int.h |  1 +
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 01a6a026af..b5e12de522 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -1352,6 +1352,10 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>>                    */
>>                   if (kvm_state->kvm_dirty_ring_size) {
>>                       kvm_dirty_ring_reap_locked(kvm_state, NULL);
>> +                    if (kvm_state->kvm_dirty_ring_with_bitmap) {
>> +                        kvm_slot_sync_dirty_pages(mem);
>> +                        kvm_slot_get_dirty_log(kvm_state, mem);
>> +                    }
>>                   } else {
>>                       kvm_slot_get_dirty_log(kvm_state, mem);
>>                   }
> 
> IIUC after the memory atomic update changes lands QEMU, we may not need
> this sync at all.
> 
> My understanding is that we sync dirty log here only because of non-atomic
> updates happening in the past and we may lose dirty bits unexpectedly.
> Maybe Paolo knows.
> 
> But that needs some more justification and history digging, so definitely
> more suitable to leave it for later and separate discussion.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 

Peter, could you please give some hints for me to understand the atomic
and non-atomic update here? Ok, I will drop this part of changes in next
revision with the assumption that we have atomic update supported for
ARM64.

Thanks,
Gavin

> 
>> @@ -1573,6 +1577,12 @@ static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
>>           mem = &kml->slots[i];
>>           if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
>>               kvm_slot_sync_dirty_pages(mem);
>> +
>> +            if (s->kvm_dirty_ring_with_bitmap && last_stage &&
>> +                kvm_slot_get_dirty_log(s, mem)) {
>> +                kvm_slot_sync_dirty_pages(mem);
>> +            }
>> +
>>               /*
>>                * This is not needed by KVM_GET_DIRTY_LOG because the
>>                * ioctl will unconditionally overwrite the whole region.
>> @@ -3701,6 +3711,7 @@ static void kvm_accel_instance_init(Object *obj)
>>       s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
>>       /* KVM dirty ring is by default off */
>>       s->kvm_dirty_ring_size = 0;
>> +    s->kvm_dirty_ring_with_bitmap = false;
>>       s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
>>       s->notify_window = 0;
>>   }
>> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
>> index 60b520a13e..fdd5b1bde0 100644
>> --- a/include/sysemu/kvm_int.h
>> +++ b/include/sysemu/kvm_int.h
>> @@ -115,6 +115,7 @@ struct KVMState
>>       } *as;
>>       uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
>>       uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
>> +    bool kvm_dirty_ring_with_bitmap;
>>       struct KVMDirtyRingReaper reaper;
>>       NotifyVmexitOption notify_vmexit;
>>       uint32_t notify_window;
>> -- 
>> 2.23.0
>>
> 

