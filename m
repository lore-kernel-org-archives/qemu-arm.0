Received: by 10.223.159.82 with SMTP id f18csp1851605wrg;
        Fri, 24 Nov 2017 01:55:38 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYujAY7e2pWqcz1ifmnutXgAE4thQsa3yEizgqEWhhTaV47hE1LCHxHwt/WyN2+3cJtRLha
X-Received: by 10.13.223.138 with SMTP id i132mr17621364ywe.452.1511517338633;
        Fri, 24 Nov 2017 01:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511517338; cv=none;
        d=google.com; s=arc-20160816;
        b=UoquE1K88/bLMyHdDR9/9ElrYtwDPpVWXIeB1nO4FsMbS0FSY87mC2wQ9VdEjHgIFb
         QivxEl7MeNSh+q1Gni6bXAK5FpBMdILGi45v8cGkVef+o11Z4Hg5Xp0WCS60tX9Vd27m
         7U4TF8vYdHZba+D1SW+NA1NgiWMqEVMj/rsk8ubAhQtyc6RVRjQsjXv9aZU0cr9Ugndu
         SkD9yVhJGPrT1qDd8pLwil42FWUQo4VidtM7RXg9s0bVfJnhzCdwikFtDU8N6Em5NvyB
         fMSPSpnda0TR/sq9I87YYl5NhFL81QDFfUwLOR8LlRCxDrv5128Bxn5Y+wghKT7gwVos
         ANWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=1ROwR0+/QV/venit7a90QLYuJ3rwNqFsK7HusvK//L4=;
        b=Jy2XWjEEv97Y47d2TMrh2ajZV0bvaKZ8fqKu6JkVz3HYA4I6pXoVnEmaQvsiOQTahh
         Lu8R205Rh71oTTiwyMe6wWRGscjuj63lZdMopRjIH/cj9u+vh1/v10n9ksFFREZzZWSg
         ThWqOq+Uz5pNBXIimvSY0XnbUe5/4gMR3Z8kpHeu7X/0grWQIc21bfC7nY1vdQdH3Fy4
         R+NyVYK0EA82AlOnMkiYdbF2zr2BxN9LBYS+/zoRAZPNC/RhZfCbzFvx9pBIARNReC3x
         dRdn5DXWsxq6xP+wXn3x3SbA3hYtcPYlzA8Z5nGpCQEWqsWwVfG82p5N8uHZCD4W2QMH
         q12Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si4156506ybd.70.2017.11.24.01.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 01:55:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIAhu-0006K5-4T
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 04:55:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eIAhc-0006Js-RN
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 04:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eIAhY-0004MM-LC
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 04:55:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1eIAhY-0004Lq-E7; Fri, 24 Nov 2017 04:55:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31ECA4902F;
	Fri, 24 Nov 2017 09:55:15 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16FB1600C0;
	Fri, 24 Nov 2017 09:55:08 +0000 (UTC)
Date: Fri, 24 Nov 2017 10:55:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <20171124105506.71d6e909.cohuck@redhat.com>
In-Reply-To: <619fb88b-7ab1-a48a-a82c-53c21c691807@de.ibm.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
	<1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
	<CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
	<20171123181402.627fd5df.cohuck@redhat.com>
	<f3a550ab-5eff-1c9c-15e0-32ac70a4c2a6@redhat.com>
	<619fb88b-7ab1-a48a-a82c-53c21c691807@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 24 Nov 2017 09:55:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 0/4] vITS Reset
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	wanghaibin.wang@huawei.com, wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G+RA6csLhZSf

On Thu, 23 Nov 2017 19:01:46 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 11/23/2017 06:44 PM, Auger Eric wrote:
> > Hi Cornelia, Peter,
> > 
> > On 23/11/17 18:14, Cornelia Huck wrote:  
> >> On Thu, 23 Nov 2017 17:01:32 +0000
> >> Peter Maydell <peter.maydell@linaro.org> wrote:
> >>  
> >>> On 23 November 2017 at 16:05, Auger Eric <eric.auger@redhat.com> wrote:  
> >>>> When using update-linux-headers.sh I get suspicious errors at the end:
> >>>> grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
> >>>> directory
> >>>> sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
> >>>> file or directory
> >>>>
> >>>> and include/standard-headers/asm-s390/virtio-ccw.h deletedch
> >>>>
> >>>> I would prefer having s390 people checking and testing that.    
> >>>
> >>> I think the kvm_virtio.h problem should be fixed by
> >>> http://patchwork.ozlabs.org/patch/838230/
> >>> which removes it from the set of headers the script imports.
> >>>
> >>> Cornelia/Christian -- any idea about the virtio-ccw.h issue ?
> >>>
> >>> thanks
> >>> -- PMM  
> >>
> >> I had that commit queued for post-2.11, but I can also send it for 2.11.
> >>
> >> The virtio-ccw.h one looks weird... if I run the script on my s390-next
> >> branch against recent-ish Linux master, I just get the SPDX notice
> >> update for virtio-ccw.h.
> >>  
> > 
> > http://patchwork.ozlabs.org/patch/838230/ effectively fixes all issues:
> > - no errors anymore and
> > - no deletion of include/standard-headers/asm-s390/virtio-ccw.h anymore,
> > which is consistent with include/standard-headers/asm-s390/virtio-ccw.h.
> >   
> 
> I assume the vITS code is post 2.11? If not, we can certainly submit 3 or 4 
> s390 patches (including 838230) for 2.11.
> 

OTOH, we'll just have pain for any headers update until the first s390x
set for post 2.11 has been merged, so I'll send a pull request with
just that headers change.
