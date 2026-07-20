Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A1C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 20:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wluC8-00082O-DW; Mon, 20 Jul 2026 16:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wluBw-0007uR-0M
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 16:02:20 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wluBu-0004yv-AG
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 16:02:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2cc97653887so115182055ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 13:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784577737; x=1785182537; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=amB8DRIkab9kI0m0AGrWYRIFfBIRp35flDeBw4O7HsU=;
 b=VyRyqwPmdP0+vI9U4OlpN/CGqF1fo/7SRCw7sLdtxo2vfXlFI27Xmvg5ccaTcLGIoA
 V5D036S/O/myAp/s3UVbrXH+1IpR97hL/lK3m3f1KlRISjwE0zMn45A5nHrjlCeAUA3d
 yMXftWwqL5hTPZArV4sIEiCQVV69z8hDIXJDk+pIwaiQ1KVwaopZs30pCKIbzMw6YneO
 nvIj/AckXlP50LHspRpzweFQ6Q8kXEvl0PB+d58xZEShrs21t+cciGF8D62N+QOJt/YH
 rLy/g76Iqc/tTggOhhKIKF6skTbM9yb4do5prBjBP1syR3ly/RRwGiD9xq9hqLc9Wu2b
 0ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784577737; x=1785182537;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=amB8DRIkab9kI0m0AGrWYRIFfBIRp35flDeBw4O7HsU=;
 b=pOg7p7uoSThwHa/ZTkrxvlykTmeSj8xIGmYLsh+SCVf4oCw8+13DsFpFvooWmphFa1
 15d2tWpF+CpD6Bj5MUjV50DDeqzriRg4aSM82rUezX/PCOstvJWxzgWvPuslYR/yr8js
 N8TO8d/IapWd4ZHeX98JOGB4dtDHWcOOePxrxv74ektKldgR3B36Cwy1bAmEWQENtTm0
 RE0TT0pitMKCMcTe7jztYkcOubB9ilH4gkaTIEAStQ6LY4uqR/iJKgid/En3PISwie23
 PBtljOLC+rQFP/4eDKWWnRPUx45FfOi/NYgnXOZphKSAsc4wDxOiqb3ETYPNDGAye0wI
 bBsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpGSmIytN4IynlU8sA0nbvOmUQ5F3oigYVdwqBz5VtISzlN4QqGLZibnPWlSjRpw8/tXpth7hFaNw==@nongnu.org
X-Gm-Message-State: AOJu0Yz5ubGxBGUaxURvzaQH0GgVHiolsHpzVKR9ZIk/06P+Hi40uLXZ
 3xjL2/T695Syihrzwl1SohkSmSaOlMnWKBDGSfcjuNnO/dbJxgKpiSQVQ3F7jWoRlNY=
X-Gm-Gg: AR+sD10xdWcH5yhC2j0OQLVcsorGQh1o31ohpQXF2CdIjbt2G0zLbEQGPq8QXN2ZyRR
 WS1v1YAwTSjWIjwtLHhCxy4GKuUAGG+j+bqXX/52sxyOi4HzktiW5oVBTr9SvFWNAYQGLGajDrf
 VfvXIUj67GY64z9SlCSbn+EkdJLL62DHrYiVMNTu5X8HKMJv8P0ewRQqaUA3L6ApBrkZMWiYVHq
 Q590j+ZCapaD7m3c2WxtQJW7URZem2PfCnv1qjMWYkz4L7Z3u6EFwVYBQQft6VrMIJTNaMYk/bE
 eERE6jFJnw4xDYEeBgP2IvbdTXLpU6iiiM2KSFTeplNukj0UhgznHdvMDuWwC3iDgcjR0FXYrr2
 Opr9EW6nHOHB0gM+8VTJj3BO1d0AMghKUQO46jW3SjIqPozlWSNsLAv5zIQuBBLaCipC6jedBse
 66UMwT
X-Received: by 2002:a17:902:d48f:b0:2cc:d807:369c with SMTP id
 d9443c01a7336-2cf34a3000cmr173069645ad.45.1784577736510; 
 Mon, 20 Jul 2026 13:02:16 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:966a:e23:19e7:951a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf3476e491sm61808635ad.76.2026.07.20.13.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 13:02:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:02:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v1 12/25] target/arm/kvm-rme: Populate Realm with runtime
 images
Message-ID: <al5-xc-kNZhCcN9p@p14s>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-13-mathieu.poirier@linaro.org>
 <1bd09a58-a207-46ba-a470-f67cc8509f07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bd09a58-a207-46ba-a470-f67cc8509f07@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x636.google.com
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

On Tue, Jul 14, 2026 at 08:56:44PM +1000, Gavin Shan wrote:
> On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Once the Realm descriptor has been created, tell KVM to transfer runtime
> > images (kernel, DT, and rootfs) from guest memory to Realm memory.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/kvm-rme.c | 56 ++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 56 insertions(+)
> > 
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index 97ec7c8934c9..58669f4a50f1 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -44,12 +44,68 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> >   static RmeGuest *rme_guest;
> > +static int rme_populate_range(const RmeRamRegion *region, bool measure,
> > +                              Error **errp)
> > +{
> > +    int ret;
> > +    void *host_ua;
> > +    hwaddr size = region->size;
> > +    hwaddr base = region->base;
> > +    hwaddr start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
> > +    hwaddr end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
> > +    struct kvm_arm_rmi_populate populate_args;
> > +
> > +    host_ua = address_space_map(region->as, base, &size, false,
> > +                                MEMTXATTRS_UNSPECIFIED);
> > +
> > +    populate_args = (struct kvm_arm_rmi_populate) {
> > +        .base = start,
> > +        .size = end - start,
> > +        .source_uaddr = (uintptr_t)host_ua,
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
> > +    address_space_unmap(region->as, host_ua, size, false, 0);
> > +
> > +    return ret;
> > +}
> > +
> 
> Nit: The argument @measure isn't needed as it's always true, passed
> by its only caller rme_populate_range(). I guess it's leftover for
> the earlier host series.
>

I kept this one on purpose.  The KVM_ARM_RMI_POPULATE_FLAGS_MEASURE is used by
the kernel and as such, it is a matter of time before we make that options
available on the cmd line.  I can remove it now but it will come back soon
enough...  
 
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

