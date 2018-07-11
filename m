Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp588301wrq;
        Wed, 11 Jul 2018 12:59:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfXSGwWoyrb/PhOHhU5Ox++GbYpd1OOY64jRhiLvfSL6m/vdNQzGmvsOf00YDf2sgQdIfO9
X-Received: by 2002:a0c:d1b7:: with SMTP id e52-v6mr47155qvh.41.1531339178690;
        Wed, 11 Jul 2018 12:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531339178; cv=none;
        d=google.com; s=arc-20160816;
        b=RDU48pZLAxrWG0uVdXATxHz/0vGFw0xwapq6aoaVdtwpH4/RWoYb+jjbSHgPXQwY9L
         5STbwTsneDplBqJFxNv3ovjbzCG+BKlJtadNHWyDs9UBcVZXHlcLHkI6BKCNzg/pb0uV
         KED27mfuL6yrCNAI8yty0Hxur9MgsOMV4gzX87ln1nZtRKpaM/crmAFdHK26L9YGCssn
         1VfkcdegF67tzQf9aj+4YLC6skdxEDyADRKr/W6BtkxsFIX8bvtr+Aid2aA+T62bxNvb
         LtIE2sgVojCSmnPOvTQqzMNId/+/WD/mjpPR7IkMcMGUt57I/DcIJS/O1kLAdNbsOIKu
         fKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=lE+fv7AEj09qusaQIBQt48VYIbnHcfHAhFuxZIadPcE=;
        b=Z/CSNwxxPqvLVFYdrqliM37VjyvIDDIui+SdT+wqjA0/WBDLE/Hl2jlcQvFswSgDm2
         w0WzAgNeyWSr31tu3GvS/3OFRnZd6nAS2w7zQ41M9L8ws3aRFeT53V4SdIiNSrfsfeZy
         01EnTb8vMofUa+c6Je7VIuS+8vwa6Kfp5obTUJg7kHZ3ThJq7DRpsqS1z405A1FNmib7
         oaOWTeLWT+8+fc945KH9iR7fc5ub9dcx3w3SUeBR53aCCjq8pXFMX1TzFbaJdWxb0Hu8
         dOaiB6fRDgJkqefgsE8SzJ0AwHk18yXcvZrqRv/XP9rdqAjCPzgVElnRsQJYRjoW3PUy
         K/9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17-v6si11797664qke.378.2018.07.11.12.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 12:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdLH0-00068G-6Y
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 15:59:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdLGt-00067x-0S
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 15:59:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdLGp-0004EY-VJ
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 15:59:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50880)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdLGp-0004EB-Oh; Wed, 11 Jul 2018 15:59:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFE9B80F8E;
	Wed, 11 Jul 2018 19:59:26 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67D79600D1;
	Wed, 11 Jul 2018 19:59:25 +0000 (UTC)
Date: Wed, 11 Jul 2018 16:59:24 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180711195924.GC7451@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<955f26d7-5a0b-28e0-bd0f-f663593afefe@redhat.com>
	<1be41104-d896-b03b-e0f3-47ea9c3b333f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be41104-d896-b03b-e0f3-47ea9c3b333f@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 11 Jul 2018 19:59:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WiDzQugv+gJ

On Wed, Jul 11, 2018 at 09:04:35PM +0200, Thomas Huth wrote:
> On 11.07.2018 19:21, Paolo Bonzini wrote:
> > On 10/07/2018 08:50, Peter Maydell wrote:
> >>>> Yuck. The real problem here is that we're still requiring the
> >>>> code that creates these QOM devices to manually set the parent
> >>>> in the first place. It's not surprising that we don't get it right
> >>>> (either parenting in the wrong place or not at all). I'd much
> >>>> rather see us fix that properly than keep papering over places
> >>>> where we get it wrong.
> >>> Sorry, I'm still not an expert in all this QOM stuff yet ... so what do
> >>> you exactly recommend to do instead?
> >> I'm not clear either, but I don't think that what we're
> >> currently doing can be right.
> > 
> > Well, in theory it should work...  I sent the expected flow in another email.
> 
> Something that just came to my mind:
> 
> bcm2836_init() creates the TYPE_BCM2835_PERIPHERALS object with
> object_initialize(). This creates one reference to the object already.
> Then the object is linked to its parent with
> object_property_add_child(), which creates another reference to the
> object. But where are the two references correctly destroyed again? One
> is certainly destroyed by device_unparent later, but the initial one?
> Could it be that we are simply lacking one object_unref() after the
> object_property_add_child() here?

This seems to be true, but I'm confused about the reference
counting model, here:

What exactly guarantees there will be no other references to
(e.g.) `&s->control` when `s` is freed?

We know the references added by object_initialize(),
object_property_add_child() and qdev_set_parent_bus() will be
dropped, but what about other code calling object_ref()?

-- 
Eduardo
