Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp1282493njc;
        Mon, 9 Jun 2025 02:10:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMgsb9qbwE7GGGiUvTkrmLydIbEHs138QhCtcBoWbfN1NLMAgvyJa959FSqkuiHOymttPXXupotqO+eg==@linaro.org
X-Google-Smtp-Source: AGHT+IFQ5rPLab+G0puPcmyccWzouNkMm0kXR3MmQsGQ0x5hGKGx3KyA/LmCQAYcvOYmq/0/zHNM
X-Received: by 2002:a05:620a:4711:b0:7d3:914b:abe9 with SMTP id af79cd13be357-7d3914bad8fmr668466085a.57.1749460237179;
        Mon, 09 Jun 2025 02:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749460237; cv=none;
        d=google.com; s=arc-20240605;
        b=CDj6lfngdiikcyrHHmMX/m6ZKuzdmtXK4mp/hBZFlW16vPPwBSRFDxMEn0YBH2RjBK
         6YzEyFpm8TKxF6KnIFd1xT+3PvrqL6lZd67b4OS0WlA4yMWxAATQIkHnhdAAiZOAD47Y
         h/FkEwa8SeIZcizL6mUe7EcERsn2kplPnzA/nmfITOV/GrnSxz3wq6KcYgH0xdL0DoQe
         76lwDZqzl1N8TFdkDt71IbEcaAnRlGa2jytRbHV0Urt1TncdUTibFykuTihi75QS6UVO
         K4EmRdmfQiD0h4bY0BwweKS1EXIUeMU0tWCTlbtF4p39vPSebDzQdLk+RtTNRnch+exx
         D60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Kn8ec7xGLUDt4PSLBqUMuRPROR1nOuR1fmR99U4wpjE=;
        fh=EHb7v2ETbPAYFBimoq6eE+SxGXFoPKVBcjnNDwHFnOQ=;
        b=XIfnXi5wmq3xMpCIJnECSjQsEmQkanidzLSkj+SEona5Si0hdTFPg/Nw5VqMovhkeM
         cFxjyid9g++i1ScJ/b8aZlq4uq9ODMrEF8Jzq8T/OpJtkturvlFKBMpSRAbvp4w8Baj+
         5RN5AhX91NjVcDILa8tr7ex+/xmwCwFA9uhTu7U2pr9u0eRFWVurDyKqsdu4gv6+LeQQ
         qnRFwvzp36mlAfSCwp7GVoMTgwyhxykuIXE1WFdMbA8dqqdgNCn9e5ohoN56wxt12L3B
         sbQwDXSiYDuOnLSXU3uS4u+OHtquiV7RnW/cxEOj63ri0ZLq9Box2VIA1PAzJNjT+wIu
         ygLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kp4xDuXR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d38fe47ffesi368372085a.305.2025.06.09.02.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 02:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kp4xDuXR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOYWO-00065h-3y; Mon, 09 Jun 2025 05:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uOYWM-00065Y-RQ
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 05:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uOYWK-0008VD-QK
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 05:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749460220;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Kn8ec7xGLUDt4PSLBqUMuRPROR1nOuR1fmR99U4wpjE=;
 b=Kp4xDuXROPwjcbywQd6imiz4R0B5U89/qjgRNo/lIg3IenBWXrRauAMCf8IbMHmSLWJqlM
 6G5x8fuOD3hKftDQ/4r0IU9/rP0xB2uAm+dmbLzNoTqiaKA9aRD1f6eWh2b3DaGhvjFUCE
 ppoyb78B6PCxYuGvA1gucflNLuVPtd4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-JXjU0RC3PcqjVnaZyI5tPg-1; Mon,
 09 Jun 2025 05:10:18 -0400
X-MC-Unique: JXjU0RC3PcqjVnaZyI5tPg-1
X-Mimecast-MFC-AGG-ID: JXjU0RC3PcqjVnaZyI5tPg_1749460217
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0C5E81956057; Mon,  9 Jun 2025 09:10:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.45])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 82A771806D3E; Mon,  9 Jun 2025 09:10:13 +0000 (UTC)
Date: Mon, 9 Jun 2025 10:10:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] hw/arm: Add the romfile compatatibility
Message-ID: <aEak8utPPkHepVfR@redhat.com>
References: <20250609073408.2083831-1-shahuang@redhat.com>
 <20250609073408.2083831-3-shahuang@redhat.com>
 <CAFEAcA8eA2wX1oQeNJfNBYq1NhHgoemYJ-ybOYAgBq2-t9ZPzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8eA2wX1oQeNJfNBYq1NhHgoemYJ-ybOYAgBq2-t9ZPzw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: WgLIPYhqbjhz

On Mon, Jun 09, 2025 at 09:48:36AM +0100, Peter Maydell wrote:
> On Mon, 9 Jun 2025 at 08:34, Shaoqin Huang <shahuang@redhat.com> wrote:
> >
> > On arm64, it doesn't use the vgabios-ramfb.bin, so set the property
> > "use-legacy-x86-rom" to false, thus the ramfb won't load the
> > vgabios-ramfb.bin.
> >
> > This can mitigate the problem that on release version the qemu can't
> > find the vgabios-ramfb.bin if it use the ramfb.
> >
> > Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> > ---
> >  hw/arm/virt.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index a96452f17a..5f94f7a2ca 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -38,6 +38,7 @@
> >  #include "hw/arm/primecell.h"
> >  #include "hw/arm/virt.h"
> >  #include "hw/block/flash.h"
> > +#include "hw/vfio/pci.h"
> >  #include "hw/vfio/vfio-calxeda-xgmac.h"
> >  #include "hw/vfio/vfio-amd-xgbe.h"
> >  #include "hw/display/ramfb.h"
> > @@ -90,6 +91,8 @@
> >
> >  static GlobalProperty arm_virt_compat[] = {
> >      { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
> > +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "false" },
> > +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "false" },
> 
> I think we should find a way to make this default to "false"
> and only be set "true" for x86. Otherwise every single non-x86
> board that ever adds support for ramfb and virtio will have
> to add these two lines, which is a source of future bugs.
> (Whereas if you forget to mark a new x86 board as needing
> the legacy rom you'll find out about it pretty quickly.)

Yes, going forward we this to default to true only on x86.

For non-x86, historical versioned machine types will need
likely it set to true, in order to avoid the memory layout
being changed IIUC.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

