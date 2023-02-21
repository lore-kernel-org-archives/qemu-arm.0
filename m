Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3707695ejb;
        Tue, 21 Feb 2023 15:21:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+/bJixPkgpAKldmUinOnoWzvblpvt/Ma/bbR09tQxVg1YDOkV1n/cJ1udk5W1H8Kgu1TkX
X-Received: by 2002:a05:622a:1495:b0:3b8:6c4d:488a with SMTP id t21-20020a05622a149500b003b86c4d488amr10835633qtx.37.1677021663082;
        Tue, 21 Feb 2023 15:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677021663; cv=none;
        d=google.com; s=arc-20160816;
        b=V5PfzIwhBhyuhBpjFeF67wz83wcbIxIbgRET54VjJrXioCjMis1hHj9TOCgTF4TB7m
         xqHXbujcoIU9xmx/gZZ3svq7QdhZoE3w8360kpfW51HSJuxD1SKqaLOMVbViKLvtbPyW
         cW2FNMLq2akvZZWlEXiqXhiJOHpPyyv+XJ5FigFFA6ICncOjWKV98406hmSEtS7Tn+S/
         eZKe3R0CETROG+qS0l+aeSA1nvxYgqXSOGMqzglrbbm6yLNkSK77pTPEW0Iy1Wdrf/qc
         bBQtxZeYLK4nA0Em1r6+rNvYHcy5WdGba1/mcwZEnb2+ZgBph892Man9TGtAEsVacZBy
         a/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aJnBi+G5xtHxPLpnu3pdd1PMYcXJMatoymCmVjBZB+U=;
        b=BWkqUu7tqZQ7dUhu2hTHcyZich9WwTvF3U9N+29zrdvUsNyeBVZoEKKYXEDGTFeRcG
         dBmbDm0+8Ql9v+ngcHR/mprv5KX5TxxZfMbg/2VuvLSH/rbl7bxzRcCaIkdltjZnBRT4
         MatFNYMhOrpCK72k6fCQ4E81gh9Iltl0GKYNE1DnS8159/FTe6aAuMl5rOvXFB0RDMcL
         kIV3dzCOCa5p1mMnFmOGHFrcxN+AYUG6Zok/r+Igp02cAGJyQ3jzhGxGQZ9GmPC7dDe6
         ZHqwTCQ+f1N1RvQ6WexwcwEFzLdvWFN6uMpomSEx4oTybKwMv6P6SlNWoMOn/r96hCVZ
         7oDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPiC8jXW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac87f4d000000b003a69225c2bcsi12844626qtk.342.2023.02.21.15.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPiC8jXW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUbw5-0002kL-VN; Tue, 21 Feb 2023 18:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbw3-0002i0-8d
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:20:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbw1-0001Fr-PF
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677021633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJnBi+G5xtHxPLpnu3pdd1PMYcXJMatoymCmVjBZB+U=;
 b=KPiC8jXWQ+PmTdR18FZJCWtOoE1ic+hWSbxvOec3jcyBmtEhFpZukD1K3eD6cIqHo10mms
 wDlPAtR9AXlXjvAdL8XktN6qhEjY5lyiDjhddBKLz11h66zklJOmqzTn/F/tr3F6CBCcsS
 XjNvEEOGsiH32STDir4NNxk4f7pOOeA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-6vZV1wxqMFyple8InTK1Iw-1; Tue, 21 Feb 2023 18:20:29 -0500
X-MC-Unique: 6vZV1wxqMFyple8InTK1Iw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C10D1C0434A;
 Tue, 21 Feb 2023 23:20:28 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16144492B04;
 Tue, 21 Feb 2023 23:20:17 +0000 (UTC)
Subject: Re: [PATCH v1 2/6] migration: Add last stage indicator to global
 dirty log synchronization
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-3-gshan@redhat.com> <Y/UBNX7ljyTYLa6H@x1n>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9022bc0c-db3d-d8f2-4071-f3752c8ee1f0@redhat.com>
Date: Wed, 22 Feb 2023 10:20:13 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y/UBNX7ljyTYLa6H@x1n>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vq/vVTVYY2Xh

On 2/22/23 4:36 AM, Peter Xu wrote:
> On Mon, Feb 13, 2023 at 08:39:21AM +0800, Gavin Shan wrote:
>> The global dirty log synchronization is used when KVM and dirty ring
>> are enabled. There is a particularity for ARM64 where the backup
>> bitmap is used to track dirty pages in non-running-vcpu situations.
>> It means the dirty ring works with the combination of ring buffer
>> and backup bitmap. The dirty bits in the backup bitmap needs to
>> collected in the last stage of live migration.
>>
>> In order to identify the last stage of live migration and pass it
>> down, an extra parameter is added to the relevant functions and
>> callbacks. This last stage indicator isn't used until the dirty
>> ring is enabled in the subsequent patches.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> One trivial thing to mention below.
> 
>> ---
>>   accel/kvm/kvm-all.c   |  2 +-
>>   include/exec/memory.h |  5 +++--
>>   migration/dirtyrate.c |  4 ++--
>>   migration/ram.c       | 20 ++++++++++----------
>>   softmmu/memory.c      | 10 +++++-----
>>   5 files changed, 21 insertions(+), 20 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 9b26582655..01a6a026af 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -1554,7 +1554,7 @@ static void kvm_log_sync(MemoryListener *listener,
>>       kvm_slots_unlock();
>>   }
>>   
>> -static void kvm_log_sync_global(MemoryListener *l)
>> +static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
>>   {
>>       KVMMemoryListener *kml = container_of(l, KVMMemoryListener, listener);
>>       KVMState *s = kvm_state;
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 2e602a2fad..75b2fd9f48 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -929,8 +929,9 @@ struct MemoryListener {
>>        * its @log_sync must be NULL.  Vice versa.
>>        *
>>        * @listener: The #MemoryListener.
>> +     * @last_stage: The last stage to synchronize the log during migration
> 
> IMHO it may be important to mention the vcpu status here that the caller
> guarantees to call the last_stage==true only once, only after all vcpus are
> stopped (and vcpus will not be started again if migration succeeded).
> 

Yes, I will update the comments in next revision accordingly.

>>        */
>> -    void (*log_sync_global)(MemoryListener *listener);
>> +    void (*log_sync_global)(MemoryListener *listener, bool last_stage);

Thanks,
Gavin

