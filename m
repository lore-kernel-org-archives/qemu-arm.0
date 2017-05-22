Received: by 10.103.124.15 with SMTP id x15csp1369775vsc;
        Mon, 22 May 2017 05:59:11 -0700 (PDT)
X-Received: by 10.31.188.21 with SMTP id m21mr7903421vkf.81.1495457951430;
        Mon, 22 May 2017 05:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495457951; cv=none;
        d=google.com; s=arc-20160816;
        b=OXltCd3By1/bmbE6GRD8pLwXPoFq7QV3IjuBTmjbqRDk9od7EQS0G4LdtZyZSBFn4H
         /R7QdpHjtZ2yYgOqBsgy6A1jRoSi+K2cRuqdaye/K5lmWjSoSKHFMsbtf8tLGo4tzMfC
         oKQzSLChJT+RqEqdLDKe6nswx4HKyhrc9YT6d+IWvNDgG/JA5KVi6Iy6+QHyM9M21+CW
         KCpgoEbqnxF66LGkdIuJoUZ1YY+QWiootTFmLlZv2Ik7lhWX5SL+grkukbC1XJ95Txn9
         Zy23O3wGdzP4SEVd6yO6AGNDjvpo42MFydyCxwX/BcJjD0DXMTC1PM6LgvJXKLBzMHN3
         VF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=03cgYSqXHKa0Oj0oAGjYHWBI2DQB1x+peOQ55yKhdTU=;
        b=a7qZqj5p0XiLfxFiIa7Wt86OWC8sBTTXqdjonisYYhDQNhnQbF1mr197UX6ZWZdY1C
         wvB1JXSsBxGumIkAOhTqoqo/GT5Cc1w/czbwaRxe5MNN+I+fb7/R8qsoItUFBOfqdKui
         6IIHEzvXbC/22aKHd7oxGhRJ/yR1/xQIQ5BqPjBMZD1+KmpOCVrV/seEfBVIDVOwlsyE
         0gXbRjbk0hUo8nx4HIign5OunZJT/wHamtpZY6FQLKcia3jSAeZHr1w3O3Ol9fnrbkkZ
         oBx/ZPhGg3OdUySo2Tl9MTcDdsWLavuGg3Tt/6VZyOLApu/Zo6xyWBBbKKzhWCCHfbtd
         CuDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j26si7837374uah.218.2017.05.22.05.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 05:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCmvW-00018H-Tx
	for alex.bennee@linaro.org; Mon, 22 May 2017 08:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dCmvO-00017s-Sy
	for qemu-arm@nongnu.org; Mon, 22 May 2017 08:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dCmvJ-0006Jj-VK
	for qemu-arm@nongnu.org; Mon, 22 May 2017 08:59:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dCmvJ-0006Gi-Lt; Mon, 22 May 2017 08:58:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F30E80C03;
	Mon, 22 May 2017 12:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2F30E80C03
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2F30E80C03
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18EBA781E4;
	Mon, 22 May 2017 12:58:47 +0000 (UTC)
Date: Mon, 22 May 2017 09:58:45 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170522125845.GA18350@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-2-git-send-email-imammedo@redhat.com>
	<20170518181913.GN4748@thinpad.lan.raisama.net>
	<20170522083931.568735a4@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170522083931.568735a4@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 22 May 2017 12:58:49 +0000 (UTC)
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
X-TUID: 7Mq5r7NpjWNo

On Mon, May 22, 2017 at 08:39:31AM +0200, Igor Mammedov wrote:
> On Thu, 18 May 2017 15:19:13 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Thu, May 18, 2017 at 10:09:29AM +0200, Igor Mammedov wrote:
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  include/sysemu/numa.h |  1 +
> > >  hw/arm/virt.c         | 16 ++--------------
> > >  hw/i386/pc.c          | 17 +----------------
> > >  hw/ppc/spapr.c        | 17 +----------------
> > >  numa.c                | 22 ++++++++++++++++++++++
> > >  5 files changed, 27 insertions(+), 46 deletions(-)
> > > 
> > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > index 7ffde5b..610eece 100644
> > > --- a/include/sysemu/numa.h
> > > +++ b/include/sysemu/numa.h
> > > @@ -35,4 +35,5 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> > >                                   int nb_nodes, ram_addr_t size);
> > >  void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> > >                                    int nb_nodes, ram_addr_t size);
> > > +void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);  
> > 
> > I understand an explicitly call to numa_cpu_pre_plug() is needed
> > on spapr_core_pre_plug() because it is not handling a TYPE_CPU
> > object. But why not adding a numa_cpu_pre_plug() call to
> > cpu_common_realizefn(), so the explicit calls in machvirt_init()
> > and pc_cpu_pre_plug() are not necessary?
> 1. of the reasons is not to pollute all cpus with numa code

I understand this goal...

> 
> > Adding the code to cpu_common_realizefn() would also ensure
> > CPUState::node_id is set consistently, even if hotplug was not
> > done at thread level.
> 2. not all CPUs have node-id property

...and this. But: we already have the CPUState::numa_node field.
If we don't handle it in common code, we risk leaving the field
uninitialized, which is a problem if other code tries to use the
field for something.

Maybe that's an argument for removing the CPUState::numa_node
field too.


> 3. call site of thread_realize() in encapsulating object (spapr_core)
>    might be somewhere in the middle of parent's realize and likely
>    failure would need proper parent state rollback/cleanup.

I don't see why this could be a problem, if the code setting
realized=true is already supposed to handle errors on the realize
method.

> 4. and finely it's not cpu's responsibility to assign/check
>    node-id property. It's machine's job that owns/manages topology
>    layout. It' the same like with socket/core/thread properties.
>    So for the sake of small optimization, I'm not really willing
>    to violate that.

I don't disagree with that, but in that case I would like to
remove the CPUState::numa_node field soon, if possible.

[...]
> > > +    } else if (node_id != slot->props.node_id) {
> > > +        error_setg(errp, "node-id=%d must match numa node specified "
> > > +                   "with -numa option", node_id);  
> > 
> > There's less detail on the error message, now. Probably harmless,
> > but I would like to understand when exactly this can be
> > triggered: is device_add the only way to trigger this error
> > message?
> error is triggered only during -device/device_add so there were no
> need in more verbose error as device_add will report its arguments
> (affected cpu in this case)

OK.

-- 
Eduardo
