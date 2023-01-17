Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2551848ejc;
        Tue, 17 Jan 2023 09:08:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEV8/B+usVq+XoG0wnrdgWU5hFOOwoRie3TrSdeQb1aPGqn/n+W5G/uvFNbzSmKdwgk9Fu
X-Received: by 2002:ad4:4b27:0:b0:534:251d:30c9 with SMTP id s7-20020ad44b27000000b00534251d30c9mr5569572qvw.48.1673975289391;
        Tue, 17 Jan 2023 09:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673975289; cv=none;
        d=google.com; s=arc-20160816;
        b=Hyi+U6pa4Ph5mtQf2AxuQORshYr1hZnFBQk28hx7snLKYMAaSsmUCxvQujtPKfJzhQ
         Rl1abT5xSetrVtKlV6p7zCdpJtAVMMtOBrqX4sn+QxTzZ1ccvYwo9O6/4pux7AJxgJvM
         FvOfRw5Oj8Nkiyng+wQup+A6xf03JARoqXGecC6YIDlviHevUVtKhsQxN0S2/1Lpt7Ik
         GBDySJetNS4RGL1GV2jAc77BQR39AI+8PDcqOSdP8FFlphewpzI0yViE2Jz+iwuAuwJz
         S3ALsymIBBD9wecmIGWSNzSY5o4uvEQuV9tw9FeZaGXICIMZGAu6oFCW4M776QPi2Ksf
         0aYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=zx3zKZFLOeTrJ4XYrt2hPvepxZ1+7gKs5QAOksY3UGw=;
        b=tB0z5eBm5UujW9/aWMCDmSf/njedPsrwh8F22mt0dwEgJUSNCFwrlmym4cX9ZZAmZa
         saJuF92U8/GzUO2FQ2WaKF4ldhqlleVccd6cQD/WvNlTX9F6Hcc2/9SPzFZ435fyChgJ
         uEp0BWHVS0BBq6UA3H2nN45gK6xsPFs6Z9OerIUWXzQjCHuWp77p/s74VH+LT7zh8IpX
         DixcOOBPhoU+dmywqpk0GRcDP66/3DWrGY5ah2qnNAgigTtmipLDrlVKT+o8SQRVhVbR
         dG3KCIYdQoP0cOGW9NAxWt/HcMkMB/ZGdW1ufIml+F7ZB/TNPBMA2hK8ZGUR9clGFRXP
         OPSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NfzLeJn2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk11-20020ad45d4b000000b004c6ebc735c5si6395297qvb.422.2023.01.17.09.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 09:08:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NfzLeJn2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHpR5-0006Uf-Sb; Tue, 17 Jan 2023 12:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pHpR4-0006UW-8L
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:07:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pHpR2-0004HO-GH
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 12:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673975262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zx3zKZFLOeTrJ4XYrt2hPvepxZ1+7gKs5QAOksY3UGw=;
 b=NfzLeJn2a9O6OJn4w+rCriPHNm9/T8dqwAzqTghQdU7HkeFQ4aUtkv5pIRmfYsGJ77deXa
 kHKCQn7PHEUW6aaf1i6B9WswyVWa+xQHb3KKu1P6NNmfEgtaA26i8rBBm2pD/NCflXRFKb
 UybvWJD7bFCW88wfHiqm2nqe9EMztB4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-5us2cJ4DMAiwhWVCxoUkpw-1; Tue, 17 Jan 2023 12:02:24 -0500
X-MC-Unique: 5us2cJ4DMAiwhWVCxoUkpw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AD8E1C29D65;
 Tue, 17 Jan 2023 16:59:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9481492B00;
 Tue, 17 Jan 2023 16:59:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>, Gavin Shan
 <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
In-Reply-To: <Y8bR7xrsCMr5z6xI@work-vm>
Organization: Red Hat GmbH
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
 <Y8bR7xrsCMr5z6xI@work-vm>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 17 Jan 2023 17:59:32 +0100
Message-ID: <877cxl85cb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Qf9jqJ7QiWqa

On Tue, Jan 17 2023, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
>> >
>> > Introduce a new cpu feature flag to control MTE support. To preserve
>> > backwards compatibility for tcg, MTE will continue to be enabled as
>> > long as tag memory has been provided.
>> >
>> > If MTE has been enabled, we need to disable migration, as we do not
>> > yet have a way to migrate the tags as well. Therefore, MTE will stay
>> > off with KVM unless requested explicitly.
>> >
>> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> > ---
>> >  docs/system/arm/cpu-features.rst |  21 +++++
>> >  hw/arm/virt.c                    |   2 +-
>> >  target/arm/cpu.c                 |  18 ++---
>> >  target/arm/cpu.h                 |   1 +
>> >  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
>> >  target/arm/internals.h           |   1 +
>> >  target/arm/kvm64.c               |   5 ++
>> >  target/arm/kvm_arm.h             |  12 +++
>> >  target/arm/monitor.c             |   1 +
>> >  9 files changed, 181 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
>> > index 00c444042ff5..e278650c837e 100644
>> > --- a/docs/system/arm/cpu-features.rst
>> > +++ b/docs/system/arm/cpu-features.rst
>> > @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
>> >  than the maximum vector length enabled, the actual vector length will
>> >  be reduced.  If this property is set to ``-1`` then the default vector
>> >  length is set to the maximum possible length.
>> > +
>> > +MTE CPU Property
>> > +================
>> > +
>> > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
>> > +presence of tag memory (which can be turned on for the ``virt`` machine via
>> > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
>> > +proper migration support is implemented, enabling MTE will install a migration
>> > +blocker.
>> > +
>> > +If not specified explicitly via ``on`` or ``off``, MTE will be available
>> > +according to the following rules:
>> > +
>> > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
>> > +  preserves the behaviour prior to introduction of the feature.
>> > +
>> > +* When KVM is used, MTE will default to off, so that migration will not
>> > +  unintentionally be blocked.
>> > +
>> > +* Other accelerators currently don't support MTE.
>> 
>> Minor nits for the documentation:
>> we should expand out "if and only if" -- not everybody recognizes
>> "iff", especially if they're not native English speakers or not
>> mathematicians.
>> 
>> Should we write specifically that in a future QEMU version KVM
>> might change to defaulting to "on if available" when migration
>> support is implemented?
>
> Please make sure if you do something like that, that the failure
> is obious; 'on if available' gets messy for things like libvirt
> and higher level tools detecting features that are available and
> machines they can migrate to.

I guess we can just keep the door open but decline walking through it if
we fail to come up with a good solution...

