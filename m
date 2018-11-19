Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1177285wrt;
        Mon, 19 Nov 2018 10:14:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5f33pCS8Nj9fnpv4c2+4/1sC4GYXXcm3+znFZm3Uga5QKRx0UlG8LzOjP5+iy5K29G/wMNp
X-Received: by 2002:a81:e50:: with SMTP id 77-v6mr22101256ywo.156.1542651292879;
        Mon, 19 Nov 2018 10:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542651292; cv=none;
        d=google.com; s=arc-20160816;
        b=F+UMTaaaLmSNXoSgCYI5iQAhw8Jl034vJlUDHVXtK0/490Lyq6d7BYlC58dXVBjOZB
         ZfPPxO2i45OW7o5qmZ4j08yRhKO0vXkqtBVzwUGh7sQrGm/ZgqFxam4tCEsGN+bQwOem
         Pbyl2jxBGdx9wRdkjd6Jj7DPSqu11/5i5Xx6J62mzy0BBoml7WN6CikI1RT2jghKDj3G
         sSqX6uBRDFhXhFrchgBe3uTT/R1RVBvESNygpsCBqy20ToC/+ONaftoJV9kSovAeU1aJ
         UZmCrbMg+m7kVc77/PRvzudcjQjaKA1e1xk1CSiwRlPq6aaARzME/mYdD4+5d6+dRylu
         SEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Wtgyfi8BZdrq9zKqjlqHYvvzwF8Q2NrtzmnINn/1h6s=;
        b=qK8o7CQUdkHEzHFeQ28ItUq2f0DS6YFSr33uVnww1PepuWKnFC8UdJmqj+9tKiQU4k
         c4DZhTaOLpcBt83k4KAIi5X+VD5Xg8iOznaNeEYovZ4tdoheDKHsCerhz+zvTZ5a2XXX
         5sEHGFzsufK83GcTQt6zW3Cyf745Z5mN4Lqc/oz2Syq+6qFknDB3wcg8jnFPmpqUKq3Z
         AWpmTVhP1FqaUyLzHBnGC2sMl6fkMNdm0hNz7uyPIM/+ucO6wzO3P3HUUMA9HSV97vfv
         4xFCzqe1VNEZDdG1QXfbWi0yfV4JdBJS96YbpcR4VEL+7cqIzE9vbUVc4MPkYeSIxwMQ
         9QrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b205-v6si1414888yba.382.2018.11.19.10.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 10:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOo4S-0007qT-BX
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 13:14:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gOo4J-0007qK-8V
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 13:14:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gOo4F-0002qZ-K2
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 13:14:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gOo4F-0002qG-Eo; Mon, 19 Nov 2018 13:14:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D49A81F12;
	Mon, 19 Nov 2018 18:14:38 +0000 (UTC)
Received: from redhat.com (ovpn-122-92.rdu2.redhat.com [10.10.122.92])
	by smtp.corp.redhat.com (Postfix) with SMTP id E0E2560C67;
	Mon, 19 Nov 2018 18:14:36 +0000 (UTC)
Date: Mon, 19 Nov 2018 13:14:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181119131314-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
	<c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 19 Nov 2018 18:14:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rd0TWjg7bFEH

On Mon, Nov 19, 2018 at 06:14:26PM +0100, Paolo Bonzini wrote:
> On 19/11/18 16:31, Igor Mammedov wrote:
> > I've tried to give suggestions how to restructure series
> > on per patch basis. In my opinion it quite possible to split
> > series in several smaller ones and it should really help with
> > making series cleaner and easier/faster to review/amend/merge
> > vs what we have in v5.
> 
> This is true, on the other hand the series makes sense together and,
> even if the patches are more or less independent, they also all follow
> the same "plan".  For reviewing v6, are you aware of Patchew's series
> diff functionality?  It can tell you which patches had comments in v5,
> reorder patches if applicable, and display deleted and new patches at
> the right point in the series.
> 
> v4->v5 is a bit messed up because Samuel probably added a diff order
> setup
> (https://patchew.org/QEMU/20181101102303.16439-1-sameo@linux.intel.com/diff/20181105014047.26447-1-sameo@linux.intel.com/)
> but it's very useful in general.
> 
> Paolo

Oh I didn't realize difforder breaks patchew. Or is the problem
only if one switches from no order to difforder?

-- 
MST
