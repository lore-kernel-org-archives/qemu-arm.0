Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1778060lfm;
        Thu, 30 Apr 2020 05:00:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyR0yAyKm9PD7DDEF52Py3TvaR6xStf52y5LFr2VXgAvdZrpGl0o4RgMeCY6i5maPTIBCX
X-Received: by 2002:aa7:c401:: with SMTP id j1mr2204628edq.31.1588248057203;
        Thu, 30 Apr 2020 05:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588248057; cv=none;
        d=google.com; s=arc-20160816;
        b=bioTDDpaUYE6AotCKng98DnEbRNl3/haQAA0M/m4uZ5QWn3VAwfK4IdwuthLRHiBN8
         zuyC45sw/yTOjIqPzQolTF1gcndR1W9oBGpos4iTA9C55otZGT7aTGdFufkVXxVhhK5j
         pPg6gdLBsFmCGzxLtgUgNCu05n7ArhmKc/2tvKviMKVn0mGP88+3zDu2/zFhpgQDhRBe
         I8Cv85bzfn0FOkISR+99lskB8SgrhlQqvuoVf7rqVWNh2KMAj3DIOiz417fM2mDw/gGG
         DKVUlsmFH4h6NaUXAZVlOSS2eHjBHokHZ82jdBPSf6r50K4sNbZJ+1x+1nC33gRp+0Kb
         oCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Rmi4mrxC2kjMximJG37kVyYsvSASF6Fbw0o5LGCNJAw=;
        b=gtpUVKAB+CpFNPLxBKB/Tp+vlFJqBHAFmd1nX9kxVIoJmFWoZC7liOvELwxsBXQYr+
         SCPfDAXre+SCIukA4pM6nM8lNkJFIDpphsAT6qX7atCAOkzUhjScmf4dd9pRWGhhwmAd
         bLIA+urFFP7/tM4FUhsuZHp3h2iGB0EDenuUAr/6Mhl5o75zzzXrkQuHuxQoU37I6sVC
         HWgUnnjHDPqAwNUQnYlVMKoLSQXdkY3GzYb2Nqjso9kjY+vNBBLf4zR6blmQc9wooux2
         fZSir3FCQPM4NS/z6OLa7gsYMeObTF/59gxG0idTBGDOCzpH0K3okn4V8IOP1UC4X1Qd
         BZrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AyUiISrq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id d22si4903257edj.11.2020.04.30.05.00.57;
        Thu, 30 Apr 2020 05:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AyUiISrq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgD3MAx (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 30 Apr 2020 08:00:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29604 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726819AbgD3MAw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 30 Apr 2020 08:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588248051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rmi4mrxC2kjMximJG37kVyYsvSASF6Fbw0o5LGCNJAw=;
        b=AyUiISrq/66B8yL7BjdZMM9icUsB7sSS2TMOqQsGvJGeSI+GJwPzFplDh5q4d6XBz861H/
        GxsnmGwRvy1N676u5HUOqxdS9E/fAe4zT2uzJY8ib6gLMyPuUaCLZUnXiBrByV7acnOYYa
        2Uww2sPJ3WcdkgEKc+dVQgc5VZLiJk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-OxUvUlMMOUKVMeXULKMzAA-1; Thu, 30 Apr 2020 08:00:35 -0400
X-MC-Unique: OxUvUlMMOUKVMeXULKMzAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FCAAEC1A3;
        Thu, 30 Apr 2020 12:00:33 +0000 (UTC)
Received: from localhost (unknown [10.40.208.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8EDE5610AF;
        Thu, 30 Apr 2020 12:00:17 +0000 (UTC)
Date:   Thu, 30 Apr 2020 14:00:16 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Fam Zheng <fam@euphon.net>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Linuxarm <linuxarm@huawei.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
Message-ID: <20200430140016.0799afd7@redhat.com>
In-Reply-To: <9906359a-cc13-fd7f-1cd3-c80c0ee90d09@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
        <CAFEAcA9oNuDf=bdSSE8mZWrB23+FegD5NeSAmu8dGWhB=adBQg@mail.gmail.com>
        <9906359a-cc13-fd7f-1cd3-c80c0ee90d09@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: GMJFWb2eq2p+

On Thu, 30 Apr 2020 11:56:24 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> On 2020/4/17 21:32, Peter Maydell wrote:
> > On Fri, 10 Apr 2020 at 12:46, Dongjiu Geng <gengdongjiu@huawei.com> wrote:  
> >>
> >> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA)
> >> and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed
> >> information of guest, so it is expected that guest can do the recovery. For example, if an
> >> exception happens in a guest user-space application, host does not know which application
> >> encounters errors, only guest knows it.
> >>
> >> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> >> After user space gets the notification, it will record the CPER into guest GHES
> >> buffer and inject an exception or IRQ to guest.
> >>
> >> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> >> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> >> notification type after recording CPER into guest.  
> > 
> > Hi. I left a comment on patch 1. The other 3 patches unreviewed
> > are 5, 6 and 8, which are all ACPI core code, so that's for
> > MST, Igor or Shannon to review.  
> 
> Ping MST, Igor and Shannon, sorry for the noise.

I put it on my review queue 

> 
> > 
> > Once those have been reviewed, please ping me if you want this
> > to go via target-arm.next.
> > 
> > thanks
> > -- PMM
> > 
> > .
> >   
> 
