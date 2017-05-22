Received: by 10.25.0.6 with SMTP id 6csp1376201lfa;
        Mon, 22 May 2017 06:26:19 -0700 (PDT)
X-Received: by 10.31.86.193 with SMTP id k184mr6766250vkb.127.1495459579785;
        Mon, 22 May 2017 06:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495459579; cv=none;
        d=google.com; s=arc-20160816;
        b=PJ9WNXTEa8jT+ZCy0Urnksk+JDZ2aRGvbAU7SZCUymzrtNZfExWtVDS2ZgbtdkBX8G
         t1b2kNbtbFAqOV/7JB2Vth5EisUx99pOFs8e0ID0eKAWMTgzFm0v2nzlK9Eq86EAiRui
         8VFeIXrf8azU/PxLNobs5K9ek6kXFa56ffcr65uCDIvXyHdDWzKyXMTlNyFyL1ThEGXE
         JK1UXEBsu+lerZc8TPCoXBxKg+rog26hQqIlFgwRReDD755t/WUmn9v7LW0ag7c2+tqg
         Wbr0XOjXWlN13Re4XZtX+lH8TG9y5gbUfJkq+rM7oSPdjHpvpr5LoA32bLTpKRB1d2ms
         TfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=p1a/E7H62V8SU9ylqQckyIhqxQgnFwvg839Ps5FZUK0=;
        b=LDbddt08aD32wp9UtlhTyKJV5MfK7358WkorNTvey6y6aOTQsq8thTFKXmUyLx54CH
         Ygj91sWq2Nyk5t3Fi3hcheSNF6As9IP2tPgH0OZ/wIRTDtRjPumriun0YDTb3N/loMWh
         eULMY38mch5SFDZtsVQx/yQKoKiDJHrSwHEIW8ahw+zH2cEkYEiMpq+rCeqoft5yeWo1
         6GD/tD17kiIcUhWTvao5GvVM702TlmbXkmqX3n6+lb7pZnLTXYW+wDE29lF3VucVVlnC
         2RXsSBYXU5Lq0LtYs7f9zseQfKJTxzXIlJyRXGIvBIyZT9IiqssIHLxoS3R3yOYW0LD6
         Am9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si5883541vkh.154.2017.05.22.06.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 06:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCnLn-0000kf-7c
	for alex.bennee@linaro.org; Mon, 22 May 2017 09:26:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dCnLf-0000ja-3v
	for qemu-arm@nongnu.org; Mon, 22 May 2017 09:26:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dCnLb-0002PD-In
	for qemu-arm@nongnu.org; Mon, 22 May 2017 09:26:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dCnLb-0002P6-9S; Mon, 22 May 2017 09:26:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEF9C804EC;
	Mon, 22 May 2017 13:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BEF9C804EC
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BEF9C804EC
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 541DD7EFEB;
	Mon, 22 May 2017 13:26:02 +0000 (UTC)
Date: Mon, 22 May 2017 15:26:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170522152600.3f6ea2ea@nial.brq.redhat.com>
In-Reply-To: <20170522125845.GA18350@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-2-git-send-email-imammedo@redhat.com>
	<20170518181913.GN4748@thinpad.lan.raisama.net>
	<20170522083931.568735a4@nial.brq.redhat.com>
	<20170522125845.GA18350@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 22 May 2017 13:26:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/3] numa: consolidate cpu_preplug
 fixups/checks for pc/arm/spapr
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uzDi9KMe5c0h

On Mon, 22 May 2017 09:58:45 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, May 22, 2017 at 08:39:31AM +0200, Igor Mammedov wrote:
> > On Thu, 18 May 2017 15:19:13 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > On Thu, May 18, 2017 at 10:09:29AM +0200, Igor Mammedov wrote:  
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > ---
> > > >  include/sysemu/numa.h |  1 +
> > > >  hw/arm/virt.c         | 16 ++--------------
> > > >  hw/i386/pc.c          | 17 +----------------
> > > >  hw/ppc/spapr.c        | 17 +----------------
> > > >  numa.c                | 22 ++++++++++++++++++++++
> > > >  5 files changed, 27 insertions(+), 46 deletions(-)
> > > > 
> > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > index 7ffde5b..610eece 100644
> > > > --- a/include/sysemu/numa.h
> > > > +++ b/include/sysemu/numa.h
> > > > @@ -35,4 +35,5 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> > > >                                   int nb_nodes, ram_addr_t size);
> > > >  void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> > > >                                    int nb_nodes, ram_addr_t size);
> > > > +void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);    
> > > 
> > > I understand an explicitly call to numa_cpu_pre_plug() is needed
> > > on spapr_core_pre_plug() because it is not handling a TYPE_CPU
> > > object. But why not adding a numa_cpu_pre_plug() call to
> > > cpu_common_realizefn(), so the explicit calls in machvirt_init()
> > > and pc_cpu_pre_plug() are not necessary?  
> > 1. of the reasons is not to pollute all cpus with numa code  
> 
> I understand this goal...
> 
> >   
> > > Adding the code to cpu_common_realizefn() would also ensure
> > > CPUState::node_id is set consistently, even if hotplug was not
> > > done at thread level.  
> > 2. not all CPUs have node-id property  
> 
> ...and this. But: we already have the CPUState::numa_node field.
> If we don't handle it in common code, we risk leaving the field
> uninitialized, which is a problem if other code tries to use the
> field for something.
> 
> Maybe that's an argument for removing the CPUState::numa_node
> field too.
> 
> 
> > 3. call site of thread_realize() in encapsulating object (spapr_core)
> >    might be somewhere in the middle of parent's realize and likely
> >    failure would need proper parent state rollback/cleanup.  
> 
> I don't see why this could be a problem, if the code setting
> realized=true is already supposed to handle errors on the realize
> method.
> 
> > 4. and finely it's not cpu's responsibility to assign/check
> >    node-id property. It's machine's job that owns/manages topology
> >    layout. It' the same like with socket/core/thread properties.
> >    So for the sake of small optimization, I'm not really willing
> >    to violate that.  
> 
> I don't disagree with that, but in that case I would like to
> remove the CPUState::numa_node field soon, if possible.
ok, I'll try add a patch on respin to do it (I think that I've
tried this at some RFC time)


