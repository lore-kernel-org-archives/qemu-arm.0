Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2823637lfg;
        Tue, 9 Mar 2021 05:50:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylLuu62yPyrI5VJkNhqrn4AmF85Fi/NBJaB6wiEeaJMiw9RIKH0Z+gpH5VA7y5i7EFYmPr
X-Received: by 2002:a0c:b584:: with SMTP id g4mr25615009qve.0.1615297803731;
        Tue, 09 Mar 2021 05:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615297803; cv=none;
        d=google.com; s=arc-20160816;
        b=f3m3A8lct+s4uUF0aj/S1Vbb++ADFqs438nTAFV7LDJGFdGOZ9XfgqGW/4roVMhrks
         eYzzEk8NtiDYkXe7FTnFK6bNQsMJATV0qG9SPEii21aCp+aHPTm3ePnD7O2EXPCBG19t
         G9b2dNDZRHcWlGtqa/X4o60/RZuYGDn+xKdWNkNQKQqqPgCgSZtvYkUyuESC2pDGmH33
         vaeO6Z6ZIezVvVCyPfoAuw5YL2a4Jxgd+j49FWzaAYMMP7wKZ+1scv3YgDgMrObfG64G
         q4vzRKVaxZ4kyezKVh+nqIPm8KZ8mMLwsnLJ6X9dpHAb40CqrgC5n/qe5i2tMFlIOxXh
         DkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NGXNCz/4OmRwaTiF+pLSd30ziqb/LrWESNl0o3xUPGk=;
        b=X5xhcBIyhn7FjUvG4DnaZcJy3aSHAQi6ZVdrcDvDt1nUPU/lhq08885NWDV4Yvcyfa
         k4Y7VtKNJbVNGQVccL/xE/EE3Mypb5kWEiAWShB8SM6FYoPJapIdHoZnwuGeEOT4oi1h
         QXwznTW+jJ7eXw3ETOS4+3ehuOtvCX1PO+ThJ2XAx7cUOiQPPb8SySOj5+zO34sULbmI
         YJBeAIluisIgn3NA3MvxZddjRRtwBONma4DPVGASgA/QI/qDlcH9vHLlZLv77lmgN1dw
         buiH6/mU5oawAknQiqT3kFaXDj94W4gPh71mnWgPm7uIwyAV/VRGecy0vlTw3jkIZ0wQ
         1LNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K1uuvMM2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si8325635qtw.243.2021.03.09.05.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:50:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K1uuvMM2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJckM-0002zd-V6
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJcj0-0002HA-D4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJcix-0004v6-Ls
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615297714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGXNCz/4OmRwaTiF+pLSd30ziqb/LrWESNl0o3xUPGk=;
 b=K1uuvMM2a5iEphj4JBs2fUVEj4+S+V0PKVPDRm/WFvRIZTuprRXEMFxhOdjEHQJuw9HWqN
 9oKf/+vTJ92drWN4d+Xhq1h/mHIy5tzRaZzAUKZWXb03miobGTgjE3b8ZcfaPJI90s3ZS4
 8ymZsnLo7xz/wjtWpdcPFffePf7R2Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-XOAAis3MNJKWx0OxWPXLBg-1; Tue, 09 Mar 2021 08:48:31 -0500
X-MC-Unique: XOAAis3MNJKWx0OxWPXLBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7536D26862;
 Tue,  9 Mar 2021 13:48:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 757DA60C66;
 Tue,  9 Mar 2021 13:48:22 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
Date: Tue, 9 Mar 2021 14:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-3-zhukeqian1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6MAhi+Dvadto

On 17/12/2020 02.49, Keqian Zhu wrote:
> The parameters start and size are transfered from QEMU memory
> emulation layer. It can promise that they are TARGET_PAGE_SIZE
> aligned. However, KVM needs they are qemu_real_page_size aligned.
> 
> Though no caller breaks this aligned requirement currently, we'd
> better add an explicit assert to avoid future breaking.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>   accel/kvm/kvm-all.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> ---
> v2
>   - Address Andrew's commment (Use assert instead of return err).
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f6b16a8df8..73b195cc41 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -692,6 +692,10 @@ out:
>   #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
>   #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>   
> +/*
> + * As the granule of kvm dirty log is qemu_real_host_page_size,
> + * @start and @size are expected and restricted to align to it.
> + */
>   static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>                                     uint64_t size)
>   {
> @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>       unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>       int ret;
>   
> +    /* Make sure start and size are qemu_real_host_page_size aligned */
> +    assert(QEMU_IS_ALIGNED(start | size, psize));

Sorry, but that was a bad idea: It triggers and kills my Centos 6 VM:

$ qemu-system-x86_64 -accel kvm -hda ~/virt/images/centos6.qcow2 -m 1G
qemu-system-x86_64: ../../devel/qemu/accel/kvm/kvm-all.c:690: 
kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
Aborted (core dumped)

Can we please revert this patch?

  Thomas

