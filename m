Received: by 10.25.44.15 with SMTP id s15csp2091715lfs;
        Thu, 6 Jul 2017 07:08:56 -0700 (PDT)
X-Received: by 10.200.3.213 with SMTP id z21mr58410900qtg.185.1499350136616;
        Thu, 06 Jul 2017 07:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499350136; cv=none;
        d=google.com; s=arc-20160816;
        b=YR98TzzHQBZ1Y4SfIHsF3KniYnhH0DJMcGglHOB/SSypuHrQkAXh197L4ofQVpQvuG
         ufW9fpFRQZ8VEWWuWr7JfkM15QX3NHlZNDYL9in8p9CjshWBgUOmGENgu4iSGSYb6+Rr
         Auw7zd0YZ6bOZF4KeKcoZzjgHIM1L3yApZFRyUxig0CV2UMYNUkfsodVNJJdLo4E1KB2
         mLmunxQIpjuhPnI06KtkbzjlP4Dy2F7oj7lUP6xOZuD2nldr8r3hq3junfdQP9GN3Xy2
         1bHAILMSX9ghsq5zAaHtxnFpnRxkzVzaWpTmVJQzOIBF9vz6kSXSpptod0OBn4nmKsgo
         PrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=6F+h+DWbw2ebQp1ySwVuPeVEAOnKijwJgQg0I2ZyojY=;
        b=wa4AUWIZU3M6xPNd6RKq1ZrVAtW1qJxIwJNB3ckNAj2yvpDWZ8LXSm1zM8iZQItEh5
         yvTMgX/VaYyVjLx8f3qaczXNCCPBJVcqnYiXzrFG7hfa7sfjDlzG0E3byRoRCM19J+tF
         hr9/p8bicpct8Z3LyuLIsT4zXK6HRBWuOD4g9jbeACSbGXSEFx3p6/HNj5oGsPOUcSjL
         JuR7pSmwON9A1jhb+kZ3ZqHJ7H6Xar18zh2Ej/OtZZ/qGRrzfRcYdlT+1TKY58Ulp4B5
         RpLmkCuq0rIhBBVxX21Gf9CxveiCRS/QsDAy9p6N6s7uCyBGA0fsRbfS5aoAJ7xgnVY+
         /DiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x123si253356qkc.143.2017.07.06.07.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 07:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dT7Sf-00069j-S3
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 10:08:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dT7SV-00066T-4v
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 10:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dT7SU-0003gV-1K
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 10:08:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dT7ST-0003ec-ON; Thu, 06 Jul 2017 10:08:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D68027D0E4;
	Thu,  6 Jul 2017 14:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D68027D0E4
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D68027D0E4
Received: from localhost (ovpn-116-61.gru2.redhat.com [10.97.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 552A677FE0;
	Thu,  6 Jul 2017 14:08:38 +0000 (UTC)
Date: Thu, 6 Jul 2017 11:08:37 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20170706140837.GE12152@localhost.localdomain>
References: <20170608133906.12737-1-ehabkost@redhat.com>
	<20170608133906.12737-2-ehabkost@redhat.com>
	<87fuebrtuk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fuebrtuk.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 06 Jul 2017 14:08:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] xilinx: Fix error handling
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S3gQ1h268Ybp

On Wed, Jul 05, 2017 at 01:44:35PM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > Assigning directly to *errp is not valid, as errp may be NULL,
> > &error_fatal, or &error_abort.  Use error_propagate() instead.
> >
> > error_propagate() handles non-NULL *errp correctly, so the
> > "if (!*errp)" check can be removed.
> >
> > Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> > Cc: Alistair Francis <alistair.francis@xilinx.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  hw/dma/xilinx_axidma.c  | 4 +---
> >  hw/net/xilinx_axienet.c | 4 +---
> >  2 files changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> > index 6065689ad1..3987b5ff96 100644
> > --- a/hw/dma/xilinx_axidma.c
> > +++ b/hw/dma/xilinx_axidma.c
> > @@ -554,9 +554,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
> >      return;
> >  
> >  xilinx_axidma_realize_fail:
> > -    if (!*errp) {
> > -        *errp = local_err;
> > -    }
> > +    error_propagate(errp, local_err);
> >  }
> >  
> >  static void xilinx_axidma_init(Object *obj)
> > diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> > index b6701844d3..5ffa739f68 100644
> > --- a/hw/net/xilinx_axienet.c
> > +++ b/hw/net/xilinx_axienet.c
> > @@ -981,9 +981,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
> >      return;
> >  
> >  xilinx_enet_realize_fail:
> > -    if (!*errp) {
> > -        *errp = local_err;
> > -    }
> > +    error_propagate(errp, local_err);
> >  }
> >  
> >  static void xilinx_enet_init(Object *obj)
> 
> The qdev core always passes &err.  So this is "merely" a fix for a
> latent bug.
> 
> If it could pass null, you'd fix a crash bug.
> 
> If it could pass pointer to non-null (&error_fatal, &error_abort), you'd
> plug a memory leak.
> 
> Suggest to rephrase the commit message:
> 
>     xilinx: Fix latent error handling bug
> 
>     Assigning directly to *errp is not valid, as errp may be null,
>     &error_fatal, or &error_abort.  The !*errp conditional protects
>     against the latter two, but we then leak @local_err.  Fortunately,
>     the qdev core always passes pointer to null, so this is "merely" a
>     latent bug.
> 
>     Use error_propagate() instead.
> 
> What do you think?

Looks good to me.  Do you want to fix it when applying?

> 
> With something like that:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!

-- 
Eduardo
