Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A4CCF2C4
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 20:09:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHoEw-0002Na-T1; Fri, 16 Oct 2026 16:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHoEl-0002Je-PA
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 16:09:08 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHoEj-0006tk-SL
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 16:09:07 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3ab41538192so336401a91.0
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792181342; x=1792786142; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9qKt714wTpFnQNXIMAii1yJHjNpuAXnTO+pThrST3To=;
 b=idWp3gJxqlvKcdnSbJeAA0Pj3fgWIJov1IiTyocWuAurXsN4mSOH9xLuObHo6eJCWk
 kAq7XRhR/0l6wRmuajPd6lGM2l+S03xkLitZgmFc7dY9ai5R0ubDChrD9F3wdL7orKqa
 IPHhgDMVTonK0B1JIOLHC6i2KaN/wO6ah1+5YzIK4Z3bsffqrj+82EcGt8L6zZ9pNWa7
 Ua68nTXh6W1iH+R5X7SDSEwoTmRJIkoDO6t1NJyQEuiu9rXkwJHnj0/6RiecHxDQIDBS
 Ol//EfzQRjRIMB7B6bTyRP4HAntHsdvSAnjuszjI1ugRcDEfx8D7SVL55PhIbKVVDcgq
 sixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792181342; x=1792786142;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9qKt714wTpFnQNXIMAii1yJHjNpuAXnTO+pThrST3To=;
 b=uxZFCgJzD31lmTIgV5a2CmT8j9kQ/vAo/hkW2laeFYGiDtgfQVgXaODxWluYTQGjeD
 4iOqLTSqgWimffCF7hAEXlRStzBlpP+LHa7lBtDpa9PWB7VL1e2iG4M4aIitePcWMg0X
 tthJX27QOjWXQhhvKnZjalCZZqSZkfQ08JGi1wkVgkUCAYkwZtr6rz6tMZiLYoCUzzgE
 rvBsfEBp/Ot+Y23H1rSDSMvtWdtNIpGJHD50CQ30ph/9eXVH3/xTyu1ekJ66OFU/+ZKb
 Uhxcz4k1ITDDjxInpfgtJ0P60kjyMbB/C3knc+PjnpmoGyOP2ibNHLTpxIko9dlweP0L
 agfw==
X-Forwarded-Encrypted: i=1;
 AKwUvByahpek8y9BjqQyDcLzKk28QWNA+CBLq1291su+SSza+09GXpsitS53BxpEikFhxdA6oXIM/ZoSIA==@nongnu.org
X-Gm-Message-State: AFq9FYLoa8b6SguvTCcA2cRisvUn5KYyxtzrHX2lsE+DEC9+iz3zjID6
 HoRg0Qq+OX5kk71/DSHXY+wouCP+2Yy2uR19I9befLRzj2R2TSSX/GujH7Ma1xMeIyg=
X-Gm-Gg: AYBFou32yHZ8/Nx4peVom7GRFlAfvc+c2kLXgA2pgVtkfAJWwUGSCre0ChPTRazP4WF
 Y0cYE9BYEYnB7SKKpk3x6uisT657EKasSS2FQmv2zWTPZAZlhiYOM6EPdTfOZGEU42FpnTxJjGZ
 bkzRMxc4YUYHeLRHMofTQI2MQd6X5BeHma09zsqgj+VDJeoyMGCpNuZgDe9pbK2XnuX84MWjhkM
 lDIJiIK0ouDodL84VFUKRU6MMutzSLmXFesxtaAThJLInjIQVf4S53yfg96X9h4SzKP6EoQy3jF
 qz6eI0+5chkMoewLC8MVMkRNSc/yjungTUnTsDgmP2qL4y2JYHKDPN2oJ4m26Fl6vzfTnPUeUUm
 SjvLa0aw00Ve32QahzCDoweUslQ3P9vr/NG4rp0Bwz2oC1t3hpY4owC9YlwnjpU8XAsVE3furL6
 rYEAgrUTVY2mXFieCcPeW+4JXhFUaWgZy4iWXXd1tiF1jvwPOiV0Phetti+kuz5peX6GqDIjgiH
 HkQ/Ytf4UYG
X-Received: by 2002:a17:90b:45:b0:3a4:b061:2765 with SMTP id
 98e67ed59e1d1-3aceeb9272dmr792959a91.15.1792181342239; 
 Fri, 16 Oct 2026 13:09:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3acc49c263asm5207912a91.17.2026.10.16.13.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 13:09:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:08:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 enju.kohei@fujitsu.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v4 11/24] target/arm/kvm-rme: Populate Realm with runtime
 images
Message-ID: <atKEWmnXA-Gu1Y9T@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-12-mathieu.poirier@linaro.org>
 <3257a387-490f-44bb-bd44-dbe06036fd52@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3257a387-490f-44bb-bd44-dbe06036fd52@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Oct 02, 2026 at 01:45:40PM +1000, Gavin Shan wrote:
> On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Once the Realm descriptor has been created, tell KVM to transfer runtime
> > images (kernel, DT, and rootfs) from guest memory to Realm memory.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/kvm-rme.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 76 insertions(+)
> > 
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index 9985f5daba89..c082a5d8f3d1 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -15,6 +15,7 @@
> >   #include "migration/blocker.h"
> >   #include "qapi/error.h"
> >   #include "qemu/error-report.h"
> > +#include "qemu/memalign.h"
> >   #include "qom/object_interfaces.h"
> >   #include "system/confidential-guest-support.h"
> >   #include "system/kvm.h"
> > @@ -43,12 +44,87 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> >   static RmeGuest *rme_guest;
> > +static int rme_populate_range(const RmeRamRegion *region, bool measure,
> > +                              Error **errp)
> > +{
> > +    int ret;
> > +    void *buffer;
> > +    hwaddr size = region->size;
> > +    hwaddr base = region->base;
> > +    hwaddr start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
> > +    hwaddr end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
> > +    struct kvm_arm_rmi_populate populate_args;
> > +    size_t aligned_size = ROUND_UP(region->size, qemu_real_host_page_size());
> 
> s/qemu_real_host_page_size()/RME_PAGE_SIZE

I refactored this function in V5 [1], along with the above declarations.

[1]. https://lore.kernel.org/kvm/20261002202026.1204110-10-mathieu.poirier@linaro.org/

> 
> > +
> > +    if (!region->data) {
> > +        return -ENODEV;
> > +    }
> > +
> > +    ret = kvm_set_memory_attributes_private(start, end - start);
> > +    if (ret) {
> > +        error_report("RME: failed to configure initial"
> > +                     "private guest memory");
> > +        return ret;
> > +    }
> > +
> > +    /* Allocate page-aligned memory */
> > +    buffer = qemu_memalign(qemu_real_host_page_size(), aligned_size);
> > +
> > +    if (!buffer) {
> > +        return -ENOMEM;
> > +    }
> > +
> > +    memset(buffer, 0, aligned_size);
> > +    memcpy(buffer, region->data, region->size);
> > +
> > +    populate_args = (struct kvm_arm_rmi_populate) {
> > +        .base = start,
> > +        .size = end - start,
> > +        .source_uaddr = (uintptr_t)buffer,
> > +        .flags = measure ? KVM_ARM_RMI_POPULATE_FLAGS_MEASURE : 0,
> > +    };
> > +
> > +    while (populate_args.size > 0) {
> > +        ret = kvm_vm_ioctl(kvm_state, KVM_ARM_RMI_POPULATE, &populate_args, 0);
> > +        if (ret) {
> > +            error_setg_errno(errp, -ret,
> > +                "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
> > +                start, end);
> > +            break;
> > +        }
> > +    }
> > +
> > +    qemu_vfree(buffer);
> > +
> > +    return ret;
> > +}
> > +
> 
> I doubt that the unaligned regions (RmeRamRegion) are allowed. For example,
> the region [4KB 64KB+4KB] is turned to the aligned range [0 128KB] when RME_PAGE_SIZE
> is 64KB. The question is how do we know the added regions due to the alignment
> ([0 4KB] and [64KB+4KB 128KB]) are safe for kvm_vm_ioctl(KVM_ARM_RMI_POPULATE).
> I guess we probably just reject unaligned regions if they're not expected.

To make sure I understand your point, please expand on what would be an
unaligned regions.  In your example, [0 128KB] is aligned on 64KB boundries. 

> 
> Even if the unaligned regions are allowed, they seem not well handled.
> 
> - @aligned_size is still 64KB instead of the 128KB ?

I'm confused.  ROUND_UP(64KB+4KB, 64KB) would be 128KB.  What am I missing?

> - In "memcpy(buffer, region->data, region->size);", the blob data would be copied to
>   [4KB, 4KB+64KB]. However, we're copying the data to [0 64KB] now.

I agree with you.  That part was refactored in V5 [1]:

        memcpy(buffer + (base - start), region->data, region->size); 

> 
> > +static void rme_populate_ram_region(gpointer data, gpointer err)
> > +{
> > +    Error **errp = err;
> > +    const RmeRamRegion *region = data;
> > +
> > +    if (*errp) {
> > +        return;
> > +    }
> > +
> > +    rme_populate_range(region, /* measure */ true, errp);
> > +}
> > +
> >   static void rme_vm_state_change(void *opaque, bool running, RunState state)
> >   {
> > +    Error *errp = NULL;
> > +
> >       if (!running) {
> >           return;
> >       }
> > +    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, &errp);
> > +    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
> > +    if (errp) {
> > +        return;
> > +    }
> > +
> >       kvm_mark_guest_state_protected();
> >   }
> 
> Thanks,
> Gavin
> 

