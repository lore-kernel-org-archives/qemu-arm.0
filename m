Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4687821lfq;
        Tue, 22 Sep 2020 01:19:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2asyVI25Ya5I5L+GcOlj+tl9bVcVjL9Fpmu0E+liC2K9b6T8fGMh3smT0yUth7Zv7fesc
X-Received: by 2002:a17:906:aac7:: with SMTP id kt7mr3600923ejb.548.1600762779333;
        Tue, 22 Sep 2020 01:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600762779; cv=none;
        d=google.com; s=arc-20160816;
        b=zol0OvjyN6GTdKDYiT6rqe/KHX5KlWrjxtj7/MVQgvImTfMgD9q1oufo33dFYsDNro
         9OIXTZleQCqdxilD3AiLSIHDR8GeH2mhOYP4b1nGVfsaEEslhheL4D5e+x5rSwVvsJvw
         +iv8NsLdqsIgv/7sEk9qPRFlAlpK0WsXEWSdqAVMzZqTeS8Jvm2ZOrxu3peU4bdVKklf
         poS8NhqnQbd9w7A8OjrMAxCqpMA0Porw3lpYypZn+r/fZv/Ld2CZa3AVxNbbpJywQh11
         kNBPd0so1BtWiQHWPuiaPI3erkeyWrOrbC/ikLiWBeeaMYN/sztG0tOt/11SNCnbvxBZ
         lVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4YxfviHUp394Z95tLmiMsBjGp7nI/wBJIRQLvk3IHGM=;
        b=wEdjBag0Ag8mnJ4RT31dPyCAA16tfpNOAS6xcBfod29yDh2y7eEKcY70kXyKGzqFCD
         ZI0ODl2dJS8nm0OV49OR7AsaofuZxoQ4ISTsFry85BgOID/p4WBmNZWviTNsvY8AnUzC
         Hj9ytvoCODU8XcX1i7Fq517pL7SwYdJvvvksV/v+JVM5ozHATj1l/UeuX4P2cIvyCV1k
         IsCkOCypsFn3znBWZ/dYNb1cfu/V97x+8EHsQHHlYzCH4cdc0Uw1EZkK92lTpK8sKysV
         SwmoxCv01r9FKSIrLRFLZ0xbGLnXpkLB8Vplf3CCRbSfD5ju3UGKgwFML0lX1X/MNuzd
         6v3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G6yqo5rn;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id c8si10941884edn.87.2020.09.22.01.19.39;
        Tue, 22 Sep 2020 01:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G6yqo5rn;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgIVITi (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 22 Sep 2020 04:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55585 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726483AbgIVITh (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 22 Sep 2020 04:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600762776;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=4YxfviHUp394Z95tLmiMsBjGp7nI/wBJIRQLvk3IHGM=;
        b=G6yqo5rn/OXcWbNArHhAkvUvGkR21dftZ8YcEO9u/bNEgfiUhjF8z8BUUggLxtzKMrtFi3
        9o4LHsv9lhQEhovHYIgtBiHqRBSnc44rrNvK2p8MyK00Z3voEq63sF+cXXLW6EyNA11/ak
        irTH5UNiO+/H/3W7JAM52SSIkQzmnlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-sAd04_3bMH6jFWidZ6f72A-1; Tue, 22 Sep 2020 04:19:34 -0400
X-MC-Unique: sAd04_3bMH6jFWidZ6f72A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C107D57053;
        Tue, 22 Sep 2020 08:19:29 +0000 (UTC)
Received: from redhat.com (ovpn-114-64.ams2.redhat.com [10.36.114.64])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D54905C225;
        Tue, 22 Sep 2020 08:18:52 +0000 (UTC)
Date:   Tue, 22 Sep 2020 09:18:49 +0100
From:   Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
        Fam Zheng <fam@euphon.net>,
        Peter Maydell <peter.maydell@linaro.org>,
        sheepdog@lists.wpkg.org, kvm@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Yuval Shaia <yuval.shaia.ml@gmail.com>,
        Markus Armbruster <armbru@redhat.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Alberto Garcia <berto@igalia.com>,
        Sagar Karandikar <sagark@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Juan Quintela <quintela@redhat.com>,
        Jiri Slaby <jslaby@suse.cz>, Paul Durrant <paul@xen.org>,
        Michael Roth <mdroth@linux.vnet.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Huth <thuth@redhat.com>,
        =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Liu Yuan <namei.unix@gmail.com>, qemu-riscv@nongnu.org,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        John Snow <jsnow@redhat.com>,
        Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
        Richard Henderson <rth@twiddle.net>,
        Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Cornelia Huck <cohuck@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Max Reitz <mreitz@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        xen-devel@lists.xenproject.org,
        Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
Message-ID: <20200922081849.GD1989025@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200921162346.188997-1-stefanha@redhat.com>
 <c8892b73-6cee-9fd3-54b0-289149926041@redhat.com>
 <52b8a46e-ab9e-1645-163d-497122ece907@redhat.com>
 <8610ca0e-0b3f-6d95-43b9-e2e49571e311@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8610ca0e-0b3f-6d95-43b9-e2e49571e311@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 0+bfdkfOYgc4

On Tue, Sep 22, 2020 at 08:56:06AM +0200, Paolo Bonzini wrote:
> On 22/09/20 08:45, David Hildenbrand wrote:
> >> It's certainly a good idea but it's quite verbose.
> >>
> >> What about using atomic__* as the prefix?  It is not very common in QEMU
> >> but there are some cases (and I cannot think of anything better).
> >
> > aqomic_*, lol :)
> 
> Actually qatomic_ would be a good one, wouldn't it?

Yes, I think just adding a 'q' on the front of methods is more than
sufficient (see also all the qcrypto_*, qio_* APIs I wrote). The
only think a plain 'q' prefix is likely to clash with is the Qt
library and that isn't something we're likely to link with (famous
last words...).

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
