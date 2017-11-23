Received: by 10.223.159.82 with SMTP id f18csp990907wrg;
        Thu, 23 Nov 2017 09:14:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZDVumN09WMOol5kP+BEJEIbjrS/CZEjYxvAFwqCgPHZ655M2Lw72NO+6ymqO+hyNErwof2
X-Received: by 10.129.43.137 with SMTP id r131mr8261ywr.370.1511457264696;
        Thu, 23 Nov 2017 09:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511457264; cv=none;
        d=google.com; s=arc-20160816;
        b=gi6E4fLjkFutVPbCTMlCByi8bhIIwjMGmykb7JSC9XzG8fNp0AqiHAqDglQUJ4Wqv5
         4ZBAFwF3/foYXjWtDWfjuEtiEXx4fTx1dSnH8lpyea1DSfSqvhoImu0SuM5JmHIa720O
         ge+3/tI/KO3tVQa0IXrVm1xHWH1rqHjmZXIIEeSAIQFjLPjzAec4FNi3wgPtN6uCAo39
         4NPZ3BAafeMXJrj+gfaduE6obTdmREJ95gbYS4p2AKTPhwnwEp1zBOXiSZPTVXt4XhaU
         gykyyuOTfiKquVnrYynD9zYVb2x9t27QxoXy2H3YEuEx+y7mzAGY2I1xCELYnT2RoBc9
         n+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=pLfYOw8v+PHTb49yes80P+X3HjuKKDRnexJ3+w/nkIM=;
        b=awT83sbqL1xvlaTdErK+ftilFVLi9AgrwzWPtO6L8SID/nxwM2ET50YjuLToQGAXTz
         zP6oHEmdvgrFfWqYuKwHRzAwBJqke7/CsGD15oFcv6ud3iYu44+43smFrjwom8lWmC6o
         3d3hw1fqD5cfERDHQlV8CohBROgLtcITcJiRT/D+GgipTNl8GYjHRaA4T9CbTgRbc94G
         qoLaukq8NhBdnY/Vr6CFSNBlAZzAqTTquv3tcHmpLubA4X/IIbthNmS2LjskBMBKm9ZC
         Vi4ZRwirIyF++42ngZaq0DUq9zjS9KsrVCPjdDCOEKv/IbMcPYneqgwHOUVkwWjTuqW9
         C3lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h128si4288315ywd.770.2017.11.23.09.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 09:14:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHv4y-0003Ps-3v
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 12:14:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eHv4p-0003PP-8Q
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 12:14:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eHv4l-0007Wl-MQ
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 12:14:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1eHv4l-0007W1-Ge; Thu, 23 Nov 2017 12:14:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4678D267C4;
	Thu, 23 Nov 2017 17:14:10 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 477BE5D960;
	Thu, 23 Nov 2017 17:14:05 +0000 (UTC)
Date: Thu, 23 Nov 2017 18:14:02 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171123181402.627fd5df.cohuck@redhat.com>
In-Reply-To: <CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
	<1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
	<CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 23 Nov 2017 17:14:10 +0000 (UTC)
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>, wanghaibin.wang@huawei.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FOYBBwsLq3HV

On Thu, 23 Nov 2017 17:01:32 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 23 November 2017 at 16:05, Auger Eric <eric.auger@redhat.com> wrote:
> > When using update-linux-headers.sh I get suspicious errors at the end:
> > grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
> > directory
> > sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
> > file or directory
> >
> > and include/standard-headers/asm-s390/virtio-ccw.h deleted
> >
> > I would prefer having s390 people checking and testing that.  
> 
> I think the kvm_virtio.h problem should be fixed by
> http://patchwork.ozlabs.org/patch/838230/
> which removes it from the set of headers the script imports.
> 
> Cornelia/Christian -- any idea about the virtio-ccw.h issue ?
> 
> thanks
> -- PMM

I had that commit queued for post-2.11, but I can also send it for 2.11.

The virtio-ccw.h one looks weird... if I run the script on my s390-next
branch against recent-ish Linux master, I just get the SPDX notice
update for virtio-ccw.h.
