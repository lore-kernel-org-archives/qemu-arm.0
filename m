Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp988253wrt;
        Mon, 19 Nov 2018 07:31:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5cXj7oKrK7NM1jDvWRGqri541cg5dHGdlbl//XRlUtBC8htsF/0/GDkz15tIWbsi4fpnN/l
X-Received: by 2002:a81:3753:: with SMTP id e80mr11788522ywa.505.1542641499365;
        Mon, 19 Nov 2018 07:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542641499; cv=none;
        d=google.com; s=arc-20160816;
        b=ecH+7Qv6eU3DjH5KGE7mmUNvYaVUTyKJ8jlqPk1XwmOvtl8TVr9jeK9d3w4wP2rXs9
         SgFP5UjCn5w7r7P9FPmTZPJzN1TJoFfb0leiwzFiYY2LlL7+TpdVPbnGBVolevM1wsVh
         A7R/vcigQU0/PTtLCNHlFvpM8LQJhhsJT/rbckRtOpy0VBtB7Co9r0FY6GBRtWXcMKN8
         9HWIcPDgnSpARdY8lNsgOi4yJVFk1WiJaZe/0iprq6NZw2Rd7dBvZ5LFo5Aan6iYjTNz
         c/PGCnDwbf3vgrmTP5YPABfb7mDAfA09Il4qmA/ycV6lP4IK4ImHQ+sjfqmfPfYPO7dH
         O9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=sP5zpnyU+5T97IC7TXYTj0TbRfsd2fXF0WWJEY+BRDI=;
        b=TtjqLpXi53LrHaVWSZi6noEXISwQDaS8Au6fobdrVHEA3IMehkWIo3cc8qM64zQj1A
         yegRKSRhZ96Rd46p6sAtS1KWEPwmrysGF6tVdqIc9w7yhSmcWMuqNg5KejMlTqL/Ppju
         M2GBbyqDowPPV95i3JRvXJatRCzdrc0UVmaDKqeIyxfT1MC0gJJ9jJ1QmhlaFvX+0KK+
         Og6YLABsNvOJ/S1vL5UidbXWvJrlxI0kgE8IDcwZI+jCfBfI0NiaChudi3Y/+jA6Cvph
         uTgdAB4Fd1kJCnBdGA7flYqrdN5tZFJY2udq8ds6bMM4Pk9P7fPSrQV5y2OrCk9EpXA9
         nxrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10-v6si24641768ybm.200.2018.11.19.07.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 07:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOlWU-0003mC-Q4
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 10:31:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gOlWG-0003lF-8X
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 10:31:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gOlWA-0006DV-HH
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 10:31:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gOlWA-0006D5-95; Mon, 19 Nov 2018 10:31:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D643E3082A33;
	Mon, 19 Nov 2018 15:31:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62402177B0;
	Mon, 19 Nov 2018 15:31:12 +0000 (UTC)
Date: Mon, 19 Nov 2018 16:31:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181119163110.2f357f40@redhat.com>
In-Reply-To: <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 19 Nov 2018 15:31:17 +0000 (UTC)
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
X-TUID: +q4j2xF5bUWB

On Fri, 16 Nov 2018 17:37:54 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 16/11/18 17:29, Igor Mammedov wrote:
> > General suggestions for this series:
> >   1. Preferably don't do multiple changes within a patch
> >      neither post huge patches (unless it's pure code movement).
> >      (it's easy to squash patches later it necessary)
> >   2. Start small, pick a table generalize it and send as
> >      one small patchset. Tables are often independent
> >      and it's much easier on both author/reviewer to agree upon
> >      changes and rewrite it if necessary.  
> 
> How would that be done?  This series is on the bigger side, agreed, but
> most of it is really just code movement.  It's a starting point, having
> a generic ACPI library is way beyond what this is trying to do.
I've tried to give suggestions how to restructure series
on per patch basis. In my opinion it quite possible to split
series in several smaller ones and it should really help with
making series cleaner and easier/faster to review/amend/merge
vs what we have in v5.
(it's more frustrating to rework large series vs smaller one)

If something isn't clear, it's easy to reach out to me here
or directly (email/irc/github) for clarification/feed back.

> 
> Paolo
> 
> >   3. when you think about refactoring acpi into a generic API
> >      think about it as routines that go into a separate library
> >      (pure acpi spec code) and qemu/acpi glue routines and
> >       divide them correspondingly.  
> 

