Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2555646ejc;
        Tue, 17 Jan 2023 09:12:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvH9onxLGhvd/Exh0ljM3vwBqOhW99SAf2HDrOv0E/EwOd6vLUgrGlrBxYcNxGw1Zq4uJk0
X-Received: by 2002:a81:5cc4:0:b0:4eb:2bf1:9c22 with SMTP id q187-20020a815cc4000000b004eb2bf19c22mr8145563ywb.10.1673975552596;
        Tue, 17 Jan 2023 09:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673975552; cv=none;
        d=google.com; s=arc-20160816;
        b=CGnBJq6/jusaGXxV97wq17YpTNfRqEPudaM9Dk20b88X2NbBuqRvD0ZX0vgVpzuCD8
         kzv6j6RvlxM4a/FBMpwj0yGKhkJVcyDztIjvylu3N6bZ8p/pvVlsdtQ7VeBAnS7bJVt9
         Msx+RUWsWLJmlVyi2AVqfBbxypCSRtFWbMUZ4jGaqzk7dYrJ3GQmlYconyCQzWpeqn6p
         Ss3b6+F5mxt7EBKXGofQn/CBBMauPWS5fMgvHkt9jusjJNosCn58OMorCnRV5zJkOzdX
         Mlc9kQg8w4mfrlBuDa0JxeL7Gd8O0bJbLiLG6zy//iNsNRh5yIZ3hwvuYEfDDif0K7Gl
         +68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=/xT2F+gCG0Rjzumy1UFOyArPW6tPSIn20KE3KJxQnIc=;
        b=MbDnptljK4QL9v/q2FeQVi2lCrEWIDaAGInTgXL98esY6R8kJVU7z52cluJzNoJePM
         DZwAa0YzPFF2l9vgUoYN7xczCeLLjapf8X189DNsuU6SWVjRgFRx68KSSS8zqBTRGjFR
         SjxrAxUQTr7i7aVqrxmejj3bl0VworOKXhB1nNy2Z6zK2LALEMimRRkHJupr6b7kIDPG
         Oh5h9DLIQACBiS4tIQd55O2WeOKumis2jl7z3EhcVTieGymBbXKgRknR4dNgDh372SbG
         7pqRowLhD+CsaMGPyayC8t9ET90043gLasEubwbaH6cvQr4LqJLuGEFOVK+XY6pXSi6X
         dM7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BzRazB/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05620a240600b006fa67fe937dsi19478969qkn.401.2023.01.17.09.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 09:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BzRazB/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHpVY-0002KT-9X; Tue, 17 Jan 2023 12:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHpVS-0002CN-6J
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHpVM-00056m-Ty
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673975525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/xT2F+gCG0Rjzumy1UFOyArPW6tPSIn20KE3KJxQnIc=;
 b=BzRazB/f1xB4mHYa40Yfrniu98W5VOp/+CMSAUquWcX7V1yxO4LzHqvBpMFBBROsEz9HaL
 E8QnALH/Q3UR/x61nA04WpkydRWJPR7J0Ku0+pSGdkRK7J8PX8OijHO1h+3IjnwzbgOvcW
 MS8IFu8ywjPR60W/3phNkwDTG9HeVD8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-dGRvR96TOPKYiP8Mj9f_xQ-1; Tue, 17 Jan 2023 12:11:46 -0500
X-MC-Unique: dGRvR96TOPKYiP8Mj9f_xQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j11-20020adfa54b000000b002bd9b1e1656so4763207wrb.15
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 09:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xT2F+gCG0Rjzumy1UFOyArPW6tPSIn20KE3KJxQnIc=;
 b=QxLPk2CDElLl4/XVUpYHbZhJDZzD+ZNH2/2aurs0awYrkwvI1XnJCM4vjbMVV6Meul
 PJQjYYhhh399Jt4D2glcZDuAAsXCXfwloOyDUT4NJt+xDe1UBz38aYGApaIe+hGBeflU
 jWxyMcnQGCNvbKkSH9Jgxyh2nDsWYQEV08+Wheugoa4qYbLHPW+0yrDNpifXOAILtQlH
 ZH/7jM9w5W/t1zm147WsDwTFETHlHMi1we+am7GMerK3vhVUcEEDhpgN3Af64dBBI/9V
 I1qsFx1OynKdKoy3gXgzOd04K79ig42+TKi9e7/7NMUAHZJ98kDxonpZhmQH/F31q109
 Lp3g==
X-Gm-Message-State: AFqh2kp0esI78tXsUNc7lrXJiKI+PydKdY0r9HQcG1Ix4WMa6Rrwiq/n
 aSB2HOU2gD0GnKv/m3fq6VA+ahUQxCbdD+Xky8wLyGHxAKIDI+HNr+QP8xvNwirx3sCT2lslN3p
 frDOE0jts5NHb
X-Received: by 2002:a05:600c:3d86:b0:3d2:3761:b717 with SMTP id
 bi6-20020a05600c3d8600b003d23761b717mr3645145wmb.37.1673975504121; 
 Tue, 17 Jan 2023 09:11:44 -0800 (PST)
X-Received: by 2002:a05:600c:3d86:b0:3d2:3761:b717 with SMTP id
 bi6-20020a05600c3d8600b003d23761b717mr3645117wmb.37.1673975503770; 
 Tue, 17 Jan 2023 09:11:43 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003da2932bde0sm15811861wmq.23.2023.01.17.09.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:11:43 -0800 (PST)
Date: Tue, 17 Jan 2023 17:11:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Message-ID: <Y8bWzZe4svHOmdvd@work-vm>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
 <Y8bR7xrsCMr5z6xI@work-vm> <877cxl85cb.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <877cxl85cb.fsf@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WLelKvizsBYw

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Tue, Jan 17 2023, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> >> >
> >> > Introduce a new cpu feature flag to control MTE support. To preserve
> >> > backwards compatibility for tcg, MTE will continue to be enabled as
> >> > long as tag memory has been provided.
> >> >
> >> > If MTE has been enabled, we need to disable migration, as we do not
> >> > yet have a way to migrate the tags as well. Therefore, MTE will stay
> >> > off with KVM unless requested explicitly.
> >> >
> >> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> > ---
> >> >  docs/system/arm/cpu-features.rst |  21 +++++
> >> >  hw/arm/virt.c                    |   2 +-
> >> >  target/arm/cpu.c                 |  18 ++---
> >> >  target/arm/cpu.h                 |   1 +
> >> >  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
> >> >  target/arm/internals.h           |   1 +
> >> >  target/arm/kvm64.c               |   5 ++
> >> >  target/arm/kvm_arm.h             |  12 +++
> >> >  target/arm/monitor.c             |   1 +
> >> >  9 files changed, 181 insertions(+), 13 deletions(-)
> >> >
> >> > diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> >> > index 00c444042ff5..e278650c837e 100644
> >> > --- a/docs/system/arm/cpu-features.rst
> >> > +++ b/docs/system/arm/cpu-features.rst
> >> > @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
> >> >  than the maximum vector length enabled, the actual vector length will
> >> >  be reduced.  If this property is set to ``-1`` then the default vector
> >> >  length is set to the maximum possible length.
> >> > +
> >> > +MTE CPU Property
> >> > +================
> >> > +
> >> > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> >> > +presence of tag memory (which can be turned on for the ``virt`` machine via
> >> > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> >> > +proper migration support is implemented, enabling MTE will install a migration
> >> > +blocker.
> >> > +
> >> > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> >> > +according to the following rules:
> >> > +
> >> > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> >> > +  preserves the behaviour prior to introduction of the feature.
> >> > +
> >> > +* When KVM is used, MTE will default to off, so that migration will not
> >> > +  unintentionally be blocked.
> >> > +
> >> > +* Other accelerators currently don't support MTE.
> >> 
> >> Minor nits for the documentation:
> >> we should expand out "if and only if" -- not everybody recognizes
> >> "iff", especially if they're not native English speakers or not
> >> mathematicians.
> >> 
> >> Should we write specifically that in a future QEMU version KVM
> >> might change to defaulting to "on if available" when migration
> >> support is implemented?
> >
> > Please make sure if you do something like that, that the failure
> > is obious; 'on if available' gets messy for things like libvirt
> > and higher level tools detecting features that are available and
> > machines they can migrate to.
> 
> I guess we can just keep the door open but decline walking through it if
> we fail to come up with a good solution...

Yeh; at least make sure that any migration failure gives an obvious
message in the log.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

