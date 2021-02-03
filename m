Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp305727lfo;
        Wed, 3 Feb 2021 07:11:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJZuTUy55VQ/N6mJlLlYYs4B8LwJ5iHhiC9U41FBW64c/H825XZojna6ZPgysM5WjQAFYE
X-Received: by 2002:ab0:6e4:: with SMTP id g91mr2079255uag.20.1612365083451;
        Wed, 03 Feb 2021 07:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612365083; cv=none;
        d=google.com; s=arc-20160816;
        b=F+J6r15CCZ3K2pQpx2vLJ+BZxggAii1Ps8zs6iSv9z21punKe1CUCsTFI95BVVTTzC
         tYKghQ6RG6re2eee6nFRfS+yoj7YMheRnXxs/uUsg42dpYVWcy8vC+JDE56EaLf/eHmy
         mnvaV0/HQumtU51FD76chwMvC6LDHey7n5Ta33D9jnjzXCfuSq+mZGdyI9xurUKnIHRZ
         kk4dPaM4KeIqOUSvP+fk0uHmh1YKLqhReDWt3wqrIJjOzE1gD+55XRSmiGdFK0Ztagm3
         jeReip59Oen9nhUlzYPHzOOg1/pOOXM/QCPYoL6b1ywEDCMPbgxUDoKlJaoYggTFYmiD
         WgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=UVqe9cxC/m6VcfnnUGqLOcKRO5UCgaV+uyZKsrd3sw8=;
        b=kChflE92Rywiqj8L8U9pStF2gMbHRB8u87u5K6zvhd9z7sL+hUKP8/JOEhRu1yzwEF
         9A67hcWZEfOcsS5nHzk7PGi1IaPwy1+vbfW0oWrMfJK5Z+cCwI+pbwIhbuTRj2KNq8KQ
         zashQjX6yiq5dugy0nOe+NMlg/QnsRg609y9swIK084gHZgiTmSKTn4rqCP9f50h7aCD
         LjeWLna30XjxAeSkWQT/xkj2hDWJWFddPLuFQJDGy/SbDYHXPpgD9eXC3lwYjypweEMa
         ZBoKvi3PNq0eJ1wTpiigtoci159YnE/WqP2zW7fMWH5VaCOuVmHwkj0cnDnm7fnu0VRX
         n/Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LGyIwgV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si259423vsa.162.2021.02.03.07.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 07:11:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LGyIwgV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7JoQ-0008TP-OZ
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 10:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7JoH-0008Qt-Pq
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7JoE-0005Oa-K2
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612365069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVqe9cxC/m6VcfnnUGqLOcKRO5UCgaV+uyZKsrd3sw8=;
 b=LGyIwgV1u4bCT67grJyk7rt/DLZXoZxNC0VMJIH1SneytdZt2QqzjYhXnd8DGVio9pQOEM
 qO4RObidR7u8sSYEaQMqEXGeq0QiDbAFaOiWWP5NssTcxGyya6AZt+nUFCXkoMee+A+fUl
 rsSMuUZjJLxh0KI+o5+sFIuryG8vyiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-V-1ekkHsM3-HBNrf21gTFQ-1; Wed, 03 Feb 2021 10:11:05 -0500
X-MC-Unique: V-1ekkHsM3-HBNrf21gTFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B5779ECB;
 Wed,  3 Feb 2021 15:11:02 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D786267F;
 Wed,  3 Feb 2021 15:10:56 +0000 (UTC)
Date: Wed, 3 Feb 2021 15:10:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <20210203151053.GK2950@work-vm>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
 <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
 <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5sBiA4jAdmC

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> On 2/3/21 3:58 PM, Aaron Lindsay wrote:
> > On Feb 03 10:01, Peter Maydell wrote:
> >>> The third is that meanings of the bits in env->features (as defined by
> >>> `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> >>> ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> >>> ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> >>> added since 4.1.0. Heck, even I have added a field there in the past.
> >>> Unfortunately, these additions/removals mean that when env->features is
> >>> saved on one version and restored on another the bits can mean different
> >>> things. Notably, the removal of the *VFP features means that a snapshot
> >>> of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> >>> ARM_FEATURE_M on 5.2.0!
> >>
> >> Ow. I didn't realize the env->features was in the migration state :-(
> >> There is no reason for it to be, because it's a constant property
> >> of the CPU. The easy fix is to replace
> >>        VMSTATE_UINT64(env.features, ARMCPU),
> >> in target/arm/machine.c with whatever the syntax is for "ignore
> >> 64 bits of data here". Then we'll ignore whatever is coming in
> >> from the source, which we don't need, and we'll stop sending it
> >> out if we're the destination.
> > 
> > I'll look into this.
> 
> I think this is:
> 
>   VMSTATE_UNUSED(sizeof(uint64_t))

It's interesting that on x86 we've got a longterm request to *add* cpu
features to the stream to detect screwups caused by using mismatched
CPUs; so it's not necessarily a bad idea to include it once you realise
it's there.

Dave

> > 
> > -Aaron
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

