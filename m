Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp792865njc;
        Fri, 6 Jun 2025 02:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMZl0BTIbGdTQaZiWdc6/zkgO2yQk88/kXddFckCvR5i4pz0iB/i3Ww2VdicUfv6k5lKYJhgdS34i18A==@linaro.org
X-Google-Smtp-Source: AGHT+IFkE0V0lGW12Dqk7CSIb3Xnt7hvxeuzXdFuemt9nmrlFRNfdYBVt+QQD/A/D9/ONmp0D210
X-Received: by 2002:a05:622a:1b29:b0:494:b914:d140 with SMTP id d75a77b69052e-4a5b9dacac1mr48223611cf.43.1749201366433;
        Fri, 06 Jun 2025 02:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749201366; cv=none;
        d=google.com; s=arc-20240605;
        b=JTCIIukDhCJsnAjLW6EW9ANvsS5neO/WtzxZIFhNQljG18KEPJQ6Tz3RuIJmobhs8F
         Od1RDo5PJdC9EhaLRE2oLWZVM6WGI8TpqNmFGSegByY5c8y6T+YkJOtPui9zstrroTZ1
         gDfwNZutJ+1AcH4Y4DLlLrPfSTVSagETpggM5tQ+IyIY5M/C5Z9zt6qmVvKZYXae87bn
         Lz8jJUX9h0OIYGGmM1XXi6V8gGxPdCl3XzXVCgGY6VJg9yw70wSvaYhQuWfsNvde/Gky
         RlBeBA/pn/P8OzFIb8fVdDbRPlKRu+VTltPn0abwhSoJ6VKDwx0vN1+W8bw8QF31nFAi
         gRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=IU2wsDOaxyt2rOoHHu7jFsXYYaLg/5hN1gbBux97bB4=;
        fh=fKKkCKAizb4NefSzGLGZNZ4OI8HtWqOuWc9Ndn9zwqQ=;
        b=eGW3Fb/GODWcFQli0ixYhA4HBCQYUkMhbC7EgoiXboskhhBS7Q24rZN9nd+PSWow8t
         FTLgVdmtjRj1uMpEIFzChxyNL5FViRh1rkpWbkfKlYdVxLgoRPg580bDAOPA3lD4iKrB
         TVVDxAgzhzw9mcNoYqQV3phR2DwwNcuiVbyxPOjp0BtrrpWDVTy8F3e98nW3nqiIpTX8
         99W7H5p0yt12eZDeEprkkf4CC+clsq055pdSHcS0RYk+WwgMZfOMoxiwzww9rc5uRftW
         mpbIejp7i+/vPAHYidDigQhr4No0rjZdBnQP4lBpT5sKILIC51GhZ9QXouQkmx/akR5Q
         wSsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQL+pEId;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61989092bsi12443531cf.371.2025.06.06.02.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 02:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQL+pEId;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNTAi-0002Jr-2J; Fri, 06 Jun 2025 05:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uNTAe-0002J4-V2
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 05:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uNTAc-0007g1-Bp
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 05:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749201324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IU2wsDOaxyt2rOoHHu7jFsXYYaLg/5hN1gbBux97bB4=;
 b=PQL+pEIdtjeQxlJtxdwlE9ygdnlhNO9anJlfiRO3uJJS7Sr+Z6IvIqf9YPiQtr3qDit3q0
 zJ7zfZg4xr7rhhjdQ/XYJTQEk2ZTAHF3179QjQZnOABc0bp/6J9pNvEsWCkALp/mC2RXdA
 eYIBNGbQmgWqAo7c1jw/vtvVLKC2d5U=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-DmZGGDP0MO2HgzcYVX1sgg-1; Fri,
 06 Jun 2025 05:15:20 -0400
X-MC-Unique: DmZGGDP0MO2HgzcYVX1sgg-1
X-Mimecast-MFC-AGG-ID: DmZGGDP0MO2HgzcYVX1sgg_1749201319
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F54D1801BD6; Fri,  6 Jun 2025 09:15:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C447418003FD; Fri,  6 Jun 2025 09:15:15 +0000 (UTC)
Date: Fri, 6 Jun 2025 10:15:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH v2] ramfb: Add property to control if load the romfile
Message-ID: <aEKxoAw2l3Ki9RhS@redhat.com>
References: <20250606070234.2063451-1-shahuang@redhat.com>
 <aEKeNSc8mAZ8vhGj@redhat.com>
 <9b083ae2-3afb-43f4-8929-fc693b581a0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b083ae2-3afb-43f4-8929-fc693b581a0d@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fz/ngCIoifQs

On Fri, Jun 06, 2025 at 11:04:34AM +0200, Philippe Mathieu-Daudé wrote:
> On 6/6/25 09:52, Daniel P. Berrangé wrote:
> > On Fri, Jun 06, 2025 at 03:02:34AM -0400, Shaoqin Huang wrote:
> > > Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
> > > the x86 need the vgabios-ramfb.bin, this can cause that when use the
> > > release package on arm64 it can't find the vgabios-ramfb.bin.
> > > 
> > > Because only seabios will use the vgabios-ramfb.bin, load the rom logic
> > > is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
> > > for ramfb, so they don't need to load the romfile.
> > > 
> > > So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
> > > device, because the vfio display also use the ramfb_setup() to load
> > > the vgabios-ramfb.bin file.
> > > 
> > > After have this property, the machine type can set the compatibility to
> > > not load the vgabios-ramfb.bin if the arch doesn't need it.
> > 
> > Can you make this a series, with an additional patch that updates the
> > current in-dev machine types to use this new property, so we're clear
> > about the proposed usage.
> > 
> > > 
> > > Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> > > ---
> > >   hw/display/ramfb-standalone.c | 4 +++-
> > >   hw/display/ramfb-stubs.c      | 2 +-
> > >   hw/display/ramfb.c            | 6 ++++--
> > >   hw/vfio/display.c             | 4 ++--
> > >   hw/vfio/pci.c                 | 1 +
> > >   hw/vfio/pci.h                 | 1 +
> > >   include/hw/display/ramfb.h    | 2 +-
> > >   7 files changed, 13 insertions(+), 7 deletions(-)
> 
> 
> > > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > > index 7f1532fbed..4e4759c954 100644
> > > --- a/hw/vfio/pci.c
> > > +++ b/hw/vfio/pci.c
> > > @@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
> > >   static const Property vfio_pci_dev_nohotplug_properties[] = {
> > >       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
> > > +    DEFINE_PROP_BOOL("use_legacy_x86_rom", VFIOPCIDevice, use_legacy_x86_rom, true),
> > >       DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
> > >                               ON_OFF_AUTO_AUTO),
> > >   };
> 
> Alternatively with target-info API:

Don't we need to use the property in order to tie this to the
machine type ? Even if existing non-x86 machines are not using
this ROM, the fact that QEMU loaded it will impact the guest
memory layout which needs to be preserved across migration,
and thus machine type versions.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

