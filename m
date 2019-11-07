Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp879215wri;
        Thu, 7 Nov 2019 04:13:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpi/I8Nw8TZeN4UfzbrrRE9tyFzKKNQ/zf2Mnnng75swDAK/kyb6eFIVtc0GyDU91Jh1YO
X-Received: by 2002:a50:b558:: with SMTP id z24mr3141820edd.67.1573128784322;
        Thu, 07 Nov 2019 04:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573128784; cv=none;
        d=google.com; s=arc-20160816;
        b=NOcSBqozPmijeD7wG+xwSdgXOIB9RFPKkOhWc1AzHu+TYYIrvlR9okH+qkTDvNQuig
         kEqDPnr59fN0MRoNpyKFZ81ZVbGrZQhEvzAQGkjlGpVJE/0WZUgB38fUB/UHZ7SbSV3A
         rnjZYipqG8fYsbTHE+2N+BQ+ZKX08J7eF9tcntmuXkSSFZZHsIhibPm6cuthZm9n7xjj
         HmVlLToxRw1g8xgKV2CbR+Yc8NkfKDkjwHR/LIskL0DoU3edHDbBPCFHhVCaDkH4gLVg
         YjA02tFwR6glJ8oHgb9MhhP5P5OpCHepY12H8SMXkMbUzcfgwkkmLiFLXcAo22GVXOqX
         FSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=It6V3UM/dbrCXbVlN6LCxs/ovMmz5vJ2AooEt0KlmFw=;
        b=GB0avd1FJEWGfhrMqN9Fp4Z5+bWbUfZ/HN8a8Llr0YEKP0MgxE0xxiyQrZurJb4VlJ
         RdJWn3FwxmBojRO5QfuD/RWbx2TBDH8bACekFf6l5e3/JdPBtZJR7sNBE3N9z/NVXaEg
         2uAndwj9pdlUzAHZA6dZe7ZWGlrV7unyEdrH/jTo/VYKkbh4On3EMC4wqUbtBjC24bKg
         VRzfI0ZE2RlddvrfHtbrROgFlT8IIF71bGfYSx3127qkauRNOqVZmd9JFjgpLhMiVnbB
         xzkmrwnxkNQiaehDd0+D39LU2yOmfzN+5uiRB61hBkEbwWtOAdk+mZjNPuRg9YHfRYBB
         Gd9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mu4MxBqe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 24si1498946eje.293.2019.11.07.04.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 04:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mu4MxBqe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSgeq-0004R6-7A
	for alex.bennee@linaro.org; Thu, 07 Nov 2019 07:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iSgeJ-0004Pn-LD
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 07:12:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iSgeH-00083y-Us
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 07:12:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34869
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iSgeH-0007xR-KQ
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 07:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573128744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=It6V3UM/dbrCXbVlN6LCxs/ovMmz5vJ2AooEt0KlmFw=;
 b=Mu4MxBqePUiJwsI21ZdP6VPSR6aXbvIEKwcOwa9tVyuXYRFh5zgP2aZ3dVJUfwhl6rLE16
 sHia+wZvfxujwjH/NxfXbz6sTqN8ttfS7VL68T/Snw7FYdUuibp6untNIDMBDR7Mrj/tX1
 rcesQQ+YGIZluOMoEm1+YmOa0UAsBdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-IIwgu445NTusestkhKdMeg-1; Thu, 07 Nov 2019 07:12:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17FBE107ACC3;
 Thu,  7 Nov 2019 12:12:19 +0000 (UTC)
Received: from gondolin (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A32A75D6D8;
 Thu,  7 Nov 2019 12:12:13 +0000 (UTC)
Date: Thu, 7 Nov 2019 13:12:10 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [RFC v2 11/14] linux-headers/kvm.h: add capability to forward
 hypercall
Message-ID: <20191107131210.26acf011.cohuck@redhat.com>
In-Reply-To: <da720295-2a84-e38b-9828-5287daefcfa2@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-12-guoheyi@huawei.com>
 <20191106185524.0fe51c50.cohuck@redhat.com>
 <4dbcbd18-0e6c-f985-c36d-96df65331d11@huawei.com>
 <20191107035624-mutt-send-email-mst@kernel.org>
 <da720295-2a84-e38b-9828-5287daefcfa2@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: IIwgu445NTusestkhKdMeg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Qu+MRmJsMFZ

On Thu, 7 Nov 2019 19:57:22 +0800
Guoheyi <guoheyi@huawei.com> wrote:

> On 2019/11/7 16:57, Michael S. Tsirkin wrote:
> > On Thu, Nov 07, 2019 at 09:44:36AM +0800, Guoheyi wrote: =20
> >>
> >> On 2019/11/7 1:55, Cornelia Huck wrote: =20
> >>> On Tue, 5 Nov 2019 17:10:53 +0800
> >>> Heyi Guo <guoheyi@huawei.com> wrote:
> >>> =20
> >>>> To keep backward compatibility, we add new KVM capability
> >>>> "KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
> >>>> hypercall to userspace.
> >>>>
> >>>> The capability should be enabled explicitly, for we don't want user
> >>>> space application to deal with unexpected hypercall exits. After
> >>>> enabling this cap, all HVC calls unhandled by kvm will be forwarded =
to
> >>>> user space.
> >>>>
> >>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> >>>> Cc: Peter Maydell <peter.maydell@linaro.org>
> >>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >>>> Cc: Cornelia Huck <cohuck@redhat.com>
> >>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>>> Cc: Dave Martin <Dave.Martin@arm.com>
> >>>> Cc: Marc Zyngier <marc.zyngier@arm.com>
> >>>> Cc: Mark Rutland <mark.rutland@arm.com>
> >>>> Cc: James Morse <james.morse@arm.com>
> >>>> ---
> >>>>    linux-headers/linux/kvm.h |  1 +
> >>>>    target/arm/sdei.c         | 16 ++++++++++++++++
> >>>>    target/arm/sdei.h         |  2 ++
> >>>>    3 files changed, 19 insertions(+)
> >>>>
> >>>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> >>>> index 3d9b18f7f8..36c9b3859f 100644
> >>>> --- a/linux-headers/linux/kvm.h
> >>>> +++ b/linux-headers/linux/kvm.h
> >>>> @@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
> >>>>    #define KVM_CAP_PMU_EVENT_FILTER 173
> >>>>    #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
> >>>>    #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
> >>>> +#define KVM_CAP_FORWARD_HYPERCALL 176
> >>>>    #ifdef KVM_CAP_IRQ_ROUTING =20
> >>> Is this cap upstream already? I would have thought your header sync
> >>> would have brought it in, then. (Saying this, that header sync looks
> >>> awfully small.)
> >>>
> >>> If it is not upstream yet, please split off this hunk into a separate
> >>> patch -- it's a bit annoying, but makes life easier for merging. =20
> >> No, it is not upstream yet. The whole framework and interfaces between=
 KVM
> >> and qemu are still under discussion. I'll keep in mind of this when mo=
ving
> >> forward to next steps...
> >>
> >> Thanks,
> >> HG =20
> > It's best to add it in some other place meanwhile. =20
> Do you mean to split this patch from the whole patch set and send it=20
> separately? Sorry I'm not clear about maintainers' work and may bring=20
> you some trouble...

My preferred approach:

- add a commit entitled "placeholder for headers update" that contains
  the not-yet-upstream changes in the header files you need
- base the rest of your work on that
...
<review happens, series looks good>
...
- if kernel changes are upstream: replace the placeholder patch with a
  real update (may include separate patches, if you need an additional
  header); maintainer merges
- if kernel changes are not yet upstream: maintainer merges with
  placeholder to a feature branch, replaces with real update and merges
  once kernel patches hit upstream
(not every maintainer does the second approach; they may ask you
instead to resend with a proper headers update once the kernel changes
are upstream)

