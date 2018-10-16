Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5958631wrt;
        Tue, 16 Oct 2018 07:07:23 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63J0r0ZBX2KNWJnkTPKxWXJpX8jZMNiVFlwIk+1/PXMr1HQhoRMdb7JhZD+GN1U74S36lYI
X-Received: by 2002:aed:2d45:: with SMTP id h63-v6mr20157541qtd.52.1539698843211;
        Tue, 16 Oct 2018 07:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539698843; cv=none;
        d=google.com; s=arc-20160816;
        b=r0o+aUUvOGORi6miGohbsx9k1t600aIeMmqnJf7qpm3yHEEaWH+TzYlvlqr6ieXRXl
         kGClvrRKu3TwkIvg7KakYjICKdypVggX3qhs6BCScW4FNjTYoS8ACtet1+zkQO6dZT0/
         7lVuhe7yfiUc15oC/CVsnK/Y08mKMmTStNjXqwuChw1GAkFFDEhQ4uB6C9DRX5gWa2pJ
         7FflcVTJUlv6cFg4MBlQKxZLiffT2a4FyptzOLP6QdZgfX9qFjJTGJX5nuAnKlWLg2Db
         Ema1m6zmrop98LzRRD9PxWjyY3q3d0z0EoLX3F8qNTlpW/Gxu4mSlEY91Xm8I8QUtRwE
         vg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=4JE6YN92zT++5VrOn6DXDqLbPNcJCLIlzHqp/hTftOA=;
        b=R0K1YyVuOtYAOmgRRDi9dHlFm2v4INY9ixTx03NgjKis5r32sCkv+XhoKP6kj0f2wW
         7UKt0Q9o5QHgWTMcZX883UBo2ZlbZXvNoEkhS7MxccYVlNjUTWfVJNYqgDpqJVDb+BQD
         tAkaSkjsEgk96uNhWD0ThjCyNX9Si9RzMvdXfp/MgPix5/gLldI8iyJAZeAIn1xolDMb
         VGQU1tGRmdcXsMW2kff+tGfzlshe0qU4HgkprK08+HnsS9GwBTglshr+0g/wY3iX8uEc
         gGDKuwteXHntNz7DoaozSAETvkxO5Y2UVUlRomjcg1aVSfA92Oy3Kcwk8PZvb417MVe/
         nnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r31-v6si748953qtd.29.2018.10.16.07.07.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 07:07:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCQ0I-0006xu-Iu
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 10:07:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gCQ03-0006vF-AK
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gCPzx-000565-MJ
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:07:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gCPzx-00051H-EA; Tue, 16 Oct 2018 10:07:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 843E63001FC2;
	Tue, 16 Oct 2018 14:07:00 +0000 (UTC)
Received: from work-vm (ovpn-117-199.ams2.redhat.com [10.36.117.199])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA2710D3EA0;
	Tue, 16 Oct 2018 14:06:58 +0000 (UTC)
Date: Tue, 16 Oct 2018 15:06:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Aaron Lindsay <aclindsa@gmail.com>
Message-ID: <20181016140655.GI2426@work-vm>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
	<20181016082117.GB2426@work-vm>
	<20181016135517.GO3671@okra.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016135517.GO3671@okra.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 16 Oct 2018 14:07:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 03/14] migration: Add
 post_save function to VMStateDescription
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, Juan Quintela <quintela@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: liDb7ZSi0y6G

* Aaron Lindsay (aclindsa@gmail.com) wrote:
> On Oct 16 09:21, Dr. David Alan Gilbert wrote:
> > * Richard Henderson (richard.henderson@linaro.org) wrote:
> > > On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > > > In some cases it may be helpful to modify state before saving it for
> > > > migration, and then modify the state back after it has been saved. The
> > > > existing pre_save function provides half of this functionality. This
> > > > patch adds a post_save function to provide the second half.
> > > > 
> > > > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> > > > ---
> > > >  docs/devel/migration.rst    |  9 +++++++--
> > > >  include/migration/vmstate.h |  1 +
> > > >  migration/vmstate.c         | 10 +++++++++-
> > > >  3 files changed, 17 insertions(+), 3 deletions(-)
> > > 
> > > Hmm, maybe.  I believe the common practice is for pre_save to copy state into a
> > > separate member on the side, so that conversion back isn't necessary.
> > > 
> > > Ccing in the migration maintainers for a second opinion.
> > 
> > It is common to copy stuff into a separate member; however we do
> > occasionally think that post_save would be a useful addition; so I think
> > we should take it (if nothing else it actually makes stuff symmetric!).
> > 
> > Please make it return 'int' in the same way that pre_save/pre_load
> > does, so that it can fail and stop the migration.
> 
> This patch calls post_save *even if the save operation fails*. My
> reasoning was that I didn't want a failed migration to leave a
> still-running original QEMU instance in an invalid state. Was this
> misguided?

That's fine - my only issue is that I want post_save to be able to fail
itself even if pre_save failed.

> If it was not, which error do you prefer to be returned from
> vmstate_save_state_v() in the case that both the save operation itself
> and the post_save call returned errors?

The return value from the save operation.
I did wonder about suggesting that you pass the return value from the
save operation as a parameter to post_save.

Dave

> -Aaron
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
