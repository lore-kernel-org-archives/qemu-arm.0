Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp724663dye;
        Fri, 27 Jun 2025 00:16:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUS1ssmKwyjO3e3cJXaOTMcPBqAUCv9rkW0yHdJgBnltsKBDqLM/v/f/P8AehScw6ZB6Q5NQE6D66dfGA==@linaro.org
X-Google-Smtp-Source: AGHT+IEWUdIXLbnow1pX1DEPN4uRPAeyjl0ZJp3tO8/Ncjsb9p+Im1E40QyGg2i7EJstzdvBo8L+
X-Received: by 2002:a05:6214:2f8c:b0:6fa:c81a:6231 with SMTP id 6a1803df08f44-7000174dcb0mr42988086d6.8.1751008603016;
        Fri, 27 Jun 2025 00:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751008603; cv=none;
        d=google.com; s=arc-20240605;
        b=H327GsFb8hKKOEhxJm+tzrGUVfAhq5iy7OmKKkNK7StTDj5jn6YGvUrSF3Ib6uW57v
         FGhkApuTzPjeus6VMmMSqJhkZ9SJq1MM8gqLL73FWW88SPTK7km5j2sm4mdzx3MOjEr0
         Oz9iZm7Tk9gqeXQlHJHt9pnFgHZ64qioXnhWb9g3JqtAp5rALjfw0A/knTvx9N0Pd1Ch
         xBKkoG+91gT/zVTPY5WZa9wCPkVFyvKE7bqNiJvc0XD+RrozOfOh+rao46B1Lgntx/Fv
         1EE5P4DO+CXf742q9fy8SI5g4D9Q9tFbObZcHZ3Xk4UsmlOc170IEhFs+zTQs+Hd3GHB
         nBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=RUX86QuLkGfEhzHI3W2THyEIAS6wLpO8cXysEh9kOCU=;
        fh=yOucZTzMrXeY5fnfeEdiNPGH/j70l15ljJROxyEajRU=;
        b=Z4JcUnVkYGL1omVYSZ0afuXWkN+dNXmzvBSFkZJP50EPiS6ZVVoJJQa6NADMIn6W90
         9UGQv3Xug0jcINVPRjIttnm8GmPOEkiCAn+sC9dyb1whLbP68JTWgp9+fqaHFDvoheUL
         0ycaBg6/1VO2X6UiYnHmG2ixNNHmmkpguN8crM360WAteaYVI7lA0vCgSjD0qXMP/Am6
         uNd5ru2S3L0qRf9vWvBmtgpDVQQmoEPyvte1SRNnTDlA7g+J6lZSTzpyuPm3K0OfcNng
         qv+7m1xumsFVkuHSl/XhZxhIsO2c2WAwQzXJeEDN6t7Q8i7L7t7YgRz2W1dvcZa8o4uv
         Vg9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hxmMCboC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77355cb3si36363556d6.161.2025.06.27.00.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 00:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hxmMCboC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV3Je-0004x4-4L; Fri, 27 Jun 2025 03:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uV3Jc-0004ws-B1
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 03:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uV3Ja-0001UY-3u
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 03:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751008559;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUX86QuLkGfEhzHI3W2THyEIAS6wLpO8cXysEh9kOCU=;
 b=hxmMCboCgfv3+qH7mNkXfhFUEAMlr4Fvj/rghtdf4bGgUI2uWZpquUCq9coAx4VOlWbsd4
 geJ7gdXq3XmBE6fGaWD2E/GN/qfhoaf0WSb9ndLBZHQJxTDOb9MXyVRz8Vkt1GwtUMobfn
 37YwJxefOxuFk3RIY1ZR004iePew8BM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-tZyOmKDYPjqTFiE8l8QesA-1; Fri,
 27 Jun 2025 03:15:55 -0400
X-MC-Unique: tZyOmKDYPjqTFiE8l8QesA-1
X-Mimecast-MFC-AGG-ID: tZyOmKDYPjqTFiE8l8QesA_1751008553
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 501AB1955F38; Fri, 27 Jun 2025 07:15:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.75])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA01C180035C; Fri, 27 Jun 2025 07:15:47 +0000 (UTC)
Date: Fri, 27 Jun 2025 08:15:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/2] hw/i386: Add the ramfb romfile compatatibility
Message-ID: <aF5FD-mvsh5-eMcX@redhat.com>
References: <20250617030521.2109305-1-shahuang@redhat.com>
 <20250617030521.2109305-3-shahuang@redhat.com>
 <aa4ef145-9e08-4ad9-a152-dd8fa2371436@redhat.com>
 <ba75ac62-db52-491e-8944-2bf27106d0a6@redhat.com>
 <8c3cce88-fab5-4bf1-bc6b-804730e9889d@redhat.com>
 <0d59875a-88a0-41f2-99d4-4e7a19de0e14@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d59875a-88a0-41f2-99d4-4e7a19de0e14@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7ztnZcY6HUJE

On Fri, Jun 27, 2025 at 01:37:55PM +0800, Shaoqin Huang wrote:
> Hi Eric,
> 
> On 6/26/25 4:01 PM, Eric Auger wrote:
> > 
> > 
> > On 6/26/25 4:05 AM, Shaoqin Huang wrote:
> > > Hi Eric,
> > > 
> > > On 6/23/25 5:20 PM, Eric Auger wrote:
> > > > 
> > > > 
> > > > On 6/17/25 5:05 AM, Shaoqin Huang wrote:
> > > > > Set the "use-legacy-x86-rom" property to false by default, and only set
> > > > > it to true on x86 since only x86 will need it.
> > > > s/compatatibility/compatibility in the title
> > > 
> > > Ok. Will fix it.
> > > 
> > > > > 
> > > > > Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> > > > > ---
> > > > >    hw/display/ramfb-standalone.c | 2 +-
> > > > >    hw/i386/pc_q35.c              | 3 +++
> > > > >    hw/vfio/pci.c                 | 2 +-
> > > > >    3 files changed, 5 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-
> > > > > standalone.c
> > > > > index af1175bf96..ddbf42f181 100644
> > > > > --- a/hw/display/ramfb-standalone.c
> > > > > +++ b/hw/display/ramfb-standalone.c
> > > > > @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
> > > > >      static const Property ramfb_properties[] = {
> > > > >        DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,
> > > > > true),
> > > > > -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
> > > > > use_legacy_x86_rom, true),
> > > > > +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
> > > > > use_legacy_x86_rom, false),
> > > > >    };
> > > > >      static void ramfb_class_initfn(ObjectClass *klass, void *data)
> > > > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > > > index fd96d0345c..f6d89578d0 100644
> > > > > --- a/hw/i386/pc_q35.c
> > > > > +++ b/hw/i386/pc_q35.c
> > > > > @@ -45,6 +45,7 @@
> > > > >    #include "hw/i386/pc.h"
> > > > >    #include "hw/i386/amd_iommu.h"
> > > > >    #include "hw/i386/intel_iommu.h"
> > > > > +#include "hw/vfio/pci.h"
> > > > >    #include "hw/virtio/virtio-iommu.h"
> > > > >    #include "hw/display/ramfb.h"
> > > > >    #include "hw/ide/pci.h"
> > > > > @@ -67,6 +68,8 @@
> > > > >      static GlobalProperty pc_q35_compat_defaults[] = {
> > > > >        { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
> > > > > +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> > > > > +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
> > > > this will only keep the legacy behavior along with q35 machine type but
> > > > not on other machines being used for x86. what about pc-i440fx? Doesn't
> > > > it apply to it as well? Are there other machine types also impacted.
> > > 
> > > Ok I will also add it with pc-i440fx. I think only q35 and i440fx are
> > > impacted.
> > > 
> > > > 
> > > > Also what about Daniel's comment in v3:
> > > > https://lore.kernel.org/all/aEak8utPPkHepVfR@redhat.com/
> > > > "For non-x86, historical versioned machine types will need
> > > > likely it set to true, in order to avoid the memory layout
> > > > being changed IIUC."
> > > > 
> > > > Is it actually needed?
> > > 
> > > If those machine types need to set it to true. I think they can set it
> > > after they have this property.
> > nope it does not work like that. In case we really need to take care of
> > this, this must be handled by compats.
> 
> If so. Why don't we still keep the "use-legacy-x86-rom" default to true, and
> only set it to false to those arch which doesn't need it just like my
> original implementation.
> 
> Because I don't really know how other arch's memoery layout was impacted by
> this property set to false. I think keep their original behavior and only
> change it on arm64 is a good idea.
> 
> How do you think about it?

No, the default value of the property shoudl reflect the long
term desired behaviour - in this case 'use-legacy-x86-rom = false'.

We must then reverse this default to 'true' for ALL historical versioned
machine types on ALL architectures, where this device is built, or any
specific machines where we want to keep the historical behaviour going
forward.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

