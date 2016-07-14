Received: by 10.25.21.156 with SMTP id 28csp268970lfv;
        Thu, 14 Jul 2016 13:11:00 -0700 (PDT)
X-Received: by 10.200.45.8 with SMTP id n8mr23411151qta.57.1468527060498;
        Thu, 14 Jul 2016 13:11:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h19si2368674qke.295.2016.07.14.13.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 13:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNmyJ-00019B-U7
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 16:10:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bNmyF-000191-0Q
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 16:10:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bNmyB-00086F-DS
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 16:10:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bNmyB-00086B-7j; Thu, 14 Jul 2016 16:10:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C162B142580;
	Thu, 14 Jul 2016 20:10:50 +0000 (UTC)
Received: from localhost (vpn1-5-31.gru2.redhat.com [10.97.5.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EKAmnd015980; Thu, 14 Jul 2016 16:10:49 -0400
Date: Thu, 14 Jul 2016 17:10:47 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160714201047.GD31865@thinpad.lan.raisama.net>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-5-git-send-email-drjones@redhat.com>
	<20160614013037.GG4882@voom.fritz.box>
	<20160614055856.6ixqhiuezthebact@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160614055856.6ixqhiuezthebact@hawk.localdomain>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Jul 2016 20:10:50 +0000 (UTC)
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
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	imammedo@redhat.com, dgibson@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mc3odrKiN6Kf

On Tue, Jun 14, 2016 at 07:58:56AM +0200, Andrew Jones wrote:
> On Tue, Jun 14, 2016 at 11:30:37AM +1000, David Gibson wrote:
> > On Fri, Jun 10, 2016 at 07:40:15PM +0200, Andrew Jones wrote:
> > > From: Igor Mammedov <imammedo@redhat.com>
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > 
> > I think this needs some kind of rationale.
> > 
> > Since with this patch it is called immediately before ->init, I'm not
> > really seeing the point of this.
> 
> Many machines already override ->init, so if we want to move code
> from vl.c into machine methods, but be sure that they run it now,
> then we have to invent a pre-init. I (or Igor) can add something
> like that to the commit message for the next round.

If we just want to move vl.c code into machine, why not just
create a simple machine_pre_init() function?

We can add a virtual method that can be reimplemented by
subclasses later, only when we really see the need for a subclass
to override some behavior.

-- 
Eduardo
