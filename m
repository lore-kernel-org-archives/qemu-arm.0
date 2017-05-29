Received: by 10.25.0.6 with SMTP id 6csp1341357lfa;
        Mon, 29 May 2017 03:43:55 -0700 (PDT)
X-Received: by 10.55.168.86 with SMTP id r83mr16929600qke.97.1496054635169;
        Mon, 29 May 2017 03:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496054635; cv=none;
        d=google.com; s=arc-20160816;
        b=eMjxlpK3lLgiyWXEfqWv2r5SEMzwVmZUPnC71MHVSFhkA+m4BDAkz5HhmQnrQLmJbU
         n/PH3dVLUQtKI+womqNLkQWCnWHLl6u7IH7ckjnWLDdKg6Tv8jHze5YFGKmASH2+qope
         fnVMq28yhlgYQn+AYEApBEdmNIi5SgXt0DXEzaeabJcLhK69A1y6Ok5Ub6JlpOIzNOSa
         Dxrj8ddLgp90CrUPVkWrfmphxLA+cL3pYiYTj9TxV52hswKWojFeFr+lj+FbLo5/hTGg
         TpjwuOTR8J439zNwpOfM9wMZ/97L67+lb+iJulyEA9yFhwm3rOFdl0P4wre11mty1Qzp
         pf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=kHCNYy9z3gbAMFM8C4QGwPkQY0OacB6gwIcVMTtOdbA=;
        b=mPG/KJg60qbVmicm9ljpNzHP0qh4qVL9oqvfW12Pmuo86gYJsI9D/H6gSpa1YZNb0n
         owkqwElGWEGfKhydPe9yTiQrs3DME9RDh57U+zKRNn8V6k+oDcB3jzi3FSZ97VN8hLKp
         G6rdIHR5T8Ln/ZsOs0JfxHYfRO8p08X9Dd/MGMApYIHvBa6Ipuo7LVDhiyn6Jy7fe45k
         TO+ri4BTo2ZMNb315NFOEnKjTUPdw8/MxngWk6F/W75Ye8z+5YHs0ILIuA6pFj7tjz2v
         fw54ZB1XWli1WuK4DBPxRFXflgy72agv5aK0aIft7yqtv+N33yrfpH2Q1pre8enPiGFA
         Q8kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si8472472qke.238.2017.05.29.03.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 03:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFI9S-0004oo-KH
	for alex.bennee@linaro.org; Mon, 29 May 2017 06:43:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFI9M-0004oW-LR
	for qemu-arm@nongnu.org; Mon, 29 May 2017 06:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFI9J-0001if-Js
	for qemu-arm@nongnu.org; Mon, 29 May 2017 06:43:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFI9J-0001iX-Ag; Mon, 29 May 2017 06:43:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D46B485363;
	Mon, 29 May 2017 10:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D46B485363
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D46B485363
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83DCB17B1D;
	Mon, 29 May 2017 10:43:41 +0000 (UTC)
Date: Mon, 29 May 2017 12:43:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <zhlcindy@gmail.com>
Message-ID: <20170529124339.43eea1c5@nial.brq.redhat.com>
In-Reply-To: <CAD8of+pw5Nh4oSkTuYX4fbJvA8=-CTmn6dgdXHPLERAcQM+Oyw@mail.gmail.com>
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
	<20170526132114.6edc006e@nial.brq.redhat.com>
	<CAD8of+pw5Nh4oSkTuYX4fbJvA8=-CTmn6dgdXHPLERAcQM+Oyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 29 May 2017 10:43:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/3] arm/virt: refine virt.c
 code and implement hot_add_cpu interface
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Li Zhang <li.zhang@hxt-semitech.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0yH6Sy77HtNx

On Sat, 27 May 2017 10:32:33 +0800
Li Zhang <zhlcindy@gmail.com> wrote:

> On Fri, May 26, 2017 at 7:21 PM, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Fri, 26 May 2017 17:21:05 +0800
> > Li Zhang <zhlcindy@gmail.com> wrote:
> >  
> >> From: Li Zhang <li.zhang@hxt-semitech.com>
> >>
> >> virt machine doesn't support hot_add_cpu interface. This patchset is to implement
> >> hot_add_cpu interface. A CPU can be added by QMP command with QEMU monitor.
> >>
> >> Here is command to add a CPU with QMP command.
> >>
> >> * qemu-system-aarch64 -machine virt -cpu cortex-a15 -smp 1,maxcpus=4 \
> >>     -monitor telnet:127.0.0.1:4444,server,nowait -nographic
> >> * connect monitor:      telnet 127.0.0.1 4444
> >> * execute qmp command:  cpu-add 1  
> > cpu-add command shouldn't be used for new cpu hotplug,
> > pls use generic device_add for that.  
> 
> Ok,  I will drop this command and look at device_add.
> 
> >
> > The last time I looked at it, virt machine needed quite a bit of
> > re-factoring of the way it creates/wires up CPUs.  
> 
>  Yes, I am looking into it and see if I can do something:)
> 
> >
> > Pls see usage of following callbacks for example on how to implement
> > device_add based cpu hotplug:
> >
> >   get_hotplug_handler
> >   pc_cpu_pre_plug
> >   pc_cpu_plug
> >   pc_possible_cpu_arch_ids
> >
> > and pc_cpus_init() for initial cpu creation with above callbacks in use
> >  
> Thanks, I will see it. :)
> 
> >>
> >> Currently, when KVM is enabled and add a CPU with QMP command, QEMU
> >> reports error "kvm_init_vcpu failed: Device or resourc busy". KVM can't
> >> create a new CPU when vgic has been initialized and irqchip_in_kernel in
> >> function kvm_arch_vcpu_create. It needs to change KVM code in the future.  
> > if KVM isn't capable do it yet, then qemu should refuse cpu hotplug if running
> > with KVM accelarator and allow it only in TCG mode.  
> 
> OK, I will add an assertion to allow hotplug only in TCG mode.
instead of assert which will crash guest on hotplug,
just disable hotplug gracefully (for example set error in pre_plug handler)

> 
> >  
> >>
> >> Li Zhang (3):
> >>   arm/virt: Refine fdt_add_cpu_nodes code
> >>   arm/virt: Refine code of machvirt_init
> >>   arm/virt: Implement hot_add_cpu interface
> >>
> >>  hw/arm/virt.c | 344 ++++++++++++++++++++++++++++++++++------------------------
> >>  1 file changed, 202 insertions(+), 142 deletions(-)
> >>  
> >  
> 
> 
> 

