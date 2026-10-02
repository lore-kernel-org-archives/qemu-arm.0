Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85349CA5FD4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 03:46:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCUDb-0000oR-UP; Thu, 01 Oct 2026 23:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCUDZ-0000oH-DQ
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 23:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCUDX-0007W5-0P
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 23:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790912749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOG04gR6jk7TC5RkNmLmTcyHuCdzIVz02xDk4zXcQjY=;
 b=inoSRcpeYNHfAccCf05ar5XMys/R4Q8thlaR1wL0HpqINy+vxf6pmKHtpMcCWE6UnEMlcS
 bm4m1iWhFZ7s9JaVoLdkhNaNi9g/WcBAyJGztlQPZ7xo4YT9pxf3gPQxdjFbrcFHNzGLhs
 kEf7JMDo9UR2IG7Gscy45sIcQwpXaHY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-_7XUZnwsPmK6decuYFxQHw-1; Thu, 01 Oct 2026 23:45:48 -0400
X-MC-Unique: _7XUZnwsPmK6decuYFxQHw-1
X-Mimecast-MFC-AGG-ID: _7XUZnwsPmK6decuYFxQHw_1790912747
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-39aee9b4cf2so11598124a91.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 20:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790912747; x=1791517547;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NOG04gR6jk7TC5RkNmLmTcyHuCdzIVz02xDk4zXcQjY=;
 b=Dl0zx22CKRPzWYR1um8i7wsEiNr1MfkxvuHVcsmSs4bPP/i8ptNUs6VxNVm0dCOniI
 pt16Z1mO2vjk8K/wjZfKKv1Ke1nw1+KfvHd5L85K+dXJO2pPzGUu040NKzFR7TM4Pew4
 QUbxzbhqfbd0rlGTm/wdtJ13QhU/egIgJuHwG17WxbUz/YUiD49gwXLq2ucSvD2yCEUW
 aTabDmHNjw5dwkeFTAnOTdEEChcZ6qQBGgcF4x6PsspZmQwG1RuZ7HhXwtX90VCDJtG2
 jhPGwKtn3ahRNmOBoq1wIr2gsTh7mUPyeWgXlT8OcePGnjUqJ2Qq31iZfbNBigLkBgfE
 dHEA==
X-Forwarded-Encrypted: i=1;
 AKwUvByUmptbiP3QAvENr05+gU8hV5LRFiv3GYVMwA/5LO59ko3HpiLCh/xu/NOHuWnnQ70JXaH+vHOj9A==@nongnu.org
X-Gm-Message-State: AFq9FYLjt/p05BJ52HPm79aSD5CM6rZMrzief98S2Q2DqpxYkL4DG7ws
 C8zzGlwAhbw6BpHAZjSW7IQtr9Q2vRDhsOVZjUpSjZn5wUvTEGMGDzhzk4zHIM/8hSdS+XUWkbQ
 29GDQHE69rDMYgrgl3eG1oUxdDqQxKihySG/xUluZop4vDTUvtqIiiA==
X-Gm-Gg: AYBFou14+wWiISbQq9gUEKxGBvIO5D1II5iLf636o2jOZ6p4f8mTsB2ZJ1rCfHMAJA6
 +Jq8DSaoV2S1hhNXTPC5DNFXzP3xFD1eD45PHEbAmKJViQ/aa2SYk/3Fw2m6K0yLoB7JTjZd9la
 9elL1PQcV5KtCbpyYRuJ4TJlLhMioeO2tyOzuteHgCXNrwOJdFW/YeyVFbnO5FKpwWbUMVH8OFv
 62MdmdaRzy6jE6r1leN68bjSggqYgPY3d0QbM2XEoTH10jhPSSTSvnPOTgxtS/es7JOZlaLf8O9
 BPRC6nAFCAaiB9Gmb3GV5HkKIUDqwxP8K614CwjG0Re3VruGuH8j2ZcE8i5Q6eEBcIp8+eUZ9RS
 m9MU838vfjojmJ+9XX0Ei+Y5P3HBSGzRyNMqX14Vzww==
X-Received: by 2002:a17:90b:4c05:b0:39d:f4a8:75ef with SMTP id
 98e67ed59e1d1-3a6ce3a9747mr1427609a91.1.1790912747006; 
 Thu, 01 Oct 2026 20:45:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:39d:f4a8:75ef with SMTP id
 98e67ed59e1d1-3a6ce3a9747mr1427593a91.1.1790912746533; 
 Thu, 01 Oct 2026 20:45:46 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a6e7401d04sm759255a91.14.2026.10.01.20.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 20:45:45 -0700 (PDT)
Message-ID: <3257a387-490f-44bb-bd44-dbe06036fd52@redhat.com>
Date: Fri, 2 Oct 2026 13:45:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 11/24] target/arm/kvm-rme: Populate Realm with runtime
 images
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-12-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-12-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HkgljRaQ406pgtxbI1I_v3KC8oLaYZDNzE7_GEPoWpQ_1790912747
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Once the Realm descriptor has been created, tell KVM to transfer runtime
> images (kernel, DT, and rootfs) from guest memory to Realm memory.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/kvm-rme.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index 9985f5daba89..c082a5d8f3d1 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -15,6 +15,7 @@
>   #include "migration/blocker.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
> +#include "qemu/memalign.h"
>   #include "qom/object_interfaces.h"
>   #include "system/confidential-guest-support.h"
>   #include "system/kvm.h"
> @@ -43,12 +44,87 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
>   
>   static RmeGuest *rme_guest;
>   
> +static int rme_populate_range(const RmeRamRegion *region, bool measure,
> +                              Error **errp)
> +{
> +    int ret;
> +    void *buffer;
> +    hwaddr size = region->size;
> +    hwaddr base = region->base;
> +    hwaddr start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
> +    hwaddr end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
> +    struct kvm_arm_rmi_populate populate_args;
> +    size_t aligned_size = ROUND_UP(region->size, qemu_real_host_page_size());

s/qemu_real_host_page_size()/RME_PAGE_SIZE

> +
> +    if (!region->data) {
> +        return -ENODEV;
> +    }
> +
> +    ret = kvm_set_memory_attributes_private(start, end - start);
> +    if (ret) {
> +        error_report("RME: failed to configure initial"
> +                     "private guest memory");
> +        return ret;
> +    }
> +
> +    /* Allocate page-aligned memory */
> +    buffer = qemu_memalign(qemu_real_host_page_size(), aligned_size);
> +
> +    if (!buffer) {
> +        return -ENOMEM;
> +    }
> +
> +    memset(buffer, 0, aligned_size);
> +    memcpy(buffer, region->data, region->size);
> +
> +    populate_args = (struct kvm_arm_rmi_populate) {
> +        .base = start,
> +        .size = end - start,
> +        .source_uaddr = (uintptr_t)buffer,
> +        .flags = measure ? KVM_ARM_RMI_POPULATE_FLAGS_MEASURE : 0,
> +    };
> +
> +    while (populate_args.size > 0) {
> +        ret = kvm_vm_ioctl(kvm_state, KVM_ARM_RMI_POPULATE, &populate_args, 0);
> +        if (ret) {
> +            error_setg_errno(errp, -ret,
> +                "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
> +                start, end);
> +            break;
> +        }
> +    }
> +
> +    qemu_vfree(buffer);
> +
> +    return ret;
> +}
> +

I doubt that the unaligned regions (RmeRamRegion) are allowed. For example,
the region [4KB 64KB+4KB] is turned to the aligned range [0 128KB] when RME_PAGE_SIZE
is 64KB. The question is how do we know the added regions due to the alignment
([0 4KB] and [64KB+4KB 128KB]) are safe for kvm_vm_ioctl(KVM_ARM_RMI_POPULATE).
I guess we probably just reject unaligned regions if they're not expected.

Even if the unaligned regions are allowed, they seem not well handled.

- @aligned_size is still 64KB instead of the 128KB ?
- In "memcpy(buffer, region->data, region->size);", the blob data would be copied to
   [4KB, 4KB+64KB]. However, we're copying the data to [0 64KB] now.

> +static void rme_populate_ram_region(gpointer data, gpointer err)
> +{
> +    Error **errp = err;
> +    const RmeRamRegion *region = data;
> +
> +    if (*errp) {
> +        return;
> +    }
> +
> +    rme_populate_range(region, /* measure */ true, errp);
> +}
> +
>   static void rme_vm_state_change(void *opaque, bool running, RunState state)
>   {
> +    Error *errp = NULL;
> +
>       if (!running) {
>           return;
>       }
>   
> +    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, &errp);
> +    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
> +    if (errp) {
> +        return;
> +    }
> +
>       kvm_mark_guest_state_protected();
>   }
>   

Thanks,
Gavin


