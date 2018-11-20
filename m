Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp528287wrt;
        Tue, 20 Nov 2018 04:57:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X2PMwcSW8FwwpnqOjghdwxG7wAITPRDuJrRZLRPw+pwhAmAO4w8he7Spa+hI/RHq869nAp
X-Received: by 2002:a25:33c1:: with SMTP id z184-v6mr1645767ybz.68.1542718665047;
        Tue, 20 Nov 2018 04:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542718665; cv=none;
        d=google.com; s=arc-20160816;
        b=FO95o9JmUYPcoeimjHPcs0qn7wLFaJ7men9beuDjqagvMcf6DNrfuyoHhOKjnfO3hV
         G6/hdk119E7RhtnaLB2D0uUMaieGn9pxqC6LPaMzGRL7q2Fg8+HD5KTh1cI8WuVbszW7
         4icrcAmRXc2wly2XEaiVJ+64IyNWBgC8wtvwovWZn9CmIflW/WAf4jRLxxh9NTn5Ogoy
         Z/PcR5wnkoDG91DCWKcQbywZ7xpBdNiJhc70ReIGSw5rhWrHIeEqkkbwbUwR2g6OVclC
         cC3TzVyttfZRvrwqk4Q7h60UWREyYBe2+OaQXGRUHvnqMlpniwfuWVxyfvjbGaZu9jAe
         AmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=l6Robd7KmEg2XR3qbqletVZrYvCn17gzHjQCWXJtgF0=;
        b=0XHkAMVHW03YqambfWM6W8Mt2I0nDrfqcXvbVqUqQGOsToQK+smcxoff477h0d0nUH
         FlqiIKcOzUq/SH10s/TG02WtsMO2D7sRUXnMg6PiWU1tEneTAQwx+TKkskwCOZtS41UU
         js1bzaRDwwL6RQCNUwEjUojes6dzoVJkbR3aTcwuw5tZGf38Lu55REGasF6uLRrONnlk
         g642ZVZBkhMra8IWBoEw0PL9L/tA3TclzkCUKDuSAvE3f/RvNgINnCpP304d/9kvQ15E
         IJQILV4NV3i1hCWKJHbuqM4xUSkzqsDEn1kL2nxpugjNedUoMMkSaMs8AWORngXAK4TR
         2kNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h188-v6si14456168ywb.23.2018.11.20.04.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 04:57:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP5b6-0001LO-EV
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 07:57:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP5ax-0001LG-JT
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 07:57:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP5at-00010Z-KP
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 07:57:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gP5at-000104-EX; Tue, 20 Nov 2018 07:57:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B107A404D;
	Tue, 20 Nov 2018 12:57:30 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E3535D9C8;
	Tue, 20 Nov 2018 12:57:20 +0000 (UTC)
Date: Tue, 20 Nov 2018 13:57:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181120135719.3965e33b@redhat.com>
In-Reply-To: <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
	<c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 20 Nov 2018 12:57:30 +0000 (UTC)
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
	Samuel Ortiz <sameo@linux.intel.com>, "Michael
	S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: INu1IH+VNsQ+

On Mon, 19 Nov 2018 18:14:26 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

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
Thanks, I'll give it a try.

Suggestion to split series mostly comes from contributor's point of view,
it much easier to amend small series than a larger one.


> v4->v5 is a bit messed up because Samuel probably added a diff order
> setup
> (https://patchew.org/QEMU/20181101102303.16439-1-sameo@linux.intel.com/diff/20181105014047.26447-1-sameo@linux.intel.com/)
> but it's very useful in general.
> Paolo

