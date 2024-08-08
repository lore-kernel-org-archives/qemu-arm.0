Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp537295njc;
        Thu, 8 Aug 2024 07:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVX0GYdifkZHgO/PKNeo2TPFr/pPT5IbjJA7L44GnskpFpf84fqF9ZfSRzVyEaH2cE7g2gpzRy9LRApzjR70ybi8Ye+x1xJ
X-Google-Smtp-Source: AGHT+IFiaCjx+qCTKjsKg9Q+kFjGwuFpJHaC3G2jkSbk7UzLQ5YU7FwDjrmFgywSy21AAsbu0KIv
X-Received: by 2002:a05:6214:3288:b0:6b0:77da:3ab6 with SMTP id 6a1803df08f44-6bd6bcbb451mr18221016d6.12.1723128391830;
        Thu, 08 Aug 2024 07:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723128391; cv=none;
        d=google.com; s=arc-20160816;
        b=llpfAyEzLLEGo07AyLUErZxSjRIocUTocsehBbY1V/+v9v87kA+XnyTvfg7f/hqzj7
         uK5jMNZOVhJWsRirNWFYS6xyuxS2ibsnUDMC4fusJl6XCq3a/NyY2oSbthQGjj74TNn2
         3xRGIvDFmYmXQOfamgRUIPdgEpJ70CwLTVPbGvQJ5M9suAIr9glLZvFdyUCI7xi+ZtMD
         v8fquyyUM5KaS9e6ykjeWQMOex2+hhS0DrJIjzjaO19lwrnb/N1dCkKPlfqmIMyQ/34i
         TtHc+LRZHmYPgsK2nQx6r81DW0WljbWnTbUUyEc5KTCBUp3oUueVQChBKsapMh6WBZVK
         sPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Vsy+kQPvnenW2/13lHMrZ1NDZEbx4ggdcgIqJP+YPxc=;
        fh=YO8bIUAmTt8lmYAcei6KP2TClaERN8c2OQ+rseJcZRk=;
        b=IB7r2mTQCx+0g31smlFOgKDSPSMT4ApV9TR4YahoGJAcVFJ1vQSUcjR5FnZQaYKtWv
         cury+dhtbqAMD+VxzVLJRZuXJiziS5P5J8OnmgcPvCE1ce0OUKw2UFOTI8bMGHHfYIPP
         u62JdTRZDS2XER2yAECgPZI4yZlEnbA0Pq9UKuyL3RJCtNKhn4iybmIdO+aH/jwIwUvX
         tAmeUrgSEtBLuhmoo7fdqlIMOAoyiVLJ7/LpiohXrlKbF71typNlCiFn7UA8H8J4fSCl
         8spaQx2t7fA2fFM2Lmn9su1ewkZTjXoLUZCHLetNBw5Zmess5z+J8FHTVVZy9BtMQMRJ
         fluA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Km7uZpIu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87da6e5si43475021cf.284.2024.08.08.07.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 07:46:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Km7uZpIu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sc4PE-0006Ag-Tb; Thu, 08 Aug 2024 10:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sc4P8-0005x9-V4
 for qemu-devel@nongnu.org; Thu, 08 Aug 2024 10:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sc4P5-00087X-DW
 for qemu-devel@nongnu.org; Thu, 08 Aug 2024 10:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723128360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vsy+kQPvnenW2/13lHMrZ1NDZEbx4ggdcgIqJP+YPxc=;
 b=Km7uZpIuvGpjK1h5hKMGMo+BaoO8yxDs5ZDmFWE6qU6KEtmVykE0wjW96QfMpzvl2KvkOB
 EWNuNAVoJZfKAw6V5kjITBhr/84gZB5NWVA5K4vzLL2mWBTMaed1UUOAIgjNpc2LjEYpDI
 w7sh54ipncV1lFAYREriWViGYOOtv7I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-qmltV5FpPnSUeIh-n7Lpfw-1; Thu,
 08 Aug 2024 10:45:57 -0400
X-MC-Unique: qmltV5FpPnSUeIh-n7Lpfw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 22A8F1955BC1; Thu,  8 Aug 2024 14:45:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DC8431959164; Thu,  8 Aug 2024 14:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8C41421E6682; Thu,  8 Aug 2024 16:45:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,  Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 linux-kernel@vger.kernel.org,  qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
In-Reply-To: <20240808162205.3a85efb6@imammedo.users.ipa.redhat.com> (Igor
 Mammedov's message of "Thu, 8 Aug 2024 16:22:05 +0200")
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
 <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
 <87v80b1jqe.fsf@pond.sub.org> <20240808161141.5ffe730e@foz.lan>
 <20240808162205.3a85efb6@imammedo.users.ipa.redhat.com>
Date: Thu, 08 Aug 2024 16:45:51 +0200
Message-ID: <87ikwbrs2o.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4cdag/8ku0wu

Igor Mammedov <imammedo@redhat.com> writes:

> On Thu, 8 Aug 2024 16:11:41 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
>> Em Thu, 08 Aug 2024 10:50:33 +0200
>> Markus Armbruster <armbru@redhat.com> escreveu:
>> 
>> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:  
>> 
>> > > diff --git a/MAINTAINERS b/MAINTAINERS
>> > > index 98eddf7ae155..655edcb6688c 100644
>> > > --- a/MAINTAINERS
>> > > +++ b/MAINTAINERS
>> > > @@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
>> > >  F: include/hw/acpi/ghes.h
>> > >  F: docs/specs/acpi_hest_ghes.rst
>> > >  
>> > > +ACPI/HEST/GHES/ARM processor CPER
>> > > +R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> > > +S: Maintained
>> > > +F: hw/arm/ghes_cper.c
>> > > +F: hw/acpi/ghes_cper_stub.c
>> > > +F: qapi/ghes-cper.json
>> > > +    
>> > 
>> > Here's the reason for creating a new QAPI module instead of adding to
>> > existing module acpi.json: different maintainers.
>> > 
>> > Hypothetical question: if we didn't care for that, would this go into
>> > qapi/acpi.json?  
>> 
>> Independently of maintainers, GHES is part of ACPI APEI HEST, meaning
>> to report hardware errors. Such hardware errors are typically handled by 
>> the host OS, so quest doesn't need to be aware of that[1].
>> 
>> So, IMO the best would be to keep APEI/HEST/GHES in a separate file.
>> 
>> [1] still, I can foresee some scenarios were passing some errors to the
>>     guest could make sense.
>> 
>> > 
>> > If yes, then should we call it acpi-ghes-cper.json or acpi-ghes.json
>> > instead?  
>> 
>> Naming it as acpi-ghes,acpi-hest or acpi-ghes-cper would equally work
>> from my side.
>
> if we going to keep it generic, acpi-hest would do

Works for me.

>> > >  ppc4xx
>> > >  L: qemu-ppc@nongnu.org
>> > >  S: Orphan    
>> > 
>> > [...]
>> >   
>> > > diff --git a/qapi/ghes-cper.json b/qapi/ghes-cper.json
>> > > new file mode 100644
>> > > index 000000000000..3cc4f9f2aaa9
>> > > --- /dev/null
>> > > +++ b/qapi/ghes-cper.json
>> > > @@ -0,0 +1,55 @@
>> > > +# -*- Mode: Python -*-
>> > > +# vim: filetype=python
>> > > +
>> > > +##
>> > > +# = GHESv2 CPER Error Injection
>> > > +#
>> > > +# These are defined at
>> > > +# ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
>> > > +# (GHESv2 - Type 10)
>> > > +##    
>> > 
>> > Feels a bit terse.  These what?
>> > 
>> > The reference could be clearer: "defined in the ACPI Specification 6.2,
>> > section 18.3.2.8 Generic Hardware Error Source version 2".  A link would
>> > be nice, if it's stable.  
>> 
>> I can add a link, but only newer ACPI versions are hosted in html format
>> (e. g. only versions 6.4 and 6.5 are available as html at uefi.org).
>
> some years earlier it could be said 'stable link' about acpi spec hosted
> elsewhere. Not the case anymore after umbrella change.
>
> spec name, rev, chapter worked fine for acpi code (it's easy to find wherever spec is hosted).
> Probably the same would work for QAPI, I'm not QAPI maintainer though,
> so preffered approach here is absolutely up to you.

A link is strictly optional.  Stable links are nice, stale links are
annoying.  Mauro, you decide :)

Thanks!

[...]

