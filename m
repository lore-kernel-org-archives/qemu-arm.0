Received: by 10.25.21.156 with SMTP id 28csp450965lfv;
        Thu, 14 Jul 2016 23:26:37 -0700 (PDT)
X-Received: by 10.55.10.147 with SMTP id 141mr22270900qkk.42.1468563996027;
        Thu, 14 Jul 2016 23:26:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q25si4308773qtq.57.2016.07.14.23.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 23:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNwa3-00046n-FD
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 02:26:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNwZz-00046c-Rx
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNwZw-0000Wk-N4
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:26:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bNwZw-0000W5-GV; Fri, 15 Jul 2016 02:26:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95F4D37E64;
	Fri, 15 Jul 2016 06:26:26 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6F6QKoR017899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jul 2016 02:26:22 -0400
Date: Fri, 15 Jul 2016 08:26:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160715062620.6du2q6japlty7aye@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-5-git-send-email-drjones@redhat.com>
	<20160614013037.GG4882@voom.fritz.box>
	<20160614055856.6ixqhiuezthebact@hawk.localdomain>
	<20160714201047.GD31865@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714201047.GD31865@thinpad.lan.raisama.net>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 15 Jul 2016 06:26:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 04/16] hw/core/machine:
 Introduce pre_init
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, agraf@suse.de,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, imammedo@redhat.com,
	pbonzini@redhat.com, dgibson@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1C6BdWe8+NLy

On Thu, Jul 14, 2016 at 05:10:47PM -0300, Eduardo Habkost wrote:
> On Tue, Jun 14, 2016 at 07:58:56AM +0200, Andrew Jones wrote:
> > On Tue, Jun 14, 2016 at 11:30:37AM +1000, David Gibson wrote:
> > > On Fri, Jun 10, 2016 at 07:40:15PM +0200, Andrew Jones wrote:
> > > > From: Igor Mammedov <imammedo@redhat.com>
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > 
> > > I think this needs some kind of rationale.
> > > 
> > > Since with this patch it is called immediately before ->init, I'm not
> > > really seeing the point of this.
> > 
> > Many machines already override ->init, so if we want to move code
> > from vl.c into machine methods, but be sure that they run it now,
> > then we have to invent a pre-init. I (or Igor) can add something
> > like that to the commit message for the next round.
> 
> If we just want to move vl.c code into machine, why not just
> create a simple machine_pre_init() function?
> 
> We can add a virtual method that can be reimplemented by
> subclasses later, only when we really see the need for a subclass
> to override some behavior.

That's fine for this series. Of course one of the main motivators
of this series is to be able to override the old parsing though, so
I already see the need. I'll need to either add this method now, or
later, when I add cpu topo support to the ARM mach-virt machine type.

Thanks,
drew

> 
> -- 
> Eduardo
> 
