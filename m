Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2537945ejc;
        Tue, 17 Jan 2023 08:51:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtah95qFp4LNs5Xcg5Fbbh3miQeNrraO42I62ZrgNL/tmiwAki2uoBRimQvuJPa6R/p62Aw
X-Received: by 2002:a05:6214:4381:b0:535:26a9:782 with SMTP id oh1-20020a056214438100b0053526a90782mr5373119qvb.37.1673974283969;
        Tue, 17 Jan 2023 08:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673974283; cv=none;
        d=google.com; s=arc-20160816;
        b=1Gh1JlOBLbGepfTnyx5nCIcxz8xQGa2YrSf1o/7yEuDZjzZgtwWJFA+T/kjXpEPAeZ
         iKrzK4U8VPsGVNsrLZ8AqqKc9npOCEW19WMzooRk7WFvwjharEvdnITBRlQHt1DLB8sS
         Eo1dri5xttLdF8gsA806ONAoWQUcre4Yf19CIAgg3AF/7E4M0HWZeh7yNl3XXzK8+ow3
         De+Gc5QyBcMevcsf+uk6hGanTocEBsekPk+gXPErsHPlnkhMN+XDasTsAdNGzBNdmi9W
         8W6MypHpIINOV6s6gc9EY3WJJKUOx9dzR4LA7luEfxA/6wQdhB3Cj1U64Nt3Kz3eAKU/
         9SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=M4our3rLiepemZ3k4+HYbKuv18su20d4pbNBOR9XAVk=;
        b=GBXnokOFSYmbe7LYdyLFfQPKtn2hrUOs7pmf5I4pUjSvwF6oqibBdLtuQA8nNQnBJF
         pRH4LGnqLnYRO60NzCfab6cY8e5zluDWBhsCgBkXqeAxSnhHHsUMhLYZAcWzRIqwIYxu
         aVwgO3rwfeC1DBqectZwo9Zpkqoll3tHytA2zfuH6i92LAFh2wnH0EmrruqK2g51meOd
         vlD0PGSbSHqrIlHzkYfiN4bKOdkg+0BYE8VCeGuXaj9fN8FbX3k54/uf3HIyyrjWI5C6
         Lx1MCgGv12yRY/k6OX4sDVa5XynBTMLlXYiaKJ0AlifN06vyIcBuVK3PapcIDl0nJHUz
         Ctag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RAdeIe+Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc7-20020a056214410700b00534e0734ba1si4609837qvb.283.2023.01.17.08.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 08:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RAdeIe+Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpB4-0004hT-4f; Tue, 17 Jan 2023 11:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHpB1-0004gG-LP
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHpAz-0001c6-WA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673974269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M4our3rLiepemZ3k4+HYbKuv18su20d4pbNBOR9XAVk=;
 b=RAdeIe+Z2ukA5RxStA979q3hgDa1R6IBvwM5dimnGGUw32GoGu1edxbzdI5VLu9HLl79Cx
 IeT7C126zT0xcGpdJr3Bqo+SH6DHguHh3qFa9JlwtjaLLnLYXWIAf+NeHZLjz368siD4Wm
 ulTjiGqXsiDXSfg5LMXhlg8H0nQSf+Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-4uokuv9kMTGubUTAoRe0NQ-1; Tue, 17 Jan 2023 11:51:00 -0500
X-MC-Unique: 4uokuv9kMTGubUTAoRe0NQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi6-20020a05600c3d8600b003da1f6a7b20so52149wmb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4our3rLiepemZ3k4+HYbKuv18su20d4pbNBOR9XAVk=;
 b=JlJYs/Xu6A4lUvm9OjyGpQo3Tw+tGlSPE7Siu95j7ZgW3bVYC4i81rUVOWHqtnZGxH
 4KO5RreSbswvuFWt5vz7zkEAtju4YLx0/BmjvE+apeB6eu36XBqz8WDGgLniHZUK7rkq
 U4L9GEJqFV/QqyNVkhNGJSm5cdhZi9VVLbwwhOfcayhfobC1K/Ury0DU1hjoZ6EwHhZG
 Nm0yzj1tmhGwl28c7Vsxb/2d7BBxebvXu8x7OEOLXnjGZLePL+c5sv7lslSYS/H8NJVY
 6kXzJwtPiIY0DaJBhcbYV83LgBshrczTyvNqJPT4UvgjpklrQ9EnhKbJsZZoPOHEC6G3
 nLZg==
X-Gm-Message-State: AFqh2koIQCWjQnxYTdD2uZJSlx2lZFnxIKvQOKvEgwcp/bbEXrUWMT18
 9/xfCq3WUYOYwvCAEncLZRn1Kt3l+2C3bykF83gX81IfnUJkgbe7i/KiS8pKXzAhlGmgCYAEj3/
 m0k1VmFlY+cY/UP0=
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr3633596wmf.16.1673974257857; 
 Tue, 17 Jan 2023 08:50:57 -0800 (PST)
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr3633577wmf.16.1673974257579; 
 Tue, 17 Jan 2023 08:50:57 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003db0647645fsm2809480wmi.48.2023.01.17.08.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 08:50:57 -0800 (PST)
Date: Tue, 17 Jan 2023 16:50:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Message-ID: <Y8bR7xrsCMr5z6xI@work-vm>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BfGpjq7UQYkJ

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > Introduce a new cpu feature flag to control MTE support. To preserve
> > backwards compatibility for tcg, MTE will continue to be enabled as
> > long as tag memory has been provided.
> >
> > If MTE has been enabled, we need to disable migration, as we do not
> > yet have a way to migrate the tags as well. Therefore, MTE will stay
> > off with KVM unless requested explicitly.
> >
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  docs/system/arm/cpu-features.rst |  21 +++++
> >  hw/arm/virt.c                    |   2 +-
> >  target/arm/cpu.c                 |  18 ++---
> >  target/arm/cpu.h                 |   1 +
> >  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
> >  target/arm/internals.h           |   1 +
> >  target/arm/kvm64.c               |   5 ++
> >  target/arm/kvm_arm.h             |  12 +++
> >  target/arm/monitor.c             |   1 +
> >  9 files changed, 181 insertions(+), 13 deletions(-)
> >
> > diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> > index 00c444042ff5..e278650c837e 100644
> > --- a/docs/system/arm/cpu-features.rst
> > +++ b/docs/system/arm/cpu-features.rst
> > @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
> >  than the maximum vector length enabled, the actual vector length will
> >  be reduced.  If this property is set to ``-1`` then the default vector
> >  length is set to the maximum possible length.
> > +
> > +MTE CPU Property
> > +================
> > +
> > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> > +presence of tag memory (which can be turned on for the ``virt`` machine via
> > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> > +proper migration support is implemented, enabling MTE will install a migration
> > +blocker.
> > +
> > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> > +according to the following rules:
> > +
> > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> > +  preserves the behaviour prior to introduction of the feature.
> > +
> > +* When KVM is used, MTE will default to off, so that migration will not
> > +  unintentionally be blocked.
> > +
> > +* Other accelerators currently don't support MTE.
> 
> Minor nits for the documentation:
> we should expand out "if and only if" -- not everybody recognizes
> "iff", especially if they're not native English speakers or not
> mathematicians.
> 
> Should we write specifically that in a future QEMU version KVM
> might change to defaulting to "on if available" when migration
> support is implemented?

Please make sure if you do something like that, that the failure
is obious; 'on if available' gets messy for things like libvirt
and higher level tools detecting features that are available and
machines they can migrate to.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

